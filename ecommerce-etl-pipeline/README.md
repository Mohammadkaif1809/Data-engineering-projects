# E-Commerce ETL Pipeline

## Overview

This project demonstrates a basic end-to-end ETL (Extract, Transform, Load) pipeline using Python, Pandas, and MySQL.

The pipeline takes raw e-commerce transaction data, cleans and transforms it using Pandas, loads the processed data into MySQL using MySQL Connector, and performs business-oriented SQL analysis.

## ETL Pipeline

Raw CSV
↓
Pandas
↓
Data Cleaning & Validation
↓
Data Transformation
↓
MySQL
↓
SQL Business Analysis

## Technologies Used

- Python
- Pandas
- MySQL
- MySQL Connector
- SQL
- Jupyter Notebook

## Project Structure

```text
ecommerce_DE1/
│
├── data/
│   ├── raw/
│   │   └── ecom.csv
│   └── processed/
│       └── ecom.cleaned.csv
│
├── notebooks/
│   └── cleaning.ipynb
│
├── sql/
│   └── analysis.sql
│
├── .gitignore
├── requirements.txt
└── README.md