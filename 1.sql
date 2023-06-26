CREATE DATABASE phones;
USE phones;
CREATE TABLE smartphones
(id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
manufacturer VARCHAR(30) NOT NULL,
model VARCHAR(30) NOT NULL,
price INT NOT NULL,
quantity INT NOT NULL);

INSERT INTO smartphones (manufacturer, model, price, quantity)
VALUES
('Samsung', 'Galaxy S23 Ultra', 88000, 1),
('Apple', 'iphone 14 pro', 99900, 1),
('Samsung', 'Galaxy S24 Ultra', 99000, 3),
('Apple', 'iphone 13 pro max', 99900, 2);

SELECT manufacturer, model, price FROM smartphones
WHERE quantity > 2;

SELECT * FROM smartphones
WHERE manufacturer LIKE 'Samsung';




