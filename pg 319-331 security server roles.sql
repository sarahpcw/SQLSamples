--CREATE LOGIN [domain_name\login_name] 
--FROM WINDOWS
--[ WITH DEFAULT_DATABASE = database_name
--| DEFAULT_LANGUAGE = language_name ];

use master
go
create login [WORKGROUP\LAPTOP-JUGCR8PQ\u2]
from windows with default_database = master

use master
go 
alter server role sysadmin 
add member [WORKGROUP\LAPTOP-JUGCR8PQ\u2]


use master
go
create login [u2]
with PASSWORD = N'u2'
	MUST_CHANGE ,
	DEFAULT_DATABASE = [master],
	CHECK_EXPIRATION = ON,
	CHECK_POLICY = ON
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [u2]
go




use master
go

create server role [BulkAdminAndDBCreator]
go
alter server role  [BulkAdminAndDBCreator] add member [WORKGROUP\LAPTOP-JUGCR8PQ\u]
go

use master 
go
grant ADMINISTER BULK OPERATIONS to [BulkAdminAndDBCreator] 
go

use master 
go
grant CREATE ANY DATABASE to [BulkAdminAndDBCreator] 
go


