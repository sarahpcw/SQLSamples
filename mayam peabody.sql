-- import from website and portal and soc media for many teams
-- must provide story
-- C:\Users\u\Desktop\deeq\datacustomer4.csv

BULK INSERT datacustomer5
FROM 'C:\Users\u\Desktop\deeq\datacustomer4.csv'
WITH (FIRSTROW = 1,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR='\n'
 )

select * from datacustomer5