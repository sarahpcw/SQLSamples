select day (getdate())
	, Month (getdate())
	, year(getdate())
	, datepart(yy,getdate())
	, datename(WEEKDAY,getdate())

-- calculate the retirement date
select 
firstname, lastname, birthdate, format (GETDATE(), 'dd,MMMM,yyy')
, ISDATE('2018/04/14')
, DATEADD(year, 66, birthdate) 'retirement date'
from employees
where DATEDIFF (yy, birthdate, getdate()) > 50

-- calculate the ages
select firstname, 
	lastname, 
	BirthDate, 
	datediff (year, '2016/12/18', getdate()) as age
from employees