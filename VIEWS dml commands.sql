--IMPORTANT!! 
--You cannot delete a row if the view references more 
-- than one base table. 
--You can only update columns that belong to a single base table


ALTER view [dbo].[view2] as 
select productname, country, price,  price / 2 as halfprice 
from products p
join suppliers s on p.SupplierID = s.SupplierID
GO
select * from view2


-- update, insert, delete cannot be in the view
-- but, you can update etc using the view
-- valid
update view2
set country = 'uk'
	from view2  
	where price < 22
	or country = 'united kingdom'

-- valid
update view2
set price = 12
	from view2  
	where price < 22
	or country = 'united kingdom'

-- not valid
update view2
set price = 12, country = 'uk'
	from view2  
	where price < 22
	or country = 'united kingdom'


select * from view2 order by price 
