create function age2 (

@birthdate datetime

)
returns int
as
begin
	declare @age int
	select @age = datediff(year, @birthdate, getdate()) 
	from employees
	return @age
end

 


 create function getage
(
@birthdate datetime
)
returns int
AS
BEGIN
Declare @age int
Select @age =datediff(day,@birthdate, getdate())
Return @Age
end

select * , getage(bdate) 
from employees

select * 
from getage(bdate)

 
