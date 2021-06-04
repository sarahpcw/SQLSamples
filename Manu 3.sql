alter procedure Empnames

(
@eid int,
@lname nvarchar (255)
)
as
begin
select firstname, lastname, employeeid from employees
where employeeid = @eid
or lastname like @lname
end

execute Empnames 2, 'd%'


Alter procedure Manu3
(
@fname nvarchar (255),
@lname nvarchar (255),
@cname nvarchar (255)
)
as
begin
select employees.EmployeeID,employees.FirstName,employees.LastName,categories.CategoryName,products.ProductName,orders.OrderID,orders.OrderDate,orderdetails.Quantity
from orders
inner join employees on orders.EmployeeID=employees.EmployeeID
inner join orderdetails on orders.OrderID=orderdetails.OrderID
inner join products on orderdetails.ProductID=products.ProductID
inner join categories on products.CategoryID=categories.CategoryID
where FirstName like @fname
and Lastname like @lname 
and categoryname like @cname
end

exec Manu3 'm%', 's%', 'p%'