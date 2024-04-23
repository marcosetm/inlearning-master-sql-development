WITH low_stock AS (
   SELECT AVG(in_stock) AS avg_stock FROM inventory
)
SELECT 
	prod_category,
    prod_number,
    prod_name
FROM    
    inventory, low_stock
WHERE
	in_stock < low_stock.avg_stock;