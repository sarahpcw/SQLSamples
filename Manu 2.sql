select top 5 employees.LastName,employees.firstname CategoryName, sum(orderdetails.Quantity) Total
from orders
Inner join employees on orders.EmployeeID=employees.EmployeeID
inner join orderdetails on orders.orderid=orderdetails.OrderID
inner join  products on orderdetails.productid=products.ProductID
inner join categories on products.categoryid=Categories.categoryid 
where CategoryName = 'Beverages'
group by employees.LastName,employees.firstname, categories.CategoryName
order by Total desc