USE DATABASE HEALTH_LAKE;
USE SCHEMA SILVER_CURATED;

CREATE OR REPLACE TABLE encounters AS
SELECT
  id AS encounter_id,
  patient AS patient_id,
  TRY_TO_TIMESTAMP(start) AS start_ts,
  TRY_TO_TIMESTAMP(stop)  AS stop_ts,
  UPPER(description) AS encounter_class,   -- using description as class
  code,
  description
FROM HEALTH_LAKE.BRONZE_RAW.encounters_raw
WHERE id IS NOT NULL;
