-- Write your MySQL query statement below
-- Using CTE and Window fuction - DENSE_RANK() / Simpler than using NTH_VALUE
-- DENSE_RANK() will not skip a rank if duplicate is found unlike RANK()
-- No Need to GROUP BY salary like we did in NTH_VALUE
-- IFNULL = Return the specified value IF the expression is NULL, otherwise return the expression

WITH cte
AS
(SELECT *, DENSE_RANK() OVER(order by salary DESC) as sal_rank
FROM Employee
)

SELECT IFNULL((SELECT DISTINCT(salary) FROM cte WHERE sal_rank = 2), NULL) AS SecondHighestSalary