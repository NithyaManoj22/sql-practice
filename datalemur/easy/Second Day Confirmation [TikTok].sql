SELECT e.user_id 
FROM emails e
JOIN texts t
  ON e.email_id = t.email_id
WHERE signup_action = 'Confirmed' AND 
  (DATE_PART('day',action_date::date) - DATE_PART('day',signup_date::date)) = 1;