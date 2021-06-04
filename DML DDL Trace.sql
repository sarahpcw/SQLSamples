--use master
--DECLARE @RC int, @TraceID int, @on BIT 
--set @TraceID=1
--EXEC @rc = sp_trace_create @TraceID output, 0, N'C:\Users\u\Desktop\SampleTrace'  
--exec [sys].[sp_trace_getdata] @TraceID, 10 

--EXEC sp_trace_setevent @TraceID, 10, 1, @on 

select * 
from [AdventureWorks2014].humanresources.department
where name like 'mar%'
or name like 'sales%'
or ModifiedDate between '2008-01-01' and '2008-12-31'