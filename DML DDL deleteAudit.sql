--create table suppliers_Audit
--(
--supplierid int not null, 
--suppliername nvarchar(50),
--deleteddate datetime not null
--constraint datedeleted default(getdate())

--)
delete from suppliers
output deleted.SupplierID, deleted.SupplierName, getdate()
into suppliers_Audit(supplierid, suppliername, deleteddate)
where SupplierID >301
select * from suppliers_audit