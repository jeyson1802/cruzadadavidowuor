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
                               `contacto` varchar(20) NOT NULL,
                               `link_telegram` varchar(200) DEFAULT NULL,
                               `id_email_marketing` varchar(10) DEFAULT NULL,
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
INSERT INTO `conferencia` VALUES (1,'Conferencia de Líder y Pastores para República Dominicana','2022-12-01','2022-12-02','La Romana','Coming Soon','contacto@profetadavidowuoramericalatina.org',51941377887, 'https://t.me/+zt8edeDV_6RiZTBh', '5', 60, '1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
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
                           `contacto` varchar(20) NOT NULL,
                           `id_email_marketing` varchar(10) DEFAULT NULL,
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
INSERT INTO `cruzada` VALUES (1,'Cruzada de Sanidades y Milagros para República Dominicana','2022-12-01','2022-12-02','La Romana','Coming Soon','cruzada@profetadavidowuoramericalatina.org',51941388778,NULL,60,'1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
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
                           `celular` varchar(20) NOT NULL,
                           `edad` int(3) DEFAULT NULL,
                           `iglesia` varchar(200) DEFAULT NULL,
                           `enfermedad` varchar(200) NOT NULL,
                           `anio_enfermedad` int(2) NOT NULL,
                           `ind_constancia` varchar(1) NOT NULL DEFAULT '0',
                           `ind_correo` varchar(1) NOT NULL DEFAULT '0',
                           `ind_email_marketing` varchar(1) NOT NULL DEFAULT '0',
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
) ENGINE=InnoDB AUTO_INCREMENT=1005632624 DEFAULT CHARSET=latin1;
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
                        `code` varchar(2) NOT NULL,
                        `descripcion` varchar(200) NOT NULL,
                        `estado` varchar(1) NOT NULL COMMENT '''1: ACTIVO, 0: INACTIVO''',
                        `fecha_registro` datetime NOT NULL,
                        `usuario_registro` varchar(45) NOT NULL,
                        `fecha_modificacion` datetime DEFAULT NULL,
                        `usuario_modificacion` varchar(45) DEFAULT NULL,
                        PRIMARY KEY (`idpais`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
INSERT INTO `pais` VALUES (null, 'AF', 'Afghanistan','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'AL', 'Albania','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'DZ', 'Algeria','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'DS', 'American Samoa','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'AD', 'Andorra','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'AO', 'Angola','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'AI', 'Anguilla','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'AQ', 'Antarctica','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'AG', 'Antigua and Barbuda','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'AR', 'Argentina','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'AM', 'Armenia','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'AW', 'Aruba','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'AU', 'Australia','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'AT', 'Austria','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'AZ', 'Azerbaijan','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'BS', 'Bahamas','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'BH', 'Bahrain','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'BD', 'Bangladesh','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'BB', 'Barbados','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'BY', 'Belarus','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'BE', 'Belgium','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'BZ', 'Belize','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'BJ', 'Benin','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'BM', 'Bermuda','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'BT', 'Bhutan','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'BO', 'Bolivia','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'BA', 'Bosnia and Herzegovina','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'BW', 'Botswana','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'BV', 'Bouvet Island','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'BR', 'Brazil','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'IO', 'British Indian Ocean Territory','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'BN', 'Brunei Darussalam','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'BG', 'Bulgaria','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'BF', 'Burkina Faso','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'BI', 'Burundi','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'KH', 'Cambodia','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'CM', 'Cameroon','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'CA', 'Canada','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'CV', 'Cape Verde','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'KY', 'Cayman Islands','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'CF', 'Central African Republic','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'TD', 'Chad','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'CL', 'Chile','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'CN', 'China','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'CX', 'Christmas Island','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'CC', 'Cocos (Keeling) Islands','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'CO', 'Colombia','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'KM', 'Comoros','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'CD', 'Democratic Republic of the Congo','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'CG', 'Republic of Congo','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'CK', 'Cook Islands','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'CR', 'Costa Rica','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'HR', 'Croatia (Hrvatska)','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'CU', 'Cuba','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'CY', 'Cyprus','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'CZ', 'Czech Republic','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'DK', 'Denmark','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'DJ', 'Djibouti','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'DM', 'Dominica','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'DO', 'República Dominicana','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'TP', 'East Timor','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'EC', 'Ecuador','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'EG', 'Egypt','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'SV', 'El Salvador','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'GQ', 'Equatorial Guinea','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'ER', 'Eritrea','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'EE', 'Estonia','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'ET', 'Ethiopia','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'FK', 'Falkland Islands (Malvinas)','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'FO', 'Faroe Islands','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'FJ', 'Fiji','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'FI', 'Finland','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'FR', 'France','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'FX', 'France, Metropolitan','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'GF', 'French Guiana','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'PF', 'French Polynesia','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'TF', 'French Southern Territories','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'GA', 'Gabon','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'GM', 'Gambia','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'GE', 'Georgia','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'DE', 'Germany','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'GH', 'Ghana','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'GI', 'Gibraltar','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'GK', 'Guernsey','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'GR', 'Greece','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'GL', 'Greenland','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'GD', 'Grenada','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'GP', 'Guadeloupe','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'GU', 'Guam','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'GT', 'Guatemala','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'GN', 'Guinea','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'GW', 'Guinea-Bissau','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'GY', 'Guyana','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'HT', 'Haiti','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'HM', 'Heard and Mc Donald Islands','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'HN', 'Honduras','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'HK', 'Hong Kong','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'HU', 'Hungary','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'IS', 'Iceland','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'IN', 'India','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'IM', 'Isle of Man','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'ID', 'Indonesia','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'IR', 'Iran (Islamic Republic of)','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'IQ', 'Iraq','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'IE', 'Ireland','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'IL', 'Israel','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'IT', 'Italy','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'CI', 'Ivory Coast','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'JE', 'Jersey','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'JM', 'Jamaica','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'JP', 'Japan','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'JO', 'Jordan','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'KZ', 'Kazakhstan','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'KE', 'Kenya','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'KI', 'Kiribati','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'KP', 'Korea, Democratic People''s Republic of','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'KR', 'Korea, Republic of','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'XK', 'Kosovo','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'KW', 'Kuwait','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'KG', 'Kyrgyzstan','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'LA', 'Lao People''s Democratic Republic','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'LV', 'Latvia','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'LB', 'Lebanon','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'LS', 'Lesotho','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'LR', 'Liberia','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'LY', 'Libyan Arab Jamahiriya','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'LI', 'Liechtenstein','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'LT', 'Lithuania','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'LU', 'Luxembourg','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'MO', 'Macau','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'MK', 'North Macedonia','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'MG', 'Madagascar','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'MW', 'Malawi','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'MY', 'Malaysia','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'MV', 'Maldives','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'ML', 'Mali','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'MT', 'Malta','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'MH', 'Marshall Islands','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'MQ', 'Martinique','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'MR', 'Mauritania','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'MU', 'Mauritius','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'TY', 'Mayotte','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'MX', 'Mexico','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'FM', 'Micronesia, Federated States of','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'MD', 'Moldova, Republic of','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'MC', 'Monaco','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'MN', 'Mongolia','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'ME', 'Montenegro','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'MS', 'Montserrat','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'MA', 'Morocco','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'MZ', 'Mozambique','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'MM', 'Myanmar','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'NA', 'Namibia','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'NR', 'Nauru','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'NP', 'Nepal','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'NL', 'Netherlands','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'AN', 'Netherlands Antilles','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'NC', 'New Caledonia','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'NZ', 'New Zealand','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'NI', 'Nicaragua','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'NE', 'Niger','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'NG', 'Nigeria','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'NU', 'Niue','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'NF', 'Norfolk Island','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'MP', 'Northern Mariana Islands','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'NO', 'Norway','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'OM', 'Oman','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'PK', 'Pakistan','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'PW', 'Palau','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'PS', 'Palestine','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'PA', 'Panama','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'PG', 'Papua New Guinea','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'PY', 'Paraguay','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'PE', 'Peru','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'PH', 'Philippines','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'PN', 'Pitcairn','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'PL', 'Poland','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'PT', 'Portugal','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'PR', 'Puerto Rico','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'QA', 'Qatar','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'RE', 'Reunion','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'RO', 'Romania','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'RU', 'Russian Federation','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'RW', 'Rwanda','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'KN', 'Saint Kitts and Nevis','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'LC', 'Saint Lucia','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'VC', 'Saint Vincent and the Grenadines','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'WS', 'Samoa','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'SM', 'San Marino','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'ST', 'Sao Tome and Principe','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'SA', 'Saudi Arabia','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'SN', 'Senegal','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'RS', 'Serbia','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'SC', 'Seychelles','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'SL', 'Sierra Leone','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'SG', 'Singapore','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'SK', 'Slovakia','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'SI', 'Slovenia','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'SB', 'Solomon Islands','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'SO', 'Somalia','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'ZA', 'South Africa','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'GS', 'South Georgia South Sandwich Islands','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'SS', 'South Sudan','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'ES', 'Spain','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'LK', 'Sri Lanka','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'SH', 'St. Helena','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'PM', 'St. Pierre and Miquelon','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'SD', 'Sudan','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'SR', 'Suriname','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'SJ', 'Svalbard and Jan Mayen Islands','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'SZ', 'Eswatini','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'SE', 'Sweden','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'CH', 'Switzerland','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'SY', 'Syrian Arab Republic','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'TW', 'Taiwan','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'TJ', 'Tajikistan','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'TZ', 'Tanzania, United Republic of','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'TH', 'Thailand','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'TG', 'Togo','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'TK', 'Tokelau','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'TO', 'Tonga','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'TT', 'Trinidad and Tobago','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'TN', 'Tunisia','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'TR', 'Turkey','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'TM', 'Turkmenistan','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'TC', 'Turks and Caicos Islands','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'TV', 'Tuvalu','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'UG', 'Uganda','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'UA', 'Ukraine','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'AE', 'United Arab Emirates','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'GB', 'United Kingdom','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'US', 'United States','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'UM', 'United States minor outlying islands','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'UY', 'Uruguay','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'UZ', 'Uzbekistan','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'VU', 'Vanuatu','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'VA', 'Vatican City State','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'VE', 'Venezuela','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'VN', 'Vietnam','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'VG', 'Virgin Islands (British)','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'VI', 'Virgin Islands (U.S.)','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'WF', 'Wallis and Futuna Islands','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'EH', 'Western Sahara','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'YE', 'Yemen','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'ZM', 'Zambia','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
INSERT INTO `pais` VALUES (null, 'ZW', 'Zimbabwe','1','2022-07-29 13:37:02','ADMIN',NULL,NULL);
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
                                        `celular` varchar(20) NOT NULL,
                                        `edad` int(3) DEFAULT NULL,
                                        `iglesia` varchar(200) DEFAULT NULL,
                                        `ind_constancia` varchar(1) NOT NULL DEFAULT '0',
                                        `ind_correo` varchar(1) NOT NULL DEFAULT '0',
                                        `ind_email_marketing` varchar(1) NOT NULL DEFAULT '0',
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
) ENGINE=InnoDB AUTO_INCREMENT=1005632624 DEFAULT CHARSET=latin1;
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
