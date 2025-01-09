# Instacart Market Basket Analysis

## Project Overview
Analysis of Instacart's online grocery shopping dataset to understand customer behavior, product popularity, and ordering patterns using PostgreSQL and Python.

## Repository Structure
- `README.md`: Project documentation
- `scripts/`
  - `data_loading.py`: Scripts for loading data into PostgreSQL
  - `analysis.sql`: SQL queries for data analysis

## Dataset Description
The analysis uses the Instacart dataset (~30M rows) with the following structure:
- Orders data (order details and timing)
- Products data (product catalog)
- Departments and aisles categorization
- Order-products mapping

## Requirements
- Python 3.x
- PostgreSQL
- Python packages:
  - pandas
  - psycopg2
  - sqlalchemy

## Analysis Components
1. Order Information Analysis: Comprehensive view of purchasing patterns
2. Product Purchase Analysis: Product performance metrics
3. Department-Level Analysis: Department-wise purchase patterns
4. Aisle Popularity Analysis: Top performing aisles
5. Product Behavior Analysis: Combined product performance metrics

## Contributing
Contributions are welcome! Please feel free to submit a Pull Request.
