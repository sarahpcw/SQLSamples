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

