
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
(105, '2023-03-05', 2, 220.30);

-- Query for monthly revenue and order volume
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
