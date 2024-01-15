SELECT
  COUNT(CASE WHEN device_type = 'laptop' THEN user_id END) as laptop_views, 
  COUNT(CASE WHEN device_type = 'tablet' THEN user_id
             WHEN device_type = 'phone' THEN user_id
             ELSE NULL
       END) as mobile_views
FROM 
  viewership;

-- can use SUM() instead of COUNT() if you use 1 or 0