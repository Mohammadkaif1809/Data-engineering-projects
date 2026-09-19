# E-Commerce Data Engineering Pipeline

### Databricks • PySpark • Spark SQL • Delta Lake • Unity Catalog

An end-to-end **Data Engineering project** that transforms raw e-commerce data into clean, validated, analytics-ready datasets using **Databricks Medallion Architecture**.

The project demonstrates **data ingestion, transformation, validation, dimensional modeling, SQL analytics, and dashboard visualization** using a Bronze → Silver → Gold pipeline.

---

## Architecture

The pipeline follows the **Medallion Architecture** to progressively transform raw data into business-ready datasets.

```text
                         E-COMMERCE SOURCE DATA
                                  │
                                  ▼
                    ┌──────────────────────────┐
                    │      🥉 BRONZE LAYER     │
                    │                          │
                    │      Raw / Ingested      │
                    │      Minimal Processing  │
                    └────────────┬─────────────┘
                                 │
                                 ▼
                    ┌──────────────────────────┐
                    │      🥈 SILVER LAYER     │
                    │                          │
                    │  Cleaned & Validated     │
                    │  • Data Cleaning         │
                    │  • Deduplication         │
                    │  • Standardization       │
                    │  • Data Validation       │
                    └────────────┬─────────────┘
                                 │
                                 ▼
                    ┌──────────────────────────┐
                    │       🥇 GOLD LAYER      │
                    │                          │
                    │   Business-Ready Data    │
                    │   • Fact Tables           │
                    │   • Dimension Tables      │
                    │   • Star Schema           │
                    └────────────┬─────────────┘
                                 │
                    ┌────────────┴────────────┐
                    ▼                         ▼
             📊 SQL ANALYTICS          📈 DASHBOARDS
```

### Architecture Diagram

[E-Commerce Data Pipeline Architecture](./architecture/ecommerce-data-pipeline-architecture.png)

---

## 🗂️ Unity Catalog & Data Model

The project uses **Unity Catalog** to organize data into three schemas:

```text
ecommerce
│
├── 🥉 bronze
│   ├── brz_brands
│   ├── brz_category
│   ├── brz_customers
│   ├── brz_date
│   ├── brz_order_items
│   └── brz_products
│
├── 🥈 silver
│   ├── sil_brands
│   ├── sil_category
│   ├── sil_customers
│   ├── sil_date
│   ├── sil_order_items
│   └── sil_products
│
└── 🥇 gold
    ├── gld_customers
    ├── gld_date
    ├── gld_dim_products
    ├── gld_fact_order_items
    └── gld_fact_transactions_denorm
```

---

## 🔄 Data Pipeline Workflow

The project separates **dimension** and **fact** processing.

### Dimension Pipeline

```text
01_dim_bronze
      │
      ▼
02_dim_silver
      │
      ▼
03_dim_gold
```

### Fact Pipeline

```text
01_fact_bronze
      │
      ▼
02_fact_silver
      │
      ▼
03_fact_gold
```

### Setup

The `setUp/setup.ipynb` notebook contains the initial **Databricks and Unity Catalog setup**, including catalog and schema creation.

---

## 🧹 Data Transformation & Quality

The Silver layer performs multiple data engineering transformations:

- **Data type standardization**
- **Null handling**
- **Duplicate detection and removal**
- **Data validation**
- **String standardization**
- **Schema enforcement**
- **Date transformations**
- **Data quality checks**
- **Business-rule validation**

The Gold layer applies additional business transformations and dimensional modeling to produce analytics-ready datasets.

---

## 📊 SQL Analytics

The project contains a collection of analytical SQL queries in:

```text
sql/analytics_queries.sql
```

The queries cover multiple business areas.

### 💰 Revenue Analysis

- Monthly revenue
- Yearly revenue
- Revenue trends
- Cumulative revenue
- Revenue by sales channel
- Revenue by discount range

### 📦 Product Analysis

- Top products
- Top product categories
- Brand performance
- Product rankings

### 👥 Customer Analysis

- Customer revenue
- Customer rankings
- Customer transaction analysis

### 🎯 Marketing Analysis

