CREATE DATABASE  IF NOT EXISTS `cruzadadavidowuor` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `cruzadadavidowuor`;
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cruzadadavidowuor
-- ------------------------------------------------------
-- Server version	5.7.39

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
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargo` (
  `idcargo` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(200) NOT NULL,
  `estado` varchar(1) NOT NULL COMMENT '''1: ACTIVO, 0: INACTIVO''',
  `fecha_registro` datetime NOT NULL,
  `usuario_registro` varchar(45) NOT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `usuario_modificacion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcargo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
INSERT INTO `cargo` VALUES (1,'Pastor','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(2,'Evangelista','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(3,'Adorador','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(4,'Líder','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(5,'Otros','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conferencia`
--

DROP TABLE IF EXISTS `conferencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conferencia` (
  `idconferencia` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(200) NOT NULL,
  `fecha_inicial` date NOT NULL,
  `fecha_final` date NOT NULL,
  `lugar` varchar(200) NOT NULL,
  `horario` varchar(200) NOT NULL,
  `correo` varchar(200) NOT NULL,
  `contacto` bigint(20) NOT NULL,
  `idpais` int(11) NOT NULL,
  `estado` varchar(1) NOT NULL COMMENT '''1: ACTIVO, 0: INACTIVO''',
  `fecha_registro` datetime NOT NULL,
  `usuario_registro` varchar(45) NOT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `usuario_modificacion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idconferencia`),
  KEY `fk_cruzada_pais_idx` (`idpais`),
  CONSTRAINT `fk_cruzada_pais0` FOREIGN KEY (`idpais`) REFERENCES `pais` (`idpais`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conferencia`
--

LOCK TABLES `conferencia` WRITE;
/*!40000 ALTER TABLE `conferencia` DISABLE KEYS */;
INSERT INTO `conferencia` VALUES (1,'Conferencia de Líder y Pastores para República Dominicana','2022-12-01','2022-12-02','La Romana','Coming Soon','contacto@profetadavidowuoramericalatina.org',51941377887,60,'1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
/*!40000 ALTER TABLE `conferencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cruzada`
--

DROP TABLE IF EXISTS `cruzada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cruzada` (
  `idcruzada` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(200) NOT NULL,
  `fecha_inicial` date NOT NULL,
  `fecha_final` date NOT NULL,
  `lugar` varchar(200) NOT NULL,
  `horario` varchar(200) NOT NULL,
  `correo` varchar(200) NOT NULL,
  `contacto` bigint(20) NOT NULL,
  `idpais` int(11) NOT NULL,
  `estado` varchar(1) NOT NULL COMMENT '''1: ACTIVO, 0: INACTIVO''',
  `fecha_registro` datetime NOT NULL,
  `usuario_registro` varchar(45) NOT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `usuario_modificacion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcruzada`),
  KEY `fk_cruzada_pais_idx` (`idpais`),
  CONSTRAINT `fk_cruzada_pais` FOREIGN KEY (`idpais`) REFERENCES `pais` (`idpais`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cruzada`
--

LOCK TABLES `cruzada` WRITE;
/*!40000 ALTER TABLE `cruzada` DISABLE KEYS */;
INSERT INTO `cruzada` VALUES (1,'Cruzada de Sanidades y Milagros para República Dominicana','2022-12-01','2022-12-02','La Romana','Coming Soon','cruzada@profetadavidowuoramericalatina.org',51941388778,60,'1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
/*!40000 ALTER TABLE `cruzada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enfermo`
--

DROP TABLE IF EXISTS `enfermo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enfermo` (
  `idenfermo` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(200) NOT NULL,
  `apellidos` varchar(200) NOT NULL,
  `correo` varchar(200) NOT NULL,
  `celular` bigint(20) NOT NULL,
  `edad` int(3) DEFAULT NULL,
  `iglesia` varchar(200) DEFAULT NULL,
  `enfermedad` varchar(200) NOT NULL,
  `anio_enfermedad` int(2) NOT NULL,
  `foto_diagnostico` blob,
  `idcruzada` int(11) NOT NULL,
  `idpais` int(11) NOT NULL,
  `idfuente` int(11) NOT NULL,
  `estado` varchar(1) NOT NULL COMMENT '''1: ACTIVO, 0: INACTIVO''',
  `fecha_registro` datetime NOT NULL,
  `usuario_registro` varchar(45) NOT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `usuario_modificacion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idenfermo`),
  KEY `fk_enfermo_cruzada1_idx` (`idcruzada`),
  KEY `fk_enfermo_pais1_idx` (`idpais`),
  KEY `fk_enfermo_fuente1_idx` (`idfuente`),
  CONSTRAINT `fk_enfermo_cruzada1` FOREIGN KEY (`idcruzada`) REFERENCES `cruzada` (`idcruzada`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_enfermo_fuente1` FOREIGN KEY (`idfuente`) REFERENCES `fuente` (`idfuente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_enfermo_pais1` FOREIGN KEY (`idpais`) REFERENCES `pais` (`idpais`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enfermo`
--

LOCK TABLES `enfermo` WRITE;
/*!40000 ALTER TABLE `enfermo` DISABLE KEYS */;
/*!40000 ALTER TABLE `enfermo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fuente`
--

DROP TABLE IF EXISTS `fuente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fuente` (
  `idfuente` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(200) NOT NULL,
  `estado` varchar(1) NOT NULL COMMENT '''1: ACTIVO, 0: INACTIVO''',
  `fecha_registro` datetime NOT NULL,
  `usuario_registro` varchar(45) NOT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `usuario_modificacion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idfuente`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fuente`
--

LOCK TABLES `fuente` WRITE;
/*!40000 ALTER TABLE `fuente` DISABLE KEYS */;
INSERT INTO `fuente` VALUES (1,'Facebook','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(2,'Youtube','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(3,'Twitter','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(4,'Instagram','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(5,'TikTok','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(6,'Iglesia','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(7,'Otros','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
/*!40000 ALTER TABLE `fuente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pais` (
  `idpais` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(200) NOT NULL,
  `estado` varchar(1) NOT NULL COMMENT '''1: ACTIVO, 0: INACTIVO''',
  `fecha_registro` datetime NOT NULL,
  `usuario_registro` varchar(45) NOT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `usuario_modificacion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idpais`)
) ENGINE=InnoDB AUTO_INCREMENT=243 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` VALUES (1,'Afganistán','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(2,'Albania','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(3,'Argelia','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(4,'Samoa Americana','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(5,'Andorra','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(6,'Angola ','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(7,'Anguilla','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(8,'Antártida','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(9,'Antigua y Barbuda','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(10,'Argentina','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(11,'Armenia','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(12,'Aruba','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(13,'Australia','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(14,'Austria','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(15,'Azerbaiyán','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(16,'Bahamas','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(17,'Baréin ','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(18,'Banglades','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(19,'Barbados','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(20,'Bielorrusia ','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(21,'Bélgica','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(22,'Belice ','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(23,'Benin','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(24,'Bermudas','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(25,'Butan','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(26,'Bolivia','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(27,'Bosnia-Herzegovina','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(28,'Botsuana','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(29,'Brasil ','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(30,'Territorio Británico del Océano Índico','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(31,'Brunei ','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(32,'Bulgaria','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(33,'Burkina Faso','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(34,'Burundi','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(35,'Camboya','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(36,'Camerún','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(37,'Canadá ','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(38,'Cabo Verde','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(39,'Islas Caimán','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(40,'República Centroafricana','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(41,'Chad','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(42,'Chile','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(43,'China','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(44,'Isla de Navidad','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(45,'Islas Cocos ','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(46,'Colombia','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(47,'Comoras','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(48,'Congo','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(49,'República Democrática del Congo ','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(50,'Islas Cook','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(51,'Costa Rica','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(52,'Costa de Marfil','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(53,'Croacia','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(54,'Cuba','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(55,'Chipre ','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(56,'Chequia','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(57,'Dinamarca','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(58,'Yibuti ','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(59,'Dominica','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(60,'República Dominicana','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(61,'Ecuador','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(62,'Egipto ','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(63,'El Salvador ','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(64,'Guinea Ecuatorial','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(65,'Eritrea','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(66,'Estonia','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(67,'Etiopía','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(68,'Islas Malvinas','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(69,'Islas Feroe ','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(70,'Fiyi','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(71,'Finlandia','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(72,'Francia','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(73,'Guayana Francesa ','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(74,'Polinesia Francesa','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(75,'Gabón','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(76,'Gambia ','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(77,'Georgia','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(78,'Alemania','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(79,'Ghana','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(80,'Gibraltar','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(81,'Grecia ','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(82,'Groenlandia ','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(83,'Granada','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(84,'Guadalupe','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(85,'Guam','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(86,'Guatemala','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(87,'Guernsey','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(88,'Guinea ','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(89,'Guinea-Bisau','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(90,'Guyana ','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(91,'Haití','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(92,'Ciudad del Vaticano','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(93,'Honduras','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(94,'Hong Kong','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(95,'Hungría','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(96,'Islandia','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(97,'India','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(98,'Indonesia','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(99,'Irán','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(100,'Iraq','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(101,'Irlanda','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(102,'Isla de Man ','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(103,'Israel ','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(104,'Italia ','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(105,'Jamaica','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(106,'Japón','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(107,'Jersey ','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(108,'Jordania','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(109,'Kazajistán','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(110,'Kenia','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(111,'Kiribati','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(112,'Corea del Norte','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(113,'Corea del Sur','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(114,'Kosovo ','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(115,'Kuwait ','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(116,'Kirguistán','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(117,'Laos','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(118,'Letonia','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(119,'Líbano ','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(120,'Lesoto ','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(121,'Liberia','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(122,'Libia','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(123,'Liechtenstein','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(124,'Lituania','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(125,'Luxemburgo','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(126,'Macao','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(127,'República de Macedonia','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(128,'Madagascar','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(129,'Malaui ','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(130,'Malasia','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(131,'Maldivas','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(132,'Malí','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(133,'Malta','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(134,'Islas Marshall','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(135,'Martinica','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(136,'Mauritania','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(137,'Mauricio','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(138,'Mayotte','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(139,'México ','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(140,'Estados Federados de Micronesia ','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(141,'Moldavia','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(142,'Monaco ','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(143,'Mongolia','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(144,'Montenegro','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(145,'Montserrat','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(146,'Marruecos','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(147,'Mozambique','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(148,'Birmania','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(149,'Namibia','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(150,'Nauru','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(151,'Nepal','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(152,'Holanda','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(153,'Antillas Holandesas','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(154,'Nueva Caledonia','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(155,'Nueva Zelanda','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(156,'Nicaragua','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(157,'Niger','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(158,'Nigeria','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(159,'Niue','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(160,'IslaNorfolk ','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(161,'IslasMarianasdelNorte ','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(162,'Noruega','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(163,'Omán','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(164,'Pakistán','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(165,'Palaos ','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(166,'Panamá ','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(167,'Papúa Nueva Guinea','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(168,'Paraguay','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(169,'Perú','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(170,'Filipinas','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(171,'Islas Pitcairn','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(172,'Polonia','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(173,'Portugal','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(174,'Puerto Rico ','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(175,'Qatar','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(176,'Rumania','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(177,'Rusia','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(178,'Ruanda ','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(179,'Reunion','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(180,'San Bartolome','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(181,'Santa Elena, Ascensión y Tristán de Acuña ','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(182,'San Cristóbal y Nieves ','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(183,'Santa Lucía','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(184,'Isla de San Martín','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(185,'San Pedro y Miquelon','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(186,'San Vicente y las Granadinas','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(187,'Samoa','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(188,'San Marino','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(189,'Santo Tomé y Príncipe ','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(190,'Arabia Saudita','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(191,'Senegal ','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(192,'Serbia','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(193,'Seychelles','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(194,'Sierra Leona ','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(195,'Singapur','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(196,'Eslovaquia','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(197,'Eslovenia','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(198,'Islas Salomón','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(199,'Somalia ','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(200,'Sudáfrica','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(201,'Sudán del Sur','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(202,'España','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(203,'Sri Lanka','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(204,'Estado de Palestina','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(205,'Sudán','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(206,'Surinam ','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(207,'Svalbard y Jan Mayen','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(208,'Suazilandia','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(209,'Suecia','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(210,'Suiza','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(211,'Siria','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(212,'Taiwán','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(213,'Tayikistán','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(214,'Tanzania','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(215,'Tailandia','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(216,'Timor Oriental','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(217,'Togo','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(218,'Tokelau ','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(219,'Tonga','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(220,'Trinidad y Tobago ','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(221,'Túnez','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(222,'Turquía ','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(223,'Turkmenistán ','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(224,'Islas Turcas y Caicos','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(225,'Tuvalu','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(226,'Uganda','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(227,'Ucrania ','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(228,'Emiratos Árabes Unidos ','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(229,'Reino Unido','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(230,'Estados Unidos','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(231,'Uruguay ','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(232,'Uzbekistán','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(233,'Vanuatu ','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(234,'Venezuela','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(235,'Vietnam ','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(236,'Islas Vírgenes Británicas','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(237,'Islas Vírgenes de los Estados Unidos','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(238,'Wallis y Futuna','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(239,'Yemen','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(240,'Zambia','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(241,'Zimbabue','1','2022-07-29 13:37:02','ADMIN',NULL,NULL),(242,'Åland','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro_conferencia`
--

DROP TABLE IF EXISTS `registro_conferencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registro_conferencia` (
  `idregistro` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(200) NOT NULL,
  `apellidos` varchar(200) NOT NULL,
  `correo` varchar(200) NOT NULL,
  `celular` bigint(20) NOT NULL,
  `edad` int(3) DEFAULT NULL,
  `iglesia` varchar(200) DEFAULT NULL,
  `idconferencia` int(11) NOT NULL,
  `idpais` int(11) NOT NULL,
  `idcargo` int(11) NOT NULL,
  `idfuente` int(11) NOT NULL,
  `estado` varchar(1) NOT NULL COMMENT '''1: ACTIVO, 0: INACTIVO''',
  `fecha_registro` datetime NOT NULL,
  `usuario_registro` varchar(45) NOT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `usuario_modificacion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idregistro`),
  KEY `fk_registro_conferencia_conferencia1_idx` (`idconferencia`),
  KEY `fk_registro_conferencia_pais1_idx` (`idpais`),
  KEY `fk_registro_conferencia_cargo1_idx` (`idcargo`),
  KEY `fk_registro_conferencia_fuente1_idx` (`idfuente`),
  CONSTRAINT `fk_registro_conferencia_cargo1` FOREIGN KEY (`idcargo`) REFERENCES `cargo` (`idcargo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_registro_conferencia_conferencia1` FOREIGN KEY (`idconferencia`) REFERENCES `conferencia` (`idconferencia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_registro_conferencia_fuente1` FOREIGN KEY (`idfuente`) REFERENCES `fuente` (`idfuente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_registro_conferencia_pais1` FOREIGN KEY (`idpais`) REFERENCES `pais` (`idpais`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_conferencia`
--

LOCK TABLES `registro_conferencia` WRITE;
/*!40000 ALTER TABLE `registro_conferencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `registro_conferencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'cruzadadavidowuor'
--

--
-- Dumping routines for database 'cruzadadavidowuor'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-29 15:14:41
