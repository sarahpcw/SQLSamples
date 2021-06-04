-- -- this is a dmv dynamic management view 
-- sys.dm_exec_requests		-- Returns information about each request that is executing within SQL Server.
-- sys.dm_exec_sql_text		-- shows only the most recent request from the session
-- sys.dm_os_wait_stats		-- shows the time for waits that have completed. 
							-- This dynamic management view does not show current waits. 
-- sys.dm_os_waiting_tasks	-- Returns information about the wait queue of tasks that are waiting on some resource.
							-- waiting_task_address varbinary(8) Address of the waiting task.
-- sys.database_files		-- Give file usage info and disk usage info 
							-- How to check the Database size , Log Size , Free Size in SQL 
-- sys.dm_os_volume_stats	--  This DMV is use full if you want to audit the configuration of your SQL Server.

-- sys.dm_server_services	-- handy to know account name and it's file name, start up time etc

-- sys.dm_os_sys_memory		-- Returns memory information from the operating system. SQL Server is bounded by
							-- , and responds to, external memory conditions at the operating system level 

-- sys.dm_exec_sessions		-- Use sys.dm_exec_sessions to first view the current system load and to identify a session of interest
							-- , and then learn more information about that session 

-- sys.dm_exec_requests		-- The following example queries sys.dm_exec_requests to find the interesting batch 
							-- and copy its transaction_id
							-- Sys.dm_exec_requests in combination with sys.dm_exec_sessions can be used to 
							-- troubleshoot other issues like blocking. 

-- sys.dm_exec_query_stats  -- sys.dm_exec_query_stats returns aggregated stats for plans, but with a row per query. 
							-- So if a procedure has 2 queries, then sys.dm_exec_query_stats would return 2 rows

-- sys.dm_exec_cached_plans -- 