/*
Identifies companies offering the most lucrative roles, with firms like Meta, 
SmartAsset, and AT&T leading in average salary offerings—some reaching above 
$650,000 per year, especially for remote positions.
*/

SELECT
    jpf.job_title_short,                  -- Short title of the job
    jpf.job_country,                      -- Location of the job
    jpf.job_schedule_type,                -- Schedule type (Full-time)
    jpf.salary_year_avg,                  -- Average yearly salary
    cd.name AS company_name               -- Company name
FROM job_postings_fact AS jpf
LEFT JOIN company_dim AS cd 
    ON jpf.company_id = cd.company_id
WHERE 
    jpf.job_title_short = 'Data Analyst' 
    AND jpf.job_country IN ('Singapore', 'Hongkong', 'Thailand',
                        'Philippines', 'Japan', 'Taiwan', 'China',
                        'South Korea', 'Australia', 'New Zealand')
    AND jpf.salary_year_avg IS NOT NULL
    AND jpf.job_schedule_type = 'Full-time'
GROUP BY 
    jpf.job_title_short, 
    jpf.job_country, 
    jpf.job_schedule_type, 
    jpf.salary_year_avg, 
    cd.name
ORDER BY jpf.salary_year_avg DESC;


/*
----- RESULTS -----
[
  {
    "job_title_short": "Data Analyst",
    "job_country": "Taiwan",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "180000.0",
    "company_name": "Anaxyn Project"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "South Korea",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "177000.0",
    "company_name": "Lunit"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Thailand",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "company_name": "Agoda"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Thailand",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "company_name": "Capco"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Singapore",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "149653.0",
    "company_name": "Bosch Group"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "South Korea",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "149653.0",
    "company_name": "Lunit"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Australia",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "135000.0",
    "company_name": "Perigon Group"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "South Korea",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "118640.0",
    "company_name": "Coupang"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Australia",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "118500.0",
    "company_name": "DoorDash"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "South Korea",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111202.0",
    "company_name": "Coupang"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Japan",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "company_name": "Amazon.com"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Japan",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "company_name": "SquareTrade"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Philippines",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "company_name": "Canva"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Philippines",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "company_name": "Curated"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Philippines",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "company_name": "Dialpad"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Philippines",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "company_name": "iOPEX"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Philippines",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "company_name": "Pilmico Foods Corporation"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Philippines",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "company_name": "Trusting Social"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Singapore",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "company_name": "2K"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Singapore",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "company_name": "ADDX"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Singapore",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "company_name": "Adyen"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Singapore",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "company_name": "FiscalNote"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "South Korea",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "company_name": "Coupang"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Taiwan",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "company_name": "Coupang"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Taiwan",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "company_name": "Visa"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Thailand",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "company_name": "Agoda"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Thailand",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "company_name": "Sertis"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Philippines",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "109500.0",
    "company_name": "AECOM"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Singapore",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "109500.0",
    "company_name": "Jane Street"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Japan",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "105000.0",
    "company_name": "Publicis Groupe"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Singapore",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "105000.0",
    "company_name": "ADDX"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "New Zealand",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "102500.0",
    "company_name": "Octopus Energy"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "New Zealand",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "102500.0",
    "company_name": "Xero"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Australia",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "100500.0",
    "company_name": "Entain"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "New Zealand",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "100500.0",
    "company_name": "PikPok"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Philippines",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "100500.0",
    "company_name": "Angkas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Philippines",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "100500.0",
    "company_name": "Thunes"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Philippines",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "100500.0",
    "company_name": "Truphone"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Singapore",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "100500.0",
    "company_name": "Shield"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Singapore",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "100500.0",
    "company_name": "Triton AI Pte Ltd"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Japan",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "98500.0",
    "company_name": "Mintel"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Singapore",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "98500.0",
    "company_name": "Potato Play Pte. Ltd."
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Singapore",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "98500.0",
    "company_name": "Terrascope"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Thailand",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "98500.0",
    "company_name": "Agoda"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "South Korea",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "94034.5",
    "company_name": "Lunit"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Singapore",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "93600.0",
    "company_name": "Binance"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "South Korea",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "93600.0",
    "company_name": "NielsenIQ"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Philippines",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "89204.0",
    "company_name": "SupportNinja"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Singapore",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "89204.0",
    "company_name": "Ninja Van"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Taiwan",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "89204.0",
    "company_name": "Assembly"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Japan",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "79200.0",
    "company_name": "Amazon.com"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "New Zealand",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "79200.0",
    "company_name": "Contact Energy"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Singapore",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "79200.0",
    "company_name": "OKX"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Singapore",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "79200.0",
    "company_name": "Verisk"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Taiwan",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "79200.0",
    "company_name": "Appier"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Thailand",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "79200.0",
    "company_name": "Bosch Group"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Thailand",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "79200.0",
    "company_name": "Sertis"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Philippines",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "77017.5",
    "company_name": "Visa"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Singapore",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "75000.0",
    "company_name": "KodeKloud"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Singapore",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "72525.0",
    "company_name": "OKX"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Taiwan",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "72500.0",
    "company_name": "NielsenIQ"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Philippines",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "72000.0",
    "company_name": "Fluence"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Singapore",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "72000.0",
    "company_name": "Aspire"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Taiwan",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "70500.0",
    "company_name": "NielsenIQ"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "China",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "68590.5",
    "company_name": "Minnesota Pollution Control Agency"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Philippines",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "64800.0",
    "company_name": "Angkas"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Singapore",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "64800.0",
    "company_name": "OKX"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Taiwan",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "64800.0",
    "company_name": "StubHub"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Australia",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "57500.0",
    "company_name": "Sodexo"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Philippines",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "57500.0",
    "company_name": "IQ-EQ"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Philippines",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "57500.0",
    "company_name": "SGS"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Singapore",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "57500.0",
    "company_name": "OKX"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Singapore",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "57500.0",
    "company_name": "Ubisoft"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Philippines",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "53014.0",
    "company_name": "SGS"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "New Zealand",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "51014.0",
    "company_name": "Meridian Energy"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Philippines",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "51014.0",
    "company_name": "SGS"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "New Zealand",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "50400.0",
    "company_name": "Contact Energy"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Philippines",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "50400.0",
    "company_name": "Pilmico Foods Corporation"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Philippines",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "50400.0",
    "company_name": "Security Bank"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Singapore",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "48598.5",
    "company_name": "OKX"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Philippines",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "45000.0",
    "company_name": "SGS"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Singapore",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "45000.0",
    "company_name": "Publicis Groupe"
  },
  {
    "job_title_short": "Data Analyst",
    "job_country": "Philippines",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "25920.0",
    "company_name": "Airbus"
  }
]
*/