CREATE TABLE Product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT NOT NULL
);

CREATE TABLE Employee (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    role VARCHAR(50) NOT NULL
);


CREATE TABLE Sale (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    employee_id INT,
    sale_date DATE NOT NULL,
    quantity INT NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_sale_product
        FOREIGN KEY (product_id)
        REFERENCES Product(product_id),
    CONSTRAINT fk_sale_employee
        FOREIGN KEY (employee_id)
        REFERENCES Employee(employee_id)
    
);


CREATE TABLE Monthly_Report (
    report_id INT AUTO_INCREMENT PRIMARY KEY,
    report_month DATE NOT NULL,
    total_sales DECIMAL(10,2) NOT NULL,
    conclusion VARCHAR(255)
);


CREATE TABLE Report_Sale (
    report_id INT NOT NULL,
    sale_id INT NOT NULL,
    PRIMARY KEY (report_id, sale_id),
    CONSTRAINT fk_report_sale_report
        FOREIGN KEY (report_id)
        REFERENCES Monthly_Report(report_id),
    CONSTRAINT fk_report_sale_sale
        FOREIGN KEY (sale_id)
        REFERENCES Sale(sale_id)
       
);


