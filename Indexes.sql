drop index  [I_name] on [dbo].[categories]

create index I_CatName on categories (categoryName)

create unique index I_CustName on [dbo].customers (customername) 
-- customers table

create clustered index I_Eid on [dbo].[orders] (Employeeid)  
-- clustered index: can only have 1 
--, therefor if there is a PK, 
--then you will not also make a clustered index 

create unique clustered index I_Eid on [dbo].[orders] (Employeeid)  


drop index I_CID  on orders

drop index  I_Cid on [dbo].[categories]

drop index  I_CustName on customers


ALTER TABLE  [dbo].[categories]
ADD CONSTRAINT UN_catname -- constraint name 
unique (categoryname)
-- unique constraint shows under indexes and keys, but not under constraints