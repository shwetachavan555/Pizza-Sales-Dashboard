USE pizza_database;

SELECT * FROM pizza_sales;
SELECT CAST(SUM(total_price) AS decimal (10,2))AS Total_revenue FROM pizza_sales;

SELECT 
    CAST((SUM(total_price) / COUNT(DISTINCT order_id)) AS DECIMAL(10,2)) AS Avg_Order_Value
FROM pizza_sales;



#TOTAL PIZZA SOLD
SELECT SUM(quantity) AS total_pizza_sold FROM pizza_sales;

# TOTAL ORDER
SELECT COUNT(DISTINCT order_id) AS total_order FROM pizza_sales;

# Sales By Hour Of The Day
SELECT HOUR(order_time) AS order_hours, SUM(quantity) AS total_pizzas_sold
FROM pizza_sales
GROUP BY HOUR(order_time)
ORDER BY HOUR(order_time);
SELECT 
    SUM(quantity) * 1.0 / COUNT(DISTINCT order_id) AS Avg_Pizzas_per_order
FROM pizza_sales;

select* from pizza_sales