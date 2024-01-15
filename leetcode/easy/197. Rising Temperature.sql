-- Write your MySQL query statement below
SELECT t.id
FROM
    (SELECT w.*, 
    LAG(temperature, 1) OVER (order by recordDate) as prev_temp,
    LAG(recordDate, 1) OVER (order by recordDate) as prev_recordDate

    FROM Weather w) as t
WHERE t.temperature > t.prev_temp
AND DATEDIFF(t.recordDate, t.prev_recordDate) = 1