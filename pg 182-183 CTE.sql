with beverages (
		supplierName, orderdate, orderid
		, productname, price, quantity, Suppliercountry
		, customersCountry, yearC, monthC, dayC, monthnameC )
AS
(
	select supplierName, orderdate, orders.OrderID, productname, price, quantity, suppliers.Country, customers.Country,
	year(orderdate), month (OrderDate),
	day(orderdate), datename (month, OrderDate)
	from products
	join orderdetails on products.ProductID = orderdetails.ProductID
	join orders on orderdetails.orderID = orders.orderID
	join customers on orders.customerID = customers.customerID
	join suppliers on products.supplierID = suppliers.supplierID
)
SELECT yearC, productname, sum(quantity)
FROM beverages
where Suppliercountry ='brazil' or Suppliercountry ='germany'
group by yearC, productname
order by yearC desc, productname