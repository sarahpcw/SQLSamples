create table #prices
(productid nvarchar(255),
productname nvarchar(255),
price float,
average float
)
drop table #prices

insert into #prices

select productid, productname, price, (select avg(price) from products)
--price -(select avg(price) from products)
from products


)
select #prices.productid, productname, price, average, price -average AS difference, Quantity
from #prices
inner join orderdetails on #prices.productid =orderdetails.productid