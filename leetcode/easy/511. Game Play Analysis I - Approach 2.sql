-- Write your MySQL query statement below

SELECT DISTINCT player_id,
FIRST_VALUE(event_date) OVER (partition by player_id order by event_date) as first_login
FROM Activity