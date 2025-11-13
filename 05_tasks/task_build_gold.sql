USE DATABASE HEALTH_LAKE;
USE SCHEMA GOV;

-- Dependent task: refresh Gold encounter_summary after Silver upsert
CREATE OR REPLACE TASK t_build_gold
  WAREHOUSE = WH_HEALTH_XS
  AFTER t_upsert_encounters
AS
CREATE OR REPLACE TABLE HEALTH_LAKE.GOLD_MART.encounter_summary AS
SELECT * FROM HEALTH_LAKE.GOLD_MART.v_encounters_by_age_gender;
