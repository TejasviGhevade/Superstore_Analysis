-- just to check the data impoerted well
select * from superstore_data_main
limit 5;

-- 1. total sale and profit for each year

select year(Order_Date) as year, ROUND(sum(Profit),0) as Total_Profit, round(sum(Sales),0) as Total_Sale
from superstore_data
group by year(Order_Date)
order by year asc;

-- 2. Quater wise sales and profit
select year(Order_Date) as year, concat("Q",quarter(Order_Date)) as Quarter, ROUND(sum(Profit),0) as Total_Profit, round(sum(Sales),0) as Total_Sale
from superstore_data
group by year(Order_Date),concat("Q",quarter(Order_Date))
order by year asc;

-- 3. What region generates the highest sales and profits ?
select Region ,sum(Profit) as Total_profit, sum(Sales) as Total_sale
from superstore_data
group by Region 
order by Total_sale Desc;

-- 4. profit margine by region
select Region , Round(sum(Profit)/sum(sales)*100,2) As Profit_Margine
from superstore_data
group by Region
order by Profit_Margine desc;

-- 5. Top 10 state  wise
select State , City , sum(Profit) as Total_Profit, sum(Sales) as Total_Sales
from superstore_data
group by State , City 
order by Total_Profit desc
limit 10;

-- 6. Bottom 10 state  wise
select State , City , sum(Profit) as Total_Profit, sum(Sales) as Total_Sales
from superstore_data
group by State , City 
order by Total_Profit 
limit 10;

-- 7. Top 10 city wise
select City , Sum(Profit) as Total_Profit , sum(Sales) As Total_Sales
from superstore_data
group by city
Order by Total_Profit Desc
limit 10;

-- 8. bottom 10 city 
select city ,sum(Profit) as Total_Profit, sum(Sales) as TOtal_Sales
From superstore_data
group by city
Order by Total_Profit 
limit 10;

-- 9. correlation between sales and Discount
select Discount, Avg(Sales) As Avg_Sales
from superstore_data
group by Discount
order by Discount;

-- 10. Total Discount BY Category
select Category , round(Sum(Discount),2) as Total_Discount
from superstore_data
group by Category
order by Total_Discount Desc;

-- 11. Category and Sybcategory wise Total Discount
select Category, SubCategory ,round(sum(Discount),0) as Total_Discount
From superstore_data
group by Category, SubCategory
order by Total_Discount desc;

-- 12. which category generates highest sale and profit by each region

select Region, Category ,sum(Profit) As TOtal_Profit , sum(Sales) as Total_Sales
From superstore_data
group by region, Category 
order by Total_Profit desc;

-- 13. which category generates highest sale and profit by each state
select State, Category, sum(Profit) as Total_Profit , sum(Sales) as Total_Sales
from superstore_data
group by State, Category
order by Total_Profit desc;

-- 14. lowest sale and profit by category and state
select State, Category , Sum(Profit) as Total_Profit ,sum(Sales) as Total_Sales
from superstore_data
Group by State, Category 
Order by Total_Profit asc;

-- 15. subcategory generates highest sale and profit 
select  Subcategory , sum(Profit) as Total_Profit ,sum(Sales) as Total_Sales
from superstore_data
group by  Subcategory 
order by Total_Profit Desc;

-- 15. subcategory generates highest sale and profit by state
select State, Subcategory , sum(Profit) as Total_Profit ,sum(Sales) as Total_Sales
from superstore_data
group by State, Subcategory 
order by Total_Profit Desc;

-- 16. subcategory generates lowest sale and profit by state
select State, Subcategory , sum(Profit) as Total_Profit ,sum(Sales) as Total_Sales
from superstore_data
group by State, Subcategory 
order by Total_Profit;

-- 17. subcategory generates highest sale and profit by Region
select Region , Subcategory , sum(Profit) as Total_Profit ,sum(Sales) as Total_Sales
from superstore_data
group by Region, Subcategory
order by Total_Profit desc;

-- 18. subcategory generates lowest sales and profit by region
select Region , Subcategory ,sum(Profit) as Total_Profit , sum(Sales) As Total_Sales
from superstore_data
group by Region ,Subcategory
order by Total_Profit asc;

-- 19. most profitable products
select Product_Name , sum(Profit) as Total_Profit, sum(Sales) as Total_Sales
from superstore_data
group by Product_Name
order by Total_Profit desc
Limit 10;

-- 20. less profitable products
select Product_name, sum(Profit) as Total_Profit
from superstore_data
group by Product_Name
order by Total_Profit asc
limit 15;

-- 21. segment wise profit and sale
select Segment, sum(Profit) as Total_Profit , sum(Sales) as Total_Sales
from superstore_data
group by segment
order by Total_Profit desc;


-- 22. Total unique customers Overall
select count(Distinct Customer_ID) as Total_Customers
From superstore_data;

-- 23. unique cust per region 
select Region , count(Distinct Customer_ID) as Total_Customers
from superstore_data
group by Region
order by Total_Customers Desc;

-- 24. unique cust per state
select State ,count(Distinct Customer_ID) as Total_Customers
From superstore_data
group by State
Order by Total_Customers Desc;

-- 25. least customer in each state
select State , count(Distinct Customer_ID) as Total_Customers
From superstore_data
Group by State 
Order by Total_Customers Asc;

-- 26. to give customer reward who give us most of the sale 
-- Customer ID wise Sale an Profit
select Customer_ID , sum(Profit) As Total_Profit , sum(Sales) As Total_Sales 
From superstore_data
group by Customer_ID
Order by Total_Sales Desc
limit 10;

-- 27. avg shipping time
select Ship_Mode ,round(avg(Ship_Date - Order_Date),2) as Avg_Shipping_time
from superstore_data
group by Ship_Mode
Order by Avg_Shipping_time;
















