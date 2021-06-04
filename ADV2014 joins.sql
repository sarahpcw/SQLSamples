select [HumanResources].[Employee].[BusinessEntityID], [Person].[Person].[BusinessEntityID]
	, FirstName, LastName, Title, JobTitle , BirthDate, gender
	, [SickLeaveHours], [VacationHours], [HireDate]
from 
[HumanResources].[Employee] inner join [Person].[Person]
on [HumanResources].[Employee].[BusinessEntityID] = [Person].[Person].[BusinessEntityID]


select * from 
[HumanResources].[EmployeeDepartmentHistory] inner join [HumanResources].[Department] on
[HumanResources].[EmployeeDepartmentHistory].[DepartmentID] =  [HumanResources].[Department].[DepartmentID]

select * from 
[HumanResources].[EmployeeDepartmentHistory]  inner join  [HumanResources].[Employee] on
[HumanResources].[EmployeeDepartmentHistory].[BusinessEntityID]= [HumanResources].[Employee].[BusinessEntityID]

select * from 
[HumanResources].[EmployeeDepartmentHistory]inner join [HumanResources].[Shift] on
[HumanResources].[EmployeeDepartmentHistory].[ShiftID]=[HumanResources].[Shift].[ShiftID]

select * from
[HumanResources].[EmployeePayHistory]   inner join [HumanResources].[Employee] on
[HumanResources].[EmployeePayHistory].[BusinessEntityID]= [HumanResources].[Employee].[BusinessEntityID]

select * from
[HumanResources].[JobCandidate] inner join [HumanResources].[Employee] on
[HumanResources].[JobCandidate].[BusinessEntityID] = [HumanResources].[Employee].[BusinessEntityID]