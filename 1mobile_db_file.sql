-- MySQL dump 10.13  Distrib 5.6.19, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: 1mobile_db
-- ------------------------------------------------------
-- Server version	5.6.19-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `application_tab`
--

DROP TABLE IF EXISTS `application_tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_tab` (
  `app_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(5000) DEFAULT NULL,
  `source_download_url` varchar(100) DEFAULT NULL,
  `cat_id` int(11) NOT NULL,
  PRIMARY KEY (`app_id`),
  KEY `cat_id` (`cat_id`),
  CONSTRAINT `application_tab_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `category_tab` (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_tab`
--

LOCK TABLES `application_tab` WRITE;
/*!40000 ALTER TABLE `application_tab` DISABLE KEYS */;
/*!40000 ALTER TABLE `application_tab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_tab`
--

DROP TABLE IF EXISTS `category_tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_tab` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_tab`
--

LOCK TABLES `category_tab` WRITE;
/*!40000 ALTER TABLE `category_tab` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_tab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screenshots_tab`
--

DROP TABLE IF EXISTS `screenshots_tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenshots_tab` (
  `img_id` int(11) NOT NULL AUTO_INCREMENT,
  `image_url` varchar(100) NOT NULL,
  `app_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`img_id`),
  KEY `app_id` (`app_id`),
  CONSTRAINT `screenshots_tab_ibfk_1` FOREIGN KEY (`app_id`) REFERENCES `application_tab` (`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screenshots_tab`
--

LOCK TABLES `screenshots_tab` WRITE;
/*!40000 ALTER TABLE `screenshots_tab` DISABLE KEYS */;
/*!40000 ALTER TABLE `screenshots_tab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_st`
--

DROP TABLE IF EXISTS `test_st`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_st` (
  `des` varchar(5000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_st`
--

LOCK TABLES `test_st` WRITE;
/*!40000 ALTER TABLE `test_st` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_st` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-09-16 10:29:22
