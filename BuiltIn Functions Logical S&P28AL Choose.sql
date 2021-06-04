USE [db1]
GO

/****** Object:  StoredProcedure [dbo].[PROCEX]    Script Date: 4/28/2018 10:31:13 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[PROCEX] AS
BEGIN

select 
	firstname,
	month(birthdate) as month,
	choose(month(birthdate),  'cake', ' movie ticket' , 'argos voucher', 'flowers','holiday','holiday','holiday','holiday','holiday','holiday','holiday','holiday' ) as 'birthday present'
from employees
ORDER BY month(birthdate)
--where month(birthdate) in ( 1,2,3, 4 )
END
GO


