-- page 117 snapshots
use northwind
create database dbssnapshot 
on (
name = northwind,
filename = 'C:\Program Files\Microsoft SQL Server\MSSQL12.STUART\MSSQL\DATA\nws.ss'
) as snapshot of northwind

use master
drop database dbssnapshot 

use master
restore database northwind from database_snapshot ='dbssnapshot'