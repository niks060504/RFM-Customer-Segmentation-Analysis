/*************************************************************************************************
-- PROJECT: RFM Customer Segmentation Analysis
-- SCRIPT: 01_data_cleaning.sql
-- DESCRIPTION: This script performs the initial cleaning of the raw e-commerce transaction data.
--              It filters out invalid records and engineers the 'line_revenue' feature.
-- BUSINESS RULES:
--    1. Exclude transactions with a NULL CustomerID.
--    2. Exclude transactions with a quantity of 0 or less (returns).
--    3. Exclude transactions with a unit price of 0 or less.
-- AUTHOR: Amitesh Kumar Singh
-- DATE: September 10, 2025
*************************************************************************************************/

-- Write a single SQL query that selects data from ecommerce.raw_transactions and creates a new table ecommerce.transactions_cleaned with the results.

CREATE TABLE `crsm-471015.ecommerce.trans_clean` AS
SELECT *, Quantity * UnitPrice AS Line_Revenue
FROM `crsm-471015.ecommerce.raw_trans`
WHERE CustomerID IS NOT NULL
AND quantity > 0 
AND UnitPrice > 0;

/* 
  Write and run separate SQL queries to answer the following questions:
    1) What is the total number of rows in the new transactions_cleaned table?
    2) How many rows in the new table have a NULL CustomerID? (The answer should be 0).
    3) What are the minimum Quantity and minimum UnitPrice in the new table? (The answer should be > 0 for both).
*/

SELECT COUNT(*) Total_Rows, MIN(Quantity) min_quantity, MIN(UnitPrice) min_unitprice
FROM `crsm-471015.ecommerce.trans_clean`
WHERE CustomerID is not NULL;
