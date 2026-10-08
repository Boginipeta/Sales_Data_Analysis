show global variables like
'local_infile';

SET global local_infile = 1;
CREATE DATABASE ecom_analysis;

USE ecom_analysis;

DROP TABLE IF EXISTS sales;

-- Creating sales table

CREATE TABLE sales (
    Order_ID INT PRIMARY KEY,
    Order_Date DATE,
    Customer_ID VARCHAR(10),
    Product VARCHAR(50),
    Category VARCHAR(50),
    Region VARCHAR(30),
    Quantity INT,
    Unit_Price DECIMAL(10,2),
    Discount DECIMAL(5,2),
    Sales DECIMAL(12,2)
);

-- Importing sales data csv file into MYSQL

LOAD DATA LOCAL INFILE 'C:\\Users\\sowji\\Downloads\\ecommerce_sales_1500_rows.csv'
INTO TABLE sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    Order_ID,
    Order_Date,
    Customer_ID,
    Product,
    Category,
    Region,
    Quantity,
    Unit_Price,
    Discount,
    Sales
);

-- Printing table

select * from sales;

-- Printing count of sales

select count(*) from sales;

-- Selecting 10 sales 

select * from sales
limit 10;

-- TOTAL SALES
SELECT SUM(Sales) AS Total_Sales
FROM sales;

-- Sales by Category
SELECT
    Category,
    SUM(Sales) AS Total_Sales
FROM sales
GROUP BY Category
ORDER BY Total_Sales DESC;

-- Top 5 products
SELECT
    Product,
    SUM(Sales) AS Total_Sales
FROM sales
GROUP BY Product
ORDER BY Total_Sales DESC
LIMIT 5;

-- Sales by Region
SELECT
    Region,
    SUM(Sales) AS Total_Sales
FROM sales
GROUP BY Region
ORDER BY Total_Sales DESC;

-- Highest spending customers
SELECT
    Customer_ID,
    SUM(Sales) AS Total_Spending
FROM sales
GROUP BY Customer_ID
ORDER BY Total_Spending DESC
LIMIT 5;

-- Average order value
SELECT
    AVG(Sales) AS Average_Order_Value
FROM sales;

-- Orders greayer than 50000
SELECT *
FROM sales
WHERE Sales > 50000;