	-- avg_salary_by_role.csv
	-- avg_salary_by_experience_level.csv
	-- avg_salary_by_location.csv
	-- salary_by_skill.csv
	-- salary_by_work_type.csv
-- 4A. Hiring Analysis

-- Top 20 job titles by demand
-- SELECT clean_title, COUNT(*) AS job_count
-- FROM jobs GROUP BY clean_title ORDER BY job_count DESC LIMIT 20;

-- Top hiring companies
-- SELECT company_name, COUNT(*) AS job_count
-- FROM jobs GROUP BY company_name ORDER BY job_count DESC LIMIT 20;

-- Top hiring locations
-- SELECT location, COUNT(*) AS job_count
-- FROM jobs GROUP BY location ORDER BY job_count DESC LIMIT 15;

-- Jobs by work type (remote/hybrid/onsite)
-- SELECT formatted_work_type, COUNT(*) AS job_count,
--        ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 1) AS pct
-- FROM jobs
-- GROUP BY formatted_work_type
-- ORDER BY job_count DESC;

-- Experience level distribution
-- SELECT formatted_experience_level, COUNT(*) AS job_count,
--        ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 1) AS pct
-- FROM jobs
-- GROUP BY formatted_experience_level
-- ORDER BY job_count DESC;

-- 4B. Skill Analysis

-- Top 20 skills overall
-- SELECT skill, COUNT(*) AS demand
-- FROM job_skills GROUP BY skill ORDER BY demand DESC LIMIT 20;

-- Top skills for a specific role (swap the role name)
-- SELECT js.skill, COUNT(*) AS demand
-- FROM job_skills js
-- JOIN jobs j ON js.job_id = j.job_id
-- WHERE j.clean_title ILIKE '%data analyst%'
-- GROUP BY js.skill ORDER BY demand DESC LIMIT 15;

-- Skill demand by category
-- SELECT sm.category, COUNT(*) AS demand
-- FROM job_skills js
-- JOIN skills_master sm ON js.skill = sm.skill
-- GROUP BY sm.category ORDER BY demand DESC;

-- Skills required across the TOP 10 most common roles (matrix-style)
-- SELECT j.clean_title, js.skill, COUNT(*) AS demand
-- FROM job_skills js
-- JOIN jobs j ON js.job_id = j.job_id
-- WHERE j.clean_title IN (
--     SELECT clean_title FROM jobs GROUP BY clean_title ORDER BY COUNT(*) DESC LIMIT 10
-- )
-- GROUP BY j.clean_title, js.skill
-- ORDER BY j.clean_title, demand DESC; 

-- Skill co-occurrence: which skill pairs appear together most often
-- SELECT a.skill AS skill_1, b.skill AS skill_2, COUNT(*) AS times_together
-- FROM job_skills a
-- JOIN job_skills b ON a.job_id = b.job_id AND a.skill < b.skill
-- GROUP BY a.skill, b.skill
-- ORDER BY times_together DESC
-- LIMIT 20;

-- Average skills required per job, by experience level
-- SELECT j.formatted_experience_level, ROUND(AVG(skill_counts.n), 2) AS avg_skills_required
-- FROM jobs j
-- JOIN (
--     SELECT job_id, COUNT(*) AS n FROM job_skills GROUP BY job_id
-- ) skill_counts ON j.job_id = skill_counts.job_id
-- GROUP BY j.formatted_experience_level
-- ORDER BY avg_skills_required DESC;


-- 4C. Salary Analysis

-- Average salary by role (min sample size filter to avoid noisy small groups)

-- SELECT clean_title, ROUND(AVG(normalized_salary), 0) AS avg_salary, COUNT(*) AS n
-- FROM jobs
-- WHERE normalized_salary IS NOT NULL
--   AND normalized_salary BETWEEN 15000 AND 500000  -- reasonable annual salary bounds
--   AND NOT (title ILIKE '%locum%' OR title ILIKE '%contract%' OR title ILIKE '%per diem%'
--            OR title ILIKE '%prn%' OR title ILIKE '%temporary%')
-- GROUP BY clean_title
-- HAVING COUNT(*) > 20
-- ORDER BY avg_salary DESC LIMIT 20;

-- Salary by experience level
-- SELECT formatted_experience_level, ROUND(AVG(normalized_salary), 0) AS avg_salary, COUNT(*) AS n
-- FROM jobs
-- WHERE normalized_salary BETWEEN 15000 AND 500000
--   AND formatted_experience_level != 'Not Available'
-- GROUP BY formatted_experience_level
-- ORDER BY avg_salary DESC;

-- Salary by location
-- SELECT location, ROUND(AVG(normalized_salary), 0) AS avg_salary, COUNT(*) AS n
-- FROM jobs
-- WHERE normalized_salary BETWEEN 15000 AND 500000
-- GROUP BY location
-- HAVING COUNT(*) > 15
-- ORDER BY avg_salary DESC LIMIT 15;

-- Skill vs salary correlation
-- SELECT js.skill, ROUND(AVG(j.normalized_salary), 0) AS avg_salary, COUNT(*) AS n
-- FROM job_skills js
-- JOIN jobs j ON js.job_id = j.job_id
-- WHERE j.normalized_salary BETWEEN 15000 AND 500000
-- GROUP BY js.skill
-- HAVING COUNT(*) > 50
-- ORDER BY avg_salary DESC LIMIT 18;

-- Remote vs onsite salary comparison
-- SELECT formatted_work_type, ROUND(AVG(normalized_salary), 0) AS avg_salary, COUNT(*) AS n
-- FROM jobs
-- WHERE normalized_salary BETWEEN 15000 AND 500000
-- GROUP BY formatted_work_type
-- ORDER BY avg_salary DESC;

