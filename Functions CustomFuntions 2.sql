create function ordersid_smallestdate3
(@e_id INT )
Returns DATETIME 
As 
Begin
		Declare @oid DATETIME
		SELECT @oid = MIN (ORDERDATE ) 
		FROM orders
		where customerid = @e_id
		GROUP BY CUSTOMERID
		return @oid
end



SELECT ORDERID
	, CUSTOMERID
	, EMPLOYEEID
	, ORDERDATE
	, [dbo].[ordersid_smallestdate3] (CUSTOMERID) SMALLESTDATE
FROM ORDERS
WHERE ORDERDATE = [dbo].[ordersid_smallestdate3] (CUSTOMERID)
ORDER BY CUSTOMERID


-- ALTERYX