# Create a temporary table that joins the orders, order_products, and products tables to get information about each order, including the products that were purchased and their department and aisle information.
CREATE TEMP TABLE order_info AS(
	SELECT 
		o.order_id, o.order_number, o.order_dow, o.order_hour_of_day, o.days_since_prior_order , 
		op.add_to_cart_order , op.reordered, op.product_id , 
		p.product_name , p.aisle_id , p.department_id 
	FROM orders AS o
	JOIN order_products AS op ON o.order_id = op.order_id
	JOIN products AS p ON op.product_id = p.product_id 
);

SELECT * 
FROM order_info

-- 	Create a temporary table that groups the orders by product and finds the total number of times each product was purchased, 
-- the total number of times each product was reordered, and the average number of times each product was added to a cart.
CREATE TEMP TABLE product_purchase AS(
	SELECT product_id, product_name, COUNT(product_id) AS total_orders, COUNT(CASE WHEN reordered= 1 THEN 1 ELSE 0 END) AS total_reorders, ROUND(AVG(add_to_cart_order),2) AS avg_add_to_cart
	FROM order_info  
	GROUP BY product_id, product_name
);

SELECT *
FROM product_purchase



-- Create a temporary table that groups the orders by department and finds the total number of products purchased, the total number 
-- of unique products purchased, the total number of products purchased on weekdays vs weekends, and the average time of day that 
-- products in each department are ordered.

CREATE TEMP TABLE department_orders AS(
	SELECT department_id, 
			COUNT(product_id) AS total_products_purchased, 
			COUNT(DISTINCT product_id) AS total_unique_products_purchased,
			SUM(CASE WHEN order_dow IN (1,2,3,4,5) THEN 1 ELSE 0 END) AS total_weekday_purchases,
			SUM(CASE WHEN order_dow IN (0,6) THEN 1 ELSE 0 END) AS total_weekend_purchases,
			ROUND(AVG(order_hour_of_day),2) AS avg_order_time
	FROM order_info
	GROUP BY department_id
);

SELECT * 
FROM department_orders


-- Create a temporary table that groups the orders by aisle and finds the top 10 most popular aisles, including the 
-- total number of products purchased and the total number of unique products purchased from each aisle.
CREATE TEMP TABLE aisle_orders AS(
	SELECT aisle_id, 
			COUNT(product_id) AS total_products_purchased, 
			COUNT(DISTINCT product_id) AS total_unique_products_purchased
	FROM order_info
	GROUP BY aisle_id
	ORDER BY COUNT(product_id) DESC
	LIMIT 10
);

SELECT *
FROM aisle_orders

-- Combine the information from the previous temporary tables into a final table that shows the product ID, product name, 
-- department ID, department name, aisle ID, aisle name, total number of times purchased, total number of times reordered, 
-- average number of times added to cart, total number of products purchased, total number of unique products purchased, 
-- total number of products purchased on weekdays, total number of products purchased on weekends, and average time of day 
-- products are ordered in each department.

SELECT * FROM products
SELECT * FROM departments

CREATE TEMP TABLE product_behaviour_analysis AS(
	SELECT p.product_id, p.product_name, p.department_id, d.department, p.aisle_id, a.aisle, pp.total_orders, 
			pp.total_reorders, pp.avg_add_to_cart, dpt.total_products_purchased, dpt.total_unique_products_purchased, 
			dpt.total_weekday_purchases, dpt.total_weekend_purchases, dpt.avg_order_time
	FROM products AS p
	JOIN departments AS d ON p.department_id = d.department_id
	JOIN aisles AS a ON p.aisle_id = a.aisle_id
	JOIN product_purchase AS pp ON p.product_id = pp.product_id
	JOIN department_orders AS dpt ON p.department_id = dpt.department_id
);

SELECT *
FROM product_behaviour_analysis


























