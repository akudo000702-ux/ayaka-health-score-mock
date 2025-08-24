WITH raw AS (
  SELECT customer_id, plan, monthly_fee, tickets_last_30d, last_login_days_ago, active_flag
  FROM customers
),
norm AS (
  SELECT
    customer_id, plan, monthly_fee, tickets_last_30d, last_login_days_ago, active_flag,
    MIN(tickets_last_30d,10)/10.0 AS engagement,
    CASE
      WHEN last_login_days_ago >= 30 THEN 0
      WHEN last_login_days_ago <= 0  THEN 1
      ELSE 1 - (last_login_days_ago/30.0)
    END AS recency,
    CASE WHEN active_flag=1 THEN 1 ELSE 0 END AS active
  FROM raw
),
scored AS (
  SELECT
    customer_id, plan, monthly_fee, tickets_last_30d, last_login_days_ago, active_flag,
    ROUND(100.0*(0.5*engagement + 0.4*recency + 0.1*active)) AS score
  FROM norm
)
SELECT
  customer_id, plan, monthly_fee, score,
  tickets_last_30d, last_login_days_ago, active_flag
FROM scored
WHERE monthly_fee > 0              -- 収益インパクトを優先
ORDER BY score ASC, monthly_fee DESC
LIMIT 10;
