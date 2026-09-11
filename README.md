# 🚀 Data Engineering Projects

A collection of hands-on Data Engineering projects built to learn and demonstrate real-world data engineering concepts, tools, and workflows. 

The projects progressively cover data ingestion, transformation, databases, SQL analytics, APIs, data modeling, orchestration, distributed processing, and cloud technologies.

---

## 🛠️ Technology Stack

| Category | Technologies |
| :--- | :--- |
| **Languages & Processing** | Python, Pandas, NumPy, Requests |
| **Databases & SQL** | MySQL, PostgreSQL |
| **Orchestration & DevOps** | Git, GitHub, Docker, Apache Airflow |
| **Big Data & Cloud** | Apache Spark, Cloud Storage, Cloud Databases |

---

## 📈 Learning Roadmap

Python ➔ Pandas ➔ SQL & Databases ➔ ETL Pipelines ➔ APIs & Ingestion
➔ Data Modeling ➔ Incremental Pipelines ➔ Data Warehousing
➔ Airflow ➔ Docker ➔ Apache Spark ➔ Cloud


Each project builds sequentially on the concepts and tools mastered in the previous one.

---

## 📌 Projects Outline

### 1. E-Commerce ETL Pipeline
* **Tech Stack:** Python, Pandas, MySQL, SQL

An end-to-end ETL pipeline that processes raw e-commerce sales data, cleans and transforms it using Python and Pandas, loads it into MySQL, and performs SQL-based business analysis.

#### Pipeline Flow
`CSV Data` ➔ `Python / Pandas` ➔ `Cleaning & Transformation` ➔ `MySQL Load` ➔ `SQL Analytics`

#### Key Concepts Covered
* **Ingestion & Cleaning:** CSV parsing, duplicate detection, missing-value handling, Pandas transformations.
* **Database Management:** Python-to-MySQL integration, schema design, batch loading with `executemany()`.
* **SQL Analytics:** Joins, aggregations, subqueries, date-based analysis, and window functions (`RANK()`, `ROW_NUMBER()`, `LAG()`, running totals).

---

### 2. E-Commerce API Data Engineering Pipeline
* **Tech Stack:** Python, Requests, Pandas, MySQL, SQL, REST API

An end-to-end pipeline that extracts e-commerce data from the DummyJSON REST API, transforms nested JSON data into normalized relational datasets using Pandas, loads it into MySQL, and executes business-oriented SQL analytics.

#### Pipeline Flow
`REST API` ➔ `Python Requests` ➔ `JSON Normalization` ➔ `Pandas` ➔ `MySQL Load` ➔ `SQL Analytics`

#### Data Architecture & Modeling
Data is ingested from three core API endpoints (**Products**, **Users**, **Carts**) and normalized into **17 relational tables** (covering products, users, carts, reviews, addresses, companies, and transactions).

Users ➔ Carts ➔ Cart Products ➔ Products


#### Key Concepts Covered
* **API Ingestion:** Extracting, parsing, and normalizing nested JSON structures.
* **Data Modeling:** Relational modeling, primary/foreign key design, data validation.
* **Advanced SQL Analytics:** Common Table Expressions (CTEs), window functions (`RANK()`, `DENSE_RANK()`, `NTILE()`, `LAG()`, `LEAD()`), customer spend analysis, and product ranking.

---

## 🎯 Project Goals

* Build practical, end-to-end Data Engineering pipelines.
* Master Python, Pandas, and advanced SQL analytical queries.
* Practice relational data modeling and normalization strategies.
* Work with external APIs, JSON payloads, and automated database loaders.
* Scale workflows toward orchestration, distributed computing, and cloud infrastructure.

---

## 👨‍💻 Author

**Mohammad Kaif**  
*Building practical projects while learning Data Engineering step by step.*

* **GitHub:** [github.com/Mohammadkaif1809](https://github.com/Mohammadkaif1809)
