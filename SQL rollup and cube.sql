Select city, country
	   ,count(customername)  as CustomerCount
from customers
where country = 'mexico' 
--and ( city like 'm%' or city like 'n%' )
-- group by country, city      
-- get count of country, city and count of 
group by rollup (country, city)
 -- get count of country, city and count of country and overall count
group by cube ( city, country)  
order by country, city
 -- get count of country, city AND count of country AND overall count AND count per city


update customers
set city = 'Albuquerque'
where city = 'lander'
