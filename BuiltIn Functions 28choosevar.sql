select 
	firstname,
	month(birthdate) as month,
	choose (month(birthdate), 'cake', ' movie ticket' , 'argos voucher', 'flowers','holiday','holiday','holiday','holiday','holiday','holiday','holiday','holiday' ) as 'birthday present'

from employees
WHERE datename(month,birthdate) =@choosevar
or datename(month,birthdate) =@choosevar1
or datename(month,birthdate) =@choosevar2



ORDER BY month(birthdate)
--where month(birthdate) in ( 1,2,3, 4 )
 
