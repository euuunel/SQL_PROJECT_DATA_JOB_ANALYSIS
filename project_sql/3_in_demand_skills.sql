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
	AND job_country IN ('Singapore', 'Hongkong', 'Thailand',
                        'Philippines', 'Japan', 'Taiwan', 'China',
                        'South Korea', 'Australia', 'New Zealand')
GROUP BY
	skills
)

SELECT *
FROM RankedSkills
WHERE ranking <= 5
ORDER BY ranking;

/*
Here's the breakdown of the most demanded skills for data analysts in 2023
SQL and Excel remain fundamental, emphasizing the need for strong foundational skills in data processing and spreadsheet manipulation.
Programming and Visualization Tools like Python, Tableau, and Power BI are essential, pointing towards the increasing importance of technical skills in data storytelling and decision support.

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