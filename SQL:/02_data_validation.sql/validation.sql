
-- Superstore SQL Project
-- Data Validation

-- Select Database

USE superstore_db;


-- 1. Check Total Number of Records

SELECT COUNT(*) AS total_records
FROM superstore;


-- 2. Display Sample Data

SELECT * FROM superstore
LIMIT 10;



-- 3. Check Column Structure

DESCRIBE superstore;

-- 4. Check Missing Values

SELECT COUNT(*) - COUNT(order_id) AS missing_order_id,
    COUNT(*) - COUNT(customer_id) AS missing_customer_id,
    COUNT(*) - COUNT(product_id) AS missing_product_id,
    COUNT(*) - COUNT(sales) AS missing_sales,
    COUNT(*) - COUNT(profit) AS missing_profit
FROM superstore;


-- 5. Check Duplicate Rows

SELECT 
    order_id,
    product_id,
    COUNT(*) AS duplicate_count
FROM superstore
GROUP BY order_id, product_id
HAVING COUNT(*) > 1;


-- 6. Check Date Range

SELECT MIN(order_date) AS first_order_date,
MAX(order_date) AS last_order_date
FROM superstore;


-- 7. Check Unique Values

SELECT COUNT(DISTINCT customer_id) AS unique_customers
FROM superstore;

SELECT COUNT(DISTINCT product_id) AS unique_products
FROM superstore;