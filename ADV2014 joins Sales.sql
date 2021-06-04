 

select soh.[SalesOrderID] -- from soh
, soh.[OrderDate] --
, a.[City] as billtoAddress
, b.[City] as ShipToAddress
, c.[CardType]
, cr.[FromCurrencyCode] 
, cu.[AccountNumber]
, sp.[SalesQuota]
, st.[Name] as SalesTerritory
, sm.[Name] as ShipMethod
from  [Sales].[SalesOrderHeader] soh
join  [Person].[Address] a on soh.[BillToAddressID] = a.[AddressID]
join  [Person].[Address] b on soh.[ShipToAddressID]= b.[AddressID]
join  [Sales].[CreditCard] c on soh.[CreditCardID] = c.[CreditCardID]
join  [Sales].[CurrencyRate] cr on soh.[CurrencyRateID]= cr.[CurrencyRateID]
join  [Sales].[Customer] cu on soh.[CustomerID] = cu.[CustomerID]
join  [Sales].[SalesPerson] sp on soh.[SalesPersonID] = sp.[BusinessEntityID]
join  [Sales].[SalesTerritory] st on soh.[TerritoryID]= st.[TerritoryID]
join  [Purchasing].[ShipMethod]  sm on soh.[ShipMethodID]= sm.[ShipMethodID]
 

 
 select
	soh.[SalesOrderID]
	, soh.[SalesOrderNumber]
	, soh.[OrderDate]
	, soh.[DueDate]
	, sod.[ProductID]
	, sod.OrderQty
	, sod.[UnitPrice]
	, soh.[TotalDue]
from [Sales].[SalesOrderHeader] soh 
join [Sales].[SalesOrderDetail] sod on soh.SalesOrderID = sod.SalesOrderID
where  	soh.[SalesOrderNumber] = 'SO45266'
order by  soh.[SalesOrderID], sod.[ProductID]


select * from
[Sales].[CountryRegionCurrency]  join [Person].[CountryRegion]
on [Sales].[CountryRegionCurrency].[CountryRegionCode]= [Person].[CountryRegion].[CountryRegionCode]

select * 
from [Sales].[CountryRegionCurrency] join [Sales].[Currency]  
on [Sales].[CountryRegionCurrency].[CurrencyCode]=[Sales].[Currency].[CurrencyCode]
 
 select * from 
 [Sales].[CurrencyRate]   join [Sales].[Currency]
on [FromCurrencyCode]= [Sales].[Currency].[CurrencyCode]
 

 select * from  [Sales].[CurrencyRate]   join [Sales].[Currency]
on [ToCurrencyCode]=  [Sales].[Currency].[CurrencyCode]