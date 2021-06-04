create sequence newProducts_seq
AS int
start with 1000
increment by 1

CREATE TABLE productsTable
(productID INTEGER DEFAULT NEXT VALUE FOR newProducts_seq PRIMARY KEY,
 productName VARCHAR(15) NOT NULL);

INSERT INTO productsTable (productName) VALUES ('pencils');
INSERT INTO productsTable (productName) VALUES ('sharperners');
 
 CREATE TABLE productsTable2
(productID INTEGER PRIMARY KEY,
 productName VARCHAR(15) NOT NULL);

 INSERT INTO productsTable (productID,productName) VALUES (NEXT VALUE FOR newProducts_seq, 'pencils');
 INSERT INTO productsTable (productID,productName) VALUES (NEXT VALUE FOR newProducts_seq, 'sharpeners');