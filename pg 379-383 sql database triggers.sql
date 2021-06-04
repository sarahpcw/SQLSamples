create table dbo.tableaudits
(
UserName nvarchar(100),
Auditevent nvarchar(100),
TSQLStateent nvarchar(2000),
Auditdate datetime, 
myMessage nvarchar(100)
)
alter table dbo.tableaudits add myMessage nvarchar(100)


-- create a trigger to run when I alter ANY table on the database
if exists (select * from sys.triggers
	where parent_class = 0 and name = 'trAuditTableChanges')
drop trigger trAuditTableChanges
on database;
go;
alter trigger trAuditTableChanges
on database
for alter_table
as 
declare @data XML
set @data = EventData()
insert tableaudits (UserName, Auditevent , TSQLStateent , Auditdate , myMessage) 
values (getdate(),
		convert(nvarchar(100), current_user),
		@data.value('(/event_instance/eventtype)[1]', 'nvarchar(100)'),
		@data.value('(/event_instance/TSQLCommand)[1]', 'nvarchar(2000)'),
		'alter'
		);
GO;

-- create a trigger that will run when a table is created on the database
alter trigger trAuditTableChanges2
on database
for create_table
as 
declare @data XML
set @data = EventData()
insert tableaudits (UserName, Auditevent , TSQLStateent , Auditdate , myMessage ) 
values (getdate(),
		convert(nvarchar(100), current_user),
		@data.value('(/event_instance/eventtype)[1]', 'nvarchar(100)'),
		@data.value('(/event_instance/TSQLCommand)[1]', 'nvarchar(2000)'),
		'Create'
		);
GO;




create table newTable2 (
newT_Id int not null identity (1,1),
newT_name nvarchar(20)
)

alter table   newTable2
add  Age6 int

select * from [dbo].[tableaudits]

