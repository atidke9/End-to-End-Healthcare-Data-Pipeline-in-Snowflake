USE DATABASE HEALTH_LAKE;
USE SCHEMA GOV;

-- Enable the task chain
ALTER TASK t_upsert_encounters RESUME;
ALTER TASK t_build_gold RESUME;

-- To temporarily stop:
-- ALTER TASK t_build_gold SUSPEND;
-- ALTER TASK t_upsert_encounters SUSPEND;
