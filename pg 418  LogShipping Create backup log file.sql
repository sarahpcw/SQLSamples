USE MASTER
GO 
CREATE DATABASE [LSDemo]
go
alter database [LSDemo] set recovery full
go 




USE MASTER
GO
backup database LSDemo
to disk = 'c:\LSDemo\LSDemo.bak'


USE MASTER
GO
backup database [training]
to disk = 'c:\LSDemo\LSDemoTRAINING.bak'

USE MASTER
GO
backup database  [northwind]
to disk = 'c:\LSDemo\LSDemoNW.bak'



