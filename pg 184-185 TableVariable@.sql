-- the table variable is valid for the batch only ( a few commands run with one execute / f5 )

declare @prices3 as table
(productid nvarchar(255),
productname nvarchar(255),
price float,
average float
)


insert into @prices3
select productid, productname, price, (select avg(price) from products)
--price -(select avg(price) from products)
from products

select *
from @prices3

select *
from @prices3
where price > 90
 