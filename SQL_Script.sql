-- using datadase "hello".
use hello;

-- 1). Find all the data from "orders_data" table ?
select * 
from orders_data;

-- 2). Find all the data for columns order_id, order_date, sales from "orders_data" table ?
select order_id, order_date, sales
from orders_data;

-- 3). Find all the data for the first 10 records from "orders_data" table ?
select top 10 *
from orders_data;

-- 4). Find the first 10 records for columns order_id, order_date, sales from "orders_data" table ?
select top 10 order_id, order_date, sales
from orders_data;

-- 5). Find all the data from "orders_data" table as per ascending order of order_date column ?
select *
from orders_data
order by order_date asc;
/*
Note: Here, The latest record will be at the bottom, and the earliest record will be at the top according to the order_date.
Note: If two or more records are placed on the same date, they will be retrieved in the sequence in which they were recorded in the database.
*/

-- 6). Find all the data from "orders_data" table as per descending order of order_date column ?
select *
from orders_data
order by order_date desc;
/*
Note: Here, The latest record will be at the top, and the earliest record will be at the bottom according to the order_date.
Note: If two or more records are placed on the same date, they will be retrieved in the sequence in which they were recorded in the database.
*/

-- 7). Find all the data from "orders_data" table as per ascending order of order_date column and if there is tie in order_date column then order as per
--     profit column in ascending order.
select *
from orders_data
order by order_date, profit;    -- -> Note: By default, both order_date column and profit column are in ascending order.

-- 8). Find all the data from "orders_data" table as per ascending order of order_date column and if there is tie in order_date column then order as per
--     profit column in descending order.
select *
from orders_data
order by order_date asc, profit desc;    -- -> Note: By default, both order_date and profit are in ascending order.

-- 9). Find the top 5 order_id with highest sales amount ?
select top 5 
order_id,
sum(sales) as total_sales_amount
from orders_data 
group by order_id
order by total_sales_amount desc;

-- 10). Create a new column called 'ratio' (i.e., profit/sales) in the 'order_data' table and order the data in ascending order of the 'ratio' column.
select *, round((profit/sales),4) as ratio
from orders_data
order by ratio;      -- -> Note: By default, "ratio" (i.e. profit/sales) column are in ascending order.
-- Note: The order of execution of the above SQL query is: FROM -> SELECT -> ORDER BY.


---------------------------------------- 11). Filter the data from the "order_data" table -----------------------------------------------------

-- a). Filter the data where region is 'Central'.
select *
from orders_data
where region = 'Central';

-- b). Filter the data where region is 'Central' or 'South'.
select *
from orders_data
where region in ('Central', 'South');

-- c). Filter the data where the region is neither 'Central' nor 'South'.
select *
from orders_data
where region not in ('Central', 'South');

-- d). Filter the data where region is 'Central' or category is 'Technology'.
select *
from orders_data
where region = 'Central' or category = 'Technology';

-- e). Filter the data where region is 'Central' and category is 'Technology' and quantity is greater than 2.
select *
from orders_data
where region = 'Central' and category = 'Technology' and quantity > 2;
-- Note: The order of execution of the above SQL query is: FROM -> WHERE -> SELECT

-- g). Filter the data where region is 'Central' or category is 'Technology' but quantity must be greater than 5. Also order the data as per descending order of quantity.
select *
from orders_data
where (region = 'Central' or category = 'Technology') and quantity > 5
order by quantity desc;
-- Note: The order of execution of the above SQL query is: FROM -> WHERE -> SELECT * -> ORDER BY

-- h). Filter the data where quantity is greater than or equal to 3 and the data as per ascending order of quantity.
select *
from orders_data
where quantity >= 3
order by quantity;

-- i). Filter the data where quantity is not equal to 2 and the data as per ascending order of quantity.
select * 
from orders_data
where quantity != 2
order by quantity asc; 
-- Note: The order of execution of the above SQL query is: FROM -> WHERE -> SELECT -> ORDER BY.

