USE sales_department;

SELECT * FROM Product WHERE price > 50;
SELECT * FROM Employee WHERE role = 'manager';
SELECT * FROM Sale WHERE quantity >= 2;
SELECT * FROM Monthly_Report WHERE conclusion = 'Excellent';
SELECT * FROM Product WHERE stock_quantity < 10;

SELECT CONCAT(name, ' - $', price) AS product_info FROM Product;
SELECT UPPER(name) AS upper_name FROM Employee;
SELECT LOWER(conclusion) AS lower_conclusion FROM Monthly_Report;
SELECT SUBSTRING(report_month,1,3) AS short_month FROM Monthly_Report;
SELECT TRIM(name) AS trimmed_name FROM Product;

SELECT NOW() AS current_datetime;
SELECT sale_date, YEAR(sale_date) AS sale_year FROM Sale;
SELECT sale_date, MONTH(sale_date) AS sale_month FROM Sale;
SELECT sale_date, DATEDIFF(NOW(), sale_date) AS days_passed FROM Sale;
SELECT DATE_ADD(sale_date, INTERVAL 7 DAY) AS plus_7_days FROM Sale;

UPDATE Product SET price = price + 5 WHERE product_id = 1;
UPDATE Product SET stock_quantity = stock_quantity - 5 WHERE product_id = 2;
UPDATE Employee SET role = 'senior manager' WHERE employee_id = 1;
UPDATE Monthly_Report SET conclusion = 'Outstanding' WHERE report_id = 5;
UPDATE Sale SET quantity = 2, total_price = 2 * 10 WHERE sale_id = 1;

DELETE FROM Sale WHERE sale_id = 30;
DELETE FROM Product WHERE stock_quantity = 0;
DELETE FROM Employee WHERE role = 'intern';
DELETE FROM Monthly_Report WHERE total_sales < 600;
DELETE FROM Report_Sale WHERE report_id = 12;

SELECT product_id, SUM(total_price) AS total_revenue
FROM Sale
GROUP BY product_id
ORDER BY total_revenue DESC;

SELECT product_id, employee_id, AVG(total_price) AS avg_sale
FROM Sale
GROUP BY product_id, employee_id;

SELECT employee_id, COUNT(*) AS sales_count
FROM Sale
GROUP BY employee_id
HAVING COUNT(*) > 5;

SELECT e.name, COUNT(s.sale_id) AS total_sales
FROM Employee e
JOIN Sale s ON e.employee_id = s.employee_id
GROUP BY e.name
ORDER BY total_sales DESC;

SELECT * 
FROM Product
WHERE price > (SELECT AVG(price) FROM Product);

SELECT * 
FROM Employee
WHERE employee_id IN (SELECT employee_id FROM Sale);

SELECT *
FROM Product p
WHERE price > (
    SELECT AVG(price)
    FROM Product
    WHERE stock_quantity < p.stock_quantity
);

SELECT *
FROM Product
WHERE price > ALL (
    SELECT price FROM Product WHERE stock_quantity < 10
);

SELECT *
FROM Sale
WHERE (product_id, employee_id) =
(
    SELECT product_id, employee_id
    FROM Sale
    ORDER BY total_price DESC
    LIMIT 1
);
