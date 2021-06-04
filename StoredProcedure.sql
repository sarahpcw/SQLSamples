create function salesorder(
@orderid int
)
returns table
AS
Return
(


select orderid, productname,price, quantity
from products
join orderdetails on products.ProductID =orderdetails.ProductID
where orderid =@orderid
)

select * 
from salesorder(10248)

--store procedure
create procedure salesorder2(
@orderid int
)

AS
begin

select orderid, productname,price, quantity
from products
join orderdetails on products.ProductID =orderdetails.ProductID
where orderid =@orderid
end
execute salesorder2 10248
----------
create procedure salesorder3
AS
begin

select orderid, productname,price, quantity
from products
join orderdetails on products.ProductID =orderdetails.ProductID
end
execute salesorder3

------------------
alter procedure salesorder4
(
@productn nvarchar(255)
)
AS
begin

select orderid, productname,price, quantity
from products
join orderdetails on products.ProductID =orderdetails.ProductID
where productname like @productn
end

execute salesorder4 'b%'