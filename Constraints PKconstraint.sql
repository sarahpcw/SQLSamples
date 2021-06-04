-- calculated column 
-- can only be used before data is added to the table, to avoid that existing data contradicts this rulw\
alter table dbo.employees
add fullname4 as  [LastName]+', '[FirstName];

--primary key constraint
alter table dbo.address
add constraint addressid_PK  -- constraint name
Primary key (addressid)

-- The foreign key Constraint
-- checks that a value inserted into this field is already on the other table
ALTER TABLE   dbo.address
ADD CONSTRAINT employeeid_fk
foreign key (employeeid) references employees (employeeid)

-- The Default Constraint
-- When adding records, If I dont specify a value for this field, it will give me the default automatically
alter table dbo.address
add constraint city_default -- constraint name
default ('London') for city

--The check  Constraint
-- makes sure that values inserted into this field adheres to this rule
ALTER TABLE   dbo.address
ADD CONSTRAINT gender_chk  -- constraint name
CHECK (gender ='a' or gender ='m')

-- The unique Constraint
ALTER TABLE   dbo.address
ADD CONSTRAINT email_unique -- constraint name 
unique (emailaddress)



