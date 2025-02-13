-- compress characters to binary characters

-- compress 2016 upwords 
declare @notes nvarchar(max) = 'iwuoweu'
insert into Employees(employeeid, firstname, lastname, notes)
	values ( 22, 'John','Smith',compress(@notes) ) 

-- compress 2016 upwords 
select employeeid
	, firstname
	, lastname
	, CAST ( DECOMPRESS ( notes ) AS nvarchar(max) ) as notes  
from employees

-- context info is a binary string associated with your session (one variable only)
declare @contextinfo as varbinary(128) = cast ( 'uk_english' as varbinary(128) )
set context_Info @contextinfo 
select cast ( context_Info() as varchar(128) ) as mycontextinfo
select  context_Info() as mycontextinfo

-- 2016 upwards this creates a session variable, but you could have may, in key value pairs
exec sys.sp_set_session_context 
	@key=N'language',@value='us_english',@read_only=1;

alter table products 
add  discontinued uniqueidentifier 
alter table products
add constraint def_discontinued
default NEWSEQUENTIALID() FOR discontinued

INSERT INTO PRODUCTS (ProductID, PRODUCTNAME, supplierid, categoryId) 
VALUES ( 701, 'prodct', 1 ,1) 
select @@IDENTITY
select * from products
select NEWID() as myguid
--select NEWSEQUENTIALID() as myguid


select SCOPE_IDENTITY()
--SCOPE_IDENTITY returns the last IDENTITY 
--value inserted into an IDENTITY column in the same scope

--The @@IDENTITY is a system function that returns the
-- last IDENTITY value generated for any table with
-- an identity column under the current session, regardless of the 
--scope of the T-SQL statement that generated the value.

--Creates a GUID that is greater than any GUID 
--previously generated by this function on a specified 
--computer since Windows was started. After restarting Windows, 
--the GUID can start again from a lower range, but is still globally 
--unique. When a GUID column is used as a row identifier, 
--using NEWSEQUENTIALID can be faster than using the NEWID function. 
--This is because the NEWID function causes random activity and 
--uses fewer cached data pages. Using NEWSEQUENTIALID 
--also helps to completely fill the data and index pages


--The NEWID() function in SQL Server creates a unique
--value of type uniqueidentifier. One use of the NEWID() 
--function is in generating random rows from a table.

--Generally Uniqueidentifier is a 36 bit alphanumeric unique 
--Value that will not be duplicated. Its syntax 
--is XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX. It is a data 
--type in SQLServer & it will be mostly used as Primary Key. 
--Uniqueidentifier is a 16-byte binary 
--values that operates as globally unique identifiers (GUIDs

--The globally unique identifier (GUID) data type in SQL Server 
--is represented by the uniqueidentifier data type, 
--which stores a 16-byte binary value. A GUID is a binary number, 
--and its main use is as an identifier that must be unique in a 
--network that has many computers at many sites.

create table y ( id int identity(1,1), name nvarchar(10))
insert into y values ('alpha')
select @@IDENTITY  --shows the last idenity used


