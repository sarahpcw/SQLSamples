create function total (
@price float, @Quantity float

)
returns float
AS
BEGIN

Declare @total float

select @total =@price * @Quantity

return @total
end
---from products
--join orderdetails on products.ProductID =orderdetails.ProductID
---order by ProductName

select productname, price, quantity,dbo.total (price, quantity)
from products
join orderdetails on products.ProductID =orderdetails.ProductID
order by ProductName

select productname, sum(dbo.total (price, quantity))
from products
join orderdetails on products.ProductID =orderdetails.ProductID
group by ProductName
order by ProductName

declare @birthdate float;
execute @birthdate = dbo.getage  @birthdate='1990-01-01' ;
select @birthdate


declare @price float;
declare @quantity float;
execute @quantity = dbo.total  @price=20, @quantity=2;
select @quantity