WITH cte1 AS (
  SELECT 
      category,
      product,
      SUM(spend) AS total_spend
    FROM product_spend
  WHERE EXTRACT(YEAR FROM transaction_date) = 2022
  GROUP BY category,product
  ORDER BY category
)

SELECT
  category,
  product,
  total_spend
FROM (
  SELECT 
      *,
      ROW_NUMBER() OVER(PARTITION BY category ORDER BY total_spend DESC) AS rnk
  FROM cte1
) AS C
WHERE rnk < 3
