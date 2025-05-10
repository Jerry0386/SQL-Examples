-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: dentist
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `appttbl`
--

DROP TABLE IF EXISTS `appttbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appttbl` (
  `ApptID` int unsigned NOT NULL AUTO_INCREMENT,
  `PatientID` int unsigned DEFAULT NULL,
  `InsID` int unsigned DEFAULT NULL,
  `StartTime` datetime DEFAULT NULL,
  `EndTime` datetime DEFAULT NULL,
  `GrossCost` decimal(9,2) DEFAULT NULL,
  `FinalCost` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`ApptID`),
  KEY `PatientID_idx` (`PatientID`),
  KEY `InsID_idx` (`InsID`),
  CONSTRAINT `InsID` FOREIGN KEY (`InsID`) REFERENCES `insurancetbl` (`InsID`),
  CONSTRAINT `PatientID1` FOREIGN KEY (`PatientID`) REFERENCES `patienttbl` (`PatientID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appttbl`
--

LOCK TABLES `appttbl` WRITE;
/*!40000 ALTER TABLE `appttbl` DISABLE KEYS */;
INSERT INTO `appttbl` VALUES (1,6,10,'2024-02-18 15:47:09','2024-02-18 16:47:09',65.00,32.50),(2,5,NULL,'2024-02-18 15:51:09','2024-02-18 16:51:09',55.00,27.50),(3,4,8,'2024-02-18 16:03:09','2024-02-18 17:03:09',70.00,35.00),(4,8,5,'2024-02-18 15:47:09','2024-02-18 16:47:09',72.00,36.00),(5,2,3,'2024-02-18 15:48:09','2024-02-18 16:48:09',54.00,27.00),(6,4,8,'2024-02-18 16:32:09','2024-02-18 17:32:09',73.00,36.50),(7,1,1,'2024-02-18 16:09:09','2024-02-18 17:09:09',57.00,28.50),(8,8,5,'2024-02-18 16:35:09','2024-02-18 17:35:09',69.00,34.50),(9,1,1,'2024-02-18 15:55:09','2024-02-18 16:55:09',73.00,36.50),(10,7,4,'2024-02-18 16:12:09','2024-02-18 17:12:09',54.00,27.00),(11,2,3,'2024-02-18 16:17:39','2024-02-18 17:17:39',62.00,31.00),(12,4,8,'2024-02-18 15:40:39','2024-02-18 16:40:39',64.00,32.00),(13,7,4,'2024-02-18 16:13:39','2024-02-18 17:13:39',56.00,28.00),(14,5,NULL,'2024-02-18 15:55:39','2024-02-18 16:55:39',62.00,31.00),(15,6,10,'2024-02-18 16:34:39','2024-02-18 17:34:39',64.00,32.00),(16,1,1,'2024-02-18 16:28:39','2024-02-18 17:28:39',68.00,34.00),(17,2,3,'2024-02-18 16:36:39','2024-02-18 17:36:39',50.00,25.00),(18,3,6,'2024-02-18 16:11:39','2024-02-18 17:11:39',67.00,33.50),(19,8,5,'2024-02-18 16:01:39','2024-02-18 17:01:39',53.00,26.50),(20,6,10,'2024-02-18 16:22:39','2024-02-18 17:22:39',66.00,33.00);
/*!40000 ALTER TABLE `appttbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empassigntbl`
--

DROP TABLE IF EXISTS `empassigntbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empassigntbl` (
  `EmpID` int unsigned NOT NULL,
  `ApptID` int unsigned NOT NULL,
  PRIMARY KEY (`EmpID`,`ApptID`),
  KEY `ApptID_idx` (`ApptID`),
  KEY `EmpID_idx` (`EmpID`),
  CONSTRAINT `ApptID` FOREIGN KEY (`ApptID`) REFERENCES `appttbl` (`ApptID`),
  CONSTRAINT `EmpID` FOREIGN KEY (`EmpID`) REFERENCES `employeetbl` (`EmpID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empassigntbl`
--

LOCK TABLES `empassigntbl` WRITE;
/*!40000 ALTER TABLE `empassigntbl` DISABLE KEYS */;
INSERT INTO `empassigntbl` VALUES (2,1),(6,1),(2,2),(5,2),(2,3),(6,3),(2,4),(5,4),(2,5),(7,5),(1,6),(6,6),(2,7),(6,7),(2,8),(7,8),(2,9),(7,9),(3,10),(6,10),(3,11),(4,11),(3,12),(4,12),(2,13),(5,13),(2,14),(7,14),(2,15),(6,15),(3,16),(5,16),(1,17),(5,17),(3,18),(7,18),(1,19),(7,19),(2,20),(6,20);
/*!40000 ALTER TABLE `empassigntbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeetbl`
--

DROP TABLE IF EXISTS `employeetbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeetbl` (
  `EmpID` int unsigned NOT NULL AUTO_INCREMENT,
  `EmpTypeID` int unsigned DEFAULT NULL,
  `FirstName` varchar(25) DEFAULT NULL,
  `LastName` varchar(30) DEFAULT NULL,
  `Title` varchar(20) DEFAULT NULL,
  `BirthDate` date DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Address1` varchar(40) DEFAULT NULL,
  `Address2` varchar(40) DEFAULT NULL,
  `City` varchar(30) DEFAULT NULL,
  `State` varchar(2) DEFAULT NULL,
  `ZIP` varchar(10) DEFAULT NULL,
  `Wage` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`EmpID`),
  KEY `EmpTypeID_idx` (`EmpTypeID`),
  CONSTRAINT `EmpTypeID` FOREIGN KEY (`EmpTypeID`) REFERENCES `emptypetbl` (`EmpTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeetbl`
--

LOCK TABLES `employeetbl` WRITE;
/*!40000 ALTER TABLE `employeetbl` DISABLE KEYS */;
INSERT INTO `employeetbl` VALUES (1,1,'Orin','Scrivello','General Dentist','1945-08-14','686-217-5610','8106 20th St',NULL,'Waco','TX','76633',102000.00),(2,1,'Christian','Szell','Oral Surgeon','1907-05-22','127-527-6829','817 Winchester Avenue',NULL,'Miami','FL','33101',107850.50),(3,1,'Wilbur','Wonka','Pediatric Dentist','1942-03-24','689-518-5638','212 Chocolate Drive',NULL,'Fudge','MI','68388',103050.00),(4,2,'Janice','Delong','Dental Hygienest','1967-05-18','681-586-2117','1845 Jack Street',NULL,'Glendale','MO','68189',73000.87),(5,2,'Karen','Klim','Dental Assistant','1974-02-08','658-858-8189','21 Jump Street',NULL,'New Orleans','LA','70032',68500.50),(6,2,'John','Delaney','Dental Assistant','1980-04-01','489-858-0868','18001 Johns Street',NULL,'Detroit','MI','68878',65000.00),(7,2,'Bill','Preston','Dental Hygienest','1970-10-15','689-818-5555','Wyld Stallyn Blvd.',NULL,'Scottsdale','AZ','85054',67000.50);
/*!40000 ALTER TABLE `employeetbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emptypetbl`
--

DROP TABLE IF EXISTS `emptypetbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emptypetbl` (
  `EmpTypeID` int unsigned NOT NULL AUTO_INCREMENT,
  `Description` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`EmpTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emptypetbl`
--

LOCK TABLES `emptypetbl` WRITE;
/*!40000 ALTER TABLE `emptypetbl` DISABLE KEYS */;
INSERT INTO `emptypetbl` VALUES (1,'Dentist'),(2,'Assistant');
/*!40000 ALTER TABLE `emptypetbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insurancetbl`
--

DROP TABLE IF EXISTS `insurancetbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insurancetbl` (
  `InsID` int unsigned NOT NULL AUTO_INCREMENT,
  `PatientID` int unsigned DEFAULT NULL,
  `CompanyName` varchar(50) DEFAULT NULL,
  `PolicyID` varchar(15) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `ExpirationDate` date DEFAULT NULL,
  PRIMARY KEY (`InsID`),
  KEY `PatientID_idx` (`PatientID`),
  CONSTRAINT `PatientID` FOREIGN KEY (`PatientID`) REFERENCES `patienttbl` (`PatientID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurancetbl`
--

LOCK TABLES `insurancetbl` WRITE;
/*!40000 ALTER TABLE `insurancetbl` DISABLE KEYS */;
INSERT INTO `insurancetbl` VALUES (1,1,'Blue Cross','AG10891868','651-554-2186','2025-01-08'),(2,1,'Delta Dental','BH19687968','612-503-5389','2025-03-25'),(3,2,'Health Partners Dental','IQ180868B','680-068-6855','2026-01-01'),(4,7,'Delta Dental','HE123456789','612-503-5389','2025-05-24'),(5,8,'Delta Dental','HE123456789','612-503-5389','2025-05-24'),(6,3,'Spirit Dental','196879899','618-868-6888','2025-01-01'),(7,3,'Humana','H8989G698','689-089-0898','2024-12-01'),(8,4,'Aetna','AT320923049','189-088-8977','2024-12-31'),(9,4,'Anthem','N25199987','589-555-0877','2026-08-01'),(10,6,'Cigna','CG2940ILPY','899-511-2169','2025-01-01');
/*!40000 ALTER TABLE `insurancetbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patienttbl`
--

DROP TABLE IF EXISTS `patienttbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patienttbl` (
  `PatientID` int unsigned NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(25) DEFAULT NULL,
  `LastName` varchar(30) DEFAULT NULL,
  `BirthDate` date DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Address1` varchar(40) DEFAULT NULL,
  `Address2` varchar(40) DEFAULT NULL,
  `City` varchar(30) DEFAULT NULL,
  `State` varchar(2) DEFAULT NULL,
  `ZIP` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`PatientID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patienttbl`
--

LOCK TABLES `patienttbl` WRITE;
/*!40000 ALTER TABLE `patienttbl` DISABLE KEYS */;
INSERT INTO `patienttbl` VALUES (1,'Jeff','Pendleton','1986-01-24','651-224-5816','182 Wier Dr',NULL,'St. Paul MN','MN','55072'),(2,'Nancy','Pendleton','1990-05-06','651-224-8016','182 Wier Dr',NULL,'St. Paul MN','MN','55072'),(3,'John','Stamos','1963-08-19','612-254-8772','8401 Jefferson Street',NULL,'Los Angeles','CA','90001'),(4,'Rick','James','1948-02-01','686-214-5517','8716 2nd Ave',NULL,'Buffalo','NY','123456'),(5,'Laura','Cranby','2001-07-18','212-557-1681','52 88th Street',NULL,'Pine City','IL','49838'),(6,'Ron','Kovic','1989-07-04','817-212-5486','704 Freedom Dr',NULL,'Chicago','IL','60007'),(7,'Dale','Doback','1969-10-20','882-515-2649','1987 Midwick Drive',NULL,'Los Angeles','CA','90001'),(8,'Brennan','Huff','1968-09-13','882-451-2649','1987 Midwick Drive',NULL,'Los Angeles','CA','90001');
/*!40000 ALTER TABLE `patienttbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicerequesttbl`
--

DROP TABLE IF EXISTS `servicerequesttbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicerequesttbl` (
  `ServID` int unsigned NOT NULL,
  `ApptID` int unsigned NOT NULL,
  `Quantity` int DEFAULT NULL,
  `TotalCost` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`ServID`,`ApptID`),
  KEY `ApptID_idx` (`ApptID`),
  KEY `ServID_idx` (`ServID`),
  CONSTRAINT `ApptID1` FOREIGN KEY (`ApptID`) REFERENCES `appttbl` (`ApptID`),
  CONSTRAINT `ServID` FOREIGN KEY (`ServID`) REFERENCES `servicetbl` (`ServID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicerequesttbl`
--

LOCK TABLES `servicerequesttbl` WRITE;
/*!40000 ALTER TABLE `servicerequesttbl` DISABLE KEYS */;
INSERT INTO `servicerequesttbl` VALUES (1,5,3,150.00),(1,6,1,50.00),(1,8,2,100.00),(1,13,2,100.00),(2,1,2,150.00),(2,3,3,225.00),(2,4,1,75.00),(3,7,1,150.00),(3,15,2,300.00),(4,2,2,1800.00),(4,11,3,2700.00),(4,14,3,2700.00),(4,17,3,2700.00),(4,20,3,2700.00),(5,12,3,294.00),(5,18,2,196.00),(5,19,1,98.00),(5,20,3,294.00),(6,16,3,300.00),(7,1,2,250.00);
/*!40000 ALTER TABLE `servicerequesttbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicetbl`
--

DROP TABLE IF EXISTS `servicetbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicetbl` (
  `ServID` int unsigned NOT NULL AUTO_INCREMENT,
  `Description` varchar(50) DEFAULT NULL,
  `Cost` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`ServID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicetbl`
--

LOCK TABLES `servicetbl` WRITE;
/*!40000 ALTER TABLE `servicetbl` DISABLE KEYS */;
INSERT INTO `servicetbl` VALUES (1,'General Cleaning',50.00),(2,'X-Rays',75.00),(3,'Crowns',150.00),(4,'Install Braces',900.00),(5,'Adjust Braces',98.00),(6,'Cavity Repair',100.00),(7,'Enamel Sealant',125.00);
/*!40000 ALTER TABLE `servicetbl` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-10  7:54:29
