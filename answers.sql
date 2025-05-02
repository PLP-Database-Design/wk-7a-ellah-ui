USE sampleDB;
-- 1a) Create the table structure and insert sample data for the ProductDetail table
CREATE TABLE ProductDetail (
    OrderID INT,
    CustomerName VARCHAR(100),
    Products VARCHAR(255)
);
INSERT INTO ProductDetail (OrderID, CustomerName, Products)
VALUES 
    (101, 'John Doe', 'Laptop, Mouse'),
    (102, 'Jane Smith', 'Tablet, Keyboard, Mouse'),
    (103, 'Emily Clark', 'Phone');
-- Verify the data
SELECT * FROM ProductDetail;

-- 1b) Achieving 1NF (First Normal Form) by creating a new fixed table
CREATE TABLE ProductDetail1 AS
SELECT 101 AS OrderID, 'John Doe' AS CustomerName, 'Laptop' AS Product UNION ALL
SELECT 101, 'John Doe', 'Mouse' UNION ALL
SELECT 102, 'Jane Smith', 'Tablet' UNION ALL
SELECT 102, 'Jane Smith', 'Keyboard' UNION ALL
SELECT 102, 'Jane Smith', 'Mouse' UNION ALL
SELECT 103, 'Emily Clark', 'Phone';
-- See the result
SELECT * FROM ProductDetail1;

-- 2) Fixing 2NF (Second Normal Form) by creating orders and order_items tables
CREATE TABLE order1 AS
SELECT DISTINCT OrderID, CustomerName 
FROM ProductDetail1;

-- Create order_items table
CREATE TABLE order_items AS
SELECT OrderID, Product 
FROM ProductDetail1;

-- See the results
SELECT * FROM orders;
SELECT * FROM order_items;