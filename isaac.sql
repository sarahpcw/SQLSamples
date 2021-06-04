--Exercise: 
--Show all the products on the Products Table where the price is null
--Query
Select *
From Products
Where price is null
--Result:
--ProductID	ProductName	SupplierID	CategoryID	Unit	Price
--101	cinnamon	NULL	NULL	NULL	NULL


--Show all the columns on the Customers Table where the address is null
--Query
Select *
From Customers
Where Address is null
--Result:
--CustomerID	CustomerName	ContactName	Address	City	PostalCode	Country
						
--Exercise
select suppliername 
, city 
, country 
, case 
	when country = 'uk' then 'uk'
	when country in ('Germany','Italy','Netherlands','Norway','Spain', 'Sweden')  then 'EUROPE'
	else 'Rest of the World'
end REGION 
from suppliers 
order by Region

select productname , price
, price * 1.2 as PriceInclVat
, case 
	when price is null then 'Item not for sale'
	when price <= 50 then 'Price less then or equals 50'
	else 'more than fifty'
end as classification 
from products 
where price is not null
order by price

--Query
--ALTER TABLE Suppliers
--  ADD Region VARCHAR(50)

--Insert into Suppliers (Country,Region)
--values ('UK','UK')

--Insert into Suppliers (Country,Region)
--values ('Germany','Europe')

--Insert into Suppliers (Country,Region)
--values ('Italy','Europe')

--Insert into Suppliers (Country,Region)
--values ('Netherlands','Europe')

--Insert into Suppliers (Country,Region)
--values ('Norway','Europe')

--Insert into Suppliers (Country,Region)
--values ('Spain','Europe')

--Insert into Suppliers (Country,Region)
--values ('Sweden','Europe')

--Insert into Suppliers (Country,Region)
--values ('USA','Rest of the World')

--Insert into Suppliers (Country,Region)
--values ('Brazil','Rest of the World')

--Insert into Suppliers (Country,Region)
--values ('Australia','Rest of the World')

--Insert into Suppliers (Country,Region)
--values ('Singapore','Rest of the World')


select distinct country,region
from suppliers 
where country is not null
and region is not null


--Result:
--country	region
--Australia	Rest of the World
--Brazil	Rest of the World
--Denmark	Europe
--Finland	Europe
--France	Europe
--Germany	Europe
--Italy	Europe
--Netherlands	Europe
--Norway	Europe
--Singapore	Rest of the World
--Spain	Europe
--Sweden	Europe
--UK	UK
--USA	Rest of the World

--Exercise
--1.	Show Customers with no orders
select c.customerid, orderid
from customers c
left join orders o on c.customerid = o.customerid
order by orderid

--Query

--Show Customer_name, orderID using INNER Join 
select c.customerid, orderid
from customers c
left join orders o on c.customerid = o.customerid
order by orderid
--Query

--Show Customer_name, orderID  using LEFT Join 
--Query


--Show Customer_name, orderID  using LEFT Join where OrderID is Null

select c.customerid, orderid
from customers c
left join orders o on c.customerid = o.customerid
where orderid is null
order by orderid 


--2.	Show Employees with no Orders
--Query: 
select e.employeeid, e.firstname, orderid
from employees e
left join orders o on e.employeeid = o.employeeid
where orderid is null
order by orderid 

--3.	Show Shippers with no Orders
--Query: 
select s.shipperid, s.shippername, orderid
from shippers s
left join orders o on s.shipperid = o.shipperid
where orderid is null
order by orderid 

--4.	Show Suppliers with no Products
--Query
select s.supplierid, s.suppliername, productname
from suppliers s
left join products p on s.supplierid = p.supplierid
--where productname is null
order by suppliername 

--5.	Show Categories with no Products
--Query
select c.categoryid, c.categoryname, productname
from categories c 
left join products p on c.categoryid = p.categoryid
--where productname is null
order by categoryname 


