USE DATABASE HEALTH_LAKE;
USE SCHEMA BRONZE_RAW;

-- Internal stage to upload all Synthea CSVs
CREATE OR REPLACE STAGE BR_STAGE
  FILE_FORMAT = CSV_STD;

-- After this, upload:
-- allergies.csv, careplans.csv, conditions.csv, encounters.csv,
-- immunizations.csv, medications.csv, observations.csv,
-- patients.csv, procedures.csv
