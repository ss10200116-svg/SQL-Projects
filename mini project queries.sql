use mini_project;

-- level 1 basic questions
select name,email from customers;
select * from products;
select distinct category from products;
select * from products where price>1000;
select * from products where price>2000 and price<5000;
select * from customers where customer_id in(3,4,5);
select * from customers where name like 'A%';
select * from products where category='Electronics' and price<3000;
select * from products order by name , price desc;
select name, price from products order by price desc, name asc;

-- level 2 Filtering and Formating
select * from orders where customer_id is null;
select name as customer_name, email as customer_email from customers;
select name , price*stock_quantity as total_value from products;
select concat(name, '-->', phone) as contact_diractory from customers;
select date(order_date) from orders;
select * from products where stock_quantity=0;

-- Level 3 Aggregations
select count(*)as total_orders from orders;
select sum(Total_amount) as total_revenue from orders;
select avg(Total_amount) as avg_order_value from orders;
select count(distinct customer_id) as customer_orders from orders;
select customer_id , count(order_id) from orders group by customer_id;
select customer_id , sum(total_amount) from orders group by customer_id;
select p.category,count(p.category)
from order_items oi
left join products p
on p.product_id=oi.product_id
group by p.category;
select category, avg(price) from products group by category;
select date(order_date), count(order_id) from orders group by date(order_date);

