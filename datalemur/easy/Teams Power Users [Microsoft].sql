SELECT sender_id, COUNT(*) as message_count
FROM messages
WHERE EXTRACT(MONTH FROM sent_date)  = '8' AND EXTRACT(YEAR FROM sent_date) = '2022'
GROUP BY sender_id
ORDER BY COUNT(*) DESC
LIMIT 2;