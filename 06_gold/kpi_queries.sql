USE DATABASE HEALTH_LAKE;
USE SCHEMA GOLD_MART;

-- Example KPIs you can use in dashboards / Streamlit

-- 1) Encounters by age group & gender
SELECT * FROM encounter_summary ORDER BY encounter_count DESC;

-- 2) Top observation codes by average value
SELECT
  code,
  AVG(value_num) AS avg_value,
  COUNT(*) AS n
FROM fact_observation
GROUP BY code
ORDER BY avg_value DESC
LIMIT 20;

-- 3) Monthly trend of a specific lab code
-- Replace 'XYZ' with an actual observation code from your data
SELECT
  month,
  avg_value,
  n
FROM v_lab_trends
WHERE code = 'XYZ'
ORDER BY month;
