alter procedure proc2
(
	@var1 int,
	@var2 nvarchar(255)  output
)
as
begin
	select @var2 = firstname 
	from employees 
	where EmployeeID = @var1
end

declare @eid as int =1
declare @var2  nvarchar(255) 
exec proc1 @eid, @var2 
select @eid, @var2

alter PROCEDURE View3 (
     @eID INT ,
	 @name nvarchar(50) output
   )
AS  
BEGIN  
   SELECT @name = firstname
   FROM employees
   WHERE EmployeeID = @eID 
END

declare @eid int = 3
declare @var2 nvarchar(50) 
exec View3 @eid, @var2 output
select @eid, @var2