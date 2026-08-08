CREATE TABLE jobs (
    job_id                      BIGINT PRIMARY KEY,
    company_name                TEXT,
    title                       TEXT,
    description                 TEXT,
    location                    TEXT,
    formatted_work_type         TEXT,
    formatted_experience_level  TEXT,
    min_salary                  NUMERIC,
    max_salary                  NUMERIC,
    med_salary                  NUMERIC,
    currency                    TEXT,
    remote_allowed               NUMERIC,
    skills_desc                  TEXT,
    clean_description             TEXT,
    clean_title                   TEXT,
    extracted_skills               TEXT,
    skill_count                     BIGINT
);

CREATE TABLE job_skills (
    job_id  BIGINT REFERENCES jobs(job_id),
    skill   TEXT
);

CREATE TABLE skills_master (
    skill     TEXT PRIMARY KEY,
    category  TEXT
);

CREATE TABLE skill_aliases (
    alias             TEXT PRIMARY KEY,
    normalized_skill  TEXT
);