# Fraud Detection & Risk Analysis

A financial fraud detection project using Python, SQL, and Power BI to identify suspicious transaction patterns, engineer fraud signals, score risk levels, and visualize findings through an interactive multi-page dashboard.

**Author:** Ashwin Suryawanshi

---

## Files in This Repository

| File | Description |
|------|-------------|
| `fraud_detection_analysis.ipynb` | Python notebook — 8 data cleaning steps, 10 Plotly charts, fraud signal engineering |
| `Fraud_Project.sql` | SQL script — table schema creation and exploratory queries |
| `Fraud_Project.pbix` | Interactive Power BI dashboard (3 pages) |
| `Fraud_Project.pdf` | Exported Power BI dashboard with all charts and KPIs |

---

## Tools & Technologies

- **Python** — Pandas, NumPy, Plotly Express, Plotly Graph Objects
- **SQL** — MySQL (table creation, row count validation, data preview)
- **Power BI** — KPI cards, chargeback trend charts, risk segmentation, merchant analysis
- **Jupyter Notebook** — Google Colab

---

## Dataset

**3,199 financial transactions** with the following columns:

| Column | Type | Description |
|--------|------|-------------|
| `transaction_id` | BIGINT | Unique transaction identifier |
| `merchant_id` | BIGINT | Merchant involved |
| `user_id` | BIGINT | Customer making the payment |
| `card_number` | VARCHAR(30) | Card used |
| `transaction_date` | DATETIME | Timestamp of transaction |
| `transaction_amount` | DECIMAL(10,2) | Value in R$ |
| `device_id` | VARCHAR(30) | Device used (nullable) |
| `has_cbk` | VARCHAR(5) | Chargeback flag — TRUE / FALSE |

---

## Data Cleaning (8 Steps)

| Step | Action |
|------|--------|
| Fix 1 | Parse `transaction_date` to datetime |
| Fix 2 | Standardize `has_cbk` to uppercase (strip whitespace) |
| Fix 3 | Convert `is_fraud` to boolean |
| Fix 4 | Flag missing `device_id` as `missing_device` column (keep nulls) |
| Fix 5 | Extract time features: `hour`, `date`, `weekday`, `month` |
| Fix 6 | Remove duplicate `transaction_id` rows |
| Fix 7 | Set correct numeric dtypes for `transaction_amount`, `user_id`, `merchant_id`, `transaction_id` |
| Fix 8 | Order `risk_label` as categorical: Low → Medium → High |

---

## Fraud Signal Engineering

Five fraud detection signals built in the notebook:

| Signal | Logic |
|--------|-------|
| **Velocity abuse** | Same user transacting within under 5 minutes — card testing behaviour |
| **Multi-card users** | Users using more than 1 unique card — cycling through stolen cards |
| **Shared card detection** | Same card used by multiple `user_id`s — impossible for legitimate use |
| **Night-hour transactions** | Transactions between 21:00–03:00 — higher CBK rate window |
| **High-value monitoring** | Transactions above R$ 2,775 (95th percentile threshold) |

---

## Charts in the Notebook (10 total)

| # | Chart | Type | Key Finding |
|---|-------|------|-------------|
| 1 | Fraud vs Clean split | Donut (Plotly) | 12.22% CBK rate overall |
| 2 | CBK rate by hour of day | Dual-axis bar + line | Hour 6 AM peaks at ~45% CBK rate |
| 3 | Suspect users — multi-card profile | Dual horizontal bar | Top users have 81–93% chargeback rates |
| 4 | Risk label analysis | 3-panel bar | High risk = 95% CBK; Low risk = 10% CBK |
| 5 | High-risk merchants (CBK ≥ 30%) | Horizontal bar | 12 merchants with 100% CBK rate identified |
| 6 | Transaction amount distribution | Overlapping histogram | Fraud transactions cluster near 95th percentile (R$2,775) |
| 7 | Shared card fraud network | Bar chart | Cards shared across users — all show elevated CBK |
| 8 | Velocity abuse scatter | Scatter (Plotly) | Fraud transactions clustered under 1-minute gap |
| 9 | Fraud pattern by day of week | Dual-axis bar + line | Wednesday has highest CBK rate |
| 10 | Full summary dashboard | 2×3 subplot grid | All 5 fraud signals visualized in one view |

---

## Key Insights

- **12.22% overall CBK rate** — 391 chargebacks out of 3,199 transactions
- **R$ 568,350 total amount at risk** from flagged high-risk transactions
- **Hour 6 AM** is the peak fraud window (~45% CBK rate)
- **Wednesday** has the highest fraud rate by day of week
- **High-risk users** carry a 95% CBK rate vs only 10% for low-risk users
- **Top merchant (ID 23017)** averages R$ 4,023 per fraudulent transaction
- **12 merchants** flagged with 100% CBK rates
- **Transactions above R$2,775** (95th percentile) show significantly higher fraud concentration
- **Missing device ID** correlates with elevated chargeback rate

---

## Power BI Dashboard (3 Pages)

**Page 1 — Overview**
KPI cards (3.199K transactions, 391 chargebacks, 12.22% CBK rate, 20 high-risk, R$568.35K at risk), fraud vs clean donut, CBK rate by hour, transaction volume over time, CBK rate by day of week

**Page 2 — Risk Segmentation**
CBK rate by risk label (High=95%, Medium=56%, Low=10%), fraud signal flag counts, top suspect users table, transaction amount vs risk score scatter

**Page 3 — Merchant Analysis**
Date range slicer, top 15 merchants by avg fraud amount (merchant 23017 = R$4,023), merchant volume vs CBK rate scatter, merchant risk details table

---

## Project Workflow

1. SQL — table schema setup and basic data validation
2. Python — 8-step data cleaning pipeline
3. Python — fraud signal feature engineering
4. Python — 10 Plotly visualizations (saved as HTML)
5. Python — export cleaned dataset as `fraud_clean.csv`
6. Power BI — 3-page interactive dashboard
7. Insight generation and reporting

---

## Topics

`fraud-detection` `data-analysis` `python` `sql` `power-bi` `plotly` `eda` `risk-analysis` `fintech`
