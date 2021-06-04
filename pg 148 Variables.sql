--RESTORE DATABASE MyDatabase FROM DISK='c:\backups\MyDataBase1.bak'

declare @catname nvarchar(20) = '%lager%'

select  categoryname, productname  , unitprice

from products 
join categories on products.CategoryID  = categories.CategoryID

where CategoryName like @catname
or productname  like @catname
or description like @catname