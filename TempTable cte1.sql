with prices (productid, productname, price, average)
AS
(


select productid, productname, price, (select avg(price) from products)
--price -(select avg(price) from products)
from products


)
select prices.productid, productname, price, average, price -average AS difference, Quantity
from prices
inner join orderdetails on prices.productid =orderdetails.productid