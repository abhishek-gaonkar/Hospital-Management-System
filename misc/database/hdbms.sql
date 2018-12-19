-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: hdbms
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `department` (
  `deptid` int(11) NOT NULL,
  `dname` varchar(45) DEFAULT NULL,
  `dloc` varchar(45) DEFAULT NULL,
  `hodid` int(11) DEFAULT NULL,
  PRIMARY KEY (`deptid`),
  KEY `hodid_idx` (`hodid`),
  CONSTRAINT `hodidfk` FOREIGN KEY (`hodid`) REFERENCES `doctor` (`docid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Admin','ground',NULL),(2,'Emergency','first',119),(3,'Cardiology','second',106),(4,'Neuorology','third',109),(5,'Oncology','cgblock',108),(6,'Gastroenterology','fourth',115),(7,'Anaesthetics','fourth',117),(8,'Gynaecology','fifth',107),(9,'Urology','fifth',122);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `doctor` (
  `docid` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `sal` int(11) DEFAULT NULL,
  `practype` varchar(45) DEFAULT NULL,
  `deptid` int(11) DEFAULT NULL,
  PRIMARY KEY (`docid`),
  KEY `deptfk_idx` (`deptid`),
  CONSTRAINT `deptfk` FOREIGN KEY (`deptid`) REFERENCES `department` (`deptid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (101,'Manjunath Shastry',35000,'Consultant',6),(102,'Jayanthi Shastry',25000,'Consultant',8),(103,'Ajay Shastry',85000,'Neuro Surgeon',4),(104,'Ananya Shastry',80000,'Cardiac Surgeon',3),(105,'Srihari Kulakarni',10000,'Team Doctor',7),(106,'Sugandhi Sharma',100000,'Cardiac Surgeon',3),(107,'Lalitha Iyer',100000,'Gynaecologist',8),(108,'Padmasini Sridharan',200000,'Oncologist',5),(109,'Shelavapille Iyyangar',300000,'Neuro Surgeon',4),(110,'Snehal Kulakarni',30000,'Team Doctor',5),(111,'Shruthi Nayar',20000,'Team Doctor',4),(112,'Anika Agarwal',20000,'Team Doctor',3),(113,'Arushi Ghosh',15000,'Team Doctor',6),(114,'Nishitha Gowda',55000,'Surgeon',5),(115,'Nikhil Gowda',45000,'lAproscopic Surgeon',6),(116,'Sanjana Hadimani',15000,'Team Doctor',7),(117,'Sripad Desai',75000,'Anaesthetic Expert',7),(118,'Debjani Chatterjee',15000,'Team Doctor',8),(119,'Nischal Mishra',35000,'Surgeon',2),(120,'Arna Nidu',25000,'Surgeon',2),(121,'Adishwar Reddy',25000,'Surgeon',2),(122,'Adisheshulu Naidu',75000,'Urologist',9),(123,'Sumadhwa Kulakarni',45000,'Consultant',9),(124,'Adhokshaj Prahlad',15000,'Team Doctor',9);
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dpass`
--

DROP TABLE IF EXISTS `dpass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dpass` (
  `docid` int(11) NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`docid`),
  CONSTRAINT `dpfk` FOREIGN KEY (`docid`) REFERENCES `doctor` (`docid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dpass`
--

LOCK TABLES `dpass` WRITE;
/*!40000 ALTER TABLE `dpass` DISABLE KEYS */;
INSERT INTO `dpass` VALUES (101,'$2y$10$ft5U3IEBRTa0a1EjWJjoCO.qhYXn3FDInETstpJKUb4NNsu9CS1cC'),(102,'$2y$10$ng9YU87EzeC/EPY9m5Q0wOwMgX.wblXuXLvawhuBlnVXeKUfnk3AG'),(103,'$2y$10$4YNcExmcQoI9HVkdoFOV4eRpPRXrlFCvfiOqteUGVE6KpA1bD0Ieq'),(104,'$2y$10$vdvmrnFVF/26jTDExHVesO1og4X/ohjPn8BtUq1.lO5oLK0d1RHxq'),(105,'$2y$10$x9R1t7gyaMp3PLpJnBfYpO7WMFoub.aa8s7vzOwDyEWQqpPIQgGT2'),(106,'$2y$10$T9KoD7hVTT57uJVeJqSDpuX2iko4bPGYfQuJ.3nSaPNX7v/mV.jPC'),(107,'$2y$10$f8oyW7rwYag9S6N5aO13KuSykxsjEeRJnU04pZjm5GH/.VVhXOxhS'),(108,'$2y$10$.EKRYVdS.9coKs0dLcZM/eQcOuxTJHbpI7AW6IDkzMwI7Jf4DMFcC'),(109,'$2y$10$BUJcmy5PVHAXlctXB98EGuZdnbra0KKCT8pc84hP0YB87mzA0XCe.'),(110,'$2y$10$reqWaBBrYToUe3KBIRrIKOrIcygCctO5fN3nayyAVa9FmTqx6jKoy'),(111,'$2y$10$uEOxWip4bquQsv7Kw23Lbug62uVvD4fJy2gRXgD4X4RulhbEpOPMe'),(112,'$2y$10$WKBQqP3Rz2caqWiV7AfIkuN5.3PV/wpN9E14PszNfvUMbF0ml/nUe'),(113,'$2y$10$Mx9LOmYT8oHzydMJhbdD6.VUw25pgGg8FI2oVAWfeQ/.JXtLztH0a'),(114,'$2y$10$VubvC8R/YQ/eFuWPjvPT4.yIANfEzT5qPoTjzWYdlSb97ZLLrOCQy'),(115,'$2y$10$JsgBUJ6qtNbkTFbKA2snS.PJvayVM6kk.mexUKXgzuka7T7RY9kgy'),(116,'$2y$10$4jOUYl7.EG411frCbM0YTOXu9j.BF7ctqInLjMvM9KyyTeb1EYcYq'),(117,'$2y$10$Q0VfLXHU/MmXnFlLpceR7OTLeVVj3i06RZyPNQXCfPP3P3pHuQ80G'),(118,'$2y$10$vwu8PcV0cm4BNwnqJ/ZEduVbNp80HAG8G0sLz9clasiEFjlaFyKTi'),(119,'$2y$10$AVpchXVHVtcWtKwJC9AGLuLJ/iqfcXhFsPBQz8/bL18Q7pIlrPADG'),(120,'$2y$10$2eY2KqBF7F9.lhnHrbT6ge9uF6Xl2L.I9Ac9MNu6lOg/fQ976hOxu'),(121,'$2y$10$SQErlAQXKtX5U4QwjPC8EutnfD65bp1rhm8NEvq0y2hcJGdcCihLe'),(122,'$2y$10$YzvHeZJjKlv3hNunhDGVb.lOG6fe2oF1UcUHL2ou9UP3ciipBH8iO'),(123,'$2y$10$aWpbP5vJ0F8z1Y/lycya1OCif3P58oBq9S6jc16q7A7mMJroFESBC'),(124,'$2y$10$ru4ezn2UVih/LKVxdl3tOOHXpuI1IAP.b2H2hbKi3qI0Cwi9rsWHS');
/*!40000 ALTER TABLE `dpass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `patient` (
  `pid` int(11) NOT NULL,
  `pname` varchar(45) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `phno` char(10) DEFAULT NULL,
  `disease` varchar(45) DEFAULT NULL,
  `docid` int(11) DEFAULT NULL,
  `admitdate` date DEFAULT NULL,
  `wardno` int(11) DEFAULT NULL,
  `pgender` char(1) DEFAULT NULL,
  `passwd` varchar(100) NOT NULL,
  PRIMARY KEY (`pid`),
  KEY `pdocfk_idx` (`docid`),
  KEY `pdwfk_idx` (`wardno`),
  CONSTRAINT `pdocfk` FOREIGN KEY (`docid`) REFERENCES `doctor` (`docid`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `pdwfk` FOREIGN KEY (`wardno`) REFERENCES `wards` (`wardno`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (301,'Thimmegowda',65,'9845190852','Liver Cirrohsis',101,'2018-08-23',1506,'m','$2y$10$OdWsroMTN385ko/rf/0kiut9cfrJdfr7VjI66cdTESyAov89l0UiC'),(302,'Niharika',48,'9765190802','Fibroid Uterus',102,'2018-09-11',1304,'f','$2y$10$0yPNpQXWME37ooqIZ0N5AuYPWXP2unwBkiozMfVHKKQrtzQo1H.VC'),(303,'Advika',28,'9723898020','PCOS',107,'2018-02-10',1306,'f','$2y$10$w6J0soYfDQpR3G4aYQlX1.NJj5R00JP24Y8wWVxtIBFeSH6HnQH26'),(304,'Hari Kumar',54,'8523898025','Cardiac Arrest',104,'2018-03-22',1201,'m','$2y$10$HqNfsMvOG/slzS.D.u4OTuatDpzMFeR0UGBQ4WjZxjCDCcRGJjq2C'),(305,'Harish',54,NULL,'Brain Tumor',103,'2018-05-22',1101,'m','$2y$10$TeXbOm9PaJdiEoyVcDVtqOBxDFmLkSgx/obZ.KeWdxeIOj5eSqyc2'),(306,'Karibasappa',79,NULL,'Colon Cancer',110,'2018-05-22',1406,'m','$2y$10$UWYmBgQsVtSQPptFedHkQOxZmlLbgclHTPuh/eGOuOEF1CoiRAqb6'),(307,'Nagappa',39,'8890772329','Stroke',109,'2018-05-24',1403,'m','$2y$10$yMGi84o0GvU9TmkbQ1/fke2eciaT30UwpzuUzLhho3NMyxs90nxky'),(308,'Narendra',44,'9023077232','Leukamia',108,'2018-06-15',1401,'m','$2y$10$6Taa3NExAwYZHpLwEWjLAuChYruzHJpEfDmpXDYoN9vBJAcvFF4uK'),(309,'Smrithi',5,'7234509816','Septal Hole',106,'2018-06-15',1406,'f','$2y$10$3.D24j/HM2leShujvACc.uNMP9BEL1TAA.EKTUHXHj240biaU9U6W'),(310,'Sharada',95,'7234902341','Gall Stones',115,'2018-07-25',1403,'f','$2y$10$liIEtZpmsuzvLNmVjpxokOEJJHyTf20OX9AhTtE3Q8JBYDoGyvUS6'),(311,'Mrinalini',35,'8034902341','Cerebral Palsy',111,'2018-04-12',1303,'f','$2y$10$/5.kaQxZzuZtZ1MAiXtVGeYoDNcwOZaIw4MDtmD3qbcU5fAqGbTt2'),(312,'Mallika',55,'9834902341','Breast Cancer',108,'2018-05-11',1504,'f','$2y$10$yweJfK135VXGMflntAckgezQjxG4b.ETl/rHH9zvulr7I0h8ai6Xe'),(313,'Srinidhi',43,'9123902341','Head Injury',119,'2018-06-01',1404,'m','$2y$10$up2SBjG8qggMiyO2vghPaObj4ZWlZuhBq8wRXfixTtblPxc.XN70K'),(314,'Sumathi',45,'8053902341','Liver Enlargement',113,'2018-07-04',1405,'f','$2y$10$AWQ7nwMwVc9JeOI5.3rGCuDeGMSC7fR5G6tO5eIXQ41uefxZsZVbW'),(315,'Abhishek',42,'7789002803','Kidney Failure',123,'2018-07-06',1302,'m','$2y$10$hNx/HsNUPZHx94SGGmNNTu/twN3uZues3DGdn9pvQ9X6jWP8OL0Rq'),(316,'Nischal',22,'8123900280','Kidney Stones',124,'2018-04-09',1303,'m','$2y$10$toDJySogYmdw48wRhUdT.OHUjefnc5sr9W3n9iqtt/120/AcMnV4a'),(317,'Basheer',67,'8723334580','Appendicitis',113,'2018-02-25',1406,'m','$2y$10$0rF54f1jkPz1yKNSHmxqOOp6nYRJpZzn2BO5ThjGiZ7bHrw16GiXG'),(318,'Peter',27,'9033334580','Kidney Stones',124,'2018-02-25',1406,'m','$2y$10$HzKjcK/TgVS1DY8uP/6oGexjfHglpP3y.ngZx.0/gUqf5gWHhQ20m'),(319,'Isabella',35,'7233884580','Parkinsons',104,'2018-03-08',1505,'f','$2y$10$FD4k4.5Tk8CZoB/ogtdc3uRSR2Oh3IbnOTvZz0SBUjjj9vaj4vRjG');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `patient_AFTER_INSERT` BEFORE INSERT ON `patient` FOR EACH ROW BEGIN
	if char_length(new.phno)<10
		then set new.phno=null;
	end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tests`
--

DROP TABLE IF EXISTS `tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tests` (
  `testid` int(11) NOT NULL,
  `docid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `tname` varchar(45) DEFAULT NULL,
  `costs` int(11) DEFAULT NULL,
  PRIMARY KEY (`testid`,`docid`,`pid`),
  KEY `tdocfk_idx` (`docid`),
  KEY `tpifk_idx` (`pid`),
  CONSTRAINT `tdocfk` FOREIGN KEY (`docid`) REFERENCES `doctor` (`docid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tpifk` FOREIGN KEY (`pid`) REFERENCES `patient` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests`
--

LOCK TABLES `tests` WRITE;
/*!40000 ALTER TABLE `tests` DISABLE KEYS */;
INSERT INTO `tests` VALUES (61,101,301,'Endoscopy',2500),(62,102,302,'Pelvic Exam',1500),(63,107,303,'Ultrasound Scan',2000),(64,104,304,'Angiogram',5000),(65,103,305,'MRI',7000),(66,110,306,'Colonoscopy',7000),(68,109,307,'CPSS',1000),(69,108,308,'Biopsy',5000),(70,106,309,'ECG',1000),(71,115,310,'Colongioscopy',4000),(72,111,311,'MRI',10000),(73,108,312,'Mammography',12000),(74,119,313,'MRI',7000),(75,113,314,'Endoscopy',2500),(76,123,315,'Serum Creatinine',5500),(77,124,316,'Ultrasound',3500),(78,113,317,'Colonoscopy',2500),(79,124,318,'Ultrasound',3500),(80,104,319,'CT Scan',6000);
/*!40000 ALTER TABLE `tests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treatment`
--

DROP TABLE IF EXISTS `treatment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `treatment` (
  `trid` int(11) NOT NULL,
  `docid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `mname` varchar(45) DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  PRIMARY KEY (`trid`,`docid`,`pid`),
  KEY `mdocfk_idx` (`docid`),
  KEY `mpfk_idx` (`pid`),
  CONSTRAINT `mdocfk` FOREIGN KEY (`docid`) REFERENCES `doctor` (`docid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mpfk` FOREIGN KEY (`pid`) REFERENCES `patient` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treatment`
--

LOCK TABLES `treatment` WRITE;
/*!40000 ALTER TABLE `treatment` DISABLE KEYS */;
INSERT INTO `treatment` VALUES (5602,102,302,'Hysterectomy',60000),(5603,107,303,'Laparoscopic Ovarine Drilling',20000),(5604,104,304,'Bypass Surgery',70000),(5606,108,312,'Chemotherapy',100000),(5607,109,307,'Physiotherapy',10000),(5608,108,308,'Immunetherapy',50000),(5609,106,309,'Cardiac Catheterization',45000),(5610,115,310,'Laparoscopy',55000),(5611,111,311,'CSV',65000),(5612,119,313,'RP Surgery',30000),(5613,113,314,'Liver ASD',30000),(5614,123,315,'Kidney Transplant',300000),(5615,124,316,'StoneCR Surgery',38000),(5615,124,318,'StoneCR Surgery',38000),(5616,113,317,'APR Surgery',40000),(5617,104,319,'Stemcell Treatment',98000);
/*!40000 ALTER TABLE `treatment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wards`
--

DROP TABLE IF EXISTS `wards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `wards` (
  `wardno` int(11) NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  `charges` int(11) DEFAULT NULL,
  PRIMARY KEY (`wardno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wards`
--

LOCK TABLES `wards` WRITE;
/*!40000 ALTER TABLE `wards` DISABLE KEYS */;
INSERT INTO `wards` VALUES (1101,'ICU',25000),(1201,'ICU 2',25000),(1301,'Special',15000),(1302,'Special',15000),(1303,'Semi Special',10000),(1304,'Semi Special',10000),(1305,'General',5000),(1306,'General',5000),(1401,'Special',15000),(1402,'Semi Special',10000),(1403,'Semi Special',10000),(1404,'Special',15000),(1405,'General',5000),(1406,'General',5000),(1501,'Special',15000),(1502,'Special',15000),(1503,'Semi Special',10000),(1504,'Semi Special',10000),(1505,'General',5000),(1506,'General',5000);
/*!40000 ALTER TABLE `wards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'hdbms'
--

--
-- Dumping routines for database 'hdbms'
--
/*!50003 DROP PROCEDURE IF EXISTS `bill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `bill`(in ppid int,out total int)
BEGIN
   select tr.cost,t.costs,w.charges,(tr.cost+t.costs+w.charges) as total
   from treatment tr,tests t,wards w,patient p
   where tr.pid=p.pid and t.pid=p.pid
   and w.wardno=p.wardno
   and p.pid=ppid;
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

-- Dump completed on 2018-12-07 16:01:12
