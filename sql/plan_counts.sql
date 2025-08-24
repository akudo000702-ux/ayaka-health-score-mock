SELECT
plan,
COUNT(*) AS customers
FROM customers
GROUP BY plan
ORDER BY customers DESC;
