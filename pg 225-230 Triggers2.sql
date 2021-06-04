alter trigger newT
on orders
for insert  -- here I can also say after insert or istead of insert ( if instead of, this trigger will run and not the actual query) 
as 
begin
declare @cid int
select @cid = customerID from inserted ;
if ( @cid > 90 )
	begin
		update orders
		set orderdate = dateadd(month, -(21-2*employeeid), getdate() )
		 
	end
end

insert into orders (orderid, customerid, shipperid, EmployeeID, orderdate) values (30007, 91, 3, 5, '2015-10-10') 

select  year(orderdate) , month(orderdate), count(orderID) from orders
 group by year(orderdate) , month(orderdate)
 order by year(orderdate) , month(orderdate)

