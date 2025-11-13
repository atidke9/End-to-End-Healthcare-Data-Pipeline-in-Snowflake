USE DATABASE HEALTH_LAKE;
USE SCHEMA GOLD_MART;

-- Materialized encounter summary table (also built by task)
CREATE OR REPLACE TABLE encounter_summary AS
SELECT * FROM v_encounters_by_age_gender;