-- j). Filter the data where quantity is either 3 or 8 and the data as per descending order of quantity.
select * 
from orders_data
where quantity in (3, 8)
order by quantity desc; 
-- Note: The order of execution of the above SQL query is: FROM -> WHERE -> SELECT -> ORDER BY.

-- k). Filter the data where quantity is greater than or equal to 3 and quantity is less than or equal to 5. Display the results as per descending order of quantity.
--Method - 1
select * 
from orders_data
where quantity >= 3 and quantity <= 5
order by quantity desc;

--Method - 2
select * 
from orders_data
where quantity between 3 and 5
order by quantity desc;
-- Note: When using BETWEEN clause, make sure the range is specified from lower to higher in the SQL query and include both the limit lower and higher.

--Method - 3
select * 
from orders_data
where quantity in (3, 4, 5)
order by quantity desc;

-- l). Filter the data where quantity is either 3 or profit is greater than 100.
select * 
from orders_data
where quantity = 3 or profit > 50;

-- m). Filter the data where order_date is '2019-09-17'.
select * 
from orders_data
where order_date = '2019-09-17';

-- n). Filter the data where order_date is greater than '2020-09-17'. Display the results as per ascending order of order_date column.
select * 
from orders_data
where order_date > '2020-09-17'
order by order_date;
-- Note: The order of execution of the above SQL query is: FROM -> WHERE -> SELECT -> ORDER BY.

-- o). Filter the data where order_date is '2020-06-12' or '2018-08-27'. Display the results as per ascending order of order_date column.
select * 
from orders_data
where order_date in ('2020-06-12', '2018-08-27')
order by order_date;

-- p). Filter the data where order_date is between '2018-08-27' and '2020-06-12'. Display the result as per ascending order of order_date column.
select * 
from orders_data
where order_date between '2018-08-27' and '2020-06-12'
order by order_date asc;
--Note: When using BETWEEN clause, make sure range is specified from lower to higher in SQL query. It also include both limit lower and higher.

-- q). Filter the data where order is placed in the year 2020 only.
select year(order_date) as order_year, * 
from orders_data
where year(order_date) = 2020;

-- r). Filter the data where order is placed in the year 2020 and month is March only.
-- Method - 1
select month(order_date) as order_month, year(order_date) as order_year, * 
from orders_data
where month(order_date) = 3 and year(order_date) = 2020
order by order_date;

-- Method - 2
select datename(month, order_date) as order_month, datename(year, order_date) as order_year, * 
from orders_data
where datename(month, order_date) = 'March' and datename(year, order_date) = 2020
order by order_date;

-- s). Filter the data where order is placed in the first day of each year.
select day(order_date) as order_day, month(order_date) as order_month, year(order_date) as order_year, *  
from orders_data
where day(order_date) = 1 and month(order_date) = 1 and year(order_date) in (select distinct year(order_date) from orders_data)
order by order_day, order_month, order_year;

-- t). Filter the data where customer_name starts with 'A'.
select * 
from orders_data
where customer_name like 'A%';

-- u). Filter the data where customer_name is ends with 'e'.
select * 
from orders_data
where customer_name like '%e';

-- v). Filter the data where the customer_name contains the letter 'a' anywhere.
select * 
from orders_data
where customer_name like '%a%';

-- w). Filter the data where the second character of the customer_name is 'e'.
select * 
from orders_data
where customer_name like '_e%';

-- x). Filter the data where customer_name's second character either be 'e' or 'a'.
-- Method - 1
select * 
from orders_data
where customer_name like '_[ae]%';

-- Method - 2
select * 
from orders_data
where customer_name like '_a%' or customer_name like '_e%';

-- y). Filter the data where customer_name's second character either be 'e' or 'a' and customer_name end with 'n'.
-- Method - 1
select * 
from orders_data
where customer_name like '_[ae]%n';

-- Method - 2
select * 
from orders_data
where customer_name like '_[ae]%' and customer_name like '%n';

