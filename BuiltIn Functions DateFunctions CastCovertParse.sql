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


-- convert - gives more flexibility than cast 
select 
	convert(varchar(20), getdate()) as 'default'
	,convert(varchar(20), getdate(), 100) as 'default_WithStyle'
	,convert(varchar(10), getdate(), 103) as 'British French'
	,convert(varchar(8), getdate(), 105) as 'Italian'
	,convert(varchar(8), getdate(), 112) as 'ISO Style'
	,convert(varchar(15), cast('111111.22' as money), 1) as 'Money With Commas'
