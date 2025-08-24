import sys, pandas as pd, matplotlib.pyplot as plt
csv, out = sys.argv[1], sys.argv[2]
df = pd.read_csv(csv)
plt.figure(figsize=(6,4))
plt.bar(df['plan'], df['customers'])
plt.title("Plan counts"); plt.xlabel("Plan"); plt.ylabel("Customers")
plt.tight_layout(); plt.savefig(out)
print("Saved:", out)
