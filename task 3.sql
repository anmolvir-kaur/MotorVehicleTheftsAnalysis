#goal is to identify where vehicles are stolen 

SELECT * FROM stolen_vehicles;  

SELECT * FROM locations; 

SELECT  region, COUNT(vehicle_id) as num_vehicles
FROM stolen_vehicles sv LEFT JOIN locations l 
	ON sv.location_id = l.location_id
GROUP BY region;
    
#2.	Combine the previous output with the population and density statistics for each region 
SELECT  region, COUNT(vehicle_id) as num_vehicles,
		population, density
FROM stolen_vehicles sv LEFT JOIN locations l 
	ON sv.location_id = l.location_id
GROUP BY region, population, density
ORDER BY num_vehicles DESC;

#3.	Do the types of vehicles stolen in the three most dense regions differ from the three least dense regions 
SELECT  region, COUNT(vehicle_id) as num_vehicles,
		population, density
FROM stolen_vehicles sv LEFT JOIN locations l 
	ON sv.location_id = l.location_id
GROUP BY region, population, density
ORDER BY density DESC;

'Auckland','1638','1695200','343.09'
'Nelson','92','54500','129.15'
'Wellington','420','543500','67.52'

'Otago','139','246000','7.89'
'Gisborne','176','52100','6.21'
'Southland','26','102400','3.28'

(SELECT 'High Density', sv.vehicle_type, COUNT(sv.vehicle_id) AS num_vehicles
FROM stolen_vehicles sv LEFT JOIN locations l
	ON sv.location_id = l.location_id
WHERE l.region IN ('Auckland' , 'Nelson', 'Wellington')
GROUP BY sv.vehicle_type
ORDER BY num_vehicles DESC
LIMIT 5)

UNION 

(SELECT 'Low Density', sv.vehicle_type, COUNT(sv.vehicle_id) AS num_vehicles
FROM stolen_vehicles sv LEFT JOIN locations l
	ON sv.location_id = l.location_id
WHERE l.region IN ('Otago' , 'Gisborne','Southland')
GROUP BY sv.vehicle_type
ORDER BY num_vehicles DESC
LIMIT 5);

#4.	Create a scatterplot of population versus density, and chance the size of the points based on the number of vehicles stolen in each region 
SELECT  region, COUNT(vehicle_id) as num_vehicles,
		population, density
FROM stolen_vehicles sv LEFT JOIN locations l 
	ON sv.location_id = l.location_id
GROUP BY region, population, density
ORDER BY num_vehicles DESC;
