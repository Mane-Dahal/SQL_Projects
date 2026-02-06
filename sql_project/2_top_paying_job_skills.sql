/*
1. What are the top-paying data engineer jobs?
2. What skills are required for these top-paying jobs?
3. What skills are most in-demand for data engineer?
4. Which skills are associated with higher salaries?
5. What are the most optimal skills to learn?
*/

/*
Question: What are the most in-demand skills for data engineer?
- Join job postings to inner join table similar to query 2
- Identify the top 5 in-demand skills for a data engineer.
- Focus on all job postings.
- Why? Retrieves the top 5 skills with the highest demand in the job market, 
    providing insights into the most valuable skills for job seekers.
*/


WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        salary_year_avg,
        companies.name AS company
    FROM
        job_postings_fact AS job_posting  
    LEFT JOIN company_dim AS companies ON job_posting.company_id = companies.company_id    
    WHERE
        job_title_short = 'Data Engineer' AND
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT NULL 
    ORDER BY
        salary_year_avg DESC    
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills.skills
FROM 
    top_paying_jobs
INNER JOIN skills_job_dim AS skills_dim ON top_paying_jobs.job_id = skills_dim.job_id
INNER JOIN skills_dim AS skills ON skills_dim.skill_id = skills.skill_id
ORDER BY
    salary_year_avg DESC


