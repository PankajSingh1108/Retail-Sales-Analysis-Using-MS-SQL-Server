# Retail-Sales-Analysis-Using-MS-SQL-Server
Analyzed retail sales data using **MS SQL Server** to uncover trends, optimize performance, and provide actionable business insights.

![image](https://github.com/user-attachments/assets/f3b88e18-c3dd-4006-bf72-665d2f94e45f)

## About The Project:
In this retail sales analysis project, we're basically exploring sales data, checking out what customers are up to, and seeing how fast stuff flies off the shelves.
The analysis covers various queries and aggregations to help understand sales trends, top customers, region wise sales, monthly sales performance, quarterly sales performance, yearly sales performance, and more.

## Objective: 
Analyze sales data to identify performance drivers, opportunities for growth, and develop data-driven strategies to increase sales and profitability.

## About Dataset:
Let’s Inspect our dataset. This dataset got all the deeds on sales – order IDs, order dates and shipping dates, customer names and where they're at, plus product info like category and product IDs. Additionally, it includes numbers like sales amount, quantity, profit, and return reasons, offering insights into why certain products were returned.

This data enables analysis of sales performance, profitability, and customer behavior to improve supply chain management decisions. Here are some sample Rows & Columns of the Superstore Dataset.

![image](https://github.com/user-attachments/assets/a7da8742-6dfd-4da9-897a-d8fb29034a85)

![image](https://github.com/user-attachments/assets/598c106a-b7e4-4b34-9b9d-6f8bbae9e64e)

## This project comprises of 4 tasks:
The tasks are designed to progressively analyze and derive actionable insights from the sales data, using SQL queries.

### Task 1: Data Exploration and Querying
The project begins by analyzing the two available datasets, namely the **orders_data table** and the **returns_data table**. 

The focus is to perform fundamental queries on the orders_data table to extract meaningful insights and verify the integrity of the data. The tasks include retrieving all the data from the orders_data table, extracting specific columns such as order_id, order_date, and sales, and limiting the results to the first 10 records. Sorting operations are performed to organize the data in both ascending and descending order based on the order_date column. For cases with ties in the order_date, additional sorting by the profit column in descending order is implemented. The analysis also identifies the top 5 order_id entries with the highest sales amounts. Furthermore, a new calculated column, ratio (defined as profit/sales), is created, and the data is ordered by the ascending values of this new column. 

These queries ensure an in-depth understanding of the data structure and patterns within the orders_data table, setting a solid foundation for further analysis.

### Task 2: Data Filtering and Conditional Queries
We extend our analysis from Task 1 to help us identify different conditions that impact on customer sales.

Task 2 focuses on filtering data from the **orders_data** table based on various conditions to extract precise subsets of information. The filters include region-specific queries, category and quantity-based conditions, and date-based filtering to analyze specific timeframes. Additionally, customer name patterns and order ID duplication are explored. Advanced filters combine multiple conditions, such as quantity thresholds, regional preferences, and category overlaps, ensuring sorted outputs based on quantity, profit, or dates. These queries refine the dataset for targeted analysis and provide insights tailored to specific business requirements.

### Task 3: Advanced Data Analysis
Task 3 delves into comprehensive data analysis using SQL queries to extract, transform, and summarize key insights from the **orders_data** and **returns_data** tables. 

This includes identifying unique values, **aggregating metrics** like total sales, profit, and variance, and using string and date functions for detailed exploration. The task also incorporates filtering, grouping, and joining operations to analyze sales lost due to returns, categorize profitability, and understand patterns based on time periods (years, months, and quarters). Window functions are employed to identify top customers and products by region. 

These analytical queries provide a nuanced understanding of the dataset, aiding in actionable decision-making.

### Task 4: Advanced Sales Analysis and Metrics
In this task, I focuse on advanced sales analysis to uncover key trends and insights across regions. The task includes calculating cumulative sales for each customer over time, measuring year-over-year sales growth for each category, and identifying the top three most profitable customers in each region along with their contribution to total regional profit. 

Additionally, the running average of daily sales is calculated for each region, along with determining the overall average sales across regions. These analyses help in understanding regional performance and customer profitability, providing a deeper insight into sales dynamics.

## Key Findings:
After thoroughly examining our data, we have come to several various conclusions:

1. **Sales Trends:** Identified top-performing regions, categories, and growth patterns over time.
2. **Profitability:** Recognized the most profitable customers and their contribution to regional profit.
3. **Sales Losses:** Analyzed sales lost due to returns, highlighting areas for product or service improvements.
4. **Customer Behavior:** Identified patterns in customer names and segmented key customers for targeted strategies.
5. **Product Insights:** Found top-selling and most profitable products within each region.
6. **Temporal Trends:** Analyzed sales by month, quarter, and year, with averages to forecast and manage performance.
7. **Operational Efficiency:** Identified average shipping days, revealing potential operational improvements.

## Summary:
This project analyzes sales data across four key tasks using MS SQL Server. **Task 1** focuses on extracting and sorting data from the **orders_data** table. **Task 2** filters and aggregates sales information based on regions, categories, and other criteria. **Task 3** integrates **returns_data** table to evaluate the financial impact of returns on sales and profitability. **Task 4** analyzes customer and regional performance, calculating cumulative sales, identifying top customers, and measuring year-over-year growth. Key insights include identifying sales trends, top-performing regions and products, customer behavior, and areas for operational improvement, supporting better decision-making and strategic planning.
