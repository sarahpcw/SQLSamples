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
 
