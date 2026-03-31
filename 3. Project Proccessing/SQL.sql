SELECT*
From data_analytics.case_study.coffee_shop;
----------------------------------------------------------------
---DATA STARTING DATE
SELECT
  MIN(transaction_date) AS data_starting_date
FROM data_analytics.case_study.coffee_shop;
-----------------------------------------------------------------
  ---DATA ENDING DATE
SELECT
  MAX(transaction_date) AS data_ending_date
FROM data_analytics.case_study.coffee_shop;
------------------------------------------------------------------
  ---STORE LOCATION
SELECT DISTINCT
  (store_location)
FROM data_analytics.case_study.coffee_shop;
------------------------------------------------------------------
  ---PRODUCT TYPE
SELECT DISTINCT
  (product_type)
FROM data_analytics.case_study.coffee_shop;
-------------------------------------------------------------------
  ---PRODUCT CATEGORY
SELECT DISTINCT
  (product_category)
FROM data_analytics.case_study.coffee_shop;
---------------------------------------------------------------------
---BEST SELLING PRODUCT
--SELECT product_type, SUM(transaction_qty) AS best_selling_product
SELECT
  product_category,
  COUNT(product_type) AS best_selling_product
FROM data_analytics.case_study.coffee_shop
GROUP BY
  product_category
ORDER BY
  product_category DESC;
------------------------------------------------------------------------
---LEAST SELLING PRODUCT
SELECT
  product_category,
  COUNT(product_category) AS Least_selling_product
FROM data_analytics.case_study.coffee_shop
GROUP BY
  product_category
ORDER BY
  Least_selling_product ASC;
--------------------------------------------------------------------------
---CHECKING LOWEST AND HIGHEST UNIT PRICE
SELECT
     MIN(unit_price) AS Lowest_price,
     MAX(unit_price) AS Highest_price
FROM data_analytics.case_study.coffee_shop;
---------------------------------------------------------------------------
  ---EXTRACTING THE DAY NAME AND MONTH NAME
SELECT
  transaction_date,
  DAYNAME(transaction_date) AS Day_name,
  MONTHNAME(transaction_date) AS Month_name
FROM data_analytics.case_study.coffee_shop;

------------------------------------------------------------------------------
SELECT
COUNT(*) AS number_of_rows,
      COUNT(DISTINCT transaction_id) AS number_of_sales,
      COUNT(DISTINCT product_id) AS number_of_products,
      COUNT(DISTINCT store_id) AS number_of_stores
      FROM data_analytics.case_study.coffee_shop;
------------------------------------------------------------------------
SELECT
  transaction_id,
  transaction_date,
  transaction_time,
  transaction_qty,
  store_location,
  store_id,
  unit_price,
  product_category,
  product_type,
  product_detail,

  ---Adding columns to enhance the table for better insights
  Dayname(transaction_date) AS Day_name,
  Monthname(transaction_date) AS Month_name,
  Dayofmonth(transaction_date) AS Day_of_month,

  transaction_time,
  CASE
    WHEN date_format(transaction_time, 'HH:MM:SS') BETWEEN '00:00:00' AND '11:59:59' THEN 'Morning'
    WHEN date_format(transaction_time, 'HH:MM:SS') BETWEEN '12:00:00' AND '16:59:59'
    THEN 'Afternoon'
    WHEN date_format(transaction_time, 'HH:MM:SS') BETWEEN '17:00:00' AND '21:59:59' THEN 'Evening'
  END AS Time_classification,

--Calculating revenue
  unit_price,
  transaction_qty,
  unit_price * transaction_qty AS Revenue,
      

---Spend bucket
  transaction_qty * unit_price,
  case
    WHEN (transaction_qty * unit_price) < 4 THEN 'Low spender'
    WHEN (transaction_qty * unit_price) <= 6 THEN 'Middle spender'
    ELSE 'Higher spender'
  END AS spend_bucket
FROM data_analytics.case_study.coffee_shop;
------------------------------------------------------------------------------













