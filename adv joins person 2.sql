-- person schema
-- list names , password, email address, phone, phone type, address
select [PersonType], [FirstName], [LastName], [PasswordHash], [PasswordSalt], 
EmailAddress, [PhoneNumber]
	, ppht.[Name] as phoneType
	, p.BusinessEntityID, pb.BusinessEntityID
	, a.[AddressID],  pba.[ModifiedDate] as AddressModifyDate
	, a.[AddressLine1], a.[City]
	, at.[AddressTypeID], at.[Name] as addressType
	, sp.[Name] as stateProvince , c.[Name] as Country
	, at.[Name] as salesTerritory, st.[ModifiedDate] as SalesTerritoryDate
 --, ct.Name as ContactType
from person.Person p
join person.Password pw on p.BusinessEntityID = pw.BusinessEntityID
join person.EmailAddress pe on p.BusinessEntityID = pe.BusinessEntityID
join person.PersonPhone pph on p.BusinessEntityID = pph.BusinessEntityID
join person.PhoneNumberType ppht on pph.[PhoneNumberTypeID] = ppht.PhoneNumberTypeID
join person.BusinessEntity pb on p.BusinessEntityID= pb.BusinessEntityID 
join [Person].[BusinessEntityAddress] pba on p.BusinessEntityID = pba.BusinessEntityID
join person.Address a on pba.AddressID = a.AddressID
join person.AddressType at on pba.AddressTypeID = at.AddressTypeID
join person.StateProvince sp on a.StateProvinceID = sp.StateProvinceID
join person.CountryRegion c on sp.CountryRegionCode = c.CountryRegionCode
join sales.SalesTerritory st on c.CountryRegionCode = st.CountryRegionCode
--join person.BusinessEntityContact bc on p.BusinessEntityID = bc.BusinessEntityID
--join person.ContactType ct on bc.ContactTypeID = ct.ContactTypeID

 


 select [Name], bec.[ModifiedDate], b.[BusinessEntityID], firstname,lastname
 from [Person].[ContactType] ct
 left join [Person].[BusinessEntityContact]  bec on  ct.ContactTypeID = bec.ContactTypeID
 left join person.BusinessEntity b on bec.BusinessEntityID = b.BusinessEntityID
 left join person.person p on bec.personid = p.BusinessEntityID


 select FirstName, LastName
	 --, p.BusinessEntityID, bec.PersonID, bec.BusinessEntityID
	 , ct.[Name] contactType
	 , pe.EmailAddress
	 , pph.PhoneNumber
	 , ppht.[Name] as PhoneNumberType
	 , at.[Name] as AddressType
	 , a.[AddressLine1], [City]
	 , sp.Name as StateProvince
	 , c.Name as Country
 from person.person p
	left join [Person].[BusinessEntityContact]  bec on p.BusinessEntityID = bec.PersonID
	left join  [Person].[ContactType] ct on ct.ContactTypeID = bec.ContactTypeID
	left join person.EmailAddress pe on p.BusinessEntityID = pe.BusinessEntityID
	left join person.PersonPhone pph on p.BusinessEntityID = pph.BusinessEntityID
	left join person.PhoneNumberType ppht on pph.[PhoneNumberTypeID] = ppht.PhoneNumberTypeID
	left join person.BusinessEntity pb on p.BusinessEntityID= pb.BusinessEntityID 
	left join [Person].[BusinessEntityAddress] pba on p.BusinessEntityID = pba.BusinessEntityID
	left join person.Address a on pba.AddressID = a.AddressID
	left join person.AddressType at on pba.AddressTypeID = at.AddressTypeID
	left join person.StateProvince sp on a.StateProvinceID = sp.StateProvinceID
	left join person.CountryRegion c on sp.CountryRegionCode = c.CountryRegionCode


select FirstName, LastName
	 , pe.EmailAddress
	 , pph.PhoneNumber
	 , ppht.[Name] as PhoneNumberType
	 , at.[Name] as AddressType
	 , a.[AddressLine1], [City]
	 , sp.Name as StateProvince
	 , c.Name as Country
 from person.person p
	 join person.EmailAddress pe on p.BusinessEntityID = pe.BusinessEntityID
	 join person.PersonPhone pph on p.BusinessEntityID = pph.BusinessEntityID
	 join person.PhoneNumberType ppht on pph.[PhoneNumberTypeID] = ppht.PhoneNumberTypeID
	 join person.BusinessEntity pb on p.BusinessEntityID= pb.BusinessEntityID 
	 left join [Person].[BusinessEntityAddress] pba on p.BusinessEntityID = pba.BusinessEntityID
	 left join person.Address a on pba.AddressID = a.AddressID
	 left join person.AddressType at on pba.AddressTypeID = at.AddressTypeID
	 left join person.StateProvince sp on a.StateProvinceID = sp.StateProvinceID
	 left join person.CountryRegion c on sp.CountryRegionCode = c.CountryRegionCode