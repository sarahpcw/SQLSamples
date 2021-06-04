SELECT SESSION_USER as sessionuser
, SESSIONPROPERTY('ANSI_NULLS')  as session_property
, SYSTEM_USER as systemuser
, USER_NAME() as username; 
-- dbo	1	LAPTOP-JUGCR8PQ\u	dbo