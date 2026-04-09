-- 1. Query from View
SELECT * FROM VehicleMasterVeiw
WHERE Year BETWEEN 1950 AND 2000;

-- 2. Inner Join for specific SubModel
SELECT DISTINCT VehicleDetails.MakeID, Makes.Make, SubModelName
FROM VehicleDetails 
INNER JOIN SubModels ON VehicleDetails.SubModelID = SubModels.SubModelID 
INNER JOIN Makes ON VehicleDetails.MakeID = Makes.MakeID
WHERE SubModelName = 'Elite';

-- 3. Multiple Joins for GAS vehicles
SELECT DISTINCT Makes.Make, FuelTypes.FuelTypeName 
FROM VehicleDetails
INNER JOIN FuelTypes ON VehicleDetails.FuelTypeID = FuelTypes.FuelTypeID
INNER JOIN Makes ON VehicleDetails.MakeID = Makes.MakeID
WHERE FuelTypeName = N'GAS';

-- 4. Join for FWD DriveType
SELECT Makes.Make, DriveTypes.DriveTypeName 
FROM DriveTypes
INNER JOIN VehicleDetails ON DriveTypes.DriveTypeID = VehicleDetails.DriveTypeID
INNER JOIN Makes ON VehicleDetails.MakeID = Makes.MakeID
WHERE DriveTypes.DriveTypeName = 'FWD';

-- 5. Triple Join for Fuel and Make statistics
SELECT Makes.Make, FuelTypes.FuelTypeName, COUNT(*) AS NumberOfVehicle
FROM VehicleDetails 
INNER JOIN Makes ON VehicleDetails.MakeID = Makes.MakeID
INNER JOIN FuelTypes ON VehicleDetails.FuelTypeID = FuelTypes.FuelTypeID
WHERE (VehicleDetails.Year BETWEEN 1950 AND 2000)
GROUP BY Makes.Make, FuelTypes.FuelTypeName;

-- 6. Complex Logic for OHV Engines (Count within Subquery)
SELECT COUNT(*) FROM (
    SELECT Makes.Make, VehicleDetails.*
    FROM VehicleDetails 
    INNER JOIN Makes ON VehicleDetails.MakeID = Makes.MakeID
    WHERE (VehicleDetails.Engine LIKE '%OHV%') AND (VehicleDetails.Engine_Cylinders = 4)
) R1;
