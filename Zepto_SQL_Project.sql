-- Drop Table if it exists
drop table if exists Zepto;
-- Create  a Table
create table Zepto (
pro_id serial primary key,
Category varchar(500),
name varchar(100),
mrp numeric(8,2),
discountPercent numeric(5,2),
availableQuantity integer,
discountedSellingPrice numeric(8,2),
weightInGms integer,
outOfStock boolean,
quantity integer
);
-- Change the DataType of the Column
alter table Zepto alter column name type varchar(500);

-- Show the Table
select * from Zepto;

-- Data Exploration

-- Count of rows
select count(*) from Zepto;

-- Sample Data
select * from Zepto limit 10;

-- null values
select *  from Zepto
	where name is null
	or
	category is null
	or
	mrp is null
	or
	discountpercent is null
	or
	availablequantity is null
	or
	discountedsellingprice is null
	or
	weightingms is null 
	or
	outofstock is null 
	or
	quantity is null;

-- Different product category
select distinct category 
	from Zepto 
	order by category;

-- Product in stock and out of stock
select outofstock , count(pro_id)
	from Zepto
	group by outofstock;

-- Product name represent multiple time
select name , count(pro_id) as "Number of Pro"
	from Zepto
	group by name 
	having count(pro_id) > 1
	order by count(pro_id) desc;

-- Data Cleaning
-- Product might be zero
select * from Zepto
	where mrp = 0
	or discountedsellingprice = 0;
-- Delete the row in which mrp is zero
Delete from Zepto where mrp = 0;


-- convert paisa into rupees
update Zepto
	set mrp = mrp/100.0,
	discountedsellingprice = discountedsellingprice/100.0;

-- Business Problem
-- 1. Find the top 10 best-value products based on the discount percentage;
select distinct name , mrp, discountpercent from Zepto
	order by discountpercent desc limit 10;

-- 2.What are the products with the high mrp but out of stock
select distinct name , mrp as "High MRP"
	from Zepto
	where outofstock = 'true' 
	order by mrp desc limit 5;

-- 3.Calculate the estimated revenue for each category
select  distinct category , sum(discountedsellingprice * availablequantity) as total_revenue
	from Zepto
	group by category
	order by total_revenue;

-- 4.Find all the products where mrp is greator than $500 and discount is less than 10%.
select * from Zepto
	where mrp > 500 and discountpercent < 10
	order by mrp desc limit 10;

-- 5.identify the top 5 category offering the highest average discount percentage.
select distinct category , round(avg(discountpercent),2) as "average_discount_percentage"
	from Zepto
	group by category
	order by average_discount_percentage desc limit 5;

-- 6.Find the price per gram for products above 100g and sort by best value.
select distinct name , weightingms , discountedsellingprice , 
round(discountedsellingprice / weightingms,2) as Price_per_gram
	from Zepto
	where weightingms >= 100
	order by Price_per_gram;

-- 7.Group the product into category like low , Medium and Bulk.
select distinct name , weightingms , 
case when weightingms < 1000 then 'Low'
	when weightingms < 5000 then 'Medium'
	else 'Bulk'
	end as Weight_Cateogry
	from Zepto;

-- 8.What is the total inventory weight per category
select category , 
	sum(weightingms * availablequantity) as Total_Inventory
	from Zepto
	group by category
	order by Total_Inventory desc;