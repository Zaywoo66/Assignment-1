CREATE DATABASE sales_department;
USE sales_department;
CREATE TABLE Product (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT NOT NULL
);

CREATE TABLE Employee (
    employee_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    role VARCHAR(50) NOT NULL
);

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

CREATE TABLE Monthly_Report (
    report_id SERIAL PRIMARY KEY,
    report_month VARCHAR(20) NOT NULL,
    total_sales DECIMAL(10,2) NOT NULL,
    conclusion VARCHAR(255) NOT NULL
);

CREATE TABLE Report_Sale (
    report_id INT NOT NULL,
    sale_id INT NOT NULL,
    PRIMARY KEY (report_id, sale_id),
    FOREIGN KEY (report_id) REFERENCES Monthly_Report(report_id),
    FOREIGN KEY (sale_id) REFERENCES Sale(sale_id)
);

ALTER TABLE Employee
ADD COLUMN login VARCHAR(50);

INSERT INTO Product (name, price, stock_quantity) VALUES
('Product A',10.00,100),
('Product B',12.50,80),
('Product C',15.00,60),
('Product D',18.00,50),
('Product E',20.00,40),
('Product F',22.00,30),
('Product G',25.00,25),
('Product H',30.00,20),
('Product I',35.00,15),
('Product J',40.00,10);

INSERT INTO Employee (name, role, login) VALUES
('John','manager','john1'),
('Anna','manager','anna1'),
('Mark','manager','mark1'),
('Sara','manager','sara1'),
('Tom','admin','tom1'),
('Linda','admin','linda1');

INSERT INTO Sale (product_id, employee_id, sale_date, quantity, total_price) VALUES
(1,1,'2024-01-03',2,20.00),
(2,2,'2024-01-05',1,12.50),
(3,3,'2024-01-07',3,45.00),
(4,4,'2024-01-10',1,18.00),
(5,1,'2024-01-12',2,40.00),
(6,2,'2024-01-15',1,22.00),
(7,3,'2024-01-18',2,50.00),
(8,4,'2024-01-20',1,30.00),
(9,1,'2024-01-22',1,35.00),
(10,2,'2024-01-25',1,40.00),
(3,3,'2024-01-27',2,30.00),
(1,4,'2024-01-29',1,10.00);

INSERT INTO Monthly_Report (report_month, total_sales, conclusion) VALUES
('January',352.50,'Good sales'),
('February',210.00,'Average'),
('March',150.00,'Low'),
('April',420.00,'Very good');

INSERT INTO Report_Sale (report_id, sale_id) VALUES
(1,1),(1,2),(1,3),(1,4),
(2,5),(2,6),(2,7),
(3,8),(3,9),
(4,10),(4,11),(4,12);
