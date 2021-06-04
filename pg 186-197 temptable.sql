create table #employees
 (
	employeeid int
	, totalRevenue float
 )


insert into #employees 
select EmployeeID, sum (quantity* price) 
from products
join orderdetails on products.ProductID =orderdetails.ProductID
join orders on orderdetails.orderID =orders.orderID
group by EmployeeID


SELECT employeeId, totalRevenue
FROM #employees 

drop table #employees


create table ##employees
 (
	employeeid int
	, totalRevenue float
 )


insert into ##employees 
select EmployeeID, sum (quantity* price) 
from products
join orderdetails on products.ProductID =orderdetails.ProductID
join orders on orderdetails.orderID =orders.orderID
group by EmployeeID


SELECT employeeId, totalRevenue
FROM ##employees 

drop table ##employees