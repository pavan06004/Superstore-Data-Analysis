-- Superstore SQL Project
-- Regional Analysis

USE superstore_db;


-- 1. Sales by Region

SELECT region,SUM(sales) AS total_sales
FROM superstore
GROUP BY region
ORDER BY total_sales DESC;


-- 2. Profit by Region

SELECT region,SUM(profit) AS total_profit
FROM superstore
GROUP BY region
ORDER BY total_profit DESC;


-- 3. Sales and Profit by State

SELECT state,SUM(sales) AS total_sales,
SUM(profit) AS total_profit
FROM superstore
GROUP BY state
ORDER BY total_sales DESC;


-- 4. Top 10 States by Sales

SELECT state,SUM(sales) AS total_sales
FROM superstore
GROUP BY state
ORDER BY total_sales DESC
LIMIT 10;


-- 5. Top 10 States by Profit

SELECT state,SUM(profit) AS total_profit
FROM superstore
GROUP BY state
ORDER BY total_profit DESC
LIMIT 10;


-- 6. Loss Making States

SELECT state,SUM(profit) AS total_profit
FROM superstore
GROUP BY state
HAVING total_profit < 0
ORDER BY total_profit;


-- 7. Sales Contribution by Region

SELECT region,SUM(sales) AS total_sales,
ROUND(SUM(sales)*100/(SELECT SUM(sales) FROM superstore),2) AS sales_percentage
FROM superstore
GROUP BY region;


-- 8. City-wise Sales Analysis

SELECT city,SUM(sales) AS total_sales
FROM superstore
GROUP BY city
ORDER BY total_sales DESC
LIMIT 10;


-- 9. City-wise Profit Analysis

SELECT city,SUM(profit) AS total_profit
FROM superstore
GROUP BY city
ORDER BY total_profit DESC
LIMIT 10;


-- 10. Region and Category Performance

SELECT region,category,
SUM(sales) AS total_sales,
SUM(profit) AS total_profit
FROM superstore
GROUP BY region,category
ORDER BY total_sales DESC;