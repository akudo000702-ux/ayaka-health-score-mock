SELECT
customer_id, plan, monthly_fee
tickets_last_30d, last_login_days_ago, active_flag,
CASE WHEN last_login_days_ago>=30 THEN 5 ELSE 0 END
+ CASE WHEN active_flag=0 THEN 5 ELSE 0 END AS risk_score
FROM customers
ORDER BY risk_score DESC, monthly_fee DESC, customer_id
LIMIT 10;
