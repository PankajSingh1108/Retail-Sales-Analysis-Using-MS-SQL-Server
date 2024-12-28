# Retail-Sales-Analysis-Using-MS-SQL-Server
Analyzed retail sales data using MS SQL Server to uncover trends, optimize performance, and provide actionable business insights.

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

## This project comprises of 5 tasks:
While doing this project, I make 
### Task 1: Data preparation and customer analytics
We analyze the store’s transaction dataset and identify customer purchasing behaviors to generate insights and provide commercial recommendations.

There are two important datasets in this task, chips sales and customer data. The task is to carry out exploratory data analysis in order to extract insights about the purchasing behavior of different customer groups. We want to then use those insights to formulate strategies to help the store increase chip sales.

Below is the outline of our main tasks along with what we should be looking for in the data for each.

Examine transaction data – look for inconsistencies, missing data across the data set, outliers, correctly identified category items, numeric data across all tables. If we determine any anomalies we make the necessary changes in the dataset and save it. Having clean data will help when it comes to the analysis. Examine customer data – check for similar issues in the customer data, look for nulls and when we are happy we merge the transaction and customer data together so it’s ready for the analysis.

Data analysis and customer segments – in the analysis we make sure we define the metrics – look at total sales, drivers of sales, where the highest sales are coming from etc. Explore the data, create charts and graphs as well as noting any interesting trends and/or insights you find. These will all form part of the report.

Deep dive into customer segments – define recommendation from the insights, determine which segments should be targeted, if packet sizes are relative and form an overall conclusion based on the analysis.

### Task 2: Experimentation and uplift testing
We extend our analysis from Task 1 to help us identify benchmark stores that allow us to test the trial store layouts' impact on customer sales.

For this part of the project we will be examining the performance in trial vs control stores to provide a recommendation for each location based on our insight. There are 3 trial stores that have gone through a 3-month trial period with modified store layouts.

Below are some of the areas we focus on:

Select control stores – explore the data and define metrics for the control store selection – think about what would make them a control store. Look at the drivers and make sure we visualise these in a graph to better determine if they are suited. For this piece it may even be worth creating a function to help it.

Assessment of the trial – this one should give us some interesting insights into each of the stores, check each trial store individually in comparison with the control store to get a clear view of its overall performance. We want to know if the trial stores were successful or not.

Collate findings – summarise the findings for each store and provide an recommendation that we can share with the store, outlining the impact on sales during the trial period.

### Task 3: Analytics and commercial application
Use analytics and insights from Task 1 and 2 to prepare a report for the client(the retail store).(This document is not included in this repo.)

## Key Findings:
After thoroughly examining our data, we have come to several various conclusions:

There has been a great significant increase in sales in the company over years despite some shortcomings.
New York & Los Angeles City made the most order for all product categories.
The technology category is the most dominant category in the 7 markets that we have.
Sales & Profit takes a dip during July across all years and the company makes the most sales between November and December.
The customer segment makes the most profit.
The shipping cost affects sales as we can see that they are strongly correlated.
From the business angle, based on our findings we would recommend the following to stakeholders of the company:

The company should stop selling products that the profit is negative as that is a loss to the company.
Reduce discounts in cities where we have high discounts but low profits.
For the company to increase customer satisfaction, the relationship between shipment interval and cost needs to be improved. There also needs to be a yardstick for proximity, distance, quick delivery, and longer delivery times.
In regions and countries with low sales, the company should increase product marketing and advertising.

## Summary:
The purpose of this article was to outline the procedures I used to analyze a retail dataset. To begin, I performed some tasks like removing missing values from datasets, creating new columns, and changing the data type of columns (to_datetime). Then the article moves to the Exploration data Analysis where we explore questions at the business level related to our data.
