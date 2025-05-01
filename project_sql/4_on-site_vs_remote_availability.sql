/*
Compares work formats, showing a strong presence of remote-friendly roles, which 
reflects a growing trend in job flexibility for data professionals across the region.
*/

SELECT 
    job_country AS country,
    COUNT(CASE WHEN job_work_from_home = FALSE THEN job_id END) AS on_site,
    COUNT(CASE WHEN job_work_from_home = TRUE THEN job_id END) AS remote
FROM job_postings_fact
WHERE 
    job_title_short = 'Data Analyst' AND
    job_country IN ('Singapore', 'Hongkong', 'Thailand',
    'Philippines', 'Japan', 'Taiwan', 'China',
    'South Korea', 'Australia', 'New Zealand')
GROUP BY job_country
ORDER BY country;


/*
----- RESULTS -----
[
  {
    "country": "Australia",
    "on_site": "1507",
    "remote": "153"
  },
  {
    "country": "India",
    "on_site": "5083",
    "remote": "1050"
  },
  {
    "country": "Japan",
    "on_site": "340",
    "remote": "42"
  },
  {
    "country": "Malaysia",
    "on_site": "2486",
    "remote": "42"
  },
  {
    "country": "Philippines",
    "on_site": "4164",
    "remote": "606"
  },
  {
    "country": "Singapore",
    "on_site": "6579",
    "remote": "63"
  },
  {
    "country": "South Korea",
    "on_site": "330",
    "remote": "5"
  }
]
*/