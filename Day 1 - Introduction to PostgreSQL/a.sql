-- Why to use PostgreSQL ?
-- because it allows developers to tailor the database to their specific needs.

-- CREATION OF DATABASE
-- Using Query : CREATE DATABASE database_name
-- Using pgAdmin : right-click the Databases node and select Create > Database

-- PostgreSQL Data Types
-- Boolean
-- Character types such as char, varchar, and text.
-- Numeric types such as integer and floating-point number.
-- UUID for storing Universally Unique Identifiers
-- Array for storing array strings, numbers, etc.
-- JSON
-- SERIAL and BIGINT also used instead of UUID

-- PostgreSQL Constraints
-- Primary key
-- Foreign key
-- UNIQUE
-- NOT NULL
-- CHECK

-- Filters
-- Where
-- Limit similar to head in python
-- Fetch but like first k etc..
-- In
-- Between
-- Like used to filter data based on pattern matching using regex.
-- Is Null

-- Joins : INNER, LEFT, RIGHT, FULL

-- EXISTS keyword : It is used to check the existence of rows returned by a subquery

-- Prcatice
-- Step 1: Create the Customer Table
CREATE TABLE customer (
    customer_id SERIAL PRIMARY KEY, -- Auto-incrementing ID
    first_name VARCHAR(100) NOT NULL, -- Customer's first name
    last_name VARCHAR(100) NOT NULL, -- Customer's last name
    email VARCHAR(255) UNIQUE NOT NULL, -- Unique email
    created_date TIMESTAMPTZ NOT NULL DEFAULT NOW(), -- Record creation timestamp
    updated_date TIMESTAMPTZ -- Optional update timestamp
);

-- Step 2: Select All Customers
SELECT * FROM customer; -- Fetch all records from customer

-- Step 3: Drop the Customer Table If Exists
DROP TABLE IF EXISTS customer; -- Safely remove the table if it exists

-- Step 4: Add a New Column to Customer
ALTER TABLE customer ADD COLUMN active BOOLEAN; -- Add a boolean "active" column

-- Step 5: Drop the Newly Added Column
ALTER TABLE customer DROP COLUMN active; -- Remove the "active" column

-- Step 6: Rename Columns
ALTER TABLE customer RENAME COLUMN email TO email_address; -- Rename column
ALTER TABLE customer RENAME COLUMN email_address TO email; -- Rename back

-- Step 7: Rename Table
ALTER TABLE customer RENAME TO users; -- Rename customer to users
ALTER TABLE users RENAME TO customer; -- Rename back to customer

-- Step 8: Create Orders Table
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL REFERENCES customer(customer_id),
    order_date TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    order_number VARCHAR(50) NOT NULL,
    order_amount DECIMAL(10,2) NOT NULL
);

-- Step 9: Insert a Single Record in Customer
INSERT INTO customer(first_name, last_name, email, created_date, updated_date, active)
VALUES ('Bansi', 'Sachade', 'bansi.sachade@tatvasoft.com', NOW(), NULL, true);

-- Step 10: Insert Multiple Customer Records
INSERT INTO customer (first_name, last_name, email, created_date, updated_date, active) VALUES
('John', 'Doe', 'johndoe@example.com', NOW(), NULL, true),
('Alice', 'Smith', 'alicesmith@example.com', NOW(), NULL, true),
('Bob', 'Johnson', 'bjohnson@example.com', NOW(), NULL, true),
('Emma', 'Brown', 'emmabrown@example.com', NOW(), NULL, true),
('Michael', 'Lee', 'michaellee@example.com', NOW(), NULL, false),
('Sarah', 'Wilson', 'sarahwilson@example.com', NOW(), NULL, true),
('David', 'Clark', 'davidclark@example.com', NOW(), NULL, true),
('Eva', 'Martinez', 'evamartinez@example.com', NOW(), NULL, true),
('James', 'Garcia', 'jamesgarcia@example.com', NOW(), NULL, false),
('Sophie', 'Lopez', 'sophielopez@example.com', NOW(), NULL, false),
('Jennifer', 'Davis', 'jennifer.davis@example.com', NOW(), NULL, true),
('Jennie', 'Terry', 'jennie.terry@example.com', NOW(), NULL, true),
('JENNY', 'SMITH', 'jenny.smith@example.com', NOW(), NULL, true),
('Hiren', 'Patel', 'hirenpatel@example.com', NOW(), NULL, false);

