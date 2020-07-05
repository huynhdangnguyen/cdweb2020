-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: parkinglotmanagement
-- ------------------------------------------------------
-- Server version	8.0.13

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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customer` (
  `id` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `addr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `gender` int(2) DEFAULT NULL,
  `phoneno` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  `createdby` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `createddate` timestamp NULL DEFAULT NULL,
  `modifiedby` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `modifieddate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk1_customer_user` (`createdby`),
  KEY `fk2_customer_user` (`modifiedby`),
  CONSTRAINT `fk1_customer_user` FOREIGN KEY (`createdby`) REFERENCES `user` (`id`),
  CONSTRAINT `fk2_customer_user` FOREIGN KEY (`modifiedby`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_rentdetail` bigint(20) NOT NULL,
  `id_customer` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `plateinimage` mediumblob,
  `faceinimage` mediumblob,
  `plateoutimage` mediumblob,
  `faceoutimage` mediumblob,
  `plateno` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `indate` timestamp NOT NULL,
  `outdate` timestamp NULL DEFAULT NULL,
  `price` int(10) NOT NULL,
  `createdby` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_history_rentdetail_idx` (`id_rentdetail`),
  KEY `fk_history_customer` (`id_customer`),
  KEY `fk_history_user` (`createdby`),
  CONSTRAINT `fk_history_customer` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id`),
  CONSTRAINT `fk_history_rentdetail` FOREIGN KEY (`id_rentdetail`) REFERENCES `rentdetail` (`id`),
  CONSTRAINT `fk_history_user` FOREIGN KEY (`createdby`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `price`
--

DROP TABLE IF EXISTS `price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `price` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_vehicletype` int(20) NOT NULL,
  `dayprice` int(10) NOT NULL,
  `monthprice` int(10) NOT NULL,
  `startdate` timestamp NOT NULL,
  `enddate` timestamp NULL DEFAULT NULL,
  `status` int(2) NOT NULL,
  `createdby` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `createddate` timestamp NULL DEFAULT NULL,
  `modifiedby` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `modifieddate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk1_price_user` (`createdby`),
  KEY `fk2_price_user` (`modifiedby`),
  CONSTRAINT `fk1_price_user` FOREIGN KEY (`createdby`) REFERENCES `user` (`id`),
  CONSTRAINT `fk2_price_user` FOREIGN KEY (`modifiedby`) REFERENCES `user` (`id`),
  CONSTRAINT `fk_price_vehicle` FOREIGN KEY (`id`) REFERENCES `vehicletype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price`
--

LOCK TABLES `price` WRITE;
/*!40000 ALTER TABLE `price` DISABLE KEYS */;
/*!40000 ALTER TABLE `price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rentdetail`
--

DROP TABLE IF EXISTS `rentdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `rentdetail` (
  `id` bigint(20) NOT NULL,
  `plateno` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `framenumber` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `machinenumber` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `enddate` timestamp NULL DEFAULT NULL,
  `id_customer` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `id_price` bigint(20) DEFAULT NULL,
  `id_vehicletype` bigint(20) DEFAULT NULL,
  `status` int(2) NOT NULL,
  `createdby` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `createddate` timestamp NULL DEFAULT NULL,
  `modifiedby` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `modifieddate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk1_rentdetail_user` (`createdby`),
  KEY `fk2_rentdetail_user` (`modifiedby`),
  KEY `fk_rentdetail_customer` (`id_customer`),
  KEY `fk_rentdetail_vehicletype` (`id_vehicletype`),
  KEY `fk_rentdetail_price` (`id_price`),
  CONSTRAINT `fk1_rentdetail_user` FOREIGN KEY (`createdby`) REFERENCES `user` (`id`),
  CONSTRAINT `fk2_rentdetail_user` FOREIGN KEY (`modifiedby`) REFERENCES `user` (`id`),
  CONSTRAINT `fk_rentdetail_customer` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id`),
  CONSTRAINT `fk_rentdetail_price` FOREIGN KEY (`id_price`) REFERENCES `price` (`id`),
  CONSTRAINT `fk_rentdetail_vehicletype` FOREIGN KEY (`id_vehicletype`) REFERENCES `vehicletype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rentdetail`
--

LOCK TABLES `rentdetail` WRITE;
/*!40000 ALTER TABLE `rentdetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `rentdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int(2) NOT NULL,
  `createdby` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `createddate` timestamp NULL DEFAULT NULL,
  `modifiedby` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `modifieddate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk1_role_user` (`createdby`),
  KEY `fk2_role_user` (`modifiedby`),
  CONSTRAINT `fk1_role_user` FOREIGN KEY (`createdby`) REFERENCES `user` (`id`),
  CONSTRAINT `fk2_role_user` FOREIGN KEY (`modifiedby`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `id` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `addr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gender` int(2) NOT NULL,
  `phoneNo` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `managerid` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `status` int(2) NOT NULL,
  `createdby` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `createddate` timestamp NULL DEFAULT NULL,
  `modifiedby` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `modifieddate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk1_user_user_idx` (`managerid`),
  KEY `fk2_user_user_idx` (`createdby`),
  KEY `fk3_user_user_idx` (`modifiedby`),
  CONSTRAINT `fk1_user_user` FOREIGN KEY (`managerid`) REFERENCES `user` (`id`),
  CONSTRAINT `fk2_user_user` FOREIGN KEY (`createdby`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_role` (
  `id_user` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `id_role` bigint(20) NOT NULL,
  PRIMARY KEY (`id_user`,`id_role`),
  KEY `user_role_role_fk_idx` (`id_role`),
  CONSTRAINT `fk_user_role_role` FOREIGN KEY (`id_role`) REFERENCES `role` (`id`),
  CONSTRAINT `fk_user_role_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicletype`
--

DROP TABLE IF EXISTS `vehicletype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `vehicletype` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int(2) NOT NULL,
  `createdby` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `createddate` timestamp NULL DEFAULT NULL,
  `modifiedby` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `modifieddate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk1_vehicletype_user` (`createdby`),
  KEY `fk2_vehicletype_user` (`modifiedby`),
  CONSTRAINT `fk1_vehicletype_user` FOREIGN KEY (`createdby`) REFERENCES `user` (`id`),
  CONSTRAINT `fk2_vehicletype_user` FOREIGN KEY (`modifiedby`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicletype`
--

LOCK TABLES `vehicletype` WRITE;
/*!40000 ALTER TABLE `vehicletype` DISABLE KEYS */;
INSERT INTO `vehicletype` VALUES (1,'Xe số',1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `vehicletype` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-04 21:57:41
