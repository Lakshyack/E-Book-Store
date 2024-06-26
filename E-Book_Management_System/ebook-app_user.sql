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
INSERT INTO `user` VALUES (1,'lkkk','lakss@gmail.com','1254555','1236',NULL,NULL,NULL,NULL,NULL,NULL),(2,'Lakshya','kak@gmail.com','7845125555','1256325',NULL,NULL,NULL,NULL,NULL,NULL),(3,'Lakshya55','ka@gmail.com','78451255','12563278',NULL,NULL,NULL,NULL,NULL,NULL),(4,'mohit','mohit@gmail.com','78945698745','125463',NULL,NULL,NULL,NULL,NULL,NULL),(5,'prtibha','code@gmail.com','78965412365','12345',NULL,NULL,NULL,NULL,NULL,NULL),(6,'lakshyaaa','lall@gmail.com','452154544','12558',NULL,NULL,NULL,NULL,NULL,NULL),(7,'komal','dhiman@gmail.com','75025845','1596',NULL,NULL,NULL,NULL,NULL,NULL),(8,'Lakshya','Lakshyak7370@gmail.com','8923163204','@Lakshya82#','Amazon1st_page-0002.jpg',NULL,NULL,NULL,NULL,NULL),(9,'Lakshyak','mama@gmail.com','1234567890','1234','sdjbn c.jpg',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-09 10:23:04
