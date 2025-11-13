USE DATABASE HEALTH_LAKE;
USE SCHEMA BRONZE_RAW;

COPY INTO observations_raw
  (id, date, patient, encounter, code, description,
   value, units, type)
FROM @BR_STAGE/observations.csv
FILE_FORMAT = (FORMAT_NAME = CSV_STD)
ON_ERROR = CONTINUE;
