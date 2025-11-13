USE DATABASE HEALTH_LAKE;
USE SCHEMA BRONZE_RAW;

COPY INTO patients_raw
  (id, birthdate, deathdate, ssn, drivers, passport,
   prefix, first, last, suffix, maiden, marital,
   race, ethnicity, gender, birthplace, address,
   city, state, zip)
FROM @BR_STAGE/patients.csv
FILE_FORMAT = (FORMAT_NAME = CSV_STD)
ON_ERROR = CONTINUE;
