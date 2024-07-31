--Q1) Retrieve the total number of orders placed.
select count(order_id) as total_orders from orders;

--Q2)Calculate the total revenue generated from pizza sales.
select round(sum(order_details.quantity * pizzas.price)) as total_revenue
from order_details join pizzas
on pizzas.pizza_id = order_details.pizza_id

--Q3)Identify the highest-priced pizza.
select pizza_types.name, pizzas.price
from pizza_types join pizzas
on pizza_types.pizza_type_id = pizzas.pizza_type_id
order by pizzas.price desc limit 1;

--Q4)Identify the most common pizza size ordered.

select pizzas.size, count(order_details.order_details_id) as total
from pizzas join order_details
on pizzas.pizza_id = order_details.pizza_id
group by pizzas.size order by total desc

--Q5)List the top 5 most ordered pizza types along with their quantities.

select pizza_types.name, sum(order_details.quantity) as total_ordered
from pizza_types join pizzas
on pizza_types.pizza_type_id = pizzas.pizza_type_id
join order_details
on order_details.pizza_id = pizzas.pizza_id
group by pizza_types.name order by total_ordered desc limit 5;