create table newTable4 (
newT_Id int not null identity (1,1),
newT_name nvarchar(20)
)

alter trigger newTriggerInsert
on newTable3
for insert  -- here I can also say after insert or istead of insert ( if instead of, this trigger will run and not the actual query) 
as 
begin
declare @id int
select @id = newT_Id from inserted ;
if ( @id > 1 )
	begin
		update newTable3
		set newT_name = 'new name '+convert(nvarchar(10), newT_Id)
		where newT_Id >1
		 
	end
end

alter table   newTable3
add  newT_event nvarchar(20)

insert into newTable3 (newT_name, newT_lastname)
values ('a','la')
update newTable3 set newT_name = 'a' where newT_ID = 1
select * from newTable3

-- update trigger
alter trigger newTriggerUpdate
on newTable3
for update  -- or after update
as 
begin
declare @id nvarchar(100);
select @id = newT_name from inserted ;
if ( @id = 'a' )
	begin
		update newTable3
		set newT_name = 'a'+ convert(nvarchar(10), newT_Id)
		where @id = 'a'
		 
	end
end

alter table   newTable3
add  newT_event nvarchar(20)

insert into newTable3 (newT_name, newT_lastname)
values ('a','la')

update newTable3 set newT_name = 'a' where newT_name = 'new name 2'
select * from newTable3

-- update triggers
on newTable3
for update  -- or after update
as 
begin
declare @id nvarchar(100);
select @id = newT_name from inserted ;
if ( @id = 'a' )
	begin
		update newTable3
		set newT_name = 'a'+ convert(nvarchar(10), newT_Id+1)
		where newT_name = 'a'  --refers to the new value
	end
end