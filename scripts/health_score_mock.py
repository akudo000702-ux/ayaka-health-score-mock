import sys, pandas as pd

def score_row(r):
  s = 0
  s += 60 if r['last_login_days_ago'] <= 7 else 30
  s += 20 if r['tickets_last_30d'] <= 1 else 5
  s += 20 if r['months_since_contract'] >= 12 else 10
  return min(s, 100)

if __name__ == '__main__':
  csv = sys.argv[1] if len(sys.argv) > 1 else 'templates/sql_practice.csv'
  df = pd.read_csv(csv)
  df['health_score'] = df.apply(score_row, axis=1)
  print(df[['customer_id','plan','health_score']].head(10).to_string(index=False))
