--SQL Server APPLY operator has two variants; 
--CROSS APPLY and OUTER APPLY. 
--The CROSS APPLY operator returns only those rows from 
--the left table expression (in its final output) if it matches 
--with the right table expression. In other words, the right table 
--expression 
--returns rows for the left table expression match only.

select o.orderid 
from orders o
cross apply ( 
select top 1 *, o.orderid from 
customers c where  o.CustomerID = c.CustomerID ) as z
where o.orderid <400

