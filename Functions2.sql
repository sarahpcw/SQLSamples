alter function vat (
@Price float
)
returns float
as
begin
	declare @vat float
	select @vat =  @price * 0.2
	from products
	return @vat
end

select ProductName, P_price, [dbo].[vat](P_price) as Vat
from products









 -- change the below for age
create function vat (
@Price float
)
returns float
as
begin
	declare @vat float
	select @vat =  P_price * 0.2
	from products
	return @vat
end
 Select  FirstName, datediff(year, bdate, getdate()), [dbo].[age3](bdate)
 from employees

 