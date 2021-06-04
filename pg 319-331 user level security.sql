use AdventureWorks2014
go
create user [u3] for login [u3]
with default_schema = [dbo]
go 

use AdventureWorks2014
go
grant delete on [dbo].[databaselog] to   [u2]
go 

use AdventureWorks2014
go
grant insert on [dbo].[databaselog] to   [u2]
go 

use AdventureWorks2014
go
grant select  on [dbo].[databaselog] to   [u2]
go 

use AdventureWorks2014
go
grant update  on [dbo].[databaselog] to   [u2]
go 



use AdventureWorks2014
go
grant delete on [dbo].[AWBuildversion] to   [u2]
go 

use AdventureWorks2014
go
grant insert on [dbo].[AWBuildversion] to   [u2]
go 

use AdventureWorks2014
go
grant select  on [dbo].[AWBuildversion] to   [u2]
go 

use AdventureWorks2014
go
grant update  on [dbo].[AWBuildversion] to   [u2]
go 



