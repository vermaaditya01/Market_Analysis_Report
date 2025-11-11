
## Maven Market Analysis Report
A dynamic and interactive data visualization tool designed to explore the Maven Market business data, enabling analysis of overall business growth through sales performance trends, customer behavior insights & service evaluation across different regions. 

**Explore Full Project:** [Maven Market Analysis Report](https://app.powerbi.com/view?r=eyJrIjoiNWY1YmZhYTctN2I2ZS00ZmVlLTgwMWItOWE4YzI1ZTQ5ZGM2IiwidCI6IjY3ZmM3MmU2LTIxMjctNDY2OC04YmQ3LTAwMGJkYzY5MTg1MSJ9)

### 1) Screenshots (Preview)
  a) Homepage <p align="center">
  <img src= "https://github.com/vermaaditya01/Market_Analysis_Report/blob/main/Project_snapshots/Home%20Page.png" />
</p>

  b) Sales Performance Dashboard <p align="center">
  <img src="https://github.com/vermaaditya01/SQL-Portfolio/blob/main/Project_snapshots/Sales%20Performance%20Dashboard.png" />
</p>

  c) Customer Overview Dashboard <p align="center">
  <img src="https://github.com/vermaaditya01/SQL-Portfolio/blob/main/Project_snapshots/Customers%20Overview%20Dashboard.png" />
</p>

  d) Store & Regional Summary Dashboard <p align="center">
  <img src="https://github.com/vermaaditya01/SQL-Portfolio/blob/main/Project_snapshots/Store%20%26%20Regional%20Summary%20Dashboard.png" />
</p>

  e) Key Takeaways <p align="center">
  <img src="https://github.com/vermaaditya01/SQL-Portfolio/blob/main/Project_snapshots/Key%20Takeaways.png" />
</p>

  f) Data Modeling <p align="center">
  <img src="https://github.com/vermaaditya01/SQL-Portfolio/blob/main/Project_snapshots/Data%20Modeling.png" />
</p>

### 2) Objective
To analyze sales data from 24 stores across 3 countries and 10 states over 24 months to uncover growth trends, customer behavior, and product performance, enabling managers and analysts to drive data-driven business strategies.

### 3) Tech Stack
The following tools & technologies played key role in building this project:
  - 🟩 **MS Excel:** For storing the extracted raw data tables (csv format).
  - 🛢️ **My SQL Workbench:** Data transformation & cleaning for preparing data for further analysis.
  - 📊 **Power BI Desktop:** Main data visualization platform, used for report creation.
  - 🔗 **Data Modeling:** For relationship establishment among the tables to enable cross-filtering & aggregations.
  - 🧠 **DAX (Data Analysis Expression):** For calculated measures, dynamic visuals & conditional logics.

### 4) Data Source
**Source:** https://github.com/ 
- Data on 24 **Maven Market** stores spanning across 3 countries, 10 states over a 24-month period covering over 10,000 unique customers with 1,000 unique products. It captures details on sales, customer demographics, product information, store & regional attributes.

### 5) Business problem
Maven Market operates across multiple countries, states, and stores with a vast product portfolio and diverse customer base. However, the business lacks a centralized analytical view to track sales growth, customer retention, store performance, and regional trends. Without such insights, it becomes difficult to identify top-performing areas, optimize product offerings, and enhance customer engagement for sustainable growth.

Additionally, the absence of detailed performance tracking limits the ability to measure the impact of store remodeling and service strategies. This makes it challenging for management to make data-driven decisions and maintain a competitive edge in the retail industry.

### 6) Challanges Faced 🚧
During the course of this project, several technical and data-related challenges were encountered and strategically addressed to ensure accuracy and reliability of the analysis:

**a) Data Cleaning Challenges❗**

  - While observing the data tables the date fields were not formatted according to the standard date format of SQL, this was addressed using string functions like LPAD(), STR_TO_DATE(), SUBSTR() functions & later assigned to the date datatype.
  - Existence of some irrelevant columns like address, postal_code, product_weight, low_fat in customers & products table might slow down the overall performance, they were dropped by using the DROP command.
  - Some important fields (age) that were crucial for time series analysis were absent. They were CALCULATED by TIMESTAMPDIFF() function.
  - Inconsistencies & missing values were handled by imputation techniques through a conditional WHERE clause.
  - Appended all the transaction tables into a single consistent table using UNION ALL Clause to ensure efficiency.

