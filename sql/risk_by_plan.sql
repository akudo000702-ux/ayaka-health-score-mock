SELECT
plan,
COUNT(*) AS total,
SUM(CASE WHEN last_login_days_ago>=30 OR active_flag=0 THEN 1 ELSE 0 END) AS risky,
ROUND(100.0 * SUM(CASE WHEN last_login_days_ago>=30 OR active_flag=0 THEN 1 ELSE 0 END) / COUNT(*), 1) AS pct,
SUM(CASE WHEN last_login_days_ago>=30 OR active_flag=0 THEN monthly_fee ELSE 0 END) AS mrr_risky
FROM customers
GROUP BY plan
ORDER BY pct DESC;
