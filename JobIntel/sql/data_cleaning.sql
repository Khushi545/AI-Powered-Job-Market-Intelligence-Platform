-- Phase 3: SQL Data Cleaning & Validation

-- Step 1: Backup
CREATE TABLE jobs_backup AS SELECT * FROM jobs;

-- Step 2: Remove duplicate jobs
DELETE FROM jobs a
USING jobs b
WHERE a.ctid < b.ctid
  AND a.job_id = b.job_id;

-- Step 3: Remove orphan skill rows
DELETE FROM job_skills
WHERE job_id NOT IN (SELECT job_id FROM jobs);

-- Step 4: Standardize missing text fields
UPDATE jobs SET location = 'Not Specified' WHERE location IS NULL OR location = '';
UPDATE jobs SET formatted_experience_level = 'Not Specified' WHERE formatted_experience_level IS NULL OR formatted_experience_level = '';

-- Step 5: Add missing skills to skills_master
INSERT INTO skills_master (skill, category)
SELECT DISTINCT js.skill, 'Uncategorized'
FROM job_skills js
LEFT JOIN skills_master sm ON js.skill = sm.skill
WHERE sm.skill IS NULL;

-- Step 6: Verification (all should return 0)
SELECT job_id, COUNT(*) FROM jobs GROUP BY job_id HAVING COUNT(*) > 1;
SELECT COUNT(*) FROM job_skills js LEFT JOIN jobs j ON js.job_id = j.job_id WHERE j.job_id IS NULL;
SELECT DISTINCT js.skill FROM job_skills js LEFT JOIN skills_master sm ON js.skill = sm.skill WHERE sm.skill IS NULL;