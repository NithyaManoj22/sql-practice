WITH pct_table AS (
  SELECT 
    ab.age_bucket,
    SUM(
      CASE 
        WHEN activity_type = 'send' THEN time_spent ELSE 0
      END) AS sending_time,
    SUM(
      CASE 
        WHEN activity_type = 'open' THEN time_spent ELSE 0
      END) AS opening_time
    FROM activities a
  LEFT JOIN age_breakdown ab ON a.user_id = ab.user_id
  GROUP BY ab.age_bucket
)

SELECT
  age_bucket,
  ROUND(100.0*sending_time/(sending_time+opening_time),2) AS send_perc,
  ROUND(100.0*opening_time/(sending_time+opening_time),2) AS open_perc
FROM pct_table;