Select u.city,COUNT(t.order_id) as total_orders
  from trades t
  LEFT JOIN users u
    ON t.user_id = u.user_id
  where t.status = 'Completed'
  GROUP BY u.city
  ORDER BY total_orders DESC
  LIMIT 3;