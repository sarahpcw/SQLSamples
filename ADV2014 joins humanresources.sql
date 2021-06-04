-- human resources schema
select 
e.[BusinessEntityID],[FirstName], [LastName],
[JobTitle], [BirthDate], [Gender], [SickLeaveHours], 
[StartDate], d.[Name] as departmentName, 
s.[Name] as ShiftName, 
ph.Rate ,  [PayFrequency], ph.[ModifiedDate] 
from [HumanResources].[Employee] e
join [Person].[Person] p on e.BusinessEntityID = p.BusinessEntityID
join [HumanResources].[EmployeeDepartmentHistory] h on e.BusinessEntityID= h.BusinessEntityID 
join [HumanResources].[Department] d on h.DepartmentID = d.DepartmentID
join [HumanResources].[Shift] s on h.ShiftID = s.ShiftID
join [HumanResources].[EmployeePayHistory] ph on e.BusinessEntityID = ph.BusinessEntityID
order by e.BusinessEntityID


-- list all job candidates
select * from  [HumanResources].[JobCandidate]

-- list all job candidates with their names
select 
p.[BusinessEntityID],[FirstName], [LastName], [JobCandidateID], [Resume]
from  [Person].[Person] p  
join  [HumanResources].[JobCandidate] jc on p.BusinessEntityID = jc.BusinessEntityID

-- list all job candidates with their names who were employed
select 
p.[BusinessEntityID],[FirstName], [LastName], [JobTitle], [JobCandidateID], [Resume]
from  [Person].[Person] p  
join  [HumanResources].[JobCandidate] jc on p.BusinessEntityID = jc.BusinessEntityID
join [HumanResources].[Employee] e on p.BusinessEntityID = e.BusinessEntityID



