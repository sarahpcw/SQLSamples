--This function returns 
--the context_info value 
--either set for the current session or batch, 
--or derived through use of the SET CONTEXT_INFO statement.
--If context_info was not set:
--In SQL Server returns NULL.
--In SQL Database returns a unique session-specific GUID.

declare @myValue as varbinary(128) = cast ( 'us-english' as varbinary(128) )
set CONTEXT_INFO @myValue
select cast ( CONTEXT_INFO() as varchar(128) ) as value

declare @myValue1 as varbinary(128) = cast ( '123' as varbinary(128) )
set CONTEXT_INFO @myValue1
select cast ( CONTEXT_INFO() as varchar(128) ) as value

declare @myValue2 as int = cast ( '23445646' as int )
set CONTEXT_INFO @myValue2
select cast ( CONTEXT_INFO() as varchar(128) ) as value

-- after 2016 use session info
declare @myValue16 as varbinary(128) = cast ( '123' as varbinary(128) )
set  SESSION_CONTEXT()  @myValue16
select cast (   SESSION_CONTEXT() as varchar(128) ) as value