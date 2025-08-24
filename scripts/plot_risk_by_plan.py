import sys, pandas as pd, matplotlib.pyplot as plt
csv, out = sys.argv[1], sys.argv[2]
df = pd.read_csv(csv)
plt.figure(figsize=(6,4))
plt.bar(df['plan'], df['pct'])
for i,v in enumerate(df['pct']): plt.text(i, v, f"{v:.1f}%", ha='center', va='bottom')
plt.title("Risk rate by plan"); plt.xlabel("Plan"); plt.ylabel("Risk rate (%)")
plt.tight_layout(); plt.savefig(out)
print("Saved:", out)
