 begin
	if ( datepart(month, getdate())  =8 ) 
	begin
		select ' happy birth day ' 
	end 
	else
	begin
		select ' lksdfjsl ' 
	end
	select * from employees where datepart(month, birthdate)= 8
end

declare @count int = 0
while (@count<10)
begin
	set @count = @count + 1
	if (@count<5)
	begin
		select @count as Counter
		continue
	end
	else
		break
end