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