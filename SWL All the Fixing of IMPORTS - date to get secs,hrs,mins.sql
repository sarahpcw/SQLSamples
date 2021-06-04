 
update orders
set	 orderdate = dateadd(MILLISECOND, datepart(MILLISECOND, orderdate)+(orderid-10000)*rand() ,orderdate)

update orders
set	 orderdate = dateadd(SECOND, datepart(SECOND, orderdate) + ((orderid-10000)*rand())+datepart(day, orderdate)  ,orderdate)

update orders
set	 orderdate = dateadd(minute, datepart(MINUTE, orderdate) + ((orderid-10000)*rand())+(datepart(day, orderdate)-datepart(month, orderdate)) ,orderdate)

update orders
set	 orderdate = dateadd(hour, datepart(hour, orderdate) + ((orderid-10000)*rand())+((datepart(year, orderdate)-datepart(day, orderdate)))/ datepart(month, orderdate) ,orderdate)

 

 --	--datepart(MILLISECOND, orderdate) = 
	--datepart(MILLISECOND, orderdate)+(orderid-10000)*rand() as mils
	----,datepart(SECOND, orderdate)= 
	--,datepart(SECOND, orderdate) + ((orderid-10000)*rand())+datepart(day, orderdate)  as secs 
	----,datepart(MINUTE, orderdate) = 
	--,datepart(MINUTE, orderdate) + ((orderid-10000)*rand())+(datepart(day, orderdate)-datepart(month, orderdate))   as mins
	----,datepart(hour, orderdate) = 
	--,datepart(hour, orderdate) + ((orderid-10000)*rand())+((datepart(year, orderdate)-datepart(day, orderdate)))/ datepart(month, orderdate)  as hrs
 --into newT
 --from orders

 select *from orders


SELECT column_name(s)
INTO newtable [IN externaldb]
FROM table1;


update orders
set orderdate = newT.orderdate
from orders
join newT on orders.orderID = newT.orderID 