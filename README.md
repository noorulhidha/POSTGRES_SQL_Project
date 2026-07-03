# POSTGRES_SQL_Project

# 🛒 Zepto Product Inventory & Pricing Analysis using PostgreSQL

## 📌 Project Overview

This project analyzes Zepto's product inventory and pricing data using PostgreSQL. The objective is to clean the dataset, perform exploratory data analysis (EDA), and extract meaningful business insights related to product pricing, discounts, inventory, and categories.

The project demonstrates practical SQL skills including data cleaning, transformation, aggregation, filtering, conditional logic, and business analysis.

---

## 📁 Project Structure

```text
Zepto-SQL-Project/
│
├── SQL-Zepto Project.sql      # Complete SQL script
├── dataset.csv                # Raw dataset (optional)
├── README.md                  # Project documentation
```

## 📂 Dataset

The dataset contains product-level information from Zepto, including:

* SKU ID
* Product Name
* Category
* MRP
* Discount Percentage
* Discounted Selling Price
* Available Quantity
* Product Weight
* Stock Availability
* Quantity

---

## 🛠️ Tools Used

* PostgreSQL
* pgAdmin

---

## 📊 Project Workflow

### 1. Database Setup

* Created a new PostgreSQL database
* Created the `zepto` table
* Imported the dataset

### 2. Data Cleaning

Performed multiple cleaning operations such as:

* Checked total number of records
* Identified NULL values
* Removed products with invalid prices
* Converted prices from paise to rupees
* Renamed columns for better readability
* Validated duplicate product names

---

## 🔍 Exploratory Data Analysis (EDA)

The analysis answers several business questions including:

* Top 10 highest discounted products
* Premium products currently out of stock
* Estimated inventory revenue by category
* High-priced products with low discounts
* Categories offering the highest average discounts
* Products with the best price per gram
* Product segmentation based on weight
* Total inventory weight by category

---

## 💡 Key SQL Concepts Used

* SELECT
* WHERE
* ORDER BY
* GROUP BY
* HAVING
* DISTINCT
* Aggregate Functions (`COUNT`, `SUM`, `AVG`)
* CASE Statements
* UPDATE
* DELETE
* ALTER TABLE
* Data Cleaning Techniques

---

## 📈 Key Insights

* Identified products with the highest discount percentages.
* Estimated inventory revenue across different categories.
* Detected expensive products that were unavailable in stock.
* Compared pricing efficiency using price per gram.
* Classified products into Low, Medium, and Bulk weight categories.
* Evaluated inventory distribution across product categories.

---

## 🚀 Learning Outcomes

Through this project, I strengthened my understanding of:

* SQL Data Cleaning
* Exploratory Data Analysis
* Business Query Writing
* Inventory Analysis
* Pricing Analysis
* PostgreSQL Database Operations
* Writing optimized SQL queries

---
