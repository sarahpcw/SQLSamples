--system functions

USE AdventureWorks2014;  
GO  
SELECT name AS index_name,   
    STATS_DATE(object_id, index_id) AS statistics_update_date  
FROM sys.indexes   
WHERE object_id = OBJECT_ID('Person.Address');  
GO  

 
USE AdventureWorks2014;  
GO  
SELECT GETANSINULL('AdventureWorks2014')  
GO  

select HOST_NAME ()  , HOST_ID () , ERROR_STATE ( ) , MIN_ACTIVE_ROWVERSION()  

--Returns the number of rows affected 
--by the last statement executed. 
--This function operates like @@ROWCOUNT, 
--except the return type of ROWCOUNT_BIG is bigint.
use [Northwind]
select * from employees
select ROWCOUNT_BIG()

 