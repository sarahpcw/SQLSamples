create procedure aFixPrimaryLeys (
  @eid int
  ) 
as 
begin
UPDATE Customers	set CustomerID = replace (CustomerID,' ', '' );
UPDATE Shippers		set ShipperID = replace (ShipperID,' ', '' ); 
UPDATE Employees	set EmployeeID = replace (EmployeeID,' ', '' );  
UPDATE Orders		set OrderID = replace (OrderID,' ', '' );  
UPDATE Orderdetails set OrderDetailID = replace (OrderDetailID,' ', '' );  
UPDATE Products		set ProductID = replace (ProductID,' ', '' );  
UPDATE Suppliers	set SupplierID = replace (SupplierID,' ', '' );  
UPDATE Categories	set CategoryID = replace (CategoryID,' ', '' );  

Alter Table  Customers		alter column CustomerID int not null;
Alter Table  Shippers		alter column ShipperID int not null;
Alter Table  Employees		alter column EmployeeID int not null;
Alter Table  Orders			alter column OrderID int not null;
Alter Table  Orderdetails	alter column OrderDetailID int not null;
Alter Table  Products		alter column ProductID int not null;
Alter Table  Suppliers		alter column SupplierID int not null;
Alter Table  Categories		alter column CategoryID int not null;

Alter Table  Customers		add primary key (CustomerID);
Alter Table  Shippers		add primary key (ShipperID);
Alter Table  Employees		add primary key (EmployeeID);
Alter Table  Orders			add primary key (OrderID);
Alter Table  Orderdetails	add primary key (OrderDetailID);
Alter Table  Products		add primary key (ProductID);
Alter Table  Suppliers		add primary key (SupplierID);
Alter Table  Categories		add primary key (CategoryID);

End


create procedure aFixForeignKeys (
  @eid int
  ) 
as 
begin
--For the foreign keys:
UPDATE Products	set SupplierID = replace (SupplierID,' ', '' );
UPDATE Products	set categoryID = replace (CategoryID,' ', '' );
--UPDATE Customers	set CustomerID = replace (CustomerID,' ', '' );
UPDATE Orders	set CustomerID = replace (CustomerID,' ', '' );
UPDATE Orders	set ShipperID = replace (ShipperID,' ', '' );
UPDATE Orders	set EmployeeID = replace (EmployeeID,' ', '' );
UPDATE Orderdetails	set OrderID = replace (OrderID,' ', '' );
UPDATE Orderdetails	set ProductID = replace (ProductID,' ', '' );


alter table products alter column SupplierID int
alter table products alter column CategoryID int
alter table Orders alter column CustomerID int
alter table Orders alter column ShipperID int
alter table Orders alter column EmployeeID int
alter table Orderdetails alter column OrderID int
alter table Orderdetails alter column ProductID int

select productID,  supplierID, convert ( int, SupplierID ) from Products
select productID,  CategoryID, convert ( int, CategoryID) from Products
select OrderID,  CustomerID, convert (int, CustomerID) from Orders
select OrderID,  ShipperID, convert (int, ShipperID) from Orders
select OrderID,  EmployeeID, convert (int, EmployeeID) from Orders
select OrderDetailID,  OrderID, convert (int, OrderID) from Orderdetails
select   CustomerID, convert (int, CustomerID) from Customers

--- 
-- Foreign Keys
alter table Orders --table name
add constraint CustomerID  -- the column in that table that is a foreign key
foreign key (CustomerID)  -- again the same column name
references Customers (CustomerID) --table and column name to which it links

alter table Orders add constraint ShipperID foreign key (ShipperID) references Shippers (ShipperID) 
alter table Orders add constraint EmployeeID foreign key (EmployeeID) references Employees (EmployeeID) 
alter table OrderDetails add constraint OrderID foreign key (OrderID ) references Orders (OrderID ) 
alter table OrderDetails add constraint ProductID foreign key (ProductID) references Products(ProductID) 
alter table Products add constraint CategoryID  foreign key (CategoryID  ) references Categories (CategoryID  ) 
alter table Products add constraint SupplierID  foreign key (SupplierID ) references Suppliers(SupplierID ) 
 end

 create procedure aFixTheRest (
  @eid int
  ) 
as 
begin

	UPDATE Categories set CategoryName= replace (CategoryName,' ', '' );

	UPDATE Suppliers set SupplierName = replace (SupplierName,' ', '' )
					, contactname = replace (contactname,' ', '' )
					, city = replace (city,' ', '' )
					, country = replace (country ,' ', '' );

	UPDATE Products	set ProductName = replace (ProductName,' ', '' )
					, unit = replace (unit,' ', '' );

	
	UPDATE Customers set CustomerName = replace (CustomerName,' ', '' )
					, contactname = replace (contactname,' ', '' )
					, city = replace (city,' ', '' )
					, country = replace (country ,' ', '' );

	UPDATE Shippers set ShipperName = replace (ShipperName,' ', '' )
					, Phone = replace (Phone,' ', '' );


	UPDATE Employees set FirstName = replace (FirstName,' ', '' )
					, LastName = replace (LastName,' ', '' );
 

end 

 create procedure aFixTheNumbersDates (
  @eid int
  ) 
as 
begin
	UPDATE Products	set price = replace (price,' ', '' );
	Alter Table  Products		alter column price float ;	

	UPDATE Orderdetails	set quantity = replace (quantity ,' ', '' );	
	Alter Table  Orderdetails	alter column quantity float ;	

	UPDATE Orders		set orderdate = replace (OrderDate,' ', '' );
	Alter Table  orders alter column orderdate datetime;	
	
	UPDATE Employees		set BirthDate = replace (BirthDate,' ', '' );	
	Alter Table  Employees	alter column Birthdate datetime ;	

end 

 create procedure aFixDropConstraints (
  @eid int
  ) 
as 
begin
	Alter Table  Products		drop constraint chk_Price;
end


exec aFixPrimaryLeys 1
exec aFixForeignKeys 2
exec aFixTheRest 1
exec aFixTheNumbersDates 1
exec aFixDropConstraints 1
 


exec cons 'a'

 



SELECT 
    CASE WHEN 
        ISNUMERIC(PostalCode) > 0
    THEN CAST(PostalCode AS INT) 
    ELSE 0 END
FROM SalesLT.Address




CONVERT(float, 'test')



