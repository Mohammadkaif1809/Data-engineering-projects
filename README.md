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
### 3. ⚡ E-Commerce Data Engineering Pipeline — Databricks

- **Tech Stack:** Databricks, PySpark, Spark SQL, Delta Lake, Unity Catalog, Python, SQL

An end-to-end Data Engineering pipeline built on Databricks using a **Medallion Architecture (Bronze → Silver → Gold)** to transform e-commerce data into clean, validated, analytics-ready datasets for business reporting and dashboards.

#### Pipeline Flow

`E-Commerce Data` ➔ `Bronze Layer` ➔ `Silver Layer` ➔ `Gold Layer` ➔ `SQL Analytics` ➔ `Databricks Dashboard`

#### Data Architecture & Modeling

- **Bronze Layer:** Raw e-commerce data ingested into Databricks with minimal transformation.
- **Silver Layer:** Data cleaning, validation, deduplication, standardization, and schema enforcement.
- **Gold Layer:** Business-ready fact and dimension tables using dimensional modeling and a star-schema approach.
- **Fact Table:** `gld_fact_order_items`
- **Dimension Tables:** `gld_dim_products`, `gld_customers`, `gld_date`
- **Denormalized Analytics Table:** `gld_fact_transactions_denorm`
- **Unity Catalog:** Data organized across `bronze`, `silver`, and `gold` schemas.

#### Key Concepts Covered

- **Medallion Architecture:** Bronze → Silver → Gold data processing.
- **Data Engineering:** Data ingestion, cleaning, transformation, validation, and data quality.
- **Data Modeling:** Fact & dimension tables, star schema, and denormalization.
- **PySpark:** DataFrame transformations and distributed data processing.
- **Spark SQL:** Business analytics and complex SQL transformations.
- **Advanced SQL:** CTEs, joins, aggregations, and window functions such as `RANK()`, `DENSE_RANK()`, `ROW_NUMBER()`, `LEAD()`, `LAG()`, and `NTH_VALUE()`.
- **Delta Lake:** Lakehouse storage and table management.
- **Unity Catalog:** Catalog, schema, and table organization.
- **Databricks Dashboards:** Visualization of sales, product, customer, marketing, and channel analytics.
- **Git & GitHub:** Version control and project management.

---

## 🎯 Project Goals

* Build practical, end-to-end Data Engineering pipelines.
* Develop strong Python, SQL, and data processing skills.
* Practice data ingestion, cleaning, transformation, and validation.
* Work with structured, semi-structured, and API-based data sources.
* Practice relational and dimensional data modeling.
* Perform business-oriented analytics using SQL and Spark SQL.
* Learn distributed data processing with PySpark and Apache Spark.
* Build data pipelines using modern platforms such as Databricks.
* Explore cloud-based data storage and processing using Amazon S3.
* Develop workflow orchestration skills using Apache Airflow.
* Progress toward scalable, production-oriented Data Engineering workflows.
* Apply version control and project organization using Git and GitHub.
  
---

## 👨‍💻 Author

**Mohammad Kaif**  
*Building practical projects while learning Data Engineering step by step.*

* **GitHub:** [github.com/Mohammadkaif1809](https://github.com/Mohammadkaif1809)
* **LinkedIn:** [linkedin.com/in/mohammadkaif18](https://www.linkedin.com/in/mohammadkaif18/)
