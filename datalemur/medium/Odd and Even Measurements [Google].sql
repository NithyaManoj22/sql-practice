WITH CTE
AS (SELECT 
  *,
  ROW_NUMBER() 
    OVER(PARTITION BY EXTRACT(DAY FROM measurement_time) 
          ORDER BY measurement_time) as row_num
FROM measurements)

SELECT 
  measurement_time::date AS measurement_day,
  SUM(CASE WHEN row_num % 2 <> 0 THEN measurement_value ELSE 0 END) AS odd_sum,
  SUM(CASE WHEN row_num % 2 = 0 THEN measurement_value ELSE 0 END) AS even_sum
FROM CTE
GROUP BY measurement_time::date
ORDER BY 1;