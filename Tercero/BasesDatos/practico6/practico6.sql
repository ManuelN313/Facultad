--1

WITH total_employees_per_office (officeCode, total_employees) AS (
    SELECT officeCode, count(*) AS total_employees
    FROM employees
    GROUP BY (officeCode)
)
SELECT *
FROM offices
INNER JOIN total_employees_per_office AS tepo ON tepo.officeCode = offices.officeCode
WHERE tepo.total_employees IN (
    SELECT max(total_employees)
    FROM total_employees_per_office
);

--2 

-- Promedio
WITH orders_customer (orderNumber, employeeNumber) AS (
    SELECT orders.orderNumber AS orderNumber, customers.salesRepEmployeeNumber AS employeeNumber 
    FROM orders
    INNER JOIN customers ON customers.customerNumber = orders.customerNumber
),
orders_customer_office (orderNumber, officeCode) AS (
    SELECT oc.orderNumber, employees.officeCode
    FROM orders_customer AS oc
    INNER JOIN employees ON employees.employeeNumber = oc.employeeNumber
),
total_orders_per_office (officeCode, total_orders) AS (
    SELECT officeCode, count(orderNumber)
    FROM orders_customer_office
    GROUP BY (officeCode)
)
SELECT avg(total_orders)
FROM total_orders_per_office;

-- Maximo
WITH orders_customer (orderNumber, employeeNumber) AS (
    SELECT orders.orderNumber AS orderNumber, customers.salesRepEmployeeNumber AS employeeNumber 
    FROM orders
    INNER JOIN customers ON customers.customerNumber = orders.customerNumber
),
orders_customer_office (orderNumber, officeCode) AS (
    SELECT oc.orderNumber, employees.officeCode
    FROM orders_customer AS oc
    INNER JOIN employees ON employees.employeeNumber = oc.employeeNumber
),
total_orders_per_office (officeCode, total_orders) AS (
    SELECT officeCode, count(orderNumber)
    FROM orders_customer_office
    GROUP BY (officeCode)
)
SELECT *
FROM total_orders_per_office AS topo
WHERE topo.total_orders IN (
    SELECT max(total_orders)
    FROM total_orders_per_office
)

-- 3

SELECT month(paymentDate) AS payment_month, avg(amount) AS avg_payment, max(amount) AS max_payment, min(amount) AS min_payment
FROM payments
GROUP BY (payment_month);

-- 4

CREATE PROCEDURE updateCredit (IN new_creditLimit DECIMAL(10,2), IN clientNumber INT(11))
UPDATE customers
SET creditLimit = new_creditLimit
WHERE customers.customerNumber = clientNumber;

-- 5

CREATE VIEW premiumCustomers (customerName, city, totalSpent) AS
SELECT customers.customerName AS customerName, customers.city AS city, customerSpending.totalSpent AS totalSpent
FROM (
    SELECT customerNumber, sum(amount) AS totalSpent
    FROM payments
    GROUP BY (customerNumber)
    ORDER BY totalSpent DESC
    LIMIT 10
) AS customerSpending
INNER JOIN customers ON customers.customerNumber = customerSpending.customerNumber;

-- 6

DELIMITER //
CREATE FUNCTION employeeOfTheMonth(in_month INT, in_year INT)
RETURNS VARCHAR(101)
READS SQL DATA
BEGIN
    DECLARE fullName VARCHAR(101);

    SELECT CONCAT(employees.firstName, " ", employees.lastName) INTO fullName
    FROM (
        SELECT employeeNumber, count(orderNumber) AS total_orders
        FROM (
            SELECT orders.orderNumber AS orderNumber, customers.salesRepEmployeeNumber AS employeeNumber 
            FROM orders
            INNER JOIN customers ON customers.customerNumber = orders.customerNumber
            WHERE month(orders.orderDate) = in_month AND month(orders.orderDate) = in_month
        ) AS orders_month_handle_by_employee
        GROUP BY (employeeNumber)
        ORDER BY total_orders DESC
        LIMIT 1
    ) AS employee_of_the_month
    INNER JOIN employees ON employee_of_the_month.employeeNumber = employees.employeeNumber;
    RETURN fullName;
END;
//

SELECT employeeOfTheMonth(4, 2004) AS employeeOfTheMonth_4_2004;

-- 7

CREATE TABLE productsRefillment (
    refillmentID INT AUTO_INCREMENT,
    productCode VARCHAR(15) NOT NULL,
    orderDate DATE NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (refillmentID),
    FOREIGN KEY (productCode) REFERENCES products(productCode)
);

-- 8 (No usar INNER JOIN en un TRIGGER)

CREATE TRIGGER restock_product
AFTER INSERT ON orderdetails 
FOR EACH ROW
INSERT INTO productsRefillment (productCode, orderDate, quantity)
SELECT products.productCode, CURDATE(), 10
FROM products
WHERE products.quantityInStock - new.quantityOrdered < 10 AND new.productCode = products.productCode;

-- 9

CREATE ROLE Empleado;
GRANT SELECT, CREATE VIEW ON classicmodels.*
TO Empleado;