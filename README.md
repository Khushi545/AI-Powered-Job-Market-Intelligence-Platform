# JobIntel — Job Market & Skill Demand Analytics Platform

An end-to-end data analytics project analyzing 123,849 LinkedIn job postings to identify in-demand skills, salary trends, and hiring patterns across roles, locations, and experience levels.

Built using Python, PostgreSQL, Excel, and Power BI — covering the full analyst workflow from raw data cleaning through interactive dashboarding and business recommendations.

---

## Overview

Companies and job seekers alike struggle to keep up with a fast-changing job market — which skills are actually in demand, which roles pay the most, and where the opportunities are concentrated. JobIntel analyzes a large-scale dataset of real job postings to answer these questions with data, not guesswork.

**Key questions this project answers:**
- What skills are currently in demand, and which ones actually differentiate candidates?
- Which roles and locations offer the highest hiring volume and compensation?
- How does experience level affect skill requirements and salary?
- What data-quality pitfalls exist in real-world job posting data, and how were they handled?

---

## Architecture


<img width="2397" height="3058" alt="126093" src="https://github.com/user-attachments/assets/2a3a6627-bb9f-4b8b-813d-a808c0951d4d" />

---

## Tech Stack

| Layer | Tools |
|---|---|
| Data Processing | Python (Pandas), Jupyter Notebook, Regex |
| Database | PostgreSQL, SQL, pgAdmin |
| Reporting | Microsoft Excel (Pivot Tables, KPIs) |
| Visualization | Power BI (DAX measures, drill-through, decomposition tree) |
| Version Control | Git, GitHub |
| Dataset | LinkedIn Job Postings (123,849 records) |

---

## Key Insights

- **Excel remains the most universally requested hard skill** (14.6% of postings), while **SQL (4.2%) and Python (3.7%) lead among technical roles specifically.**
- **Soft skills dominate raw counts but aren't differentiators** — "communication" appears in 48.3% of all postings, making it effectively table-stakes rather than a competitive edge.
- **Salary scales sharply with seniority** — median salary rises from $48,880 (Internship) to $193,750 (Executive), a ~4x increase, with the steepest single jump occurring between Mid-Senior and Director level (+55%).
- **Hiring volume and highest pay are concentrated in different markets** — New York leads by volume (2,756 postings), while San Mateo, CA leads by average pay ($199,605) despite far lower volume (33 postings).
- **Contract roles pay more on average than full-time roles** ($102,679 vs. $98,406) — likely reflecting the lack of benefits bundled into contract compensation.

Full findings with methodology: [`business_recommendations.md`](./business_recommendations.md)

---

## Dashboard
<img width="1169" height="657" alt="SALARY AND HIRING INSIGHTS" src="https://github.com/user-attachments/assets/26a56cad-640f-4903-9165-e96e0a7333b8" />
<img width="1172" height="658" alt="SKILLS INTELLIGENCE" src="https://github.com/user-attachments/assets/8cc69fed-aafa-4fa5-92f1-a3b77fcb3b5f" />
<img width="1166" height="657" alt="JOB MARKET OVERVIEW" src="https://github.com/user-attachments/assets/f4f4c21f-0b61-46a5-8312-eb7f7c91b610" />


```markdown
![Job Market Overview](powerbi/screenshots/page1_overview.png)
![Skills Intelligence](powerbi/screenshots/page2_skills.png)
![Salary & Hiring Insights](powerbi/screenshots/page3_salary.png)
```

---

## Data Quality & Methodology Notes

This project surfaced and corrected several real-world data quality issues, documented in full in [`sql/data_cleaning.sql`](./sql/data_cleaning.sql):

- **Regex false positives in skill extraction** — e.g., "Spark" matching idiomatic phrases like "spark your career" rather than the Apache Spark technology; "React" matching the English verb rather than React.js; "HTML" incorrectly matching `.html` URL file extensions. Fixable cases (React, HTML, Spring) were corrected via phrase-specificity and regex lookbehind fixes; "Spark" was determined to require full NLP disambiguation and is documented as a known limitation rather than force-fit with an unreliable patch.
- **Salary unit mismatch** — the raw `med_salary` field mixed hourly, monthly, and annual figures without normalization, producing meaningless averages (e.g., $12,788 for Physician Assistant roles that actually pay $150K+). Fixed by switching to the dataset's `normalized_salary` field, which converts all figures to an annual basis.
- **Outlier contamination** — a small number of rows had mismatched `pay_period` labels relative to their actual salary figures, producing extreme outliers (e.g., $230M for a single role). Filtered using a $15,000–$500,000 sanity bound.
- **FTE-hours assumption mismatch** — contract/locum/per-diem postings were excluded from role-level salary averages, since annualizing their hourly rate by full-time-equivalent hours overstates actual compensation for non-full-time work.

---

## Project Structure

```
JobIntel/
├── README.md
├── architecture_diagram.png
├── business_recommendations.md
├── data/                      (small sample CSVs only — not the full 123K-row file)
├── notebooks/
│   ├── 01_data_exploration.ipynb
│   ├── 02_data_cleaning.ipynb
│   ├── 03_skill_extraction.ipynb
│   └── 03b_advanced_skill_extraction.ipynb
├── sql/
│   ├── schema.sql
│   ├── data_cleaning.sql
│   └── business_queries.sql
├── excel/
│   └── analytics_report.xlsx
└── powerbi/
    └── screenshots/
```

---

## How to Run This Project

1. Clone this repo: `git clone <your-repo-url>`
2. Install dependencies: `pip install pandas numpy` (see notebooks for any additional imports)
3. Run notebooks in order: `01_data_exploration.ipynb` → `02_data_cleaning.ipynb` → `03b_advanced_skill_extraction.ipynb`
4. Set up PostgreSQL and run `sql/schema.sql` to create tables
5. Import the generated CSVs (`jobs_with_skills_v2.csv`, `job_skills.csv`, `skills_master.csv`, `skill_aliases.csv`) into their respective tables
6. Run `sql/data_cleaning.sql`, then `sql/business_queries.sql` for the full analysis
7. Open `excel/analytics_report.xlsx` or connect Power BI Desktop to the `job_market_db` PostgreSQL database to explore the dashboards

---

## Author

Built as an end-to-end portfolio project covering the complete data analyst workflow: data collection → cleaning → NLP skill extraction → SQL analysis → Excel/Power BI dashboarding → business recommendations.
