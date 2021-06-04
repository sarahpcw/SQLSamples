create function ordersid_smallestdate2
(@e_id INT )
Returns DATETIME 
As 
Begin
        Declare @oid DATETIME
        SELECT @oid = FIRST_VALUE(orderDATE) OVER (PARTITION BY customerid ORDER BY orderdate asc)  
        FROM orders
        where customerid = @e_id
        return @oid
end 



SELECT ORDERID
    , CUSTOMERID
    , EMPLOYEEID
    , ORDERDATE
    , [dbo].[ordersid_smallestdate2] (CUSTOMERID) SMALLESTDATE
FROM ORDERS
WHERE ORDERDATE = [dbo].[ordersid_smallestdate2] (CUSTOMERID)
ORDER BY CUSTOMERID

SELECT  productname
      , price
      , categoryid
      , FIRST_VALUE(productname) OVER (  PARTITION BY categoryid ORDER BY productname asc) AS BestP
from products    
 
--sumPricePerCategory, accummulative on productname
SELECT  productname
      , price
      , categoryid
      , sum(price) OVER (  PARTITION BY categoryid ORDER BY productname asc)AS BestP
from products  

--sumPricePerCategory
SELECT  productname
      , price
      , categoryid
      , sum(price) OVER (  PARTITION BY categoryid ORDER BY categoryid asc)AS BestP
from products   


with cte ( categoryId, SumPrice ) 
as (SELECT   
      categoryid
      , sum(price)  
from products p 
group by  
       categoryid
)
SELECT  p2.productname
      , p2.price
      , p2.categoryid
	  , cte.SumPrice
from  products p2 
join cte on p2.CategoryID = cte.categoryID


SELECT  productname
      , price
      , supplierid
      , avg(price) OVER (PARTITION BY supplierid ORDER BY productname asc)AS AvgPricePerSupplier
--into #temptable2
from products 
order by supplierid  

SELECT  orderid
	  , orderdate
      , employeeid
      , count(orderid) OVER (PARTITION BY employeeid ORDER BY employeeid asc)AS countOrdersPerEmployee
--into #temptable2
from orders 
order by employeeid  
-- countOrdersPerCustomer
SELECT  orderid
	  , orderdate
      , customerid
      , count(customerid) OVER (PARTITION BY customerid ORDER BY customerid asc)AS countOrdersPerCustomer
--into #temptable2
from orders 
order by customerid

--countCustomersPerCountry
SELECT  customerid
	  , customername
	  , country
      , count(customerid) OVER (PARTITION BY country ORDER BY country asc)AS countCustomersPerCountry
--into #temptable2
from customers 
order by country  

--countProductsPerCategory
SELECT  productid
	  , productname
	  , price
	  , Categoryid
      , count(productid) OVER (PARTITION BY Categoryid ORDER BY Categoryid asc)AS countProductsPerCategory
--into #temptable2
from products 
order by Categoryid  

--avgPricePerCategory
SELECT  productid
	  , productname
	  , price
	  , Categoryid
      , avg(price) OVER (PARTITION BY Categoryid ORDER BY Categoryid asc)AS avgPricePerCategory
from products 
order by Categoryid  

--avgPricePerCategory -- accummulative ( change the order by)
SELECT  productid
	  , productname
	  , price
	  , Categoryid
      , avg(price) 
	  OVER (PARTITION BY Categoryid 
	  ORDER BY productname asc)
	  AS avgPricePerCategory
from products 
order by Categoryid  

select * from products order by categoryid


--avgPricePerCategory -- accummulative ( change the order by)
SELECT   Categoryid
      , avg(price) 
from products 
group by Categoryid
order by Categoryid  
