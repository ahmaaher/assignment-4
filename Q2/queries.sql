
-- 1. from “orderdetails” table. Write a query to get
-- all order numbers (without repetition)
-- that contain any product starting with code (S18) and price more than (100). 
-- SELECT orderNumber FROM orderdetails WHERE productCode LIKE 'S18%' AND priceEach > 100 GROUP BY orderNumber ORDER BY orderNumber ASC;
SELECT DISTINCT orderNumber FROM orderdetails WHERE productCode LIKE 'S18%' AND priceEach > 100 ORDER BY orderNumber ASC;

-- 2. from “payments” table. Write a query to get all
-- payments that were made on day (5) or (6)  (whatever month or year).
SELECT * FROM `payments` WHERE 
	paymentDate LIKE '%05'
    OR paymentDate LIKE '%06';

-- 3. from “customers” table. Write a query to get
-- the fifth-highest credit limit of the customers
-- who (live in the USA and their phone number contains 5555).
SELECT * FROM customers WHERE country = 'USA' AND phone LIKE '%5555%' ORDER BY creditLimit DESC LIMIT 5;

-- 4. From the employees and offices tables, find the first name,
-- last name, office number, and office city for each employee.
SELECT firstName, lastName, e.officeCode, city FROM employees AS e
JOIN offices AS o ON e.officeCode = o.officeCode;

-- 5. From the employees and offices tables, find all those
-- employees who work in office ID (4) or (6).
-- Return first name, last name, office number and office city.
SELECT firstName, lastName, e.officeCode, city FROM employees AS e
JOIN offices AS o ON e.officeCode = o.officeCode
WHERE e.officeCode LIKE '4' OR e.officeCode LIKE '6';
