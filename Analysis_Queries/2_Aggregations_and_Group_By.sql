-- 1. Count Vehicles by Make (Sorted High to Low)
SELECT Makes.Make, COUNT(*) AS NumberOfVehicle
FROM VehicleDetails 
INNER JOIN Makes ON VehicleDetails.MakeID = Makes.MakeID
GROUP BY Makes.Make
ORDER BY NumberOfVehicle DESC;

-- 2. Count Models per Make
SELECT Makes.Make, COUNT(*) AS NumberOfModels
FROM Makes
INNER JOIN MakeModels ON Makes.MakeID = MakeModels.MakeID
GROUP BY Makes.Make
ORDER BY NumberOfModels DESC;

-- 3. Get total vehicles per DriveType per Make
SELECT DISTINCT Makes.Make, DriveTypes.DriveTypeName, COUNT(*) AS Total 
FROM DriveTypes
INNER JOIN VehicleDetails ON DriveTypes.DriveTypeID = VehicleDetails.DriveTypeID
INNER JOIN Makes ON VehicleDetails.MakeID = Makes.MakeID
GROUP BY Makes.Make, DriveTypes.DriveTypeName
ORDER BY Make ASC, Total DESC;

-- 4. Get total number of doors manufactured per Make
SELECT Makes.Make, SUM(VehicleDetails.NumDoors) AS TotalDoors
FROM VehicleDetails
INNER JOIN Makes ON VehicleDetails.MakeID = Makes.MakeID
GROUP BY Makes.Make
ORDER BY TotalDoors DESC;

-- 5. Filter Aggregations using HAVING (More than 20K Vehicles)
SELECT Makes.Make, COUNT(*) AS NumberOfVehicle 
FROM VehicleDetails
INNER JOIN Makes ON VehicleDetails.MakeID = Makes.MakeID
GROUP BY Makes.Make
HAVING COUNT(*) > 20000
ORDER BY NumberOfVehicle DESC;

-- 6. Aggregation with Year filter and HAVING
SELECT Makes.Make, COUNT(*) AS NumberOfVehicle
FROM VehicleDetails 
INNER JOIN Makes ON VehicleDetails.MakeID = Makes.MakeID
WHERE VehicleDetails.Year BETWEEN 1950 AND 2000
GROUP BY Makes.Make
HAVING COUNT(*) > 12000
ORDER BY NumberOfVehicle DESC;

-- 7. Specific filter using HAVING (For Ford only)
SELECT Makes.Make, SUM(VehicleDetails.NumDoors) AS TotalDoors
FROM VehicleDetails
INNER JOIN Makes ON VehicleDetails.MakeID = Makes.MakeID
GROUP BY Make
HAVING Make = 'Ford';

-- 8. Get Top 3 manufacturers by model count
SELECT TOP 3 Makes.Make, COUNT(*) AS NumberOfModel 
FROM Makes 
INNER JOIN MakeModels ON Makes.MakeID = MakeModels.MakeID
GROUP BY Makes.Make
ORDER BY NumberOfModel DESC;
