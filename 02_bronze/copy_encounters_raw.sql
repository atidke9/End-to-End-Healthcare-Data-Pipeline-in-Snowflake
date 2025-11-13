USE DATABASE HEALTH_LAKE;
USE SCHEMA BRONZE_RAW;

COPY INTO encounters_raw
  (id, start, stop, patient, organization, provider,
   payer, code, description)
FROM @BR_STAGE/encounters.csv
FILE_FORMAT = (FORMAT_NAME = CSV_STD)
ON_ERROR = CONTINUE;
