select orderid
	, e.firstname, e.EmployeeID
	, soe.Firstname, soe.EmployeeID
	, orderdate
from orders2 o
	join employees e	on o.EmployeeIDOrder   = e.EmployeeID
	join employees soe	on o.EmployeeIDSignoff = soe.EmployeeID
order by e.firstname

SELECT a.FirstName, b.firstname
FROM employees a, employees b
WHERE a.employeeid = b.employeeid;
-- self join
SELECT  a.firstname, b.firstname, a.SALARY , b.salary
   FROM employees a, employees b
   WHERE a.SALARY < b.SALARY
   and a.firstname = 'robert';

-- cross join
with cte (avgPrice) as ( 
   select format (avg(price), '#,##0.00') from products
)
select productname
	, price
	, avgPrice 
	, format (price -avgPrice, '#,##0.00') as Differences
from products, cte
select * from ##Shippers5




