import sys, pandas as pd, matplotlib.pyplot as plt
csv, out = sys.argv[1], sys.argv[2]
df = pd.read_csv(csv)
plt.figure(figsize=(6,4))
plt.bar(df['plan'], df['mrr_risky'])
for i,v in enumerate(df['mrr_risky']): plt.text(i, v, f"{int(v):,}", ha='center', va='bottom')
plt.title("MRR at Risk by plan"); plt.xlabel("Plan"); plt.ylabel("MRR at risk")
plt.tight_layout(); plt.savefig(out)
print("Saved:", out)
