create table y ( id int identity(1,1), name nvarchar(10))
insert into y values ('alpha')
select @@IDENTITY  --shows the last idenity used
set identity_insert dbo.y on  -- use explicit insert
insert into y (id,name) values (200, 'alpha')
set identity_insert dbo.y off -- turn explicit insert off
insert into y values ('alpha')

select productname , price, price * 0.05 from products where productname like 'a%'
update  products 
set price += price * 0.05
where productname like 'a%'
select productname , price, price * 0.05 from products where productname like 'a%'

select productname , price, price * 0.05 from products where productname like 'a%'
update  products 
set price -= price * 0.05
where productname like 'a%'
select productname , price, price * 0.05 from products where productname like 'a%'

