# Phase 3: Skill Extraction & NLP Analysis Report

## 1. Objective

The objective of this phase was to extract technical skills from job descriptions using Natural Language Processing (NLP) techniques and analyze skill demand trends in the job market.

The extracted skills will be used as a foundation for job market analytics and future resume-job matching.

---

## 2. Dataset Used

Dataset:
LinkedIn Job Postings Dataset (2023-2024)

Input File:
- jobs_cleaned.csv

Dataset contains:
- Job title
- Job description
- Location
- Salary information
- Cleaned text fields

---

## 3. Methodology

The following steps were performed:

### 3.1 NLP Environment Setup

Libraries used:

- spaCy
- Pandas
- Python Collections

spaCy English language model:

- en_core_web_sm

was used for NLP processing.

---

### 3.2 Skill Dictionary Creation

A predefined technical skill dictionary was created containing commonly required industry skills.

Examples:

- Python
- SQL
- Machine Learning
- AWS
- React
- Java
- Docker
- Kubernetes
- Data Science

---

### 3.3 Skill Extraction

A keyword-based NLP approach was applied.

Process:

Job Description
↓
Text preprocessing
↓
Skill matching
↓
Extracted skill list

Each job posting was analyzed and matching skills were stored in a new column:

`extracted_skills`

---

## 4. Skill Frequency Analysis

After extracting skills from all job descriptions, skill occurrences were counted.

The frequency analysis helped identify:

- Most demanded skills
- Common technologies in job postings
- Industry skill trends

Output generated:

- skills_frequency.csv

---

## 5. Visual Analysis

A visualization was created for the top 20 most demanded skills.

The chart represents the number of job postings requiring each skill.

---

## 6. Output Files Generated

### jobs_with_skills.csv

Contains:

- Original job information
- Cleaned descriptions
- Extracted skills

### skills_frequency.csv

Contains:

- Skill name
- Skill occurrence count
- Skill demand percentage

---

## 7. Key Insights

The analysis identified the most frequently requested skills in the job market.

Examples of insights:

- Programming languages are among the most demanded skills.
- SQL and Python show strong demand for data-related roles.
- Cloud technologies such as AWS are widely used in industry requirements.
- Data science and machine learning skills are increasingly required.

---

## 8. Conclusion

Phase 3 successfully implemented an NLP-based skill extraction pipeline.

The extracted skill information provides valuable insights into current job market requirements and prepares the dataset for future modules such as:

- Job recommendation system
- Resume-job matching
- Skill gap analysis
- AI-powered career insights dashboard