-- z). Find the order IDs that appear more than once in the 'orders_data' table and display the count of their occurrences as per ascending order.
select order_id, count(order_id) as no_times
from orders_data
group by order_id
having count(order_id) > 1
order by no_times asc;

---------------------------------- 12). Data Analysis using SQL queries -----------------------------------------------------------------------

--a). Find the unique categories from the 'orders_data' table ?
-- Method - 1  ( using DISTINCT )
select distinct category 
from orders_data;

-- Method - 2 ( using GROUP BY )
select category 
from orders_data
group by category;

--b). Find the unique combinations of categories and regions from the 'orders_data' table ?
-- Method - 1  ( using DISTINCT )
select distinct category, region 
from orders_data;

-- Method - 2 ( using GROUP BY )
select category, region
from orders_data
group by category, region;

--c). Find the total number of records, the number of unique order IDs, the total number of city records, the number of unique cities, and 
--    the number of unique categories from the 'orders_data' table ?
select count(*) no_of_total_records,
count(distinct order_id) as no_of_unique_order_id,
count(city) as no_of_total_city_records,
count(distinct city) as no_of_unique_city,
count(distinct category) as no_of_unique_category
from orders_data;

/*
Aggregate function in SQL ;
1). sum(), count(), max(), min(), avg(), STDEV(), VAR(), GROUP BY with Aggregate Functions, STRING_AGG() (SQL Server 2017+)
2). NULL Values: Aggregate functions generally ignore NULL values, except for the COUNT(*) function.
*/

-- d). Find the total sales, number of records, maximum sales, minimum sales, average of sales, standard deviation of sales, 
-- variance of sales from orders table ?
-- Method - 1
select sum(sales) as total_sales, 
count(*) as no_of_records,
max(sales) as max_sales,
min(sales) as min_sales,
avg(sales) as avg_sales,
STDEV(sales) as standard_deviation,
var(sales) as variance
from orders_data;

-- Method - 2
select count(1) as no_of_records from orders_data;
select top 1 sales as max_sales from orders_data order by sales desc;
select top 1 sales as mini_sales from orders_data order by sales asc;
select sum(sales)/count(*) as avg_sales from orders_data;

----------------------------------- /*  Beautifull concept  */ ----------------------------------------------------------------------------

-- Operation (1).  Can you update the city is equal to null in "orders_data" table where order_id is 'US-2019-118983' and 'CA-2020-152156' ?
update orders_data
set city = null
where order_id in ('US-2019-118983', 'CA-2020-152156');

-- Operation (2). Now, can you check that update has been done in the data set in "orders_data" table ?
select *
from orders_data
where city is null;
-- Note: city = NULL will not work because NULL represents an unknown value. To check for NULL, you should use IS NULL or IS NOT NULL instead.

-- Operation (3). Find the count of total records, count of records for order_id and count of records for city from the "orders_data" table ?
select
count(*) as count_of_total_records,
count(order_id) as count_of_records_order_id,
count(city) as count_of_records_city
from orders_data;

-- Operation (4). Find the no of total records, no. of unique order_id, no. of total city records,  no of unique city, no of unique categoryfrom "orders_data" table ?
select count(*) no_of_total_records,
count(distinct order_id) as no_of_unique_order_id,
count(city) as no_of_total_city_records,
count(distinct city) as no_of_unique_city,
count(distinct category) as no_of_unique_category
from orders_data;

-------------------------------------------------- CONCEPT END -----------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------

-- e). For each category, concatenate all the associated order IDs into a single string separated by commas ?
-- or Write a query to concatenate all the associated Order IDs for each category into a single string, separated by commas ?
SELECT category, STRING_AGG(order_id, ',') AS concatenated_orders
FROM orders_data
GROUP BY category;

-- f). For each order ID, concatenate all the associated categories into a single string separated by commas ?
-- or Write a query to concatenate all the associated categories for each order ID into a single string, separated by commas?
SELECT order_id, STRING_AGG(category, ',') AS concatenated_orders
FROM orders_data
GROUP BY order_id;

