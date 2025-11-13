USE DATABASE HEALTH_LAKE;
USE SCHEMA BRONZE_RAW;

-- PATIENTS
CREATE OR REPLACE TABLE patients_raw (
  src_file STRING,
  load_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
  id STRING,
  birthdate DATE,
  deathdate DATE,
  ssn STRING,
  drivers STRING,
  passport STRING,
  prefix STRING,
  first STRING,
  last STRING,
  suffix STRING,
  maiden STRING,
  marital STRING,
  race STRING,
  ethnicity STRING,
  gender STRING,
  birthplace STRING,
  address STRING,
  city STRING,
  state STRING,
  zip STRING
);

-- ENCOUNTERS
CREATE OR REPLACE TABLE encounters_raw (
  src_file STRING,
  load_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
  id STRING,
  start TIMESTAMP,
  stop TIMESTAMP,
  patient STRING,
  organization STRING,
  provider STRING,
  payer STRING,
  code STRING,
  description STRING
);

-- CONDITIONS
CREATE OR REPLACE TABLE conditions_raw (
  src_file STRING,
  load_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
  id STRING,
  start DATE,
  stop DATE,
  patient STRING,
  encounter STRING,
  code STRING,
  description STRING
);

-- OBSERVATIONS
CREATE OR REPLACE TABLE observations_raw (
  src_file STRING,
  load_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
  id STRING,
  date TIMESTAMP,
  patient STRING,
  encounter STRING,
  code STRING,
  description STRING,
  value NUMBER(18,4),
  units STRING,
  type STRING
);

-- MEDICATIONS
CREATE OR REPLACE TABLE medications_raw (
  src_file STRING,
  load_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
  id STRING,
  patient STRING,
  encounter STRING,
  code STRING,
  description STRING,
  start DATE,
  stop DATE
);

-- IMMUNIZATIONS
CREATE OR REPLACE TABLE immunizations_raw (
  src_file STRING,
  load_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
  id STRING,
  date TIMESTAMP,
  patient STRING,
  encounter STRING,
  code STRING,
  description STRING
);

-- ALLERGIES
CREATE OR REPLACE TABLE allergies_raw (
  src_file STRING,
  load_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
  id STRING,
  patient STRING,
  encounter STRING,
  code STRING,
  description STRING,
  onset DATE,
  recordeddate DATE,
  severity STRING
);

-- CAREPLANS
CREATE OR REPLACE TABLE careplans_raw (
  src_file STRING,
  load_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
  id STRING,
  start DATE,
  stop DATE,
  patient STRING,
  encounter STRING,
  code STRING,
  description STRING,
  reasoncode STRING,
  reasondescription STRING
);

-- PROCEDURES
CREATE OR REPLACE TABLE procedures_raw (
  src_file STRING,
  load_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
  id STRING,
  date TIMESTAMP,
  patient STRING,
  encounter STRING,
  code STRING,
  description STRING
);
