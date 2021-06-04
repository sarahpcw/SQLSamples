create table dbo.address
(
addressID int not null identity(1,1),
streetaddress varchar(125) not null,
streetaddress2 varchar(75) not null,
city varchar(100) not null,
state char(2) not null,
employeeID int not null
)
