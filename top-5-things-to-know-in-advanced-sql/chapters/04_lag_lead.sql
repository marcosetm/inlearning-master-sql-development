/*

Write a query using LAG() or LEAD() that returns
- order_date
- quantity
- quantities from the last five order_dates

For each drone order from the online_retail_sales table
*/
WITH total_by_day AS (
    SELECT 
        order_date,
        SUM(quantity) as day_total
    FROM 
        online_retail_sales
    WHERE
        prod_category = 'Drones'
    GROUP BY order_date
)

SELECT 
    order_date,
    day_total,
    LAG(day_total, 1) OVER(ORDER BY order_date ASC) as previous_quantities_1,
    LAG(day_total, 2) OVER(ORDER BY order_date ASC) as previous_quantities_2,
    LAG(day_total, 3) OVER(ORDER BY order_date ASC) as previous_quantities_3,
    LAG(day_total, 4) OVER(ORDER BY order_date ASC) as previous_quantities_4,
    LAG(day_total, 5) OVER(ORDER BY order_date ASC) as previous_quantities_5
FROM 
    total_by_day tbd
ORDER BY order_date;