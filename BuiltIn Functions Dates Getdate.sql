select orderid, 
	DATEPART (YEAR, orderdate) as years,
	format (OrderDate, 'dd MMM yyyy') as orderdate, 
	format(GETDATE(),'dd MMM yyyy') as getdate,
	DATEPART (hour, orderdate) as hour
from orders
where DATEPART (YEAR, orderdate) =1996
AND DATEPART (Month, orderdate) =7 
AND NOT DATEPART (hour, orderdate) BETWEEN 8 AND 17

order by years

-- date part returns int and datename nvarchar
select day(getdate()) as dayNr
	, month(getdate()) as month
	, year(getdate()) as year
	, datename(weekday, getdate()) as DateNameWeekday 
	, datepart(M, getdate()) as datepartM
	, datepart(weekday, getdate()) as DatePartWeekday 
	, datename(month, getdate()) as DateNameMonth

select getdate() as today
	, datepart(qq, getdate()) as DatePartQuarter
	, datepart(dy, getdate()) as datepartDayOfYear
	, datepart(wk, getdate()) as DatePartWeekOfYear
	, datepart(hh, getdate()) as DatePartHour
	, datepart(mm, getdate()) as DatePartMinute
	, datepart(ss, getdate()) as DatePartSecond

select ( format ( DATEFROMPARTS (2019,08,03), 'MMM-dd-yyyy'))