-- g). Find the total sales for "Furniture" category ?
select sum(sales) as Furniture_total_sales 
from orders_data 
where category = 'Furniture';

-- h). Find the total sales and total profit for each category. Display the results in ascending order of total sales ?
select category, sum(sales) as total_sales,
sum(profit) as total_profit
from orders_data 
group by category
order by total_sales;

-- i). Find the total sales and total profit for each category and region. Display the results in descending order of total sales ?
select category, region, sum(sales) as total_sales,
sum(profit) as total_profit
from orders_data 
group by category, region
order by total_sales desc;

-- j). Find the total sales for each city and display the results in descending order of total sales ?
select city, sum(sales) as total_sales
from orders_data
group by city
order by total_sales desc;

-- k). Find cities where total sales are at least 100. Also, display the results in descending order of total_sales ?
select city, sum(sales) as total_sales
from orders_data
group by city
having sum(sales)>=100
order by total_sales desc;
-- Note: The order of execution of the above SQL query is:  FROM →  GROUP BY → HAVING → SELECT → ORDER BY.

-- l). Find cities where total sales are at least 100 and region is 'West'. Also, display the results in descending order of total_sales ?
select city, region, sum(sales) as total_sales
from orders_data
where region = 'West'
group by city, region
having sum(sales) >= 100
order by total_sales desc;
-- Note: The logical order of execution of the above SQL query is: FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY.

-- m). Find top 2 cities where total sales are at least 100 and region is 'East' ?
select top 2 city, region,
sum(sales) as total_sales
from orders_data
where region = 'East'
group by city, region
having sum(sales) >= 100
order by total_sales desc;
-- Note: The logical order of execution of the above SQL query is: FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY → TOP.

------------------------------------------- Combine the 'orders_data' and 'returns_data' tables   ------------------------------------------
/* 
Types of joins in SQL; 
1). INNER JOIN, 2). FULL OUTER JOIN, 3). LEFT JOIN,
4). RIGHT JOIN, 5). CROSS JOIN, 6). SELF JOIN.
*/

-- 13). Find the return reason for all placed orders ?

--  Method - 1 ( using INNER JOIN )
select o.*, r.return_reason
from orders_data as o
inner join returns_data as r
on o.order_id = r.order_id;
-- Note: The logical order of execution of the above SQL query is: FROM → ON → JOIN → SELECT

-- Method - 2 ( using LEFT JOIN )
select o.*, r.return_reason
from orders_data as o
left join returns_data as r
on o.order_id = r.order_id
where r.return_reason is not null;
-- Note: The logical order of execution of the above SQL query is: FROM → ON → JOIN → WHERE → SELECT

-- Method - 3 ( using RIGHT JOIN )
select o.*, r.return_reason
from returns_data as r
right join orders_data as o
on r.order_id = o.order_id
where r.return_reason is not null;
-- Note: The logical order of execution of the above SQL query is: FROM → ON → JOIN → WHERE → SELECT

-- 14). Find the total sales lost due to returns ?
select sum(o.sales) as total_sales_lost
from orders_data as o
inner join returns_data as r
on o.order_id = r.order_id;

-- 15). Find the total sales lost due to returns for each category and display the results in ascending order of total sales lost ?
select o.category, sum(o.sales) as total_sales_lost
from orders_data as o
inner join returns_data as r
on o.order_id = r.order_id
group by o.category
order by total_sales_lost asc;
-- Note: The logical order of execution of the above SQL query is: FROM → ON → JOIN → GROUP BY → SELECT → ORDER BY

-- 16). Find the total sales lost due to returns for each return reason, and display the results in descending order of total sales lost ?
select r.return_reason, sum(o.sales) as total_sales_lost
from orders_data as o
inner join returns_data as r
on o.order_id = r.order_id
group by r.return_reason
order by total_sales_lost desc;
-- Note: The logical order of execution of the above SQL query is: FROM → ON → JOIN → GROUP BY → SELECT → ORDER BY

