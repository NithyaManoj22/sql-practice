-- Write your MySQL query statement below
-- Good for second highest, but can become complex for 3rd/4th highest

SELECT MAX(salary) as SecondHighestSalary
FROM 
EMPLOYEE 
WHERE salary < (SELECT MAX(salary) from EMPLOYEE)