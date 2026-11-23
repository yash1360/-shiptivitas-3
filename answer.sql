
-- TYPE YOUR SQL QUERY BELOW

-- PART 1: Create a SQL query that maps out the daily average users before and after the feature change
-- Kanban board released on 2018-06-02 (unix timestamp 1527897600)

-- 1a. Daily active users over time (data for the line graph)
SELECT DATE(login_timestamp, 'unixepoch') AS day,
       COUNT(DISTINCT user_id) AS daily_active_users
FROM login_history
GROUP BY day
ORDER BY day;

-- 1b. Average daily users before vs. after the release
SELECT CASE WHEN day < '2018-06-02' THEN 'before' ELSE 'after' END AS period,
       ROUND(AVG(dau), 2) AS avg_daily_users
FROM (
  SELECT DATE(login_timestamp, 'unixepoch') AS day,
         COUNT(DISTINCT user_id) AS dau
  FROM login_history
  GROUP BY day
)
GROUP BY period;

-- PART 2: Create a SQL query that indicates the number of status changes by card
SELECT c.id AS card_id,
       c.name AS card_name,
       COUNT(h.id) AS status_changes
FROM card_change_history h
JOIN card c ON c.id = h.card_id
GROUP BY c.id, c.name
ORDER BY status_changes DESC;
-- PART 2: Create a SQL query that indicates the number of status changes by card





