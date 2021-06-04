--select * from sys.databases

--     @job_name = N'NightlyBackups',
-- create a job
USE msdb ;  
GO  
EXEC msdb.dbo.sp_add_job    -- Adds a new job executed by the SQLServerAgent service.
    @job_name = N'Weekly Sales Data Backup 1' ;  
GO  
EXEC sp_add_jobstep  -- Adds a step (operation) to a job.
    @job_name = N'Weekly Sales Data Backup 1',    -- required
    @step_name = N'Set database to read only 2'	  -- required
   --@subsystem = N'TSQL',  
   --@command = N'ALTER DATABASE SALES SET READ_ONLY',   
   --@retry_attempts = 5,  
   --@retry_interval = 5 ;  
GO  
EXEC dbo.sp_add_schedule    -- Creates a schedule that can be used by any number of jobs.
    @schedule_name = N'RunOnce',  
    @freq_type = 1,  
    @active_start_time = 233000 ;  
USE msdb ;  
GO  
EXEC sp_attach_schedule    -- Sets a schedule for a job.
   @job_name = N'Weekly Sales Data Backup 1',  
   @schedule_name = N'RunOnce';  
GO  
EXEC dbo.sp_add_jobserver   -- Targets the specified job at the specified server.  
    @job_name = N'Weekly Sales Data Backup';  
GO 
-- another job @job_name = N'NightlyBackups',
USE msdb ;  
GO  
EXEC dbo.sp_add_job  
   @job_name = N'NightlyBackups 1';  
GO  
EXEC sp_add_jobstep  
    @job_name = N'NightlyBackups 1',  
    @step_name = N'Set database to read only 1',  
    @subsystem = N'TSQL',  
    @command = N'ALTER DATABASE SALES SET READ_ONLY',   
    @retry_attempts = 5,  
    @retry_interval = 5 ;  
GO  
EXEC dbo.sp_add_schedule  
    @schedule_name = N'RunOnces',  
    @freq_type = 1,  
    @active_start_time = 233000 ;  
USE msdb ;  
GO  
EXEC sp_attach_schedule  
   @job_name = N'NightlyBackups 1',
   @schedule_name = N'RunOnce';  
GO  
EXEC dbo.sp_add_jobserver  
    @job_name = N'NightlyBackups 1';
GO 



-- assiging people Ownership  to the job
USE msdb ;  
GO  
EXEC dbo.sp_manage_jobs_by_login  
    @action = N'REASSIGN',  
    @current_owner_login_name = N'u',  
    @new_owner_login_name = N'fran??oisa' ;  
GO  



-- creates a local job category named AdminJobs  
USE msdb ;  
GO  
EXEC dbo.sp_add_category  
    @class=N'JOB',  
    @type=N'LOCAL',  
    @name=N'AdminJobs' ;  
	 
GO  




-- deletes the job category named AdminJobs.  
USE msdb ;  
GO   
EXEC dbo.sp_delete_category  
    @name = N'AdminJobs',  
    @class = N'JOB' ;  
GO  


--o assign a job to a job category
--In Object Explorer, connect to an instance of Database Engine. 
--On the Standard bar, click New Query. 
--Copy and paste the following example into the query window and click Execute. 
-- adding a new job category to the "NightlyBackups" job  
USE msdb ;  
GO  
EXEC dbo.sp_update_job  
    @job_name = N'NightlyBackups 1',  
    @category_name = N'[Uncategorized (Local)]';  
GO  


-- adding a new job category to the "NightlyBackups" job  
USE msdb ;  
GO  
EXEC dbo.sp_update_job  
    @job_name = N'NightlyBackups 1',  
    @category_name = N'[Uncategorized (Local)]';  
GO  




 -- list job category information
 -- returns information about jobs that are administered locally  
USE msdb ;  
GO  
EXEC dbo.sp_help_category  
    @type = N'LOCAL' ;  
GO 




-- creates a job step that uses CmdExec  
USE msdb;  
GO  
EXEC sp_add_jobstep  
    @job_name = N'Weekly Sales Data Backup',  
    @step_name = N'Set database to read only',  
    @subsystem = N'CMDEXEC',  
    @command = 'C:\clickme_scripts\SQL11\PostBOLReorg GetHsX.exe',
    @retry_attempts = 5,  
    @retry_interval = 5 ;  
GO  


--to change the membership of a job category
--In Object Explorer, connect to an instance of Database Engine. 
--On the Standard bar, click New Query. 
--Copy and paste the following example into the query window and click Execute. 
-- adding a new job category to the "NightlyBackups" job  
USE msdb ;  
GO  
EXEC dbo.sp_update_job  
    @job_name = N'NightlyBackups',  
    @category_name = N'[Uncategorized (Local)]';  
GO  

 
-- To start a job named Weekly Sales Data Backup.    
USE msdb ;  
GO  
EXEC dbo.sp_start_job N'Weekly Sales Data Backup' ;  
GO 

-- stops a job named Weekly Sales Data Backup  
USE msdb ;  
GO  
EXEC dbo.sp_stop_job  
    N'Weekly Sales Data Backup' ;  
GO   



-- changes the name, description, and enables status of the job NightlyBackups.  
USE msdb ;  
GO  
EXEC dbo.sp_update_job  
    @job_name = N'NightlyBackups',  
    @new_name = N'NightlyBackups -- Disabled',  
    @description = N'Nightly backups disabled during server migration.',  
    @enabled = 1 ;  
GO  


-- notify the operator of a job]
-- adds an e-mail notification for the specified alert (Test Alert).  
-- This example assumes that Test Alert already exists and that Fran??ois Ajenstat is a valid operator name.  
USE msdb ;  
GO  
EXEC dbo.sp_add_notification   
@alert_name = N'Test Alert',   
@operator_name = N'Fran??ois Ajenstat',   
@notification_method = 1 ;  
GO  

-- job job activity
-- lists activity for all jobs that the current user has permission to view.  
USE msdb ;  
GO  
EXEC dbo.sp_help_jobactivity ;  
GO  