/* 
Note: From the above query, I found that there are four reasons for returning an item/order: Others, Bad Quality, Wrong Item, and Wrong Items.
I want to consolidate these into three reasons by converting Wrong Items into Wrong Item.

After that, find the total sales lost due to returns for each return reason (i.e., Others, Bad Quality, and Wrong Item), and display the 
results in descending order of total sales lost.
*/

-- Method - 1
select r.new_return_reason, sum(o.sales) as total_sales_lost
from orders_data as o
inner join (select *, 
case when return_reason = 'Wrong Items' then 'Wrong Item' else return_reason end as new_return_reason
from returns_data) as r
on o.order_id = r.order_id
group by r.new_return_reason
order by total_sales_lost desc;

-- Method - 2
select r.new_return_reason, sum(o.sales) as total_sales_lost
from orders_data as o
left join (select *,
case 
when return_reason = 'Bad Quality' then 'Bad Quality'
when return_reason = 'Others' then 'Others'
when return_reason in ('Wrong Items','Wrong Item')  then 'Wrong Item'
end as new_return_reason
from returns_data) as r
on o.order_id = r.order_id
group by r.new_return_reason
order by total_sales_lost desc;
-- Note: Records where new_return_reason is NULL indicate that those orders were never returned by any customer. 
-- This means they represent the final sales/revenue of the company.

--17).  Find the total sales lost due to returns for the return reason 'Wrong Items' in the city 'Los Angeles,' and display the results in descending order of total sales lost ?
select o.*, r.return_reason
from orders_data as o
inner join returns_data as r
on o.order_id = r.order_id
where o.city = 'Los Angeles' and r.return_reason = 'Wrong Items';
-- Note: The logical order of execution of the above SQL query is: FROM → ON → JOIN → WHERE → SELECT

-- 18). Find the all orders details which are not returned from customers ?
-- Method - 1 (Using Left Join)
select *
from orders_data as o
left join returns_data as r
on o.order_id = r.order_id
where r.order_id is null;

-- Method - 2 (Using Right Join)
select o.*, r.*
from returns_data as r
right join orders_data as o
on o.order_id = r.order_id
where r.order_id is null;

-- 19). Write a query to create a new column called "profit_bucket" with the following conditions:
-- a). If the profit is less than 0, it should show "loss."
-- b). If the profit is less than 50, it should show "profit."
-- c). If the profit is less than 100, it should show "high profit."
-- d). If the profit is greater than 100, it should show "very high profit."
select *,
case
when profit < 0 then 'loss'
when profit < 50 then 'profit'
when profit < 100 then 'high profit'
else 'very high profit'
end as profit_bucket
from orders_data;

----------------------------------------------- string functions --------------------------------------------------------------------------

-- 20). Write a query to perform the following tasks:
-- a). Find the number of characters in the customer name.
-- b). Extract the first three characters of the product_id, which represent the short name of the category type.
-- c). Separate the customer's name into two columns: first_name and last_name.
-- d). Extract the middle part of the product_id (e.g., input: OFF-AP-10002892, output: AP).
-- e). Replace all occurrences of the letter "a" with "z" in the customer name.
select customer_name, product_id,
len(customer_name) as len_with_sapce,
LEFT(product_id, 3) as shot_category,
LEFT(customer_name, CHARINDEX(' ', customer_name) - 1) as first_name,
SUBSTRING(customer_name, CHARINDEX(' ', customer_name)+1, len(customer_name)-CHARINDEX(' ', customer_name)) as last_name,
SUBSTRING(product_id, 5, 2) as mid_product_id,
replace(customer_name, 'a', 'z') as new_name
from orders_data;

/*
Note: From the above query, I found that there is middle name also in the customer name.

So, can you create three columns such as fisrt_name, mid_name, last_name with the condition,
If there is only single sapce in the customer name then there is only first_name and last_name exist and mid_name will be null.
If there is two sapce in the customer name then there is first_name, midd_name and last_name exist.

input:				 output:
customer_name        first_name    mid_name		last_name
Claire Gute          Claire	       null         Gute
Darrin Van Huff      Darrin	       Van			Huff
*/

