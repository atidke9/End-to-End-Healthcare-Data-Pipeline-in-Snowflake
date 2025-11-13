USE DATABASE HEALTH_LAKE;
USE SCHEMA GOLD_MART;

-- Dimension: patient
CREATE OR REPLACE TABLE dim_patient AS
SELECT
  patient_id,
  gender,
  state,
  DATEDIFF('year', birthdate, CURRENT_DATE()) AS age
FROM HEALTH_LAKE.SILVER_CURATED.patients;

-- Fact: encounters
CREATE OR REPLACE TABLE fact_encounter AS
SELECT
  encounter_id,
  patient_id,
  start_ts,
  stop_ts,
  encounter_class,
  code
FROM HEALTH_LAKE.SILVER_CURATED.encounters;

-- Fact: numeric observations
CREATE OR REPLACE TABLE fact_observation AS
SELECT
  observation_id,
  patient_id,
  encounter_id,
  effective_ts,
  code,
  value_num,
  units
FROM HEALTH_LAKE.SILVER_CURATED.observations
WHERE value_num IS NOT NULL;

-- View: encounters by age & gender
CREATE OR REPLACE VIEW v_encounters_by_age_gender AS
SELECT
  CASE
    WHEN age < 18 THEN 'Under 18'
    WHEN age BETWEEN 18 AND 40 THEN '18-40'
    WHEN age BETWEEN 41 AND 65 THEN '41-65'
    ELSE '65+'
  END AS age_group,
  dp.gender,
  COUNT(*) AS encounter_count
FROM dim_patient dp
JOIN fact_encounter fe
  ON fe.patient_id = dp.patient_id
GROUP BY 1,2
ORDER BY 1,2;

-- View: lab trends over time
CREATE OR REPLACE VIEW v_lab_trends AS
SELECT
  code,
  DATE_TRUNC('month', effective_ts) AS month,
  AVG(value_num) AS avg_value,
  COUNT(*) AS n
FROM fact_observation
GROUP BY 1,2
ORDER BY 2;
