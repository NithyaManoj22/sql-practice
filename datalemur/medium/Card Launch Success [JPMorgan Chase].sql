WITH sorted 
AS(
  SELECT *,
    ROW_NUMBER() OVER (PARTITION BY card_name ORDER BY issue_year, issue_month) as rw_num
  FROM 
  (
    SELECT *
    FROM monthly_cards_issued
  ) AS t
)

SELECT card_name, issued_amount 
FROM sorted
WHERE rw_num = 1
ORDER BY 2 DESC;