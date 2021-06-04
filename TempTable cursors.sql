--Let’s first talk about scrolling capabilities.  
--Cursors can be defined with 
--two main scrolling capabilities, FORWARD_ONLY or SCROLL.
--FORWARD_ONLY – The cursor starts on the first row and end on the last. 
--The cursor can only move to the next row in the result.
--SCROLL – the cursor can use operations, 
--such as FIRST, LAST, PRIOR, NEXT, RELATIVE, ABSOLUTE to navigate the results.

DECLARE @businessEntityID as INT;
DECLARE @firstName as NVARCHAR(50),
        @lastName as NVARCHAR(50);
DECLARE @personCursor as CURSOR;

SET @personCursor = CURSOR FOR
    SELECT BusinessEntityID,
           upper(FirstName),
           Lower(LastName)
    FROM  Person.Person
	where BusinessEntityID <10

    OPEN @personCursor
FETCH NEXT FROM @personCursor INTO @businessEntityID, 
                                   @firstName,
                                   @lastName
WHILE @@FETCH_STATUS = 0
BEGIN
   PRINT cast(@BusinessEntityID as VARCHAR (50)) 
         + ' - ' + @firstName
         + ' ' + @lastName;
   FETCH NEXT FROM @personCursor INTO @businessEntityID, 
                                      @firstName, 
                                      @lastName
END
CLOSE @personCursor;
DEALLOCATE @personCursor;