-- Method - 1
SELECT customer_name,
LEFT(customer_name, CHARINDEX(' ', customer_name) - 1) AS first_name, -- Extract first name
-- Extract middle name (if present)
CASE 
WHEN CHARINDEX(' ', SUBSTRING(customer_name, CHARINDEX(' ', customer_name) + 1, LEN(customer_name))) > 0 
THEN LEFT(SUBSTRING(customer_name, CHARINDEX(' ', customer_name) + 1, LEN(customer_name) - CHARINDEX(' ', customer_name)), 
            CHARINDEX(' ', SUBSTRING(customer_name, CHARINDEX(' ', customer_name) + 1, LEN(customer_name))) - 1) 
ELSE NULL END AS mid_name,
-- Extract last name
CASE 
WHEN CHARINDEX(' ', SUBSTRING(customer_name, CHARINDEX(' ', customer_name) + 1, LEN(customer_name))) = 0 
THEN SUBSTRING(customer_name, CHARINDEX(' ', customer_name) + 1, LEN(customer_name) - CHARINDEX(' ', customer_name)) 
ELSE SUBSTRING(
            SUBSTRING(customer_name, CHARINDEX(' ', customer_name) + 1, LEN(customer_name) - CHARINDEX(' ', customer_name)), 
            CHARINDEX(' ', SUBSTRING(customer_name, CHARINDEX(' ', customer_name) + 1, LEN(customer_name))) + 1, 
            LEN(SUBSTRING(customer_name, CHARINDEX(' ', customer_name) + 1, LEN(customer_name))) - CHARINDEX(' ', SUBSTRING(customer_name, CHARINDEX(' ', customer_name) + 1, LEN(customer_name)))) 
END AS last_name
FROM orders_data;

-- Method - 2 ( using Subquery )
select customer_name, first_name,
case when CHARINDEX(' ', last_name) > 0 then LEFT(last_name, CHARINDEX(' ', last_name) - 1) end as mid_name,
case when CHARINDEX(' ', last_name) = 0 then last_name else SUBSTRING(last_name, CHARINDEX(' ', last_name)+1, len(last_name)-CHARINDEX(' ', last_name)) end as last_name_1
from (select customer_name,
LEFT(customer_name, CHARINDEX(' ', customer_name) - 1) as first_name,
SUBSTRING(customer_name, CHARINDEX(' ', customer_name)+1, len(customer_name)-CHARINDEX(' ', customer_name)) as last_name
from orders_data) as a;

-- Method - 3 ( using CTE )
with temp as
(select customer_name,
left(customer_name, CHARINDEX(' ', customer_name)-1) as first_name,
substring(customer_name, CHARINDEX(' ', customer_name) +1, len(customer_name)-CHARINDEX(' ', customer_name)) as last_name
from orders_data)
select customer_name, first_name,
case when charindex(' ', last_name) > 0 then left(last_name, CHARINDEX(' ', last_name)-1) else null end as mid_name,
case when charindex(' ', last_name) = 0 then last_name else substring(last_name, CHARINDEX(' ', last_name) +1, len(last_name)-CHARINDEX(' ', last_name)) end as new_last_name
from temp;


----------------------------------------------- date functions -------------------------------------------------------------------------

--21). Find the total sales for each year, and display the results sorted by total sales in descending order ?
select year(order_date) as order_year,
sum(sales) as total_sales
from orders_data
group by year(order_date)
order by total_sales desc;
-- Note: The logical order of execution of the above SQL query is: FROM → GROUP BY → SELECT → ORDER BY.

--22). Find the total sales for each month within each year, and 
--display the results sorted by year in ascending order and by month in descending order for each year ?
select year(order_date) order_year, month(order_date) as order_month,
sum(sales) as total_sales
from orders_data
group by year(order_date), month(order_date)
order by order_year asc, order_month desc;
-- Note: The logical order of execution of the above SQL query is: FROM → GROUP BY → SELECT → ORDER BY.

