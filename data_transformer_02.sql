CREATE DATABASE IF NOT EXISTS second_project;

USE second_project;

-- Creating Customer Table with correct column names from image
CREATE TABLE customer_table (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    RegistrationDate DATE
);

DESC customer_table;

INSERT INTO customer_table VALUES
(1, 'John', 'Doe', 'john.doe@email.com', '2022-03-15'),
(2, 'Jane', 'Smith', 'jane.smith@email.com', '2021-11-02');

SELECT * FROM customer_table;

-- Creating Orders Table with correct column names from image
CREATE TABLE order_table (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES customer_table(CustomerID)
);

DESC order_table;

INSERT INTO order_table VALUES
(101, 1, '2023-07-01', 150.50),
(102, 2, '2023-07-03', 200.75);

SELECT * FROM order_table;

-- Creating Employees Table with correct column names from image
CREATE TABLE employee_table (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(100),
    HireDate DATE,
    Salary DECIMAL(10,2)
);

DESC employee_table;

INSERT INTO employee_table VALUES
(1, 'Mark', 'Johnson', 'Sales', '2020-01-15', 50000.00),
(2, 'Susan', 'Lee', 'HR', '2021-03-20', 55000.00);

SELECT * FROM employee_table;


---=================================================

-- 1. INNER JOIN: Retrieve all orders and customer details where orders exist.
SELECT c.FirstName,o.OrderID,o.TotalAmount
FROM customer_table AS c
INNER JOIN order_table AS o
ON c.CustomerID = o.CustomerID;

-- 2. LEFT JOIN: Retrieve all customers and their corresponding orders (if any).
SELECT c.CustomerID,
c.FirstName,
o.OrderID,
o.TotalAmount
FROM customer_table AS c
LEFT JOIN order_table AS o
ON c.CustomerID = o.CustomerID;

-- 3. RIGHT JOIN: Retrieve all orders and their corresponding customers (if any).
SELECT c.CustomerID,
c.FirstName,
c.LastName,
o.OrderID,
o.TotalAmount
FROM customer_table AS c
RIGHT JOIN order_table AS o
ON c.CustomerID = o.CustomerID;

-- 4. FULL OUTER JOIN: Retrieve all customers and all orders, regardless of matching.
SELECT c.CustomerID,
c.FirstName,
c.LastName,
o.OrderID,
o.TotalAmount
FROM customer_table AS c
LEFT JOIN order_table AS o
ON c.CustomerID = o.CustomerID
    
UNION
    
SELECT c.CustomerID,
c.FirstName,
c.LastName,
o.OrderID,
o.TotalAmount
FROM customer_table AS c
RIGHT JOIN order_table AS o
ON c.CustomerID = o.CustomerID;

-- 5. Subquery to find customers who have placed orders worth more than the average amount.
SELECT DISTINCT c.CustomerID,
c.FirstName,
c.LastName,
o.TotalAmount
FROM customer_table AS c
INNER JOIN order_table AS o
ON c.CustomerID = o.CustomerID
WHERE o.TotalAmount > (SELECT AVG(TotalAmount)
FROM order_table
);

-- 6. Subquery to find employees with salaries above the average salary.
SELECT DISTINCT
e.EmployeeID,
e.FirstName,
e.LastName,
e.Salary
FROM employee_table AS e
WHERE e.Salary > (SELECT AVG(Salary)
FROM employee_table
);

-- 7. Extract the year and month from the OrderDate.
SELECT
OrderID,
OrderDate,
YEAR(OrderDate) AS Order_year,
MONTH(OrderDate) AS Order_month
FROM order_table;

-- 8. Calculate the difference in days between two dates (order date and current date).
SELECT
OrderID,
CustomerID,
OrderDate,
DATEDIFF(CURRENT_DATE, OrderDate) AS Date_difference
FROM order_table;

-- 9. Format the OrderDate to a more readable format (e.g., 'DD-MMM-YYYY').
SELECT OrderID , OrderDate,
DATE_FORMAT(OrderDate, '%d-%b-%Y') AS Formatted_date
FROM order_table;

-- 10. Concatenate FirstName and LastName to form a full name.
SELECT
EmployeeID,
FirstName,
LastName,
CONCAT(FirstName, ' ', LastName) AS Full_name
FROM employee_table;

-- 11. Replace part of a string (e.g., replace 'John' with 'Jonathan').
SELECT
FirstName,
REPLACE(FirstName, 'John', 'Jonathan') AS Updated_name
FROM customer_table;

-- 12. Convert FirstName to uppercase and LastName to lowercase.
SELECT
FirstName,
LastName,
UPPER(FirstName) AS Upper_firstname,
LOWER(LastName) AS Lower_lastname
FROM customer_table;

-- 13. Trim extra spaces from the Email field.
SELECT
Email,
TRIM(Email) AS Trimmed_email
FROM customer_table;

-- 14. Calculate the running total of TotalAmount for each order.
SELECT OrderID , TotalAmount ,
SUM(TotalAmount) OVER (ORDER BY OrderID) AS Running_total
FROM order_table;

-- 15. Rank orders based on TotalAmount using the RANK() function.
SELECT OrderID , TotalAmount,
RANK() OVER (ORDER BY TotalAmount) AS Order_rank
FROM order_table;

-- 16. Assign a discount based on TotalAmount in orders (e.g., > 1000: 10% off, > 500: 5% off).
SELECT OrderID,
TotalAmount,
CASE
    WHEN TotalAmount > 1000 THEN '10% Discount'
    WHEN TotalAmount > 500 THEN '5% Discount'
    ELSE 'No Discount'
END AS Discount
FROM order_table;

-- 17. Categorize employees' salaries as high, medium, or low.
SELECT
EmployeeID,
Salary,
CASE
    WHEN Salary > 55000 THEN 'HIGH'
    WHEN Salary > 50000 THEN 'MEDIUM'
    ELSE 'LOW'
END AS Categorized_employees
FROM employee_table
ORDER BY EmployeeID;
