-- simple delete
delete from suppliers 
where country ='UK';

-- delete with output ( shows what is deleted while deleting )
delete from suppliers
	output deleted.SupplierID, deleted.Country
where country ='UK';

-- delete with join ( referencing multiple tables ) 
delete 
from products
from products
join suppliers on products.supplierid = suppliers.supplierid
where country ='UK';

-- delete with output and  with join  
delete 
from products
	output deleted.SupplierID, deleted.ProductID
from products
join suppliers on products.supplierid = suppliers.supplierid
where country ='UK';

create table suppliers_Audit
(
supplierid int not null, 
suppliername nvarchar(50),
deleteddate datetime not null
constraint datedeleted default(getdate())
)

-- while deleting , insert deleted records into an audit table, using today's date as the deletion date in the audit table
delete from suppliers
	output deleted.SupplierID, deleted.SupplierName, getdate()
	into   suppliers_Audit(supplierid, suppliername, deleteddate)
	where  SupplierID > 3 
	select * from suppliers_audit



drop table orders;

truncate table newemployees;


