-- ==========================
--  PRODUCTS
-- ==========================
CREATE TABLE Product (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT NOT NULL
);

-- ==========================
--  EMPLOYEES
-- ==========================
CREATE TABLE Employee (
    employee_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    role VARCHAR(50) NOT NULL
);

-- ==========================
--  SALES
-- ==========================
CREATE TABLE Sale (
    sale_id SERIAL PRIMARY KEY,
    product_id INT NOT NULL,
    employee_id INT NOT NULL,
    sale_date DATE NOT NULL,
    quantity INT NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES Product(product_id),
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);

-- ==========================
--  MONTHLY REPORTS
-- ==========================
CREATE TABLE Monthly_Report (
    report_id SERIAL PRIMARY KEY,
    report_month VARCHAR(20) NOT NULL,
    total_sales DECIMAL(10,2) NOT NULL,
    conclusion VARCHAR(255) NOT NULL
);

-- ==========================
--  REPORT SALES (Link Table)
-- ==========================
CREATE TABLE Report_Sale (
    report_id INT NOT NULL,
    sale_id INT NOT NULL,
    PRIMARY KEY (report_id, sale_id),
    FOREIGN KEY (report_id) REFERENCES Monthly_Report(report_id),
    FOREIGN KEY (sale_id) REFERENCES Sale(sale_id)
);
