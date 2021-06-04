insert into products2 ( productid, productname, price)
values (6, 'getball', 15)


select productid, productname, price, 
--ROW_NUMBER() over (order by productName desc) AS rownumber,
rank() over (order by price desc) AS Ranking,
DENSE_RANK() over (order by price desc) AS DenseRank
from products2

select Productid, Productname, Price, 
rank() over (order by price desc) AS Ranking,
DENSE_RANK() over (order by price desc) AS DenseRank
from products2

update products2
set productname = 'getall'
where price = 10

CREATE SEQUENCE Invoice_Seq
 AS INTEGER
 START WITH 1
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 99
 NO CYCLE; 

 CREATE SEQUENCE Service_Ticket_Seq
 AS INTEGER
 START WITH 1
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 100
 CYCLE; 

 CREATE TABLE Meats
(ticket_seq INTEGER NOT NULL PRIMARY KEY,
 meat_type VARCHAR(15) NOT NULL);
 
CREATE TABLE Fish
(ticket_seq INTEGER NOT NULL PRIMARY KEY,
 fish_type VARCHAR(15) NOT NULL);
 
alter PROCEDURE Ticket_Service1
(@in_market_code CHAR(1),
 @in_product_name VARCHAR(15))
AS
BEGIN 
DECLARE @local_ticket_seq INTEGER;
SET @local_ticket_seq = NEXT VALUE FOR Invoice_Seq; 
IF @in_market_code = 'M'
INSERT INTO Meats
VALUES (@local_ticket_seq, @in_product_name);
ELSE IF @in_market_code = 'F'
   INSERT INTO Fish
   VALUES (@local_ticket_seq, @in_product_name);
END; 

EXEC Ticket_Service1 'M', 'Brisket';
EXEC Ticket_Service1 'F', 'Lox';
EXEC Ticket_Service1 'M', 'Chicken';
EXEC Ticket_Service1 'M', 'Brisket';
EXEC Ticket_Service1 'F', 'Sturgeon'; 
EXEC Ticket_Service1 'F', 'Haddock';

select * from fish
select * from Meats