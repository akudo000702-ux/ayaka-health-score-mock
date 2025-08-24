DB        ?= day6.db
SQL_DIR   := sql
OUT_DIR   := outputs
SCRIPTS   := scripts

.PHONY: all csvs charts clean
all: charts

# 出力ディレクトリ
$(OUT_DIR):
	mkdir -p $@

# *.sql -> *.csv
$(OUT_DIR)/%.csv: $(SQL_DIR)/%.sql | $(OUT_DIR)
	sqlite3 -header -csv $(DB) < $< > $@

# *.csv + scripts/plot_%.py -> *.png
$(OUT_DIR)/%.png: $(OUT_DIR)/%.csv $(SCRIPTS)/plot_%.py
	python3 $(SCRIPTS)/plot_$*.py $< $@

# 必要に応じて増やせばOK
csvs: \
	$(OUT_DIR)/plan_counts.csv \
	$(OUT_DIR)/risk_by_plan.csv \
	$(OUT_DIR)/risk_by_plan_mrr.csv \
	$(OUT_DIR)/plan_band_breakdown.csv

charts: \
	$(OUT_DIR)/plan_counts.png \
	$(OUT_DIR)/risk_by_plan.png \
	$(OUT_DIR)/risk_by_plan_mrr.png \
	$(OUT_DIR)/plan_band_stacked.png

clean:
	rm -f $(OUT_DIR)/*.csv $(OUT_DIR)/*.png
$(OUT_DIR)/risk_by_plan_mrr.csv: $(OUT_DIR)/risk_by_plan.csv | $(OUT_DIR)
	cat $< > $@
# risk_by_plan_mrr.csv は risk_by_plan.csv と同じ内容でOK
$(OUT_DIR)/risk_by_plan_mrr.csv: $(OUT_DIR)/risk_by_plan.csv | $(OUT_DIR)
	cat $< > $@
