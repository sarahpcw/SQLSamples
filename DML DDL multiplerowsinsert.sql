insert into employees(EmployeeID,BirthDate, notes)
select [BusinessEntityID],
[BirthDate],
[MaritalStatus]
from [AdventureWorks2014].[HumanResources].[Employee] 
where [BusinessEntityID] between 11 and 19

select *
from employees
where EmployeeID between 10 and 99
