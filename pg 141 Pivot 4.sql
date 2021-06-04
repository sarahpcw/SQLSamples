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
    FOR [Territory] IN ( Northwest, Northeast, Central
	, Southwest, Southeast, Canada, France, Germany, Australia, [United Kingdom] ) 
) AS pvt order by [year]