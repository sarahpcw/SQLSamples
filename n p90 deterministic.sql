select rand(1759)
select newid()
select   ( BINARY_CHECKSUM(newid()) )
select   abs( BINARY_CHECKSUM(newid()) )
select   abs ( BINARY_CHECKSUM(newid()) ) % 10  -- gives a random number between 0 and 10
select   1 + abs ( BINARY_CHECKSUM(newid()) ) % 10 

select top 3 *
from employees 
order by checksum ( rand() )