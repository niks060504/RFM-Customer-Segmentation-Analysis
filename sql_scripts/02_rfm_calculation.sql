/*
    > Recency (R): How recently has the customer made a purchase?
    > Frequency (F): How often do they purchase?
    > Monetary (M): How much money do they spend?

    These three metrics are the fundamental building blocks for our customer segmentation model.


    Calculate Raw RFM Values
    Your goal is to write a single SQL query that creates a new table, customer_rfm. 
    This table should have one row for each unique CustomerID, along with Recency, Frequency and Monetary values. 
*/

-- -------------Method 1----------------------------

CREATE TABLE `crsm-471015.ecommerce.customer_rfm` AS 
SELECT 
  CustomerID, 
  ROUND(SUM(Line_Revenue),2) AS Monetary, 
  COUNT(DISTINCT InvoiceNo) AS Frequency, 
  DATE_DIFF(
    (SELECT DATE(MAX(InvoiceDate)) FROM `crsm-471015.ecommerce.trans_clean`), 
    DATE(MAX(InvoiceDate)), 
    day
  ) Recency
FROM 
  `crsm-471015.ecommerce.trans_clean` 
GROUP BY 
  CustomerID;

-- -------------Method 2----------------------------

WITH MaxDate AS (
  -- First, find the overall latest date and define our snapshot date
  SELECT 
    DATE_ADD(MAX(InvoiceDate), INTERVAL 1 DAY) AS snapshot_date
  FROM 
    `crsm-471015.ecommerce.trans_clean`
)

CREATE TABLE `crsm-471015.ecommerce.customer_rfm` AS
SELECT
  CustomerID,
  DATE_DIFF(MaxDate.snapshot_date, DATE(MAX(InvoiceDate)), DAY) AS recency,
  COUNT(DISTINCT InvoiceNo) AS frequency,
  ROUND(SUM(line_revenue), 2) AS monetary
FROM 
  `crsm-471015.ecommerce.trans_clean`, MaxDate
GROUP BY
  CustomerID;


SELECT
  CustomerID,
  Recency,
  Frequency,
  Monetary
FROM `crsm-471015.ecommerce.customer_rfm`
ORDER BY CustomerID
LIMIT 10;



