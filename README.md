# Instacart Market Basket Analysis

## Project Overview
Analysis of Instacart's online grocery shopping dataset to understand customer behavior, product popularity, and ordering patterns using PostgreSQL and Python.

## Repository Structure
- `README.md`: Project documentation
- `scripts/`
  - `data_loading.py`: Scripts for loading data into PostgreSQL
  - `analysis.sql`: SQL queries for data analysis
 
## Data Source
This project uses data from the Instacart Market Basket Analysis Competition on Kaggle.
- `Sata Source`: https://www.kaggle.com/competitions/instacart-market-basket-analysis/data


### File Descriptions

#### `orders.csv`
Contains all orders with their attributes:
- `order_id`: order identifier
- `user_id`: customer identifier
- `eval_set`: which set (prior, train, test) an order belongs to
- `order_number`: sequence order for each customer
- `order_dow`: day of week
- `order_hour_of_day`: hour of day
- `days_since_prior_order`: relative time between orders

#### `order_products__*.csv`
Specifies which products were purchased in each order:
- `order_id`: order identifier
- `product_id`: product identifier
- `add_to_cart_order`: sequence of items added to cart
- `reordered`: indicates if the product has been ordered by this user before
Note: order_products__prior.csv contains previous order contents for all customers

#### `products.csv`
Contains product information:
- `product_id`: product identifier
- `product_name`: name of the product
- `aisle_id`: aisle identifier
- `department_id`: department identifier

#### `aisles.csv`
Contains aisle information:
- `aisle_id`: aisle identifier
- `aisle`: name of the aisle

#### `departments.csv`
Contains department information:
- `department_id`: department identifier
- `department`: name of the department


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
