
update suppliers
 set suppliername = 'x3'
 output 
 deleted.SupplierName as oldname,
inserted.SupplierName as newname
 where SupplierID =303