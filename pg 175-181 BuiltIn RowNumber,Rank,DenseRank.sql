select shipperid -- group by
	, count(orderid)  as OrdersperShippers
	, count ( employeeid) as EmployeesPerShippers
	, count( distinct employeeid) as DistinctEmployeesPerShipper
from orders
group by ShipperID

select CustomerID -- row_number()
	, count(orderid) as OrdersperCustomer
	, row_number() over ( order by count(orderid) ) as RowNumber
from orders
group by CustomerID
having count(orderid) > 4

select CustomerID -- row_number()
	, count(orderid) as OrdersperCustomer
	, row_number() over ( order by CustomerID ) as RowNumber
from orders 
group by CustomerID
having count(orderid) > 4
order by OrdersperCustomer

select CustomerID -- row_number(), rank() and dense_rank()
	, count(orderid) as OrdersperCustomer
	, row_number() over ( order by count(orderid) ) as RowNumber
	, rank() over  ( order by count(orderid) ) as 'Rank'
	, dense_rank() over( order by count(orderid) ) as 'Dense_Rank'
from orders 
group by CustomerID
having count(orderid) > 4
order by OrdersperCustomer





