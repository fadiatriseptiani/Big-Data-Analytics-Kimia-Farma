# Big Data Analytics Kimia Farma

This project analyzes Kimia Farma’s business performance from 2020 to 2023 using transaction data from multiple branches across Indonesia. The goal is to extract actionable insights regarding financial performance, customer behavior, and branch productivity to support business decision-making.

**Data Understanding**

There are four datasets used in this project, namely transaction data, product data, branch data, and inventory data. 
<img width="632" height="205" alt="Screenshot 2025-11-01 193251" src="https://github.com/user-attachments/assets/00d8f20a-63aa-4475-b13d-ff8c9f589826" />
<img width="616" height="157" alt="Screenshot 2025-11-01 193315" src="https://github.com/user-attachments/assets/623fb040-302e-4499-8768-c3a502e059d3" />


**Data Modelling with BigQuery**

An analytical table for reporting was built using SQL transformations, including:
- Determining the gross profit percentage based on price
- Calculating nett sales (price * gross profit percentage)
- Calculating profit (price * (1-discount percentage/100))
- Joining product, inventory, branch, and transacion tables
  
Resulting analysis tables were then connected directly to Looker Studio

**Dashboard Development**

The dashboard provides a comprehensive business performance view, including:

- Key Metrics:
Total Transactions: 672.5K
Total Customers: 264.6K
Total Revenue: 1.4T
Total Profit: 395.7B
Average Rating: 4.0

- Analytical Visuals:
Top 10 Provinces by Revenue & Transactions
Revenue performance trend (2020–2023)
Top 5 High-Performing Branches with Ratings
Profit distribution map across Indonesia

- Filters for Province, Branch, Revenue Range, and Product Category

![PBI_Kimia_Farma (1)_page-0001](https://github.com/user-attachments/assets/32a697c9-a8fc-46c9-aee9-df1db9d3be28)


**Data Insight**

- West Java is the strongest market, leading in both revenue and transaction volume.
- Provinces outside Java show lower sales performance, indicating market expansion opportunities.
- Revenue drop in 2021 likely driven by COVID-19 restrictions and shifts in consumer behavior. Recovery in 2022 shows adaptable business performance.
- Subang, Garut, and Purwakarta appear in the Top 5 city with high-performing branches, excelling in both transaction count and customer satisfaction.

Fadia Tri Septiani

triseptianifadia@gmail.com 
