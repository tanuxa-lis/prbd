-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: 172.16.7.85    Database: univer_Lisitsa
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.24.04.2

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
-- Table structure for table `director`
--

DROP TABLE IF EXISTS `director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `director` (
  `#director` int NOT NULL AUTO_INCREMENT,
  `dirname` varchar(50) NOT NULL,
  `facult` varchar(10) NOT NULL,
  PRIMARY KEY (`#director`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `director`
--

LOCK TABLES `director` WRITE;
/*!40000 ALTER TABLE `director` DISABLE KEYS */;
INSERT INTO `director` VALUES (1,'Классов Александр Борисович','ИФМИТО'),(2,'Петров Андрей Николаевич','ФТП'),(3,'Шестаев Евгений Васильевич','ФФК'),(4,'Лисица Татьяна Викторовна','ФП');
/*!40000 ALTER TABLE `director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `#employee` int NOT NULL,
  `empname` varchar(45) NOT NULL,
  `director_#director` int NOT NULL,
  `posts_postname` varchar(15) NOT NULL,
  PRIMARY KEY (`#employee`),
  KEY `fk_employee_director1_idx` (`director_#director`),
  KEY `fk_employee_posts1_idx` (`posts_postname`),
  CONSTRAINT `fk_employee_director1` FOREIGN KEY (`director_#director`) REFERENCES `director` (`#director`),
  CONSTRAINT `fk_employee_posts1` FOREIGN KEY (`posts_postname`) REFERENCES `posts` (`postname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Розов Константин Владимирович',1,'доцент'),(2,'Печкин Владимир Ильич',2,'кандидат наук'),(3,'Волкова Валентина Петровна',3,'практикант'),(4,'Вельш Анастасия Алексеевна',4,'профессор');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_has_subject`
--

DROP TABLE IF EXISTS `employee_has_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_has_subject` (
  `employee_#employee` int NOT NULL,
  `subject_#sabg` int NOT NULL,
  PRIMARY KEY (`employee_#employee`,`subject_#sabg`),
  KEY `fk_employee_has_subject_subject1_idx` (`subject_#sabg`),
  KEY `fk_employee_has_subject_employee1_idx` (`employee_#employee`),
  CONSTRAINT `fk_employee_has_subject_employee1` FOREIGN KEY (`employee_#employee`) REFERENCES `employee` (`#employee`),
  CONSTRAINT `fk_employee_has_subject_subject1` FOREIGN KEY (`subject_#sabg`) REFERENCES `subject` (`#sabg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_has_subject`
--

LOCK TABLES `employee_has_subject` WRITE;
/*!40000 ALTER TABLE `employee_has_subject` DISABLE KEYS */;
INSERT INTO `employee_has_subject` VALUES (1,1),(2,2),(3,3),(4,4),(1,5),(2,6),(3,7),(4,8);
/*!40000 ALTER TABLE `employee_has_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group` (
  `#gr` char(10) NOT NULL,
  `napr` mediumtext NOT NULL,
  `profil` mediumtext NOT NULL,
  PRIMARY KEY (`#gr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
INSERT INTO `group` VALUES ('1.21','математический анализ','в образовании'),('1.22','робототехника','в машиностроении'),('1.23','лёгкая атлетика','в образовании'),('1.24','семейная психология','в разборках');
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lessontipe`
--

DROP TABLE IF EXISTS `lessontipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lessontipe` (
  `lessonname` varchar(20) NOT NULL,
  PRIMARY KEY (`lessonname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lessontipe`
--

LOCK TABLES `lessontipe` WRITE;
/*!40000 ALTER TABLE `lessontipe` DISABLE KEYS */;
INSERT INTO `lessontipe` VALUES ('лабараторная работа'),('лекция'),('практика');
/*!40000 ALTER TABLE `lessontipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `postname` varchar(15) NOT NULL,
  PRIMARY KEY (`postname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES ('доцент'),('кандидат наук'),('практикант'),('профессор');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schebule`
--

DROP TABLE IF EXISTS `schebule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schebule` (
  `#week` int NOT NULL,
  `day` char(3) NOT NULL,
  `group_#gr` char(10) NOT NULL,
  `subject_#sabg` int NOT NULL,
  `lessontipe_lessonname` varchar(20) NOT NULL,
  `#room` char(1) NOT NULL,
  PRIMARY KEY (`#week`,`day`,`group_#gr`,`subject_#sabg`,`lessontipe_lessonname`),
  KEY `fk_group_has_subject_subject1_idx` (`subject_#sabg`),
  KEY `fk_group_has_subject_group1_idx` (`group_#gr`),
  KEY `fk_group_has_subject_lessontipe1_idx` (`lessontipe_lessonname`),
  CONSTRAINT `fk_group_has_subject_group1` FOREIGN KEY (`group_#gr`) REFERENCES `group` (`#gr`),
  CONSTRAINT `fk_group_has_subject_lessontipe1` FOREIGN KEY (`lessontipe_lessonname`) REFERENCES `lessontipe` (`lessonname`),
  CONSTRAINT `fk_group_has_subject_subject1` FOREIGN KEY (`subject_#sabg`) REFERENCES `subject` (`#sabg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schebule`
--

LOCK TABLES `schebule` WRITE;
/*!40000 ALTER TABLE `schebule` DISABLE KEYS */;
INSERT INTO `schebule` VALUES (1,'пн','1.21',5,'лекция','1'),(2,'вт','1.21',2,'практика','2'),(3,'ср','1.21',3,'лекция','3'),(4,'чт','1.22',4,'лекция','4'),(5,'пт','1.22',5,'лекция','5'),(6,'сб','1.22',6,'лекция','6'),(7,'пн','1.23',7,'практика','7'),(8,'вт','1.23',8,'практика','8'),(9,'ср','1.23',1,'практика','9'),(10,'чт','1.24',2,'лабараторная работа','1'),(11,'пт','1.24',3,'лабараторная работа','2'),(12,'сб','1.24',4,'лабараторная работа','3');
/*!40000 ALTER TABLE `schebule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `#stud` int NOT NULL,
  `studname` varchar(45) NOT NULL,
  `director_#director` int NOT NULL,
  `group_#gr` char(10) DEFAULT NULL,
  PRIMARY KEY (`#stud`),
  KEY `fk_student_director_idx` (`director_#director`),
  KEY `fk_student_group1_idx` (`group_#gr`),
  CONSTRAINT `fk_student_director` FOREIGN KEY (`director_#director`) REFERENCES `director` (`#director`),
  CONSTRAINT `fk_student_group1` FOREIGN KEY (`group_#gr`) REFERENCES `group` (`#gr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'Мария',1,'1.21'),(2,'Павел',1,'1.21'),(3,'Степан',1,'1.21'),(4,'Лина',1,'1.21'),(5,'Дина',2,'1.22'),(6,'Анастасия',2,'1.22'),(7,'Алексей',2,'1.22'),(8,'Сергей',2,'1.22'),(9,'Сергей',3,'1.23'),(10,'Владислав',3,'1.23'),(11,'Константин',3,'1.23'),(12,'Артём',3,'1.23'),(13,'Татьяна',4,'1.24'),(14,'Дарья',4,'1.24'),(15,'Кристина',4,'1.24'),(16,'Ольга',4,'1.24');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject` (
  `#sabg` int NOT NULL AUTO_INCREMENT,
  `sabjname` varchar(100) DEFAULT NULL,
  `subjinfo` mediumtext,
  PRIMARY KEY (`#sabg`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (1,'математика','берём интегралы'),(2,'английский язык','разговариваем'),(3,'робототехника','собираем робота'),(4,'Компьютерные сети','работаем в циске'),(5,'литература','читаем стихи пушкина'),(6,'руссий язык','изучаем падежи'),(7,'програмиирование','изучаем питон'),(8,'столовка','вкусно кушаем');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vedomost`
--

DROP TABLE IF EXISTS `vedomost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vedomost` (
  `date` date NOT NULL,
  `student_#stud` int NOT NULL,
  `employee_#employee` int NOT NULL,
  `subject_#sabg` int NOT NULL,
  `mark` varchar(14) NOT NULL,
  PRIMARY KEY (`date`,`student_#stud`,`employee_#employee`,`subject_#sabg`),
  KEY `fk_student_has_employee_employee1_idx` (`employee_#employee`),
  KEY `fk_student_has_employee_student1_idx` (`student_#stud`),
  KEY `fk_student_has_employee_subject1_idx` (`subject_#sabg`),
  CONSTRAINT `fk_student_has_employee_employee1` FOREIGN KEY (`employee_#employee`) REFERENCES `employee` (`#employee`),
  CONSTRAINT `fk_student_has_employee_student1` FOREIGN KEY (`student_#stud`) REFERENCES `student` (`#stud`),
  CONSTRAINT `fk_student_has_employee_subject1` FOREIGN KEY (`subject_#sabg`) REFERENCES `subject` (`#sabg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vedomost`
--

LOCK TABLES `vedomost` WRITE;
/*!40000 ALTER TABLE `vedomost` DISABLE KEYS */;
INSERT INTO `vedomost` VALUES ('2024-09-25',1,1,1,'5'),('2024-09-25',2,1,1,'4'),('2024-09-25',3,1,5,'2'),('2024-09-25',4,1,5,'5'),('2024-09-25',5,2,2,'5'),('2024-09-25',6,2,2,'5'),('2024-09-25',7,2,1,'5'),('2024-09-25',8,2,6,'4'),('2024-09-25',9,3,3,'4'),('2024-09-25',10,3,3,'4'),('2024-09-25',11,3,7,'4'),('2024-09-25',12,3,7,'4'),('2024-09-25',13,4,4,'4'),('2024-09-25',14,4,4,'3'),('2024-09-25',15,4,8,'3'),('2024-09-25',16,4,8,'3');
/*!40000 ALTER TABLE `vedomost` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-02 13:20:57
