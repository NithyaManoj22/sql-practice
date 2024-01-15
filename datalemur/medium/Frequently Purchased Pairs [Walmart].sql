WITH purchase_info AS (
  SELECT
    transactions.product_id,
    transactions.transaction_id,
    products.product_name
  FROM transactions
  INNER JOIN products
  	ON transactions.product_id = products.product_id
)

SELECT
	COUNT(*) AS combo_num
FROM
	purchase_info AS p1
INNER JOIN purchase_info AS p2
  ON
	p1.transaction_id = p2.transaction_id
	AND p1.product_id < p2.product_id;