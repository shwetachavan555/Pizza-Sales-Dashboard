USE pizza_database;

SELECT * FROM pizza_sales;

SELECT                                                                         #daily trend
    DAYNAME(STR_TO_DATE(order_date, '%m/%d/%Y')) AS Order_Day,
    COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY Order_Day
ORDER BY 
    CASE Order_Day
        WHEN 'Monday' THEN 1
        WHEN 'Tuesday' THEN 2
        WHEN 'Wednesday' THEN 3
        WHEN 'Thursday' THEN 4
        WHEN 'Friday' THEN 5
        WHEN 'Saturday' THEN 6
        WHEN 'Sunday' THEN 7
    END;
 SELECT                                     # hourly trend
    HOUR(STR_TO_DATE(order_time, '%H:%i:%s')) AS order_hour,
    SUM(quantity) AS total_pizzas_sold
FROM pizza_sales
GROUP BY order_hour
ORDER BY order_hour;


SELECT                                                             # percentage sale by pizza category
    pizza_category,
    ROUND( SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales), 2 ) 
        AS Percentage_Sales
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Percentage_Sales DESC;

 

# percentage sale by pizza size
SELECT pizza_size,
    ROUND(SUM(total_price), 2) AS total_revenue,
    ROUND(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales), 2) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size;

SELECT pizza_category, SUM(quantity) AS Total_Quantity_Sold      #pizza sold by category
FROM pizza_sales
-- WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC

SELECT pizza_name, SUM(total_price) AS Total_Revenue    # top 5 pizza by revenue
FROM  pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC LIMIT 5;

# less sale  5 Pizzas by Revenue 
SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC LIMIT 5;

SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders   # top 5 pizza by total order
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC

#	Top 5 Pizzas by Quantity
SELECT pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold 
 LIMIT 5;
       # Borrom 5 Pizzas by Total Orders
SELECT 
    pizza_name, 
    COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC
LIMIT 5;

