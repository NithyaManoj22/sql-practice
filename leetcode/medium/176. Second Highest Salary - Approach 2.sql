-- Write your MySQL query statement below
-- Using CTE and Window fuction - NTH_VALUE
-- RETURNS Null if window is smaller than N
-- Need to GROUP BY salary because it doesn't remove duplicates - will give wrong answer for 100,100
-- IFNULL = Return the specified value IF the expression is NULL, otherwise return the expression

WITH cte
AS
(SELECT NTH_VALUE(salary, 2) OVER(order by salary DESC) as SecondHighestSalary
FROM Employee 
GROUP BY salary
)

SELECT IFNULL((SELECT DISTINCT(SecondHighestSalary) FROM cte WHERE SecondHighestSalary IS NOT NULL), NULL) AS SecondHighestSalary