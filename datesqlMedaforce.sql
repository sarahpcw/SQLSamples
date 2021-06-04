With CTE1 (strdate, slash1, slash2 )   --Column names for CTE, which are optional
AS
(	select '12/31/2019'
		, charindex ( '/','12/31/2019')
		, charindex ( '/','12/31/2019', charindex ( '/','12/31/2019')+1 )
)
SELECT 
	SUBSTRING(strdate, slash1+1, slash2-slash1-1) 
	+'/'+ left ( strdate, slash1-1) 
	+'/'+ right ( strdate, 4 ) as newdate
from cte1

