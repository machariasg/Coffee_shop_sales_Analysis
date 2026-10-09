----KPI
---1.TOTAL REVENUE
SELECT SUM(total_price) AS total_revenue
FROM PIZZA_SALES_ORDERS
---2 TOTAL ORDERS
SELECT COUNT(distinct ORDER_ID) AS total_orders 
FROM PIZZA_SALES_ORDERS

---Average order value
SELECT round(SUM(total_price)/count(distinct order_id),2) 
As average_order_value
from PIZZA_SALES_ORDERS

----Total pizza sold
SELECT  SUM(quantity)AS total_pizza_sold
FROM PIZZA_SALES_ORDERS

----Average pizza per order
SELECT round(SUM(quantity)/COUNT(DISTINCT order_id),2) AS average_pizzas_per_order
FROM PIZZA_SALES_ORDERS

----Monthly Trend for total Revenue
SELECT TO_CHAR(order_date,'Month')AS month,
SUM(total_price)AS total_revenue
from PIZZA_SALES_ORDERS
group by TO_CHAR(order_date,'Month')
ORDER BY day desc

___Daily trend for Total Orders
SELECT TO_CHAR(order_date,'DAY')AS day,
count(distinct order_id)AS total_orders
FROM PIZZA_SALES_ORDERS
group by TO_CHAR(order_date,'DAY')

----percentage of sales by pizza category
SELECT pizza_category,
sum(total_price)AS total_revenue,
round(sum(total_price)*100/(select sum(total_price) from PIZZA_SALES_ORDERS),2)AS percentage
FROM PIZZA_SALES_ORDERS
group by pizza_category
-----------percentage of sales by pizza size
SELECT pizza_size,
sum(total_price)AS total_revenue,
round(sum(total_price)*100/(select sum(total_price) from PIZZA_SALES_ORDERS),2)AS percentage
FROM PIZZA_SALES_ORDERS
group by pizza_size

--------Total pizza sold by pizza size and category
SELECT pizza_size,
sum(total_price) AS total_sales_by_size
from pizza_sales_orders
group by pizza_size

SELECT pizza_category,
sum(total_price)AS total_sales_by_category
from pizza_sales_orders
group by pizza_category
-----------Revenue by pizza name
SELECT pizza_name,
sum(total_price)AS total_revenue
FROM pizza_sales_orders
group by pizza_name

---------Top and bottom analyis
---------Top pizza by Revenue
select pizza_name,
sum(total_price)
FROM pizza_sales_orders
group by pizza_name
order by sum(total_price) desc
limit 1

----Botton pizza by Revenue
select pizza_name,
sum(total_price)
FROM pizza_sales_orders
group by pizza_name
order by sum(total_price) asc
limit 1

-----Top pizza by order
SELECT pizza_name,
count(distinct order_id) As total_orders
FROM pizza_sales_orders
group by pizza_name
order by total_orders desc
limit 5
-------worst pizza by order
SELECT pizza_name,
count(distinct order_id) As total_orders
FROM pizza_sales_orders
group by pizza_name
order by total_orders asc
limit 5

-----Top pizza by quantity sold
select pizza_name,
sum(quantity)AS quantity_sold
from pizza_sales_orders
group by pizza_name
order by quantity_sold desc
limit 5

-----botton pizza by quantity sold
select pizza_name,
sum(quantity)AS quantity_sold
from pizza_sales_orders
group by pizza_name
order by quantity_sold asc
limit 5

