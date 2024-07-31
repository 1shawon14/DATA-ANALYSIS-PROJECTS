--Q1) Join the necessary tables to find the total quantity of each pizza category ordered.
select pizza_types.category, sum(order_details.quantity) as quantity
from pizza_types join pizzas
on pizza_types.pizza_type_id = pizzas.pizza_type_id
join order_details
on order_details.pizza_id = pizzas.pizza_id
group by pizza_types.category order by quantity 

--Q2)Determine the distribution of orders by hour of the day.

select Extract(Hour from time) as times, count (order_id) as orders from orders
group by times order by times

--Q3)Join relevant tables to find the category-wise distribution of pizzas.

select category, count(name) from pizza_types
group by category

--Q4)Group the orders by date and calculate the average number of pizzas ordered per day.
with order_quantity as
(select orders.date as dates, sum(order_details.quantity) as quantity 
from orders join order_details
on orders.order_id = order_details.order_id
group by dates order by dates)

select round(avg(quantity)) as average_sells_per_day from order_quantity

--Q5)Determine the top 3 most ordered pizza 
--types based on revenue.

select pizza_types.name as pizza_name, round(sum(pizzas.price * order_details.quantity)) as revenue
from pizza_types join pizzas 
on pizza_types.pizza_type_id = pizzas.pizza_type_id
join order_details
on pizzas.pizza_id = order_details.pizza_id
group by pizza_name order by revenue desc limit 3

--Calculate the percentage contribution of each 
--pizza type to total revenue.
with revenue_table
(select pizza_types.name as pizza_name, round(sum(pizzas.price * order_details.quantity)) as revenue
from pizza_types join pizzas 
on pizza_types.pizza_type_id = pizzas.pizza_type_id
join order_details
on pizzas.pizza_id = order_details.pizza_id
group by pizza_name order by revenue desc)

select pizza_name 



