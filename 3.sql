DROP DATABASE IF EXISTS seminar3;
CREATE DATABASE IF NOT EXISTS seminar3;
USE seminar3;
DROP TABLE IF EXISTS staff;
CREATE TABLE IF NOT EXISTS staff
(id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
firstname VARCHAR(30) NOT NULL,
lastname VARCHAR(30) NOT NULL,
post VARCHAR(30) NOT NULL,
seniority INT NOT NULL,
salary INT NOT NULL,
age INT NOT NULL);

INSERT INTO staff (firstname,lastname,post,seniority,salary,age)
VALUES

('Вася','Петров','Начальник',40,100000,60),
('Петр','Власов','Начальник',8,70000,30),
('Катя','Катина','Инженер',2,70000,25),
('Саша','Сасин','Инженер',12,50000,35),
('Иван','Иванов','Рабочий',40,30000,59),
('Петр','Петров','Рабочий',20,25000,40),
('Сидр','Сидоров','Рабочий',10,20000,35),
('Антон','Антонов','Рабочий',8,19000,28),
('Юрий','Юрков','Рабочий',5,15000,25),
('Максим','Максимов','Рабочий',2,11000,22),
('Юрий','Галкин','Рабочий',3,12000,24),
('Людмила','Маркина','Уборщик',10,10000,49);

-- задание 1
SELECT * FROM staff
ORDER BY salary;

SELECT * FROM staff
ORDER BY salary DESC;

-- задание 2
SELECT salary FROM staff
ORDER BY salary DESC
LIMIT 5;

-- задание 3
SELECT post, SUM(salary) AS 'Sum' FROM staff
GROUP BY post;

-- задание 4
SELECT COUNT(post) FROM staff
WHERE post = "Рабочий" AND age BETWEEN 24 AND 49 ;

-- задание 5
SELECT COUNT(DISTINCT post) AS 'кол-во специальностей' FROM staff;

-- задание 6
SELECT post FROM staff
GROUP BY post
HAVING AVG(age)<=30;

DROP TABLE IF EXISTS `staff2`;
CREATE TABLE IF NOT EXISTS `staff2`
(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`firstname` VARCHAR(45),
`lastname` VARCHAR(45),
`post` VARCHAR(45),
`seniority` INT,
`salary` INT,
`age` INT);
INSERT INTO `staff2` (`firstname`, `lastname`, `post`,`seniority`,`salary`, `age`)
VALUES
('Вася', 'Васькин', 'Начальник', 40, 100000, 60), 
('Петр', 'Власов', 'Начальник', 8, 70000, 30),
('Катя', 'Катина', 'Инженер', 2, 70000, 25),
('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
('Иван', 'Петров', 'Рабочий', 40, 30000, 59),
('Петр', 'Петров', 'Рабочий', 20, 55000, 60),
('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
('Максим', 'Петров', 'Рабочий', 2, 11000, 19),
('Юрий', 'Петров', 'Рабочий', 3, 12000, 24),
('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);

DROP TABLE IF EXISTS `activity_staff`;
CREATE TABLE IF NOT EXISTS `activity_staff`
(`id` INT PRIMARY KEY AUTO_INCREMENT,
`staff_id` INT,
FOREIGN KEY (staff_id) REFERENCES staff(id),
`date_activity` DATE,
`count_pages` INT
);
INSERT activity_staff (`staff_id`, `date_activity`, `count_pages`)
VALUES
(1,'2022-01-01',250),
(2,'2022-01-01',220),
(3,'2022-01-01',170),
(1,'2022-01-02',100),
(2,'2022-01-01',220),
(3,'2022-01-01',300),
(7,'2022-01-01',350),
(1,'2022-01-03',168),
(2,'2022-01-03',62),
(3,'2022-01-03',84);

-- //1
SELECT staff_id FROM(
SELECT staff_id, sum(count_pages) AS 'sum_of_counts' FROM activity_staff
GROUP BY staff_id
HAVING sum_of_counts>500) as `list`;
-- 2
SELECT date_activity, COUNT(staff_id) AS 'sum_of_employes' FROM activity_staff
GROUP BY date_activity
HAVING sum_of_employes>3;
-- 3
SELECT AVG(avg_salary) as 'avg_of>avg30000' FROM(
SELECT AVG(salary) AS 'avg_salary', post FROM staff2
GROUP BY post
HAVING avg_salary>30000)as `list3`;











