Merge into shipper5  t1
using(select * from shippers)   t2
   on t1.shipperid =t2.shipperid 
when matched then 
   update set 
   t1.phone  = t2.phone
when not matched then 
   insert values(t2.shipperid,t2.CompanyName,t2.phone ) ;


alter trigger Trigger_Orders
on orders
for insert 
as
begin
	declare @moddate datetime;
	select @moddate = orderdate from inserted;
	if ( datediff ( day , @moddate , getdate()+1 ) > 1) 
		begin
			UPDATE ORDERS SET ORDERDATE = GETDATE() 
			WHERE OrderId <10000
		end
end

insert into orders (orderid, customerid, shipvia, employeeid, orderdate)
values (2997, 'Vinet', 3,5,'2019-01-01') 

insert into orders (orderid, customerid, shipvia, employeeid, orderdate)
values (30023, 'HANAR', 3,5,'2019-01-01') 

select *, datediff ( day , orderdate , getdate() ) 
 from orders where shipvia = 'Vinet'




select * from shippers
select * from shipper5
