declare @empl int 
set @empl = 4
select @empl = count( firstname ) from employees
select @empl
select 'Here' as ColOne, employeeid , concat(firstname, ' ' , lastname)   as FullName
from employees
where employeeid < (@empl-6)

DECLARE @RowCount int
BEGIN TRY
    SELECT TOP 10 * FROM employees
    SET @RowCount = @@ROWCOUNT
    SELECT @@ROWCOUNT
END TRY
BEGIN CATCH
    SELECT TOP 5 * FROM sys.objects
    SET @RowCount = @@ROWCOUNT
END CATCH

DECLARE @RowCount int
BEGIN  
    SELECT TOP 10 * FROM employees
    SET @RowCount = @@ROWCOUNT
    SELECT @@ROWCOUNT 'rc1', @RowCount 'rc2'
END  
--SELECT @RowCount 'rc2'
if @RowCount < 11
	select * from employees where EmployeeID = 3

-- row count loses its value, so do in a begin end block and transfer the value to a variable


