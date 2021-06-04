-- Here is the pivot query
select customerid, [1] as emp1, [2] as emp2 ,[3] as emp3
from 
(
select orderid, employeeid, customerid
from orders
) as p
pivot
(
	count(orderid) 
	for employeeid in ([1],[2],[3]) 
) as pvt

-- create a table
create table dbo.unPivt2 (
customerid nvarchar(20), emp1 int, emp2 int, emp3 int
) 
insert into dbo.unPivt2 (customerid , emp1 , emp2 , emp3 ) 
values 
	('ALFKI',	2,	0,	1),
	('ANATR',	0,	0,	2),
	( 'ANTON',1,	0,	3),
	( 'AROUT',	3,	0,	2)

-- select the table
select customerid , emp1 , emp2 , emp3 from unPivt2

-- unpivot the table
select  customerid , emps, ordercount 
from ( select customerid , emp1 , emp2 , emp3 from unPivt2 ) up
unpivot 
( ordercount for emps in ( emp1 , emp2 , emp3 ) ) as unPivt2




--Example 2
--SELECT *
--INTO newtable [IN externaldb]
--FROM oldtable
--WHERE condition; 
-- create a new Table called newUP
select customerid, [1] as emp1, [2] as emp2 ,[3] as emp3
into newUP
from 
(
select orderid, employeeid, customerid
from orders
) as p
pivot
(
	count(orderid) 
	for employeeid in ([1],[2],[3]) 
) as pvt  -- create a new Table called newUP

-- select newUP
select customerid , emp1 , emp2 , emp3 from newUP


-- upPivot newUP - example 1 (with subquery in the from )
select  customerid , emps, ordercount 
from ( 
		select customerid , emp1 , emp2 , emp3   -- all columns in the pivoted table eg NewPTable
		from newUP 
	 ) as up
			unpivot 
			( ordercount for emps in ( emp1 , emp2 , emp3  )  -- 
			) as newUP

-- upPivot newUP - example 2 (withOUT subquery in the from )
select  customerid , emps, ordercount 
from newUP 
	 as up
			unpivot 
			( ordercount for emps in ( emp1 , emp2 , emp3  )  -- 
			) as newUP
 
 