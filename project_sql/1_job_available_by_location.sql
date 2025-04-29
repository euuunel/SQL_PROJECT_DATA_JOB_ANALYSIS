/*
Highlights job availability by country, revealing that Japan, Singapore, 
and Australia are the top three countries with the highest number of job 
postings for data analyst roles. This reflects strong demand in both advanced 
economies and tech-forward markets. 
*/

SELECT
	job_country,                      -- Location of the job
	COUNT(job_country) as job_count   -- Count of the job per country
FROM job_postings_fact
WHERE job_country IN ('Singapore', 'Hongkong', 'Thailand',
'Philippines', 'Japan', 'Taiwan', 'China','South Korea', 
'Australia', 'New Zealand')
GROUP BY job_country
ORDER BY job_count DESC;

/* 
----- RESULTS -----
[
  {
    "job_country": "Singapore",
    "job_count": "23702"
  },
  {
    "job_country": "Australia",
    "job_count": "12966"
  },
  {
    "job_country": "Philippines",
    "job_count": "11788"
  },
  {
    "job_country": "Thailand",
    "job_count": "4160"
  },
  {
    "job_country": "China",
    "job_count": "2569"
  },
  {
    "job_country": "New Zealand",
    "job_count": "2462"
  },
  {
    "job_country": "Japan",
    "job_count": "2078"
  },
  {
    "job_country": "South Korea",
    "job_count": "1686"
  },
  {
    "job_country": "Taiwan",
    "job_count": "1495"
  }
]
*/