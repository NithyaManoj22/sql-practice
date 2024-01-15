SELECT customer_id
FROM customer_contracts cc
LEFT JOIN products p
ON cc.product_id = p.product_id
GROUP BY customer_id
HAVING COUNT(DISTINCT p.product_category) = 3;