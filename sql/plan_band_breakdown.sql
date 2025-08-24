WITH scores AS (
  SELECT
    customer_id,
    plan,
    monthly_fee,
    tickets_last_30d,
    last_login_days_ago,
    active_flag,
    -- 各要素
    CASE WHEN tickets_last_30d <= 10 THEN 1.0 - tickets_last_30d/10.0 ELSE 0 END AS engagement,
    CASE WHEN last_login_days_ago <= 30 THEN 1.0 - last_login_days_ago/30.0 ELSE 0 END AS recency,
    CASE WHEN active_flag=1 THEN 1.0 ELSE 0 END AS active,
    -- 100点満点のスコア
    ROUND(100.0 * (
        0.6 * (CASE WHEN tickets_last_30d <= 10 THEN 1.0 - tickets_last_30d/10.0 ELSE 0 END) +
        0.4 * (CASE WHEN last_login_days_ago <= 30 THEN 1.0 - last_login_days_ago/30.0 ELSE 0 END) +
        0.1 * (CASE WHEN active_flag=1 THEN 1.0 ELSE 0 END)
    )) AS score
  FROM customers
),
banded AS (
  SELECT
    plan,
    CASE
      WHEN score >= 80 THEN 'Green'
      WHEN score >= 60 THEN 'Amber'
      ELSE 'Red'
    END AS band
  FROM scores
)
SELECT
  plan,
  SUM(CASE WHEN band='Green' THEN 1 ELSE 0 END) AS green,
  SUM(CASE WHEN band='Amber' THEN 1 ELSE 0 END) AS amber,
  SUM(CASE WHEN band='Red'   THEN 1 ELSE 0 END) AS red
FROM banded
GROUP BY plan
ORDER BY CASE plan WHEN 'Free' THEN 1 WHEN 'Basic' THEN 2 WHEN 'Pro' THEN 3 ELSE 4 END;
