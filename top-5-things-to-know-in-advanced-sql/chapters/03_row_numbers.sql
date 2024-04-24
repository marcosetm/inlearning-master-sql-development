/*
Write a query using ROW_NUMBER() that returns
- order_num
- order_date
- cust_name
- prod_category
- prod_name
- order_total

For the three orders with the highest order_total from 
each prod_category purchased by Boehm Inc
*/

WITH orders AS (
	SELECT 
	    order_num,
	    order_date,
	    cust_name,
	    prod_category,
	    prod_name,
	    order_total,
		ROW_NUMBER() OVER(PARTITION BY prod_category ORDER BY order_total DESC) AS order_rank
	FROM 
	    online_retail_sales
	WHERE cust_name = 'Boehm Inc.'
)

SELECT * FROM orders WHERE order_rank <= 3;