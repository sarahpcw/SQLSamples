-- person.emailaddress
select * from 
[Person].[EmailAddress] inner join  [Person].[Person] on
[Person].[EmailAddress].[BusinessEntityID]= [Person].[Person].[BusinessEntityID]

-- person.password
select * from 
[Person].[Password] inner join [Person].[Person] on
[Person].[Password].[BusinessEntityID]=[Person].[Person].[BusinessEntityID]

-- person.person
select * from
[Person].[Person] inner join[Person].[BusinessEntity]  on
[Person].[Person].[BusinessEntityID] = [Person].[BusinessEntity].[BusinessEntityID]
 
-- [Person].[PersonPhone]
select  * from 
 [Person].[PersonPhone] inner join [Person].[Person] on
 [Person].[PersonPhone].[BusinessEntityID]=[Person].[Person].[BusinessEntityID]

select  * from 
[Person].[PersonPhone] inner join  [Person].[PhoneNumberType] on
[Person].[PersonPhone].[PhoneNumberTypeID]= [Person].[PhoneNumberType].[PhoneNumberTypeID]


--[Person].[StateProvince]
select * from  
[Person].[StateProvince]inner join [Person].[CountryRegion]  on
[Person].[StateProvince].[CountryRegionCode]=[Person].[CountryRegion].[CountryRegionCode]
 
select * from 
[Person].[StateProvince]inner join [Sales].[SalesTerritory] on
[Person].[StateProvince].[TerritoryID]=[Sales].[SalesTerritory].[TerritoryID]

select * from
 [Person].[Person] inner join [Person].[BusinessEntity] on
 [Person].[Person].[BusinessEntityID] =[Person].[BusinessEntity].[BusinessEntityID]
  
 --  [Person].[EmailAddress]
 select * from 
 [Person].[EmailAddress]  inner join [Person].[Person] on
 [Person].[EmailAddress].[BusinessEntityID]=  [Person].[Person].[BusinessEntityID]

  -- [Person].[Address] 
 select * 
 from [Person].[Address] inner join [Person].[StateProvince] on
[Person].[Address].[StateProvinceID]=[Person].[StateProvince].[StateProvinceID]

 -- [Person].[BusinessEntityAddress]
select * from
 [Person].[BusinessEntityAddress] inner join [Person].[Address] on
 [Person].[BusinessEntityAddress].[AddressID]=[Person].[Address].[AddressID]

  select * from 
 [Person].[BusinessEntityAddress] inner join [Person].[AddressType] on
 [Person].[BusinessEntityAddress].[AddressTypeID]=  [Person].[AddressType].[AddressTypeID]
 
select * from 
[Person].[BusinessEntityAddress]inner join [Person].[BusinessEntity] on
[Person].[BusinessEntityAddress].[BusinessEntityID] = [Person].[BusinessEntity].[BusinessEntityID]


  -- [Person].[BusinessEntityContact]
select * from  
[Person].[BusinessEntityContact] inner join [Person].[BusinessEntity] on
[Person].[BusinessEntityContact].[BusinessEntityID]=[Person].[BusinessEntity].[BusinessEntityID]

 
select * from  
[Person].[BusinessEntityContact]inner join [Person].[ContactType] on
[Person].[BusinessEntityContact].[ContactTypeID]=[Person].[ContactType].[ContactTypeID]

 
select * from  
[Person].[BusinessEntityContact]inner join [Person].[Person] on
[Person].[BusinessEntityContact].[PersonID]=[Person].[Person].[BusinessEntityID]

