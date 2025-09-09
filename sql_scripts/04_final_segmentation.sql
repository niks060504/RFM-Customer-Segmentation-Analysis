/*************************************************************************************************
-- PROJECT: RFM Customer Segmentation Analysis
-- SCRIPT: 04_final_segmentation.sql
-- DESCRIPTION: This is the final analytical script. It uses a CASE statement to assign a
--              human-readable segment name to each customer based on their R, F, and M scores.
--              These segments are the final output used in the BI dashboard.
-- AUTHOR: Amitesh Kumar Singh
-- DATE: September 10, 2025
*************************************************************************************************/



/*
  Your goal is to create one last table, customer_segments, that contains all the information from your customer_rfm_scores table, plus a final segment name.

  Action: Write a query that reads from ecommerce.customer_rfm_scores and uses a CASE statement to assign a segment name based on the r_score, f_score, and m_score.

*/

create table `crsm-471015.ecommerce.customer_seg` AS
select *, 
  CASE
  WHEN r_score = 4 AND f_score = 4 AND m_score = 4 THEN 'Champions'
  WHEN r_score = 4 AND f_score = 4 THEN 'Loyal Customers'
  WHEN r_score = 4 AND f_score >= 3 THEN 'Potential Loyalists'
  WHEN r_score = 4 AND f_score <= 2 THEN 'New Customers'
  WHEN r_score = 3 AND f_score >= 3 THEN 'Needs Attention'
  WHEN r_score = 2 AND f_score >= 3 THEN 'At-Risk'
  WHEN r_score <= 2 AND f_score <= 2 THEN 'Hibernating'
  WHEN r_score = 1 THEN 'Lost'
  ELSE 'Other'
END AS segment
from `crsm-471015.ecommerce.customer_rfm_scores`;


select segment, count(*) as total_in_segment
from `crsm-471015.ecommerce.customer_seg`
group by segment
order by total_in_segment;
