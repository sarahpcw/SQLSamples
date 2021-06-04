select categoryid, count ( productname ) as CountProducts
from products
where price is not null
group by categoryid
order by CategoryID

select supplierid, round(avg(price),0) as AvgPrice, count(productname) as CountProducts
from products
where price is not null
group by supplierid
order by supplierid

select productname, format ( sum ( price * quantity ) , '###,##0.00')  as Revenue
from products p 
join orderdetails od on p.ProductID = od.ProductID
group by productname
order by productname

select p.productid
, productname
, round ( sum ( price * quantity ) , 2 )  as Revenue
from products p 
join orderdetails od on p.ProductID = od.ProductID
group by p.productid, productname
order by productname

create view DateView2 as 
select orderid
, year ( orderdate ) as Orderyear
, datename ( month, orderdate ) as MonthName
, datename ( dw, orderdate ) as DayOfWeek
, datepart ( dw, orderdate ) as DayOfWeek_Number
, datepart ( day, orderdate ) as DayOfMonth
, format ( orderdate, 'dd-MMM-yyyy')  as Orderdate
, format ( orderdate, 'hh:mm')  as OrderTime
, format ( dateadd ( day, 30 , orderdate ), 'dd-MMM-yyyy') as PaymentDate
, datediff ( year , orderdate , getdate() ) as 'Years since order'
, datediff ( month , orderdate , getdate() ) as 'Months since order'
, datediff ( day , orderdate , getdate() ) as 'Days since order'
from orders

select * from dateview2
create view DateView as 
select year(orderdate) as Year 
, month(orderdate)  as Month
, sum ( price *  quantity ) as Revenue
from orders o
join orderdetails od on o.orderid = od.orderid
join products p on od.productid  = p.productid
group by year(orderdate) , month(orderdate)
--order by year(orderdate) , month(orderdate)  NB!! Order by not allowed in view

select * 
from dateview
order by year, month  
-- order by when USING the view, use the column names or aliases


create procedure ProductRevenue 
(@pid int) as
Begin  
	select p.productid
	, productname
	, round ( sum ( price * quantity ) , 2 )  as Revenue
	from products p 
	join orderdetails od on p.ProductID = od.ProductID
	where p.productid = @pid
	group by p.productid, productname
	order by productname
end

exec ProductRevenue 15 
-- when you created a view or stored procedure, first refresh your explorer
-- find it unders programmability on the explorer