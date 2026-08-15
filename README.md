# Walmart_sales_analysis_sql
End-to-end PostgreSQL data analysis analyzing 6,400+ Walmart sales records (2010–2012) across 45 stores. Answers 10 business questions covering store performance, holiday revenue lifts (+7.8%), sales volatility, and macroeconomic factors.


# 🛒 Walmart Sales Data Analysis (PostgreSQL)

![SQL](https://img.shields.io/badge/Language-SQL-blue.svg)
![PostgreSQL](https://img.shields.io/badge/Database-PostgreSQL-blue?logo=postgresql)
![License](https://img.shields.io/badge/License-MIT-green.svg)

An end-to-end data analysis project investigating Walmart weekly store sales across 45 locations from 2010 to 2012 using PostgreSQL. This project answers 10 business questions covering store performance, holiday revenue lifts, macro-economic impacts (unemployment, CPI), weather influence, sales volatility, and revenue concentration.

---

## 📌 Table of Contents
- [Project Overview](#-project-overview)
- [Repository Structure](#-repository-structure)
- [Dataset Architecture](#-dataset-architecture)
- [Database Schema & Setup](#-database-schema--setup)
- [10 Key Business Questions & SQL Findings](#-10-key-business-questions--sql-findings)
- [Summary of Key Takeaways](#-summary-of-key-takeaways)
- [How to Reproduce This Project](#-how-to-reproduce-this-project)

---

## 🔎 Project Overview
Retail organizations rely heavily on data analytics to optimize inventory, labor allocation, and marketing spend across different regional stores. 

This project analyzes **6,435 weekly store records** across **45 distinct locations** to answer critical business questions:
* Identifying high-performing vs. underperforming store locations.
* Quantifying holiday promotional revenue uplift.
* Evaluating sales volatility and risk.
* Measuring the correlation between macroeconomic factors (unemployment, fuel prices) and consumer spending.
* Analyzing environmental impact (extreme temperatures) on sales.

---

## 📁 Repository Structure

```text
walmart-sales-sql-analysis/
│
├── data/
│   └── Walmart_Sales.csv          # Raw CSV dataset (6,435 rows)
│
├── sql/
│   ├── 01_schema.sql             # Table creation & data import scripts
│   └── 02_analysis_queries.sql   # Complete PostgreSQL analysis queries
│
├── README.md                     # Project documentation & business findings
└── .gitignore                    # System files to ignore
