select count(*) from [Production].[BillOfMaterials] -- 2670
select count(*) from [Production].[Culture] -- 8
select count(*) from [Production].[Document] -- 13
select count(*) from [Production].[Illustration] -- 5
select count(*) from [Production].[Location] -- 14
select count(*) from [Production].[Product] -- 504
select count(*) from [Production].[ProductCategory] -- 4
select count(*) from [Production].[ProductCostHistory] -- 395
select count(*) from [Production].[ProductDescription] -- 762
select count(*) from [Production].[ProductDocument] -- 32
select count(*) from [Production].[ProductInventory] -- 1069
select count(*) from [Production].[ProductListPriceHistory] -- 395
select count(*) from [Production].[ProductModel] -- 128
select count(*) from [Production].[ProductModelIllustration] -- 7
select count(*) from [Production].[ProductModelProductDescriptionCulture] -- 762
select count(*) from [Production].[ProductPhoto] -- 101
select count(*) from [Production].[ProductProductPhoto] -- 504
select count(*) from [Production].[ProductReview] -- 4
select count(*) from [Production].[ProductSubcategory] -- 37 
select count(*) from [Production].[ScrapReason] -- 16 
select count(*) from [Production].[TransactionHistory] -- 113443
select count(*) from [Production].[TransactionHistoryArchive] -- 89253
select count(*) from [Production].[UnitMeasure] -- 38
select count(*) from [Production].[WorkOrder] -- 72591
select count(*) from [Production].[WorkOrderRouting] -- 67131

-- general product description
select   p.[Name] as ProductName, [Color]
, d.ModifiedDate as DocDate
, pf.[Primary] as Photo
, f.[ThumbnailPhotoFileName]
, sc.[Name] as SubCategory
, c.Name as Catgery
, m.[Name] as Model
, mi.[ModifiedDate] as modelDate
, i.[ModifiedDate] as IllustrationDate
, pmpdc.ModifiedDate as DescriptionDate
, ds.[Description]
,cu.[Name] as Culture
from [Production].[Product] p -- 504
left join [Production].[ProductDocument] d on p.ProductID = d.ProductID
left join [Production].[ProductProductPhoto] pf on p.ProductID = pf.ProductID
left join [Production].[ProductPhoto] f on pf.ProductPhotoID = f.ProductPhotoID
left join [Production].[ProductSubcategory] sc on p.ProductSubcategoryID = sc.ProductSubcategoryID
left join [Production].[ProductCategory] c on sc.ProductCategoryID = c.ProductCategoryID
left join [Production].[ProductModel] m on p.ProductModelID = m.ProductModelID
left join [Production].[ProductModelIllustration] MI on m.ProductModelID = mi.[ProductModelID]
left join [Production].[Illustration] i on MI.IllustrationID = i.[IllustrationID]
left join [Production].[ProductModelProductDescriptionCulture] pmpdc on mi.ProductModelID = pmpdc.ProductModelID
left join [Production].[ProductDescription] ds on pmpdc.ProductDescriptionID = ds.ProductDescriptionID
left join [Production].[Culture] cu on pmpdc.CultureID = cu.CultureID

-- product, inventoey an location
select 
p.Name, p.Color, p.Class
,m.[Name] as Model
, c.name as Category
, sc.Name as SubCategory
, i.Shelf, i.bin, i.quantity
, l.Name as Location
from [Production].[Product] p
left join [Production].[ProductModel] m on p.[ProductModelID] = m.ProductModelID
left join [Production].[ProductSubcategory] sc on p.ProductSubcategoryID = sc.ProductSubcategoryID
  join [Production].[ProductCategory] c on sc.ProductCategoryID = c.ProductCategoryID
 join [Production].[ProductInventory] i on p.ProductID = i.ProductID
 join [Production].[Location] l on i.LocationID = l.LocationID
order by location desc, shelf, bin

-- product transaction history
select 
p.Name, p.Color, p.Class
,m.[Name] as Model
, t.[ReferenceOrderID], t.[TransactionDate], t.[TransactionType], t.[ActualCost]
from [Production].[Product] p
left join [Production].[ProductModel] m on p.[ProductModelID] = m.ProductModelID
left join [Production].[TransactionHistory] t on p.ProductID = t.ProductID

-- product transaction history archive
 select 
p.Name, p.Color, p.Class
,m.[Name] as Model
, t.[ReferenceOrderID], t.[TransactionDate], t.[TransactionType], t.[ActualCost]
from [Production].[Product] p
left join [Production].[ProductModel] m on p.[ProductModelID] = m.ProductModelID
left join [Production].[TransactionHistory] t on p.ProductID = t.ProductID

-- product cost History
 select 
p.Name, p.Color, p.Class
,m.[Name] as Model
, ch.startdate , ch.StandardCost
from [Production].[Product] p
left join [Production].[ProductModel] m on p.[ProductModelID] = m.ProductModelID
left join [Production].[ProductCostHistory] CH on p.ProductID = ch.ProductID


-- product List Price History
 select 
p.Name, p.Color, p.Class
,m.[Name] as Model
, lph.StartDate, lph.listprice
from [Production].[Product] p
left join [Production].[ProductModel] m on p.[ProductModelID] = m.ProductModelID
left join [Production].[ProductListPriceHistory] lph on p.productid = lph.productid

-- product reviews
select 
p.Name, p.Color, p.Class
,m.[Name] as Model
,r.[ReviewerName], r.Comments
from [Production].[Product] p
left join [Production].[ProductModel] m on p.[ProductModelID] = m.ProductModelID 
join [Production].[ProductReview] r on p.ProductID = r.ProductID


select 
p.Name, p.Color, p.Class
, wor.[ScheduledStartDate], wor.ActualCost
, wo.[OrderQty], wo.ScrappedQty
, s.name as Scrapped
, l.Name as Location
from [Production].[Product] p
join [Production].[WorkOrderRouting] wor on p.ProductID = wor.ProductID
join [Production].[WorkOrder] wo on p.ProductID = wo.ProductID
join [Production].[ScrapReason] s on wo.ScrapReasonID = s.[ScrapReasonID]
join [Production].[Location] l on wor.LocationID = l.LocationID
