-- convert a date to a string
select convert( varchar , getdate(), 101 ) as dates101
, convert( varchar , getdate(), 103 ) as dates103
, convert( varchar , getdate(), 104 ) as dates104
, convert( varchar , getdate(), 105 ) as dates105
, CONVERT( nvarchar(255), [OrderDate] , 109) from orders

-- output is in date format , converts string to date
select convert( date , '01/01/2019', 103 ) as dates101
, convert(date , '01/01/2019', 103 ) as dates103
, convert( date , '01/01/2019', 104 ) as dates104
, convert( date , '01/01/2019', 105 ) as dates105
-- 
-- cast vs convert : standard vs version specific
-- parse and cast vs convert: Parse and cast more user friendly to understand  
select parse('Saturday, 26 May 2012' as datetime using 'en-Us') as 'parse'
, try_parse('Saturday, 26 Ma 2012' as datetime using 'en-Us') as 'try parse'
, cast( [OrderDate] as nvarchar(255)) as Odate from orders

select --DAYNAME()  --Returns the name of the weekday
DAtename(month, getdate())  --Returns the day of the month (1-31)
,  WEEKDAY('1998-02-03 22:23:00');

