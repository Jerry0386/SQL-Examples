-- Query 1
CREATE USER `DroneView`@`%` IDENTIFIED BY 'password';

GRANT SELECT ON `droneportation`.`flightreservationdist` TO `DroneView`@`%`;

GRANT SELECT ON `droneportation`.`package` TO `DroneView`@`%`;

GRANT SELECT ON `droneportation`.`manifestpackage` TO `DroneView`@`%`;

GRANT SELECT ON `droneportation`.`passenger` TO `DroneView`@`%`;

GRANT SELECT ON `droneportation`.`manifestpassenger` TO `DroneView`@`%`;

SHOW GRANTS FOR `DroneView`@`%`;

-- Query 2
CREATE USER `HRTeam`@`%` IDENTIFIED BY 'password';

GRANT SELECT ON `droneportation`.`AuthorizedCategory` TO `HRTeam`@`%`;

GRANT INSERT ON `droneportation`.`AuthorizedCategory` TO `HRTeam`@`%`;

GRANT UPDATE ON `droneportation`.`AuthorizedCategory` TO `HRTeam`@`%`;

GRANT DELETE ON `droneportation`.`AuthorizedCategory` TO `HRTeam`@`%`;

GRANT SELECT ON `droneportation`.`RemotePilot` TO `HRTeam`@`%`;

GRANT INSERT ON `droneportation`.`RemotePilot` TO `HRTeam`@`%`;

GRANT UPDATE ON `droneportation`.`RemotePilot` TO `HRTeam`@`%`;

GRANT DELETE ON `droneportation`.`RemotePilot` TO `HRTeam`@`%`;

SHOW GRANTS FOR `HRTeam`@`%`;

-- Query 3
SHOW GRANTS FOR `ITEric`@`%`;

-- Query 4
CREATE USER `FrontEnd`@`%` IDENTIFIED BY 'password';

GRANT SELECT ON `droneportation`.`Passenger` TO `FrontEnd`@`%`;

GRANT INSERT ON `droneportation`.`Passenger` TO `FrontEnd`@`%`;

GRANT UPDATE ON `droneportation`.`Passenger` TO `FrontEnd`@`%`;

GRANT SELECT ON `droneportation`.`PassGroup` TO `FrontEnd`@`%`;

GRANT INSERT ON `droneportation`.`PassGroup` TO `FrontEnd`@`%`;

GRANT UPDATE ON `droneportation`.`PassGroup` TO `FrontEnd`@`%`;

GRANT SELECT ON `droneportation`.`PassGroupMember` TO `FrontEnd`@`%`;

GRANT INSERT ON `droneportation`.`PassGroupMember` TO `FrontEnd`@`%`;

GRANT UPDATE ON `droneportation`.`PassGroupMember` TO `FrontEnd`@`%`;

GRANT SELECT ON `droneportation`.`Package` TO `FrontEnd`@`%`;

GRANT INSERT ON `droneportation`.`Package` TO `FrontEnd`@`%`;

GRANT UPDATE ON `droneportation`.`Package` TO `FrontEnd`@`%`;

SHOW GRANTS FOR `FrontEnd`@`%`;

-- Query 5
CREATE USER `BackEnd`@`%` IDENTIFIED BY 'password';

GRANT SELECT ON `droneportation`.`FlightReservation` TO `BackEnd`@`%`;

GRANT INSERT ON `droneportation`.`FlightReservation` TO `BackEnd`@`%`;

GRANT UPDATE ON `droneportation`.`FlightReservation` TO `BackEnd`@`%`;

GRANT SELECT ON `droneportation`.`ManifestPackage` TO `BackEnd`@`%`;

GRANT INSERT ON `droneportation`.`ManifestPackage` TO `BackEnd`@`%`;

GRANT UPDATE ON `droneportation`.`ManifestPackage` TO `BackEnd`@`%`;

GRANT SELECT ON `droneportation`.`ManifestPassenger` TO `BackEnd`@`%`;

GRANT INSERT ON `droneportation`.`ManifestPassenger` TO `BackEnd`@`%`;

GRANT UPDATE ON `droneportation`.`ManifestPassenger` TO `BackEnd`@`%`;

GRANT SELECT ON `droneportation`.`FlightStatus` TO `BackEnd`@`%`;

GRANT SELECT ON `droneportation`.`FlightType` TO `BackEnd`@`%`;

GRANT SELECT ON `droneportation`.`Drone` TO `BackEnd`@`%`;

GRANT SELECT ON `droneportation`.`Model` TO `BackEnd`@`%`;

SHOW GRANTS FOR `BackEnd`@`%`;