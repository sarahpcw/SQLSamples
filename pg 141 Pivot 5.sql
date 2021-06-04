SELECT *
FROM ( SELECT 
        year(soh.orderdate) as [YEAR]
		, st.name as [Territory]
        , soh.SubTotal as Amount 
		FROM [Sales].[SalesOrderHeader] soh
		join [Sales].[SalesTerritory] st on soh.TerritoryID = st.TerritoryID
) AS p 
PIVOT
(   SUM(Amount)  
    FOR  [YEAR] IN ( [2011] , [2012] , [2013] , [2014]) 
) AS pvt order by [Territory]