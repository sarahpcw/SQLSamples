alter trigger hrCheckModifyDate 
on orders
after insert  
-- after insert 
-- before insert 
-- for insert ( this trigger will run and not the actual query) 
as 
begin
declare @modifydate datetime
select @modifydate = orderdate from inserted ;
if ( datediff(day, @modifydate, getdate() ) =1 )
	begin
		update orders
		set orderdate =  @modifydate +3
		where orderdate = @modifydate
	end
end

insert into orders (orderid, customerid, shipperid, EmployeeID, orderdate) values (30002, 90, 3, 5, '2020-12-15') 

select * from orders where CustomerID = 90  -- 10248

select datediff(day, '2020-12-14', getdate() ) 
--disable trigger
--enable trigger
--drop trigger hrCheckModifyDate