-- Step 11: Insert Orders
INSERT INTO orders (customer_id, order_date, order_number, order_amount) VALUES
(1, '2024-01-01', 'ORD001', 50.00),
(2, '2024-01-01', 'ORD002', 35.75),
(3, '2024-01-01', 'ORD003', 100.00),
(4, '2024-01-01', 'ORD004', 30.25),
(5, '2024-01-01', 'ORD005', 90.75),
(6, '2024-01-01', 'ORD006', 25.50),
(7, '2024-01-01', 'ORD007', 60.00),
(8, '2024-01-01', 'ORD008', 42.00),
(9, '2024-01-01', 'ORD009', 120.25),
(10, '2024-01-01', 'ORD010', 85.00),
(11, '2024-01-01', 'ORD011', 85.00),
(12, '2024-01-01', 'ORD012', 80.25),
(13, '2024-01-01', 'ORD013', 70.00),
(14, '2024-01-01', 'ORD014', 45.00),
(15, '2024-01-01', 'ORD015', 95.50),
(16, '2024-01-01', 'ORD016', 27.50),
(17, '2024-01-01', 'ORD017', 65.75),
(18, '2024-01-01', 'ORD018', 75.50);

-- Step 12: Basic Select Queries
-- 1) Using PostgreSQL SELECT statement to query data from one column example
SELECT first_name FROM customer;

-- 2) Using PostgreSQL SELECT statement to query data from multiple columns example
SELECT first_name, last_name, email FROM customer;

-- 3) Using PostgreSQL SELECT statement to query data from all columns of a table example
SELECT * FROM customer;

-- Step 13: Order By Queries
-- 1) Order by first_name in ascending order
SELECT first_name, last_name FROM customer ORDER BY first_name ASC;

-- 2) Order by last_name in descending order
SELECT first_name, last_name FROM customer ORDER BY last_name DESC;

-- 3) Order by first_name in ascending and then by last_name in descending order
SELECT customer_id, first_name, last_name FROM customer ORDER BY first_name ASC, last_name DESC;

-- Step 14: WHERE Clause Examples
-- 1) Filter by exact first name
SELECT last_name, first_name 
FROM customer 
WHERE first_name = 'Hiren';

-- 2) Filter by first name OR last name
SELECT customer_id, first_name, last_name 
FROM customer 
WHERE first_name = 'Hiren' OR last_name = 'Parejiya';

-- 3) Filter by multiple first names using IN
SELECT customer_id, first_name, last_name 
FROM customer 
WHERE first_name IN ('John', 'David', 'James');

-- 4) Case-sensitive match using LIKE
SELECT first_name, last_name 
FROM customer 
WHERE first_name LIKE '%en%';

-- 5) Case-insensitive match using ILIKE
SELECT first_name, last_name 
FROM customer 
WHERE first_name ILIKE '%en%';

-- Step 15: JOIN Examples
-- 1) INNER JOIN orders with customer on customer_id
SELECT * 
FROM orders AS o 
INNER JOIN customer AS c 
ON o.customer_id = c.customer_id;

-- 2) LEFT JOIN customer with orders on customer_id
SELECT * 
FROM customer AS c 
LEFT JOIN orders AS o 
ON c.customer_id = o.customer_id;

-- Step 16: Aggregation with GROUP BY
SELECT c.customer_id, c.first_name, c.last_name, c.email,
       COUNT(o.order_id) AS NoOfOrders,
       SUM(o.order_amount) AS Total
FROM customer AS c
INNER JOIN orders AS o ON c.customer_id = o.customer_id
GROUP BY c.customer_id;

-- Step 17: GROUP BY with HAVING
SELECT c.customer_id, c.first_name, c.last_name, c.email,
       COUNT(o.order_id) AS No_Orders,
       SUM(o.order_amount) AS Total
FROM customer AS c
INNER JOIN orders AS o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
HAVING COUNT(o.order_id) > 1;

-- Step 19: Subqueries
-- 1) PostgreSQL subquery with IN operator
SELECT * FROM orders WHERE customer_id IN (
    SELECT customer_id FROM customer WHERE active = true
);

-- 2) PostgreSQL subquery with EXISTS operator
SELECT customer_id, first_name, last_name, email
FROM customer
WHERE EXISTS (
    SELECT 1 FROM orders WHERE orders.customer_id = customer.customer_id
);

-- Step 20: Update Statement
UPDATE customer
SET first_name = 'bansi', last_name = 'sachade', email = 'bansi.sachade@tatvasoft.com'
WHERE customer_id = 1;

-- Step 21: Delete Statement
DELETE FROM customer WHERE customer_id = 11;
