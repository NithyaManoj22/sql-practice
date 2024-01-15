SELECT COUNT(DISTINCT jb.company_id) AS co_w_duplicate_jobs
FROM (
  SELECT company_id, title, description, COUNT(DISTINCT job_id) AS job_count
  FROM job_listings
  GROUP BY company_id, title, description
  HAVING COUNT(DISTINCT job_id) > 1) AS jb;