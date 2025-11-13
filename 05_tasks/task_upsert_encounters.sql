USE DATABASE HEALTH_LAKE;
USE SCHEMA GOV;

-- Root task: incrementally update Silver encounters from stream
CREATE OR REPLACE TASK t_upsert_encounters
  WAREHOUSE = WH_HEALTH_XS
  SCHEDULE = 'USING CRON 0 */2 * * * UTC'
AS
MERGE INTO HEALTH_LAKE.SILVER_CURATED.encounters t
USING (
  SELECT
    id,
    patient,
    start,
    stop,
    code,
    description
  FROM HEALTH_LAKE.GOV.str_encounters
  WHERE METADATA$ACTION IN ('INSERT','UPDATE')
) s
ON t.encounter_id = s.id
WHEN MATCHED THEN UPDATE SET
  t.patient_id      = s.patient,
  t.start_ts        = TRY_TO_TIMESTAMP(s.start),
  t.stop_ts         = TRY_TO_TIMESTAMP(s.stop),
  t.encounter_class = UPPER(s.description),
  t.code            = s.code,
  t.description     = s.description
WHEN NOT MATCHED THEN INSERT
  (encounter_id, patient_id, start_ts,  stop_ts,  encounter_class,         code,       description)
VALUES
  (s.id,          s.patient, TRY_TO_TIMESTAMP(s.start), TRY_TO_TIMESTAMP(s.stop),
   UPPER(s.description),     s.code,    s.description);
