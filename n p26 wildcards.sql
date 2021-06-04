--Wildcard Characters in SQL Server
--Symbol
--Description
--Example
--%
--Represents zero or more characters
--bl% finds bl, black, blue, and blob
--_
--Represents a single character
--h_t finds hot, hat, and hit

--[]
--Represents any single character within the brackets
--h[oa]t finds hot and hat, but not hit

--^
--Represents any character not in the brackets
--h[^oa]t finds hit, but not hot and hat

---
--Represents a range of characters
--c[a-b]t finds cat and cbt
 
 
select * 
from employees
where FirstName like 'm%'  -- margaret and michael

select * 
from employees
where FirstName like 'm[^a]%'   -- anything but an a after the m

select * 
from employees
where FirstName like 'm[a]%'   -- anything  a after the m

select * 
from employees
where FirstName like 'm[a-e]%'   -- an a,b,c,d,e after the m

select * 
from employees
where FirstName like 'm[a-l]%'   -- any letter between a and l after the m

select * 
from employees
where FirstName like 'm[^a-l]%'   -- any letter but those between a and l after the m

select * 
from employees
where FirstName like '_an%'  -- Janet and Nancy