--23). Find the total sales for each month across all years, and display the results sorted by month in ascending order ?
select month(order_date) as order_month,
sum(sales) as total_sales
from orders_data
group by month(order_date)
order by order_month asc;

--24). Find the total sales for each month across all years, and display the results sorted by total sales in descending order.
select datename(month,order_date) as order_month,
sum(sales) as total_sales
from orders_data
group by datename(month,order_date)
order by total_sales desc;

-- 25). Find the total sales for each quarter in each year ?
-- Display the results sorted by year in ascending order and by quarter in descending order for each year ?
-- Method - 1
select 
datepart(year, order_date) as order_year,
datepart(quarter, order_date) as order_quarter,
sum(sales) as total_sales
from orders_data
group by datepart(year, order_date), datepart(quarter, order_date)
order by order_year asc, order_quarter desc;

-- Method - 2
select 
datepart(year, order_date) as order_year,
case 
when datepart(quarter, order_date) = 1 then 'first quarter'
when datepart(quarter, order_date) = 2 then 'second quarter'
when datepart(quarter, order_date) = 3 then 'third quarter'
else 'fourth quarter' end as order_quarter,
sum(sales) as total_sales
from orders_data
group by datepart(year, order_date), datepart(quarter, order_date)
order by datepart(year, order_date) asc, datepart(quarter, order_date) desc;

-- Method - 3 (Using CTE)
with quarter_sales as
(
select 
datepart(year, order_date) as order_year,
datepart(quarter, order_date) as order_quarter,
sum(sales) as total_sales
from orders_data
group by datepart(year, order_date), datepart(quarter, order_date)
)
select order_year, 
case 
when order_quarter = 1 then 'first quarter'
when order_quarter = 2 then 'secomd quarter'
when order_quarter = 3 then 'third quarter'
else 'fourth quater' 
end as quarter_name,
total_sales
from quarter_sales
order by order_year asc, order_quarter desc;

--26). Find the total sales for each quarter across all years. Display the results sorted by quarter in ascending order ?
-- Method - 1
select datename(quarter,order_date) as order_quarter,
sum(sales) as total_sales
from orders_data
group by datename(quarter,order_date)
order by order_quarter asc;

-- Method - 2
select 
case 
when datepart(quarter, order_date) = 1 then 'First quarter'
when datepart(quarter, order_date) = 2 then 'Second quarter'
when datepart(quarter, order_date) = 3 then 'Third quarter'
else 'Fourth quarter' end as order_quarter,
sum(sales) as total_sales
from orders_data
group by  datepart(quarter, order_date)
order by  datepart(quarter, order_date) asc;

--27). Find the number of days for an order to shiped to customer (i.e. ship day - order_day) ?
select order_id,
order_date,
ship_date,
DATEDIFF(day, order_date, ship_date) as no_of_days
from orders_data;

------------------------------------------- Window Function ----------------------------------------------------------------------------------
/* 
Types of Window functions in SQL;

[1]. ROW_NUMBER(), [2]. RANK(), [3]. DENSE_RANK()
[4]. SUM(), [5]. COUNT(), [6]. MAX(), [7]. MIN(), [8]. AVG()
[9]. LAED() and LAG(),  10). FIRST_VALUE() and LAST_VALUE()
*/

-- 28). Find the top 5 order_id with highest sales amount in each region ?
-- Method - 1 ( Using sub query)
select *
from (
select order_id, region, sum(sales) as total_sales,
dense_rank() over(partition by region order by sum(sales) desc) as r_number
from orders_data
group by order_id, region
) as a
where r_number <= 5;

-- 29). Who are the top three customers by total sales within each region ?
-- Method - 1 ( Using CTE)
with temp as 
(select customer_name, region, sum(sales) as total_sales,
dense_rank() over(partition by region order by sum(sales) desc) as d_rank
from orders_data
group by customer_name, region)
select * 
from temp
where d_rank <= 3;

