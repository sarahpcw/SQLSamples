Create database TKAsample;

Use TKAsample;
 

CREATE TABLE customers(
	CustomerID int not NULL,
	CustomerName nvarchar(50) ,
	ContactName nvarchar(50) ,
	C_Address nvarchar(50) ,
	City nvarchar(50) ,
	PostalCode nvarchar(50) ,
	Country nvarchar(50) 
);


CREATE TABLE orders(
	OrderID int not NULL,
	CustomerID int ,
	EmployeeID int ,
	OrderDate datetime ,
	ShipperID int 
);

--primary key constraint
alter table customers
add constraint c_PK  -- constraint name
Primary key (CustomerID); -- field that is now the primary key ( CustomerID ) 

alter table orders
add constraint o_PK  -- constraint name
Primary key (orderid); -- field that is now the primary key ( CustomerID ) 


-- The foreign key 
ALTER TABLE   orders
ADD CONSTRAINT c_fk  --  name of the foreign key constraint
foreign key (CustomerID) -- field on orders table that becomes the foreign key
references customers (CustomerID) -- table and it's primary key that the foreign key links to

INSERT INTO customers
           (CustomerID  ,CustomerName  , ContactName   ,City  ,Country)
     VALUES ( 1, 'WH SMITH' , ' Joe bloggs' , 'London' , 'UK'),
			( 2, 'Zara' , ' John Smith ' , 'Paris' , 'France');

update customers
set Country ='united kingdom'
where country ='UK';

delete from customers
where country ='united kingdom';

drop table orders;

drop table customers;
 

drop database TKAsample;
