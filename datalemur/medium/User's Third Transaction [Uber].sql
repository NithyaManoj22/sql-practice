SELECT user_id, spend, transaction_date
FROM
  (SELECT *, 
    RANK() OVER(PARTITION BY user_id ORDER BY transaction_date) as t_id
  FROM 
    transactions) as ranked
WHERE ranked.t_id = 3;