/*Найдите учеников и все группы, в которых преподает учитель с почтой blanda.jamil@yahoo.com.*/
SELECT *FROM group_student;
SELECT *FROM teacher;

SELECT group_student.user_id,
       group_student.group_id
FROM group_student
INNER JOIN teacher
ON group_student.group_id = teacher.group_id
WHERE teacher.email = 'blanda.jamil@yahoo.com';

/*Выведите уровень ученика с почтой gpagac@jacobs.com.*/
SELECT *FROM student
SELECT *FROM users

SELECT student.level
FROM student
INNER JOIN users
ON student.user_id = users.user_id
WHERE users.user_email = 'gpagac@jacobs.com';

/*Выведите уникальные названия предметов, которые изучает ученик c user_id=11300 (таблицы user и subject).*/
SELECT *FROM subject
SELECT *FROM users

SELECT DISTINCT subject.subject_title        
FROM subject
INNER JOIN users
ON subject.subject_id = users.subject_id
WHERE users.user_id = 11300;

/*Выведите уникальные уровни учеников, которые занимаются в группе с id = 10.*/
SELECT *FROM group_student
SELECT *FROM student

SELECT DISTINCT student.level        
FROM student
INNER JOIN group_student
ON student.user_id = group_student.user_id
WHERE group_student.group_id = 10;








