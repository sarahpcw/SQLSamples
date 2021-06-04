create function average (
 
)
returns float
as
begin
	declare @avg float
	select @avg  =  avg(P_price)
	from products
	return @avg 
end

select ProductName, P_price, [dbo].[vat](P_price) as Vat, [dbo].[average]() as Average
from products