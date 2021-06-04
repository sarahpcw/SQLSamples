describe the difference between:
identity
newid()
newsequentialid ()

give an example of how to use it:
create table idstable (
id1 ... -- use identity
id2 ... -- use newid()
id3 ... -- use newqequentialid()
name nvarchar(10) )

insert into ( id2, name ) values (.... )
