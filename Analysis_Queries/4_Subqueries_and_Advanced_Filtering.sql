-- 1. Filter without HAVING (Using Subquery)
SELECT * FROM (
    SELECT Makes.Make, COUNT(*) AS NumberOfVehicle
    FROM VehicleDetails 
    INNER JOIN Makes ON VehicleDetails.MakeID = Makes.MakeID
    WHERE VehicleDetails.Year BETWEEN 1950 AND 2000
    GROUP BY Makes.Make
) R1
WHERE NumberOfVehicle > 12000;

-- 2. Calculate percentage per Make using Subquery
SELECT *, CAST(NumberOfVehicle AS FLOAT) / CAST(TotalVehicles AS FLOAT) AS Prec FROM (
    SELECT Makes.Make, COUNT(*) AS NumberOfVehicle, (SELECT COUNT(*) FROM VehicleDetails) AS TotalVehicles
    FROM VehicleDetails 
    INNER JOIN Makes ON VehicleDetails.MakeID = Makes.MakeID
    WHERE VehicleDetails.Year BETWEEN 1950 AND 2000
    GROUP BY Makes.Make
) R2
ORDER BY NumberOfVehicle DESC;

-- 3. Get total GAS makes using Subquery
SELECT COUNT(*) AS TotalMakesGunsWithGAS FROM (
    SELECT DISTINCT Makes.Make, FuelTypes.FuelTypeName 
    FROM VehicleDetails
    INNER JOIN FuelTypes ON VehicleDetails.FuelTypeID = FuelTypes.FuelTypeID
    INNER JOIN Makes ON VehicleDetails.MakeID = Makes.MakeID
    WHERE FuelTypeName = N'GAS' 
) R3;

-- 4. Get vehicles that match the Average Engine CC
SELECT Vehicle_Display_Name FROM VehicleDetails
WHERE Engine_CC = (SELECT AVG(Engine_CC) FROM VehicleDetails);

-- 5. Get vehicles that match the Top 3 Engine CC
SELECT Vehicle_Display_Name FROM VehicleDetails
WHERE Engine_CC IN (
    SELECT DISTINCT TOP 3 Engine_CC FROM VehicleDetails ORDER BY Engine_CC DESC
);

-- 6. Get Makes matching Top 3 Engine CC (Complex Join + Subquery)
SELECT DISTINCT Makes.Make 
FROM VehicleDetails 
INNER JOIN Makes ON VehicleDetails.MakeID = Makes.MakeID
WHERE (VehicleDetails.Engine_CC IN (
    SELECT DISTINCT TOP 3 Engine_CC FROM VehicleDetails ORDER BY Engine_CC DESC
))
ORDER BY Make;

-- 7. Find manufacturers with the absolute maximum number of models
SELECT Makes.Make, COUNT(*) AS NumberOfModels
FROM Makes 
INNER JOIN MakeModels ON Makes.MakeID = MakeModels.MakeID
GROUP BY Makes.Make
HAVING COUNT(*) = (
    SELECT MAX(NumberOfModels) FROM (
        SELECT COUNT(*) AS NumberOfModels FROM MakeModels GROUP BY MakeID
    ) R1
);
