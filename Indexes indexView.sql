alter VIEW v1
WITH SCHEMABINDING  
AS  
    SELECT  p.ProductID
		, productname
		--, isnull( SUM(Price*quantity), 0)    AS Revenue  
		, count_big(*) as CB
    FROM dbo.products p 
	join dbo.orderdetails od on p.ProductID = od.ProductID
	group by p.ProductID, productname
GO  

select * from v1

drop index IDX_V122 on v1
--Create an index on the view.  
CREATE UNIQUE CLUSTERED INDEX IDX_V122   
    ON v1 (productname );  
GO 

--This function returns the number of items found in a group. 
--COUNT_BIG operates like the COUNT function. 
--These functions differ only in the data types of their return values. 
--COUNT_BIG always returns a bigint data type value. 
--COUNT always returns an int data type value.