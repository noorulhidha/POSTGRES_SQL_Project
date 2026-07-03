CREATE DATABASE Zepto_Project;

DROP TABLE IF EXISTS zepto;

CREATE TABLE zepto(
sku_id SERIAL PRIMARY KEY,
category VARCHAR(50),
name VARCHAR(50) NOT NULL,
mrp NUMERIC (8,2),
discountPercent NUMERIC(5,2),
availableQuantity INTEGER,
discountedSellingprice NUMERIC(8,2),
WeighInGms INTEGER,
outOfStock BOOLEAN,
quantity INTEGER
);

--Data Cleaning--

--Count of rows
SELECT COUNT(*)
FROM zepto;

--Sample data
SELECT * FROM zepto
LIMIT 10;

--Null values
SELECT * FROM zepto 
WHERE name IS NULL
OR
category IS NULL
OR
mrp IS NULL
OR
discountPercent IS NULL
OR
discountedSellingPrice IS NULL
OR
weighInGms IS NULL
OR
availableQuantity IS NULL
OR
outOfStock IS NULL
OR
quantity IS NULL;

--Different Product Categories
SELECT DISTINCT category
FROM zepto
ORDER BY category;

--Product in stock vs out of stock
SELECT outOfStock,COUNT (sku_id)
FROM zepto
GROUP BY outOfStock;

--Product names present multiple times
SELECT name ,COUNT (sku_id) AS "Number of SKUs"
FROM zepto
GROUP BY name
HAVING COUNT (sku_id)>1
ORDER BY COUNT (sku_id) DESC;

--Products with price=0
SELECT * FROM zepto
WHERE mrp =0
OR discountedSellingPrice=0;

DELETE FROM zepto
WHERE mrp=0;

--Convert paise to rupees
UPDATE zepto 
SET mrp=mrp/100.0,
discountedSellingPrice = discountedSellingPrice/100.0;

SELECT mrp,discountedSellingPrice
FROM zepto;

--Rename column name
ALTER TABLE zepto 
RENAME COLUMN  weighInGms TO weightInGms;

--Data Exploration--

--Top 10 best valued products based on the discount percentage.
SELECT DISTINCT name,mrp,discountPercent
FROM zepto
ORDER BY discountpercent DESC
LIMIT 10;

--Products with high MRP but out of stock
SELECT DISTINCT name,mrp
FROM zepto
WHERE outOfStock =TRUE AND mrp>300
ORDER BY mrp DESC ;

--Calculate estimated revenue for each category
SELECT category,
SUM(discountedSellingprice* availableQuantity) AS total_revenue
FROM zepto
GROUP BY category
ORDER BY total_revenue;

--Find all products where MRP is greater than rs.500 and discount is less than 10%.
SELECT DISTINCT name,mrp,discountPercent
FROM zepto
WHERE mrp >500 AND discountPercent <10
ORDER BY mrp DESC ,discountPercent DESC;

--Top 5 categories offering the highest average discount percentage.
SELECT category,
ROUND(AVG (discountPercent),2) AS avg_discount
FROM zepto
GROUP BY category
ORDER BY avg_discount
LIMIT 5;

--Price per gram for products above 100g and sort  by best value.
SELECT DISTINCT name,weightINgms,discountedSellingPrice,
ROUND(discountedSellingPrice/weightInGms,2) AS price_per_gram
FROM zepto
WHERE weightInGms >100
ORDER BY price_per_gram;

--Group the products in to categories like low, medium and bulk.
SELECT DISTINCT name,weightInGms,
CASE WHEN weightInGms <1000 THEN 'Low'
     WHEN weightInGms <5000 THEN 'Medium'
	 ELSE 'Bulk'
	 END AS weight_category
FROM zepto;

--Total Inventory weight per category
SELECT category,
SUM(weightinGms * availableQuantity) AS total_weight
FROM zepto
GROUP BY  category
ORDER BY total_weight;