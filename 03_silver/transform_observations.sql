USE DATABASE HEALTH_LAKE;
USE SCHEMA SILVER_CURATED;

CREATE OR REPLACE TABLE observations AS
SELECT
  id AS observation_id,
  patient AS patient_id,
  encounter AS encounter_id,
  TRY_TO_TIMESTAMP(date) AS effective_ts,
  code,
  description,
  TRY_TO_DECIMAL(value, 18, 4) AS value_num,
  units,
  type
FROM HEALTH_LAKE.BRONZE_RAW.observations_raw
WHERE id IS NOT NULL;
