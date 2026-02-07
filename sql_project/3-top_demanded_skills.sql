/*
What are the top-paying data analyst jobs?
What skills are required for these top-paying jobs?
What skills are most in demand for data analysts?
Which skills are associated with higher salaries?
What are the most optimal skills to learn?

Question: What are the most in-demand skills for data analysts?
- Join job postings to inner join table similar to query 2
- Identify the top 5 in-demand skills for a data analyst.
- Focus on all job postings.
- Why? Retrieves the top 5 skills with the highest demand in the job market, 
    providing insights into the most valuable skills for job seekers.
*/


SELECT 
    skills.skills,
    COUNT(skills_dim.job_id) AS demand_count
FROM job_postings_fact AS job_posting
INNER JOIN skills_job_dim AS skills_dim ON job_posting.job_id = skills_dim.job_id
INNER JOIN skills_dim AS skills ON skills_dim.skill_id = skills.skill_id
WHERE
    job_title_short = 'Data Engineer'
GROUP BY
    skills.skills
ORDER BY
    demand_count DESC    
LIMIT 10;