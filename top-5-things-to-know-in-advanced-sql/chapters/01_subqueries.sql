/*
Table: inventory
Task: write a query that uses sub and returns
    - Product Categroy
    - Product Number
    - Product Name
    - In Stock of items that have less than the average amoutn of products left in stock
*/

SELECT 
    prod_category,
    prod_number,
    prod_name
FROM    
    inventory
WHERE
	in_stock > 0 and
	in_stock < (SELECT AVG(in_stock) FROM inventory);