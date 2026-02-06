This project focuses on analyzing real-world product data from Zepto, sourced from Kaggle, using PostgreSQL. The dataset was initially downloaded in CSV format and contained encoding issues (UTF-16), which caused errors during import into PostgreSQL. This was resolved by converting the file encoding from UTF-16 to UTF-8 using Notepad++, ensuring successful data ingestion.
A structured relational table was designed in PostgreSQL to store product-level information such as category, MRP, discount, stock availability, quantity, and weight. The project involved complete data exploration, data cleaning, and business-driven SQL analysis.
During data cleaning, issues such as zero MRP values, inconsistent price units (paisa to rupees), null values, duplicate product names, and stock inconsistencies were identified and handled. After preparing the dataset, multiple analytical SQL queries were written to extract meaningful business insights related to pricing strategy, inventory weight, discount effectiveness, revenue estimation, and product value comparison.

This project demonstrates practical skills in:
    Handling raw CSV data import issues (UTF encoding fix)
    Database table creation and schema modification
    Data exploration and validation
    Data cleaning and transformation
    Writing advanced SQL queries for business insights
    Applying analytical thinking to e-commerce product data
    The analysis helps understand how pricing, discounts, weight, and stock availability impact revenue and product value across categories.

SQL Business Questions Solved in the Project
    Count total number of records and explore sample data.
    Identify null values across important columns.
    Find all distinct product categories available.
    Check how many products are in stock vs out of stock.
    Identify products whose names appear multiple times (duplicates).
    Detect products where MRP or selling price is zero and clean them.
    Convert price values from paisa to rupees for accurate analysis.

Business Insight Queries
    Find the top 10 best-value products based on highest discount percentage.
    Identify high MRP products that are out of stock.
    Calculate the estimated revenue for each product category.
    Find products where MRP > ₹500 and discount < 10%.
    Identify the top 5 categories with the highest average discount.
    Calculate price per gram for products above 100g to find best value.

Classify products into Low, Medium, and Bulk categories based on weight.

Calculate the total inventory weight per category.
