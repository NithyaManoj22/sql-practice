SELECT 
  tweet_bucket,
  COUNT(user_id) AS users_num
FROM (
SELECT 
  user_id, count(tweet_id) as tweet_bucket
FROM tweets
  WHERE EXTRACT(year from tweet_date) = '2022'
  GROUP BY user_id) AS inter_table
GROUP BY 1
ORDER BY 1 ASC;