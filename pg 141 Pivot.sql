select customerid, [1] as shipper1, [2] as shipper2, [3] as shipper3 -- column headings of pivot table
into newPTable
from 
(   select customerid, shipvia, orderid   -- down, accross, aggregated value
	from orders
	where CustomerID = 'alfki'
)  as p
		pivot
		(   count(orderid) 
			for shipvia in ([1],[2],[3]) 
		) as p2


select customerid, [1] as emp1, [2] as emp2, [3] as emp3
from 
(	select  customerid,  employeeid,orderid
	from orders
	where EmployeeID in (1,2,3)
) as p
	pivot
	(   count(orderid) 
		for employeeid in ([1],[2],[3]) 
	) as pvt


select productname -- name of first col, could be text or numbers
, [1] as SupPerCat1, [2] as SupPerCat2 , [3] as SupPerCat3 -- name of cols, should be of data type int/ number
, [4] as SupPerCat4, [5] as SupPerCat5 , [6] as SupPerCat6
, [7] as SupPerCat7, [8] as SupPerCat2 , [9] as SupPerCat9
from 
	(   select productname, CategoryID, supplierid  -- down, accross, aggregated value
		from products
	) as p
	pivot
		(	count(supplierid) -- aggregated value
			for categoryid in ([1],[2],[3],[4],[5],[6],[7],[8],[9])  -- across headings
		) as pvt

 
select supplierid, [1] as ProdPerCat1, [2] as ProdPerCat2 , [3] as ProdPerCat3
from 
(   select supplierid, CategoryID, productid  --af, dwars, aggregated value
	from products
) as p
	pivot
	(	count(productid) 
		for categoryid in ([1],[2],[3]) 
	) as pvt
