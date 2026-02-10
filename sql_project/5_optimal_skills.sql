/*
Question: What are the most optimal skills to learn (aka high demand and high pay)?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles.
- Concentrates on remote positions with specified salaries.
- Why? Targets skills that offer job security (high demand) and financial reward (high salary), 
    offering strategic insights for career development.
*/

WITH skills_demand AS(
    SELECT
        skills.skill_id,
        skills.skills,
        COUNT(skills_dim.job_id) AS demand_count
    FROM job_postings_fact AS job_posting
    INNER JOIN skills_job_dim AS skills_dim ON job_posting.job_id = skills_dim.job_id
    INNER JOIN skills_dim AS skills ON skills_dim.skill_id = skills.skill_id
    WHERE
        job_title_short = 'Data Engineer'
        AND salary_year_avg IS NOT NULL   
    GROUP BY
        skills.skill_id    
), average_salary AS(
    SELECT
        skills.skill_id,
        skills.skills,
        ROUND(AVG(salary_year_avg) , 3) AS avg_salary
    FROM
        job_postings_fact AS job_posting
    INNER JOIN skills_job_dim AS skills_dim ON job_posting.job_id = skills_dim.job_id
    INNER JOIN skills_dim AS skills ON skills_dim.skill_id = skills.skill_id  
    WHERE
        job_title_short = 'Data Engineer' 
        AND salary_year_avg IS NOT NULL   
    GROUP BY
        skills.skill_id    
)   

SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    skills_demand.demand_count,
    average_salary.avg_salary
FROM
    skills_demand
INNER JOIN average_salary ON skills_demand.skill_id = average_salary.skill_id 
WHERE
    demand_count >= 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25;   


-- rewriting this same query more concisely
SELECT
    skills.skill_id,
    job_posting.job_title_short AS job_title,
    skills.skills,
    COUNT(skills_dim.job_id) AS demand_count,
    ROUND(AVG(salary_year_avg) ,3) AS avg_salary
FROM
job_postings_fact AS job_posting
INNER JOIN skills_job_dim AS skills_dim ON job_posting.job_id = skills_dim.job_id
INNER JOIN skills_dim AS skills ON skills_dim.skill_id = skills.skill_id
WHERE
    job_title_short = 'Data Engineer'
    AND salary_year_avg IS NOT NULL
GROUP BY
    skills.skill_id,
    job_posting.job_title_short
HAVING
    COUNT(skills_dim.job_id) >= 10    
ORDER BY 
    avg_salary DESC,
    demand_count DESC
LIMIT 25;            


