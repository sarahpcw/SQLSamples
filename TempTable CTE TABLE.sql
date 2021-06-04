with CTE (orderid, customerid, customername)
AS
(
Select orderid, customers.CustomerID, customername
from orders
join customers on orders.CustomerID =customers.CustomerID
where orderdate between '1996-01-01' and '1997-12-31'
 
)
select *
from CTE
where customername like 'a%'