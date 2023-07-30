-- 1. who is the senior most employee based on job title ?
select * from employee;
select first_name,last_name,title,levels from employee order by levels desc limit 1;
-- 2. which countries have the most invoices ?
select * from invoice;
select billing_country,count(invoice_id) as invoices 
from invoice 
group by billing_country 
order by invoices desc limit 1;
-- 3. What are the top 3 values of Total Invoices ?
select Distinct Total as top_3_values 
from invoice  
order by top_3_values  desc limit 3;
-- 4. which city has the best customers?
-- query returns one country has highest sum of invoice total.return city name and sumof invoice total?

select billing_city,sum(total) as invoice_total 
from invoice 
group by billing_city 
order by invoice_total desc limit 1;

-- who is the best customer ? write a query that returns the customer name who has spent the most money ?
select * from customer;

select customer.customer_id,customer.first_name,customer.last_name,sum(invoice.total) as Highest
from customer join invoice on customer.customer_id=invoice.customer_id
group by customer.customer_id
order by Highest desc limit 1;