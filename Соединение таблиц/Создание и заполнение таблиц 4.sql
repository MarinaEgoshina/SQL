--Создание таблиц:
CREATE TABLE Positions ( 
    id_check INTEGER,
    id_pos INTEGER,
	art VARCHAR,
	quantity numeric (10,2)
);

DROP TABLE Products

CREATE TABLE Products ( 
    art VARCHAR,
    product VARCHAR,
	category VARCHAR
);

--Заполнение таблиц: 
INSERT INTO Positions (id_check,id_pos,art,quantity)
VALUES (1,1,'A1',1),
       (1,2,'A4',3),
	   (1,3,'A2',2),
	   (1,4,'A10',1),
	   (1,15,'A8',4),
	   (2,1,'A5',1),
	   (2,2,'A7',1),
	   (2,3,'A3',2),
	   (3,1,'A2',1),
	   (3,2,'A9',1),
	   (3,3,'A5',2),
       (3,4,'A6',1),
	   (3,5,'A3',1),
	   (3,5,'A3',3),
	   (4,1,'A1',3),
	   (4,2,'A2',1),
	   (5,1,'A2',1),
	   (5,2,'A8',5),
	   (5,3,'A3',1),
	   (5,4,'A4',1),
	   (5,5,'A5',1);
	   
	   
	   
INSERT INTO Products (art,product,category)
VALUES ('art','product','category'),
       ('A1','кроссовки','обувь'),
	   ('A2','кеды','обувь'),
	   ('A3','сланцы','обувь'),
	   ('A4','куртка','одежда'),
	   ('A5','ветровка','одежда'),
	   ('A6','шорты','одежда'),
	   ('A7','палатка','туризм'),
	   ('A8','коврик','туризм'),
	   ('A9','спальник','туризм'),
	   ('A10','рюкзак','туризм'),
	   ('A11','туфли','обувь'),
	   ('A12','солнечные очки','аксессуары');
