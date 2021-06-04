 --Coordinated Universal Time (abbreviated to UTC) is the primary time standard by 
 --which the world regulates clocks and time. It is within about 1 second of 
 --mean solar time at 0° longitude,[1] and is not adjusted for daylight saving time. 
 --In some countries where English is spoken, the term Greenwich Mean Time (GMT) 
 --is often used as a synonym for UTC and predates UTC by nearly 300 years.[2] 

select getdate () as 'getdate'			-- 3 fractional seconds, this is of data type datetime ,ie more precise - HH: mm: ss.3 after the seconds 
	, sysdatetime () as 'sysdatetime'	-- 7 fractional seconds, this is of data type datetime2 ,ie more precise - HH: mm: ss.7 after the seconds 
	, sysdatetimeoffset () as 'sysdatetime offset'	-- even more prcise
	
select getdate () as 'getdate'			--  MS SErver specific
	, current_timestamp as 'curr time'	--  standard

select getutcdate() as GMT_withoutdaylightsaving
, SYSUTCDATETIME() as GMT_withoutdaylightsaving_moreprcision
, getdate() as Convertedlocaltime
, sysdatetime () as 'Convertedlocaltime more prcision'



select eomonth ( getdate() )  as 'last day of the month'



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

select datefromparts(1972,05,26) as date_FromParts
	, datetime2fromparts(1972,05,26,7,14,16,10,3) as datetime2_FromParts -- yy,MM,dd,hh,mm,ss, ms, smaller than ms
	, datetimefromparts(1972,05,26,7,14,16,10) as datetime_FromParts -- yy,MM,dd,hh,mm,ss, ms
	, datetimeoffsetfromparts(1972,05,26,7,14,16,10,12,0,3) as datetimeOffset_FromParts -- yy,MM,dd,hh(7),mm(14),ss(16), ms(10) and smaller
	, smalldatetimefromparts(1972,05,26,7,14) as smalldatetime_FromParts -- yy,MM,dd,hh(7),mm(14) 
	, timefromparts(7,14,16,10,3) as time_FromParts -- hh(7),mm(14),ss(16), ms(10) and precision r(3)

--DATETIMEOFFSETFROMPARTS ( year, month, day, hour, minute, seconds, fractions, hour_offset, minute_offset, precision )
--Where:
--The first 7 arguments are integer expressions specifying that particular date/time part.
--The hour_offset argument is an integer expression specifying the hour portion of the time zone offset.
--The minute_offset is an integer expression specifying the minute portion of the time zone offset.
--The precision argument is an integer literal specifying the precision of the datetimeoffset value to be returned.
--Example
--Here’s an example of usage.
--SELECT DATETIMEOFFSETFROMPARTS( 2021, 05, 10, 23, 35, 29, 500, 12, 30, 4 ) 
--AS Result;
--Result
------------------------------------
--2021-05-10 23:35:29.0500 +12:


select datediff(dd,getdate(),'2019-12-31') as DayUntilNewYearsEve
	,dateadd(y,1,getdate()) as NewDateOneYearFromNow
	,EOMonth(getdate()) as LastDateOfTheMonth
	,EOMonth('2018-09-22') as LastDateOfTheMonth
	, isdate(getdate()) as CheckForValidDate -- returns 1 for valid and 0 for not valid
	, isdate('13/1/2018') as CheckForValidDate

-- cast dates and numbers 
-- cast changes data to a different datatype of the same datatype , eg a float to decimal or date to datetime
-- you can use date , time, real ,float, money, xml and binary
select  
	 [ProductID]
	 , [Name] Productname
	,  [SellStartDate]
	, cast ( [SellStartDate] as date) as SellStartDateCast
from  [Production].[Product]
where [SellStartDate] is not null

select 
	[Name] productname
	, [ListPrice] price
	, cast (listprice as decimal(10,2)) as PriceCast
from [Production].[Product]


-- convert - gives more flexibility than cast 
select 
	convert(varchar(20), getdate()) as 'default'
	,convert(varchar(20), getdate(), 100) as 'default_WithStyle'
	,convert(varchar(10), getdate(), 103) as 'British French'
	,convert(varchar(8), getdate(), 105) as 'Italian'
	,convert(varchar(8), getdate(), 112) as 'ISO Style'
	,convert(varchar(15), cast('111111.22' as money), 1) as 'Money With Commas'
	

-- parse: string to either date/time or number
-- Try_cast extends cast 
-- Try_convert extends convert
-- the try versions will not result in an error but returns a 0 if the conversion failed

select 
	TRY_cast('patrick ' as INT) as Trycast -- try cast in 2012 
	, TRY_convert (varchar(20), '31/12/2999', 112) as TryConvert
	, convert (varchar(8), getdate(), 105) as 'Convert1'
	, convert (varchar(8), '31/12/2999', 105) as 'Convert2'
	, parse('Saturday, 26 May 2012' as datetime using 'en-Us') as 'parse'
	, try_parse('Patrick birthday' as datetime using 'en-Us') as 'try parse'
--	, parse('Patrick birthday' as datetime using 'en-Us') as 'parse'

select 
	'12/'+ cast (1 as varchar) + '/2018'  -- all the parts must be of the same data type , so cast the 1
	, concat ('12/',1,'/2018')  -- te parts could be of different datatypes

select 
	[EmailPromotion]
	, concat([MiddleName], ' ', [LastName]) FullName
	, choose ( [EmailPromotion], 'flowers', 'chocolates', 'books') as 'choose'
	, iif ([EmailPromotion] = 1, 'flowers', 'something else') as ' iif'
	, case [EmailPromotion]
		when 1 then 'flowers'
		when 2 then 'chocolates'
		else  'books'
	  end as 'case'
from  [Person].[Person] p
join [Person].[EmailAddress] pe on p.[BusinessEntityID] = pe.[BusinessEntityID] 
where [EmailPromotion] in (0,1,2)
order by  [EmailPromotion]


select 
  substring ('bambi', 0,5), -- substring of bambi from position 0 to 4
  substring ('bambi', 0, len('bambi')),
  substring ('bambi', 0, len('bambi')+1),
		len('bambi')