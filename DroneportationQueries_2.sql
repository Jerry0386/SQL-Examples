-- Query 1

UPDATE passenger
SET FirstName = "Christine", 
	LastName = "Pearson", 
	Address = "7358 Elementum St.", 
	City = "New Auburn", 
	State = "WI", 
	RegionCode = "54757",
	LocationLat = 45.204902,
	LocationLong = -91.562678
WHERE PassID = 114;

-- Query 2

REPLACE INTO `passenger` (`PassID`, `FirstName`, `LastName`, `Address`, `City`, `State`, `RegionCode`, `LocationLat`, `LocationLong`)
	VALUES (114, "Christine", "Pearson", "7358 Elementum St.", "New Auburn", "WI", "54757", 45.204902, -91.562678)

-- Query 3

ALTER TABLE `droneportation`.`passgroupmember` 
DROP FOREIGN KEY `FKpassgroup`;
ALTER TABLE `droneportation`.`passgroupmember` 
ADD CONSTRAINT `FKpassgroup`
  FOREIGN KEY (`GroupID`)
  REFERENCES `droneportation`.`passgroup` (`GroupID`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

DELETE FROM passgroup
WHERE GroupID = 1;

DELETE FROM passgroup
WHERE GroupID = 82;

-- Query 4

UPDATE flightreservation
SET DroneID = 5
WHERE StatusID = 1 OR StatusID = 2 OR StatusID = 4 AND DroneID IN
	(
    	SELECT DroneID
	FROM droneportation.drone
	WHERE ModelID = 3
	);

-- Query 5

DELETE FROM p, mp
USING Package AS p INNER JOIN ManifestPackage AS mp USING (PackageID);

-- Query 6
-- I didn't use a WHERE clause in Query 5 so I just assumed you wanted me to use TRUNCATE here

TRUNCATE TABLE package;
TRUNCATE TABLE manifestpackage;



