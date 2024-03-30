WITH cte AS (
  SELECT
    pc.caller_id,
    pc.receiver_id,
    ph.country_id AS caller_country,
    ph1.country_id AS receiver_country
  FROM phone_calls pc
  JOIN phone_info ph ON pc.caller_id = ph.caller_id
  JOIN phone_info ph1 ON pc.receiver_id = ph1.caller_id
)

SELECT
  ROUND(100.0*SUM(CASE WHEN caller_country <> receiver_country THEN 1 ELSE 0 END) / COUNT(*),1) AS international_calls_pct
FROM cte