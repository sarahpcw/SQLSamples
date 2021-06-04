-- cursor keeps the whole record set and 
-- then allows you to iterate over all the rows in the resultset

-- @@fetchstatus : this function returns the status of the last cursor FETCH statement 
--issued against any cursor currently opened by the connection.
--Return value	Description
-- 0	The FETCH statement was successful.
---1	The FETCH statement failed or the row was beyond the result set.
---2	The row fetched is missing.
---9	The cursor is not performing a fetch operation.


-- STATIC: It is called static SQL because the SQL statements in the program are static; that is, they do not change each time the program is run. As described in the previous section, these statements are compiled when the rest of the program is compiled. Static SQL works well in many situations and can be used in any application for which the data access can be determined at program design time

-- LOCAL: A Transact-SQL local variable is an object that can hold a single data value of a specific type. 

-- FORWARD only: This SQL FORWARD_ONLY cursor can only move from the first row to last and does not support the other way (scrolling backward). I

-- If FORWARD_ONLY is specified without the STATIC , KEYSET , or DYNAMIC keywords, the cursor operates as a dynamic cursor

-- SET NOCOUNT ON is a set statement which prevents the message which shows the number of rows affected by T-SQL query statements.
 
 -- What is UNIQUEIDENTIFIER in SQL Server?
--It is a data type in SQLServer & it will be mostly used as Primary Key. Generally Uniqueidentifier is a 36 bit alphanumeric unique Value that will not be duplicated. Its syntax is XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX. It is a data type in SQLServer & it will be mostly used as Primary Key.

DECLARE 
    @product_name VARCHAR(255), 
    @list_price   DECIMAL;

DECLARE cursor_product CURSOR FOR 
	SELECT productname,  price  FROM products where price > 100;
OPEN cursor_product;
FETCH NEXT FROM cursor_product INTO  @product_name,  @list_price;
while (@@FETCH_STATUS = 0)
begin
        print  @product_name 
				+ ', Price: $' 
				+ cast(@list_price as varchar) ;
		FETCH NEXT FROM cursor_product INTO @product_name, @list_price;
end

CLOSE cursor_product; --After that, close the cursor:
DEALLOCATE cursor_product; --Finally, deallocate the cursor to release it.