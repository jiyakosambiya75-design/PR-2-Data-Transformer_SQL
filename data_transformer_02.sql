CREATE DATABASE IF NOT EXISTS second_project;

USE second_project;

CREATE TABLE customer_table (
    Customer_ID INT PRIMARY KEY,
    First_name VARCHAR(50),
    Second_name VARCHAR(50),
    Email VARCHAR(100),
    Registration_date DATE
);

DESC customer_table;

INSERT INTO customer_table VALUES
(1, 'John', 'Doe', 'john.doe@email.com', '2022-03-15'),
(2, 'Jane', 'Smith', 'jane.smith@email.com', '2021-11-02');

SELECT * FROM customer_table;


CREATE TABLE order_table (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    Order_date DATE,
    Total_Amount DECIMAL(10,2),
    FOREIGN KEY (Customer_ID)
    REFERENCES customer_table(Customer_ID)
);

DESC order_table;

INSERT INTO order_table VALUES
(101, 1, '2023-07-01', 150.50),
(102, 2, '2023-07-03', 200.75);

SELECT * FROM order_table;


CREATE TABLE employee_table (
    Employee_ID INT PRIMARY KEY,
    First_name VARCHAR(50),
    Second_name VARCHAR(50),
    Department VARCHAR(100),
    Hire_date DATE,
    Salary DECIMAL(10,2)
);

DESC employee_table;

INSERT INTO employee_table VALUES
(1, 'Mark', 'Johnson', 'Sales', '2020-01-15', 50000.00),
(2, 'Susan', 'Lee', 'HR', '2021-03-20', 55000.00);

SELECT * FROM employee_table;


SELECT
c.First_name,
o.Order_ID,
o.Total_Amount
FROM customer_table AS c
INNER JOIN order_table AS o
ON c.Customer_ID = o.Customer_ID;


SELECT
c.Customer_ID,
c.First_name,
o.Order_ID,
o.Total_Amount
FROM customer_table AS c
LEFT JOIN order_table AS o
ON c.Customer_ID = o.Customer_ID;


SELECT
c.Customer_ID,
c.First_name,
c.Second_name,
o.Order_ID,
o.Total_Amount
FROM customer_table AS c
RIGHT JOIN order_table AS o
ON c.Customer_ID = o.Customer_ID;


SELECT
c.Customer_ID,
c.First_name,
c.Second_name,
o.Order_ID,
o.Total_Amount
FROM customer_table AS c
LEFT JOIN order_table AS o
ON c.Customer_ID = o.Customer_ID

UNION

SELECT
c.Customer_ID,
c.First_name,
c.Second_name,
o.Order_ID,
o.Total_Amount
FROM customer_table AS c
RIGHT JOIN order_table AS o
ON c.Customer_ID = o.Customer_ID;


SELECT DISTINCT
c.Customer_ID,
c.First_name,
c.Second_name,
o.Total_Amount
FROM customer_table AS c
INNER JOIN order_table AS o
ON c.Customer_ID = o.Customer_ID
WHERE o.Total_Amount > (
    SELECT AVG(Total_Amount)
    FROM order_table
);


SELECT DISTINCT
e.Employee_ID,
e.First_name,
e.Second_name,
e.Salary
FROM employee_table AS e
WHERE e.Salary > (
    SELECT AVG(Salary)
    FROM employee_table
);


SELECT
Order_ID,
Order_date,
YEAR(Order_date) AS Order_year,
MONTH(Order_date) AS Order_month
FROM order_table;


SELECT
Order_ID,
Customer_ID,
Order_date,
DATEDIFF(CURRENT_DATE, Order_date) AS Date_difference
FROM order_table;


SELECT
Order_ID,
Order_date,
DATE_FORMAT(Order_date, '%d-%m-%Y') AS Formatted_date
FROM order_table;


SELECT
Employee_ID,
First_name,
Second_name,
CONCAT(First_name, ' ', Second_name) AS Full_name
FROM employee_table;


SELECT
First_name,
REPLACE(First_name, 'John', 'Jonathan') AS Updated_name
FROM customer_table;


SELECT
First_name,
Second_name,
UPPER(First_name) AS Upper_firstname,
LOWER(Second_name) AS Lower_secondname
FROM customer_table;


SELECT
Email,
TRIM(Email) AS Trimmed_email
FROM customer_table;


SELECT
Order_ID,
Total_Amount,
SUM(Total_Amount) OVER (
    ORDER BY Order_ID
) AS Running_total
FROM order_table;


SELECT
Order_ID,
Total_Amount,
RANK() OVER (
    ORDER BY Total_Amount
) AS Order_rank
FROM order_table;


SELECT
Order_ID,
Total_Amount,
CASE
    WHEN Total_Amount > 1000 THEN '10% Discount'
    WHEN Total_Amount > 500 THEN '5% Discount'
    ELSE 'No Discount'
END AS Discount
FROM order_table;


SELECT
Employee_ID,
Salary,
CASE
    WHEN Salary > 55000 THEN 'HIGH'
    WHEN Salary > 50000 THEN 'MEDIUM'
    ELSE 'LOW'
END AS Categorized_employees
FROM employee_table
ORDER BY Employee_ID;
