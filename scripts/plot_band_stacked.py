import sys, pandas as pd, matplotlib.pyplot as plt
csv, out = sys.argv[1], sys.argv[2]
df = pd.read_csv(csv)
plt.figure(figsize=(6,4))
p1 = plt.bar(df['plan'], df['green'], label='Green')
p2 = plt.bar(df['plan'], df['amber'], bottom=df['green'], label='Amber')
p3 = plt.bar(df['plan'], df['red'],   bottom=df['green']+df['amber'], label='Red')
plt.legend(); plt.title("Band distribution by plan")
plt.xlabel("Plan"); plt.ylabel("Customers")
plt.tight_layout(); plt.savefig(out)
print("Saved:", out)
