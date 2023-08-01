/*Выведите названия уникальных категорий, которые были куплены в чеке с id = 3.*/
SELECT *FROM positions;
SELECT *FROM products;

SELECT DISTINCT products.category
FROM products
INNER JOIN positions
ON products.art = positions.art
WHERE positions.id_check = 3;

/*Выведите артикулы продуктов, которые не покупали (т. е. они не встречаются ни в одном чеке).*/
SELECT products.art
FROM products
LEFT JOIN positions
ON products.art = positions.art
WHERE positions.id_check IS NULL;

/*Посчитайте количество чеков, в которых куплено больше двух пар одинаковой обуви.*/
SELECT *FROM positions;
SELECT *FROM products;

SELECT COUNT(*)id_check  
FROM positions
INNER JOIN ( 
	SELECT art,
	       product
	FROM products
	WHERE category = 'обувь'	
)products
ON products.art = positions.art
WHERE positions.quantity > 2;
   
--По доп заданию 3 можно было без подзапроса:
SELECT COUNT(DISTINCT ps.id_check) as kol_vo_chekov
FROM Positions ps
JOIN Products p on ps.art = p.art 
WHERE p.category = 'обувь' and ps.quantity > 2;

/*Посчитайте количество чеков, в которых куплено больше двух позиций любой одежды.*/  
SELECT *FROM positions;
SELECT *FROM products;

SELECT COUNT(DISTINCT id_check) 
FROM positions
INNER JOIN ( 
	SELECT art,
	       product
    FROM products 
    WHERE category = 'одежда'
) products
ON products.art = positions.art
WHERE positions.id_check >2;
-- правильный ответ 
SELECT count(*)
FROM (SELECT positions.id_check
      FROM products 
	  JOIN positions 
	  ON positions.art=products.art
      WHERE products.category = 'одежда'
      GROUP BY positions.id_check
      HAVING SUM(positions.quantity)>2) as t;