SELECT 
  ROUND(CAST(COUNT(t.email_id) AS DECIMAL)/COUNT(DISTINCT em.user_id),2) AS confirm_rate
FROM  emails em
LEFT JOIN texts t
  ON em.email_id = t.email_id
  AND signup_action = 'Confirmed';