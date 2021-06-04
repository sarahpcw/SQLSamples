update customers
	set Country = 'UK'
	where country = 'united kingdom'
	
UPDATE orders
	set orderdate = '2018-12-01'
	from orders
	join customers on orders.customerid = customers.customerid		 

update customers
	 set country = 'united states'
	 output 
			deleted.country  as oldcoutry,
			inserted.country as newcountry
	 where country = 'USA '

merge customers destination
	using suppliers source
		on destination.country = source.country
		when matched then
		update
		set destination.country = source.country,
			destination.city = source.city
		when not matched by target then
		insert (customerid, customername, contactname, address)
		values (source.supplierid ,source.suppliername, source.contactname, source.address);

	
use db1;
merge suppliers destination
using northwind.[dbo].[suppliers] source
on destination.suppliername =source.companyname
when matched then
update
set destination.suppliername =source.companyname,
destination.contactname =source.contactname,
destination.address =source.address
when not matched by target then
insert (supplierid, suppliername, contactname, address)
values(supplierid +300,source.companyname, source.contactname, source.address);
