-- MariaDB dump 10.18  Distrib 10.5.8-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: TENNIS
-- ------------------------------------------------------
-- Server version	10.5.8-MariaDB-1:10.5.8+maria~focal

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `TENNIS`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `TENNIS` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `TENNIS`;

--
-- Table structure for table `COUNTRIES`
--

DROP TABLE IF EXISTS `COUNTRIES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COUNTRIES` (
  `c_id` varchar(3) NOT NULL,
  `c_name` varchar(100) NOT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COUNTRIES`
--

LOCK TABLES `COUNTRIES` WRITE;
/*!40000 ALTER TABLE `COUNTRIES` DISABLE KEYS */;
/*!40000 ALTER TABLE `COUNTRIES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUSTOMERS`
--

DROP TABLE IF EXISTS `CUSTOMERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CUSTOMERS` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(20) NOT NULL,
  `AGE` int(11) NOT NULL,
  `ADDRESS` char(25) DEFAULT NULL,
  `SALARY` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOMERS`
--

LOCK TABLES `CUSTOMERS` WRITE;
/*!40000 ALTER TABLE `CUSTOMERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CUSTOMERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MATCHES`
--

DROP TABLE IF EXISTS `MATCHES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MATCHES` (
  `m_id` int(11) NOT NULL,
  `m_t_id` int(11) DEFAULT NULL,
  `m_round` int(11) NOT NULL,
  `m_r_num1` int(11) DEFAULT NULL,
  `m_r_num2` int(11) DEFAULT NULL,
  PRIMARY KEY (`m_id`),
  KEY `m_t_id` (`m_t_id`),
  KEY `m_r_num1` (`m_r_num1`),
  KEY `m_r_num2` (`m_r_num2`),
  CONSTRAINT `MATCHES_ibfk_1` FOREIGN KEY (`m_t_id`) REFERENCES `TOURNAMENTS` (`t_id`),
  CONSTRAINT `MATCHES_ibfk_2` FOREIGN KEY (`m_r_num1`) REFERENCES `REGISTRATIONS` (`r_num`),
  CONSTRAINT `MATCHES_ibfk_3` FOREIGN KEY (`m_r_num2`) REFERENCES `REGISTRATIONS` (`r_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MATCHES`
--

LOCK TABLES `MATCHES` WRITE;
/*!40000 ALTER TABLE `MATCHES` DISABLE KEYS */;
/*!40000 ALTER TABLE `MATCHES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MATCH_RESULTS`
--

DROP TABLE IF EXISTS `MATCH_RESULTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MATCH_RESULTS` (
  `mr_m_id` int(11) NOT NULL,
  `mr_winner` int(11) DEFAULT NULL,
  `mr_num_sets` int(11) DEFAULT NULL,
  PRIMARY KEY (`mr_m_id`),
  CONSTRAINT `MATCH_RESULTS_ibfk_1` FOREIGN KEY (`mr_m_id`) REFERENCES `MATCHES` (`m_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MATCH_RESULTS`
--

LOCK TABLES `MATCH_RESULTS` WRITE;
/*!40000 ALTER TABLE `MATCH_RESULTS` DISABLE KEYS */;
/*!40000 ALTER TABLE `MATCH_RESULTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PLAYED_IN_TOURNAMENTS`
--

DROP TABLE IF EXISTS `PLAYED_IN_TOURNAMENTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PLAYED_IN_TOURNAMENTS` (
  `pt_t_id` int(11) NOT NULL,
  `pt_r_num` int(11) NOT NULL,
  `pt_seed` int(11) DEFAULT NULL,
  PRIMARY KEY (`pt_t_id`,`pt_r_num`),
  KEY `pt_r_num` (`pt_r_num`),
  CONSTRAINT `PLAYED_IN_TOURNAMENTS_ibfk_1` FOREIGN KEY (`pt_t_id`) REFERENCES `TOURNAMENTS` (`t_id`),
  CONSTRAINT `PLAYED_IN_TOURNAMENTS_ibfk_2` FOREIGN KEY (`pt_r_num`) REFERENCES `REGISTRATIONS` (`r_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PLAYED_IN_TOURNAMENTS`
--

LOCK TABLES `PLAYED_IN_TOURNAMENTS` WRITE;
/*!40000 ALTER TABLE `PLAYED_IN_TOURNAMENTS` DISABLE KEYS */;
/*!40000 ALTER TABLE `PLAYED_IN_TOURNAMENTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PLAYERS`
--

DROP TABLE IF EXISTS `PLAYERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PLAYERS` (
  `p_id` int(11) NOT NULL,
  `p_name` varchar(30) NOT NULL,
  `p_surname` varchar(30) NOT NULL,
  `p_gender` char(1) NOT NULL,
  `p_c_id` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`p_id`),
  KEY `p_c_id` (`p_c_id`),
  CONSTRAINT `PLAYERS_ibfk_1` FOREIGN KEY (`p_c_id`) REFERENCES `COUNTRIES` (`c_id`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`p_gender` in ('F','M'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PLAYERS`
--

LOCK TABLES `PLAYERS` WRITE;
/*!40000 ALTER TABLE `PLAYERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `PLAYERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REGISTRATIONS`
--

DROP TABLE IF EXISTS `REGISTRATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REGISTRATIONS` (
  `r_num` int(11) NOT NULL,
  `r_p_id` int(11) NOT NULL,
  PRIMARY KEY (`r_num`,`r_p_id`),
  KEY `r_p_id` (`r_p_id`),
  CONSTRAINT `REGISTRATIONS_ibfk_1` FOREIGN KEY (`r_p_id`) REFERENCES `PLAYERS` (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REGISTRATIONS`
--

LOCK TABLES `REGISTRATIONS` WRITE;
/*!40000 ALTER TABLE `REGISTRATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REGISTRATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RETIRED_MATCHES`
--

DROP TABLE IF EXISTS `RETIRED_MATCHES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RETIRED_MATCHES` (
  `rm_m_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RETIRED_MATCHES`
--

LOCK TABLES `RETIRED_MATCHES` WRITE;
/*!40000 ALTER TABLE `RETIRED_MATCHES` DISABLE KEYS */;
/*!40000 ALTER TABLE `RETIRED_MATCHES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SET_SCORES`
--

DROP TABLE IF EXISTS `SET_SCORES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SET_SCORES` (
  `ss_m_id` int(11) DEFAULT NULL,
  `ss_set_num` int(11) DEFAULT NULL,
  `ss_winner_games` int(11) DEFAULT NULL,
  `ss_loser_games` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SET_SCORES`
--

LOCK TABLES `SET_SCORES` WRITE;
/*!40000 ALTER TABLE `SET_SCORES` DISABLE KEYS */;
/*!40000 ALTER TABLE `SET_SCORES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TIEBREAKERS`
--

DROP TABLE IF EXISTS `TIEBREAKERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TIEBREAKERS` (
  `tb_m_id` int(11) DEFAULT NULL,
  `tb_set_num` int(11) DEFAULT NULL,
  `tb_winner` int(11) DEFAULT NULL,
  `tb_loser_tb` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TIEBREAKERS`
--

LOCK TABLES `TIEBREAKERS` WRITE;
/*!40000 ALTER TABLE `TIEBREAKERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `TIEBREAKERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TOURNAMENTS`
--

DROP TABLE IF EXISTS `TOURNAMENTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TOURNAMENTS` (
  `t_id` int(11) NOT NULL,
  `t_name` varchar(20) NOT NULL,
  `t_location` varchar(30) DEFAULT NULL,
  `t_start_date` date DEFAULT NULL,
  `t_end_date` date DEFAULT NULL,
  `t_num_rounds` int(11) DEFAULT NULL,
  `t_type` varchar(7) DEFAULT NULL,
  `t_surface` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`t_id`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`t_type` in ('Singles','Doubles')),
  CONSTRAINT `CONSTRAINT_2` CHECK (`t_surface` in ('Clay','Grass','Hard'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TOURNAMENTS`
--

LOCK TABLES `TOURNAMENTS` WRITE;
/*!40000 ALTER TABLE `TOURNAMENTS` DISABLE KEYS */;
/*!40000 ALTER TABLE `TOURNAMENTS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-28 15:27:29
