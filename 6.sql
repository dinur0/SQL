DROP DATABASE IF EXISTS sem6;
CREATE DATABASE IF NOT EXISTS sem6;
USE sem6;

DELIMITER ^^
CREATE FUNCTION sectotime(val INT)
RETURNS varchar(50)
DETERMINISTIC
BEGIN
DECLARE Days CHAR(3);
DECLARE hours, Minutes, seconds char(2);
DECLARE res CHAR(50);
set Days = cast(floor(val/60/60/24) AS CHAR(3));
set hours = cast(floor(mod(val/60/60/24,1)*24) AS CHAR(2));
set Minutes = cast(floor(mod(mod(val/60/60/24,1)*24,1)*60) AS CHAR(2));
set seconds = cast(round(mod(mod(mod(val/60/60/24,1)*24,1)*60,1)*60) AS CHAR(2));
set res = concat(Days,' days ',hours,' seconds ',Minutes,' minutes ',seconds,' seconds ');
return res;
END ^^
DELIMITER ;

select sectotime(123456) AS result;

DROP PROCEDURE onl;
DELIMITER %%
CREATE PROCEDURE onl()
BEGIN
DECLARE num INT DEFAULT 0;
WHILE num<11 DO
	SET num=num+1;
    IF num % 2 = 0 THEN
		RETURN num;
        END IF;
        END WHILE;
END %%
DELIMITER ;

SELECT only_by_2()
	
	