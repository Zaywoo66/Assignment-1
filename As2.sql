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
('Product A',10.00,100),('Product B',12.50,90),('Product C',15.00,80),
('Product D',18.00,70),('Product E',20.00,60),('Product F',22.00,50),
('Product G',25.00,45),('Product H',30.00,40),('Product I',35.00,35),
('Product J',40.00,30),('Product K',45.00,28),('Product L',50.00,26),
('Product M',55.00,24),('Product N',60.00,22),('Product O',65.00,20),
('Product P',70.00,18),('Product Q',75.00,16),('Product R',80.00,14),
('Product S',85.00,12),('Product T',90.00,10),('Product U',95.00,9),
('Product V',100.00,8),('Product W',105.00,7),('Product X',110.00,6),
('Product Y',115.00,5),('Product Z',120.00,4),('Product AA',125.00,3),
('Product AB',130.00,3),('Product AC',135.00,2),('Product AD',140.00,2);

INSERT INTO Employee (name, role, login) VALUES
('John','manager','john1'),('Anna','manager','anna1'),('Mark','manager','mark1'),
('Sara','manager','sara1'),('Tom','admin','tom1'),('Linda','admin','linda1'),
('Alex','manager','alex1'),('Kate','manager','kate1'),('Bob','admin','bob1'),
('Emma','admin','emma1'),('Mike','manager','mike1'),('Olga','manager','olga1'),
('Paul','admin','paul1'),('Nina','manager','nina1'),('Leo','admin','leo1'),
('Ivy','manager','ivy1'),('Sam','admin','sam1'),('Eva','manager','eva1'),
('Dan','admin','dan1'),('Liam','manager','liam1'),('Sophia','manager','sophia1'),
('Noah','admin','noah1'),('Mia','manager','mia1'),('James','admin','james1'),
('Ella','manager','ella1'),('Lucas','admin','lucas1'),('Ava','manager','ava1'),
('Ethan','admin','ethan1'),('Chloe','manager','chloe1'),('Ryan','admin','ryan1');

INSERT INTO Sale (product_id, employee_id, sale_date, quantity, total_price) VALUES
(1,1,'2024-01-01',2,20.00),(2,2,'2024-01-02',1,12.50),(3,3,'2024-01-03',3,45.00),
(4,4,'2024-01-04',1,18.00),(5,5,'2024-01-05',2,40.00),(6,6,'2024-01-06',1,22.00),
(7,7,'2024-01-07',2,50.00),(8,8,'2024-01-08',1,30.00),(9,9,'2024-01-09',1,35.00),
(10,10,'2024-01-10',1,40.00),(11,11,'2024-01-11',1,45.00),(12,12,'2024-01-12',1,50.00),
(13,13,'2024-01-13',2,110.00),(14,14,'2024-01-14',1,60.00),(15,15,'2024-01-15',1,65.00),
(16,16,'2024-01-16',2,140.00),(17,17,'2024-01-17',1,75.00),(18,18,'2024-01-18',1,80.00),
(19,19,'2024-01-19',1,85.00),(20,20,'2024-01-20',1,90.00),
(21,21,'2024-01-21',1,95.00),(22,22,'2024-01-22',1,100.00),
(23,23,'2024-01-23',1,105.00),(24,24,'2024-01-24',1,110.00),
(25,25,'2024-01-25',1,115.00),(26,26,'2024-01-26',1,120.00),
(27,27,'2024-01-27',1,125.00),(28,28,'2024-01-28',1,130.00),
(29,29,'2024-01-29',1,135.00),(30,30,'2024-01-30',1,140.00);

INSERT INTO Monthly_Report (report_month, total_sales, conclusion) VALUES
('January',1500.00,'Excellent'),('February',1200.00,'Good'),('March',900.00,'Average'),
('April',1800.00,'Excellent'),('May',700.00,'Low'),('June',1600.00,'Very good'),
('July',1100.00,'Good'),('August',1300.00,'Good'),('September',1400.00,'Very good'),
('October',1000.00,'Average'),('November',1700.00,'Excellent'),('December',2000.00,'Outstanding'),
('Jan-2023',800.00,'Average'),('Feb-2023',950.00,'Average'),('Mar-2023',1050.00,'Good'),
('Apr-2023',1150.00,'Good'),('May-2023',1250.00,'Good'),('Jun-2023',1350.00,'Very good'),
('Jul-2023',1450.00,'Very good'),('Aug-2023',1550.00,'Excellent'),
('Sep-2023',1650.00,'Excellent'),('Oct-2023',1750.00,'Excellent'),
('Nov-2023',1850.00,'Excellent'),('Dec-2023',1950.00,'Outstanding'),
('Q1-2024',3000.00,'Strong'),('Q2-2024',3200.00,'Strong'),
('Q3-2024',3400.00,'Strong'),('Q4-2024',3600.00,'Outstanding'),
('Annual-2023',18000.00,'Successful'),('Annual-2024',20000.00,'Outstanding');

INSERT INTO Report_Sale (report_id, sale_id) VALUES
(1,1),(1,2),(1,3),(2,4),(2,5),(2,6),(3,7),(3,8),(3,9),(4,10),
(4,11),(4,12),(5,13),(5,14),(5,15),(6,16),(6,17),(6,18),(7,19),
(7,20),(7,21),(8,22),(8,23),(8,24),(9,25),(9,26),(10,27),(10,28),
(11,29),(12,30);
