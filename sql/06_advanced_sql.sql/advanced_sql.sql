-- Superstore SQL Project
-- Advanced SQL Analysis

USE superstore_db;


-- 1. Rank Products by Sales

SELECT product_name,SUM(sales) AS total_sales,
RANK() OVER(ORDER BY SUM(sales) DESC) AS sales_rank
FROM superstore
GROUP BY product_name
LIMIT 10;



-- 2. Dense Rank Products by Profit

SELECT product_name,SUM(profit) AS total_profit,
DENSE_RANK() OVER(ORDER BY SUM(profit) DESC) AS profit_rank
FROM superstore
GROUP BY product_name
LIMIT 10;



-- 3. Top 5 Products in Each Category

WITH product_rank AS (
    SELECT product_name,
    category,
    SUM(sales) AS total_sales,
    RANK() OVER(PARTITION BY category ORDER BY SUM(sales) DESC) AS ranking
    FROM superstore
    GROUP BY category,product_name
)

SELECT *
FROM product_rank
WHERE ranking <= 5;



-- 4. Running Total of Sales by Order Date

SELECT order_date,
SUM(sales) AS daily_sales,
SUM(SUM(sales)) OVER(ORDER BY order_date) AS running_total
FROM superstore
GROUP BY order_date;



-- 5. Monthly Sales Analysis

SELECT YEAR(order_date) AS year,
MONTH(order_date) AS month,
SUM(sales) AS total_sales
FROM superstore
GROUP BY YEAR(order_date),MONTH(order_date)
ORDER BY year,month;



-- 6. Customer Ranking Based on Sales

SELECT customer_name,SUM(sales) AS total_sales,
DENSE_RANK() OVER(ORDER BY SUM(sales) DESC) AS customer_rank
FROM superstore
GROUP BY customer_name;



-- 7. Category-wise Sales Ranking

SELECT category,sub_category,
SUM(sales) AS total_sales,
RANK() OVER(PARTITION BY category ORDER BY SUM(sales) DESC) AS rank_in_category
FROM superstore
GROUP BY category,sub_category;



-- 8. Find Products with Below Average Sales

WITH product_sales AS (
    SELECT product_name,
    SUM(sales) AS total_sales
    FROM superstore
    GROUP BY product_name
)

SELECT *
FROM product_sales
WHERE total_sales < (
    SELECT AVG(total_sales)
    FROM product_sales
);



-- 9. Self Join - Compare Customer Orders

SELECT 
a.customer_name,
a.order_date AS first_order,
b.order_date AS second_order
FROM superstore a
JOIN superstore b
ON a.customer_id = b.customer_id
AND a.order_date < b.order_date
LIMIT 10;



-- 10. Year-wise Sales Growth

WITH yearly_sales AS (
    SELECT 
    YEAR(order_date) AS year,
    SUM(sales) AS total_sales
    FROM superstore
    GROUP BY YEAR(order_date)
)

SELECT year,total_sales,
LAG(total_sales) OVER(ORDER BY year) AS previous_year_sales,
ROUND(
(total_sales - LAG(total_sales) OVER(ORDER BY year))
/ LAG(total_sales) OVER(ORDER BY year) * 100,2
) AS growth_percentage
FROM yearly_sales;