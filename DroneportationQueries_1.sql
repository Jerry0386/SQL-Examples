-- Query 1
SELECT p.FirstName, p.Lastname, mp.FlightID, mp.SeatPrice, mpa.AvgSeatPrice, ROUND(mp.SeatPrice - mpa.AvgSeatPrice, 2) AS Difference
FROM droneportation.manifestpassenger AS mp INNER JOIN droneportation.passenger AS p USING (PassID) INNER JOIN
(
  SELECT mp.PassID, AVG(mp.SeatPrice) AS AvgSeatPrice
  FROM droneportation.manifestpassenger AS mp
  WHERE mp.PassID = 13
) AS mpa USING (PassID);

-- Query 2
SELECT p.PassID, p.FirstName, p.LastName, mp.NumFlights
FROM droneportation.passenger AS p LEFT JOIN
(
  SELECT mp.PassID, COUNT(mp.FlightID) AS NumFlights
  FROM droneportation.manifestpassenger AS mp 
  GROUP BY PassID
) AS mp USING (PassID)
ORDER BY mp.NumFlights DESC;

-- Query 3
SELECT *
FROM droneportation.flightreservation
WHERE DroneID = 1 AND YEAR(PickUpTime) = 2021
UNION
SELECT *
FROM droneportation.flightreservation
WHERE DroneID = 10 AND (YEAR(PickUpTime) = 2022 AND MONTH(PickUpTime) BETWEEN 10 AND 12)
ORDER BY DroneID, PickUpTime;

-- Query 4
SELECT DroneID, SUM(LatLongDistance(PickUpLat, PickUpLong, DropOffLat, DropOffLong)) AS TotalDistance
FROM droneportation.FlightReservation AS fr
WHERE fr.StatusID = 5
GROUP BY fr.DroneID
ORDER BY TotalDistance DESC;

-- Query 5
SELECT fr.FlightID, fr.PickUpTime, fr.CostPerMile, LatLongDistance(PickUpLat, PickUpLong, DropOffLat, DropOffLong) AS Distance, ROUND(fr.CostPerMile * LatLongDistance(PickUpLat, PickUpLong, DropOffLat, DropOffLong), 4) AS TotalMilageCost
FROM droneportation.FlightReservation AS fr
WHERE FlightID IN
(
  SELECT mp.FlightID
  FROM droneportation.ManifestPassenger AS mp
    INNER JOIN  droneportation.Passenger AS p USING (PassID)
    INNER JOIN droneportation.passgroupmember AS pgm USING (PassID)
    INNER JOIN droneportation.PassGroup AS pg USING (GroupID)
  WHERE pg.GroupTypeID = 1
)
ORDER BY Distance;

-- Query 6
SELECT YEAR(PickUpTime) AS `Year`, COUNT(FlightID) AS NumFlights, AVG(TIMESTAMPDIFF(MINUTE,PickUpTime,ActDropOffTime)) AS AvgDuration
FROM droneportation.FlightReservation
WHERE StatusID = 5
GROUP BY YEAR
ORDER BY YEAR;

-- Query 7
CREATE VIEW `FlightReservationDist` AS


SELECT FlightID, PickUpTime, EstDropOffTime, ActDropOffTime, CostPerMile, PickUpLat, PickUpLong, DropOffLat, DropOffLong, LatLongDistance(PickUpLat, PickUpLong, DropOffLat, DropOffLong) AS Distance, TypeID, StatusID, DroneID, RemotePilotID
FROM droneportation.FlightReservation;

-- Query 8
CREATE VIEW `PassGroupAffiliates` AS


SELECT p.PassID, p.FirstName, p.LastName, pg.GroupID, pg.Nickname, pg.OwnerID, pg.GroupTypeID
FROM droneportation.Passenger AS p LEFT JOIN droneportation.PassGroupMember AS pgm USING (PassID)
  LEFT JOIN droneportation.PassGroup AS pg USING (GroupID);