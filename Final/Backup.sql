CREATE DATABASE  IF NOT EXISTS `billionaires_lkw` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `billionaires_lkw`;
-- MySQL dump 10.13  Distrib 8.0.34, for macos13 (arm64)
--
-- Host: 127.0.0.1    Database: billionaires_lkw
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `billionaires`
--

DROP TABLE IF EXISTS `billionaires`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billionaires` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_location` int NOT NULL,
  `placement` int DEFAULT NULL,
  `fullname` varchar(60) NOT NULL,
  `firstName` varchar(30) DEFAULT NULL,
  `lastName` varchar(30) DEFAULT NULL,
  `gender` varchar(25) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `BirthYear` int DEFAULT NULL,
  `BirthMonth` int DEFAULT NULL,
  `BirthDay` int DEFAULT NULL,
  `resCountry` varchar(50) DEFAULT NULL,
  `industry` varchar(45) DEFAULT NULL,
  `organization` varchar(45) DEFAULT NULL,
  `status` enum('d','u') DEFAULT 'd',
  `source` varchar(50) DEFAULT NULL,
  `selfMade` tinyint(1) DEFAULT NULL,
  `finalWorth` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_billionaire` (`ID_location`),
  CONSTRAINT `fk_billionaire` FOREIGN KEY (`ID_location`) REFERENCES `locations` (`ID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billionaires`
--

LOCK TABLES `billionaires` WRITE;
/*!40000 ALTER TABLE `billionaires` DISABLE KEYS */;
INSERT INTO `billionaires` VALUES (1,5,2,'Elon Musk','Elon','Musk','M',51,'1971-06-28',1971,6,28,'United States','Automotive','Tesla','d','Tesla, SpaceX',1,180000),(2,11,3,'Jeff Bezos','Jeff','Bezos','M',59,'1964-01-12',1964,1,12,'United States','Technology','Amazon','d','Amazon',1,114000),(3,9,4,'Larry Ellison','Larry','Ellison','M',78,'1944-08-17',1944,8,17,'United States','Technology','Oracle','u','Oracle',1,107000),(4,15,5,'Warren Buffett','Warren','Buffett','M',92,'1930-08-30',1930,8,30,'United States','Finance & Investments','Berkshire Hathaway Inc (ClA)','d','Berkshire Hathaway',1,106000),(5,11,6,'Bill Gates','Bill','Gates','M',67,'1955-10-28',1955,10,28,'United States','Technology','Bill & Melinda Gates Foundation','d','Microsoft',1,104000),(6,14,7,'Michael Bloomberg','Michael','Bloomberg','M',81,'1942-02-14',1942,2,14,'United States','Media & Entertainment','Bloomberg','u','Bloomberg LP',1,94500),(7,12,8,'Carlos Slim Helu & family','Carlos','Slim Helu','M',83,'1940-01-28',1940,1,28,'Mexico','Telecom','America Movil','u','Telecom',1,93000),(8,13,9,'Mukesh Ambani','Mukesh','Ambani','M',65,'1957-04-19',1957,4,19,'India','Diversified','Reliance Industries','d','Diversified',0,83400),(9,7,10,'Steve Ballmer','Steve','Ballmer','M',67,'1956-03-24',1956,3,24,'United States','Technology','Los Angeles Clippers','d','Microsoft',1,80700),(10,17,11,'Francoise Bettencourt Meyers & family','Francoise','Bettencourt Meyers','F',69,'1953-07-10',1953,7,10,'France','Fashion & Retail','','u','LOreal',0,80500),(11,16,12,'Larry Page','Larry','Page','M',50,'1973-03-26',1973,3,26,'United States','Technology','Alphabet','d','Google',1,79200),(12,8,13,'Amancio Ortega','Amancio','Ortega','M',87,'1936-03-28',1936,3,28,'Spain','Fashion & Retail','','u','Zara',1,77300),(13,10,14,'Sergey Brin','Sergey','Brin','M',49,'1973-08-21',1973,8,21,'United States','Technology','Alphabet','d','Google',1,76000),(14,3,15,'Zhong Shanshan','Shanshan','Zhong','M',68,'1954-12-01',1954,12,1,'China','Food & Beverage','','u','Beverages, pharmaceuticals',1,68000),(15,16,16,'Mark Zuckerberg','Mark','Zuckerberg','M',38,'1984-05-14',1984,5,14,'United States','Technology','Meta Platforms','d','Facebook',1,64400),(16,19,17,'Charles Koch & family','Charles','Koch','M',87,'1935-11-01',1935,11,1,'United States','Diversified','Koch Industries','d','Koch Industries',0,59000),(17,14,17,'Julia Koch & family','Julia','Koch','F',60,'1962-04-12',1962,4,12,'United States','Diversified','','d','Koch Industries',0,59000),(18,4,19,'Jim Walton','Jim','Walton','M',74,'1948-06-07',1948,6,7,'United States','Fashion & Retail','Arvest Bank Group','d','Walmart',0,58800),(19,4,20,'Rob Walton & family','Rob','Walton','M',78,'1944-10-27',1944,10,27,'United States','Fashion & Retail','Walmart','d','Walmart',0,57600),(20,2,21,'Alice Walton','Alice','Walton','F',73,'1949-10-07',1949,10,7,'United States','Fashion & Retail','Crystal Bridges Museum of American Art','d','Walmart',0,56700),(21,18,22,'David Thomson & family','David','Thomson','M',65,'1957-06-12',1957,6,12,'Canada','Media & Entertainment','Thomson Reuters Corporation','u','Media',0,54400),(22,5,23,'Michael Dell','Michael','Dell','M',58,'1965-02-23',1965,2,23,'United States','Technology','Dell Inc','d','Dell Technologies',1,50100),(23,1,24,'Gautam Adani','Gautam','Adani','M',60,'1962-06-24',1962,6,24,'India','Diversified','','d','Infrastructure, commodities',1,47200),(24,6,25,'Phil Knight & family','Phil','Knight','M',12,'1938-02-24',1938,2,24,'United States','Fashion & Retail','Nike','d','Nike',1,45100),(25,2,26,'Marcos Galperin','Marcos','Galperin','M',52,'1971-10-31',1971,10,31,'Argentina','Technology','Mercado Libre','d','MELI',1,670000);
/*!40000 ALTER TABLE `billionaires` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `billionaires_rest`
--

DROP TABLE IF EXISTS `billionaires_rest`;
/*!50001 DROP VIEW IF EXISTS `billionaires_rest`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `billionaires_rest` AS SELECT 
 1 AS `id`,
 1 AS `id_location`,
 1 AS `firstName`,
 1 AS `lastName`,
 1 AS `gender`,
 1 AS `age`,
 1 AS `resCountry`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `billionaires_usa`
--

DROP TABLE IF EXISTS `billionaires_usa`;
/*!50001 DROP VIEW IF EXISTS `billionaires_usa`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `billionaires_usa` AS SELECT 
 1 AS `id`,
 1 AS `id_location`,
 1 AS `firstName`,
 1 AS `lastName`,
 1 AS `gender`,
 1 AS `age`,
 1 AS `resCountry`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `business_billionaire`
--

DROP TABLE IF EXISTS `business_billionaire`;
/*!50001 DROP VIEW IF EXISTS `business_billionaire`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `business_billionaire` AS SELECT 
 1 AS `businessrank`,
 1 AS `firstName`,
 1 AS `lastName`,
 1 AS `gender`,
 1 AS `age`,
 1 AS `resCountry`,
 1 AS `finalWorth`,
 1 AS `selfMade`,
 1 AS `organization`,
 1 AS `industry`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `businesses`
--

DROP TABLE IF EXISTS `businesses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `businesses` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_billionaire` int NOT NULL,
  `organization` varchar(60) DEFAULT NULL,
  `category` varchar(40) DEFAULT NULL,
  `industry` varchar(30) DEFAULT NULL,
  `title` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_businesses_billionaire` (`ID_billionaire`),
  CONSTRAINT `fk_businesses_billionaire` FOREIGN KEY (`ID_billionaire`) REFERENCES `billionaires` (`ID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `businesses`
--

LOCK TABLES `businesses` WRITE;
/*!40000 ALTER TABLE `businesses` DISABLE KEYS */;
INSERT INTO `businesses` VALUES (1,1,'LVMH Moet Hennessy Louis Vuitton','Fashion & Retail','Fashion & Retail','Chairman and CEO'),(2,2,'Tesla','Automotive','Automotive','CEO'),(3,3,'Amazon','Technology','Technology','Chairman and Founder'),(4,4,'Oracle','Technology','Technology','CTO and Founder'),(5,5,'Berkshire Hathaway Inc (ClA)','Finance & Investments','Finance & Investments','CEO'),(6,6,'Bill & Melinda Gates Foundation','Technology','Technology','Cochair'),(7,7,'Bloomberg','Media & Entertainment','Media & Entertainment','CEO'),(8,8,'America Movil','Telecom','Telecom','Honorary Chairman'),(9,9,'Reliance Industries','Diversified','Diversified','Founder and Chairman'),(10,10,'Los Angeles Clippers','Technology','Technology','Owner'),(11,11,'','Fashion & Retail','Fashion & Retail',''),(12,12,'Alphabet','Technology','Technology','Cofounder and board member'),(13,13,'','Fashion & Retail','Fashion & Retail',''),(14,14,'Alphabet','Technology','Technology','Cofounder and board member'),(15,15,'','Food & Beverage','Food & Beverage',''),(16,16,'Meta Platforms','Technology','Technology','Cofounder'),(17,17,'Koch Industries','Diversified','Diversified','Chairman and CEO'),(18,18,'','Diversified','Diversified',''),(19,19,'Arvest Bank Group','Fashion & Retail','Fashion & Retail','Chairman and CEO'),(20,20,'Walmart','Fashion & Retail','Fashion & Retail','Director'),(21,21,'Crystal Bridges Museum of American Art','Fashion & Retail','Fashion & Retail','Philanthropist'),(22,22,'Thomson Reuters Corporation','Media & Entertainment','Media & Entertainment','Chairman'),(23,23,'Dell Inc','Technology','Technology','Chairman and CEO'),(24,24,'','Diversified','Diversified',''),(25,25,'Nike','Fashion & Retail','Fashion & Retail','Chairman');
/*!40000 ALTER TABLE `businesses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `economics`
--

DROP TABLE IF EXISTS `economics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `economics` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_location` int NOT NULL,
  `CPI` decimal(5,1) DEFAULT NULL,
  `CPIChanges` decimal(3,1) DEFAULT NULL,
  `GDP` bigint DEFAULT NULL,
  `tertiaryEducation` decimal(4,2) DEFAULT NULL,
  `primaryEducation` decimal(5,2) DEFAULT NULL,
  `lifeExpectancy` decimal(4,2) DEFAULT NULL,
  `population` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_economics_billionaire` (`ID_location`),
  CONSTRAINT `fk_economics_billionaire` FOREIGN KEY (`ID_location`) REFERENCES `locations` (`ID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `economics`
--

LOCK TABLES `economics` WRITE;
/*!40000 ALTER TABLE `economics` DISABLE KEYS */;
INSERT INTO `economics` VALUES (1,1,110.1,1.1,2715520000000,1.00,1.00,1.00,1),(2,2,117.2,7.5,21427700000000,88.20,101.80,78.50,328239523),(3,11,117.2,7.5,21427700000000,88.20,101.80,78.50,328239523),(4,9,117.2,7.5,21427700000000,88.20,101.80,78.50,328239523),(5,15,117.2,7.5,21427700000000,88.20,101.80,78.50,328239523),(6,11,117.2,7.5,21427700000000,88.20,101.80,78.50,328239523),(7,14,117.2,7.5,21427700000000,88.20,101.80,78.50,328239523),(8,12,141.5,3.6,1258290000000,40.20,105.80,75.00,126014024),(9,13,180.4,7.7,2611000000000,28.10,113.00,69.40,1366417754),(10,7,117.2,7.5,21427700000000,88.20,101.80,78.50,328239523),(11,17,110.1,1.1,2715520000000,65.60,102.50,82.50,67059887),(12,16,117.2,7.5,21427700000000,88.20,101.80,78.50,328239523),(13,8,111.0,0.7,1394120000000,88.90,102.70,83.30,47076781),(14,10,117.2,7.5,21427700000000,88.20,101.80,78.50,328239523),(15,5,125.1,2.9,19910000000000,50.60,100.20,77.00,1397715000),(16,16,117.2,7.5,21427700000000,88.20,101.80,78.50,328239523),(17,19,117.2,7.5,21427700000000,88.20,101.80,78.50,328239523),(18,14,117.2,7.5,21427700000000,88.20,101.80,78.50,328239523),(19,4,117.2,7.5,21427700000000,88.20,101.80,78.50,328239523),(20,4,117.2,7.5,21427700000000,88.20,101.80,78.50,328239523),(21,3,117.2,7.5,21427700000000,88.20,101.80,78.50,328239523),(22,18,116.8,1.9,1736430000000,68.90,100.90,81.90,36991981),(23,2,117.2,7.5,21427700000000,88.20,101.80,78.50,328239523),(24,1,180.4,7.7,2611000000000,28.10,113.00,69.40,1366417754),(25,6,117.2,7.5,21427700000000,88.20,101.80,78.50,328239523);
/*!40000 ALTER TABLE `economics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `gdp_rich`
--

DROP TABLE IF EXISTS `gdp_rich`;
/*!50001 DROP VIEW IF EXISTS `gdp_rich`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `gdp_rich` AS SELECT 
 1 AS `id`,
 1 AS `id_location`,
 1 AS `firstName`,
 1 AS `lastName`,
 1 AS `gender`,
 1 AS `age`,
 1 AS `resCountry`,
 1 AS `finalWorth`,
 1 AS `GDP`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `citiCountry` varchar(50) DEFAULT NULL,
  `region` varchar(35) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `city` varchar(60) DEFAULT NULL,
  `latitude` decimal(9,6) DEFAULT NULL,
  `longitude` decimal(9,6) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'India','','','Ahmedabad',20.593684,78.962880),(2,'United States','Texas','South','Fort Worth',37.090240,-95.712891),(3,'China','','','Beijing',35.861660,104.195397),(4,'United States','Arkansas','South','Bentonville',37.090240,-95.712891),(5,'United States','Texas','South','Austin',37.090240,-95.712891),(6,'United States','Oregon','West','Hillsboro',37.090240,-95.712891),(7,'United States','Washington','West','Hunts Point',37.090240,-95.712891),(8,'Spain','','','La Coruna',40.463667,-3.749220),(9,'United States','Hawaii','West','Lanai',37.090240,-95.712891),(10,'United States','California','West','Los Altos',37.090240,-95.712891),(11,'United States','Washington','West','Medina',37.090240,-95.712891),(12,'Mexico','','','Mexico City',23.634501,-102.552784),(13,'India','','','Mumbai',20.593684,78.962880),(14,'United States','New York','Northeast','New York',37.090240,-95.712891),(15,'United States','Nebraska','Midwest','Omaha',37.090240,-95.712891),(16,'United States','California','West','Palo Alto',37.090240,-95.712891),(17,'France','','','Paris',46.227638,2.213749),(18,'Canada','','','Toronto',56.130366,-106.346771),(19,'United States','Kansas','Midwest','Wichita',37.090240,-95.712891),(67,'Argentina','South','Buenos Aires','CABA',34.603700,58.381600);
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `tax_economics`
--

DROP TABLE IF EXISTS `tax_economics`;
/*!50001 DROP VIEW IF EXISTS `tax_economics`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `tax_economics` AS SELECT 
 1 AS `citiCountry`,
 1 AS `city`,
 1 AS `totalTaxRate`,
 1 AS `taxRevenue`,
 1 AS `CPI`,
 1 AS `CPIChanges`,
 1 AS `GDP`,
 1 AS `tertiaryEducation`,
 1 AS `primaryEducation`,
 1 AS `lifeExpectancy`,
 1 AS `population`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `taxes`
--

DROP TABLE IF EXISTS `taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taxes` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_economic` int NOT NULL,
  `totalTaxRate` decimal(3,1) DEFAULT NULL,
  `taxRevenue` decimal(3,1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_taxes_economics` (`ID_economic`),
  CONSTRAINT `fk_taxes_economics` FOREIGN KEY (`ID_economic`) REFERENCES `economics` (`ID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxes`
--

LOCK TABLES `taxes` WRITE;
/*!40000 ALTER TABLE `taxes` DISABLE KEYS */;
INSERT INTO `taxes` VALUES (1,1,60.7,24.2),(2,2,36.6,9.6),(3,3,36.6,9.6),(4,4,36.6,9.6),(5,5,36.6,9.6),(6,6,36.6,9.6),(7,7,36.6,9.6),(8,8,55.1,13.1),(9,9,49.7,11.2),(10,10,36.6,9.6),(11,11,60.7,24.2),(12,12,36.6,9.6),(13,13,47.0,14.2),(14,14,36.6,9.6),(15,15,59.2,9.4),(16,16,36.6,9.6),(17,17,36.6,9.6),(18,18,36.6,9.6),(19,19,36.6,9.6),(20,20,36.6,9.6),(21,21,36.6,9.6),(22,22,24.5,12.8),(23,23,36.6,9.6),(24,24,49.7,11.2),(25,25,36.6,9.6);
/*!40000 ALTER TABLE `taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `updated_fields`
--

DROP TABLE IF EXISTS `updated_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `updated_fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_location` int DEFAULT NULL,
  `placement` int DEFAULT NULL,
  `fullname` varchar(60) DEFAULT NULL,
  `firstName` varchar(30) DEFAULT NULL,
  `lastName` varchar(30) DEFAULT NULL,
  `gender` varchar(25) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `birthYear` int DEFAULT NULL,
  `birthMonth` int DEFAULT NULL,
  `birthDay` int DEFAULT NULL,
  `resCountry` varchar(50) DEFAULT NULL,
  `industry` varchar(45) DEFAULT NULL,
  `organization` varchar(45) DEFAULT NULL,
  `status` enum('d','u') DEFAULT NULL,
  `source` varchar(50) DEFAULT NULL,
  `selfMade` tinyint(1) DEFAULT NULL,
  `finalWorth` int DEFAULT NULL,
  `commentary` varchar(100) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `user` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `updated_fields`
--

LOCK TABLES `updated_fields` WRITE;
/*!40000 ALTER TABLE `updated_fields` DISABLE KEYS */;
INSERT INTO `updated_fields` VALUES (1,6,25,'Phil Knight & family','Phil','Knight','M',85,'1938-02-24',1938,2,24,'United States','Fashion & Retail','Nike','d','Nike',1,45100,'Los datos de un billonario han sido modificado','2024-01-08 08:35:14','root@localhost'),(25,2,26,'Marcos Galperin','Marcos','Galperin','M',52,'1971-10-31',1971,10,31,'Argentina','Technology','Mercado Libre','d','MELI',1,670000,'Se ingreso un nuevo billonario','2024-01-08 08:36:18','root@localhost'),(26,6,25,'Phil Knight & family','Phil','Knight','M',12,'1938-02-24',1938,2,24,'United States','Fashion & Retail','Nike','d','Nike',1,45100,'Los datos de un billonario han sido modificado','2024-01-08 08:52:28','root@localhost');
/*!40000 ALTER TABLE `updated_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `updated_location`
--

DROP TABLE IF EXISTS `updated_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `updated_location` (
  `id` int NOT NULL AUTO_INCREMENT,
  `old_id` int DEFAULT NULL,
  `citiCountry` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `region` varchar(35) DEFAULT NULL,
  `city` varchar(60) DEFAULT NULL,
  `latitude` decimal(10,6) DEFAULT NULL,
  `longitude` decimal(10,6) DEFAULT NULL,
  `commentary` varchar(50) DEFAULT NULL,
  `fecha_hora` datetime DEFAULT NULL,
  `usuario` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `updated_location`
--

LOCK TABLES `updated_location` WRITE;
/*!40000 ALTER TABLE `updated_location` DISABLE KEYS */;
INSERT INTO `updated_location` VALUES (50,NULL,'valor',NULL,NULL,NULL,NULL,NULL,'Se ingreso una nueva locacion','2024-01-08 08:52:28','root@localhost'),(51,NULL,'Argentina','Buenos Aires','South','CABA',34.603700,58.381600,'Se ingreso una nueva locacion','2024-01-08 08:38:52','root@localhost'),(52,50,'valor',NULL,NULL,NULL,NULL,NULL,'se elimina una location','2024-01-08 08:39:41','root@localhost'),(53,50,'valor',NULL,NULL,NULL,NULL,NULL,'se elimina una location','2024-01-08 08:52:28','root@localhost'),(56,NULL,'valor',NULL,NULL,NULL,NULL,NULL,'Se ingreso una nueva locacion','2024-01-29 17:35:49','root@localhost'),(57,NULL,'valor',NULL,NULL,NULL,NULL,NULL,'Se ingreso una nueva locacion','2024-01-29 17:44:52','root@localhost'),(58,56,'valor',NULL,NULL,NULL,NULL,NULL,'se elimina una location','2024-01-29 17:45:31','root@localhost'),(59,57,'valor',NULL,NULL,NULL,NULL,NULL,'se elimina una location','2024-01-29 17:46:37','root@localhost'),(60,NULL,'valor',NULL,NULL,NULL,NULL,NULL,'Se ingreso una nueva locacion','2024-01-29 17:48:11','root@localhost'),(61,60,'valor',NULL,NULL,NULL,NULL,NULL,'se elimina una location','2024-01-29 17:48:26','root@localhost'),(62,51,'Argentina','Buenos Aires','South','CABA',34.603700,58.381600,'se elimina una location','2024-01-29 18:05:53','root@localhost'),(63,NULL,'Argentina','Buenos Aires','South','CABA',34.603700,58.381600,'Se ingreso una nueva locacion','2024-01-29 18:10:12','root@localhost'),(64,NULL,'Argentina','Buenos Aires','South','CABA',34.603700,58.381600,'Se ingreso una nueva locacion','2024-01-29 18:10:29','root@localhost'),(65,63,'Argentina','Buenos Aires','South','CABA',34.603700,58.381600,'se elimina una location','2024-01-29 18:10:44','root@localhost'),(66,64,'Argentina','Buenos Aires','South','CABA',34.603700,58.381600,'se elimina una location','2024-01-29 18:11:03','root@localhost'),(67,NULL,'Argentina','Buenos Aires','South','CABA',34.603700,58.381600,'Se ingreso una nueva locacion','2024-01-29 18:11:15','root@localhost');
/*!40000 ALTER TABLE `updated_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `wealth_billionaire`
--

DROP TABLE IF EXISTS `wealth_billionaire`;
/*!50001 DROP VIEW IF EXISTS `wealth_billionaire`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `wealth_billionaire` AS SELECT 
 1 AS `billionaire_id`,
 1 AS `billionaire_firstName`,
 1 AS `billionaire_lastName`,
 1 AS `title`,
 1 AS `organization`,
 1 AS `category`,
 1 AS `industry`,
 1 AS `source`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `wealths`
--

DROP TABLE IF EXISTS `wealths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wealths` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_business` int NOT NULL,
  `industry` varchar(30) DEFAULT NULL,
  `source` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_wealth_business` (`ID_business`),
  CONSTRAINT `fk_wealth_business` FOREIGN KEY (`ID_business`) REFERENCES `businesses` (`ID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wealths`
--

LOCK TABLES `wealths` WRITE;
/*!40000 ALTER TABLE `wealths` DISABLE KEYS */;
INSERT INTO `wealths` VALUES (1,1,'Fashion & Retail','LVMH'),(2,2,'Automotive','Tesla and SpaceX'),(3,3,'Technology','Amazon'),(4,4,'Technology','Oracle'),(5,5,'Finance & Investments','Berkshire Hathaway'),(6,6,'Technology','Microsoft'),(7,7,'Media & Entertainment','Bloomberg LP'),(8,8,'Telecom','Telecom'),(9,9,'Diversified','Diversified'),(10,10,'Technology','Microsoft'),(11,11,'Fashion & Retail','LOreal'),(12,12,'Technology','Google'),(13,13,'Fashion & Retail','Zara'),(14,14,'Technology','Google'),(15,15,'Food & Beverage','Beverages and pharma'),(16,16,'Technology','Facebook'),(17,17,'Diversified','Koch Industries'),(18,18,'Diversified','Koch Industries'),(19,19,'Fashion & Retail','Walmart'),(20,20,'Fashion & Retail','Walmart'),(21,21,'Fashion & Retail','Walmart'),(22,22,'Media & Entertainment','Media'),(23,23,'Technology','Dell Technologies'),(24,24,'Diversified','Infrastructure commodities'),(25,25,'Fashion & Retail','Nike');
/*!40000 ALTER TABLE `wealths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'billionaires_lkw'
--
/*!50003 DROP FUNCTION IF EXISTS `f_get_Billionaires_Distribution` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `f_get_Billionaires_Distribution`(country VARCHAR(60)) RETURNS varchar(60) CHARSET utf8mb4
    READS SQL DATA
BEGIN
	DECLARE total_countries INT;

    SET total_countries = (
        SELECT COUNT( citiCountry) 
        FROM locations l
        WHERE l.citiCountry = country
    );
    -- Return the count of distinct citiCountry values
    RETURN total_countries;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `f_top_ten` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `f_top_ten`(first_name VARCHAR(50), last_name VARCHAR(50)) RETURNS tinyint(1)
    READS SQL DATA
BEGIN
	DECLARE exist_in_top_ten BOOLEAN;
    
  SET exist_in_top_ten = (
        SELECT COUNT(*)
        FROM billionaires b
        WHERE b.firstName = first_name AND b.lastName = last_name 
	AND b.finalWorth >= (
            SELECT MIN(finalWorth)
            FROM (
                SELECT finalWorth
                FROM billionaires
                ORDER BY finalWorth DESC
                LIMIT 10
            ) AS top_10
          )
    ) > 0;
    RETURN exist_in_top_ten;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_or_delete_data` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_or_delete_data`(
    IN actionChosen VARCHAR(10),
    IN tableName VARCHAR(30),
    IN id INT,
    IN field1 VARCHAR(50),
    IN dataInsert VARCHAR(100)
)
BEGIN
-- CREO UN CONDICIONAL SI ELIJE DE ACTIONCHOSEN INSERT 
 IF actionChosen = 'INSERT' THEN 
        -- INSERTAR DATOS EN LA TABLA. CREO UN UNICO STATEMENT CONCATENANDOLO. LE DIGO QUE
        -- EN LA TABLENAME QUE ENVIO QUE INSERTE EN EL ID Y EL FIELD 1 LOS VALUES QUE LE VOY A PASAR
        SET @T1 = CONCAT('INSERT INTO ', tableName, ' (id, ', field1, ') VALUES (?, ?)');
        -- PREPARO EL STATEMENT PARA EJECUTARLO
        PREPARE param_stmt FROM @T1;
        -- SETEO LAS VARIABLES ID Y DATAINSERTE
        SET @id = id;
        SET @dataInsert = dataInsert;
        -- EJECUTO EL STATEMENT  USANDO LAS VARIABLES DECLARADAS
        EXECUTE param_stmt USING @id, @dataInsert;
        -- LIMPIO EL STATEMENT
        DEALLOCATE PREPARE param_stmt;
        
  -- SI ELIJE COMO ACTIONCHOSEN DELETE
  ELSEIF actionChosen = 'DELETE' THEN
        -- DELETE DATOS EN LA TABLA.CREO UN UNICO STATEMENT CONCATENANDOLO.
        -- DONDE LE PASO ELTABLENAME Y DONDE EL ID VA A SER EL QUE LE ENVIE
        SET @T1 = CONCAT('DELETE FROM ', tableName, ' WHERE id = ?');
         -- PREPARO EL STATEMENT PARA EJECUTARLO
        PREPARE param_stmt FROM @T1;
        -- SETEO LAS VARIABLE ID
        SET @id = id;
        -- EJECUTO EL STATEMENT  USANDO LA VARIABLE DECLARADA
        EXECUTE param_stmt USING @id;
		-- LIMPIO EL STATEMENT
        DEALLOCATE PREPARE param_stmt;
   -- SI EL ACTION CHOSEN ES DISTINTO DE DELETE O INSERT TIRO MENSAJE DE ERROR     
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'INGRESE UNA ACCION VALIDA. LA ACCION DEBE SER INSERT O DELETE.';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_order_table` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_order_table`(IN tableName VARCHAR(30),IN field VARCHAR(30), in sort varchar(4))
BEGIN
    -- VERIFICAMOS SI EL PARAMETRO DE ORDEN ES  VALIDO
    IF (sort<> 'ASC' AND sort <> 'DESC') THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'EL PARAMETRO DEBE SER ASC O DESC';
    ELSE
    -- CONSTRUYO Y EJECUTO LA CONSULTA
    SET @sort = CONCAT('SELECT * FROM ', tableName, ' ORDER BY ', field, ' ', sort);
    END IF;
    PREPARE quest FROM @sort;
    EXECUTE quest;
    -- LIMPIO EL QUEST
    DEALLOCATE PREPARE quest;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `billionaires_rest`
--

/*!50001 DROP VIEW IF EXISTS `billionaires_rest`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `billionaires_rest` AS select `billionaires`.`ID` AS `id`,`billionaires`.`ID_location` AS `id_location`,`billionaires`.`firstName` AS `firstName`,`billionaires`.`lastName` AS `lastName`,`billionaires`.`gender` AS `gender`,`billionaires`.`age` AS `age`,`billionaires`.`resCountry` AS `resCountry` from `billionaires` where (`billionaires`.`resCountry` <> 'United States') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `billionaires_usa`
--

/*!50001 DROP VIEW IF EXISTS `billionaires_usa`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `billionaires_usa` AS select `billionaires`.`ID` AS `id`,`billionaires`.`ID_location` AS `id_location`,`billionaires`.`firstName` AS `firstName`,`billionaires`.`lastName` AS `lastName`,`billionaires`.`gender` AS `gender`,`billionaires`.`age` AS `age`,`billionaires`.`resCountry` AS `resCountry` from `billionaires` where (`billionaires`.`resCountry` = 'United States') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `business_billionaire`
--

/*!50001 DROP VIEW IF EXISTS `business_billionaire`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `business_billionaire` AS select distinct `b`.`ID` AS `businessrank`,`b`.`firstName` AS `firstName`,`b`.`lastName` AS `lastName`,`b`.`gender` AS `gender`,`b`.`age` AS `age`,`b`.`resCountry` AS `resCountry`,`b`.`finalWorth` AS `finalWorth`,`b`.`selfMade` AS `selfMade`,`bu`.`organization` AS `organization`,`bu`.`industry` AS `industry` from (`billionaires` `b` join `businesses` `bu` on((`b`.`ID` = `bu`.`ID_billionaire`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `gdp_rich`
--

/*!50001 DROP VIEW IF EXISTS `gdp_rich`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `gdp_rich` AS select distinct `b`.`ID` AS `id`,`b`.`ID_location` AS `id_location`,`b`.`firstName` AS `firstName`,`b`.`lastName` AS `lastName`,`b`.`gender` AS `gender`,`b`.`age` AS `age`,`b`.`resCountry` AS `resCountry`,`b`.`finalWorth` AS `finalWorth`,`e`.`GDP` AS `GDP` from (`billionaires` `b` join `economics` `e` on((`b`.`ID_location` = `e`.`ID_location`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `tax_economics`
--

/*!50001 DROP VIEW IF EXISTS `tax_economics`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `tax_economics` AS select distinct `l`.`citiCountry` AS `citiCountry`,`l`.`city` AS `city`,`t`.`totalTaxRate` AS `totalTaxRate`,`t`.`taxRevenue` AS `taxRevenue`,`e`.`CPI` AS `CPI`,`e`.`CPIChanges` AS `CPIChanges`,`e`.`GDP` AS `GDP`,`e`.`tertiaryEducation` AS `tertiaryEducation`,`e`.`primaryEducation` AS `primaryEducation`,`e`.`lifeExpectancy` AS `lifeExpectancy`,`e`.`population` AS `population` from ((`economics` `e` join `taxes` `t` on((`e`.`ID` = `t`.`ID_economic`))) join `locations` `l` on((`l`.`ID` = `e`.`ID_location`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `wealth_billionaire`
--

/*!50001 DROP VIEW IF EXISTS `wealth_billionaire`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `wealth_billionaire` AS select distinct `bu`.`ID` AS `billionaire_id`,`b`.`firstName` AS `billionaire_firstName`,`b`.`lastName` AS `billionaire_lastName`,`bu`.`title` AS `title`,`bu`.`organization` AS `organization`,`bu`.`category` AS `category`,`bu`.`industry` AS `industry`,`w`.`source` AS `source` from ((`businesses` `bu` join `wealths` `w` on((`bu`.`ID` = `w`.`ID_business`))) join `billionaires` `b` on((`bu`.`ID_billionaire` = `b`.`ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-31 13:43:17
