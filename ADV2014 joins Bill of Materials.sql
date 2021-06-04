select 
	[BillOfMaterialsID], [ProductAssemblyID], 
	p.[ProductID], p.name as Product, 
	[Production].[BillOfMaterials].[ComponentID], 
	pc.ProductID, pc.Name as Component,
	[Production].[UnitMeasure].[Name] as UnitOfMeasure
from 
	[Production].[BillOfMaterials] 
	join [Production].[Product] p on [Production].[BillOfMaterials].[ProductAssemblyID]= p.[ProductID]
	join [Production].[Product] pc on [Production].[BillOfMaterials].[ComponentID] = pc.ProductID
	join [Production].[UnitMeasure] on [Production].[BillOfMaterials].[UnitMeasureCode]=[Production].[UnitMeasure].[UnitMeasureCode]
where [ProductAssemblyID] in ( 3, 727 )  
order by [ProductAssemblyID], [ComponentID]


with cte (componentid,   ComponentName ) 
as ( select  [Production].[Product].productid , [Production].[Product].name 
		from [Production].[Product] 
)		
select [BillOfMaterialsID], [ProductAssemblyID], 
[Production].[Product].[ProductID], [Production].[Product].name,  [Production].[BillOfMaterials].[ComponentID], ComponentName
from 
[Production].[BillOfMaterials] 
join [Production].[Product] on [Production].[BillOfMaterials].[ProductAssemblyID]= [Production].[Product].[ProductID]
join cte on [Production].[BillOfMaterials].[ComponentID] = cte.componentid
where [ProductAssemblyID] in ( 3, 727)  
order by [ProductAssemblyID], [ComponentID]

 