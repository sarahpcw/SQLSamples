create table ##prices2
(productid nvarchar(255),
productname nvarchar(255),
price float,
average float
)
drop table ##prices2

insert into ##prices2

select productid, productname, price, (select avg(price) from products)
--price -(select avg(price) from products)
from products


)
select ##prices2.productid, productname, price, average, price -average AS difference, Quantity
from ##prices2
inner join orderdetails on ##prices2.productid =orderdetails.productid

drop table #employees