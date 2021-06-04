EXEC sp_who2

-- find the f
use master
SELECT DEFAULT_DOMAIN() as [DomainName]

-- find the current user name
select user_name() as username, suser_sname() as suser, DEFAULT_DOMAIN() as [DomainName]    

SELECT HOST_NAME() AS HostName, SUSER_NAME() LoggedInUser