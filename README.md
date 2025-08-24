# Health Score Mock

Day1–4 done.

## What I did
- Day1–4: CSV集計/UNIXコマンド/API/デバッグ

## How to run
python3 scripts/python_api_example.py

## Plan breakdown
![Plan counts](./plan_counts.png)

## Risk by plan

![Risk by plan](outputs/risk_by_plan.png)

## MRR at Risk by plan

![MRR at Risk by plan](outputs/risk_by_plan_mrr.png)
- リスク判定：30日以上未ログイン **または** 非アクティブ（active_flag=0）
- MRR at Risk：リスク顧客の月額合計
- プラン構成：Basic 23 / Free 20 / Pro 7（計50）
- 月額売上（推定）：199,000円
- リスク率：Pro 85.7%（6/7）／Basic 56.5%（13/23）／Free 40.0%（8/20）
- MRR at Risk：Pro 72,000円／Basic 65,000円／Free 0円
- プラン構成：**plan_counts.png**
- リスク率：**outputs/risk_by_plan.png**
- リスクMRR：**outputs/risk_by_plan_mrr.png**
- Proはリスク率・金額インパクトとも最大 → 最優先でフォロー導線（休眠前の接点強化）
- Basicは件数多め → アクティブ化施策の標準化（メール・FAQ・オンボ動画）
- Freeは影響小：上位プランへの導線テストを小さく回す

## 可視化
![Plan counts](plan_counts.png)
![Risk rate](outputs/risk_by_plan.png)
![MRR at Risk](outputs/risk_by_plan_mrr.png)
