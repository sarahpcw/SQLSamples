select FirstName +'  '+ LastName
	, notes, len(notes)
from employees

select FirstName +'  '+ LastName
	, notes
	, len(notes)
	, charindex('degree',notes)
from employees

select 
	upper(Left(FirstName, 1)) +'  '+ upper(LastName)
	,  notes
	, len(notes)
	, charindex('degree',notes)
	, notes
from employees

select country
	, left ( PostalCode, charindex(' ', postalcode) ) as Pcode
	, lower(CustomerName) as CustomerName
	, ContactName
	, CHARINDEX(' ', ContactName) AS PositionOfSpace
	, left ( ContactName, CHARINDEX(' ', ContactName)) as FirstChars
from customers
where Country like 'uk' 


select lower(CustomerName),  -- MARY SMITH
	left (contactname, CHARINDEX(' ', ContactName)) as Firstname
	,  city, Country, postalcode
	,left(postalcode
	, CHARINDEX(' ',postalcode)) as firstpartofpostcode, 
	right(postalcode, 4) as lastpartofpostcode 
from customers
where Country like 'united kingdom' 

-- using string functions in the where clause
select customername, 
	city + ', ' + country as 'City and Country', 
	len(customername) as 'Length' , 
	address, 
	CHARINDEX('sq',address)
from customers
where CHARINDEX('sq',address) >0 or CHARINDEX('str.',address) >0

select CustomerName, 
left (contactname,CHARINDEX(' ', ContactName)) as Firstname,  
SUBSTRING(contactname, charindex(' ',contactname),len(contactname)-charindex(' ',ContactName)) as lastnamw,
city, Country, postalcode, 
left(postalcode, CHARINDEX(' ',postalcode)) as firstpartofpostcode, 
right(postalcode, 4) as lastpartofpostcode, 
len(postalcode) as length 
from customers
where Country like 'united kingdom' 


-- using the string function in the group by, here we count customers per first letter of customernam
select left(customername,1), count(customerid)
from customers
group by left(customername,1)

