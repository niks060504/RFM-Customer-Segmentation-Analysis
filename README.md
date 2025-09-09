# RFM Customer Segmentation & Retention Analysis
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
### Author: Amitesh Singh | <a href="https://www.linkedin.com/in/amiteshsingh2001/">LinkedIn</a>
---

### Project Summary
This project is an end-to-end data analysis of an e-commerce dataset to segment customers using an **RFM model**. The goal is to identify high-value and at-risk customer groups and provide actionable marketing strategies, with the final output being a **dynamic, interactive BI dashboard**.

### Business Problem
A mid-sized global e-commerce retailer was experiencing a noticeable increase in **customer churn**. The company lacked a data-driven method to understand the purchasing behavior of different customer groups, making it difficult to target marketing efforts effectively and prevent valuable customers from leaving. This project aims to solve that problem by creating a robust customer segmentation model.

### Tech Stack & Tools
* **Cloud Data Warehouse:** Google BigQuery
* **Language:** SQL
* **BI & Visualization:** Google Looker Studio
* **Collaboration:** Google Slides, Google Docs

### Project Workflow
The project followed the complete data analytics lifecycle:

1.  **Data Cleaning & Transformation (ETL):** Ingested over **540,000** raw transaction records into **Google BigQuery**. Used **SQL** to develop a cleaning pipeline to handle over **140,000** records with data integrity issues (`NULL`s, returns, etc.), resulting in a clean analytical dataset.

2.  **RFM Model Engineering:** Used advanced **SQL** to engineer a Recency, Frequency, and Monetary (RFM) model from scratch, calculating each customer's last purchase date, transaction frequency, and total monetary value.

3.  **Customer Scoring & Segmentation:** Leveraged **SQL window functions** (`NTILE`) to score each customer on a 1-4 scale for each RFM dimension. Implemented a `CASE` statement to group all **4,338 customers** into nine distinct, business-relevant segments.

4.  **Dashboard Development & Validation:** Built an interactive, dynamic dashboard in **Looker Studio**. During development, I identified and corrected a critical **data validation error**, ensuring the final dashboard was 100% accurate.

### Key Insights 
The final analysis provided several critical insights:

* **High-Value Segment Identified:** The **'Champions'** segment, while comprising only **11%** of the customer base (489 customers), generates nearly **50%** of the company's total revenue (**$4.45M**).
* **Actionable Insights Delivered:** The marketing team is now empowered with a tool to visualize and filter customer segments in real-time for targeted campaigns.
* **Hibernating Customers:** The largest group by count is **'Hibernating'** customers (**1,521 total**), representing a significant opportunity for re-engagement.

### Final Dashboard [**[Link]**](https://lookerstudio.google.com/reporting/aef3a781-055b-4704-825f-5e71351c6bfa)
<img width="744" height="432" alt="{13172C85-3F2B-4033-B8DE-74818E88B2F3}" src="https://github.com/itsmeamitesh01/RFM-Customer-Segmentation-Analysis/blob/main/assets/dashboard.png" />

### SQL Scripts
The SQL queries used for each step of the analysis can be found in the `sql_scripts/` directory of this repository. The scripts are numbered in the order they should be run.
