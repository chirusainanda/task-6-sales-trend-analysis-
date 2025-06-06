
-- Create database
CREATE DATABASE IF NOT EXISTS sales_data;
USE sales_data;

-- Create table
CREATE TABLE IF NOT EXISTS online_sales (
    order_id INT,
    order_date DATE,
    product_id INT,
    amount DECIMAL(10,2)
);

-- Insert sample data
INSERT INTO online_sales (order_id, order_date, product_id, amount) VALUES
(101, '2023-01-15', 1, 120.50),
(102, '2023-01-20', 2, 200.00),
(103, '2023-02-10', 1, 150.00),
(104, '2023-02-22', 3, 180.75),
(105, '2023-03-05', 2, 220.30),
(106, '2023-03-15', 1, 310.00),
(107, '2023-04-10', 3, 275.60),
(108, '2023-04-25', 2, 180.20),
(109, '2023-05-02', 1, 500.00),
(110, '2023-05-20', 3, 400.00);

-- Query 1: Monthly revenue and order volume
SELECT 
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM 
    online_sales
WHERE 
    order_date IS NOT NULL
GROUP BY 
    YEAR(order_date), MONTH(order_date)
ORDER BY 
    order_year, order_month;

-- Query 2: Top 3 months by revenue
SELECT 
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    SUM(amount) AS total_revenue
FROM 
    online_sales
GROUP BY 
    YEAR(order_date), MONTH(order_date)
ORDER BY 
    total_revenue DESC
LIMIT 3;

-- Query 3: Monthly average order value
SELECT 
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    AVG(amount) AS average_order_value
FROM 
    online_sales
GROUP BY 
    YEAR(order_date), MONTH(order_date)
ORDER BY 
    order_year, order_month;

-- Query 4: Product-wise total sales
SELECT 
    product_id,
    SUM(amount) AS total_sales
FROM 
    online_sales
GROUP BY 
    product_id
ORDER BY 
    total_sales DESC;
