insert into suppliers (SupplierID, suppliername, Country)
output 
		inserted.SupplierID as newID,
		inserted.SupplierName as newname,
		inserted.country as newcountry
values (31,'Ben', 'Brazil')

update suppliers
 set suppliername = 'x3'
 output 
		deleted.SupplierName as oldname,
		inserted.SupplierName as newname

 where SupplierID =30

 select * 
 from suppliers
 where SupplierID > 29


delete from suppliers 
output 
		deleted.SupplierID as newID,
		deleted.SupplierName as newname,
		deleted.country as newcountry
where SupplierID>29


select * from suppliers where supplierid > 29