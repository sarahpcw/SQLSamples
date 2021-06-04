DECLARE 
    @product_name VARCHAR(255), 
    @price   float;
	
SELECT * 
INTO #temp1
 FROM (
 SELECT productname,  price  FROM products where price > 100
 ) AS x

DECLARE @Count INT
DECLARE cursor_product CURSOR
		FOR SELECT productname,  price  FROM #temp1;

OPEN cursor_product
FETCH NEXT FROM cursor_product INTO @product_name, @price
    WHILE (@@FETCH_STATUS = 0)
        BEGIN
			print  @product_name
				+ ', Price: $' 
				+ cast(@price*1.33 as nvarchar)
		FETCH NEXT FROM cursor_product INTO @product_name, @price
        END
CLOSE cursor_product
DEALLOCATE cursor_product
DROP TABLE #temp1