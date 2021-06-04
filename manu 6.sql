insert into products (productid, productname, categoryid, price)
select productid, productname, categoryid, price from q.dbo.products
where productid > 10
and categoryid = 1

select * from Billing.dbo.products

bulk insert categories
from 'C:\Users\u\Documents\shipperinfo.txt'
with
(fieldterminator = ',',
rowterminator = ';')

select * from categories