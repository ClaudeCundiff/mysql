-- -------------------------------------------------------------------------- --
--  
-- -------------------------------------------------------------------------- --
DROP DATABASE IF EXISTS temporal;

CREATE SCHEMA temporal
    DEFAULT CHARACTER SET = ascii
    DEFAULT COLLATE = ascii_bin;

USE temporal;

-- -------------------------------------------------------------------------- --
--  
-- -------------------------------------------------------------------------- --
CREATE TABLE Calendar
(
    id			BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
	the_date	VARCHAR(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
    
    PRIMARY KEY(id),
    UNIQUE KEY(the_date)
)
ENGINE =INNODB; 

-- -------------------------------------------------------------------------- --
--  
-- -------------------------------------------------------------------------- --
DELIMITER $$
CREATE PROCEDURE build_calendar(start_date DATE, lookahead INT UNSIGNED)
BEGIN 
	DECLARE counter 	INT UNSIGNED; 
	SET counter 	= 0;
	
	WHILE counter <= lookahead DO
		INSERT INTO Calendar(the_date) VALUES (DATE_ADD(start_date, 
            INTERVAL counter DAY));
		SET counter = counter + 1;
	END WHILE;
END$$
DELIMITER ;

-- -------------------------------------------------------------------------- --
--  
-- -------------------------------------------------------------------------- --
CREATE VIEW DetailedCalendarView 
AS 
SELECT 		temporal.Calendar.the_date 				AS the_date,
			year(temporal.Calendar.the_date) 		AS YEAR,
			monthname(temporal.Calendar.the_date) 	AS MONTHNAME,
			dayname(temporal.Calendar.the_date) 	AS DAYNAME,
			month(temporal.Calendar.the_date) 		AS MONTH,
			dayofmonth(temporal.Calendar.the_date) 	AS DAYOFMONTH,
			dayofweek(temporal.Calendar.the_date) 	AS DAYOFWEEK,
			dayofyear(temporal.Calendar.the_date) 	AS DAYOFYEAR,
			last_day(temporal.Calendar.the_date) 	AS LAST_DAY_OF_MONTH,
			quarter(temporal.Calendar.the_date) 	AS QUARTER,
			week(temporal.Calendar.the_date,0) 		AS WEEK,
			week(temporal.Calendar.the_date,3) 		AS WEEKOFYEAR 
FROM 		temporal.Calendar 
ORDER BY 	the_date;

-- -------------------------------------------------------------------------- --
--  
-- -------------------------------------------------------------------------- --
CALL build_calendar('2018-01-01', 1000);

-- -------------------------------------------------------------------------- --
--  
-- -------------------------------------------------------------------------- --
SELECT * 
FROM temporal.DetailedCalendarView
WHERE the_date BETWEEN '2019-01-01' AND '2020-01-01'
ORDER BY the_date;


