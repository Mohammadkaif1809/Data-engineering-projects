# 🛒 E-Commerce ETL Pipeline

An end-to-end **E-Commerce ETL pipeline** built using **Python, Pandas, and MySQL**.

This project demonstrates how raw e-commerce transaction data can be extracted from a CSV file, cleaned and validated using Pandas, transformed into an analysis-ready dataset, loaded into a MySQL database, and analyzed using SQL.

---

# 📌 Project Overview

The goal of this project is to understand and implement the fundamentals of an **ETL (Extract, Transform, Load) pipeline**.

The complete workflow is:

```text
                    RAW DATA
                       │
                       ▼
                  CSV Dataset
                       │
                       ▼
                    EXTRACT
                       │
                       ▼
                 Python + Pandas
                       │
                       ▼
             CLEAN & VALIDATE DATA
                       │
                       ▼
                   TRANSFORM
                       │
                       ▼
              Processed CSV Dataset
                       │
                       ▼
                     LOAD
                       │
                       ▼
                 MySQL Database
                       │
                       ▼
                  SQL ANALYSIS


### MySQL Topics Used

- Database and table creation (`CREATE DATABASE`, `CREATE TABLE`, `USE`)
- Primary Keys and SQL data types
- `SELECT`, `WHERE`, `ORDER BY`, `LIMIT`
- Aggregate functions: `COUNT()`, `SUM()`, `AVG()`, `MIN()`, `MAX()`
- `GROUP BY` and `HAVING`
- NULL handling and `NULLIF()`
- Date functions: `YEAR()`, `MONTH()`, `MONTHNAME()`
- Subqueries and derived tables
- Window functions: `RANK()`, `ROW_NUMBER()`, `LAG()`, `SUM() OVER()`
- `PARTITION BY` and window-based `ORDER BY`
- Business and analytical SQL
- Customer, product, category, country, and monthly revenue analysis
- Running totals, rankings, growth calculations, and Top-N analysis
                       │
                       ▼
                Business Insights
