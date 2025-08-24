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
    customer_id, plan, monthly_fee,
    ROUND(100.0*(0.5*engagement + 0.4*recency + 0.1*active)) AS score
  FROM norm
),
banded AS (
  SELECT *,
    CASE
      WHEN score >= 80 THEN 'Green'
      WHEN score >= 60 THEN 'Amber'
      ELSE 'Red'
    END AS band
  FROM scored
)
SELECT
  band,
  COUNT(*) AS customers,
  ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM banded), 1) AS pct,
  SUM(CASE WHEN monthly_fee>0 THEN monthly_fee ELSE 0 END)   AS mrr
FROM banded
GROUP BY band
ORDER BY CASE band WHEN 'Green' THEN 1 WHEN 'Amber' THEN 2 ELSE 3 END;
