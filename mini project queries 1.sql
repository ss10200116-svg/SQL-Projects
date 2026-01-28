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
select method,sum(amount_paid) from payments group by method;

--  Level 4 Multi table _Queries
select o.*,c.name
from orders o
inner join customers c
on c.customer_id=o.customer_id;
select * from products;
select * from order_items;

select o.*,p.name
from order_items o
inner join products p
on o.product_id=p.product_id;

select o.*,p.method
from orders o
inner join payments p
on o.order_id=p.order_id;

select c.name,o.*
from customers c
left join orders o
on c.customer_id=o.customer_id;

select p.*,o.quantity
from products p
left join order_items o
on p.product_id=o.product_id;

select o.order_id,p.*
from orders o
right join payments p
on o.order_id=p.order_id;

select c.*,o.*,p.*
from orders o
left join customers c
on o.customer_id=c.customer_id
left join payments p
on o.order_id=p.order_id;

-- Level 5 Subqueries (Inner Queries)
select * from products where price >(select avg(price) from products);
select customer_id, name from customers where customer_id=  any (select customer_id from orders);
select * 
from orders o
where total_amount>(select avg(total_amount) from orders where customer_id=o.customer_id);
select name from customers where customer_id not in (select customer_id from orders);
select name from products where product_id not in (select product_id from orders);
select customer_id, max(total_amount) from orders group by customer_id;
select c.name,o.order_id,o.total_amount
from orders o
join(select customer_id, max(total_amount) as max_amount from orders group by customer_id) as  max_orders
on o.customer_id=max_orders.customer_id
and o.total_amount= max_orders.max_amount
join customers c
on o.customer_id=c.customer_id;

-- Level 6 Set operations
select customer_id from orders
union
select customer_id from product_reviews;

select distinct customer_id from orders where customer_id in (select customer_id from product_reviews);
