# 📊 PSO Stock Market SQL Analysis

This SQL project analyzes historical stock data of an energy company like PSO to extract financial insights, trends, and patterns using SQL only — without any visualization tools like Power BI.

---

## 🎯 Objective

To showcase SQL proficiency by analyzing real-world stock data and delivering business insights purely through queries.

---

## 💡 Skills Demonstrated

- ✅ SQL (Joins, Aggregation, Window Functions, CTEs)
- ✅ Data Cleaning (NULL handling, transformations)
- ✅ Analytical Thinking
- ✅ Business Insight

---

## 🧩 Data Columns

- `date`
- `open`, `high`, `low`, `close`, `adj_close`
- `volume`

---

## 🔍 Key SQL Analyses

- Daily price change (`close - open`)
- Daily volatility (`high - low`)
- Highest & lowest trading days
- Monthly average closing price
- Longest increasing `adj_close` streak (window function)
- 5-day moving average using `OVER()`
- Days with no price movement
- Outlier detection using `AVG` & `STDDEV`

---

## 📂 File Descriptions

| File                | Description                                |
|---------------------|--------------------------------------------|
| `stock_data.sql`    | Table schema and sample data               |
| `analysis_queries.sql` | All analysis queries used in project   |
| `README.md`         | This file – explains everything            |

---

## 📌 Sample Insight

> "Volume peaked on `2008-01-10`, indicating unusual trading activity — possibly due to an announcement or market speculation."

---

## 👨‍💻 Author

**Rana Muhammad Hassan**  
_Student | AI Engineer | SQL Enthusiast_

