Page 365 - 375

https://docs.microsoft.com/en-us/previous-versions/sql/sql-server-2008-r2/ms182804%28v%3dsql.105%29

http://www.sqlservercentral.com/blogs/querying-microsoft-sql-server/2013/09/02/sending-mail-using-sql-server-express-edition/

use msdb;
-- create mail profile
EXECUTE msdb.dbo.sysmail_add_profile_sp
@profile_name = 'MailTest1',
@description = 'Profile used to send mail'

-- Creates a new Database Mail account holding information about an SMTP account.
EXECUTE msdb.dbo.sysmail_add_account_sp
@account_name = 'MailTest1',
@description = 'Sent Mail using MSDB',
@email_address = 'pcworkshopslondon@gmail.com',
@display_name = 'umashankar',
@username='pcworkshopslondon@gmail.com',
@password='Sarah123ddy*', 
@mailserver_name = 'smtpout.europe.secureserver.net'


-- Adds a Database Mail account to a Database Mail profile. 
-- Execute sysmail_add_profileaccount_sp after a Database Account 
-- is created with sysmail_add_account_sp (Transact-SQL)
-- , and a Database Profile is created with sysmail_add_profile_sp (Transact-SQL).
EXECUTE msdb.dbo.sysmail_add_profileaccount_sp
@profile_name = 'MailTest1',
@account_name = 'MailTest1',
@sequence_number = 1   -- ??? sequence number from a sequence to for logging



EXECUTE msdb.dbo.sysmail_add_principalprofile_sp   -- Grants permission for a database user or role to use a Database Mail profile.
@profile_name = 'MailTest1',
@principal_name = 'public',
@is_default = 1 ;


SELECT *FROM msdb.dbo.sysmail_account
SELECT *FROM msdb.dbo.sysmail_configuration
SELECT *FROM msdb.dbo.sysmail_principalprofile
SELECT *FROM msdb.dbo.sysmail_profile
SELECT *FROM msdb.dbo.sysmail_profileaccount
SELECT *FROM msdb.dbo.sysmail_profileaccount

-- sending the email
exec msdb.dbo.sp_send_dbmail @profile_name = 'MailTest'
, @recipients = 'pcworkshopslondon@gmail.com'
, @subject = 'Mail Test1'
, @body = 'Mail Sent Successfully'
, @body_format = 'text'


-- amend properties so that the email can go
sp_configure 'show advanced options', 1;
GO
RECONFIGURE;
GO
sp_configure 'Database Mail XPs', 1;
GO
RECONFIGURE


-- sending the email
exec msdb.dbo.sp_send_dbmail @profile_name = 'MailTest'
, @recipients = 'pcworkshopslondon@gmail.com'
, @subject = 'Mail Test'
, @body = 'Mail Sent Successfully'
, @body_format = 'text'
GO

