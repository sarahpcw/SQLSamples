--page 30 
-- order by using numbers for column names
select   Title, TitleOfCourtesy, Firstname, Lastname 
from employees
order by 1, 2, 4

-- pg  33 
-- order by  NULL first or Nulls last ( supported by t-sql but not supported by sql ) 
select firstname, lastname , country , region , city
from employees
-- ORDER BY region NULLS LAST 
-- ORDER BY region NULLS First 

-- sort nulls to the top: 
select firstname, lastname , country , region , city
from employees

-- sort nulls to the bottom: 
select firstname, lastname , country , region , city
from employees
order by isnull(region, 'zzz')  

-- page 35
-- order by null values - unpredicatable in random order because null values are actually unknown
select top (10 ) region, employeeid, firstname, lastname  
from employees
order by region,  (select null)  
-- if the region is null, 
-- the rows might return in a different order every time, 
-- because soring on null in unpreditacble
-- the above example re-emphasis this 
-- and specifies that random order of result is not by oversight