- Coupon vs. non-coupon revenue
- Discount analysis
- Promotion performance
- Channel analysis

### 🧠 Advanced SQL

The project demonstrates:

- `RANK()`
- `DENSE_RANK()`
- `ROW_NUMBER()`
- `LEAD()`
- `LAG()`
- `NTH_VALUE()`
- CTEs
- Joins
- Aggregations
- `CASE`
- Date functions
- Window-based calculations

---

## 📈 Databricks Dashboard

An interactive **Databricks Dashboard** was created using the analytics-ready Gold-layer data.

### Dashboard Pages

- **Data**
- **Sales Performance**
- **Product & Customer Analytics**
- **Marketing & Channel Analytics**

### Dashboard Analysis Includes

- Revenue by Sales Channel
- Transaction Share by Channel
- Average Transaction Value
- Coupon vs. Non-Coupon Revenue
- Product Performance
- Customer Performance
- Marketing Analysis
- Channel Performance

### 📸 Dashboard Screenshots

#### Sales Performance

![Sales Performance](./dashboard/screenshots)

#### Product & Customer Analytics

![Product & Customer Analytics](./dashboard/screenshots)

#### Marketing & Channel Analytics

![Marketing & Channel Analytics](./dashboard/screenshots)

---

## 📁 Repository Structure

```text
ecommerce-databricks-pipeline/
│
├── architecture/
│   └── ecommerce-data-pipeline-architecture.png
│
├── dashboard/
│   ├── New Dashboard 2026-09-19 00:07:22.lvdash.json
│   │
│   └── screenshots/
│       ├── sales-performance.png
│       ├── product-customer-analytics.png
│       └── marketing-channel-analytics.png
│
├── notebooks/
│   ├── 01_dim_bronze.ipynb
│   ├── 01_fact_bronze.ipynb
│   ├── 02_dim_silver.ipynb
│   ├── 02_fact_silver.ipynb
│   ├── 03_dim_gold.ipynb
│   └── 03_fact_gold.ipynb
│
├── setUp/
│   └── setup.ipynb
│
├── sql/
│   └── analytics_queries.sql
│
└── README.md
```

---

## 🛠️ Tech Stack

| Category | Technologies |
|---|---|
| **Data Platform** | Databricks |
| **Data Processing** | PySpark, Apache Spark |
| **Query Engine** | Spark SQL |
| **Storage** | Delta Lake |
| **Data Governance** | Unity Catalog |
| **Programming** | Python, SQL |
| **Architecture** | Medallion Architecture |
| **Data Modeling** | Star Schema, Fact & Dimension Modeling |
| **Version Control** | Git, GitHub |
| **Analytics** | Databricks SQL |
| **Visualization** | Databricks Dashboards |

---

## 🧠 Data Engineering Concepts

- Medallion Architecture
- ETL / ELT
- Batch Data Processing
- Data Ingestion
- Data Cleaning
- Data Transformation
- Data Validation
- Data Quality
- Deduplication
- Schema Enforcement
- Data Type Standardization
- Fact & Dimension Modeling
- Star Schema
- Denormalization
- Spark DataFrames
- Spark SQL
- Window Functions
- Delta Lake
- Unity Catalog
- Business Analytics
- Data Visualization
- Git Version Control

---

## 🎯 Business Use Cases

The analytics layer can support business teams in understanding:

- **Sales and revenue performance**
- **Product and category performance**
- **Customer purchasing behavior**
- **Brand performance**
- **Sales channel performance**
- **Discount and promotion effectiveness**
- **Transaction patterns**
- **Revenue trends**

---

## 🚀 Project Outcome

This project demonstrates an end-to-end **Databricks Data Engineering workflow**:

```text
Raw Data
   ↓
Data Ingestion
   ↓
Bronze Layer
   ↓
Data Cleaning & Validation
   ↓
Silver Layer
   ↓
Dimensional Modeling
   ↓
Gold Layer
   ↓
SQL Analytics
   ↓
Databricks Dashboard
   ↓
Business Insights
```

The final Gold-layer datasets provide a structured and analytics-ready foundation for **business intelligence, reporting, and data-driven decision making**.

---

