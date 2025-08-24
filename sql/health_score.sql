WITH raw AS (
  SELECT customer_id, plan, monthly_fee, tickets_last_30d, last_login_days_ago, active_flag
  FROM customers),
norm AS (
  SELECT
    customer_id, plan, monthly_fee, tickets_last_30d, last_login_days_ago, active_flag,
    -- 0..1 に正規化（上限10件）
    MIN(tickets_last_30d, 10) / 10.0                              AS engagement,
    -- 0日=1, 30日=0 で線形
    CASE
      WHEN last_login_days_ago >= 30 THEN 0
      WHEN last_login_days_ago <= 0  THEN 1
      ELSE 1 - (last_login_days_ago / 30.0)
    END                                                          AS recency,
    CASE WHEN active_flag = 1 THEN 1 ELSE 0 END                  AS active
  FROM raw
),
scored AS (
  SELECT
    customer_id, plan, monthly_fee, tickets_last_30d, last_login_days_ago, active_flag,
    ROUND(100.0 * (0.5*engagement + 0.4*recency + 0.1*active))   AS score
  FROM norm
)
SELECT
  s.customer_id, s.plan, s.monthly_fee, s.tickets_last_30d, s.last_login_days_ago, s.active_flag,
  s.score,
  CASE
    WHEN s.score >= 80 THEN 'Green'
    WHEN s.score >= 60 THEN 'Amber'
    ELSE 'Red'
  END AS band
FROM scored s
ORDER BY s.score DESC, s.monthly_fee DESC;
