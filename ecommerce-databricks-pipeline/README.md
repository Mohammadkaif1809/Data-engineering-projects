# E-Commerce Data Engineering Pipeline (Databricks & Unity Catalog)

A production-style e-commerce data pipeline built on **Databricks**, **PySpark**, **Delta Lake**, and **Unity Catalog**. This project implements a **Medallion Architecture (Bronze → Silver → Gold)** to transform raw, transactional data into analytics-ready datasets for reporting and BI dashboards.



##  Architecture

The pipeline processes data incrementally across three distinct layers:

```text
                  E-Commerce Raw Data
                           │
                           ▼
 🥉 BRONZE           Raw Ingestion
                     (Append-only, native format)
                           │
                           ▼
 🥈 SILVER           Cleaned & Validated
                     (Deduplication, schema enforcement)
                           │
                           ▼
 🥇 GOLD             Business & Dimensional Model
                     (Star Schema: Facts & Dimensions)
                           │
            ┌──────────────┴──────────────┐
            ▼                             ▼
   SQL Analytics                     Databricks
   (Windowing, CTEs)                 Dashboards

```

## Unity Catalog & Data Model
Organized via Unity Catalog across three schemas (bronze, silver, gold):

```text
ecommerce (Catalog)
│
├── 🥉 bronze               ├── 🥈 silver               ├── 🥇 gold
│   ├── brz_brands         │   ├── sil_brands         │   ├── gld_customers
│   ├── brz_category       │   ├── sil_category       │   ├── gld_date
│   ├── brz_customers      │   ├── sil_customers      │   ├── gld_dim_products
│   ├── brz_date           │   ├── sil_date           │   ├── gld_fact_order_items
│   ├── brz_order_items    │   ├── sil_order_items    │   └── gld_fact_transactions_denorm
│   └── brz_products       │   └── sil_products       │

```

## Star Schema Design
Fact Table: gld_fact_order_items (Transaction & line-item level granularity)

Dimension Tables: gld_dim_products, gld_customers, gld_date

Denormalized Flat Table: gld_fact_transactions_denorm (Optimized for BI drag-and-drop queries)

## Notebook Pipeline Workflow
The pipeline separates dimension and fact processing to maintain referential integrity:

```text
Dimension Workflow:  01_dim_bronze ──> 02_dim_silver ──> 03_dim_gold
Fact Workflow:       01_fact_bronze ──> 02_fact_silver ──> 03_fact_gold
```

## Repository Structure
```text
ecommerce-databricks-pipeline/
│
├── notebooks/
│   ├── 01_dim_bronze.ipynb       # Ingestion for dimensions
│   ├── 01_fact_bronze.ipynb      # Ingestion for facts
│   ├── 02_dim_silver.ipynb      # Cleaning & validation for dimensions
│   ├── 02_fact_silver.ipynb     # Cleaning & validation for facts
│   ├── 03_dim_gold.ipynb        # Gold dimension tables construction
│   └── 03_fact_gold.ipynb       # Gold fact tables construction
│
├── sql/
│   └── analytics_queries.sql    # Business queries & window function analytical scripts
│
└── README.md
```

## Data Engineering Concepts

- Medallion Architecture
- ETL / ELT
- Batch Data Processing
- Data Ingestion
- Data Cleaning & Transformation
- Data Validation
- Deduplication
- Schema Enforcement
- Fact & Dimension Modeling
- Star Schema
- Denormalization
- Spark SQL
- Window Functions
- Delta Lake
- Unity Catalog
- Data Analytics & Visualization
  

## Analytics & KPI Coverage
- Advanced Spark SQL queries (sql/analytics_queries.sql) provide coverage across key business metrics:
- Revenue Metrics: Monthly/Yearly trends, cumulative revenue, revenue by sales channel.
- Performance Analysis: Top product categories, customer ranking (DENSE_RANK), promotion effectiveness (Coupon vs. Non-Coupon).
- Advanced Analytics: Order size distribution, discount impact, and cohort behavior using window functions (LEAD, LAG, NTH_VALUE).

## Tech Stack

| Category | Technologies |
|---|---|
| Cloud Data Platform | Databricks |
| Data Processing | PySpark, Spark SQL |
| Storage | Delta Lake |
| Data Governance | Unity Catalog |
| Programming | Python, SQL |
| Version Control | Git, GitHub |
| Analytics & BI | Databricks SQL, Databricks Dashboards |
