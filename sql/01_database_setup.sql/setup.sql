-- Superstore SQL Project
-- Database Setup


-- 1. Create Database

CREATE DATABASE IF NOT EXISTS superstore_db;

-- Select the database to use

USE superstore_db;


-- 2. Create Superstore Table


CREATE TABLE superstore (

    -- Order Information
    row_id INT,
    order_id VARCHAR(20),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(50),

    -- Customer Information
    customer_id VARCHAR(20),
    customer_name VARCHAR(100),
    segment VARCHAR(50),

    -- Location Information
    country VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code VARCHAR(20),
    region VARCHAR(50),

    -- Product Information
    product_id VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(255),

    -- Sales Information
    sales DECIMAL(10,2),
    quantity INT,
    discount DECIMAL(4,2),
    profit DECIMAL(10,2)

);



-- 3. Load CSV Data into Superstore Table

LOAD DATA LOCAL INFILE '/Users/pavan/Downloads/Superstore_dataset.csv'
INTO TABLE superstore
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
