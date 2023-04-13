use movie;
show tables;

#1.Write a SQL query to retrieve the first 5 rows from the "customers" table .
select * from customers limit 5;

#2. Write a SQL query to retrieve the unique city names from "customers" table sorted indescending order.
select distinct city from customers order by city desc;

#3. Write a SQL query to get the number of unique city names "offices" table.
select distinct count(city) from offices;

#4. Write a SQL query to get the maximum, minimum and average value from the"CreditLimit" column in the "customers" table.
select max(creditlimit) from customers;
select min(creditlimit) from customers;
select avg(creditlimit) from customers;

#5. Write a SQL query to get the city names which are present in “offices” table but not in“customer” table.
select city from offices where city in(select city from customers);

#6. Write a SQL query to get the city names which are present in “offices” table as well as in“customer” table.
select distinct offices.city from offices inner join customers
on offices.state = customers.state;

#7. Write a SQL query to get records where city or state is not given in “customer” table andcreditlimit is in the range – 80000 to 130000.
select * from customers
where city is null or state is null and creditlimit between 80000 and 130000;

#8. Write a SQL query to get the maximum number of orders placed on a particular date andwhat is that date in orders table.
select orderDate, count(orderNumber) as num_orders from orders
group by orderDate order by num_orders desc limit 1;

#9. For the records which we get in previous question(Q8), write a SQL query to get thecustomer names and their phone numbers.
select c.customerName, c.phone from customers c
join orders on c.customerNumber = o.customerNumber
where o.orderDate = (
select orderDate from orders
group by orderDate order by count(orderNumber) desc limit 1
);


#10. SQL query to get the customer phone number and customer name from customers tablewhere order is either cancelled or disputed in orders table.
select c.customerName, c.phone from customers c
inner join orders o ON c.customerNumber = o.customerNumber
where o.status IN ('cancelled', 'disputed');

#11. Write a SQL query to get the top 4 highest selling products from orderdetails table.
SELECT productcode, SUM(quantityordered) as total_quantity
FROM orderdetails
GROUP BY productcode
ORDER BY total_quantity DESC
limit 5;

#12. Write a SQL query to get the count of orders placed by each customer in 2003 and 2004.
select orders.customerNumber, count(orders.orderNumber) as numorders
from orders
where year(orders.orderDate) in (2003,2004)
group by orders.customerNumber
order by numorders desc;


#13. Write a SQL query to get the city names from customer table where more than 4customers reside.
select a.city, count(distinct a.customerName) as numcustomers
from customers a
group by a.city
having numcustomers > 4
order by numcustomers desc;