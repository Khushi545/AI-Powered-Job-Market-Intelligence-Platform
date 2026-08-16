# JobIntel — Business Recommendations

Based on analysis of 123,849 job postings across skills, salary, hiring, and location data.

---

## 1. Excel remains the single most universally requested hard skill — but SQL/Python define technical roles

Among the top 10 in-demand skills overall, Excel ranks 3rd with 18,079 mentions (14.6% of postings) — behind only communication and leadership, and ahead of every other named tool. Among technical skills specifically, SQL (5,150 / 4.2%) and Python (4,642 / 3.7%) lead, followed by data analysis (3,196 / 2.6%) and AWS (3,148 / 2.5%), then Azure (2,905), Java (2,660), Oracle (2,331), JavaScript (1,957), and Statistics (1,956).

**Recommendation:** Candidates targeting general business or administrative roles should treat Excel as table-stakes, not a differentiator. Candidates targeting data/technical roles should prioritize SQL and Python first — these two consistently outrank other technical tools (AWS, Azure, Java, Oracle) across postings.

---

## 2. Soft skills dominate raw counts, but that reflects boilerplate language, not selectivity

"Communication" (59,773 mentions / 48.3% of all postings) and "leadership" (29,228 / 23.6%) top the overall skill list by a wide margin — roughly 3x and 1.6x the next-highest skill (Excel, 14.6%) respectively — appearing across roles that have nothing to do with people-management (e.g. accountants, technicians, nurses).

**Recommendation:** Don't over-index on soft-skill keyword frequency when evaluating what makes a candidate competitive — nearly half of all postings claim "communication" as a requirement, making it effectively a non-differentiator. Technical/hard skills, which appear far less frequently, are the actual differentiators employers use to narrow candidate pools.

---

## 3. Skill requirements compound with seniority

Average skills requested per job rises steadily with experience level — from Entry level, through Associate and Mid-Senior, up to Director and Executive postings, which request meaningfully more skills on average.

**Recommendation:** Job seekers should expect skill breadth expectations to increase with each career step, not just responsibility. Early-career professionals should build a focused core skill set; those targeting senior roles should actively broaden their toolkit, not just deepen existing expertise.

---

## 4. Salary scales sharply with seniority — Executive median nearly 4x Internship level

Median normalized salary rises consistently across experience tiers: Internship ($48,880) → Entry level ($52,213) → Associate ($72,800) → Mid-Senior level ($107,500) → Director ($167,206) → Executive ($193,750). The jump from Mid-Senior to Director alone represents a 55% increase, and Executive is 3.97x Internship-level pay.

**Recommendation:** This confirms experience-level progression is the single strongest salary lever in this dataset — more impactful than any individual skill. Career planning should weight moving up experience tiers (via promotion or role scope) as highly as skill acquisition. The steepest jump (Mid-Senior → Director) suggests that transition is the highest-leverage career move in terms of compensation.

---

## 5. Software engineering and specialized management roles top the pay scale

Among roles with reliable sample sizes, Senior Software Engineer, Attorney, Software Engineer, Senior Project Manager, and Financial Controller rank as the highest-paying titles in the dataset (all averaging well above $130K).

**Recommendation:** Candidates optimizing for compensation should note that specialized technical (software engineering) and specialized professional (legal, finance leadership) tracks outperform general management and administrative tracks by a wide margin.

---

## 6. Remote roles remain a small minority of the market

Only about 12% of postings are remote; the large majority (nearly 88%) are non-remote (onsite or hybrid).

**Recommendation:** Job seekers prioritizing remote work should expect a meaningfully smaller pool of opportunities and may need to broaden role/location flexibility. Employers offering remote positions may find it easier to differentiate in a market where most competitors require onsite presence.

---

## 7. Hiring is geographically concentrated in major metro markets — but the highest-paying markets are a different set entirely

By volume, New York, NY leads (2,756 postings), followed by Chicago, IL (1,834), Houston, TX (1,762), Dallas, TX (1,383), Atlanta, GA (1,363), Boston, MA (1,176), Austin, TX (1,083), Charlotte, NC (1,075), and Phoenix, AZ (1,059) — a small set of large metro areas accounting for a disproportionate share of hiring volume. However, the highest **average salary** locations are a distinct set concentrated in the San Francisco Bay Area: San Mateo, CA ($199,605, n=33), Foster City, CA ($178,323, n=44), Mountain View, CA ($163,085, n=58), and San Francisco, CA itself ($139,403, n=399) — none of which crack the top-10-by-volume list.

**Recommendation:** Job seekers optimizing for volume of opportunity should prioritize the high-volume metros (NY, Chicago, Houston, etc.). Job seekers optimizing for compensation, particularly in tech, should look toward the Bay Area sub-markets, which pay a substantial premium despite lower posting volume — San Mateo's average ($199,605) is roughly 44% higher than San Francisco's own average ($139,403), suggesting sub-region matters as much as metro area.

*Data note: "United States" appears as the top entry in the raw location-by-volume ranking (8,125 postings) — this is a generic country-level fallback value rather than a real city, indicating a subset of postings have incomplete location data. It's excluded from the city-level ranking above as it isn't a meaningful hiring market.*

---

## 8. Salary data is only available for a minority of postings — treat compensation benchmarks with appropriate caution

Only about 29% of postings disclose usable salary information; the remaining 71% do not report pay.

**Recommendation:** All salary-based findings in this project (including the ones above) should be understood as representative of the subset of employers willing to disclose compensation, not the full market — a real and common limitation in job-posting datasets. This doesn't invalidate the findings, but it's a meaningful caveat for anyone using this data to negotiate or benchmark.

---

## 9. Contract roles pay more on average than full-time roles — likely reflecting risk/benefits tradeoffs

Average salary by work type: Contract ($102,679, n=3,726) actually edges out Full-time ($98,406, n=28,790), followed by Other ($76,583), Temporary ($74,561), Part-time ($59,853), Internship ($54,850), and Volunteer ($46,788, n=3 — too small a sample to be meaningful).

**Recommendation:** The Contract-vs-Full-time premium likely reflects that contract compensation must account for the lack of benefits (health insurance, PTO, 401k matching) and employment instability that full-time roles include — contractors are effectively paid a premium to self-fund what a full-time salary bundles in. Job seekers comparing a contract offer against a full-time offer should evaluate total compensation (benefits included), not base pay alone, since the headline numbers alone slightly favor contract work.

---

## Data Quality Note

Several data-quality issues were identified and corrected during this project, including regex-based skill extraction false positives (e.g., "Spark" matching idiomatic phrases like "spark your career" rather than the Apache Spark technology, "React" matching the English verb rather than React.js) and a salary normalization issue where mixed hourly/annual pay figures required conversion via a `normalized_salary` field rather than the raw `med_salary` column. These are documented in `sql/data_cleaning.sql` and reflect the practical reality of working with real-world, unstructured job posting data.
