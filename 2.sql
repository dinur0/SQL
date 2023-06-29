DROP DATABASE IF EXISTS seminar2;
CREATE DATABASE IF NOT EXISTS seminar2;
USE seminar2;
DROP TABLE IF EXISTS sales;
CREATE TABLE IF NOT EXISTS sales
(id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
other_date DATE NOT NULL,
count_product INT NOT NULL);

INSERT INTO sales (other_date, count_product)
VALUES
('2022-01-01', 156),
('2022-01-02', 180),
('2022-01-03', 21),
('2022-01-04', 124),
('2022-01-05', 341);

SELECT id,
IF(count_product < 100, "Маленький заказ", 
	IF (count_product >= 100 AND count_product < 300, 'Средний заказ', 
		IF(count_product >= 300, 'Большой заказ', 'Invalid number'))) AS 'Тип заказа'
FROM sales;

DROP TABLE IF EXISTS orders;
CREATE TABLE IF NOT EXISTS orders
(id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
employee_id VARCHAR(10) NOT NULL,
amount DOUBLE NOT NULL,
order_status VARCHAR(15) NOT NULL);

INSERT INTO orders (employee_id, amount, order_status)
VALUES
('e03', 15, 'OPEN'),
('e01', 22.50, 'OPEN'),
('e05', 100.70, 'CLOSED'),
('e02', 22.18, 'OPEN'),
('e04', 9.50, 'CANCELLED');

SELECT id,
	CASE
		WHEN order_status = 'OPEN' THEN 'order is in open state'
        WHEN order_status = 'CLOSED' THEN 'order is closed'
        WHEN order_status = 'CANCELLED' THEN 'order is cancelled'
		ELSE 'ERROR'
	END full_order_status
FROM orders;









