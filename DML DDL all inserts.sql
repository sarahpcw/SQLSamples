-- simple insert
insert into shippers(shipperID, ShipperName, Phone)
values	(15, 'Mr deliveroo', '(0202) 555'),
		(16, 'Mr shipper', '(0202) 3456')

select *
from shippers

-- insert with output ( shows what is inserted while inserting
insert into shippers(shipperID, ShipperName, Phone)
output inserted.shipperID, inserted.ShipperName, inserted.Phone
values	(151, 'Mr deliveroo', '(0202) 555'),
		(161, 'Mr shipper', '(0202) 3456')

-- insert into an EXISTING TABLE from, getting the records from another table with select
insert into shippers(shipperid,shippername, phone)
select customerid,customername, address
		from customers
		where customerid between '80' and '83'

-- insert into an EXISTING TABLE from, getting the records from another table with select ( Accross different database )
insert into employees(EmployeeID,BirthDate, notes)
select [BusinessEntityID]
		, [BirthDate]
		, [MaritalStatus]
from [AdventureWorks2014].[HumanResources].[Employee] 
where [BusinessEntityID] between 11 and 19

select *
from employees
where EmployeeID between 10 and 25


-- insert and create a new table
select *
into shippersnew1
from shippers where shipperID > '2'

select ShipperID, ShipperName
into shippersnew2
from shippers where shipperID > '2'

 
-- insert with sequence
create sequence ShipSeq
as int
start with 200
increment by  1

insert into shippers(shipperID, ShipperName, Phone)
values	(next value for ShipSeq, 'Mr JustEat', '(0202) 555'),
		(next value for ShipSeq, 'Mr DeliveryHero', '(0202) 3456')

insert into shippers(shipperid,shippername, phone)
select next value for ShipSeq, customername, address
		from customers
		where customerid between '80' and '83'


