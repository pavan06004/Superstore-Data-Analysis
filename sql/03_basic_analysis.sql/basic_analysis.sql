-- Superstore SQL Project
-- Basic Sales Analysis

USE superstore_db;

-- 1. Overall Business Performance

SELECT SUM(sales) AS total_sales, SUM(quantity) AS total_quantity,
SUM(profit) AS total_profit
FROM superstore;


-- 2. Overall Profit Margin

SELECT ROUND(SUM(profit) / SUM(sales) * 100, 2) AS profit_margin_percentage
FROM superstore;


-- 3. Sales by Region

SELECT region,SUM(sales) AS total_sales
FROM superstore
GROUP BY region
ORDER BY total_sales DESC;


-- 4. Profit by Region

SELECT region,SUM(profit) AS total_profit
FROM superstore
GROUP BY region
ORDER BY total_profit DESC;


-- 5. Sales by Category

SELECT category,SUM(sales) AS total_sales
FROM superstore
GROUP BY category
ORDER BY total_sales DESC;


-- 6. Profit by Category

SELECT category,SUM(profit) AS total_profit
FROM superstore
GROUP BY category
ORDER BY total_profit DESC;


-- 7. Sales by Product ID

SELECT product_id,SUM(sales) AS total_sales
FROM superstore
GROUP BY product_id
ORDER BY total_sales DESC;


-- 8. Quantity by Ship Mode

SELECT ship_mode,SUM(quantity) AS total_quantity
FROM superstore
GROUP BY ship_mode
ORDER BY total_quantity DESC;


-- 9. Profit by Ship Mode

SELECT ship_mode,SUM(profit) AS total_profit
FROM superstore
GROUP BY ship_mode
ORDER BY total_profit DESC;


-- 10. Top 10 Products by Sales

SELECT product_name,SUM(sales) AS total_sales
FROM superstore
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;