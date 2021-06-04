use AdventureWorks2014
go
create role [DBControlTable_Reader] AUTHORIZATION [u2]
go

use AdventureWorks2014
go
alter role [DBControlTable_Reader] add member [u2]
go


use AdventureWorks2014
go
graNt SELECT  ON [dbo].[DatabaseLog] TO [DBControlTable_Reader]
go

use AdventureWorks2014
go
graNt SELECT  ON [dbo].[AWBuildVersion] TO [DBControlTable_Reader]
go

use AdventureWorks2014
go
graNt SELECT  ON [dbo].[ErrorLog] TO [DBControlTable_Reader]
go






