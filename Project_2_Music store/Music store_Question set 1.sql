--Q1: Who is the senior most employee based on job title?
select * from employee
order by levels desc
limit 1

--Q2: Which country have the most Invoices?

select count(*) as c, billing_country 
from invoice
group by billing_country
order by c des

--Q3: What are top 3 Valuse of total invoice?

Select total from invoice
order by total desc
limit 3

--Q4. Which country has the best customers? We would like to throw a promotiona music festival in the citu we made the most money. Write a query that returns one city that has the highest sum of invoice totals. Return both the city name and sum of all invoice total

select sum(total) as invoice_total, billing_city from invoice
group by billing_city
order by invoice_total desc

--Q5: Who is the best customer?

select customer.customer_id, customer.first_name, customer.last_name, sum(invoice.total) as t from customer
join invoice on customer.customer_id = invoice.customer_id
group by customer.customer_id
order by t desc
limit 5

