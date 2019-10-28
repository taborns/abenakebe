-- MySQL dump 10.13  Distrib 8.0.15, for osx10.14 (x86_64)
--
-- Host: localhost    Database: sportnews
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add league',7,'add_league'),(26,'Can change league',7,'change_league'),(27,'Can delete league',7,'delete_league'),(28,'Can view league',7,'view_league'),(29,'Can add match',8,'add_match'),(30,'Can change match',8,'change_match'),(31,'Can delete match',8,'delete_match'),(32,'Can view match',8,'view_match'),(33,'Can add news',9,'add_news'),(34,'Can change news',9,'change_news'),(35,'Can delete news',9,'delete_news'),(36,'Can view news',9,'view_news'),(37,'Can add team',10,'add_team'),(38,'Can change team',10,'change_team'),(39,'Can delete team',10,'delete_team'),(40,'Can view team',10,'view_team'),(41,'Can add standing',11,'add_standing'),(42,'Can change standing',11,'change_standing'),(43,'Can delete standing',11,'delete_standing'),(44,'Can view standing',11,'view_standing'),(45,'Can add prediction',12,'add_prediction'),(46,'Can change prediction',12,'change_prediction'),(47,'Can delete prediction',12,'delete_prediction'),(48,'Can view prediction',12,'view_prediction'),(49,'Can add prediction list',13,'add_predictionlist'),(50,'Can change prediction list',13,'change_predictionlist'),(51,'Can delete prediction list',13,'delete_predictionlist'),(52,'Can view prediction list',13,'view_predictionlist');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$150000$UAemuY5eGRZe$sq2vahE9zX1wyaSGhfG1zPLodt1AernPe+hvJ4oAYzA=','2019-10-20 16:52:28.508386',1,'admin','','','admin@gmail.com',1,1,'2019-10-20 16:52:04.305019');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-10-20 16:56:12.016588','1','News object (1)',1,'[{\"added\": {}}]',9,1),(2,'2019-10-20 17:02:14.114501','1','News object (1)',2,'[{\"changed\": {\"fields\": [\"thumbnail\"]}}]',9,1),(3,'2019-10-20 17:02:46.645746','1','News object (1)',2,'[{\"changed\": {\"fields\": [\"thumbnail\"]}}]',9,1),(4,'2019-10-20 17:03:12.989314','1','News object (1)',2,'[{\"changed\": {\"fields\": [\"thumbnail\"]}}]',9,1),(5,'2019-10-20 17:03:49.869516','1','News object (1)',2,'[{\"changed\": {\"fields\": [\"thumbnail\"]}}]',9,1),(6,'2019-10-20 17:04:22.069453','1','News object (1)',2,'[{\"changed\": {\"fields\": [\"thumbnail\"]}}]',9,1),(7,'2019-10-20 17:05:43.069927','1','News object (1)',2,'[{\"changed\": {\"fields\": [\"thumbnail\"]}}]',9,1),(8,'2019-10-20 17:06:10.201446','1','News object (1)',2,'[{\"changed\": {\"fields\": [\"thumbnail\"]}}]',9,1),(9,'2019-10-20 17:33:46.548996','1','England Premiere League',1,'[{\"added\": {}}]',7,1),(10,'2019-10-20 17:34:51.554150','1','Arsenal',1,'[{\"added\": {}}]',10,1),(11,'2019-10-20 17:35:11.054699','2','Manchester City',1,'[{\"added\": {}}]',10,1),(12,'2019-10-20 17:35:20.760414','1','Standing object (1)',1,'[{\"added\": {}}]',11,1),(13,'2019-10-20 17:35:25.860477','2','Standing object (2)',1,'[{\"added\": {}}]',11,1),(14,'2019-10-20 17:56:01.158773','1','Arsenal Vs Manchester City',1,'[{\"added\": {}}]',8,1),(15,'2019-10-20 17:58:13.760150','1','Prediction object (1)',1,'[{\"added\": {}}]',12,1),(16,'2019-10-20 18:13:10.510430','1','Prediction object (1)',3,'',12,1),(17,'2019-10-20 18:18:03.128338','1','PredictionList object (1)',1,'[{\"added\": {}}]',13,1),(18,'2019-10-21 04:40:44.645985','2','Spain Laliga',1,'[{\"added\": {}}]',7,1),(19,'2019-10-21 06:34:35.393132','3','Liverpool',1,'[{\"added\": {}}]',10,1),(20,'2019-10-21 06:34:48.674341','4','Leicester City',1,'[{\"added\": {}}]',10,1),(21,'2019-10-21 06:34:57.775024','5','Chelsea',1,'[{\"added\": {}}]',10,1),(22,'2019-10-21 06:35:09.926442','6','Crystal Palace',1,'[{\"added\": {}}]',10,1),(23,'2019-10-21 06:35:18.589468','7','Burnley',1,'[{\"added\": {}}]',10,1),(24,'2019-10-21 06:35:29.800234','8','West Ham United',1,'[{\"added\": {}}]',10,1),(25,'2019-10-21 06:35:42.526653','9','Tottenhum Hotspur',1,'[{\"added\": {}}]',10,1),(26,'2019-10-21 06:35:53.495855','10','Bournemouth',1,'[{\"added\": {}}]',10,1),(27,'2019-10-21 06:36:55.590516','3','Standing object (3)',1,'[{\"added\": {}}]',11,1),(28,'2019-10-21 06:37:04.402690','4','Standing object (4)',1,'[{\"added\": {}}]',11,1),(29,'2019-10-21 06:37:12.878167','5','Standing object (5)',1,'[{\"added\": {}}]',11,1),(30,'2019-10-21 06:37:20.129958','6','Standing object (6)',1,'[{\"added\": {}}]',11,1),(31,'2019-10-21 06:37:33.818477','7','Standing object (7)',1,'[{\"added\": {}}]',11,1),(32,'2019-10-21 06:37:42.102017','8','Standing object (8)',1,'[{\"added\": {}}]',11,1),(33,'2019-10-21 06:37:52.174443','9','Standing object (9)',1,'[{\"added\": {}}]',11,1),(34,'2019-10-21 06:38:01.989778','10','Standing object (10)',1,'[{\"added\": {}}]',11,1),(35,'2019-10-21 06:40:03.482146','10','Standing object (10)',2,'[{\"changed\": {\"fields\": [\"rank\"]}}]',11,1),(36,'2019-10-21 06:40:10.012286','1','Standing object (1)',2,'[{\"changed\": {\"fields\": [\"rank\"]}}]',11,1),(37,'2019-10-21 06:40:20.510923','3','Standing object (3)',2,'[{\"changed\": {\"fields\": [\"rank\"]}}]',11,1),(38,'2019-10-21 06:40:26.859223','4','Standing object (4)',2,'[{\"changed\": {\"fields\": [\"rank\"]}}]',11,1),(39,'2019-10-21 06:40:35.717441','5','Standing object (5)',2,'[{\"changed\": {\"fields\": [\"rank\"]}}]',11,1),(40,'2019-10-21 06:40:42.485454','6','Standing object (6)',2,'[{\"changed\": {\"fields\": [\"rank\"]}}]',11,1),(41,'2019-10-21 06:40:49.531219','8','Standing object (8)',2,'[{\"changed\": {\"fields\": [\"rank\"]}}]',11,1),(42,'2019-10-21 06:40:54.658715','7','Standing object (7)',2,'[{\"changed\": {\"fields\": [\"rank\"]}}]',11,1),(43,'2019-10-21 06:40:59.315935','9','Standing object (9)',2,'[{\"changed\": {\"fields\": [\"rank\"]}}]',11,1),(44,'2019-10-21 06:43:52.876503','2','Standing object (2)',2,'[{\"changed\": {\"fields\": [\"goal\", \"played\", \"points\"]}}]',11,1),(45,'2019-10-21 06:43:52.878301','10','Standing object (10)',2,'[{\"changed\": {\"fields\": [\"goal\", \"played\", \"points\"]}}]',11,1),(46,'2019-10-21 06:43:52.880319','1','Standing object (1)',2,'[{\"changed\": {\"fields\": [\"goal\", \"played\", \"points\"]}}]',11,1),(47,'2019-10-21 06:43:52.881769','3','Standing object (3)',2,'[{\"changed\": {\"fields\": [\"goal\", \"played\", \"points\"]}}]',11,1),(48,'2019-10-21 06:43:52.883126','4','Standing object (4)',2,'[{\"changed\": {\"fields\": [\"goal\", \"played\", \"points\"]}}]',11,1),(49,'2019-10-21 06:43:52.884550','5','Standing object (5)',2,'[{\"changed\": {\"fields\": [\"goal\", \"played\", \"points\"]}}]',11,1),(50,'2019-10-21 06:43:52.887161','6','Standing object (6)',2,'[{\"changed\": {\"fields\": [\"goal\", \"played\", \"points\"]}}]',11,1),(51,'2019-10-21 06:43:52.889123','8','Standing object (8)',2,'[{\"changed\": {\"fields\": [\"goal\", \"played\", \"points\"]}}]',11,1),(52,'2019-10-21 06:43:52.890793','7','Standing object (7)',2,'[{\"changed\": {\"fields\": [\"goal\", \"played\", \"points\"]}}]',11,1),(53,'2019-10-21 06:43:52.892361','9','Standing object (9)',2,'[{\"changed\": {\"fields\": [\"goal\", \"played\", \"points\"]}}]',11,1),(54,'2019-10-21 08:19:08.186770','2','News object (2)',1,'[{\"added\": {}}]',9,1),(55,'2019-10-21 08:19:45.836439','3','News object (3)',1,'[{\"added\": {}}]',9,1),(56,'2019-10-21 08:21:05.033443','4','News object (4)',1,'[{\"added\": {}}]',9,1),(57,'2019-10-21 08:21:34.732119','5','News object (5)',1,'[{\"added\": {}}]',9,1),(58,'2019-10-21 08:23:11.196633','6','News object (6)',1,'[{\"added\": {}}]',9,1),(59,'2019-10-21 08:24:33.426463','7','News object (7)',1,'[{\"added\": {}}]',9,1),(60,'2019-10-21 09:20:34.397670','8','News object (8)',1,'[{\"added\": {}}]',9,1),(61,'2019-10-21 09:21:29.907195','9','News object (9)',1,'[{\"added\": {}}]',9,1),(62,'2019-10-21 09:22:08.986901','10','News object (10)',1,'[{\"added\": {}}]',9,1),(63,'2019-10-21 09:22:58.416381','11','News object (11)',1,'[{\"added\": {}}]',9,1),(64,'2019-10-21 09:27:40.637166','11','News object (11)',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',9,1),(65,'2019-10-21 09:27:46.784324','10','News object (10)',3,'',9,1),(66,'2019-10-21 12:08:32.970881','11','Arsenal',1,'[{\"added\": {}}]',10,1),(67,'2019-10-21 12:08:44.976976','12','Liverpool',1,'[{\"added\": {}}]',10,1),(68,'2019-10-21 12:08:58.376602','13','Burnemouth',1,'[{\"added\": {}}]',10,1),(69,'2019-10-21 12:09:07.043808','14','Chelsea',1,'[{\"added\": {}}]',10,1),(70,'2019-10-21 12:09:15.614243','15','Crystal Palace',1,'[{\"added\": {}}]',10,1),(71,'2019-10-21 12:09:23.730025','16','Everton',1,'[{\"added\": {}}]',10,1),(72,'2019-10-21 12:09:33.200369','17','Leicester City',1,'[{\"added\": {}}]',10,1),(73,'2019-10-21 12:09:44.656514','18','Manchester United',1,'[{\"added\": {}}]',10,1),(74,'2019-10-21 12:09:52.882851','19','Manchester City',1,'[{\"added\": {}}]',10,1),(75,'2019-10-21 12:10:03.412579','20','Middlesbrough',1,'[{\"added\": {}}]',10,1),(76,'2019-10-21 12:10:14.005446','21','Newcastle United',1,'[{\"added\": {}}]',10,1),(77,'2019-10-21 12:10:25.326102','22','Norwich',1,'[{\"added\": {}}]',10,1),(78,'2019-10-21 12:10:40.433575','23','Southampton',1,'[{\"added\": {}}]',10,1),(79,'2019-10-21 12:10:49.761828','24','Stoke City',1,'[{\"added\": {}}]',10,1),(80,'2019-10-21 12:10:59.423802','25','Sunderland',1,'[{\"added\": {}}]',10,1),(81,'2019-10-21 12:11:10.453749','26','Swansea City',1,'[{\"added\": {}}]',10,1),(82,'2019-10-21 12:11:21.119978','27','Tottenhum Hotspurs',1,'[{\"added\": {}}]',10,1),(83,'2019-10-21 12:11:28.544098','28','Watford',1,'[{\"added\": {}}]',10,1),(84,'2019-10-21 12:11:37.443587','29','West Brom',1,'[{\"added\": {}}]',10,1),(85,'2019-10-21 12:11:46.021798','30','Westham United',1,'[{\"added\": {}}]',10,1),(86,'2019-10-21 12:13:13.679733','11','Standing object (11)',1,'[{\"added\": {}}]',11,1),(87,'2019-10-21 12:13:34.652187','12','Standing object (12)',1,'[{\"added\": {}}]',11,1),(88,'2019-10-21 12:13:45.440492','13','Standing object (13)',1,'[{\"added\": {}}]',11,1),(89,'2019-10-21 12:13:58.095931','14','Standing object (14)',1,'[{\"added\": {}}]',11,1),(90,'2019-10-21 12:14:11.017047','15','Standing object (15)',1,'[{\"added\": {}}]',11,1),(91,'2019-10-21 12:14:26.595109','16','Standing object (16)',1,'[{\"added\": {}}]',11,1),(92,'2019-10-21 12:22:10.150174','2','Liverpool Vs Arsenal',1,'[{\"added\": {}}]',8,1),(93,'2019-10-21 12:22:22.798753','3','Burnemouth Vs Chelsea',1,'[{\"added\": {}}]',8,1),(94,'2019-10-21 12:22:35.723323','4','Manchester City Vs Manchester United',1,'[{\"added\": {}}]',8,1),(95,'2019-10-21 12:27:16.274509','17','Standing object (17)',1,'[{\"added\": {}}]',11,1),(96,'2019-10-21 12:27:41.768573','18','Standing object (18)',1,'[{\"added\": {}}]',11,1),(97,'2019-10-21 12:28:53.883535','19','Standing object (19)',1,'[{\"added\": {}}]',11,1),(98,'2019-10-21 12:29:24.625098','20','Standing object (20)',1,'[{\"added\": {}}]',11,1),(99,'2019-10-21 12:30:37.633612','21','Standing object (21)',1,'[{\"added\": {}}]',11,1),(100,'2019-10-21 12:35:37.925653','16','Standing object (16)',2,'[{\"changed\": {\"fields\": [\"points\"]}}]',11,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(7,'sportnews','league'),(8,'sportnews','match'),(9,'sportnews','news'),(12,'sportnews','prediction'),(13,'sportnews','predictionlist'),(11,'sportnews','standing'),(10,'sportnews','team');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-10-20 16:51:37.452854'),(2,'auth','0001_initial','2019-10-20 16:51:37.522030'),(3,'admin','0001_initial','2019-10-20 16:51:37.729089'),(4,'admin','0002_logentry_remove_auto_add','2019-10-20 16:51:37.770287'),(5,'admin','0003_logentry_add_action_flag_choices','2019-10-20 16:51:37.779787'),(6,'contenttypes','0002_remove_content_type_name','2019-10-20 16:51:37.833799'),(7,'auth','0002_alter_permission_name_max_length','2019-10-20 16:51:37.855481'),(8,'auth','0003_alter_user_email_max_length','2019-10-20 16:51:37.873863'),(9,'auth','0004_alter_user_username_opts','2019-10-20 16:51:37.881809'),(10,'auth','0005_alter_user_last_login_null','2019-10-20 16:51:37.905568'),(11,'auth','0006_require_contenttypes_0002','2019-10-20 16:51:37.907516'),(12,'auth','0007_alter_validators_add_error_messages','2019-10-20 16:51:37.915003'),(13,'auth','0008_alter_user_username_max_length','2019-10-20 16:51:37.944355'),(14,'auth','0009_alter_user_last_name_max_length','2019-10-20 16:51:37.971215'),(15,'auth','0010_alter_group_name_max_length','2019-10-20 16:51:37.986480'),(16,'auth','0011_update_proxy_permissions','2019-10-20 16:51:37.994606'),(17,'sessions','0001_initial','2019-10-20 16:51:38.003531'),(18,'sportnews','0001_initial','2019-10-20 16:51:38.090239'),(19,'sportnews','0002_auto_20191020_1754','2019-10-20 17:54:38.166744'),(20,'sportnews','0003_auto_20191020_1758','2019-10-20 17:58:08.767855'),(21,'sportnews','0004_auto_20191020_1817','2019-10-20 18:17:33.578714'),(22,'sportnews','0005_auto_20191021_0633','2019-10-21 06:33:44.834334'),(23,'sportnews','0006_auto_20191021_0636','2019-10-21 06:36:34.357346'),(24,'sportnews','0007_auto_20191021_1208','2019-10-21 12:08:16.214478');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('xfx2sad1u5v1kc7wuktoi22z5cq01qt9','OGQ1MmJjMTkyM2FkNTA5YTQ1MzU2NDA0OGRiNTAyN2E2MTA3ZTAzYzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OTkxZTRhYjVlMDg0NTk1ZmUyNzQ1ZmJjMjI3ZjE1NTA1MWU1YTYyIn0=','2019-11-03 16:52:28.510441');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sportnews_league`
--

DROP TABLE IF EXISTS `sportnews_league`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sportnews_league` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sportnews_league`
--

LOCK TABLES `sportnews_league` WRITE;
/*!40000 ALTER TABLE `sportnews_league` DISABLE KEYS */;
INSERT INTO `sportnews_league` VALUES (1,'England Premiere League'),(2,'Spain Laliga');
/*!40000 ALTER TABLE `sportnews_league` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sportnews_match`
--

DROP TABLE IF EXISTS `sportnews_match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sportnews_match` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `schedule` datetime(6) NOT NULL,
  `status` int(11) NOT NULL,
  `away_team_id` int(11) NOT NULL,
  `league_id` int(11) NOT NULL,
  `local_team_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sportnews_match_away_team_id_35501709_fk_sportnews_team_id` (`away_team_id`),
  KEY `sportnews_match_league_id_26c0ab67_fk_sportnews_league_id` (`league_id`),
  KEY `sportnews_match_local_team_id_32c86747_fk_sportnews_team_id` (`local_team_id`),
  CONSTRAINT `sportnews_match_away_team_id_35501709_fk_sportnews_team_id` FOREIGN KEY (`away_team_id`) REFERENCES `sportnews_team` (`id`),
  CONSTRAINT `sportnews_match_league_id_26c0ab67_fk_sportnews_league_id` FOREIGN KEY (`league_id`) REFERENCES `sportnews_league` (`id`),
  CONSTRAINT `sportnews_match_local_team_id_32c86747_fk_sportnews_team_id` FOREIGN KEY (`local_team_id`) REFERENCES `sportnews_team` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sportnews_match`
--

LOCK TABLES `sportnews_match` WRITE;
/*!40000 ALTER TABLE `sportnews_match` DISABLE KEYS */;
INSERT INTO `sportnews_match` VALUES (2,'2019-10-31 12:22:06.000000',1,11,1,12),(3,'2019-10-31 12:22:20.000000',1,14,1,13),(4,'2019-10-30 12:22:34.000000',1,18,1,19);
/*!40000 ALTER TABLE `sportnews_match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sportnews_news`
--

DROP TABLE IF EXISTS `sportnews_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sportnews_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `content` longtext NOT NULL,
  `thumbnail` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sportnews_news`
--

LOCK TABLES `sportnews_news` WRITE;
/*!40000 ALTER TABLE `sportnews_news` DISABLE KEYS */;
INSERT INTO `sportnews_news` VALUES (1,'ሮይ ኪን የሰጠው አስገራሚ አስተያየት','ማንችስተር ዩናትድ እና ሊቨርፑል እያደረጉ ካለው ጨዋታ ቀደም ብሎ የሁለቱ ክለቦች ተጫዋቾች ወደሜዳ ከመግባታቸው በፊት ከመልበሻ ክፍል ሲወጡ እርስ በእርስ ሲተቃቀፉና ሲያወሩ ተስተውለዋል። \r\n\r\nበዚህም የሁለቱ ቡድኖች ተጫዋቾች ድርጊት የተበሳጨ የሚመስለው የቀድሞው የማንችስተር ዩናይትድ አምበል ሮይ ኪን \"እንዴት ወደ ጦርነት እየገባህ ትተቃቀፋለህ?  ይቅርስ መተቃቀፍ አይን ለአይን ለራሱ መተያየት የለብኽም ወደ ጦርነት እኮ ነው እየገባኽ ያለኸው\" ሲል ግርምቱን ለስካይ ስፓርት ተናግሯል።','thumbs/blackpower.jpg','2019-10-20 16:56:12.016010'),(2,'የማንችስተር ዩናይትድ ተጫዋቾች ፍርሀት እንዳያድርባቸው ተብሎ የሊቨርፑልን ቪዲዮዎች አልተመለከቱም. . .','ከጨዋታዎች  አስቀድሞ በልምምድ ወቅት ተጫዋቾች በበቂ ሁኔታ እንዲዘጋጁ በሚል የተጋጣሚ ቡድናቸውን የተለያዩ አይነት ቪዲዮዎች እንዲመለከቱ ይደረጋል። ሆኖም ግን ዩናይትዶች ከሊቨርፑል ጋር ለሚያደርጉት ተጠባቂ ጨዋታ ተጫዋቾቻቸው የሊቨርፑልን በርካታ ቪዲዮዎችን በመመልከት ከጨዋታው በፊት ፍርሀት እንዳያድርባቸው በሚል ጥቂት የተመረጡ እና የተወሰኑ ቪዲዮዎችን እንዲመለከቱ እንደተደረገ የቀያይ ሴጣኖቹ ምክትል አሰልጣኝ ማይክ ፌላን ተናግረዋል።','thumbs/2019-10-20_19.55.31.jpg','2019-10-21 08:19:08.186143'),(3,'የስፔኑ ኖርዊች ሲቲ ማዮርካ','ትላንት ምሽት በተካሄደ የላሊጋ ጨዋታ ከሴጉንዳ ሊግ ያደገው ማዮርካ በሜዳቸው ሪያል ማድሪዶችን አሸንፈዋል :: \r\n\r\nማዮርካዎች በምሽቱ ጨዋታ ከሴጉንዳው ያመጧቸውን ሰድስት ተጫዋቾች አሰልፈዋል :: ይህ ግን ማዮርካዎችን ከማሸነፍ አላገዳቸውም :: \r\n\r\nበተሰራ ጥናት መሰረት የማዮርካ አጠቃላይ የቡድን ስብስብ 6 ሚሊየን ዩሮ ሲያወጣ በተቃራኒው የሪያል ማድሪድ ስብስብ 902 ሚልዮን ዩሮ እንደሚያወጣ ተገልጿል ::','thumbs/2019-10-20_19.55.31_nkKaaNG.jpg','2019-10-21 08:19:45.835606'),(4,'የሮሜሎ ሉካኩ አዲስ ሪከርድ','በአሁኑ ሰአት እየተካሄደ ባለው የሴሪ አ ጨዋታ ኢንተር ከ ሳሱሎ ጋር እየተጫወቱ ሲሆን ሮሜሎ ሉካኩ ጎል ማግባት ችሏል ::  ጨዋታውን እስከ አሁን ኢንትር 3 ለ 1 በመምራት ላይ ይገኛሉ ::\r\n\r\nበዚህም መሰርት ከ ዲያጎ ሚሊቶ በኋላ በሴሪ አ የመጀመሪያዎቹ አራት ጨዋታዎች ላይ አራት እና ከዚያ በላይ ያስቆጠረ ተጫዋች በመሆን አድስ ሪከርድ አስመዝግቧል ::','thumbs/2019-10-20_19.55.31_3C3oYv5.jpg','2019-10-21 08:21:05.031642'),(5,'ፔፕ ጋርዲዮላ','ከወልቭሱ አስደንጋጭ ሽንፈት መልስ ትላንት ክሪስታል ፓላስን 2 ለ 0 ያሸነፉት ሲቲዎች ከጨዋታው በኋላ ለፔፕ ጋርዲዮላ ስለ ዛሬው የላንክሻየር ደርቢ ተጥየቀዋል :: \r\n\r\nጋርድዮላ በ አስተያየቱም የዛሬውን ጨዋታ እንደማይመለከተው እና ቀጣይ ተጋጣሚዉን የጣልያኑን አትላንታ ክለብ ጨዋታ እንደሚያይ ተናግሯል :: \r\n\r\nበተመሳሳይ ዜና በትላንት ምሽቱ ጨዋታ ጎል ማስቆጠር የቻለው ጋብሬል ጂሰስ ለሀገሩ ልጆች ፊረሚንሆ ፤ ፋቢንሆ እና አሊሰን መልካም እድል እንዲገጥማቸው ከጨዋታው በኋላ አስተያየቱን ሰጥቷል ::','thumbs/2019-10-20_19.55.31_Vvrzucj.jpg','2019-10-21 08:21:34.731564'),(6,'በዘረኝነት ጥቃት ምክንያት የእንግሊዝ FA Cup ጨዋታ ተቋረጠ','በትናንትናው እለት ሀሪንጌይ ቦሮ እና ዬቪል ታወን በ እንግሊዝ FA Cup  አራተኛ ዙር ውድድር ላይ ተገናኝተው ነበር። ሆኖም ግን የባለሜዳዎቹ ሀርንጌይዎች ተጫዋቾች  በተደጋጋሚ ከተጋጣሚ ቡድናቸው ዬቪል ታዎን ደጋፊዎች የዘረኝነት ጥቃት ማስተናገድ ጀመሩ ጨዋታውም ልክ 60ኛው ደቂቃ ላይ ሲደርስ የዘረኝነቱ ጥቃት ከአቅማቸው በላይ የሆነባቸው የሀሪንጌይ ተጫዋቾች በዋና አሰልጣኛቸው ቶም ሎይዙ ውሳኔ ጨውታውን አቋርጠው ከሜዳ መውጣት ችለዋል።','thumbs/2019-10-20_19.55.31_J7JjQcU.jpg','2019-10-21 08:23:11.196121'),(7,'ሰር አሌክስ ፈርጉሰን','የቀድሞው የቀያዮቹ አሰልጣኝ ፈርጉሰን ከዛሬው የላንክሻየር ደርቢ በፉት በዩናይትድ የልምምድ ስፍራ በትላንትናው እለት በመገኘት ከ አሰልጣኝ ኦሊ ጎነር ሶልሻየር እንዲሁም ማይክል ካሪክ ጋር በመሆን በልምምድ ስፍራ ላይ ታይተዋል :: \r\n\r\nፈርጉሰን ከዚህ በተጨማሪም የ ማንችስተር ከ 18 አመት በታች ቡድን ከ ሚድልስብራ ጋር ያደረጉትን ጨዋታም በመገኘት ተመልክተዋል ::\r\n\r\nሰር አሌክስ ፈርጉሰን በዩናይትድ ቆየታቸው ከ ሊቨርፑል ጋር በ 64 አጋጣሚዎች የተገናኙ ሲሆን በ 29 ጨዋታዎች ድል ሲቀናቸው 14 ጨዋታዎች ላይ አቻ ሲለያዩ በተቀሩት 21 ጨዋታዎች ላይ ሽንፈትን አስተናግደዋል ::','thumbs/2019-10-20_19.55.31_IHdH48F.jpg','2019-10-21 08:24:33.425417'),(8,'ኢትዮጵያዊው ተጫዋች በ አውስትራሊያ','ያሬድ አብጠው ይባላል ፤ የ 20 አመት ወጣት እግር ኳስ ተጫዋች ነው:: ኢትዮጵያዊ ሲሆን በአሁን ሰአት በ አውስትራሊያ ሊግ ይገኛል:: ያሬድ አብጠው አሁን እየተካሄደ ባለው የ አውስትራሊያ ሊግ ለክለቡ አድሌድ ዩናይትድ ለመጀመሪያ ጊዜ ተጠርቶ በቛሚ አሰላለፍ ላይ ተካቶ በመጫወት ላይ ይገኛል :: \r\n\r\nክለቡ አድሌድም ለያሬድ አብጠው ወደ ዋና ሰብስብ መምጣት የእንኳን ደስ አለህ መልእክታቸውን ከጨዋታው በፊት አድርሰውታል::\r\n\r\nቲኪቫህ ስፖርት ለያሬድ አብጠው መልካሙን ሁሉ ይመኛል ::','thumbs/2019-10-20_19.55.31_oNiwyBZ.jpg','2019-10-21 09:20:34.397098'),(9,'ኢትዮጵያ ከ ሩዋንዳ . . . . . . .. . . ..','ለስድስተኛ ጊዜ በካሜሮን አስተናጋጅነት ለሚዘጋጀው የቻን 2020 ለማለፍ የማጣርያ ጨዋታ ላይ የሚገኙት ዋልያዎቹ የመልስ ጨዋታቸውን ዛሬ ከ ቀኑ 11 ሰዓት ጀምሮ የሚያካሂዱ ይሆናል፡፡ \r\n\r\nበመጀመሪያው ዙር ጨዋታ በሜዳው 1 ለ 0 የተሸነፈው የኢትዮጵያ ብሔራዊ ቡድን ውጤቱን ቀልብሶ ወደ ቀጣይ ዙር እንደሚያልፉ ተስፋ እንዳላቻ እና በሜዳ ላይ የተቻላቸውን ሁሉ እንደሚያደርጉ  አሰልጣኝ አብርሀም መብርሀቱ ተናግረዋል፡፡\r\n\r\nጨዋታው የሞት ሽረት እንደሚሆን እና በሜዳው ላይ ጠንካራን እንቅስቃሴ እንደሚያዩ የሩዋንዳው አሰልጣኝ ቪንሰንት ማሻሚ ከወዲሁ ተናግረዋል፡፡ \r\n\r\nቲኪቫህ ሰፖርት ለዋልያዎቹ ከወዲሁ መልካሙን ሁሉ ይመኛል፡፡','thumbs/2019-10-20_19.55.31_fPBTKZB.jpg','2019-10-21 09:21:29.906754'),(11,'ታለቁ ሩጫ በኢትዮጵያ . . .  . . . . . . .','ከሳምንታት በፊት በዓለማችን ትለቁ የጎዳና ላይ ሩጫ ውድድር ክብርን ያገኘው ታላቁ ሩጫ በኢትዮጵያ የ 2012 ውድድሩን ህዳር 07 በዕለተ እሁድ የሚከናወን ይሆናል፡፡  ይህ አጓጊ እና በሺዎች በጉጉት የሚጠበቀው ውድድር እስከ ዛሬ አስገራሚ እውነታዎችን አሉት፡፡ \r\n\r\n1.  በታላቁ ሩጫ ላይ አለም አቀፍ አትሌቶች ተሳታፊ ቢሆኑም በአንዱም ግን ባለድል አልሆኑም፡፡ ኢትዮጵያን ጀግኖች አትሌቶች በሁሉም ውድድር አሸናፊዎች ናቸው፡፡ በሁለቱም ፆታዎች ላይ ኬንያውያን አትሌች ሁለተኛ የወጡበት እንደ ትልቅ ውጤት ተመዝግቧል፡፡\r\n2.  ውድድሩ በ 2001 ዓ.ም ሲጀምር ጀግናው አትሌት ወይሌ ገ/ስላሴ እና ብርሀኔ አደሬ የዕርቀቶቹ አሸናፊዎች ነበሩ፡፡ \r\n3.  ሁለት ጥንዶች በአንድ የውድድር ዓመት ላይ በማሸነፍ አዲስ ሪከርድ አስመዝግበዋል፡፡ እነሱም ገ/እግዛብሔር ገ/ማርያም እና ወርቅነሽ ኪዳኔ በ 2002 የውድድር ዓመት እንዲሁም ስለሺ ስህን እና ጥሩነሽ ዲባባ በ 2003 ዓ.ም በብቸኝነት ማሸነፍ የቻሉ ሆነው ተመዝግበዋል፡፡\r\n4.  አትሌት ውዴ አያሌው ውድድሩን እ.ኤ.አ በ 2007 ፤2008 እና 2014 ዓ.ም ሶስት ጊዜ በማሸነፍ ተወዳዳሪ የላትም፡፡\r\n5.  በሴቶቹ የውድድር ዘርፍ 14 የተለያዩ አትሌቶች ማሸነፍ ሲችሉ በወንዶቹ ዘርፍ አስራ ስድስት አትሌቶች ባለ ድል መሆን ችለዋል፡፡\r\n\r\nVia ታላቁ ሩጫ በኢትዮጵያ \r\n\r\n\r\nዚዳን እና ፖግባ በዱባይ . . . . . . . . . . .\r\n\r\nከማዮርካ ጋር ላለባቸው የላሊጋ ጨዋታ በፊት ከጋዜጠኞች ጋር የተገናኘው ዚነዲን ዚዳን ከፖግባ ጋር ስለነበረው ግንኙነት የተጠየቀ ሲሆን ነገሩን ሸፋፍኖ ማለፍን መርጧል፡፡ ስለ ግንኙነታችን እና ም እንዳወራን ልነግራችሁ አልችልም ምክንያቱም እኔ እና ፖግባ ለረጅም ጊዜ የምንተዋወቅ ሰዎችን ነን ሲል አስተያየቱን ሰጥቷል፡፡\r\n\r\n\r\nእግር ኳስ ባንወድ እንኳ ሮናልዲንሆን መመልከት የማያስደስተው ሰው አልነበረም፡፡ ከጨዋታዎች በኋላ የሮናልዲንሆን ማልያ ለመቀበል ያለው ሽኩቻ ማየት የተለመደ ነበር፡፡ \r\n\r\nሮናልዲንሆ እግር ኳስን ካቆመ በኋላ በተለያዩ የእርዳታ ማሰባሰቢያ ጨዋታዎች ላይ በመጫወት ያሳልፋል፡፡ በዚህም መሰርት ትላንት ምሽት ከብዙ ጊዜ በኋላ ወደ እግር ኳሱ ዓለም ተመልሶ መጫወት ሲችል አስደናቂ ብቃቱን ማሳየት ችሏል፡፡ \r\n\r\nከጨዋታው በኋላ ታዳጊዎች ወደ ሜዳ በመግባት ያሳዩ የነበረው ነገር የብዙዎችን ልብ የሚነካ ነበር፡፡ \r\n\r\nእኛም ይህን ምስል ልናጋራዎ ወደናል!\r\n\r\nለእግር ኳስ ያለው ፍቅር አላስችል ያለው የ 39 ዓመቱ ሮናልዲንሆ ለማልታው ክለብ ቢርኪርካራ ለመጫወት ተቃርቦ ነገር ግን ዝውውሩ ሳይሳካ ቀርቷል፡፡','thumbs/2019-09-29_13.10.48_gISqrE7.jpg','2019-10-21 09:22:58.415795');
/*!40000 ALTER TABLE `sportnews_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sportnews_prediction`
--

DROP TABLE IF EXISTS `sportnews_prediction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sportnews_prediction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `local_result` int(11) DEFAULT NULL,
  `away_result` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `predictionlist_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sportnews_prediction_predictionlist_id_6496974c_fk_sportnews` (`predictionlist_id`),
  CONSTRAINT `sportnews_prediction_predictionlist_id_6496974c_fk_sportnews` FOREIGN KEY (`predictionlist_id`) REFERENCES `sportnews_predictionlist` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sportnews_prediction`
--

LOCK TABLES `sportnews_prediction` WRITE;
/*!40000 ALTER TABLE `sportnews_prediction` DISABLE KEYS */;
/*!40000 ALTER TABLE `sportnews_prediction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sportnews_predictionlist`
--

DROP TABLE IF EXISTS `sportnews_predictionlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sportnews_predictionlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `match_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sportnews_predictionlist_match_id_e17a43ac_fk_sportnews_match_id` (`match_id`),
  CONSTRAINT `sportnews_predictionlist_match_id_e17a43ac_fk_sportnews_match_id` FOREIGN KEY (`match_id`) REFERENCES `sportnews_match` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sportnews_predictionlist`
--

LOCK TABLES `sportnews_predictionlist` WRITE;
/*!40000 ALTER TABLE `sportnews_predictionlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `sportnews_predictionlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sportnews_standing`
--

DROP TABLE IF EXISTS `sportnews_standing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sportnews_standing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL,
  `league_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `goal` int(11) NOT NULL,
  `played` int(11) NOT NULL,
  `points` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sportnews_standing_league_id_team_id_3848db1f_uniq` (`league_id`,`team_id`),
  KEY `sportnews_standing_team_id_a3089ad8_fk_sportnews_team_id` (`team_id`),
  CONSTRAINT `sportnews_standing_league_id_192f2ef0_fk_sportnews_league_id` FOREIGN KEY (`league_id`) REFERENCES `sportnews_league` (`id`),
  CONSTRAINT `sportnews_standing_team_id_a3089ad8_fk_sportnews_team_id` FOREIGN KEY (`team_id`) REFERENCES `sportnews_team` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sportnews_standing`
--

LOCK TABLES `sportnews_standing` WRITE;
/*!40000 ALTER TABLE `sportnews_standing` DISABLE KEYS */;
INSERT INTO `sportnews_standing` VALUES (11,1,1,12,14,8,24),(12,1,1,19,12,8,22),(13,3,1,11,21,22,12),(14,4,1,13,21,22,22),(15,5,1,14,2,4,13),(16,6,1,17,5,4,10),(17,7,1,26,23,22,12),(18,8,1,18,12,16,11),(19,9,1,21,22,12,43),(20,10,1,16,11,21,11),(21,11,1,27,9,3,10);
/*!40000 ALTER TABLE `sportnews_standing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sportnews_team`
--

DROP TABLE IF EXISTS `sportnews_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sportnews_team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `logo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sportnews_team`
--

LOCK TABLES `sportnews_team` WRITE;
/*!40000 ALTER TABLE `sportnews_team` DISABLE KEYS */;
INSERT INTO `sportnews_team` VALUES (11,'Arsenal','logos/arsenal.jpg'),(12,'Liverpool','logos/Liverpool.png'),(13,'Burnemouth','logos/bournemouth-logo-vector-download.jpg'),(14,'Chelsea','logos/chelsea.png'),(15,'Crystal Palace','logos/crystal-palace-fc-logo-vector-download.jpg'),(16,'Everton','logos/everton-fc-logo-vector.jpg'),(17,'Leicester City','logos/leicester-city-fc-vector-logo-eps-svg.png'),(18,'Manchester United','logos/Man_United.png'),(19,'Manchester City','logos/manchester-city-logo.png'),(20,'Middlesbrough','logos/middlesbrough-fc-logo-preview.png'),(21,'Newcastle United','logos/newcastle-united-logo-preview.png'),(22,'Norwich','logos/norwich-logo-vector.png'),(23,'Southampton','logos/southampton-f.c-logo-vector.png'),(24,'Stoke City','logos/stoke-city-fc-vector.gif'),(25,'Sunderland','logos/sunderland-afc-logo.png'),(26,'Swansea City','logos/swansea-city-vector.gif'),(27,'Tottenhum Hotspurs','logos/tottenham-hotspur-fc-logo.png'),(28,'Watford','logos/watford-fc-logo-vector-download.jpg'),(29,'West Brom','logos/west-brom-logo-vector.png'),(30,'Westham United','logos/west-ham-united-logo-vector.png');
/*!40000 ALTER TABLE `sportnews_team` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-21 17:39:17
