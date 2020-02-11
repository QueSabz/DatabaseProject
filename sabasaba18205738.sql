-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: sabasaba18205738
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `application_status`
--

DROP TABLE IF EXISTS `application_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `application_status` (
  `Offer_Status_id` int(11) NOT NULL,
  `Description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Offer_Status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_status`
--

LOCK TABLES `application_status` WRITE;
/*!40000 ALTER TABLE `application_status` DISABLE KEYS */;
INSERT INTO `application_status` VALUES (1,'Needs Follow Up'),(2,'Unsucessful'),(3,'Successful'),(4,'Pending');
/*!40000 ALTER TABLE `application_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidate_details`
--

DROP TABLE IF EXISTS `candidate_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candidate_details` (
  `Candidate_id` int(11) NOT NULL,
  `Firstname` char(45) DEFAULT NULL,
  `Surname` char(45) DEFAULT NULL,
  `Telephone_number` int(11) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Candidate_id`),
  UNIQUE KEY `Candidate_id_UNIQUE` (`Candidate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidate_details`
--

LOCK TABLES `candidate_details` WRITE;
/*!40000 ALTER TABLE `candidate_details` DISABLE KEYS */;
INSERT INTO `candidate_details` VALUES (105,'Jack','Neil',851924704,'Neil@gmail.com'),(110,'Aiofe','Pender',851743563,'Pender@gmail.com'),(115,'Mary','Wade',852396841,'wade@outlook.com'),(120,'Sipho','Xaki',789929728,'Xaki@outlook.com'),(125,'Lulutho','Lupondo',732947502,'Lupondo@gmail.com'),(130,'Atang','Shoes',855039586,'Shoes@hotmail.com'),(135,'Frank','Murphy',651234569,'Murphy@gmail.com'),(140,'Sarah','Otoole',854567349,'Otoole@outlook.com'),(145,'Claire','Sinnot',732856048,'Sinnot@gmail.com'),(150,'Sean','Honan',851236842,'Honan@hotmail.com');
/*!40000 ALTER TABLE `candidate_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospital_details`
--

DROP TABLE IF EXISTS `hospital_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospital_details` (
  `Hospital_id` int(11) NOT NULL,
  `Hospital_name` varchar(50) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `Telephone_Number` int(11) NOT NULL,
  PRIMARY KEY (`Hospital_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospital_details`
--

LOCK TABLES `hospital_details` WRITE;
/*!40000 ALTER TABLE `hospital_details` DISABLE KEYS */;
INSERT INTO `hospital_details` VALUES (10055,'Wexford Hospital','Wexford',9153000),(20055,'Cork Hospital','Cork',2134000),(30055,'Waterford Hospital ','Waterford',3125000),(40055,'Sligo Hospital ','Sligo',4139000),(50055,'Dublin Hospital ','Dublin',5125000),(60055,'Gorey Hospital ','Gorey',6147000),(70044,'Maynooth Hospital ','Maynooth',3126000),(80055,'Galway Hospital ','Galway',5123000),(90055,'Kilkenny Hospital ','Kilkenny',3128000),(99999,'Enniscorthy Hospital','Enniscorthy',5135000);
/*!40000 ALTER TABLE `hospital_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interview_details`
--

DROP TABLE IF EXISTS `interview_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interview_details` (
  `Interview_id` int(11) NOT NULL,
  `Candidate_Details_Candidate_id` int(11) DEFAULT NULL,
  `Interview_Date` datetime(3) DEFAULT NULL,
  `Hospital_Details_Hospital_id` int(11) DEFAULT NULL,
  `Position_Details_Position_id` int(11) DEFAULT NULL,
  `Application_Status_Offer_Status_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Interview_id`),
  UNIQUE KEY `Interview_id_UNIQUE` (`Interview_id`),
  KEY `Interview_Details_Candidate_Details` (`Candidate_Details_Candidate_id`),
  KEY `Interview_Details_Hospital_Details` (`Hospital_Details_Hospital_id`),
  KEY `Interview_Details_Offer_Status_id` (`Application_Status_Offer_Status_id`),
  KEY `Interview_Details_Position_Details` (`Position_Details_Position_id`),
  CONSTRAINT `Interview_Details_Candidate_Details` FOREIGN KEY (`Candidate_Details_Candidate_id`) REFERENCES `candidate_details` (`Candidate_id`),
  CONSTRAINT `Interview_Details_Hospital_Details` FOREIGN KEY (`Hospital_Details_Hospital_id`) REFERENCES `hospital_details` (`Hospital_id`),
  CONSTRAINT `Interview_Details_Offer_Status_id` FOREIGN KEY (`Application_Status_Offer_Status_id`) REFERENCES `application_status` (`Offer_Status_id`),
  CONSTRAINT `Interview_Details_Position_Details` FOREIGN KEY (`Position_Details_Position_id`) REFERENCES `position_details` (`Position_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interview_details`
--

LOCK TABLES `interview_details` WRITE;
/*!40000 ALTER TABLE `interview_details` DISABLE KEYS */;
INSERT INTO `interview_details` VALUES (121,150,'2019-11-05 09:00:00.000',99999,777,3),(123,105,'2019-11-01 09:00:00.000',10055,222,1),(124,115,'2019-11-02 10:00:00.000',20055,444,1),(125,120,'2019-11-03 11:00:00.000',30055,555,2),(126,125,'2019-11-03 11:00:00.000',40055,333,3),(127,130,'2019-11-04 12:00:00.000',50055,111,3),(128,135,'2019-11-05 09:00:00.000',60055,444,2),(129,140,'2019-11-06 08:00:00.000',40055,555,3),(1200,140,'2019-11-05 14:00:00.000',70044,666,1);
/*!40000 ALTER TABLE `interview_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `link_candidate_to_skills`
--

DROP TABLE IF EXISTS `link_candidate_to_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `link_candidate_to_skills` (
  `CS_ID` int(11) NOT NULL,
  `Candidate_Details_Candidate_id` int(11) NOT NULL,
  `Skills_Skills_id` int(11) NOT NULL,
  PRIMARY KEY (`CS_ID`),
  KEY `Candidate_Skills_Candidate_Details` (`Candidate_Details_Candidate_id`),
  KEY `Link_Candidate_To_Skills_Skills` (`Skills_Skills_id`),
  CONSTRAINT `Candidate_Skills_Candidate_Details` FOREIGN KEY (`Candidate_Details_Candidate_id`) REFERENCES `candidate_details` (`Candidate_id`),
  CONSTRAINT `Link_Candidate_To_Skills_Skills` FOREIGN KEY (`Skills_Skills_id`) REFERENCES `skills` (`Skills_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link_candidate_to_skills`
--

LOCK TABLES `link_candidate_to_skills` WRITE;
/*!40000 ALTER TABLE `link_candidate_to_skills` DISABLE KEYS */;
INSERT INTO `link_candidate_to_skills` VALUES (100,145,9),(111,135,4),(122,110,8),(133,105,3),(144,110,4),(155,105,2),(166,115,5),(177,120,2),(188,125,6),(199,130,7);
/*!40000 ALTER TABLE `link_candidate_to_skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `link_position_to_skills`
--

DROP TABLE IF EXISTS `link_position_to_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `link_position_to_skills` (
  `SR_id` int(11) NOT NULL,
  `Position_Details_Position_id` int(11) DEFAULT NULL,
  `Skills_Skills_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`SR_id`),
  UNIQUE KEY `SR_id_UNIQUE` (`SR_id`),
  KEY `Skills_required_Position_Details` (`Position_Details_Position_id`),
  KEY `Skills_required_Skills` (`Skills_Skills_id`),
  CONSTRAINT `Skills_required_Position_Details` FOREIGN KEY (`Position_Details_Position_id`) REFERENCES `position_details` (`Position_id`),
  CONSTRAINT `Skills_required_Skills` FOREIGN KEY (`Skills_Skills_id`) REFERENCES `skills` (`Skills_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link_position_to_skills`
--

LOCK TABLES `link_position_to_skills` WRITE;
/*!40000 ALTER TABLE `link_position_to_skills` DISABLE KEYS */;
INSERT INTO `link_position_to_skills` VALUES (1,111,2),(2,222,3),(3,333,4),(4,444,5),(5,555,6),(6,666,7),(7,777,3),(8,999,2),(9,1000,1),(10,888,8);
/*!40000 ALTER TABLE `link_position_to_skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position_details`
--

DROP TABLE IF EXISTS `position_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `position_details` (
  `Position_id` int(11) NOT NULL,
  `Type_Of_Position` varchar(50) DEFAULT NULL,
  `Hospital_Details_Hospital_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Position_id`),
  UNIQUE KEY `Position_id_UNIQUE` (`Position_id`),
  KEY `Position_Details_Hospital_Details` (`Hospital_Details_Hospital_id`),
  CONSTRAINT `Position_Details_Hospital_Details` FOREIGN KEY (`Hospital_Details_Hospital_id`) REFERENCES `hospital_details` (`Hospital_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position_details`
--

LOCK TABLES `position_details` WRITE;
/*!40000 ALTER TABLE `position_details` DISABLE KEYS */;
INSERT INTO `position_details` VALUES (111,'Nurse',10055),(222,'Doctor',10055),(333,'Cleaner',20055),(444,'Receptionist',30055),(555,'Paramedic',40055),(666,'Prosthetist',50055),(777,'Sonographer',60055),(888,'Occupational Therapist',10055),(999,'Dietitian',80055),(1000,'Radiographer',90055);
/*!40000 ALTER TABLE `position_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skills`
--

DROP TABLE IF EXISTS `skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skills` (
  `Skills_id` int(11) NOT NULL,
  `Description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Skills_id`),
  UNIQUE KEY `Skills_id_UNIQUE` (`Skills_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skills`
--

LOCK TABLES `skills` WRITE;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
INSERT INTO `skills` VALUES (1,'Perfusionist'),(2,'cleaning'),(3,'Nursing'),(4,'administrative'),(5,'Surgical technologist'),(6,'Pharmacy technician'),(7,'Emergency medical technician'),(8,'Medical assistant'),(9,'Health professional'),(10,'Therapist');
/*!40000 ALTER TABLE `skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'sabasaba18205738'
--

--
-- Dumping routines for database 'sabasaba18205738'
--
/*!50003 DROP PROCEDURE IF EXISTS `APPLICATION_STATUS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `APPLICATION_STATUS`(IN Offer_Status_id INT, DescriptionT varchar(45))
BEGIN
insert INTO sabasaba18205738.application_status(Offer_Status_id,Description)
VALUES (Offer_Status_id , DescriptionT );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CANDIDATE DETAILS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CANDIDATE DETAILS`(IN Cid int, Fname varchar(45),Sname varchar(45),Tel int,email varchar(45))
BEGIN
insert into sabasaba18205738.candidate_details (Candidate_id, Firstname, Surname, Telephone_number,Email)
Values(Cid , Fname,Sname ,Tel,email );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `FindCandidateByID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `FindCandidateByID`(IN CandidateId INT)
BEGIN
SELECT * FROM sabasaba18205738.candidate_details
WHERE  Candidate_id = CandidateId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `FindCandidateBySurname` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `FindCandidateBySurname`(IN CandidateSurname varchar(45))
BEGIN
SELECT * FROM sabasaba18205738.candidate_details
WHERE Surname = CandidateSurname ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `findHospitalByID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `findHospitalByID`(IN Hosp_id int)
BEGIN
SELECT * FROM sabasaba18205738.hospital_details
WHERE Hospital_id = Hosp_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `findHospitalByName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `findHospitalByName`(IN HospName varchar(45))
BEGIN
SELECT * FROM sabasaba18205738.hospital_details
WHERE Hospital_name = HospName;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `HOSPITAL DETAILS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `HOSPITAL DETAILS`(IN HospId int, Hname varchar(45), Address varchar(45),Tnumber int)
BEGIN
Insert into sabasaba18205738.hospital_details (Hospital_id, Hospital_name, Address, Telephone_Number)
VALUES(HospId , Hname, Address ,Tnumber);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `INTERVIEW DETAILS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `INTERVIEW DETAILS`(IN Interview_id INT, Candidate_Details_Candidate_id INT, Interview_Date date,Hospital_Details_Hospital_id INT,Position_Details_Position_id INT, Application_Status_Offer_Status_id INT)
BEGIN
INSERT INTO sabasaba18205738.interview_details (Interview_id , Candidate_Details_Candidate_id , Interview_Date,Hospital_Details_Hospital_id ,Position_Details_Position_id, Application_Status_Offer_Status_id)
VALUES(Interview_id , Candidate_Details_Candidate_id , Interview_Date,Hospital_Details_Hospital_id ,Position_Details_Position_id, Application_Status_Offer_Status_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Interviewed_At_Least_Twice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Interviewed_At_Least_Twice`()
BEGIN
SELECT Firstname, Candidate_id
FROM sabasaba18205738.candidate_details inner JOIN sabasaba18205738.interview_details ON sabasaba18205738.candidate_details.Candidate_id = sabasaba18205738.interview_details.Candidate_Details_Candidate_id
GROUP BY Candidate_id
HAVING COUNT(Interview_id) >= 2;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InterviewsParticularDate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InterviewsParticularDate`(IN Particular_Date datetime)
BEGIN
SELECT * FROM sabasaba18205738.interview_details
WHERE  Interview_Date = Particular_Date;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `link_candidate_to_skills` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `link_candidate_to_skills`(IN CS_ID INT, Candidate_Details_Candidate_id INT, Skills_Skills_id INT)
BEGIN
INSERT INTO sabasaba18205738.link_candidate_to_skills (CS_ID, Candidate_Details_Candidate_id, Skills_Skills_id )
VALUES(CS_ID, Candidate_Details_Candidate_id, Skills_Skills_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `link_position_to_skills` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `link_position_to_skills`(IN SR_id INT,Position_Details_Position_id INT, Skills_Skills_id INT )
BEGIN
INSERT INTO sabasaba18205738.link_position_to_skills (SR_id ,Position_Details_Position_id, Skills_Skills_id)
VALUES (SR_id ,Position_Details_Position_id, Skills_Skills_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Number_Of_Positions_rq_Nursing` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Number_Of_Positions_rq_Nursing`()
BEGIN
SELECT count(Position_Details_Position_id) FROM sabasaba18205738.link_position_to_skills
WHERE Skills_Skills_id = 3;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Number_Of_Successful_Candidates` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Number_Of_Successful_Candidates`()
BEGIN
SELECT count(Candidate_Details_Candidate_id) FROM sabasaba18205738.interview_details
WHERE Application_Status_Offer_Status_id = 3;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Positions_According_To_Hospitals` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Positions_According_To_Hospitals`(IN HospitalId INT)
BEGIN
SELECT * FROM sabasaba18205738.position_details
WHERE Hospital_Details_Hospital_id = HospitalId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `position_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `position_details`(IN Position_id INT,Type_Of_Position varchar(45), Hospital_Details_Hospital_id int)
BEGIN
insert into sabasaba18205738.position_details(Position_id ,Type_Of_Position, Hospital_Details_Hospital_id)
values (Position_id ,Type_Of_Position, Hospital_Details_Hospital_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Postion_rq_Skill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Postion_rq_Skill`(IN SkillGiven int)
BEGIN
SELECT Position_Details_Position_id FROM sabasaba18205738.link_position_to_skills
WHERE Skills_Skills_id = SkillGiven;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Required_Skill_By_Position` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Required_Skill_By_Position`(IN PosId INT)
BEGIN
SELECT * FROM sabasaba18205738.candidate_details c 
inner join link_candidate_to_skills cs on c.Candidate_id = cs.Candidate_Details_Candidate_id
inner join link_position_to_skills ps on ps.Position_Details_Position_id = PosId
WHERE cs.Skills_Skills_id = ps.Skills_Skills_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `skills` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `skills`(in Skills_id int, Description varchar(45) )
BEGIN
insert into sabasaba18205738.skills(Skills_id, Description)
values(Skills_id, Description);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-21 16:53:46
