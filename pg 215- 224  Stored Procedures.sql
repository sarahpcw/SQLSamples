Create procedure PO_Info 
as 
begin 
	select  od.orderid, orderdate, productname, od.[UnitPrice], [Quantity], od.[UnitPrice]* [Quantity] as amount_due 
	from [dbo].[Order Details] od
	join orders o on od.OrderID = o.OrderID
	join products p on od.ProductID = p.ProductID
end

exec PO_Info 

-- change the column names and data types for the output: 
exec PO_Info  with result sets ( 
 ( oid int , orderdate datetime, productname nvarchar(255), price float, [Quantity] float,  amount_due float )
 )

 -- with output parameter
 create procedure sampleoutput 
 	@parameter int  output
 as begin
 select  @parameter = 10 end


 declare @para int
 exec sampleoutput  @para output
 select @para

 
 drop procedure sampleoutput 


Create procedure PO_Info2
(
@eid int,
@orderyear int = 1996
)
as begin 
	select  od.orderid, orderdate, productname, od.[UnitPrice], [Quantity], od.[UnitPrice]* [Quantity] as amount_due 
	from [dbo].[Order Details] od
	join orders o on od.OrderID = o.OrderID
	join products p on od.ProductID = p.ProductID
	join Employees e on o.EmployeeID = e.EmployeeID
	where e.EmployeeID = @eid
	and year(OrderDate) = @orderyear
end

exec PO_Info2 1, 1997
exec PO_Info2 1
exec PO_Info2 @eid=1, @orderyear=1997


