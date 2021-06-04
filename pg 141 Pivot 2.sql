SELECT *
FROM ( SELECT 
        year(soh.orderdate) as [year]
		, st.name as Territory
        , soh.SubTotal as Amount 
    FROM [Sales].[SalesOrderHeader] soh
	join [Sales].[SalesTerritory] st on soh.TerritoryID = st.TerritoryID
) as s
PIVOT
(   SUM(Amount)
    FOR Territory IN (Australia, Canada, France,  Germany)
)AS pvt order by [year]