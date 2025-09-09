/*
  Your goal is to create a new table, customer_rfm_scores, which contains all the data from your previous table, plus the new R, F, and M scores.

  Action: Write a single SQL query that reads from ecommerce.customer_rfm and creates the new table ecommerce.customer_rfm_scores
*/

create table `crsm-471015.ecommerce.customer_rfm_scores` as 
select *,
  ntile(4) over(order by recency desc) as r_score,
  ntile(4) over(order by Frequency asc) as f_score,
  ntile(4) over(order by monetary asc) as m_score,
from `crsm-471015.ecommerce.customer_rfm`;



select *
from `crsm-471015.ecommerce.customer_rfm_scores`
limit 10;
