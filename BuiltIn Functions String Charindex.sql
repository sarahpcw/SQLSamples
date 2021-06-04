select customername, city + ', ' + country, len(customername), address, CHARINDEX('sq',address)
from customers
where CHARINDEX('sq',address) >0