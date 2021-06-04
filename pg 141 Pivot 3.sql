SELECT *
FROM (
    SELECT 
        year(soh.orderdate) as [year]
		,left(datename(month,soh.orderdate),3)as [month]
        , soh.SubTotal as Amount 
    FROM [Sales].[SalesOrderHeader] soh
	join [Sales].[SalesTerritory] st on soh.TerritoryID = st.TerritoryID
) as s
PIVOT
(   SUM(Amount)
    FOR [month] IN (jan, feb, mar, apr,  may, jun, jul, aug, sep, oct, nov, dec)
)AS pvt