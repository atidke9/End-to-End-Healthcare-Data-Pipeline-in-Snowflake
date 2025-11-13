USE DATABASE HEALTH_LAKE;
USE SCHEMA SILVER_CURATED;

CREATE OR REPLACE TABLE patients AS
SELECT
  id AS patient_id,
  TRY_TO_DATE(birthdate) AS birthdate,
  TRY_TO_DATE(deathdate) AS deathdate,
  UPPER(gender) AS gender,
  UPPER(race) AS race,
  UPPER(ethnicity) AS ethnicity,
  city,
  state,
  zip
FROM HEALTH_LAKE.BRONZE_RAW.patients_raw
WHERE id IS NOT NULL;
