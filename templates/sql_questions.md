# SQL 練習 30問
1. 顧客数を数える
2. プラン別の顧客数
3. 月額売上（推定）= monthly_fee の合計
4. プラン別ARPU（平均課金）
5. last_login_days_ago <= 7 の“高アクティブ”人数
6. tickets_last_30d >= 3 の“要ケア”人数
7. months_since_contract >= 12 の“長期顧客”人数
8. active_flag=0 の休眠率
9. プラン別休眠率
10. last_login_days_agoの中央値（近似で平均でも）
11. tickets_last_30d の平均と最大
12. プランをProに限定してARPU
13. 料金>0 の有料顧客数
14. last_login_days_ago を7日刻みでビン分布（CASE式）
15. ヘルススコア（仮）= (CASE WHEN last_login<=7 THEN 60 ELSE 30 END) + (CASE WHEN tickets<=1 THEN 20 ELSE 5 END) + (CASE WHEN months>=12 THEN 20 ELSE 10 END)
16. 上のスコアが80以上の顧客数
17. プラン別にスコア平均
18. スコア上位10人のcustomer_id
19. スコア下位10人のcustomer_id
20. tickets_last_30d=0 かつ last_login<=7 の“優良顧客”人数
21. months_since_contract<=3 の“新規層”人数
22. 新規層のうち休眠の割合
23. プラン遷移の仮説（有料/無料の比率）
24. 有料顧客のうちtickets>=3 の割合
25. last_login>30 の顧客ID一覧
26. ARPUの四分位を算出（近似でNTILEでも）
27. planごとの標準偏差（可能なら）
28. months_since_contract と tickets の相関傾向（集計で確認）
29. スコア80以上かつ有料の人数
30. “今月の重点対応顧客リスト”（上位スコア/要ケアを10件）
