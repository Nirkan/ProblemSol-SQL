
-- Q1. Write a SQL query to count the number of unique users per day who logged in from both iPhone and web, where iPhone and web logs are in distinct relations.

-- Assumptions iphone: ts | userid | iphone_sessionid
--             web   : ts | userid | web_sessionid


-- 1) join
-- 2) Mathing by day and user id
-- 3) Group by day and count num_users

SELECT DATE_TRUNC('day', i.ts) AS day,
COUNT(DISTINCT i.userid) AS num_users
FROM iphone i
JOIN web w
	ON i.userid = w.userid
	AND DATE_TRUNC('day', i.ts) = DATE_TRUNC('day', w.ts)
GROUP BY 1
