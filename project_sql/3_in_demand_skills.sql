/*
Focuses on the most frequently mentioned skills in job listings. Skills such as SQL, 
Python, and Excel dominate the list, making them essential competencies for job seekers 
aiming to stay competitive in the field.
*/

WITH RankedSkills AS (
SELECT 
  skills,
  COUNT(sjd.job_id) AS demand_count,
  RANK() OVER (ORDER BY COUNT(sjd.job_id) DESC) AS ranking
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd ON sjd.skill_id = sd.skill_id
WHERE
	job_title_short = 'Data Analyst' 
	AND job_country IN ('Singapore', 'Hong Kong', 'Thailand',
  'Philippines', 'Japan', 'Taiwan', 'China',
  'South Korea', 'Australia', 'New Zealand')
GROUP BY skills
)

SELECT *
FROM RankedSkills
WHERE ranking <= 5
ORDER BY ranking;

/*
----- RESULTS -----
[
  {
    "skills": "sql",
    "demand_count": "7361",
    "ranking": "1"
  },
  {
    "skills": "excel",
    "demand_count": "5641",
    "ranking": "2"
  },
  {
    "skills": "python",
    "demand_count": "5327",
    "ranking": "3"
  },
  {
    "skills": "tableau",
    "demand_count": "4060",
    "ranking": "4"
  },
  {
    "skills": "power bi",
    "demand_count": "3180",
    "ranking": "5"
  }
]
*/