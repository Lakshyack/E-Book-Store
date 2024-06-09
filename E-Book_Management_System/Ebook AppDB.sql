-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: ebook-app
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `profile` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'Lakshya kashyap','admin@gmail.com','admin','img.jpg');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_dtls`
--

DROP TABLE IF EXISTS `book_dtls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_dtls` (
  `bookID` int NOT NULL AUTO_INCREMENT,
  `bookName` varchar(45) DEFAULT NULL,
  `author` varchar(45) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `stock` varchar(45) DEFAULT NULL,
  `bookCategory` varchar(255) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `photo` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`bookID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_dtls`
--

LOCK TABLES `book_dtls` WRITE;
/*!40000 ALTER TABLE `book_dtls` DISABLE KEYS */;
INSERT INTO `book_dtls` VALUES (7,'book','new',785,'8','New','Active','img.jpg','admin'),(8,'laks','lak',45,'5','New','Active','WhatsApp Image 2024-05-20 at 11.05.32 AM.jpeg','admin'),(9,'new','Laks',1452,NULL,'Old','Active','img2.jpeg','Lakshyak7370@gmail.com'),(10,'M','m',8,'8','New','Active','img.jpg','admin');
/*!40000 ALTER TABLE `book_dtls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_order`
--

DROP TABLE IF EXISTS `book_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_order` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_Name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `address` varchar(110) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `book_Name` varchar(45) DEFAULT NULL,
  `author` varchar(45) DEFAULT NULL,
  `price` varchar(45) DEFAULT NULL,
  `payment` varchar(45) DEFAULT NULL,
  `orderdate` varchar(45) DEFAULT NULL,
  `placedate` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_order`
--

LOCK TABLES `book_order` WRITE;
/*!40000 ALTER TABLE `book_order` DISABLE KEYS */;
INSERT INTO `book_order` VALUES (1,'Lakshya','Lakshyak7370@gmail.com','Prakash lok Colony,SD pubic school,saharanpur,,Uttar pradesh,24','8923163204','Let_us_c','Yashwant.h','225.0','COD',NULL,NULL),(4,'Lakshya','Lakshyak7370@gmail.com','Prakash lok Colony,47,saharanpur,,Uttar pradesh,24710','8923163204','Let_us_c','Yashwant.h','225.0','COD',NULL,NULL),(5,'Lakshya','Lakshyak7370@gmail.com','Prakash lok Colony,SD,S,,Uttar pradesh,247001','8923163204','Let_us_c','Yashwant.h','225.0','COD',NULL,NULL),(6,'Lakshya','Lakshyak7370@gmail.com','458,llll,saharanpur,,Uttar pradesh,4785','8923163204','book','new','785.0','COD',NULL,NULL),(7,'Lakshya','Lakshyak7370@gmail.com','458,llll,saharanpur,,Uttar pradesh,4785','8923163204','book','new','785.0','COD',NULL,NULL),(8,'Lakshya kashyap','Lakshyak7370@gmail.com','Prakash lok Colony,SD pubic school,saharanpur,,U,247001','8923163204','laks','lak','45.0','COD',NULL,NULL),(9,'Lakshya kashyap','Lakshyak7370@gmail.com','Prakash lok Colony,SD pubi,Jammu,,UK,24778','8923163204','laks','lak','45.0','COD','09-06-2024 22:45:10','16-06-2024 22:45:10'),(10,'Lakshya kashyap','Lakshyak7370@gmail.com','Prakash lok Colony,SD pubic school,saharanpur,,Uttar pradesh`,4744','8923163204','laks','lak','45.0','COD','09-06-2024 22:48:00 PM','16-06-2024 22:48:00 PM'),(11,'Lakshya kashyap','Lakshyak7370@gmail.com','Prakash lok Colony,SD pubic school,saharanpur,,Uttar pradesh`,4744','8923163204','M','m','8.0','COD','09-06-2024 22:48:00 PM','16-06-2024 22:48:00 PM'),(12,'Lakshya kashyap','Lakshyak7370@gmail.com','P,sakdjn,asdsjnc,,sjccn,10','8923163204','laks','lak','45.0','COD','09-06-2024 10:49:28 PM','16-06-2024 10:49:28 PM'),(13,'Lakshya kashyap','Lakshyak7370@gmail.com','P,sakdjn,asdsjnc,,sjccn,10','8923163204','M','m','8.0','COD','09-06-2024 10:49:28 PM','16-06-2024 10:49:28 PM'),(14,'Lakshya kashyap','Lakshyak7370@gmail.com','P,sakdjn,asdsjnc,,sjccn,10','8923163204','laks','lak','45.0','COD','09-06-2024 10:49:28 PM','16-06-2024 10:49:28 PM');
/*!40000 ALTER TABLE `book_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `bid` int NOT NULL,
  `uid` int NOT NULL,
  `bookName` varchar(45) DEFAULT NULL,
  `author` varchar(45) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `total_Price` double DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (29,8,8,'laks','lak',45,45),(31,10,8,'M','m',8,8),(32,8,8,'laks','lak',45,45);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `Phno` varchar(45) DEFAULT NULL,
  `Password` varchar(45) DEFAULT NULL,
  `profile` varchar(100) DEFAULT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `Landmark` varchar(45) DEFAULT NULL,
  `City` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `pin` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'lkkk','lakss@gmail.com','1254555','1236',NULL,NULL,NULL,NULL,NULL,NULL),(2,'Lakshya','kak@gmail.com','7845125555','1256325',NULL,NULL,NULL,NULL,NULL,NULL),(3,'Lakshya55','ka@gmail.com','78451255','12563278',NULL,NULL,NULL,NULL,NULL,NULL),(4,'mohit','mohit@gmail.com','78945698745','125463',NULL,NULL,NULL,NULL,NULL,NULL),(5,'prtibha','code@gmail.com','78965412365','12345',NULL,NULL,NULL,NULL,NULL,NULL),(6,'lakshyaaa','lall@gmail.com','452154544','12558',NULL,NULL,NULL,NULL,NULL,NULL),(7,'komal','dhiman@gmail.com','75025845','1596',NULL,NULL,NULL,NULL,NULL,NULL),(8,'Lakshya kashyap','Lakshyak7370@gmail.com','8923163204','@Lakshya82#','img.jpg',NULL,NULL,NULL,NULL,NULL),(9,'Lakshyak','mama@gmail.com','1234567890','1234','sdjbn c.jpg',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ebook-app'
--

--
-- Dumping routines for database 'ebook-app'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-09 22:59:28
