CREATE DATABASE  IF NOT EXISTS `worldcup_database` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `worldcup_database`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: worldcup_database
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `coaches`
--

DROP TABLE IF EXISTS `coaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coaches` (
  `coach_id` int NOT NULL,
  `coach_name` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`coach_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coaches`
--

LOCK TABLES `coaches` WRITE;
/*!40000 ALTER TABLE `coaches` DISABLE KEYS */;
INSERT INTO `coaches` VALUES (1,'Vahid Halilhodzic'),(2,'Alejandro Sabella'),(3,'Ange Postecoglou'),(4,'Marc Wilmots'),(5,'Safet Susic'),(6,'Luiz Felipe Scolari'),(7,'Jorge Sampaoli'),(8,'Sabri Lamouchi'),(9,'Volker Finke'),(10,'Jose Pekerman'),(11,'Jorge Luis Pinto'),(12,'Niko Kovac'),(13,'Reinaldo Rueda'),(14,'Roy Hodgson'),(15,'Vicente Del Bosque'),(16,'Didier Deschamps'),(17,'Joachim Loew'),(18,'James Appiah'),(19,'Fernando Santos'),(20,'Luis Suarez'),(21,'Carlos Queiros'),(22,'Cesare Prandelli'),(23,'Alberto Zaccheroni'),(24,'Myungbo Hong'),(25,'Miguel Herrera'),(26,'Louis Van Gaal'),(27,'Stephen Keshi'),(28,' Paulo Bento'),(29,'Fabio Capello'),(30,'Ottmar Hitzfeld'),(31,'Oscar Tabarez'),(32,'Juergen Klinsmann');
/*!40000 ALTER TABLE `coaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matches`
--

DROP TABLE IF EXISTS `matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matches` (
  `match_id` int NOT NULL,
  `tournament_id` int NOT NULL,
  `match_datetime` datetime DEFAULT NULL,
  `tournament_stage` varchar(75) DEFAULT NULL,
  `home_team_goals` int DEFAULT NULL,
  `away_team_goals` int DEFAULT NULL,
  `win_conditions` varchar(75) DEFAULT NULL,
  `attendance` int DEFAULT NULL,
  `stadium_id` int NOT NULL,
  `referee_id` int NOT NULL,
  `ar1_id` int NOT NULL,
  `ar2_id` int NOT NULL,
  `home_team_id` int NOT NULL,
  `away_team_id` int NOT NULL,
  PRIMARY KEY (`match_id`),
  KEY `fk_matches_tournaments1_idx` (`tournament_id`),
  KEY `fk_matches_stadiums1_idx` (`stadium_id`),
  KEY `fk_matches_referees1_idx` (`referee_id`),
  KEY `fk_matches_referees2_idx` (`ar1_id`),
  KEY `fk_matches_referees3_idx` (`ar2_id`),
  KEY `fk_matches_teams1_idx` (`home_team_id`),
  KEY `fk_matches_teams2_idx` (`away_team_id`),
  CONSTRAINT `fk_matches_referees1` FOREIGN KEY (`referee_id`) REFERENCES `referees` (`referee_id`),
  CONSTRAINT `fk_matches_referees2` FOREIGN KEY (`ar1_id`) REFERENCES `referees` (`referee_id`),
  CONSTRAINT `fk_matches_referees3` FOREIGN KEY (`ar2_id`) REFERENCES `referees` (`referee_id`),
  CONSTRAINT `fk_matches_stadiums1` FOREIGN KEY (`stadium_id`) REFERENCES `stadiums` (`stadium_id`),
  CONSTRAINT `fk_matches_teams1` FOREIGN KEY (`home_team_id`) REFERENCES `teams` (`team_id`),
  CONSTRAINT `fk_matches_teams2` FOREIGN KEY (`away_team_id`) REFERENCES `teams` (`team_id`),
  CONSTRAINT `fk_matches_tournaments1` FOREIGN KEY (`tournament_id`) REFERENCES `tournaments` (`tournament_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matches`
--

LOCK TABLES `matches` WRITE;
/*!40000 ALTER TABLE `matches` DISABLE KEYS */;
INSERT INTO `matches` VALUES (1,1,'2014-06-12 17:00:00','Group A',3,1,'',62103,1,1,26,52,6,12),(2,1,'2014-06-13 13:00:00','Group A',1,0,'',39216,2,2,27,49,25,9),(3,1,'2014-06-13 16:00:00','Group B',1,5,'',48173,3,3,28,53,15,26),(4,1,'2014-06-13 18:00:00','Group B',3,1,'',40275,4,4,29,54,7,3),(5,1,'2014-06-14 13:00:00','Group C',3,0,'',57174,5,5,30,55,10,19),(6,1,'2014-06-14 16:00:00','Group D',1,3,'',58679,6,6,31,56,31,11),(7,1,'2014-06-14 18:00:00','Group D',1,2,'',39800,7,7,32,57,14,22),(8,1,'2014-06-14 22:00:00','Group C',2,1,'',40267,8,8,33,58,8,23),(9,1,'2014-06-15 13:00:00','Group E',2,1,'',68351,9,9,34,59,30,13),(10,1,'2014-06-15 16:00:00','Group E',3,0,'',43012,10,10,35,60,16,20),(11,1,'2014-06-15 19:00:00','Group F',2,1,'',74738,11,11,36,61,2,5),(12,1,'2014-06-16 13:00:00','Group G',4,0,'',51081,3,12,37,62,17,28),(13,1,'2014-06-16 16:00:00','Group F',0,0,'',39081,12,13,38,63,21,27),(14,1,'2014-06-16 19:00:00','Group G',1,2,'',39760,2,14,39,64,18,32),(15,1,'2014-06-17 13:00:00','Group H',2,1,'',56800,5,15,40,65,4,1),(16,1,'2014-06-17 16:00:00','Group A',0,0,'',60342,6,16,41,66,6,25),(17,1,'2014-06-17 18:00:00','Group H',1,1,'',37603,4,17,42,67,29,24),(18,1,'2014-06-18 13:00:00','Group B',2,3,'',42877,10,18,43,68,3,26),(19,1,'2014-06-18 16:00:00','Group B',0,2,'',74101,11,5,30,55,15,7),(20,1,'2014-06-18 18:00:00','Group A',0,4,'',39982,7,19,44,69,9,12),(21,1,'2014-06-19 13:00:00','Group C',2,1,'',68748,9,20,45,70,10,8),(22,1,'2014-06-19 16:00:00','Group D',2,1,'',62575,1,21,46,71,31,14),(23,1,'2014-06-19 19:00:00','Group C',0,0,'',39485,2,11,36,61,23,19),(24,1,'2014-06-20 13:00:00','Group D',0,1,'',40285,8,8,33,58,22,11),(25,1,'2014-06-20 16:00:00','Group E',2,5,'',51003,3,7,32,57,30,16),(26,1,'2014-06-20 19:00:00','Group E',1,2,'',39224,12,22,47,72,20,13),(27,1,'2014-06-21 13:00:00','Group F',1,0,'',57698,5,12,37,62,2,21),(28,1,'2014-06-21 16:00:00','Group G',2,2,'',59621,6,10,35,60,17,18),(29,1,'2014-06-21 18:00:00','Group F',1,0,'',40499,4,23,48,73,27,5),(30,1,'2014-06-22 13:00:00','Group H',1,0,'',73819,11,6,31,56,4,29),(31,1,'2014-06-22 16:00:00','Group H',2,4,'',42732,10,2,49,38,24,1),(32,1,'2014-06-22 18:00:00','Group G',2,2,'',40123,7,17,42,67,32,28),(33,1,'2014-06-23 13:00:00','Group B',0,3,'',39375,12,24,50,74,3,15),(34,1,'2014-06-23 13:00:00','Group B',2,0,'',62996,1,25,51,75,26,7),(35,1,'2014-06-23 17:00:00','Group A',1,4,'',69112,9,14,39,64,9,6),(36,1,'2014-06-23 17:00:00','Group A',1,3,'',41212,8,9,34,59,12,25),(37,1,'2014-06-24 13:00:00','Group D',0,1,'',39706,2,15,40,65,22,31),(38,1,'2014-06-24 13:00:00','Group D',0,0,'',57823,5,18,43,68,11,14),(39,1,'2014-06-24 16:00:00','Group C',1,4,'',40340,4,19,44,69,23,10),(40,1,'2014-06-24 17:00:00','Group C',2,1,'',59095,6,13,38,63,19,8),(41,1,'2014-06-25 13:00:00','Group F',2,3,'',43285,10,3,28,53,27,2),(42,1,'2014-06-25 13:00:00','Group F',3,1,'',48011,3,21,46,71,5,21),(43,1,'2014-06-25 16:00:00','Group E',0,3,'',40322,7,17,42,67,20,30),(44,1,'2014-06-25 17:00:00','Group E',0,0,'',73749,11,4,29,54,13,16),(45,1,'2014-06-26 13:00:00','Group G',0,1,'',41876,8,9,34,59,32,17),(46,1,'2014-06-26 13:00:00','Group G',2,1,'',67540,9,24,50,74,28,18),(47,1,'2014-06-26 17:00:00','Group H',0,1,'',61397,1,22,47,72,24,4),(48,1,'2014-06-26 17:00:00','Group H',1,1,'',39311,12,16,41,66,1,29),(49,1,'2014-06-28 13:00:00','Round of 16',1,1,'Brazil win on penalties (3 - 2)',57714,5,20,45,70,6,7),(50,1,'2014-06-28 17:00:00','Round of 16',2,0,'',73804,11,7,32,57,10,31),(51,1,'2014-06-29 13:00:00','Round of 16',2,1,'',58817,6,19,44,69,26,25),(52,1,'2014-06-29 17:00:00','Round of 16',1,1,'Costa Rica win on penalties (5 - 3)',41242,8,22,47,72,11,19),(53,1,'2014-06-30 13:00:00','Round of 16',2,0,'',67882,9,5,30,55,16,27),(54,1,'2014-06-30 17:00:00','Round of 16',2,1,'Germany win after extra time',NULL,10,10,35,60,17,1),(55,1,'2014-07-01 13:00:00','Round of 16',1,0,'Argentina win after extra time',63255,1,14,39,64,2,30),(56,1,'2014-07-01 17:00:00','Round of 16',2,1,'Belgium win after extra time',51227,3,18,43,68,4,32),(57,1,'2014-07-04 13:00:00','Quarter-finals',0,1,'',74240,11,17,42,67,16,17),(58,1,'2014-07-04 17:00:00','Quarter-finals',2,1,'',60342,6,21,46,71,6,10),(59,1,'2014-07-05 13:00:00','Quarter-finals',1,0,'',68551,9,3,28,53,2,4),(60,1,'2014-07-05 17:00:00','Quarter-finals',0,0,'Netherlands win on penalties (4 - 3)',51179,3,9,34,59,26,11),(61,1,'2014-07-08 17:00:00','Semi-finals',1,7,'',58141,5,15,40,65,6,17),(62,1,'2014-07-09 17:00:00','Semi-finals',0,0,'Argentina win on penalties (2 - 4)',63267,1,16,41,66,26,2),(63,1,'2014-07-12 17:00:00','Play-off for third place',0,3,'',68034,9,18,43,68,6,26),(64,1,'2014-07-13 16:00:00','Final',1,0,'Germany win after extra time',74738,11,3,28,53,17,2);
/*!40000 ALTER TABLE `matches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `matches_won_in_extra_time`
--

DROP TABLE IF EXISTS `matches_won_in_extra_time`;
/*!50001 DROP VIEW IF EXISTS `matches_won_in_extra_time`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `matches_won_in_extra_time` AS SELECT 
 1 AS `home_team_goals`,
 1 AS `away_team_goals`,
 1 AS `win_conditions`,
 1 AS `home_team_name`,
 1 AS `away_team_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `players` (
  `player_id` int NOT NULL,
  `player_name` varchar(75) DEFAULT NULL,
  `shirt_number` int DEFAULT NULL,
  `position` varchar(45) DEFAULT NULL,
  `team_id` int NOT NULL,
  PRIMARY KEY (`player_id`),
  KEY `fk_players_teams1_idx` (`team_id`),
  CONSTRAINT `fk_players_teams1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES (1,'SI MOHAMMED',1,'GK',1),(2,'BOUGUERRA',2,'C',1),(3,'GHOULAM',3,'',1),(4,'BELKALEM',4,'',1),(5,'HALLICHE',5,'',1),(6,'MESBAH',6,'',1),(7,'YEBDA',7,'',1),(8,'LACEN',8,'',1),(9,'GHILAS',9,'',1),(10,'FEGHOULI',10,'',1),(11,'BRAHIMI',11,'',1),(12,'MEDJANI',12,'',1),(13,'SLIMANI',13,'',1),(14,'BENTALEB',14,'',1),(15,'SOUDANI',15,'',1),(16,'ZEMMAMOUCHE',16,'GK',1),(17,'CADAMURO',17,'',1),(18,'DJABOU',18,'',1),(19,'TAIDER',19,'',1),(20,'MANDI',20,'',1),(21,'MAHREZ',21,'',1),(22,'MOSTEFA',22,'',1),(23,'RAIS',23,'GK',1),(24,'ROMERO',1,'GK',2),(25,'GARAY',2,'',2),(26,'CAMPAGNARO',3,'',2),(27,'ZABALETA',4,'',2),(28,'GAGO',5,'',2),(29,'BIGLIA',6,'',2),(30,'DI MARIA',7,'',2),(31,'PEREZ',8,'',2),(32,'HIGUAIN',9,'',2),(33,'MESSI',10,'C',2),(34,'M. RODRIGUEZ',11,'',2),(35,'ORION',12,'GK',2),(36,'A. FERNANDEZ',13,'',2),(37,'MASCHERANO',14,'',2),(38,'DEMICHELIS',15,'',2),(39,'ROJO',16,'',2),(40,'F. FERNANDEZ',17,'',2),(41,'PALACIO',18,'',2),(42,'ALVAREZ',19,'',2),(43,'AGUERO',20,'',2),(44,'ANDUJAR',21,'GK',2),(45,'LAVEZZI',22,'',2),(46,'BASANTA',23,'',2),(47,'RYAN',1,'GK',3),(48,'FRANJIC',2,'',3),(49,'DAVIDSON',3,'',3),(50,'CAHILL',4,'',3),(51,'MILLIGAN',5,'',3),(52,'SPIRANOVIC',6,'',3),(53,'LECKIE',7,'',3),(54,'WRIGHT',8,'',3),(55,'TAGGART',9,'',3),(56,'HALLORAN',10,'',3),(57,'OAR',11,'',3),(58,'LANGERAK',12,'GK',3),(59,'BOZANIC',13,'',3),(60,'TROISI',14,'',3),(61,'JEDINAK',15,'C',3),(62,'HOLLAND',16,'',3),(63,'MCKAY',17,'',3),(64,'GALEKOVIC',18,'GK',3),(65,'MCGOWAN',19,'',3),(66,'VIDOSIC',20,'',3),(67,'LUONGO',21,'',3),(68,'WILKINSON',22,'',3),(69,'BRESCIANO',23,'',3),(70,'COURTOIS',1,'GK',4),(71,'ALDERWEIRELD',2,'',4),(72,'VERMAELEN',3,'',4),(73,'KOMPANY',4,'C',4),(74,'VERTONGHEN',5,'',4),(75,'WITSEL',6,'',4),(76,'DE BRUYNE',7,'',4),(77,'FELLAINI',8,'',4),(78,'LUKAKU',9,'',4),(79,'E.HAZARD',10,'',4),(80,'MIRALLAS',11,'',4),(81,'MIGNOLET',12,'GK',4),(82,'BOSSUT',13,'GK',4),(83,'MERTENS',14,'',4),(84,'VAN BUYTEN',15,'',4),(85,'DEFOUR',16,'',4),(86,'ORIGI',17,'',4),(87,'LOMBAERTS',18,'',4),(88,'DEMBELE',19,'',4),(89,'JANUZAJ',20,'',4),(90,'VANDEN BORRE',21,'',4),(91,'CHADLI',22,'',4),(92,'CIMAN',23,'',4),(93,'BEGOVIC',1,'GK',5),(94,'VRSAJEVIC',2,'',5),(95,'BICAKCIC',3,'',5),(96,'SPAHIC',4,'C',5),(97,'KOLASINAC',5,'',5),(98,'VRANJES',6,'',5),(99,'BESIC',7,'',5),(100,'PJANIC',8,'',5),(101,'IBISEVIC',9,'',5),(102,'MISIMOVIC',10,'',5),(103,'DZEKO',11,'',5),(104,'FEJZIC',12,'GK',5),(105,'MUJDZA',13,'',5),(106,'SUSIC',14,'',5),(107,'SUNJIC',15,'',5),(108,'LULIC',16,'',5),(109,'IBRICIC',17,'',5),(110,'MEDUNJANIN',18,'',5),(111,'VISCA',19,'',5),(112,'HAJROVIC',20,'',5),(113,'HADZIC',21,'',5),(114,'AVDUKIC',22,'GK',5),(115,'SALIHOVIC',23,'',5),(116,'JEFFERSON',1,'GK',6),(117,'DANI ALVES',2,'',6),(118,'T SILVA',3,'C',6),(119,'DAVID LUIZ',4,'',6),(120,'FERNANDINHO',5,'',6),(121,'MARCELO',6,'',6),(122,'HULK',7,'',6),(123,'PAULINHO',8,'',6),(124,'FRED',9,'',6),(125,'NEYMAR JR',10,'',6),(126,'OSCAR',11,'',6),(127,'JULIO CESAR',12,'GK',6),(128,'DANTE',13,'',6),(129,'MAXWELL',14,'',6),(130,'HENRIQUE',15,'',6),(131,'RAMIRES',16,'',6),(132,'L GUSTAVO',17,'',6),(133,'HERNANES',18,'',6),(134,'WILLIAN',19,'',6),(135,'BERNARD',20,'',6),(136,'JO',21,'',6),(137,'VICTOR',22,'GK',6),(138,'MAICON',23,'',6),(139,'C. BRAVO',1,'GKC',7),(140,'MENA',2,'',7),(141,'ALBORNOZ',3,'',7),(142,'ISLA',4,'',7),(143,'CARMONA',6,'',7),(144,'ALEXIS',7,'',7),(145,'VIDAL',8,'',7),(146,'PINILLA',9,'',7),(147,'VALDIVIA',10,'',7),(148,'VARGAS',11,'',7),(149,'TOSELLI',12,'GK',7),(150,'ROJAS',13,'',7),(151,'ORELLANA',14,'',7),(152,'BEAUSEJOUR',15,'',7),(153,'GUTIERREZ',16,'',7),(154,'MEDEL',17,'',7),(155,'JARA',18,'',7),(156,'FUENZALIDA',19,'',7),(157,'CH. ARANGUIZ',20,'',7),(158,'DIAZ',21,'',7),(159,'PAREDES',22,'',7),(160,'HERRERA',23,'GK',7),(161,'BARRY COPA',1,'GK',8),(162,'VIERA',2,'',8),(163,'BOKA',3,'',8),(164,'T. KOLO',4,'',8),(165,'ZOKORA',5,'',8),(166,'BOLLY',6,'',8),(167,'AKPA JD',7,'',8),(168,'KALOU',8,'',8),(169,'TIOTE',9,'',8),(170,'GERVINHO',10,'',8),(171,'DROGBA',11,'',8),(172,'B. WILFRIED',12,'',8),(173,'YA KONAN',13,'',8),(174,'DIOMANDE',14,'',8),(175,'GRADEL',15,'',8),(176,'GBOHOUO',16,'GK',8),(177,'S. AURIER',17,'',8),(178,'DJAKPA',18,'',8),(179,'TOURE YAYA',19,'C',8),(180,'SEREY DIE',20,'',8),(181,'SIO',21,'',8),(182,'BAMBA',22,'',8),(183,'M. SAYOUBA',23,'GK',8),(184,'FEUDJOU',1,'GK',9),(185,'ASSOU EKOTTO',2,'',9),(186,'NKOULOU',3,'',9),(187,'DJEUGOUE',4,'',9),(188,'NOUNKEU',5,'',9),(189,'SONG',6,'',9),(190,'NGUEMO',7,'',9),(191,'MOUKANDJO',8,'',9),(192,'ETO\'O',9,'C',9),(193,'ABOUBAKAR',10,'',9),(194,'MAKOUN',11,'',9),(195,'BEDIMO',12,'',9),(196,'CHOUPO-MOTING',13,'',9),(197,'CHEDJOU',14,'',9),(198,'WEBO',15,'',9),(199,'ITANJDE',16,'GK',9),(200,'MBIA',17,'',9),(201,'ENOH',18,'',9),(202,'OLINGA',19,'',9),(203,'SALLI',20,'',9),(204,'MATIP',21,'',9),(205,'NYOM',22,'',9),(206,'N\'DJOCK',23,'GK',9),(207,'OSPINA',1,'GK',10),(208,'C. ZAPATA',2,'',10),(209,'YEPES',3,'C',10),(210,'ARIAS',4,'',10),(211,'C. CARBONERO',5,'',10),(212,'C. SANCHEZ',6,'',10),(213,'P. ARMERO',7,'',10),(214,'AGUILAR T.',8,'',10),(215,'TEO',9,'',10),(216,'JAMES',10,'',10),(217,'CUADRADO',11,'',10),(218,'GUARIN',13,'',10),(219,'IBARBO',14,'',10),(220,'A. MEJIA',15,'',10),(221,'A. BALANTA',16,'',10),(222,'BACCA',17,'',10),(223,'C. ZUNIGA',18,'',10),(224,'QUINTERO',20,'',10),(225,'JACKSON M.',21,'',10),(226,'MONDRAGON',22,'GK',10),(227,'VALDES',23,'',10),(228,'NAVAS K.',1,'GK',11),(229,'ACOSTA J.',2,'',11),(230,'GONZALEZ G.',3,'',11),(231,'UMANA M.',4,'',11),(232,'BORGES C.',5,'',11),(233,'DUARTE O.',6,'',11),(234,'BOLANOS C.',7,'',11),(235,'MYRIE D.',8,'',11),(236,'CAMPBELL J.',9,'',11),(237,'RUIZ B.',10,'C',11),(238,'BARRANTES M.',11,'',11),(239,'FRANCIS W.',12,'',11),(240,'GRANADOS O.',13,'',11),(241,'BRENES R.',14,'',11),(242,'DIAZ J.',15,'',11),(243,'GAMBOA C.',16,'',11),(244,'TEJEDA Y.',17,'',11),(245,'PEMBERTON P.',18,'GK',11),(246,'MILLER R.',19,'',11),(247,'CALVO D.',20,'',11),(248,'URENA M.',21,'',11),(249,'CUBERO J.',22,'',11),(250,'CAMBRONERO D.',23,'GK',11),(251,'PLETIKOSA',1,'GK',12),(252,'VRSALJKO',2,'',12),(253,'PRANJI?',3,'',12),(254,'PERISIC',4,'',12),(255,'CORLUKA',5,'',12),(256,'LOVREN',6,'',12),(257,'RAKITI?',7,'',12),(258,'VUKOJEVI?',8,'',12),(259,'JELAVI?',9,'',12),(260,'MODRI?',10,'',12),(261,'SRNA',11,'C',12),(262,'ZELENIKA',12,'GK',12),(263,'SCHILDENFELD',13,'',12),(264,'BROZOVI?',14,'',12),(265,'BADELJ',15,'',12),(266,'REBI?',16,'',12),(267,'MANDZUKIC',17,'',12),(268,'OLI?',18,'',12),(269,'SAMMIR',19,'',12),(270,'KOVA?I?',20,'',12),(271,'VIDA',21,'',12),(272,'EDUARDO',22,'',12),(273,'SUBASIC',23,'GK',12),(274,'BANGUERA',1,'GK',13),(275,'GUAGUA',2,'',13),(276,'ERAZO',3,'',13),(277,'IBARRA',5,'',13),(278,'NOBOA',6,'',13),(279,'MONTERO',7,'',13),(280,'MENDEZ',8,'',13),(281,'W. AYOVI',10,'',13),(282,'CAICEDO',11,'',13),(283,'BONE',12,'GK',13),(284,'E. VALENCIA',13,'',13),(285,'MINDA',14,'',13),(286,'ARROYO',15,'',13),(287,'A. VALENCIA',16,'C',13),(288,'J. AYOVI',17,'',13),(289,'BAGUI',18,'',13),(290,'SARITAMA',19,'',13),(291,'MARTINEZ',20,'',13),(292,'ACHILIER',21,'',13),(293,'DOMINGUEZ',22,'GK',13),(294,'GRUEZO',23,'',13),(295,'HART',1,'GK',14),(296,'JOHNSON',2,'',14),(297,'BAINES',3,'',14),(298,'GERRARD',4,'C',14),(299,'JAGIELKA',6,'',14),(300,'WILSHERE',7,'',14),(301,'LAMPARD',8,'',14),(302,'STURRIDGE',9,'',14),(303,'ROONEY',10,'',14),(304,'WELBECK',11,'',14),(305,'SMALLING',12,'',14),(306,'FOSTER',13,'GK',14),(307,'HENDERSON',14,'',14),(308,'CHAMBERLAIN',15,'',14),(309,'JONES',16,'',14),(310,'MILNER',17,'',14),(311,'LAMBERT',18,'',14),(312,'STERLING',19,'',14),(313,'LALLANA',20,'',14),(314,'BARKLEY',21,'',14),(315,'FORSTER',22,'GK',14),(316,'SHAW',23,'',14),(317,'I. CASILLAS',1,'GKC',15),(318,'R. ALBIOL',2,'',15),(319,'PIQUE',3,'',15),(320,'JAVI MARTINEZ',4,'',15),(321,'JUANFRAN',5,'',15),(322,'A. INIESTA',6,'',15),(323,'DAVID VILLA',7,'',15),(324,'XAVI',8,'',15),(325,'TORRES',9,'',15),(326,'FABREGAS',10,'',15),(327,'PEDRO',11,'',15),(328,'DE GEA',12,'GK',15),(329,'MATA',13,'',15),(330,'ALONSO',14,'',15),(331,'RAMOS',15,'',15),(332,'SERGIO',16,'',15),(333,'KOKE',17,'',15),(334,'JORDI ALBA',18,'',15),(335,'DIEGO COSTA',19,'',15),(336,'S. CAZORLA',20,'',15),(337,'SILVA',21,'',15),(338,'AZPILICUETA',22,'',15),(339,'REINA',23,'GK',15),(340,'LLORIS',1,'GKC',16),(341,'DEBUCHY',2,'',16),(342,'EVRA',3,'',16),(343,'VARANE',4,'',16),(344,'SAKHO',5,'',16),(345,'CABAYE',6,'',16),(346,'CABELLA',7,'',16),(347,'VALBUENA',8,'',16),(348,'GIROUD',9,'',16),(349,'BENZEMA',10,'',16),(350,'GRIEZMANN',11,'',16),(351,'MAVUBA',12,'',16),(352,'MANGALA',13,'',16),(353,'MATUIDI',14,'',16),(354,'SAGNA',15,'',16),(355,'RUFFIER',16,'GK',16),(356,'DIGNE',17,'',16),(357,'SISSOKO',18,'',16),(358,'POGBA',19,'',16),(359,'REMY',20,'',16),(360,'KOSCIELNY',21,'',16),(361,'SCHNEIDERLIN',22,'',16),(362,'LANDREAU',23,'GK',16),(363,'NEUER',1,'GK',17),(364,'GROBKREUTZ',2,'',17),(365,'GINTER',3,'',17),(366,'HOWEDES',4,'',17),(367,'HUMMELS',5,'',17),(368,'KHEDIRA',6,'',17),(369,'SCHWEINSTEIGER',7,'',17),(370,'OZIL',8,'',17),(371,'SCHURRLE',9,'',17),(372,'PODOLSKI',10,'',17),(373,'KLOSE',11,'',17),(374,'ZIELER',12,'GK',17),(375,'MULLER',13,'',17),(376,'DRAXLER',14,'',17),(377,'DURM',15,'',17),(378,'LAHM',16,'C',17),(379,'MERTESACKER',17,'',17),(380,'KROOS',18,'',17),(381,'GOTZE',19,'',17),(382,'BOATENG',20,'',17),(383,'MUSTAFI',21,'',17),(384,'WEIDENFELLER',22,'GK',17),(385,'KRAMER',23,'',17),(386,'S. ADAMS',1,'GK',18),(387,'INKOOM',2,'',18),(388,'A. GYAN',3,'C',18),(389,'D. OPARE',4,'',18),(390,'ESSIEN',5,'',18),(391,'ACQUAH',6,'',18),(392,'ATSU',7,'',18),(393,'BADU',8,'',18),(394,'PRINCE',9,'',18),(395,'A. AYEW',10,'',18),(396,'MUNTARI',11,'',18),(397,'KWARASEY',12,'GK',18),(398,'J. AYEW',13,'',18),(399,'ADOMAH',14,'',18),(400,'SUMAILA',15,'',18),(401,'DAUDA',16,'GK',18),(402,'RABIU',17,'',18),(403,'WARIS',18,'',18),(404,'JONATHAN',19,'',18),(405,'K. ASAMOAH',20,'',18),(406,'BOYE',21,'',18),(407,'WAKASO',22,'',18),(408,'HARRISON',23,'',18),(409,'KARNEZIS',1,'GK',19),(410,'MANIATIS',2,'',19),(411,'TZAVELLAS',3,'',19),(412,'MANOLAS',4,'',19),(413,'MORAS',5,'',19),(414,'TZIOLIS',6,'',19),(415,'SAMARAS',7,'',19),(416,'KONE',8,'',19),(417,'MITROGLOU',9,'',19),(418,'KARAGOUNIS',10,'',19),(419,'VYNTRA',11,'',19),(420,'GLYKOS',12,'GK',19),(421,'KAPINO',13,'GK',19),(422,'SALPINGIDIS',14,'',19),(423,'TOROSIDIS',15,'',19),(424,'LAZAROS',16,'',19),(425,'GEKAS',17,'',19),(426,'FETFATZIDIS',18,'',19),(427,'SOKRATIS',19,'',19),(428,'CHOLEVAS',20,'',19),(429,'KATSOURANIS',21,'C',19),(430,'SAMARIS',22,'',19),(431,'TACHTSIDIS',23,'',19),(432,'LOPEZ',1,'GK',20),(433,'O. CHAVEZ',2,'',20),(434,'FIGUEROA',3,'',20),(435,'MONTES',4,'',20),(436,'BERNARDEZ',5,'',20),(437,'J.C. GARCIA',6,'',20),(438,'EMILIO',7,'',20),(439,'W. PALACIOS',8,'',20),(440,'J. PALACIOS',9,'',20),(441,'M. MARTINEZ',10,'',20),(442,'BENGTSON',11,'',20),(443,'DELGADO',12,'',20),(444,'COSTLY',13,'',20),(445,'BONIEK',14,'',20),(446,'ESPINOZA',15,'',20),(447,'R. MARTINEZ',16,'',20),(448,'NAJAR',17,'',20),(449,'VALLADARES',18,'GKC',20),(450,'GARRIDO',19,'',20),(451,'CLAROS',20,'',20),(452,'BECKELES',21,'',20),(453,'ESCOBER',22,'GK',20),(454,'M. CHAVEZ',23,'',20),(455,'R. AHMADI',1,'GK',21),(456,'KH. HEYDARI',2,'',21),(457,'HAJI SAFI',3,'',21),(458,'J. HOSSEINI',4,'',21),(459,'AMIRHOSSEIN',5,'',21),(460,'J. NEKOUNAM',6,'C',21),(461,'MASOUD. SH',7,'',21),(462,'R. HAGHIGHI',8,'',21),(463,'ALIREZA',9,'',21),(464,'KARIM',10,'',21),(465,'GHASEM. H',11,'',21),(466,'A. HAGHIGHI',12,'GK',21),(467,'H. MAHINI',13,'',21),(468,'ANDRANIK',14,'',21),(469,'MONTAZERI',15,'',21),(470,'REZA',16,'',21),(471,'AHMAD',17,'',21),(472,'BAKHTIAR',18,'',21),(473,'BEIKZADEH',19,'',21),(474,'BEITASHOUR',20,'',21),(475,'DEJAGAH',21,'',21),(476,'DAVARI',22,'GK',21),(477,'MEHRDAD',23,'',21),(478,'BUFFON',1,'GK',22),(479,'DE SCIGLIO',2,'',22),(480,'CHIELLINI',3,'',22),(481,'DARMIAN',4,'',22),(482,'THIAGO MOTTA',5,'',22),(483,'CANDREVA',6,'',22),(484,'ABATE',7,'',22),(485,'MARCHISIO',8,'',22),(486,'BALOTELLI',9,'',22),(487,'CASSANO',10,'',22),(488,'CERCI',11,'',22),(489,'SIRIGU',12,'GK',22),(490,'PERIN',13,'GK',22),(491,'AQUILANI',14,'',22),(492,'BARZAGLI',15,'',22),(493,'DE ROSSI',16,'',22),(494,'IMMOBILE',17,'',22),(495,'PAROLO',18,'',22),(496,'BONUCCI',19,'',22),(497,'PALETTA',20,'',22),(498,'PIRLO',21,'C',22),(499,'INSIGNE',22,'',22),(500,'VERRATTI',23,'',22),(501,'KAWASHIMA',1,'GK',23),(502,'UCHIDA',2,'',23),(503,'G. SAKAI',3,'',23),(504,'HONDA',4,'',23),(505,'NAGATOMO',5,'',23),(506,'MORISHIGE',6,'',23),(507,'ENDO',7,'',23),(508,'KIYOTAKE',8,'',23),(509,'OKAZAKI',9,'',23),(510,'KAGAWA',10,'',23),(511,'KAKITANI',11,'',23),(512,'NISHIKAWA',12,'GK',23),(513,'OKUBO',13,'',23),(514,'AOYAMA',14,'',23),(515,'KONNO',15,'',23),(516,'YAMAGUCHI',16,'',23),(517,'HASEBE',17,'C',23),(518,'OSAKO',18,'',23),(519,'INOHA',19,'',23),(520,'SAITO',20,'',23),(521,'H. SAKAI',21,'',23),(522,'YOSHIDA',22,'',23),(523,'GONDA',23,'GK',23),(524,'S R JUNG',1,'GK',24),(525,'C S KIM',2,'',24),(526,'S Y YUN',3,'',24),(527,'T H KWAK',4,'',24),(528,'Y G KIM',5,'',24),(529,'S H HWANG',6,'',24),(530,'B K KIM',7,'',24),(531,'D S HA',8,'',24),(532,'H M SON',9,'',24),(533,'C Y PARK',10,'',24),(534,'K H LEE',11,'',24),(535,'Y LEE',12,'',24),(536,'J C KOO',13,'C',24),(537,'K Y HAN',14,'',24),(538,'J W PARK',15,'',24),(539,'S Y KI',16,'',24),(540,'C Y LEE',17,'',24),(541,'S W KIM',18,'',24),(542,'D W JI',19,'',24),(543,'J H HONG',20,'',24),(544,'S G KIM',21,'GK',24),(545,'J H PARK',22,'',24),(546,'B Y LEE',23,'GK',24),(547,'J. CORONA',1,'GK',25),(548,'F. RODRIGUEZ',2,'',25),(549,'C. SALCIDO',3,'',25),(550,'R. MARQUEZ',4,'C',25),(551,'D. REYES',5,'',25),(552,'H. HERRERA',6,'',25),(553,'M. LAYUN',7,'',25),(554,'M. FABIAN',8,'',25),(555,'R. JIMENEZ',9,'',25),(556,'G. DOS SANTOS',10,'',25),(557,'A. PULIDO',11,'',25),(558,'A. TALAVERA',12,'GK',25),(559,'G. OCHOA',13,'GK',25),(560,'J. HERNANDEZ',14,'',25),(561,'H. MORENO',15,'',25),(562,'M. PONCE',16,'',25),(563,'I. BRIZUELA',17,'',25),(564,'A. GUARDADO',18,'',25),(565,'O. PERALTA',19,'',25),(566,'J. AQUINO',20,'',25),(567,'C. PENA',21,'',25),(568,'P. AGUILAR',22,'',25),(569,'J. VAZQUEZ',23,'',25),(570,'CILLESSEN',1,'GK',26),(571,'VLAAR',2,'',26),(572,'DE VRIJ',3,'',26),(573,'MARTINS INDI',4,'',26),(574,'BLIND',5,'',26),(575,'DE JONG',6,'',26),(576,'JANMAAT',7,'',26),(577,'DE GUZMAN',8,'',26),(578,'V. PERSIE',9,'C',26),(579,'SNEIJDER',10,'',26),(580,'ROBBEN',11,'',26),(581,'VERHAEGH',12,'',26),(582,'VELTMAN',13,'',26),(583,'KONGOLO',14,'',26),(584,'KUYT',15,'',26),(585,'CLASIE',16,'',26),(586,'LENS',17,'',26),(587,'FER',18,'',26),(588,'HUNTELAAR',19,'',26),(589,'WIJNALDUM',20,'',26),(590,'MEMPHIS',21,'',26),(591,'VORM',22,'GK',26),(592,'KRUL',23,'GK',26),(593,'ENYEAMA',1,'GKC',27),(594,'YOBO',2,'',27),(595,'UZOENYI',3,'',27),(596,'GABRIEL',4,'',27),(597,'AMBROSE',5,'',27),(598,'EGWUEKWE',6,'',27),(599,'MUSA',7,'',27),(600,'ODEMWINGIE',8,'',27),(601,'EMENIKE',9,'',27),(602,'MIKEL',10,'',27),(603,'MOSES',11,'',27),(604,'ODUNLAMI',12,'',27),(605,'OSHANIWA',13,'',27),(606,'OBOABONA',14,'',27),(607,'AZEEZ',15,'',27),(608,'EJIDE',16,'GK',27),(609,'ONAZI',17,'',27),(610,'BABATUNDE',18,'',27),(611,'NWOFOR',19,'',27),(612,'UCHEBO',20,'',27),(613,'AGBIM',21,'GK',27),(614,'OMERUO',22,'',27),(615,'AMEOBI',23,'',27),(616,'B. ALVES',2,'',28),(617,'PEPE',3,'',28),(618,'MIGUEL',4,'',28),(619,'F. COENTRAO',5,'',28),(620,'WILLIAM',6,'',28),(621,'RONALDO',7,'C',28),(622,'J. MOUTINHO',8,'',28),(623,'H. ALMEIDA',9,'',28),(624,'VIEIRINHA',10,'',28),(625,'EDER',11,'',28),(626,'RUI PATRICIO',12,'GK',28),(627,'R. COSTA',13,'',28),(628,'NETO',14,'',28),(629,'RAFA',15,'',28),(630,'R. MEIRELES',16,'',28),(631,'NANI',17,'',28),(632,'VARELA',18,'',28),(633,'A. ALMEIDA',19,'',28),(634,'R. AMORIM',20,'',28),(635,'J. PEREIRA',21,'',28),(636,'BETO',22,'GK',28),(637,'H. POSTIGA',23,'',28),(638,'AKINFEEV',1,'GK',29),(639,'KOZLOV',2,'',29),(640,'SHCHENNIKOV',3,'',29),(641,'IGNASHEVICH',4,'',29),(642,'SEMENOV',5,'',29),(643,'KANUNNIKOV',6,'',29),(644,'DENISOV',7,'',29),(645,'GLUSHAKOV',8,'',29),(646,'KOKORIN',9,'',29),(647,'DZAGOEV',10,'',29),(648,'KERZHAKOV',11,'',29),(649,'LODYGIN',12,'GK',29),(650,'GRANAT',13,'',29),(651,'V. BEREZUTSKIY',14,'C',29),(652,'MOGILEVETC',15,'',29),(653,'RYZHIKOV',16,'GK',29),(654,'SHATOV',17,'',29),(655,'ZHIRKOV',18,'',29),(656,'SAMEDOV',19,'',29),(657,'FAYZULIN',20,'',29),(658,'IONOV',21,'',29),(659,'ESHCHENKO',22,'',29),(660,'D. KOMBAROV',23,'',29),(661,'BENAGLIO',1,'GK',30),(662,'LICHTSTEINER',2,'',30),(663,'ZIEGLER',3,'',30),(664,'SENDEROS',4,'',30),(665,'VON BERGEN',5,'',30),(666,'LANG',6,'',30),(667,'BARNETTA',7,'',30),(668,'INLER',8,'C',30),(669,'SEFEROVIC',9,'',30),(670,'XHAKA',10,'',30),(671,'BEHRAMI',11,'',30),(672,'SOMMER',12,'GK',30),(673,'RODRIGUEZ',13,'',30),(674,'STOCKER',14,'',30),(675,'DZEMAILI',15,'',30),(676,'FERNANDES',16,'',30),(677,'GAVRANOVIC',17,'',30),(678,'MEHMEDI',18,'',30),(679,'DRMIC',19,'',30),(680,'DJOUROU',20,'',30),(681,'BURKI',21,'GK',30),(682,'SCHAR',22,'',30),(683,'SHAQIRI',23,'',30),(684,'F. MUSLERA',1,'GK',31),(685,'D. LUGANO',2,'C',31),(686,'D. GODIN',3,'',31),(687,'J. FUCILE',4,'',31),(688,'W. GARGANO',5,'',31),(689,'A. PEREIRA',6,'',31),(690,'C. RODRIGUEZ',7,'',31),(691,'A. HERNANDEZ',8,'',31),(692,'L. SUAREZ',9,'',31),(693,'D. FORLAN',10,'',31),(694,'C. STUANI',11,'',31),(695,'R. MUNOZ',12,'GK',31),(696,'J.M. GIMENEZ',13,'',31),(697,'N. LODEIRO',14,'',31),(698,'D. PEREZ',15,'',31),(699,'M. PEREIRA',16,'',31),(700,'E. AREVALO RIOS',17,'',31),(701,'G. RAMIREZ',18,'',31),(702,'S. COATES',19,'',31),(703,'A. GONZALEZ',20,'',31),(704,'E. CAVANI',21,'',31),(705,'M. CACERES',22,'',31),(706,'M. SILVA',23,'GK',31),(707,'HOWARD',1,'GK',32),(708,'YEDLIN',2,'',32),(709,'GONZALEZ',3,'',32),(710,'BRADLEY',4,'',32),(711,'BESLER',5,'',32),(712,'BROOKS',6,'',32),(713,'BEASLEY',7,'',32),(714,'DEMPSEY',8,'C',32),(715,'JOHANNSSON',9,'',32),(716,'DISKERUD',10,'',32),(717,'BEDOYA',11,'',32),(718,'GUZAN',12,'GK',32),(719,'DAVIS',14,'',32),(720,'BECKERMAN',15,'',32),(721,'GREEN',16,'',32),(722,'ALTIDORE',17,'',32),(723,'WONDOLOWSKI',18,'',32),(724,'ZUSI',19,'',32),(725,'CAMERON',20,'',32),(726,'CHANDLER',21,'',32),(727,'RIMANDO',22,'GK',32);
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referees`
--

DROP TABLE IF EXISTS `referees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `referees` (
  `referee_id` int NOT NULL,
  `referee_name` varchar(75) DEFAULT NULL,
  `referee_country` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`referee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referees`
--

LOCK TABLES `referees` WRITE;
/*!40000 ALTER TABLE `referees` DISABLE KEYS */;
INSERT INTO `referees` VALUES (1,'Yuichi Nishimura','JPN'),(2,'Wilmar Roldan','COL'),(3,'Nicola Rizzoli','ITA'),(4,'Noumandiez Doue','CIV'),(5,'Mark Geiger','USA'),(6,'Felix Brych','GER'),(7,'Bjorn Kuipers','NED'),(8,'Enrique Osses','CHI'),(9,'Ravshan Irmatov','UZB'),(10,'Sandro Ricci','BRA'),(11,'Joel Aguilar','SLV'),(12,'Milorad Mazic','SRB'),(13,'Carlos Vera','ECU'),(14,'Jonas Eriksson','SWE'),(15,'Marco Rodriguez','MEX'),(16,'Cuneyt Cakir','TUR'),(17,'Nestor Pitana','ARG'),(18,'Djamet Haimoudi','ALG'),(19,'Pedro Proenca','POR'),(20,'Howard Webb','ENG'),(21,'Carlos Velasco Carballo','ESP'),(22,'Ben Williams','AUS'),(23,'Peter O\'Leary','NZL'),(24,'Nawaf Shukralla','BHR'),(25,'Bakary Gassama','GAM'),(26,'Toru Sagara','JPN'),(27,'Humberto Clavijo','COL'),(28,'Renato Faverani','ITA'),(29,'Songuifolo Yeo','CIV'),(30,'Sean Hurd','USA'),(31,'Mark Borsch','GER'),(32,'Sander Van Roekel','NED'),(33,'Carlos Astroza','CHI'),(34,'Abduxamidullo Rasulov','UZB'),(35,'Emerson De Carvalho','BRA'),(36,'William Torres','SLV'),(37,'Milovan Ristic','SRB'),(38,'Christian Lescano','ECU'),(39,'Mathias Klasenius','SWE'),(40,'Marvin Torrentera','MEX'),(41,'Bahattin Duran','TUR'),(42,'Hernan Maidana','ARG'),(43,'Redouane Achik','MAR'),(44,'Bertino Miranda','POR'),(45,'Michael Mullarkey','ENG'),(46,'Roberto Alonso Fernandez','ESP'),(47,'Matthew Cream','AUS'),(48,'Jan Hendrik Hintz','NZL'),(49,'Eduardo Diaz','COL'),(50,'Yaser Tulefat','BHR'),(51,'Evarist Menkouande','CMR'),(52,'Toshiyuki Nagi','JPN'),(53,'Andrea Stefani','ITA'),(54,'Jean Claude Birumushahu','BDI'),(55,'Joe Fletcher','CAN'),(56,'Stefan Lupp','GER'),(57,'Erwin Zeinstra','NED'),(58,'Sergio Roman','CHI'),(59,'Bakhadyr Kochkarov','KGZ'),(60,'Marcelo Van Gasse','BRA'),(61,'Juan Zumba','SLV'),(62,'Dalibor Djurdievic','SRB'),(63,'Byron Romero','ECU'),(64,'Daniel Warnmark','SWE'),(65,'Marcos Quintero','MEX'),(66,'Tarik Ongun','TUR'),(67,'Juan Pablo Belatti','ARG'),(68,'Abdethak Etchiali','ALG'),(69,'Jose Trigo','POR'),(70,'Darren Cann','ENG'),(71,'Juan Yuste','ESP'),(72,'Hakan Anaz','AUS'),(73,'Mark Rule','NZL'),(74,'Ebrahim Saleh','BHR'),(75,'Felicien Kabanda','RWA');
/*!40000 ALTER TABLE `referees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stadiums`
--

DROP TABLE IF EXISTS `stadiums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stadiums` (
  `stadium_id` int NOT NULL,
  `stadium_name` varchar(75) DEFAULT NULL,
  `stadium_city` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`stadium_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stadiums`
--

LOCK TABLES `stadiums` WRITE;
/*!40000 ALTER TABLE `stadiums` DISABLE KEYS */;
INSERT INTO `stadiums` VALUES (1,'Arena de Sao Paulo','Sao Paulo'),(2,'Estadio das Dunas','Natal'),(3,'Arena Fonte Nova','Salvador'),(4,'Arena Pantanal','Cuiaba'),(5,'Estadio Mineirao','Belo Horizonte'),(6,'Estadio Castelao','Fortaleza'),(7,'Arena Amazonia','Manaus'),(8,'Arena Pernambuco','Recife'),(9,'Estadio Nacional','Brasilia'),(10,'Estadio Beira-Rio','Porto Alegre'),(11,'Estadio do Maracana','Rio De Janeiro'),(12,'Arena da Baixada','Curitiba');
/*!40000 ALTER TABLE `stadiums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `team_player_positions`
--

DROP TABLE IF EXISTS `team_player_positions`;
/*!50001 DROP VIEW IF EXISTS `team_player_positions`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `team_player_positions` AS SELECT 
 1 AS `team_name`,
 1 AS `player_name`,
 1 AS `position`,
 1 AS `total_unique_positions_on_team`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams` (
  `team_id` int NOT NULL,
  `tournament_id` int NOT NULL,
  `team_name` varchar(45) DEFAULT NULL,
  `team_initials` varchar(45) DEFAULT NULL,
  `coach_id` int NOT NULL,
  PRIMARY KEY (`team_id`),
  KEY `fk_teams_coaches_idx` (`coach_id`),
  KEY `fk_teams_tournaments_idx` (`tournament_id`),
  CONSTRAINT `fk_teams_coaches` FOREIGN KEY (`coach_id`) REFERENCES `coaches` (`coach_id`),
  CONSTRAINT `fk_teams_tournaments` FOREIGN KEY (`tournament_id`) REFERENCES `tournaments` (`tournament_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (1,1,'Algeria','ALG',1),(2,1,'Argentina','ARG',2),(3,1,'Australia','AUS',3),(4,1,'Belgium','BEL',4),(5,1,'Bosnia and Herzegovina','BIH',5),(6,1,'Brazil','BRA',6),(7,1,'Chile','CHI',7),(8,1,'Cote d\'Ivoire','CIV',8),(9,1,'Cameroon','CMR',9),(10,1,'Colombia','COL',10),(11,1,'Costa Rica','CRC',11),(12,1,'Croatia','CRO',12),(13,1,'Ecuador','ECU',13),(14,1,'England','ENG',14),(15,1,'Spain','ESP',15),(16,1,'France','FRA',16),(17,1,'Germany','GER',17),(18,1,'Ghana','GHA',18),(19,1,'Greece','GRE',19),(20,1,'Honduras','HON',20),(21,1,'IR Iran','IRN',21),(22,1,'Italy','ITA',22),(23,1,'Japan','JPN',23),(24,1,'Korea Republic','KOR',24),(25,1,'Mexico','MEX',25),(26,1,'Netherlands','NED',26),(27,1,'Nigeria','NGA',27),(28,1,'Portugal','POR',28),(29,1,'Russia','RUS',29),(30,1,'Switzerland','SUI',30),(31,1,'Uruguay','URU',31),(32,1,'USA','USA',32);
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `top_stadiums`
--

DROP TABLE IF EXISTS `top_stadiums`;
/*!50001 DROP VIEW IF EXISTS `top_stadiums`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `top_stadiums` AS SELECT 
 1 AS `stadium_name`,
 1 AS `matches_hosted`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `tournaments`
--

DROP TABLE IF EXISTS `tournaments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tournaments` (
  `tournament_id` int NOT NULL,
  `year` year DEFAULT NULL,
  `host` varchar(45) DEFAULT NULL,
  `goals_scored` int DEFAULT NULL,
  `matches_played` int DEFAULT NULL,
  `attendance_total` int DEFAULT NULL,
  `winning_team_id` int NOT NULL,
  `runner_up_team_id` int NOT NULL,
  `third_place_team_id` int NOT NULL,
  `fourth_place_team_id` int NOT NULL,
  PRIMARY KEY (`tournament_id`),
  KEY `fk_results_teams1_idx` (`winning_team_id`),
  KEY `fk_results_teams2_idx` (`runner_up_team_id`),
  KEY `fk_results_teams3_idx` (`third_place_team_id`),
  KEY `fk_results_teams4_idx` (`fourth_place_team_id`),
  CONSTRAINT `fk_results_teams1` FOREIGN KEY (`winning_team_id`) REFERENCES `teams` (`team_id`),
  CONSTRAINT `fk_results_teams2` FOREIGN KEY (`runner_up_team_id`) REFERENCES `teams` (`team_id`),
  CONSTRAINT `fk_results_teams3` FOREIGN KEY (`third_place_team_id`) REFERENCES `teams` (`team_id`),
  CONSTRAINT `fk_results_teams4` FOREIGN KEY (`fourth_place_team_id`) REFERENCES `teams` (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tournaments`
--

LOCK TABLES `tournaments` WRITE;
/*!40000 ALTER TABLE `tournaments` DISABLE KEYS */;
INSERT INTO `tournaments` VALUES (1,2014,'Brazil',171,64,3386810,17,2,26,6);
/*!40000 ALTER TABLE `tournaments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `wc2014_higher_average_goals`
--

DROP TABLE IF EXISTS `wc2014_higher_average_goals`;
/*!50001 DROP VIEW IF EXISTS `wc2014_higher_average_goals`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `wc2014_higher_average_goals` AS SELECT 
 1 AS `Team_Name`,
 1 AS `Average_Goals`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'worldcup_database'
--
/*!50003 DROP FUNCTION IF EXISTS `coach_of_winning_team` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `coach_of_winning_team`(
    year_entry INT
) RETURNS varchar(75) CHARSET utf8mb3
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE coach_output VARCHAR(75);

    SELECT c.coach_name
    INTO coach_output
    FROM coaches c
    JOIN teams t ON c.coach_id = t.coach_id
    JOIN tournaments tm ON t.team_id = tm.winning_team_id
    WHERE tm.year = year_entry;

    RETURN coach_output;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `max_attendance_by_year` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `max_attendance_by_year`(wc_year INT) RETURNS int
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE max_attendance INT DEFAULT 0;

    SELECT MAX(attendance)
    INTO max_attendance
    FROM matches
    JOIN tournaments USING (tournament_id)
    WHERE year = wc_year;

    RETURN max_attendance;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `referee_matches` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `referee_matches`(
 IN Ref_name_input VARCHAR(100), Tour_year_input INT
)
BEGIN
	SELECT Year, Match_ID, Tournament_Stage, HomeT.Team_Name AS Home_Team_Name, AwayT.Team_Name AS Away_Team_Name, Home_Team_Goals, Away_Team_Goals, R.referee_name AS Referee_Name, AR1.referee_name AS AR1_Name, AR2.referee_name AS AR2_Name
	FROM matches M
	JOIN teams HomeT ON M.home_team_id = HomeT.team_id
	JOIN teams AwayT ON M.away_team_id = AwayT.team_id
	JOIN referees R ON M.referee_id = R.referee_id
	JOIN referees AR1 ON M.ar1_id = AR1.referee_id
	JOIN referees AR2 ON M.ar2_id = AR2.referee_id
    JOIN tournaments T ON M.tournament_id = T.tournament_id
	WHERE R.referee_name = Ref_name_input OR AR1.referee_name = Ref_name_input or AR2.referee_name = Ref_name_input AND Year = Tour_year_input
    ORDER BY Match_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `tournament_stage_stadiums` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `tournament_stage_stadiums`(
 IN Tour_stage_input VARCHAR(75), Tour_year_input INT
)
BEGIN
	SELECT Stadium_Name, Stadium_City
    FROM matches
    JOIN stadiums USING (stadium_id)
    JOIN tournaments USING (tournament_id)
    WHERE tournament_stage = Tour_stage_input AND Year = Tour_year_input;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `matches_won_in_extra_time`
--

/*!50001 DROP VIEW IF EXISTS `matches_won_in_extra_time`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `matches_won_in_extra_time` AS select `m`.`home_team_goals` AS `home_team_goals`,`m`.`away_team_goals` AS `away_team_goals`,`m`.`win_conditions` AS `win_conditions`,`ht`.`team_name` AS `home_team_name`,`at`.`team_name` AS `away_team_name` from ((`matches` `m` join `teams` `ht` on((`m`.`home_team_id` = `ht`.`team_id`))) join `teams` `at` on((`m`.`away_team_id` = `at`.`team_id`))) where (`m`.`win_conditions` like '%extra time%') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `team_player_positions`
--

/*!50001 DROP VIEW IF EXISTS `team_player_positions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `team_player_positions` AS select `t`.`team_name` AS `team_name`,`p`.`player_name` AS `player_name`,`p`.`position` AS `position`,(select count(distinct `p2`.`position`) from `players` `p2` where ((`p2`.`team_id` = `p`.`team_id`) and (`p2`.`position` is not null))) AS `total_unique_positions_on_team` from (`players` `p` join `teams` `t` on((`p`.`team_id` = `t`.`team_id`))) where (`p`.`position` is not null) order by `t`.`team_name`,`p`.`position`,`p`.`player_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `top_stadiums`
--

/*!50001 DROP VIEW IF EXISTS `top_stadiums`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `top_stadiums` AS select `s`.`stadium_name` AS `stadium_name`,count(`m`.`match_id`) AS `matches_hosted` from (`matches` `m` join `stadiums` `s` on((`m`.`stadium_id` = `s`.`stadium_id`))) group by `s`.`stadium_id`,`s`.`stadium_name` order by `matches_hosted` desc limit 5 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `wc2014_higher_average_goals`
--

/*!50001 DROP VIEW IF EXISTS `wc2014_higher_average_goals`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `wc2014_higher_average_goals` AS select `awayt`.`team_name` AS `Team_Name`,avg((case when (`homet`.`team_id` = `m`.`home_team_id`) then `m`.`home_team_goals` when (`awayt`.`team_id` = `m`.`away_team_id`) then `m`.`away_team_goals` end)) AS `Average_Goals` from ((`matches` `m` join `teams` `homet` on((`m`.`home_team_id` = `homet`.`team_id`))) join `teams` `awayt` on((`m`.`away_team_id` = `awayt`.`team_id`))) where (`m`.`tournament_id` = 1) group by `awayt`.`team_name` having (`Average_Goals` > (select avg((case when (`homet`.`team_id` = `m`.`home_team_id`) then `m`.`home_team_goals` when (`awayt`.`team_id` = `m`.`away_team_id`) then `m`.`away_team_goals` end)) from ((`matches` `m` join `teams` `homet` on((`m`.`home_team_id` = `homet`.`team_id`))) join `teams` `awayt` on((`m`.`away_team_id` = `awayt`.`team_id`))))) order by `Average_Goals` desc */;
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

-- Dump completed on 2025-05-07 22:11:24
