CREATE DATABASE sales_db;
USE sales_db;
CREATE TABLE online_sales (
    order_id INT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(10,2),
    product_id INT
);
INSERT INTO online_sales (order_id, order_date, amount, product_id)
VALUES
(1, '2025-01-15', 500.00, 101),
(2, '2025-01-20', 750.00, 102),
(3, '2025-02-05', 1200.00, 101),
(4, '2025-02-18', 650.00, 103),
(5, '2025-03-10', 900.00, 102),
(6, '2025-03-25', 1500.00, 104),
(7, '2025-03-30', 700.00, 101),
(8, '2025-04-02', 1300.00, 105),
(9, '2025-04-18', 400.00, 103),
(10, '2025-04-28', 950.00, 102);
SELECT
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    SUM(amount) AS monthly_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
GROUP BY order_year, order_month
ORDER BY order_year, order_month;
SELECT
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    SUM(amount) AS monthly_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
WHERE order_date BETWEEN '2025-02-01' AND '2025-04-30'
GROUP BY order_year, order_month
ORDER BY monthly_revenue DESC;
SELECT
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    SUM(amount) AS monthly_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
GROUP BY order_year, order_month
ORDER BY monthly_revenue DESC
LIMIT 3;