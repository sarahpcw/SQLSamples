select 
top (10) 
	 orderid, customerId, Freight, Shipname, Shipregion , Shipcity
from orders
order by shipcity

select * from orders
order by OrderID  
offset 10 rows fetch next 25 rows only

-- to use fetch, order by is required
-- similar to top, but skipping some records at the top first 
-- and then show a limited number of rows

select * from employees
order by EmployeeID  
offset 0 rows fetch next 5 rows only

select * from employees
order by EmployeeID  
offset 3 rows fetch next 5 rows only

select * from employees
order by EmployeeID  
offset 3 rows fetch first 5 rows only

-- offset without fetch
select * from employees
order by EmployeeID  
offset 5 rows  -- skips 5 rows and shows all the rest

-- select null

-- use variables
-- PAGE 38
declare @rows int = 1  -- BIGINT datatype , check version
select * from employees
order by EmployeeID  
offset @rows rows fetch next 5 rows only

declare @rows int = 1  -- BIGINT datatype , check version
select * from employees
order by EmployeeID  
offset @rows + 1 rows fetch next 3 rows only  -- skip 2 then show 3

declare @rows int = 1  -- BIGINT datatype , check version
select top ( @rows )  * from employees  -- brackets compulsary
order by EmployeeID  

-- page 50 indexing foreign keys
-- pg 60 join on null values
-- pg 71 date offsets


 