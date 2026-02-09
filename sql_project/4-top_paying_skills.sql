/*
Question: What are the top skills based on salary?
- Look at the average salary associated with different skills for Data Analyst roles.
- Focus on roles with specified salaries, regardless of location.
- Why? It reveals how different skills impact salary levels for Data Analysts and 
    helps identify the most financially rewarding skills to acquire.
*/


SELECT
    skills.skills,
    ROUND(AVG(salary_year_avg) ,2) AS avg_salary
FROM job_postings_fact AS job_posting
INNER JOIN skills_job_dim AS skills_dim ON job_posting.job_id = skills_dim.job_id
INNER JOIN skills_dim AS skills ON skills_dim.skill_id = skills.skill_id 
WHERE job_title_short = 'Data Engineer' 
    AND salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY avg_salary DESC
LIMIT 25;  


/*
Insights for Question 4 (Data Engineer Top Paying Skills):

1. High-Value Niche Skills: Skills like 'node' ($181,861), 'mongo' ($179,402), 
   and 'solidity' ($166,250) lead the list, showing that "Hybrid" engineers 
   who know backend and blockchain tools command the highest salaries.

2. Data Visualization: 'ggplot2' ($176,250) is a top-tier earner, proving 
   that the ability to create advanced visual insights is highly rewarded.

3. Performance & Infrastructure: Languages like 'rust' and 'clojure', 
   combined with infrastructure tools like 'kubernetes' and 'ubuntu', 
   show a high premium for engineers building fast, scalable systems.

4. Modern Web Integration: The presence of 'vue', 'next.js', and 'angular' 
   suggests that top-paying roles often involve integrating data directly 
   into web-based platforms.


[
  {
    "skills": "node",
    "avg_salary": "181861.78"
  },
  {
    "skills": "mongo",
    "avg_salary": "179402.54"
  },
  {
    "skills": "ggplot2",
    "avg_salary": "176250.00"
  },
  {
    "skills": "solidity",
    "avg_salary": "166250.00"
  },
  {
    "skills": "vue",
    "avg_salary": "159375.00"
  },
  {
    "skills": "codecommit",
    "avg_salary": "155000.00"
  },
  {
    "skills": "ubuntu",
    "avg_salary": "154455.00"
  },
  {
    "skills": "clojure",
    "avg_salary": "153662.60"
  },
  {
    "skills": "cassandra",
    "avg_salary": "150255.30"
  },
  {
    "skills": "rust",
    "avg_salary": "147770.73"
  },
  {
    "skills": "drupal",
    "avg_salary": "147500.00"
  },
  {
    "skills": "perl",
    "avg_salary": "145539.92"
  },
  {
    "skills": "next.js",
    "avg_salary": "145000.00"
  },
  {
    "skills": "angular",
    "avg_salary": "143318.96"
  },
  {
    "skills": "scala",
    "avg_salary": "143161.07"
  },
  {
    "skills": "kafka",
    "avg_salary": "143085.77"
  },
  {
    "skills": "gdpr",
    "avg_salary": "142368.74"
  },
  {
    "skills": "shell",
    "avg_salary": "141724.61"
  },
  {
    "skills": "macos",
    "avg_salary": "141616.67"
  },
  {
    "skills": "numpy",
    "avg_salary": "141605.32"
  },
  {
    "skills": "opencv",
    "avg_salary": "141250.00"
  },
  {
    "skills": "atlassian",
    "avg_salary": "140643.52"
  },
  {
    "skills": "ibm cloud",
    "avg_salary": "140546.60"
  },
  {
    "skills": "splunk",
    "avg_salary": "140156.30"
  },
  {
    "skills": "kubernetes",
    "avg_salary": "140091.81"
  }
]
*/