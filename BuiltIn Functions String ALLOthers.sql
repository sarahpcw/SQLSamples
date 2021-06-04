
use [Northwind]
select DATALENGTH('a')  a
	, DATALENGTH('abc') abc
	, DATALENGTH('apple') apple
	, DATALENGTH('cat') cat
	, DATALENGTH('house') house
	, datalength ( Firstname ) fn
	, firstname
from employees

--Returns the ASCII code value of the 
--leftmost character of a character expression.

select ascii('a') a
	,  ascii('b') b
	,  ascii('c') c
	,  ascii('d') d
	,  ascii('e') e
	,  ascii('eat') eat


SELECT firstname 
	, left(firstname,1) as 'first letter of firstname'
	,  ASCII(left(firstname,1)) 'ascii of the firstletter of firstname'
	,  ASCII(firstname) 'ascii of the firstname'
    ,  CHAR(ASCII(firstname )) 'char of ascii of firstname '
	,  nCHAR(ASCII(firstname )) 'nchar (unicode) of ascii of firstname'
from employees
-- SELECT NCHAR(143743);   Returns the Unicode character with the specified integer code, as defined by the Unicode st

DECLARE @nstring nchar(12);  
SET @nstring = N'Åkergatan 24';  
SELECT UNICODE(@nstring)
, NCHAR(UNICODE(@nstring))
, ascii(@nstring)
, NCHAR(ascii(@nstring));  

SELECT firstname 
	, lastname
	,  concat ( firstname, lastname, city ) 
	,  concat_ws (',', firstname, lastname, city ) -- (specifies separator) not available in 2014
from employees

-- Returns the starting position of the first occurrence
-- of a pattern in a specified expression, or zeros if 
-- the pattern is not found, on all valid text and character
-- data types.
SELECT PATINDEX('%dumb%', 'dumb and dumber') as'position of dumb' 
	, PATINDEX('%and%', 'dumb and dumber') as'position of and' 
	, PATINDEX('%dumber%', 'dumb and dumber')as 'position of dumber' 


SELECT QUOTENAME('abc def')   
, QUOTENAME('This text is sysname.','}') AS Result1   
, QUOTENAME('This text is sysname.','>') AS Result2   
, QUOTENAME('This text is sysname.',']') AS Result3  
, QUOTENAME('This text is sysname.','"') AS Result4   
, QUOTENAME('This text is sysname.',')') AS Result5;   

select REPLICATE ( 'Hello ' , 2)

SELECT FirstName, REVERSE(FirstName) AS Reverse  
FROM employees  
 
--Returns character data converted from numeric data.
SELECT STR(123.45, 6 , 1)  as '6 long'
, STR(123.45, 20, 1)  as '20 long'
, STR(123.45, 7, 1) as '7 long'

SELECT STR(123.45, 8 , 0)  as '0 decimal'
, STR(123.45, 8, 1)  as '1 decimal'
, STR(123.45, 8, 2) as '2 decimal'

-- string_agg not in 2014
SELECT STRING_AGG (FirstName, CHAR(13)) AS csv 
FROM employees;

-- not in 2014
select STRING_SPLIT ( 'dumb and dumber' , ' ' )  
select STRING_SPLIT ( 'dumb-and-dumber' , '-' )  

SELECT STUFF('abcdef', 2, 3, '-ijklmn');  
-- 2 refers to b and 3 refers to cde 
GO  

SELECT STUFF('dumb dumber', 5, 1, ' and ');  -- start at 5 and replace only 1 character
-- 2 refers to b and 3 refers to cde 
GO  

--translate on in 2014
SELECT TRANSLATE('dumb and dumber','dumb','cool') AS Translated 
SELECT replace('dumb and dumber','dumb','cool') AS replaced 

