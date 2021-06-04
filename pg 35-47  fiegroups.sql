-- list all datbases on the instance
select * from sys.master_files
select name, database_id, size , max_size , growth, physical_name from sys.master_files

-- create template tables on the model database
create table testmodel (tm_id int)

create table testmodel2 (tm_id2 int)

create database newTestModel2

-- create a database with primary filegroup , mdf and log file
use master ;
Create database sbschp4tsql
on primary 
(
	name = 'sbschp4tsql'
	, filename = 'C:\Program Files\Microsoft SQL Server\MSSQL12.STUART\MSSQL\DATA\sbschp4tsql.mdf'
	, size=10mb
	, maxsize = 20
	, filegrowth =10%  
)
log on
(
	name = 'sbschp4tsql_log'
	, filename = 'C:\Program Files\Microsoft SQL Server\MSSQL12.STUART\MSSQL\DATA\sbschp4tsql_log.ldf' 
	, size=10mb
	, maxsize =200 
	, filegrowth = 10%
)

-- create secondary filegroup
use master ;

alter database sbschp4tsql
	add filegroup sbstsqlgroup1;
alter database sbschp4tsql
	add file (
		name = 'sbschp4tsql2'
		, filename = 'C:\Program Files\Microsoft SQL Server\MSSQL12.STUART\MSSQL\DATA\sbschp4tsql2.ndf'
		, size=10mb
		, maxsize = 20
		, filegrowth =10%  
	) to filegroup sbstsqlgroup1;

-- detach from server instance
	use master;
	exec sp_detach_db @dbname = 'sbschp4tsql'
--attach
	use master;
	exec sp_attach_db @dbname  = 'sbschp4tsql', @filename1 = 'sbschp4tsql'
-- attach -- re-attach to server instance
	use master ;
	create database db3 on 
	(   name = 'fn1'
		, filename = 'C:\Program Files\Microsoft SQL Server\MSSQL12.STUART\MSSQL\DATA\fn1.mdf'
	 ),
	(   name =  'fn2'
		, filename = 'C:\Program Files\Microsoft SQL Server\MSSQL12.STUART\MSSQL\DATA\fn2.ldf'
	),
	(	name = 'fn3'
		, filename = 'C:\Program Files\Microsoft SQL Server\MSSQL12.STUART\MSSQL\DATA\fn3.ndf'
	)


