WITH cte1 AS (
  SELECT
    transaction_date,
    product_id,
    user_id
  FROM (
    SELECT
      user_id,
      transaction_date,
      product_id,
      RANK() OVER(PARTITION BY user_id ORDER BY transaction_date DESC) AS rnk
    FROM 
      user_transactions
  ) AS sub
  WHERE rnk = 1
)

SELECT
    transaction_date,
    user_id,
    COUNT(product_id) AS purchase_count
FROM cte1
  GROUP BY transaction_date, user_id
  ORDER BY transaction_date