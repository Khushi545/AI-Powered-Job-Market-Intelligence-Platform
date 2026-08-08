-- sql/query_results/
-- ├── top_job_titles.csv
-- ├── top_hiring_companies.csv
-- ├── top_locations.csv
-- ├── work_type_distribution.csv
-- ├── experience_level_distribution.csv
-- ├── top_skills.csv
-- ├── skills_by_role_data_analyst.csv
-- ├── skill_demand_by_category.csv
-- ├── skill_co_occurrence.csv
-- ├── avg_salary_by_role.csv
-- ├── avg_salary_by_experience.csv
-- └── avg_salary_by_location.csv


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
-- ORDER BY j.clean_title, demand DESC; useless registred nurse problem

-- 517 first output and 1772 third output,didnt run the second one,give to claude

