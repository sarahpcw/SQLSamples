select productName, productID, price,
ROW_NUMBER() over (order by productName desc) AS rownumber,
rank() over (order by price desc) AS rank,
DENSE_RANK() over (order by price desc) AS DenseRank
from products
where price = 20
--order by ProductName


-- find prices that occur more than once , ie duplication on price
select price, count(price)
from products
group by price
having count(price) > 1

update products
set price = 20 
where price > 20 and price <=30