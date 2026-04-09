-- 1. Calculate Vehicle Age
SELECT Vehicle_Display_Name, Year, (YEAR(GETDATE()) - Year) AS Age
FROM VehicleDetails
ORDER BY Age DESC;

-- 2. Transform Door numbers into descriptive text (CASE Statement)
SELECT Vehicle_Display_Name, NumDoors,
    CASE
        WHEN NumDoors = 1 THEN 'One Door'
        WHEN NumDoors = 2 THEN 'Two Doors'
        WHEN NumDoors = 3 THEN 'Three Doors'
        WHEN NumDoors = 4 THEN 'Four Doors'
        WHEN NumDoors = 5 THEN 'Five Doors'
        WHEN NumDoors = 6 THEN 'Six Doors'
        WHEN NumDoors = 8 THEN 'Eight Doors'
        ELSE 'Not SET'
    END AS DoorDescription
FROM VehicleDetails;

-- 3. Calculate Tax based on Engine CC
SELECT Engine_CC,
    CASE
        WHEN Engine_CC BETWEEN 0 AND 1000 THEN 100
        WHEN Engine_CC BETWEEN 1001 AND 2000 THEN 200
        WHEN Engine_CC BETWEEN 2001 AND 3000 THEN 300
        WHEN Engine_CC BETWEEN 3001 AND 4000 THEN 400
        WHEN Engine_CC BETWEEN 4001 AND 5000 THEN 500
        WHEN Engine_CC BETWEEN 5001 AND 6000 THEN 600
        WHEN Engine_CC BETWEEN 6001 AND 8000 THEN 700
        WHEN Engine_CC > 8000 THEN 800
    END AS Tax
FROM VehicleDetails;

-- 4. Calculate percentage of Vehicles with NULL doors
SELECT 
    (CAST((SELECT COUNT(*) FROM VehicleDetails WHERE NumDoors IS NULL) AS FLOAT)
    / 
    CAST((SELECT COUNT(*) FROM VehicleDetails) AS FLOAT)) AS PercOfNoSpecifiedDoors;

-- 5. Calculate Engine CC Statistics (Min, Max, Avg)
SELECT MIN(Engine_CC) AS MinimimEngineCC, MAX(Engine_CC) AS MaximumEngineCC, AVG(Engine_CC) AS AverageEngineCC
FROM VehicleDetails;