**b) Statistical Calculations Complications❗**

  - Encountered complexity in creating a detailed measure to display the Customer Retention Rate on the customers insights dashboard, for this firs a separate measure has to be created called "Active Customers" using advanced DAX like VAR-RETURN, FILTER, CALCULATETABLE, KEEPFILTERS etc.. which was then used in final retention calculation.
  - While developing area chart to display the Month-Over-Month comparison between frequent & occasional buyers two dynamic measures has to be created using conditional formulas & functions.
  - Identifying top-performing stores by region posed a challenge, which was effectively addressed through analytical problem-solving and the creation of a dynamic measure using the AVERAGEX() DAX function.

### 7) Key Features
Following features have been added to make the project interactive & insightful:-

**a) Home Page**

  - **Page navigation buttons:** For smooth navigation across all the dashboards.

**b) Sales Performance Dashboard**
  
  - **KPI Cards (Total Sales, Units Sold, Profit Margin, Product Return Rate):** Provide a quick snapshot of overall business performance and profitability.

  - **Matrix (Brand-wise Sales Distribution):** Breaks down sales, units sold, and profit margin across different brands to identify top and low-performing ones.

  - **Area Chart (Product Price vs Units Sold):** Displays the leading products that contribute most to both sales and profitability.

  - **Stacked Column Chart (Top Selling Products by Sales & Profit):** Ranks best-performing products based on revenue and profitability.

  - **Line Chart (Quarterly Sales Trend):** Tracks sales growth patterns across quarters and months, enabling month-over-month performance comparison in both the years.
  
**c) Customer Overview Dashboard**
- **KPI Cards (Total Customers, Avg. Spent, Avg. Income, Retained Customers %):** Provide a quick snapshot of customer base, spending behavior, income levels, and retention rate.

- **Filled Map (Customer Regional Demographics):** Visualizes customer distribution across countries and states.

- **Clustered Column Chart (Avg. Income by Occupation & Marital Status):** Highlights how customer income varies across occupations and marital status, offering deeper demographic insights.

- **Donut Chart (Distribution of Customers by Membership):** Shows the share of customers across various membership categories.

- **Area Chart (MoM Frequent vs. Occasional Buyers):** Compares buyer frequency trends over time, highlighting seasonal shifts and customer engagement patterns.

**d) Store & Regional Summary Dashboard**
- **KPI Cards (Total Stores, Avg Store Sales, Top & Least Performing Stores):** Provide a quick overview of store network size, revenue performance, and identification of best and weakest performers.

- **Clustered Bar Chart (Total Sales by Store Type):** Compares revenue across different store types such as supermarkets, gourmet supermarkets, and small groceries.

- **Filled Map (Store Regional Demographics):** Displays the geographical distribution of stores across three countries and multiple states.

- **Bar Funnel Chart (Distribution of Customers by Sales Region):** Highlights regional customer distribution and concentration in key markets.

- **Donut Chart (Store Distribution by Remodel Category):** Shows the share of stores by remodel stage (newly remodeled, mid-aged, and aging).
  
**e) Key Takeaways**
- The Key Takeaways page consolidates all major insights from the dashboards into clear, actionable points. It summarizes trends in sales growth, customer demographics, store performance, and regional contributions, allowing stakeholders to quickly understand overall business health. This page acts as the final analytical layer, transforming detailed data visuals into concise findings that can guide strategic decision-making.

### 8) Key Findings
  - 💰 Sales Performance: $1.76M total sales with a strong 59.7% profit margin and just a 1% return rate reflect robust demand, efficient pricing, and high customer satisfaction.

  - 📊 Product Insights: Mid-range products ($1.5–$2.6) dominate sales; ADJ brand leads profitability at 68.4%, with Hermanos Green Pepper & Hilltop Mint Mouthwash driving top revenue.

  - 👥 Customer Behavior: Average spend of $171.63 per customer with 61.4% retention highlights loyalty, while frequent buyers surged in 1998, boosting long-term engagement.

  - 🏬 Store & Regional Trends: Supermarkets and Deluxe Supermarkets drive revenue, with Store 13 leading; the US West Coast and Mexico show highest customer density.

  - 📈 Growth & Seasonality: 1998 outperformed 1997, with upward sales momentum after early dips; seasonal fluctuations point to promotional and market cycle influences.

### 9) Use Case
The **Maven Market Analysis** project serves as a decision-support tool for retail managers, business analysts, and strategists, by consolidating diverse datasets into interactive dashboards, this project empowers stakeholders to make data-driven decisions that enhance efficiency, profitability, and customer satisfaction.
