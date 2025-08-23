# Health Score Dashboard (Mock)

このリポジトリは、SaaSのカスタマーサクセスで使う**顧客ヘルススコア**の仮想ダッシュボードです。  
SQL・Python（またはApps Script）・可視化の**軽い技術スタック**で作ります。

## 目的
- データを使って「解約リスクの早期検知」を再現
- 30-60-90日プランの“30日でやること”をデモ

## 使う技術
- **SQL**：集計（継続率・利用頻度・問い合わせ）
- **Python / Google Apps Script**：データ整形・API連携のモック
- **GitHub**：成果物を公開

## データ
- `templates/sql_practice.csv`：顧客ID、プラン、料金、ログイン日数、問い合わせ件数などの簡易データ

## 実行（例：Python）
```bash
python scripts/health_score_mock.py templates/sql_practice.csv
```

## 成果の見せ方（READMEに貼る）
- 指標の定義（例：最終ログイン日、問い合わせ頻度、プラン別ARPU）
- “ヘルススコア”の計算式（例：0-100点）
- スクリーンショット（ローカルでOK）
