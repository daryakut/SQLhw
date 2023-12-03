use hwsales;

-- Task one : 
-- Написать запрос, который выберет марку, год и прайс для каждой продажи(каждой sale_id)

SELECT
  p.productname,
  s.year,
  s.price
FROM Sales s
JOIN Product p ON s.productid = p.productid;


-- Task two :
-- Вывести количесто всего проданного по продукт id
-- Вид результата :

SELECT
  productid,
  SUM(quantity) AS totalquantity
FROM
  Sales
GROUP BY
  1;
  
-- Task three :
-- Количесто всего проданного по продукт id каждый год 
SELECT
  productid,
  year,
  SUM(quantity) AS totalquantity
FROM
  Sales
GROUP BY
  1, 2;
  
  
--   Task four:
-- Количесто всего проданного в каждый год по продукт ид
SELECT
  year,
  productid,
  SUM(quantity) AS totalquantity
FROM
  Sales
GROUP BY
  1, 2;


-- Task 5 
-- Вывести для каждого продукта его первую продажу


select 
productid, 
year, 
quantity, 
price 
from Sales 
where saleId in (
				SELECT
				  MIN(s.saleid)
				FROM
				  Sales s
				GROUP BY
				  productid
				);
