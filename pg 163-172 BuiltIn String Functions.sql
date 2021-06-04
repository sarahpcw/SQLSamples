use [AdventureWorks2014]
go
select top 100
	title
	, REPLACE(title, 'Ms.', 'Mrs.') as Title1
	, coalesce([Title],'') as Title2
	, coalesce(replace (title, 'Ms.', 'Mrs.'),'') as Title3
	, lower([FirstName]) as FirstName
	, UPPER([Person].[Person].[LastName]) as Lastname
	, concat( title, ' ' , firstname, ' ' , lastname) as Fullname
from  [Person].[Person]
go



--SUBSTRING(string/column to inspect, from position, how many) 
SELECT top 500 [EmailAddress]
	, SUBSTRING( [EmailAddress], 1, 4) 'First 4 Letter'	
	, SUBSTRING( [EmailAddress], 1, 3) 'First 3 Letter'
	, SUBSTRING( [EmailAddress], 1, 2) 'First 2 Letter'
	, SUBSTRING( [EmailAddress], 1, 1) FirstLetter
	, charindex('@', [EmailAddress])  'Position of @'
	, len ([EmailAddress]) 'Length'
	, SUBSTRING( [EmailAddress], charindex('@', [EmailAddress]), len ([EmailAddress]) ) 'All characters From the @'
	, SUBSTRING( [EmailAddress], 1, charindex('@', [EmailAddress]) ) 'All up to the @'
	, SUBSTRING( [EmailAddress], charindex('@', [EmailAddress])+1, len ([EmailAddress]) ) 'Again characters From the @'
	, SUBSTRING( [EmailAddress], 1, charindex('@', [EmailAddress])-1 ) 'Again up to the @'
from  [Person].[Person] p
join [Person].[EmailAddress] pe on p.[BusinessEntityID] = pe.[BusinessEntityID] 
go 


SELECT 
	       Left( [EmailAddress],    charindex('@', [EmailAddress])-1 ) 'All up to the @'
	, SUBSTRING( [EmailAddress], 1, charindex('@', [EmailAddress])-1 ) 'Again up to the @ '
	,     Right( [EmailAddress],    len (EmailAddress) -  charindex('@', [EmailAddress] ) ) 'All FROM the @'
	, SUBSTRING( [EmailAddress], charindex('@', [EmailAddress]) + 1, len ([EmailAddress]) ) 'Again From the @'
from  [Person].[Person] p
join [Person].[EmailAddress] pe on p.[BusinessEntityID] = pe.[BusinessEntityID] 
go                                                

select ltrim (emailaddress) 'lTrim' , rtrim ( [EmailAddress] ) 'rtrim'
from  [Person].[Person] p
join [Person].[EmailAddress] pe on p.[BusinessEntityID] = pe.[BusinessEntityID] 
go  

