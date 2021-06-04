
-- index of waits -- https://www.sqlskills.com/help/waits/#r
-- Tutorial:  1 dmv per day : -- https://www.sqlservergeeks.com/sys-dm_exec_sql_text/

-- page 389 - shows which waits are most common
--Common SQL Server Wait Types. By: In SQL Server, wait types represent the discrete steps in query processing, 
--where a query waits for resources as the instance completes the request.
select top 10 wait_type
, wait_time_ms
, Percentage = 100. * wait_time_ms / sum (wait_time_ms) over ()
from sys.dm_os_wait_stats wt
where wt.wait_type NOT LIKE '%SLEEP%'
order by Percentage desc

use northwind
CREATE INDEX index_name
   ON categories ( categoryname);

use northwind
drop INDEX index_name
   ON categories 


select wt.session_id
,  wt.wait_type
,  er.wait_resource
,  wt.wait_duration_ms
,  st.text
,  er.start_time
from sys.dm_os_waiting_tasks wt  -- this is a dmv dynamic management view
inner join sys.dm_exec_requests as er -- -- this is a dmv dynamic management view
on wt.waiting_task_address = er.task_address
outer apply sys.dm_exec_sql_text (er.sql_handle) st
--where wt.session_id >= 50 
--and wt.wait_type Not Like '%SLEEP%'
order by wt.wait_duration_ms desc

--1. CROSS APPLY acts as INNER JOIN
--   , returns only rows from the outer table that produce a result set from the table-valued function. 
--2. OUTER APPLY acts as OUTER JOIN , ie. left or right join
--	, returns both rows that produce a result set, and rows that do not
--	, with NULL values in the columns produced by the table-valued function.

select * from 
  sys.dm_os_waiting_tasks wt 

-- pg 390
 select * 
 from sys.dm_server_services  -- handy to know account name and it's file name, start up time etc


 -- pg 391 top 
 -- info about physical space used
 use northwind;
 select df.physical_name 
 , vs.file_id 
 , vs.file_system_type
 , total_bytes  -- the book says mb not bytes
 , available_bytes
 from sys.database_files df
 cross apply sys.dm_os_volume_stats (db_id(), df.file_id) vs;  


-- pg 391 memory usage
select * 
from 
sys.dm_os_sys_memory

select total_physical_memory_kb, available_physical_memory_kb
from 
sys.dm_os_sys_memory

-- pg 391
-- data on current sessions -- info about current queries
select * 
from 
sys.dm_exec_sessions s
left join sys.dm_exec_requests r on r.session_id = s.session_id

select s.*, r.*
from 
sys.dm_exec_sessions s
left join sys.dm_exec_requests r on r.session_id = s.session_id
where s.session_id >= 50  -- look only at id's of s.

--substring(expression, start, length ) 

-- pg 392 info aboutwhich requests are genrating a wait
select s.*, r.*
, offsettext =  Case
					when R.statement_start_offset = 0 AND r.statement_end_offset = 0
					then '' 
					--else substring ( est.[text]
					--				, r.statement_start_offset/2 + 1 
					--				,	Case
					--						when r.statement_end_offset = -1
					--						then len ( convert ( nvarchar(max) , est[text] ) ) 
					--						else r.statement_end_offset/2 - r.statement_start_offset/2 + 1
					--					end 	) 	
					end 
from 
sys.dm_exec_sessions s
left join sys.dm_exec_requests r on r.session_id = s.session_id
outer apply sys.dm_exec_sql_text (r.sql_handle) est


select est.[text]
from 
sys.dm_exec_sessions s
left join sys.dm_exec_requests r on r.session_id = s.session_id

-- pg 392
-- info about excution plans
select top 50 * 
from
( select * 
--,	row_number () over (order by stat.total_worker_time DESC) as CPURank
--,	row_number () over (order by stat.total_physical_reads  DESC) as PhysicalReadsRank
--,	row_number () over (order by stat.total_elapsed_time  DESC) as DurationRank 
	from sys.dm_exec_query_stats ) as PlanStats

inner join sys.dm_exec_cached_plans p on p.plan_handle = PlanStats.plan_handle
outer apply sys.dm_exec_plan_attributes(p.plan_handle) pa
outer apply sys.dm_exec_sql_text(p.plan_handle) sql
outer apply sys.dm_exec_query_plan(p.plan_handle) qp
--where pa.attribute = 'dbid'
