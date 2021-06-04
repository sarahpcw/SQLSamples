create database Billing

create table products
(productid int not null,
productname nvarchar (255) Null,
supplierid int null,
categoryid int null,
unit nvarchar (255) null,
price int null)


create table categories
(categoryid int not null,
categoryname nvarchar (255) not null,
description nvarchar (255) null)


Alter table products
add constraint PK_Productid
primary key (productid)


Alter table categories
add constraint PK_categoryid
primary key (categoryid)


alter table products 
add constraint FK_Categoryid
foreign key (categoryid)
references categories (categoryid)

alter table categories
add constraint U_categoryname
unique (categoryname)

alter table products
alter column price float

Alter table products
add constraint D_price
default 7.50 for price


Alter table products
add constraint chk_price
check (price>= 0)

insert into products (productid,productname,categoryid)
values (3, 'Product 3', 1)

insert into categories (categoryid, categoryname)
values (1,'beverages')

insert into categories (categoryid, categoryname)
values (next value for categoryid_seq2,'sour')

select * from products

create table y
(
id int identity(101,1) PRIMARY KEY NOT NULL,
name varchar (20))

Insert into y (name) 
values ('Beta')

select * from y

create sequence categoryid_seq2
as integer 
start with 5
increment by 1
minvalue 5
maxvalue 99

select * from categories

create index index_productname
on products (productname)

select productid, productname from products
where productname like 'p%'

drop index index_productname on products

alter table products
drop constraint chk_price

create table #y
(
id int identity(101,1) PRIMARY KEY NOT NULL,
name varchar (20))

select * from #y

insert into ##y 
(name)
values ('gana')

create table ##y
(
id int identity(101,1) PRIMARY KEY NOT NULL,
name varchar (20))
