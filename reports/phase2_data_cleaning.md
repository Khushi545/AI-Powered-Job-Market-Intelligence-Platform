# Phase 2: Data Cleaning Report

## Project

AI-Powered Job Market Intelligence Platform

## Objective

The objective of this phase was to transform the raw LinkedIn Job Postings dataset into a clean, structured, and analysis-ready dataset for subsequent NLP, machine learning, and analytics tasks.

## Dataset Information

**Dataset:** LinkedIn Job Postings Dataset

**Initial Shape:**

* Rows: 123,849
* Columns: 31

**Final Shape:**

* Rows: 123,849
* Columns: 15

## Columns Selected

The following columns were retained for analysis:

* job_id
* company_name
* title
* description
* location
* formatted_work_type
* formatted_experience_level
* min_salary
* max_salary
* med_salary
* currency
* remote_allowed
* skills_desc

Additional engineered columns:

* clean_description
* clean_title

## Data Cleaning Steps Performed

### 1. Column Selection

Removed irrelevant columns and retained only the attributes required for job market analysis, skill extraction, salary analysis, and recommendation modules.

### 2. Missing Value Handling

Handled missing values across the dataset:

* Text-based columns were filled with "Not Available".
* Salary-related columns were filled with 0.
* Currency values were standardized using "Not Available" where missing.
* Remote work indicators were replaced with 0 where unavailable.

### 3. Duplicate Record Removal

Checked for duplicate job postings and removed duplicate entries where applicable to ensure data quality.

### 4. Text Cleaning

Job descriptions and job titles were cleaned using text preprocessing techniques:

* Converted text to lowercase.
* Removed special characters and symbols.
* Removed HTML tags and unwanted formatting.
* Removed extra whitespace.

### 5. Feature Engineering

Created new columns:

#### clean_description

Processed version of the job description for NLP and skill extraction.

#### clean_title

Processed version of the job title for role categorization and analytics.

## Final Dataset Quality

* Total Records: 123,849
* Total Columns: 15
* Missing Values: Eliminated from selected analysis columns
* Dataset Status: Ready for NLP and Machine Learning

## Output Generated

Generated cleaned dataset:

data/jobs_cleaned.csv

## Outcome

The cleaned dataset is now prepared for:

* Skill Extraction using NLP
* Job Role Analysis
* Salary Analytics
* Skill Demand Trend Analysis
* Resume-Job Matching
* Career Recommendation Engine

## Next Phase

Phase 3: Skill Extraction and NLP Analysis