-- 30). Which product categories contribute the most profit per region ?
with temp as 
(select category,  region, sum(profit) as tota_profit,
dense_rank() over(partition by region order by sum(profit) desc) as d_rank 
from orders_data
group by category,  region)
select * 
from temp 
where d_rank  = 1;

--------------------------------------------------- Advanced Data Analysis -------------------------------------------------------------------

-- 31). What is the cumulative sales for each customer within a region over time ?
select region, customer_name, order_date, sales,
sum(sales) over(partition by region, customer_name order by order_date asc) as cumulative_sales
from orders_data;

-- 32). What is the year-over-year sales growth for each category within a region ?
with SalesByYear as (
select region, category, year(order_date) as sales_year, sum(sales) as total_sales
from orders_data
group by region, category, year(order_date)
),
YearOverYearGrowth as (
select s1.region, s1.category, s1.sales_year,
s1.total_sales as current_year_sales,
s2.total_sales as previous_year_sales,
case 
when s2.total_sales = 0 OR s2.total_sales is null then null
else ((s1.total_sales - s2.total_sales) * 100.0 / s2.total_sales)
end as YoY_Growth_Percentage
from SalesByYear s1
LEFT JOIN SalesByYear s2 
on s1.region = s2.region and s1.category = s2.category and s1.sales_year = s2.sales_year + 1
)
select region, category, sales_year, current_year_sales, previous_year_sales, YoY_Growth_Percentage
FROM YearOverYearGrowth
ORDER BY region, category, sales_year;

-- 33). Identify the top three most profitable customers in each region and their contribution to the region’s total profit ?
-- Method - 1 (Using CTE, JOIN and Window Function)
with tab_1 as
(select a.*, b.region_total_profit
from (select region, customer_name,  sum(profit) as profitable_customers
from orders_data
group by region, customer_name) as a
left join (select region, 
sum(profit) as region_total_profit
from orders_data
group by region) as b
on a.region = b.region),
tab_2 as
(select *,
DENSE_RANK() over(partition by region order by profitable_customers desc) as d_rank
from tab_1)
select *,
round((profitable_customers/region_total_profit)*100, 2) as contribution
from tab_2
where d_rank <=  3
order by region, d_rank;

-- -- Method - 2 (Using CTE and Window Function)
with temp as
(select region, customer_name, sum(profit) as customer_profit,
sum(sum(profit)) over(partition by region) as region_total_profit,
dense_rank() over(partition by region order by sum(profit) desc) as d_rank
from orders_data
group by region, customer_name)
select d_rank, region, customer_name, customer_profit, region_total_profit,
round((customer_profit/region_total_profit)*100,2) as contribution_percentage
from temp
where d_rank <= 3
order by region, d_rank;

-- 34). What is the running average of daily sales for each region ?
-- Method - 1
with temp as (
select region, order_date, sum(sales) as total_sales
from orders_data
group by region, order_date )
select region, order_date, total_sales,
avg(total_sales) over(partition by region order by order_date rows between unbounded preceding and current row) as running_avg_sales
from temp
order by region, order_date;

-- Method - 2
select region, order_date, sum(sales) as daily_sales,
avg(sum(sales)) over(partition by region order by order_date rows between unbounded preceding and current row) as running_avg_sales
from orders_data
group by region, order_date
order by region, order_date;

-- 35). What is the average sales in each region ?
-- Method - 1
with temp as
(select region, order_date, sum(sales) as total_sales
from orders_data
group by region, order_date)
select region, avg(total_sales) as total_avg
from temp
group by region;

-- Method - 2
select region, avg(total_sales) as toal_avg
from (
select region, order_date, sum(sales) as total_sales
from orders_data
group by region, order_date ) as a
group by region;

-------------------------------------------------------------- END --------------------------------------------------------------------------
----------------------------------------------------------- Thank You -----------------------------------------------------------------------