--Задание 1
/*Составьте запрос, который выведет имя вида с наименьшим id. Результат будет соответствовать букве «М».*/
SELECT * FROM Species;

SELECT species_name
FROM Species
ORDER BY species_id ASC   -- Малыш = М
LIMIT 1;

/*Составьте запрос, который выведет имя вида с количеством представителей более 1800. 
Результат будет соответствовать букве «Б».*/
SELECT * FROM Species;

SELECT species_name
FROM Species                 -- Роза = Б
WHERE species_amount > 1800; 

/*Составьте запрос, который выведет имя вида, начинающегося на «п» и относящегося к типу с type_id = 5. 
Результат будет соответствовать букве «О».*/
SELECT * FROM Species;

SELECT species_name
FROM Species
WHERE (species_name LIKE 'п%') --Подсолнух = О
  AND (type_id = 5);
  
/*Составьте запрос, который выведет имя вида, заканчивающегося на «са» или количество представителей которого равно 5. 
Результат будет соответствовать букве В.*/  
SELECT * FROM Species;

SELECT species_name
FROM Species  
WHERE (species_name LIKE '%са') --Лиса = В
  OR (species_amount = 5);
-------------------------------------------------------------Задание 2
/*Составьте запрос, который выведет имя вида, появившегося на учете в 2023 году. 
Результат будет соответствовать букве «Ы».*/ 
SELECT * FROM Species;

SELECT species_name
FROM Species   
WHERE to_char(date_start,'YYYY') = '2023'; --Обезьяна = Ы

/*Составьте запрос, который выведет названия отсутствующего (status = absent) вида, расположенного вместе с place_id = 3. 
Результат будет соответствовать букве «С».*/ 
SELECT * FROM Species;
SELECT * FROM Species_in_places;

SELECT species_name
FROM Species
INNER JOIN (
	SELECT place_id,species_id    --Яблоко = С
	FROM Species_in_places
	WHERE place_id = 3
)Species_in_places
ON Species.species_id = Species_in_places.species_id
WHERE species_status = 'absent';

/*Составьте запрос, который выведет название вида, расположенного в доме и появившегося в мае, 
а также и количество представителей вида. Название вида будет соответствовать букве «П».*/ 
SELECT * FROM Species;
SELECT * FROM Places;
SELECT * FROM Species_in_places;

SELECT species_name AS name,
       species_amount AS amount
FROM Species
INNER JOIN (
             SELECT species_id
             FROM Species_in_places as sp
             INNER JOIN(
		                SELECT place_id                          --Собака = П
		                FROM Places as p 
		                WHERE place_name = 'дом'
		               )p 
             ON sp.place_id = p.place_id
	       )sp 
ON sp.species_id = Species.species_id
WHERE to_char(date_start,'MM') = '05';

/*Составьте запрос, который выведет название вида, состоящего из двух слов (содержит пробел). 
Результат будет соответствовать знаку !.*/ 
SELECT * FROM Species;

SELECT species_name AS name   --Голубая рыба = !
FROM Species
WHERE species_name LIKE '% %';

----------------------------------------------------------------------- Задание 3
/*Составьте запрос, который выведет имя вида, появившегося с малышом в один день. 
Результат будет соответствовать букве «Ч».*/ 
SELECT * FROM Species;
   
SELECT species_name AS name
FROM Species
WHERE species_name <> 'малыш'          --Кошка - Ч
   AND date_start IN (
	   SELECT date_start 
	   FROM Species 
	   WHERE species_name = 'малыш');


/*Составьте запрос, который выведет название вида, расположенного в здании с наибольшей площадью.
Результат будет соответствовать букве «Ж».*/ 
SELECT * FROM Species;
SELECT * FROM Places;
SELECT * FROM Species_in_places;

SELECT species_name
FROM Species
INNER JOIN (
	SELECT species_id
    FROM Species_in_places AS sp    --Лошадь = Ж
    INNER JOIN (
	   SELECT place_id
       FROM Places
       ORDER BY place_size DESC
       LIMIT 1 OFFSET 1
)Places
ON Places.place_id = sp.place_id
)sp
ON sp.species_id = Species.species_id;

/*Составьте запрос/запросы, которые найдут название вида, относящегося к 5-й по численности группе проживающей дома.
Результат будет соответствовать букве «Ш».*/ 
SELECT * FROM Species;
SELECT * FROM Places;
SELECT * FROM Species_in_places;

SELECT species_name
FROM Species
INNER JOIN(
	SELECT species_id
	FROM Species_in_places AS sp  --Попугай = Ш
	INNER JOIN (
		SELECT place_id
		FROM Places
		WHERE place_name = 'дом'
	)Places 
ON sp.place_id = Places.place_id
)sp
ON sp.species_id = Species.species_id
ORDER BY species_amount DESC
LIMIT 1 OFFSET 4; 

/*Составьте запрос, который выведет сказочный вид (статус fairy), не расположенный ни в одном месте.
Результат будет соответствовать букве «Т».*/ 
SELECT * FROM Species;
SELECT * FROM Places;
SELECT * FROM Species_in_places;

SELECT species_name
FROM Species
LEFT JOIN (
	SELECT place_id,species_id,
	RANK () OVER ( 
	   PARTITION BY place_id
	   ORDER BY species_id ASC  --Единорог = Т
	) rank_number 
FROM Species_in_places AS sp	
)sp
ON sp.species_id = Species.species_id
WHERE species_status  = 'fairy';
