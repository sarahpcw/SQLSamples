-- coalesce
-- isnull
-- nullif
-- choose
-- iif

-- coalesce, isnull
declare @Null as varchar(3) = Null
declare @Charaters as varchar(10) = '0123456789'
select @null as 'n'
	, @Charaters as 'c'
	, isnull(@Null, @Charaters) as '1' -- isnull uses datatype of first parameter, i.e. @Null which is string of length 3
	, coalesce(@Null, @Charaters) as '2' -- isnull uses datatype of second parameter, i.e. @Charaters which is string of length 10

-- nullif: returns null if 2 values are the same
select NULLIF(1, 1)as NumbersSame, nullif('a','a')as TextSame
select 
	p.[UnitPrice] as ProductPrice
	,od.[UnitPrice] as SalesPrice
	, NULLIF( p.[UnitPrice],od.[UnitPrice]  ) as TextSame
from [dbo].[Products] p
join [dbo].[Order Details] od 
on p.[ProductID] = od.[ProductID]
-- choose
select 
	p.[UnitPrice] as ProductPrice
	,od.[UnitPrice] as SalesPrice
	, case
		when   p.[UnitPrice]= od.[UnitPrice] then  'same'
		else 'different'  
	  end  as TextSame
from [dbo].[Products] p
join [dbo].[Order Details] od 
on p.[ProductID] = od.[ProductID]

-- iif
select 
	p.[UnitPrice] as ProductPrice
	,od.[UnitPrice] as SalesPrice
	, iif ( p.[UnitPrice]= od.[UnitPrice], 'same','different'  ) as TextSame
from [dbo].[Products] p
join [dbo].[Order Details] od 
on p.[ProductID] = od.[ProductID]
