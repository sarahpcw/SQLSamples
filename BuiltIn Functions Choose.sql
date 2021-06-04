declare @choosevar int =1
select 
	firstname,
	month(birthdate) as month,
	choose(month(birthdate),  'cake', ' movie ticket' , 'argos voucher', 'flowers','holiday','holiday','holiday','holiday','holiday','holiday','holiday','holiday' ) as 'birthday present',
	CASE 
		WHEN month(birthdate)=1 OR month(birthdate)=6  THEN  'cake'
		WHEN month(birthdate)=2 OR month(birthdate)= 7 THEN  ' movie ticket'
		WHEN month(birthdate)=3 THEN  'argos voucher'
		WHEN month(birthdate)=4 THEN   'flowers'
		ELSE 'holiday'
	END  as 'birthday present 2'
from employees
ORDER BY month(birthdate)
--where month(birthdate) in ( 1,2,3, 4 )