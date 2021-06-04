--space - gives spaces between columns
USE AdventureWorks2014;  
GO  
SELECT  LastName  + ',' + SPACE(2) +   FirstName   
FROM Person.Person  
ORDER BY LastName, FirstName;  
GO  