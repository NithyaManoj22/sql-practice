-- Write your MySQL query statement below

SELECT name as Customers
FROM Customers
WHERE Customers.id NOT IN (select customerId from Orders)