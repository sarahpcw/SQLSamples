-- http://www.sql-server-helper.com/functions/system-functions/index.aspx

SELECT SESSION_USER;  -- Return the user name of the current user:

SELECT SESSIONPROPERTY('ANSI_NULLS') as sessionproperty  -- Return the session settings for a specified option:
, SESSIONPROPERTY('ANSI_PADDING') ansipadding
, SESSIONPROPERTY('ANSI_WARNINGS') ansiwarning
, SESSIONPROPERTY('ARITHABORT') arithabort
, SESSIONPROPERTY('CONCAT_NULL_YIELDS_NULL') concatnullyieldsnull
, SESSIONPROPERTY('NUMERIC_ROUNDABOUT') numericroundabout
, SESSIONPROPERTY('QUOTED_IDENTIFIER') quotedidentifier

SELECT SYSTEM_USER; -- login name of current user

SELECT USER_NAME(); -- Return the database user name (will return the current user since no id is specified):

select DATALENGTH ( 'var' )
select HOST_ID(), HOST_NAME()

select IDENT_CURRENT ( 'dbo.TestData2' ) -- eturns the last identity value generated for a specified table or view.  The last identity value generated can be for any session and any scope.

select * from dbo.TestData2
select ROWCOUNT_BIG()

declare   @id as int = 100
select * from dbo.TestData2 where id = @id
--select @@ROWCOUNT -- Returns the number of rows affected by the last statement.  If the number of rows is more than 2 billion, use ROWCOUNT_BIG.
if @@ROWCOUNT = 1 
	select concat ( 'the id ', cast (@id as varchar(10)), '  found')



/*
CONNECT
When a user connects to a database, the SQL session is initialized. 
The CONNECT command is used to establish a database connection. 
With the CONNECT command, you can either invoke a connection or 
change connections to the database. For example, if you are connected as 
USER1, you can use the CONNECT command to connect to the database as USER2. When this happens, 
the SQL session for USER1 is implicitly disconnected.

CONNECT user@database
When you attempt to connect to a database, you are automatically 
prompted for a password that is associated with your current username. 
The username is used to authenticate yourself to the database, and 
the password is the key that allows entrance.

DISCONNECT and EXIT
When a user disconnects from a database, 
the SQL session is terminated. 

The DISCONNECT command is used to disconnect a user from the database. 
When you disconnect from the database, the software you are using may 
still appear to be communicating with the database, but you have lost 
your connection. When you use EXIT to leave the database, 
your SQL session is terminated and the software that you are using 
to access the database is normally closed.
*/