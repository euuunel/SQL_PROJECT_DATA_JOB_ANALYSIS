SELECT
    CASE 
        WHEN job_work_from_home = TRUE THEN 'Remote'
        ELSE 'On-site'
    END AS work_arrangement,
    COUNT(job_id) AS job_count
FROM job_postings_fact
WHERE 
    job_title_short = 'Data Analyst'
    AND job_country IN ('Singapore', 'Hongkong', 'Thailand',
                        'Philippines', 'Japan', 'Taiwan', 'China',
                        'South Korea', 'Australia', 'New Zealand')
GROUP BY 
    CASE 
        WHEN job_work_from_home = TRUE THEN 'Remote'
        ELSE 'On-site'
    END
ORDER BY 
    job_count DESC;


/*
Here's a breakdown of the results for top paying skills for Data Analysts:
- High Demand for Big Data & ML Skills: Top salaries are commanded by analysts skilled in big data technologies (PySpark, Couchbase), machine learning tools (DataRobot, Jupyter), and Python libraries (Pandas, NumPy), reflecting the industry's high valuation of data processing and predictive modeling capabilities.
- Software Development & Deployment Proficiency: Knowledge in development and deployment tools (GitLab, Kubernetes, Airflow) indicates a lucrative crossover between data analysis and engineering, with a premium on skills that facilitate automation and efficient data pipeline management.
- Cloud Computing Expertise: Familiarity with cloud and data engineering tools (Elasticsearch, Databricks, GCP) underscores the growing importance of cloud-based analytics environments, suggesting that cloud proficiency significantly boosts earning potential in data analytics.

[
  {
    "work_arrangement": "On-site",
    "job_count": "15385"
  },
  {
    "work_arrangement": "Remote",
    "job_count": "989"
  }
]
*/