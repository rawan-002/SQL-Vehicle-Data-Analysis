-- 1. Simple Selection
SELECT * FROM VehicleDetails;

-- 2. Get distinct number of doors
SELECT DISTINCT NumDoors FROM VehicleDetails;

-- 3. Get all unique Engine_CC and sort them Descending
SELECT DISTINCT Vehicle_Display_Name, Engine_CC 
FROM VehicleDetails
ORDER BY Engine_CC DESC;

-- 4. Get all Makes starting with 'B'
SELECT Make FROM Makes
WHERE Make LIKE 'B%';

-- 5. Filter vehicles by Engine Liters and Number of Doors
SELECT * FROM VehicleDetails 
WHERE Engine_Liter_Display > 3 AND NumDoors = 2;

-- 6. Filter by Body Name and Year
SELECT Bodies.BodyName, VehicleDetails.*
FROM VehicleDetails 
INNER JOIN Bodies ON VehicleDetails.BodyID = Bodies.BodyID
WHERE BodyName = 'Sport Utility' AND Year > 2020;

-- 7. Filter using IN operator (Multiple Bodies and Years)
SELECT Bodies.BodyName, VehicleDetails.*
FROM VehicleDetails 
INNER JOIN Bodies ON VehicleDetails.BodyID = Bodies.BodyID
WHERE BodyName IN ('Coupe', 'Hatchback', 'Sedan') 
AND Year IN (2008, 2020, 2021);

-- 8. Get all Fuel Types in Random Order
SELECT * FROM FuelTypes
ORDER BY NEWID();

-- 9. Check if any vehicle was made in 1950 (Logic check)
SELECT Found = 1
WHERE EXISTS (
    SELECT TOP 1 * FROM VehicleDetails WHERE Year = 1950
);
