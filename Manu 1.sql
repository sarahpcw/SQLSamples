select categoryid, productname 
from products
where categoryid in 
(select categoryid from categories 
where categoryid > 3)


select productid, productname from products
where productid in 
(select productid from orderdetails
where orderid > 10400)
order by productid desc

select productid, productname, price from products
where price > 
(select avg(price) from products)


select categoryid, productname, price,
(select avg(price) from products) as Average,
Round (price - (select avg(price) from products),2) as Difference
from products
where categoryid = 1
order by CategoryID

select * from (
select firstname, lastname, notes from employees) temp
where temp.lastname like 'd%'
order by temp.firstname

select * from employees
where lastname like 'm%'

with CTE (firstname,lastname, notes) as
(
select firstname, lastname, notes from employees)
select * from CTE
where lastname like 'd%'


with cte (avgprice) as 
(select avg(price) from Products)
select categoryid, productname, price,cte.avgprice as Average, round(price-cte.avgprice,2) as Difference
--Round (price - (select avg(price) from products),2) as Difference
from products,cte
where categoryid = 1
order by CategoryID

select productname from products 
where not exists 
(select * from categories 
where categoryid > 100)


select customerid, customername, city from customers
where 2000 < 
(select sum(price*quantity)
from orders
join orderdetails on orders.orderid=orderdetails.orderid
join products on orderdetails.ProductID=products.ProductID
where orders.CustomerID=customers.CustomerID
group by CustomerID)

select customerid, customername, city,
(select sum(price*quantity)
from orders
join orderdetails on orders.orderid=orderdetails.orderid
join products on orderdetails.ProductID=products.ProductID
where orders.CustomerID=customers.CustomerID
group by CustomerID
having 2000< sum(price*quantity)) as CustomerTotals
from customers
order by customertotals desc


select t1.categoryid, categoryname, avg(t1.price) from products t1
join categories on t1.CategoryID=categories.CategoryID
group by t1.CategoryID,categoryname
having max(t1.price) > (
select 2 * (avg(t2.price)/2)
from products t2
where t1.categoryid = t2.CategoryID)



declare @avg float
select @avg = avg(price) from products
select productname, price, @avg, price - @avg as difference from products