-- Superstore SQL Project
-- Customer Analysis

USE superstore_db;


-- 1. Total Number of Customers

SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM superstore;


-- 2. Top 10 Customers by Sales

SELECT customer_name,SUM(sales) AS total_sales
FROM superstore
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 10;


-- 3. Top 10 Customers by Profit

SELECT customer_name,SUM(profit) AS total_profit
FROM superstore
GROUP BY customer_name
ORDER BY total_profit DESC
LIMIT 10;


-- 4. Customer Segment Performance

SELECT segment,COUNT(DISTINCT customer_id) AS total_customers,
SUM(sales) AS total_sales,SUM(profit) AS total_profit
FROM superstore
GROUP BY segment
ORDER BY total_sales DESC;


-- 5. Average Sales per Customer

SELECT ROUND(SUM(sales) / COUNT(DISTINCT customer_id), 2) 
AS average_sales_per_customer
FROM superstore;


-- 6. Average Profit per Customer

SELECT ROUND(SUM(profit) / COUNT(DISTINCT customer_id), 2)
AS average_profit_per_customer
FROM superstore;


-- 7. Customers with Negative Profit

SELECT customer_name,SUM(profit) AS total_profit
FROM superstore
GROUP BY customer_name
HAVING total_profit < 0
ORDER BY total_profit;


-- 8. Customers with Highest Number of Orders

SELECT customer_name,COUNT(DISTINCT order_id) AS total_orders
FROM superstore
GROUP BY customer_name
ORDER BY total_orders DESC
LIMIT 10;


-- 9. Sales by Customer Segment

SELECT segment,SUM(sales) AS total_sales
FROM superstore
GROUP BY segment
ORDER BY total_sales DESC;


-- 10. Profit by Customer Segment

SELECT segment,SUM(profit) AS total_profit
FROM superstore
GROUP BY segment
ORDER BY total_profit DESC;