-- 
-- select Productname, Price, averageprice , difference
-- where price > averageprice

select productname
	, price 
	, format ( (select avg(price) from products ) , '#,##0.00' ) as average
	, format ( price - ( select avg(price) from products ) , '#,##0.00' ) as difference
from products
where price > 
	( select avg(price) from products
	 ) 

--create function func4 ()
declare @var1 float = (select avg(price) from products )
select productname
	, price 
	,  @var1 as average
	,  price - @var1  as difference
from products
where price > @var1


create function func4 ()
returns float
as begin 
	declare @a as float =1
	select @a = avg(price) 
	from products
return @a
end 


select  price , dbo.func4(), price - dbo.func4()
from products where price > dbo.func4()


declare @a as float = dbo.func4()
select  price , @a, price - @a
from products where price > @a


create function func1 
( @v1 int )
returns float
as begin
	declare @var float = 0
	select @var  = max(price) 
	from products
	where supplierid = @v1
return @var
end

declare @var1 int = 2
select dbo.func1 (@var1), price  , productname
from products
where supplierid = @var1