declare @beverages AS table
 (supplierName nvarchar(255),
  orderdate datetime,
  orderid Int,
  productname nvarchar(255),
  price float,
  quantity float,
  Suppliercountry nvarchar(255),
  customersCountry nvarchar(255),
  year int, 
  month int, 
  day int, 
  monthname varchar(20)
 )


insert into @beverages
select supplierName, orderdate, orders.OrderID, productname, price, quantity, suppliers.Country,customers.Country,
year(orderdate), month (OrderDate),
day(orderdate), datename (month, OrderDate)
from products
join orderdetails on products.ProductID =orderdetails.ProductID
join orders on orderdetails.orderID =orders.orderID
join customers on orders.customerID =customers.customerID
join suppliers on products.supplierID=suppliers.supplierID


SELECT year, productname, sum(quantity)
FROM @beverages
where Suppliercountry ='brazil' or Suppliercountry ='germany'
group by year, productname
order by year desc, productname