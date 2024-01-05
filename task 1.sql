#Goal is to identify when vehicles are stolen

USE stolen_vehicles_db

#1.	Find the number of vehicles stolen each year 
SELECT * FROM stolen_vehicles;

SELECT YEAR(date_stolen), COUNT(vehicle_id) AS num_vehicles
FROM stolen_vehicles
GROUP BY YEAR(date_stolen);

#2.	Find the number of vehicles stolen each month
SELECT YEAR(date_stolen), MONTH(date_stolen), COUNT(vehicle_id) AS num_vehicles
FROM stolen_vehicles
GROUP BY YEAR(date_stolen), MONTH(date_stolen)
ORDER BY YEAR(date_stolen), MONTH(date_stolen);

#Analysis of the month of April where there are low # of stolen vehicles
SELECT YEAR(date_stolen), MONTH(date_stolen), DAY(date_stolen), COUNT(vehicle_id) AS num_vehicles
FROM stolen_vehicles
WHERE MONTH(date_stolen) = 4
GROUP BY YEAR(date_stolen), MONTH(date_stolen), DAY(date_stolen) 
ORDER BY YEAR(date_stolen), MONTH(date_stolen), DAY(date_stolen);

#3.	Find the number of vehicles stolen each day of the week 
SELECT DAYOFWEEK(date_stolen) as dow, COUNT(vehicle_id) AS num_vehicles
FROM stolen_vehicles
GROUP BY DAYOFWEEK(date_stolen)
ORDER BY dow; 

#4.	Replace the numeric day of week values with the full name of each day of the week (Sunday, Monday, Tuesday, etc) 
SELECT DAYOFWEEK(date_stolen) as dow,
	   CASE WHEN DAYOFWEEK (date_stolen) = 1 THEN 'Sunday'
			WHEN DAYOFWEEK (date_stolen) = 2 THEN 'Monday'
            WHEN DAYOFWEEK (date_stolen) = 3 THEN 'Tuesday'
            WHEN DAYOFWEEK (date_stolen) = 4 THEN 'Wednesday'
            WHEN DAYOFWEEK (date_stolen) = 5 THEN 'Thursday'
            WHEN DAYOFWEEK (date_stolen) = 6 THEN 'Friday'
            ELSE 'Saturday' END AS day_of_week,
		COUNT(vehicle_id) AS num_vehicles
FROM stolen_vehicles
GROUP BY DAYOFWEEK(date_stolen), day_of_week
ORDER BY dow; 

#5.	Create a bar chart that shows the number of vehicles stolen on each day of the week 
