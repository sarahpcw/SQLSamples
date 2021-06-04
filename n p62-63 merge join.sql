--The Merge Join  provides query results 
--that is generated by joining two SORTED data sets using 
--a FULL, LEFT, or INNER join. 
--The Merge Join transformation requires that both inputs be sorted and 
--that the joined columns have matching meta-data.
---- Meta-data: 
---- User cannot join a column must hae the same datatype 
---- e.g. e.city = c.city are both string data type
---- If the data has a string data type, 
---- the length of the columns should be the same
---- e.g. e.country = c.country 
---- (the 2 fields must be the same length. e.g. nvarchar(20)

--Simply put, a join is an operation 
--that links one table to another, 
--and SQL Server can use three algorithms to perform this operation, 
--the Loop, Merge and Hash. ... 
--The merge join is very fast because it requires that both inputs 
--are already sorted by the respective key columns

select e.City, c.region, e.region, c.country , c.CompanyName
from employees e
inner merge join Customers c
on  e.Country = c.Country 
	AND 
	( e.Region = c.Region  
	or ( e.Region is null and c.Region is null ) 
	 ) 
	and e.City = c.City


