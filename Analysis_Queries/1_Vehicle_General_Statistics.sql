-- 1. Get total vehicles count per Make and order them from high to low
SELECT Makes.Make, COUNT(*) AS NumberOfVehicle
FROM VehicleDetails 
INNER JOIN Makes ON VehicleDetails.MakeID = Makes.MakeID
GROUP BY Makes.Make
ORDER BY NumberOfVehicle DESC;

-- 2. Get Makes that manufactured more than 20,000 vehicles
SELECT Makes.Make, COUNT(*) AS NumberOfVehicle 
FROM VehicleDetails
INNER JOIN Makes ON VehicleDetails.MakeID = Makes.MakeID
GROUP BY Makes.Make
HAVING COUNT(*) > 20000
ORDER BY NumberOfVehicle DESC;

-- 3. Calculate Engine CC Statistics (Min, Max, and Average)
SELECT 
    MIN(Engine_CC) AS MinimumEngineCC, 
    MAX(Engine_CC) AS MaximumEngineCC, 
    AVG(Engine_CC) AS AverageEngineCC
FROM VehicleDetails;

-- 4. Get the Top 3 Engine CC values in the database
SELECT DISTINCT TOP 3 Engine_CC 
FROM VehicleDetails
ORDER BY Engine_CC DESC;
