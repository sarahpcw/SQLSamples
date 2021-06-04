-- try , result an error , the catch block suppresses error behavious
begin  try  
	select 1/0
end try
begin  catch
	-- select 'hello world'
end catch

-- try , result an error , the catch block prints
begin  try
	select 1/0
end try
begin  catch
	select 'hello world'
end catch
-- the catch block throw will print error message
begin  try
	select 1/0
end try
begin  catch
	throw;
end catch
-- the catch block throw will print error message and custom error messages
begin  try
	select 1/0
end try
begin  catch
	throw 51001, 'zero divide' , 1; -- 51001 is any what you make up
end catch
