DROP DATABASE IF EXISTS sem5;
CREATE DATABASE IF NOT EXISTS sem5;
USE sem5;
CREATE TABLE cars
(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(45),
    cost INT
);

INSERT cars
VALUES
	(1, "Audi", 52642),
    (2, "Mercedes", 57127 ),
    (3, "Skoda", 9000 ),
    (4, "Volvo", 29000),
	(5, "Bentley", 350000),
    (6, "Citroen ", 21000 ), 
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);
    
CREATE VIEW mycars AS    
SELECT * FROM cars
WHERE cost > 25000;

ALTER VIEW mycars AS
SELECT * FROM cars
WHERE cost > 30000;

CREATE VIEW VAG AS    
SELECT * FROM cars
WHERE name IN ('Audi','Skoda');

SELECT * FROM VAG;

-- 1
SELECT 
RANK() OVER(ORDER BY cost DESC) AS `rank`, name,cost
FROM cars;

-- 2
CREATE VIEW top3 as
SELECT *,
RANK() OVER(ORDER BY cost DESC) AS `rank`
FROM cars
LIMIT 3;

SELECT * FROM top3
JOIN (SELECT sum(cost) AS summa from top3) AS temp;

-- 3
SELECT * FROM(SELECT *,
LAG(cost) OVER() `previous_cost` FROM cars) as temp2
where cost > previous_cost;

-- 4
 SELECT * FROM(SELECT *,
LEAD(cost) OVER() `next_cost` FROM cars) as temp3
where cost < next_cost;

-- 5
CREATE VIEW my_array as
SELECT *, LEAD(cost) OVER() `next_cost` FROM cars
ORDER BY cost DESC;
SELECT *, (cost-next_cost) From my_array

