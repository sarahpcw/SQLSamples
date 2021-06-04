
select top 5 * 
from [order details] 
order by unitprice desc


select * 
from [order details]
order by unitprice desc
offset 2 rows  -- skip 2 rows
fetch next 2 rows only  -- gives the next 2