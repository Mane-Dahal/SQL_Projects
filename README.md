# 📊 Data Engineering Market Analysis (SQL Project)

A data-driven investigation into the high-paying and most in-demand roles for Data Engineers. This project identifies the "Optimal" skills to learn by balancing salary potential with job availability.

### 🔍 The Questions I Answered

1. **Top Paying Jobs:** What are the highest-paying remote roles?
2. **Top Skills:** What skills do these high-paying jobs require?
3. **In-Demand Skills:** Which skills have the most job postings?
4. **Salary vs Skills:** Which specific skills lead to a higher paycheck?
5. **Optimal Skills:** Where does high demand meet high pay?

---

### 📈 Visual Analysis: The High Earners

#### **1. Top Paying Data Engineer Jobs (Query 1)**

![Top Paying Jobs](assets\1_top_paying_jobs.png)
The analysis of remote roles shows that top salaries reach up to **$325,000**. Companies like **Engtal** and **Durlston Partners** lead the market in high-compensation remote offers.

#### **2. Skills for Top Paying Jobs (Query 2)**

![Top Paying Job Skills](assets\2_top_paying_job_skills.png)
This chart explores the specific skills mentioned in the top 10 highest-paying roles. It reveals that while SQL is a baseline, **Python** and **Spark** are the primary drivers for reaching the absolute highest salary brackets ($300k+).

---

### 📊 Market Trend Data

#### **3. Most In-Demand Skills (Query 3)**

These are the foundational skills for Data Engineering. **SQL** and **Python** dominate the market volume, appearing in nearly every job posting.

| Skill | Demand Count |
| --- | --- |
| **SQL** | 113,375 |
| **Python** | 108,265 |
| **AWS** | 62,174 |
| **Azure** | 60,823 |
| **Spark** | 53,789 |

#### **4. Top Paying Skills (Query 4)**

Niche technical expertise and backend frameworks command the highest salaries. Learning these can significantly boost earning potential.

| Skill | Avg. Salary |
| --- | --- |
| **Node** | $181,862 |
| **Mongo** | $179,403 |
| **ggplot2** | $176,250 |
| **Solidity** | $166,250 |
| **Vue** | $159,375 |

#### **5. Optimal Skills: The "Sweet Spot" (Query 5)**

These skills represent the best ROI. They are highly sought after by employers while still offering top-tier salaries.

| Skill | Demand Count | Avg. Salary |
| --- | --- | --- |
| **Kafka** | 872 | $143,086 |
| **Scala** | 794 | $143,161 |
| **Snowflake** | 1,072 | $137,426 |
| **Redshift** | 780 | $139,527 |
| **Airflow** | 737 | $137,262 |

---

### 📂 The SQL Evidence

<details>
<summary>Query 1: Top Paying Remote Jobs</summary>

```sql
SELECT
    job_id,
    job_title,
    job_location,
    salary_year_avg,
    name AS company_name
FROM job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE job_title_short = 'Data Engineer' 
    AND job_location = 'Anywhere' 
    AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10;

```

</details>

<details>
<summary>Query 2: Skills for Top Paying Jobs</summary>

```sql
WITH top_paying_jobs AS (
    SELECT job_id, salary_year_avg
    FROM job_postings_fact
    WHERE job_title_short = 'Data Engineer' AND salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 10
)
SELECT top_paying_jobs.*, skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id;

```

</details>

<details>
<summary>Query 3: Most In-Demand Skills</summary>

```sql
SELECT skills, COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Engineer'
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 10;

```

</details>

<details>
<summary>Query 4: Top Paying Skills</summary>

```sql
SELECT skills, ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Engineer' AND salary_year_avg IS NOT NULL
GROUP BY skills
ORDER BY avg_salary DESC
LIMIT 25;

```

</details>

<details>
<summary>Query 5: Optimal Skills</summary>

```sql
SELECT skills_dim.skills, COUNT(skills_job_dim.job_id) AS demand_count, ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Engineer' AND salary_year_avg IS NOT NULL
GROUP BY skills_dim.skill_id
HAVING COUNT(skills_job_dim.job_id) > 10
ORDER BY avg_salary DESC, demand_count DESC
LIMIT 25;

```

</details>

---

### 🧠 What I Learned

I’m learning SQL because I want to be a **full-time Data Analyst**, and this project was my way of practicing with real data. Here’s what I actually learned:

* **Real data is messy:** I realized that half the battle is just cleaning things up. I had to use `WHERE` to get rid of empty salary info so my averages weren't totally wrong.
* **Joining is everything:** I finally figured out how to use `JOIN` to link different tables together. It’s how you connect a company name to a job and a specific skill.
* **Spotting the trends:** I used `GROUP BY` and `ORDER BY` to turn a giant list of jobs into a "Top 10" list that actually makes sense.

### 🏁 Conclusion

I did this project to answer one question: **"What should I actually learn to get hired?"**

Learning **SQL** was the best start because the data shows it’s the #1 skill every company wants. It’s basically the "entry ticket" for any Data Analyst job. But it also showed me that if I want to make more money later on, I should eventually add **Python** and **Cloud tools** to my list.

Basically, SQL helped me stop guessing and actually see which skills are worth my time. It's the perfect tool to help me reach my goal of working as a full-time analyst.

---

### 👋 Contact Me

* **LinkedIn:** [Mana Al-balharith](https://www.linkedin.com/in/mana-al-balharith?utm_source=share_via&utm_content=profile&utm_medium=member_android)
* **Email:** mane58dahal@gmail.com

---
