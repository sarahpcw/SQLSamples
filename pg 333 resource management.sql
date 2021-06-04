--Workload groups are a concept of the resource governor feature in SQL server.
-- You would define workload groups (such as a prod group and a test group) on a server 
--and then define the amount of resources that can be used by each.


--Resource pools. 
----A resource pool, represents the physical resources of the server. 
----You can think of a pool as a virtual SQL Server instance inside of a SQL Server instance. 
--Workload groups. 
----A workload group serves as a container for session requests that have similar classification criteria. 
----A workload allows for aggregate monitoring of the sessions, 
----and defines policies for the sessions.
---- Each workload group is in a resource pool.

--classification
----Scenario 2: There are two DBAs in one organization. 
----One DBA A runs critical queries for business and another DBA B is doing maintenance of the database. 
----At any point in time the DBA A’s work should not be affected but at the same time DBA B should be allowed to work as well. 
----The ideal situation is that 
----when DBA B starts working he get some resources but he can’t get more than defined resources.


--https://blog.sqlauthority.com/2012/06/04/sql-server-simple-example-to-configure-resource-governor-introduction-to-resource-governor/

-- see diagram : 
--https://docs.microsoft.com/en-us/sql/relational-databases/resource-governor/resource-governor?view=sql-server-2017

use master 
go
alter resource governor reconfigure
go

use master 
go
alter resource governor disable
go

use master 
go
alter resource pool [sbsPool] with (
min_cpu_percent = 20,
max_cpu_percent = 50,
min_memory_percent = 20,
max_memory_percent = 50)
go
alter resource governor reconfigure
go

use master 
go
create workload group sbsTSQLdefaults2
	using sbsPool
go
alter resource governor reconfigure
go

use master 
go
create workload group [sbsSSMSgroup2] with
( group_max_requests = 0,
	importance = Medium ,
	request_max_cpu_time_sec=50,
	request_max_memory_grant_percent=50,
	request_memory_grant_timeout_sec=0,
	max_dop = 0
	)
	using sbsPool
go
alter resource governor reconfigure
go


use master 
go
create function sbsClassifier2 ()
returns sysname with schemabinding
begin
	declare @Group sysname
	if(SUSER_SNAME()) ='u'
	begin 
		set @Group = 'sbsSSMSgroup'
	end
	return @Group
end
go

-- in another window:
use master 
go
alter resource governor with ( CLASSIFIER_FUNCTION=dbo.sbsClassifier )
alter resource governor reconfigure
go

-- testing the classifier function
use [master]
go
create login [u3]
	with PASSWORD=N'p1',
	DEFAULT_DATABASE = [AdventureWorks2014],
	check_expiration = OFF,
	check_policy = OFF 
go
use [AdventureWorks2014]
go
create user [u3] for login [u3]
go
use [AdventureWorks2014]
go
alter role [db_datareader] add member [u3]
-- the above creates a login and database user for adventureworks2014 that can read all content

-- in a new window: connect as this new user, and execute a normal select query
use [AdventureWorks2014]
select * from
[HumanResources].Department

-- return to te first query window , delete all the commands and do :
use [AdventureWorks2014]
select s.group_id
	, cast (g.name as nvarchar(20)) ResourceGroup 
	, s.session_id, s.login_name, s.login_time
	, cast (s.host_name as nvarchar(20)) Hostname
	, cast (s.program_name as nvarchar(20)) PrgramName
from sys.dm_exec_sessions s
inner join sys.dm_resource_governor_workload_groups g
	on s.group_id = g.group_id 
where g.name = 'sbsSSMSgroup'
order by g.name
go




 