/*
1. Most Frequent Skills
The most commonly requested skills across these high-paying roles indicate the "standard" toolkit for top-tier data positions.
 Python is the clear leader, followed closely by Big Data tools like Spark.

Skill Frequency (Count)

Python$7$
Spark$5$
Hadoop$3$
Kafka$3$
Scala$3$

2. Highest Paying Skills (Average Salary)While Python is common,
specific specialized tools are associated with the absolute highest
salary peaks (reaching an average of $\$325,000$ in this dataset).
This often reflects specialized Data Engineering or Machine Learning Engineering stacks.

Top Tier ($\$325,000$): numpy, pandas, pyspark, kubernetes

Big Data Tier ($\approx \$300,000$): hadoop, kafkaGeneral

Purpose Tier ($\approx \$275,000$ - $\$280,000$): spark, python, sql


[
  {
    "job_id": 157003,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company": "Engtal",
    "skills": "python"
  },
  {
    "job_id": 157003,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company": "Engtal",
    "skills": "spark"
  },
  {
    "job_id": 157003,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company": "Engtal",
    "skills": "pandas"
  },
  {
    "job_id": 157003,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company": "Engtal",
    "skills": "numpy"
  },
  {
    "job_id": 157003,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company": "Engtal",
    "skills": "pyspark"
  },
  {
    "job_id": 157003,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company": "Engtal",
    "skills": "hadoop"
  },
  {
    "job_id": 157003,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company": "Engtal",
    "skills": "kafka"
  },
  {
    "job_id": 157003,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company": "Engtal",
    "skills": "kubernetes"
  },
  {
    "job_id": 21321,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company": "Engtal",
    "skills": "python"
  },
  {
    "job_id": 21321,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company": "Engtal",
    "skills": "spark"
  },
  {
    "job_id": 21321,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company": "Engtal",
    "skills": "pandas"
  },
  {
    "job_id": 21321,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company": "Engtal",
    "skills": "numpy"
  },
  {
    "job_id": 21321,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company": "Engtal",
    "skills": "pyspark"
  },
  {
    "job_id": 21321,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company": "Engtal",
    "skills": "hadoop"
  },
  {
    "job_id": 21321,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company": "Engtal",
    "skills": "kafka"
  },
  {
    "job_id": 21321,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company": "Engtal",
    "skills": "kubernetes"
  },
  {
    "job_id": 270455,
    "job_title": "Data Engineer",
    "salary_year_avg": "300000.0",
    "company": "Durlston Partners",
    "skills": "sql"
  },
  {
    "job_id": 270455,
    "job_title": "Data Engineer",
    "salary_year_avg": "300000.0",
    "company": "Durlston Partners",
    "skills": "python"
  },
  {
    "job_id": 230458,
    "job_title": "Director of Engineering - Data Platform",
    "salary_year_avg": "251000.0",
    "company": "Twitch",
    "skills": "spark"
  },
  {
    "job_id": 230458,
    "job_title": "Director of Engineering - Data Platform",
    "salary_year_avg": "251000.0",
    "company": "Twitch",
    "skills": "hadoop"
  },
  {
    "job_id": 230458,
    "job_title": "Director of Engineering - Data Platform",
    "salary_year_avg": "251000.0",
    "company": "Twitch",
    "skills": "kafka"
  },
  {
    "job_id": 230458,
    "job_title": "Director of Engineering - Data Platform",
    "salary_year_avg": "251000.0",
    "company": "Twitch",
    "skills": "tensorflow"
  },
  {
    "job_id": 230458,
    "job_title": "Director of Engineering - Data Platform",
    "salary_year_avg": "251000.0",
    "company": "Twitch",
    "skills": "keras"
  },
  {
    "job_id": 230458,
    "job_title": "Director of Engineering - Data Platform",
    "salary_year_avg": "251000.0",
    "company": "Twitch",
    "skills": "pytorch"
  },
  {
    "job_id": 561728,
    "job_title": "Data Engineer",
    "salary_year_avg": "250000.0",
    "company": "AI Startup",
    "skills": "python"
  },
  {
    "job_id": 561728,
    "job_title": "Data Engineer",
    "salary_year_avg": "250000.0",
    "company": "AI Startup",
    "skills": "scala"
  },
  {
    "job_id": 561728,
    "job_title": "Data Engineer",
    "salary_year_avg": "250000.0",
    "company": "AI Startup",
    "skills": "r"
  },
  {
    "job_id": 561728,
    "job_title": "Data Engineer",
    "salary_year_avg": "250000.0",
    "company": "AI Startup",
    "skills": "azure"
  },
  {
    "job_id": 543728,
    "job_title": "Staff Data Engineer",
    "salary_year_avg": "250000.0",
    "company": "Signify Technology",
    "skills": "python"
  },
  {
    "job_id": 543728,
    "job_title": "Staff Data Engineer",
    "salary_year_avg": "250000.0",
    "company": "Signify Technology",
    "skills": "scala"
  },
  {
    "job_id": 543728,
    "job_title": "Staff Data Engineer",
    "salary_year_avg": "250000.0",
    "company": "Signify Technology",
    "skills": "databricks"
  },
  {
    "job_id": 543728,
    "job_title": "Staff Data Engineer",
    "salary_year_avg": "250000.0",
    "company": "Signify Technology",
    "skills": "spark"
  },
  {
    "job_id": 595768,
    "job_title": "Principal Data Engineer",
    "salary_year_avg": "250000.0",
    "company": "Signify Technology",
    "skills": "python"
  },
  {
    "job_id": 595768,
    "job_title": "Principal Data Engineer",
    "salary_year_avg": "250000.0",
    "company": "Signify Technology",
    "skills": "scala"
  },
  {
    "job_id": 595768,
    "job_title": "Principal Data Engineer",
    "salary_year_avg": "250000.0",
    "company": "Signify Technology",
    "skills": "databricks"
  },
  {
    "job_id": 595768,
    "job_title": "Principal Data Engineer",
    "salary_year_avg": "250000.0",
    "company": "Signify Technology",
    "skills": "spark"
  },
  {
    "job_id": 204320,
    "job_title": "Staff Data Engineer",
    "salary_year_avg": "245000.0",
    "company": "Handshake",
    "skills": "go"
  },
  {
    "job_id": 151972,
    "job_title": "Principal Data Engineer (Remote)",
    "salary_year_avg": "245000.0",
    "company": "Movable Ink",
    "skills": "nosql"
  },
  {
    "job_id": 151972,
    "job_title": "Principal Data Engineer (Remote)",
    "salary_year_avg": "245000.0",
    "company": "Movable Ink",
    "skills": "aws"
  },
  {
    "job_id": 151972,
    "job_title": "Principal Data Engineer (Remote)",
    "salary_year_avg": "245000.0",
    "company": "Movable Ink",
    "skills": "gcp"
  },
  {
    "job_id": 2446,
    "job_title": "Data Engineering Manager",
    "salary_year_avg": "242000.0",
    "company": "Meta",
    "skills": "sql"
  },
  {
    "job_id": 2446,
    "job_title": "Data Engineering Manager",
    "salary_year_avg": "242000.0",
    "company": "Meta",
    "skills": "python"
  },
  {
    "job_id": 2446,
    "job_title": "Data Engineering Manager",
    "salary_year_avg": "242000.0",
    "company": "Meta",
    "skills": "java"
  },
  {
    "job_id": 2446,
    "job_title": "Data Engineering Manager",
    "salary_year_avg": "242000.0",
    "company": "Meta",
    "skills": "perl"
  }
]
*/

