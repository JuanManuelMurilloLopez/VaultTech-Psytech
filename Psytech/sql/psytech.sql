-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64)
--
-- Host: localhost    Database: psytech
-- ------------------------------------------------------
-- Server version	8.0.42-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `OTP`
--

DROP TABLE IF EXISTS `OTP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OTP` (
  `idOTP` int NOT NULL AUTO_INCREMENT,
  `idUsuario` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `codigo` int DEFAULT NULL,
  `validez` timestamp NULL DEFAULT NULL,
  `usado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idOTP`),
  KEY `idUsuario` (`idUsuario`),
  CONSTRAINT `OTP_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OTP`
--

LOCK TABLES `OTP` WRITE;
/*!40000 ALTER TABLE `OTP` DISABLE KEYS */;
INSERT INTO `OTP` VALUES (294,'8866e7d0-3e4f-11f0-8e65-020197ac33d8',433976,'2025-05-31 18:51:33',1),(295,'510a8324-3e4f-11f0-8e65-020197ac33d8',890418,'2025-06-01 15:29:35',1),(296,'5c9fb49a-3efd-11f0-8e65-020197ac33d8',749020,'2025-06-01 15:36:41',1),(297,'510a8324-3e4f-11f0-8e65-020197ac33d8',452057,'2025-06-01 15:45:50',1),(298,'510a8324-3e4f-11f0-8e65-020197ac33d8',729846,'2025-06-01 15:59:10',1),(299,'510a8324-3e4f-11f0-8e65-020197ac33d8',340109,'2025-06-02 15:14:41',1),(300,'5c9fb49a-3efd-11f0-8e65-020197ac33d8',934330,'2025-06-02 15:17:07',1);
/*!40000 ALTER TABLE `OTP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `areasotis`
--

DROP TABLE IF EXISTS `areasotis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `areasotis` (
  `idAreaOtis` int NOT NULL AUTO_INCREMENT,
  `nombreAreaOtis` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`idAreaOtis`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `areasotis`
--

LOCK TABLES `areasotis` WRITE;
/*!40000 ALTER TABLE `areasotis` DISABLE KEYS */;
INSERT INTO `areasotis` VALUES (1,'Comprensión Verbal'),(2,'Raciocinio'),(3,'Comprensión Espacial'),(4,'Fluidez Verbal'),(5,'Habilidad Numérica');
/*!40000 ALTER TABLE `areasotis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspirantes`
--

DROP TABLE IF EXISTS `aspirantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspirantes` (
  `idAspirante` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `idUsuario` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `institucionProcedencia` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `idPais` int DEFAULT NULL,
  `idEstado` int DEFAULT NULL,
  `cv` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `kardex` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`idAspirante`),
  KEY `idUsuario` (`idUsuario`),
  KEY `idPais` (`idPais`),
  KEY `idEstado` (`idEstado`),
  CONSTRAINT `aspirantes_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`),
  CONSTRAINT `aspirantes_ibfk_2` FOREIGN KEY (`idPais`) REFERENCES `paises` (`idPais`),
  CONSTRAINT `aspirantes_ibfk_3` FOREIGN KEY (`idEstado`) REFERENCES `estados` (`idEstado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspirantes`
--

LOCK TABLES `aspirantes` WRITE;
/*!40000 ALTER TABLE `aspirantes` DISABLE KEYS */;
INSERT INTO `aspirantes` VALUES ('5c9ff4bf-3efd-11f0-8e65-020197ac33d8','5c9fb49a-3efd-11f0-8e65-020197ac33d8','UAQ',15,21,'5c9ff4bf-3efd-11f0-8e65-020197ac33d8903HARTMAN GRAFICA FINAL.pdf','5c9ff4bf-3efd-11f0-8e65-020197ac33d8396Test de Terman Merril (cuestionario) 1.pdf');
/*!40000 ALTER TABLE `aspirantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspirantesgrupospruebas`
--

DROP TABLE IF EXISTS `aspirantesgrupospruebas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspirantesgrupospruebas` (
  `idGrupo` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `idPrueba` int NOT NULL,
  `idAspirante` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `idEstatus` int DEFAULT NULL,
  `fechaAsignacion` date DEFAULT NULL,
  `fechaLimite` date DEFAULT NULL,
  PRIMARY KEY (`idGrupo`,`idPrueba`,`idAspirante`),
  KEY `idPrueba` (`idPrueba`),
  KEY `idAspirante` (`idAspirante`),
  KEY `idEstatus` (`idEstatus`),
  CONSTRAINT `aspirantesgrupospruebas_ibfk_1` FOREIGN KEY (`idGrupo`) REFERENCES `grupos` (`idGrupo`),
  CONSTRAINT `aspirantesgrupospruebas_ibfk_2` FOREIGN KEY (`idPrueba`) REFERENCES `pruebas` (`idPrueba`),
  CONSTRAINT `aspirantesgrupospruebas_ibfk_3` FOREIGN KEY (`idAspirante`) REFERENCES `aspirantes` (`idAspirante`),
  CONSTRAINT `aspirantesgrupospruebas_ibfk_4` FOREIGN KEY (`idEstatus`) REFERENCES `estatusprueba` (`idEstatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspirantesgrupospruebas`
--

LOCK TABLES `aspirantesgrupospruebas` WRITE;
/*!40000 ALTER TABLE `aspirantesgrupospruebas` DISABLE KEYS */;
INSERT INTO `aspirantesgrupospruebas` VALUES ('41a85ff4-26fe-11f0-9737-020197ac33d8',3,'5c9ff4bf-3efd-11f0-8e65-020197ac33d8',4,'2025-06-01','2025-05-07'),('41a85ff4-26fe-11f0-9737-020197ac33d8',4,'5c9ff4bf-3efd-11f0-8e65-020197ac33d8',4,'2025-06-01','2025-05-07');
/*!40000 ALTER TABLE `aspirantesgrupospruebas` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insertaParametros` AFTER INSERT ON `aspirantesgrupospruebas` FOR EACH ROW BEGIN
    DECLARE v_idPrueba INT;

    
    SELECT agp.idPrueba INTO v_idPrueba
    FROM aspirantesgrupospruebas agp
    WHERE agp.idGrupo = NEW.idGrupo
      AND agp.idAspirante = NEW.idAspirante
    LIMIT 1;

    
    IF v_idPrueba = 2 THEN
        INSERT INTO parametros16pf(idAspirante, idGrupo)
        VALUES (NEW.idAspirante, NEW.idGrupo);
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `aspirantespreguntasformatoentrevista`
--

DROP TABLE IF EXISTS `aspirantespreguntasformatoentrevista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aspirantespreguntasformatoentrevista` (
  `idAspirante` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `idPreguntaFormatoEntrevista` int NOT NULL,
  `respuestaAspirante` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`idAspirante`,`idPreguntaFormatoEntrevista`),
  KEY `idPreguntaFormatoEntrevista` (`idPreguntaFormatoEntrevista`),
  CONSTRAINT `aspirantespreguntasformatoentrevista_ibfk_1` FOREIGN KEY (`idAspirante`) REFERENCES `aspirantes` (`idAspirante`),
  CONSTRAINT `aspirantespreguntasformatoentrevista_ibfk_2` FOREIGN KEY (`idPreguntaFormatoEntrevista`) REFERENCES `preguntasformatoentrevista` (`idPreguntaFormatoEntrevista`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspirantespreguntasformatoentrevista`
--

LOCK TABLES `aspirantespreguntasformatoentrevista` WRITE;
/*!40000 ALTER TABLE `aspirantespreguntasformatoentrevista` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspirantespreguntasformatoentrevista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calificacionesterman`
--

DROP TABLE IF EXISTS `calificacionesterman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calificacionesterman` (
  `idCalificacionTerman` int NOT NULL AUTO_INCREMENT,
  `idAspirante` varchar(36) COLLATE utf8mb4_spanish_ci NOT NULL,
  `idGrupo` varchar(36) COLLATE utf8mb4_spanish_ci NOT NULL,
  `puntosTotales` int NOT NULL,
  `rango` varchar(500) COLLATE utf8mb4_spanish_ci NOT NULL,
  `coeficienteIntelectual` int NOT NULL,
  PRIMARY KEY (`idCalificacionTerman`),
  KEY `idAspirante` (`idAspirante`),
  KEY `idGrupo` (`idGrupo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calificacionesterman`
--

LOCK TABLES `calificacionesterman` WRITE;
/*!40000 ALTER TABLE `calificacionesterman` DISABLE KEYS */;
/*!40000 ALTER TABLE `calificacionesterman` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colores`
--

DROP TABLE IF EXISTS `colores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `colores` (
  `idColor` int NOT NULL AUTO_INCREMENT,
  `nombreColor` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `numeroColor` int DEFAULT NULL,
  `significado` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `hexColor` varchar(7) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`idColor`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colores`
--

LOCK TABLES `colores` WRITE;
/*!40000 ALTER TABLE `colores` DISABLE KEYS */;
INSERT INTO `colores` VALUES (1,'Azul',1,'Paciencia','#0F4C81'),(2,'Verde',2,'Productividad','#317F43'),(3,'Rojo',3,'Agresividad','#D53032'),(4,'Amarillo',4,'Sociabilidad','#F2BE22'),(5,'Violeta',5,'Creatividad','#7D32D6'),(6,'Marrón',6,'Vigor','#6D3F2A'),(7,'Negro',7,'Satisfacción','#000000'),(8,'Gris',0,'Participación','#A6A6A6');
/*!40000 ALTER TABLE `colores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datospersonales`
--

DROP TABLE IF EXISTS `datospersonales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datospersonales` (
  `idDatosPersonales` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `idGrupo` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `idPrueba` int NOT NULL,
  `idAspirante` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `apellidoPaterno` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `apellidoMaterno` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `puestoSolicitado` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `idGenero` int DEFAULT NULL,
  PRIMARY KEY (`idDatosPersonales`),
  UNIQUE KEY `idGrupo` (`idGrupo`,`idPrueba`,`idAspirante`),
  KEY `idPrueba` (`idPrueba`),
  KEY `idAspirante` (`idAspirante`),
  CONSTRAINT `datospersonales_ibfk_1` FOREIGN KEY (`idGrupo`) REFERENCES `grupos` (`idGrupo`),
  CONSTRAINT `datospersonales_ibfk_2` FOREIGN KEY (`idPrueba`) REFERENCES `pruebas` (`idPrueba`),
  CONSTRAINT `datospersonales_ibfk_3` FOREIGN KEY (`idAspirante`) REFERENCES `aspirantes` (`idAspirante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datospersonales`
--

LOCK TABLES `datospersonales` WRITE;
/*!40000 ALTER TABLE `datospersonales` DISABLE KEYS */;
/*!40000 ALTER TABLE `datospersonales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadocivil`
--

DROP TABLE IF EXISTS `estadocivil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estadocivil` (
  `idEstadoCivil` int NOT NULL AUTO_INCREMENT,
  `nombreEstadoCivil` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`idEstadoCivil`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadocivil`
--

LOCK TABLES `estadocivil` WRITE;
/*!40000 ALTER TABLE `estadocivil` DISABLE KEYS */;
INSERT INTO `estadocivil` VALUES (1,'Soltero'),(2,'Casado'),(3,'Divorciado'),(4,'Unión libre'),(5,'Viudo');
/*!40000 ALTER TABLE `estadocivil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados`
--

DROP TABLE IF EXISTS `estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estados` (
  `idEstado` int NOT NULL AUTO_INCREMENT,
  `nombreEstado` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`idEstado`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados`
--

LOCK TABLES `estados` WRITE;
/*!40000 ALTER TABLE `estados` DISABLE KEYS */;
INSERT INTO `estados` VALUES (1,'Aguascalientes'),(2,'Baja California'),(3,'Baja California Sur'),(4,'Campeche'),(5,'Chiapas'),(6,'Chihuahua'),(7,'Coahuila'),(8,'Colima'),(9,'Durango'),(10,'Guanajuato'),(11,'Guerrero'),(12,'Hidalgo'),(13,'Jalisco'),(14,'Estado de México'),(15,'Michoacán'),(16,'Morelos'),(17,'Nayarit'),(18,'Nuevo León'),(19,'Oaxaca'),(20,'Puebla'),(21,'Querétaro'),(22,'Quintana Roo'),(23,'San Luis Potosí'),(24,'Sinaloa'),(25,'Sonora'),(26,'Tabasco'),(27,'Tamaulipas'),(28,'Tlaxcala'),(29,'Veracruz'),(30,'Yucatán'),(31,'Zacatecas'),(32,'Ciudad de México');
/*!40000 ALTER TABLE `estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estatusprueba`
--

DROP TABLE IF EXISTS `estatusprueba`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estatusprueba` (
  `idEstatus` int NOT NULL AUTO_INCREMENT,
  `nombreEstatus` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`idEstatus`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estatusprueba`
--

LOCK TABLES `estatusprueba` WRITE;
/*!40000 ALTER TABLE `estatusprueba` DISABLE KEYS */;
INSERT INTO `estatusprueba` VALUES (1,'Completada'),(2,'Pendiente'),(3,'En progreso'),(4,'Vencida');
/*!40000 ALTER TABLE `estatusprueba` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `familiares`
--

DROP TABLE IF EXISTS `familiares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `familiares` (
  `idFamiliar` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `idAspirante` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `rolFamiliar` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nombreFamiliar` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `edadFamiliar` int DEFAULT NULL,
  `idGenero` int DEFAULT NULL,
  `idEstadoCivil` int DEFAULT NULL,
  `estadoDeVida` tinyint(1) DEFAULT NULL,
  `hijoDePadre` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `hijoDeMadre` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`idFamiliar`),
  KEY `idGenero` (`idGenero`),
  KEY `idEstadoCivil` (`idEstadoCivil`),
  KEY `idAspirante` (`idAspirante`),
  KEY `hijoDePadre` (`hijoDePadre`),
  KEY `hijoDeMadre` (`hijoDeMadre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `familiares`
--

LOCK TABLES `familiares` WRITE;
/*!40000 ALTER TABLE `familiares` DISABLE KEYS */;
INSERT INTO `familiares` VALUES ('0a5e0a6f-2710-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','Hermana','Mariana Pacheco Hernandez',13,1,1,1,'9007d5df-270f-11f0-9737-020197ac33d8','e498ead6-270f-11f0-9737-020197ac33d8'),('20cb35eb-2710-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','Aspirante','Rommel Pacheco Hernández ',20,2,2,1,'9007d5df-270f-11f0-9737-020197ac33d8','e498ead6-270f-11f0-9737-020197ac33d8'),('2ff7ab22-2710-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','Pareja','Daniela Herrera Robles',21,1,2,1,'',''),('4717b693-2710-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','Hijo','Emilia Pachecho Herrera',1,1,1,1,'20cb35eb-2710-11f0-9737-020197ac33d8','2ff7ab22-2710-11f0-9737-020197ac33d8'),('562a4071-2710-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','Hijo','Mateo Pacheco Herrera',1,2,1,1,'20cb35eb-2710-11f0-9737-020197ac33d8','2ff7ab22-2710-11f0-9737-020197ac33d8'),('9007d5df-270f-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','Abuelo Paterno','Ernesto Pacheco López',98,2,2,1,'',''),('9dc993a8-270f-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','Abuela Paterna','Carmen Morales de Valdez',96,1,2,1,'',''),('ad97d4d5-270f-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','Abuelo Materno','Joaquín Hernandez Ortega',95,2,3,2,'',''),('b95d6405-270f-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','Abuela Materna','Teresa Ramos de Guillén ',96,1,5,1,'',''),('cbe68514-270f-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','Papá','Luis Ernesto Pacheco Morales',54,2,2,1,'9007d5df-270f-11f0-9737-020197ac33d8','9dc993a8-270f-11f0-9737-020197ac33d8'),('e498ead6-270f-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','Mamá','Mariana Hernández López',58,1,2,1,'ad97d4d5-270f-11f0-9737-020197ac33d8','b95d6405-270f-11f0-9737-020197ac33d8'),('f5d59aa9-270f-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','Hermano','Luis Ernesto Pacheco Hernandez',18,2,1,1,'cbe68514-270f-11f0-9737-020197ac33d8','e498ead6-270f-11f0-9737-020197ac33d8');
/*!40000 ALTER TABLE `familiares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `generos`
--

DROP TABLE IF EXISTS `generos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `generos` (
  `idGenero` int NOT NULL AUTO_INCREMENT,
  `nombreGenero` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`idGenero`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generos`
--

LOCK TABLES `generos` WRITE;
/*!40000 ALTER TABLE `generos` DISABLE KEYS */;
INSERT INTO `generos` VALUES (1,'Femenino'),(2,'Masculino');
/*!40000 ALTER TABLE `generos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupos`
--

DROP TABLE IF EXISTS `grupos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupos` (
  `idGrupo` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `nombreGrupo` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `estatusGrupo` tinyint(1) DEFAULT NULL,
  `cicloEscolar` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `anioGeneracion` int DEFAULT NULL,
  `carrera` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `idInstitucion` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `idNivelAcademico` int DEFAULT NULL,
  PRIMARY KEY (`idGrupo`),
  KEY `idInstitucion` (`idInstitucion`),
  KEY `idNivelAcademico` (`idNivelAcademico`),
  CONSTRAINT `grupos_ibfk_1` FOREIGN KEY (`idInstitucion`) REFERENCES `institucion` (`idInstitucion`),
  CONSTRAINT `grupos_ibfk_2` FOREIGN KEY (`idNivelAcademico`) REFERENCES `nivelacademico` (`idNivelAcademico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupos`
--

LOCK TABLES `grupos` WRITE;
/*!40000 ALTER TABLE `grupos` DISABLE KEYS */;
INSERT INTO `grupos` VALUES ('1dfd4480-31c5-11f0-8e65-020197ac33d8','Doctorado en QB',1,'Feb-Jun',2025,'Doctorado','1b63187c-26fe-11f0-9737-020197ac33d8',2),('30d3e49f-26fe-11f0-9737-020197ac33d8','Maestría en Ciencia y Tecnología de Alimentos',1,'Ago-Dic',2025,'MCTA','0c027b03-26fe-11f0-9737-020197ac33d8',1),('41a85ff4-26fe-11f0-9737-020197ac33d8','Doctorado en Ciencia de los Alimentos',1,'Febrero/Julio 2025',2025,'DCA','0c027b03-26fe-11f0-9737-020197ac33d8',2),('6151c448-26fe-11f0-9737-020197ac33d8','Maestría en Ciencias Químico Biológicas',1,'Ago-Dic',2025,'MCQB','0c027b03-26fe-11f0-9737-020197ac33d8',1),('8677199b-26fe-11f0-9737-020197ac33d8','Maestría en Electroquímica',0,'Febrero/Julio 2025',2025,'ME','11bf0846-26fe-11f0-9737-020197ac33d8',1),('8ace6af8-2702-11f0-9737-020197ac33d8','Ingeniería en Tecnologías Computacionales',1,'Agosto/Diciembre 2025',2025,'ITC','7c5c30b5-2702-11f0-9737-020197ac33d8',1),('937c87c7-26fe-11f0-9737-020197ac33d8','Doctorado en Electroquímica',1,'Ago-Dic',2025,'DE','11bf0846-26fe-11f0-9737-020197ac33d8',2),('ab9db500-26fe-11f0-9737-020197ac33d8','Ingeniería en Robótica y Sistemas Digitales',1,'Febrero/Julio 2025',2025,'IRS','1b63187c-26fe-11f0-9737-020197ac33d8',3);
/*!40000 ALTER TABLE `grupos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gruposaspirantes`
--

DROP TABLE IF EXISTS `gruposaspirantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gruposaspirantes` (
  `idGrupo` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `idAspirante` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`idGrupo`,`idAspirante`),
  KEY `idAspirante` (`idAspirante`),
  CONSTRAINT `gruposaspirantes_ibfk_1` FOREIGN KEY (`idGrupo`) REFERENCES `grupos` (`idGrupo`),
  CONSTRAINT `gruposaspirantes_ibfk_2` FOREIGN KEY (`idAspirante`) REFERENCES `aspirantes` (`idAspirante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gruposaspirantes`
--

LOCK TABLES `gruposaspirantes` WRITE;
/*!40000 ALTER TABLE `gruposaspirantes` DISABLE KEYS */;
INSERT INTO `gruposaspirantes` VALUES ('41a85ff4-26fe-11f0-9737-020197ac33d8','5c9ff4bf-3efd-11f0-8e65-020197ac33d8');
/*!40000 ALTER TABLE `gruposaspirantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupospruebas`
--

DROP TABLE IF EXISTS `grupospruebas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupospruebas` (
  `idGrupo` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `idPrueba` int NOT NULL,
  `fechaAsignacion` date DEFAULT NULL,
  `fechaLimite` date DEFAULT NULL,
  PRIMARY KEY (`idGrupo`,`idPrueba`),
  KEY `idPrueba` (`idPrueba`),
  CONSTRAINT `grupospruebas_ibfk_1` FOREIGN KEY (`idGrupo`) REFERENCES `grupos` (`idGrupo`),
  CONSTRAINT `grupospruebas_ibfk_2` FOREIGN KEY (`idPrueba`) REFERENCES `pruebas` (`idPrueba`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupospruebas`
--

LOCK TABLES `grupospruebas` WRITE;
/*!40000 ALTER TABLE `grupospruebas` DISABLE KEYS */;
INSERT INTO `grupospruebas` VALUES ('1dfd4480-31c5-11f0-8e65-020197ac33d8',1,'2025-05-15','2025-05-29'),('1dfd4480-31c5-11f0-8e65-020197ac33d8',2,'2025-05-15','2025-05-29'),('1dfd4480-31c5-11f0-8e65-020197ac33d8',3,'2025-05-15','2025-05-29'),('1dfd4480-31c5-11f0-8e65-020197ac33d8',4,'2025-05-15','2025-05-29'),('1dfd4480-31c5-11f0-8e65-020197ac33d8',5,'2025-05-15','2025-05-29'),('1dfd4480-31c5-11f0-8e65-020197ac33d8',6,'2025-05-15','2025-05-29'),('41a85ff4-26fe-11f0-9737-020197ac33d8',3,'2025-05-14','2025-05-07'),('41a85ff4-26fe-11f0-9737-020197ac33d8',4,'2025-05-14','2025-05-07'),('8677199b-26fe-11f0-9737-020197ac33d8',1,'2025-06-01','2025-05-25'),('8677199b-26fe-11f0-9737-020197ac33d8',2,'2025-06-01','2025-05-25'),('8677199b-26fe-11f0-9737-020197ac33d8',3,'2025-06-01','2025-05-25'),('8677199b-26fe-11f0-9737-020197ac33d8',5,'2025-06-01','2025-05-25'),('8677199b-26fe-11f0-9737-020197ac33d8',6,'2025-06-01','2025-05-25'),('8ace6af8-2702-11f0-9737-020197ac33d8',1,'2025-05-14','2025-05-19'),('8ace6af8-2702-11f0-9737-020197ac33d8',2,'2025-05-14','2025-05-19'),('8ace6af8-2702-11f0-9737-020197ac33d8',3,'2025-05-14','2025-05-19'),('8ace6af8-2702-11f0-9737-020197ac33d8',4,'2025-05-14','2025-05-19'),('8ace6af8-2702-11f0-9737-020197ac33d8',5,'2025-05-14','2025-05-19'),('8ace6af8-2702-11f0-9737-020197ac33d8',6,'2025-05-14','2025-05-19');
/*!40000 ALTER TABLE `grupospruebas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institucion`
--

DROP TABLE IF EXISTS `institucion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institucion` (
  `idInstitucion` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `nombreInstitucion` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `estatusInstitucion` tinyint(1) DEFAULT NULL,
  `idTipoInstitucion` int DEFAULT NULL,
  PRIMARY KEY (`idInstitucion`),
  KEY `idTipoInstitucion` (`idTipoInstitucion`),
  CONSTRAINT `institucion_ibfk_1` FOREIGN KEY (`idTipoInstitucion`) REFERENCES `tipoinstitucion` (`idTipoInstitucion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institucion`
--

LOCK TABLES `institucion` WRITE;
/*!40000 ALTER TABLE `institucion` DISABLE KEYS */;
INSERT INTO `institucion` VALUES ('0c027b03-26fe-11f0-9737-020197ac33d8','Universidad Autónoma de Querétaro',1,1),('11bf0846-26fe-11f0-9737-020197ac33d8','Cideteq',0,1),('1b63187c-26fe-11f0-9737-020197ac33d8','Anahuac',1,2),('7c5c30b5-2702-11f0-9737-020197ac33d8','Tec de Monterrey',1,2);
/*!40000 ALTER TABLE `institucion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interpretaciones16pf`
--

DROP TABLE IF EXISTS `interpretaciones16pf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interpretaciones16pf` (
  `parametro` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `nivel1` varchar(350) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `nivel2` varchar(350) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `nivel3` varchar(350) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interpretaciones16pf`
--

LOCK TABLES `interpretaciones16pf` WRITE;
/*!40000 ALTER TABLE `interpretaciones16pf` DISABLE KEYS */;
INSERT INTO `interpretaciones16pf` VALUES ('A','Muestra tendencia a ser una persona de tipo reservada y formal en su interacción social. Puede mostrar más preferencia por trabajar aislado de los demás que en un equipo de trabajo. En ocasiones puede ser crítica e inflexible.','Presenta nivel medio de sociabilidad. Aunque no manifiesta demasiado interés por la interacción social, puede desempeñarse en ella sin mayores dificultades.','Personalidad de tipo afectuosa, cálida y amable en sus relaciones interpersonales. Suele mostrar interés por el trabajo en equipo. Puede disfrutar empleos en los que se enfatiza la interacción social. Suele manifestar interés por los proyectos grupales.'),('B','Nivel de inteligencia bajo. Suele ser una persona de tipo lenta para aprender y asimilar situaciones. Se muestra inclinada a interpretaciones de tipo literales y concretas. Pensamiento concreto.','Presenta nivel de pensamiento medio. Aunque su puntaje no es alto, puede encontrarse en capacidad de analizar y resolver problemas en situaciones normales.','Muestra tendencia a ser una persona de rápida comprensión y asimilación de conceptos. Nivel de inteligencia superior y pensamiento de tipo abstracto.'),('C','Presenta dificultades en cuanto a la inestabilidad emocional. Tiende a presentar baja tolerancia a la frustración. Puede presentar dificultades en cuanto a la adaptación a situaciones nuevas. A menudo presenta carácter de tipo voluble.','Es una persona medianamente adaptada a su realidad psicosocial. Algunas situaciones estresantes podrían generarle dificultades de tipo emocional. Sin embargo, su mediano nivel de fortaleza de ego puede a veces ayudarle a sobrellevar la situación.','Persona que suele adaptarse adecuadamente al ambiente que la rodea. Suele ser realista y estable a nivel emocional. No presenta dificultades  en cuanto al afrontamiento de la realidad. Suele ser conocida como una persona madura y realista por las demás personas.'),('E','Muestra tendencia a ser una persona humilde, sumisa y dócil frente a los demás. Suele ser conformista y pasiva. A veces puede preferir dejarse llevar por lo que opine la mayoría. Puede mostrarse complasiva para evitar conflictos con las demás personas.','Presenta un mediano grado de control sobre los demás. No es una persona de tipo dominante en sus relaciones sociales. No muestra mucho interés por ocupar posiciones de mando sobre las demás personas.','Suele ser una persona de tipo dominante en sus relaciones interpersonales. Puede mostrar interés por la competencia. Prefiere situaciones de mando y poder sobre otros. Presenta tendencia a la asertividad. Suele ser una persona segura de sí misma.'),('F','Presenta características relacionadas con la introspección y la seriedad a nivel de comportamiento. Es una persona sobria y prudente.','A menudo no es descrita como una persona muy animada y activa en situaciones de grupo.','Tiende a ser una persona de tipo entusiasta, espontánea, expresiva y alegre en su interacción con el entorno. A menudo es considerada como una persona activa y dinámica. Puede presentar características relacionadas con el liderazgo.'),('G','Persona que difícilmente se comporta de acuerdo con las normas y reglas de una sociedad. Maneja una escala de valores distinta a la de la sociedad en que vive.','Persona con valores morales y normatividad medianamente adaptada a su forma de ver la vida. No es conocida como una persona normativa.','Persona muy normativa. Tiende a actuar siempre de acuerdo con las normas. Suele ser una persona muy responsable. Por lo general es conocida como de carácter exigente y organizada en sus actividades.'),('H','Presenta dificultad a nivel de habilidades sociales. Muestra tendencia a la timidez y al retraimiento. Puede mostrar dificultades para trabajar bajo presión. Prefiere limitarse a lo seguro y conocido para evitar posibles riesgos o complicaciones.','Presenta nivel mediano de sociabilidad. No suele ser conocida como una persona muy expresiva.','Persona que puede funcionar bajo altos niveles de estrés. A menudo le gusta correr riesgos. Puede tener tendencia a la asertividad. Normalmente son conocidas como personas emprendedoras.'),('I','Persona con pensamiento de tipo racional. Suele ser conocida como práctica y realista. En ocasiones puede ser independiente y escéptica. Tendencia a ser constante en sus tareas.','No es conocida por los demás como una persona de tipo sentimental y emotiva, ni tampoco como muy racional y práctica. Se encuentra en el medio de ambos polos.','Persona que funciona bajo el domino de sus sentimientos. Muestra tendencia a ser emotiva y de sensibilidad extrema. Suele ser descrita como una persona de tipo tierna y sensible. Personalidad de tipo idealista.'),('L','Persona confiada, amable y receptiva con el resto de la sociedad. Es muy dada a las labores sociales y humanitarias. A menudo se muestra comprensiva y abierta a las demás personas. Persona apta para el trabajo en equipo y las relaciones sociales.','Presenta identidad social medianamente adecuada. No suele ser conocida ni como una persona confiada ni desconfiada de las demás personas.','Muestra tendencia a ser una persona de tipo desconfiada y suspicaz con las demás personas. Puede presentar características de personalidad relacionadas con los celos y el escepticismo. Suele presentar dificultades en sus relaciones interpersonales.'),('M','A menudo es reconocida como una persona objetiva y poco emocional. Tendencia a ser de tipo práctica y centrada.','A menudo no es conocida como una persona de tipo idealista ni tampoco como una persona realista y objetiva. Se encuentra en el medio de ambos polos.','Normalmente suele ser reconocida como una persona de tipo creativa y de gran imaginación. A menudo es una persona proactiva y poco convencional.'),('N','Suele ser conocida como una persona abierta y sincera en sus relaciones sociales. Tendencia a la espontaneidad y a la autenticidad en el trato hacia las demás personas.','No suele ser descrita como una persona abierta a los demás, ni tampoco como de tipo territorial y distante. Se encuentra en el medio de ambos polos.','Suele ser una persona con alta territorialidad. Tendencia a ser analítica y calculadora en sus relaciones sociales. Es una persona fría, diplomática y táctica.'),('O','Presenta una autoestima bien desarrollada que la hace sentir segura y cómoda en sus relaciones interpersonales. No presenta autocrítica ni autoexigencia de tipo desadaptativa.','Presenta nivel de autoestima medianamente adecuado, lo que le permite interactuar a nivel social, aunque a veces puede presentar dificultades referentes a ésta situación.','Persona de tipo ansiosa y aprensiva. A menudo experimenta sentimientos de culpa originados por niveles de crítica de sí misma. Puede presentar dificultades a nivel de autoestima. Tendencia a la autoexigencia de tipo desadaptativa.'),('Q1','Persona con resistencia al cambio y preferencia por lo conocido y tradicional. Prefiere seguir normas tradicionales incluso aunque se encuentren en desuso.','No califica como persona con resistencia al cambio aunque tampoco se puede describir como abierta y dispuesta al cambio. Se encuentra en el medio de ambos polos.','Persona abierta y dispuesta al cambio. Tiende a ser muy liberal y a rechazar lo tradicional y convencional. Maneja un tipo de pensamiento libre y abierto a todas las posibilidades que se puedan presentar.'),('Q2','Persona de tipo dependiente del grupo. Puede carecer de autonomía decisional. A menudo consulta antes de tomar decisiones y en general puede necesitar el apoyo del grupo.','No es conocida como una persona de tipo autosuficiente, ni tampoco como dependiente de los demás. Se encuentra en el medio de ambos polos.','Persona de tipo autosuficiente que suele hacer sus tareas sin pedir ayuda de los demás. Puede disfrutar más de la soledad que de la compañía de otros. A menudo es conocida como persona con criterio propio y recursos internos para sortear dificultades.'),('Q3','Persona que suele privilegiar sus intereses por encima de los del grupo. Puede presentar dificultades para trabajar en equipo. No es una persona de tipo perfeccionista.','Presenta adaptación de tipo social en un nivel medio. Tiende a responder del mismo modo a los deseos internos como a los de las demás personas.','Persona con características de personalidad de tipo perfeccionista. Puede esforzarse por igualar su conducta a la imagen ideal. Tiende a controlar sus emociones y a mostrar una imagen impecable frente a los demás. Es cuidadosa en lo social.'),('Q4','Su comportamiento suele presentar ausencia de tensión nerviosa. A menudo es conocida como una persona de tipo relajada, tranquila y paciente. Puede mostrarse dispuesta a la colaboración en tareas.','Es una persona con nivel mediano de tensiones de tipo emocionales.','Persona con características de personalidad de tipo irritable y acelerada. Puede sufrir de altos niveles de estrés y ansiedad que le dificultan el normal desarrollo de sus relaciones interpersonales.'),('EX','Persona con características de personalidad relacionadas con la introversión. Puede presentar tendencia a la timidez y a la inhibición de su conducta social.','No es considerada como una persona extrovertida ni tampoco como introvertida. Se encuentra en el medio de ambos polos.','Persona con características de personalidad relacionadas con la extroversión. Puede presentar capacidad para crear y mantener contactos interpersonales. Suele ser desinhibida socialmente.'),('AX','Persona de tipo serena, realista y estable emocionalmente. Generalmente es una persona segura de sí misma. No presenta problemas de ansiedad.','Persona con mediano nivel de ansiedad. Sin embargo no le genera mayores dificultades para la interacción social.','Persona con dificultades a nivel de ansiedad. Tendencia a la inseguridad, tensión e inestabilidad de tipo emocional.'),('TM','Persona de tipo receptiva y abierta a los demás. Su nivel de sensibilidad emocional la hace aparecer ante los demás como una persona afectiva.','Persona con nivel mediano de sus emociones. Puede interactuar sin mayores problemas a nivel social.','Persona con tendencia a ser de tipo fría e inflexible en sus relaciones interpersonales. Prefiere manejar las distancias a nivel interpersonal, mostrándose reservada y a menudo desconfiada.'),('IN','Persona de tipo dependiente de los demás. Suele someterse a las exigencias y expectativas de otros por encima de las propias. Muestra tendencia a la humildad y la docilidad de comportamiento.','No califica como persona de tipo independiente, ni tampoco como dependiente de los demás. Se encuentra en el medio de ambos factores.','Persona con características de personalidad de tipo independiente de los demás. A menudo no demuestra interés o necesidad por ser aceptada socialmente. Suele ser autosuficiente y radical.'),('SC','Persona con bajo nivel de control de sus emociones e impulsos internos. Puede presentar dificultades a nivel interpersonal. Suele centrarse más en sus propios impulsos y necesidades.','Presenta nivel mediano de control de sus emociones. Sin embargo esta situación no le genera mayores dificultades a nivel interpersonal','Persona con adecuado nivel de control de sí misma. Puede mostrar facilidad para adaptarse a normas. Suele ser una persona muy controlada socialmente a nivel de sus emociones.');
/*!40000 ALTER TABLE `interpretaciones16pf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interpretacionkostick`
--

DROP TABLE IF EXISTS `interpretacionkostick`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interpretacionkostick` (
  `idIntergretacionKostick` int NOT NULL AUTO_INCREMENT,
  `dimensionComportamiento` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `factor` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `nivel` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `positivo` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `negativo` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  PRIMARY KEY (`idIntergretacionKostick`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interpretacionkostick`
--

LOCK TABLES `interpretacionkostick` WRITE;
/*!40000 ALTER TABLE `interpretacionkostick` DISABLE KEYS */;
INSERT INTO `interpretacionkostick` VALUES (1,'Grado de energía','N','Altos','La puntuación de N alta representa el fuerte deseo del examinado para terminar el trabajo. Es confiable porque tiene un fuerte compromiso de terminar el trabajo que empieza. Con frecuencia prefiere un trabajo a la vez que dejar u trabajo sin terminar ya que le produce insatisfacción.','Tiene la mente en una sola dirección. Tiene poca visión y tiende a ser obstindo en sus convicciones. Ya sea eficiente o no, tiene dificultad en deshacerse de lo que esta haciendo. El de puntuación alta (9), tiene el apremio de terminar lo que inicia y puede repasar las posibles salidas.'),(2,'Grado de energía','N','Bajos','Puede manejar muchos trabajos a la vez. Al delegar, no involucra la obtención de un ego de personalidad en la tarea.','Tiende a no terminar lo que empieza, tiene poco compromiso de la tarea encomendada. Posiblemente sea un buen “auxiliar de trabajo” y puede distraerse con facilidad.'),(3,'Grado de energía','G','Altos','se identifica con el trabajo arduo comúnmente aparece como un trabajador intenso y dedicado.','Es un trabajador arduo e intenso, una persona que desgraciadamente trabaja por ele hecho de trabajar. Puede estar más intrigado con los procesos de trabajo que con los resultados.'),(4,'Grado de energía','G','Bajos','Probablemente este motivado por encontrar métodos para ahorrar tiempo al hacer las cosas.','Lo último que quisiera hacer es identificarse con el trabajo arduo.'),(5,'Grado de energía','A','Altos','Es una persona ambiciosa, tiene iniciativa con gran necesidad de obtener logros. Fija estándares altos para sí mismo y para los demás, le gusta el trabajo con retos y tiene deseos de ser el mejor.','Tiende a estar descontento porque fija niveles de altura que nunca puede alcanzar. Puede irritara otras personas con sus expectaciones que usualmente no son altas. El supervisor puede encontrar dificultad para satisfacerlo. Desea reconocimientos, aumentos y promociones.'),(6,'Grado de energía','A','Bajos','Está contento y se distrae poco, a menos que el empujen demasiado fuerte. No siente impulso de avanzar.','No tiene iniciativa propia. Tiene poco empuje y avance. Se acomoda a ser el segundo mejor en términos de lo que realmente es capaz de hacer.'),(7,'Liderazgo','L','Altos','Tiene confianza, se apoya del liderazgo. Se tiene confianza que no compite con sus subordinados.','Le interesa más la imagen y el status dentro del grupo en donde interactúa. Con frecuencia es un individuo ostentoso con exceso de confianza.'),(8,'Liderazgo','L','Bajos','No es altamente competitivo. Puede estar contento de permanecer como trabajador y por lo tanto está hecho para un trabajo en el que no haya expectaciones por el liderazgo.','Tiene un complejo en función del liderazgo. No se ve a sí mismo como un líder. No es dominante.'),(9,'Liderazgo','P','Altos','Le gusta tomar responsabilidades. con frecuencia le gusta influenciar a todos y a ayudarlos. Les agrada la función de liderazgo.','Podemos sospechar que no confía en que alguien dirija el “show”. Es muy posesivo. Puede sabotear sutilmente esfuerzos acaparando la autoridad.'),(10,'Liderazgo','P','Bajos','No es del tipo que sabotea y controla los esfuersos del líder. Es tolerante.','No toma de buen grado la responsabilidad por otros y posiblemente ni aún por sí mismo.'),(11,'Liderazgo','I','Altos','Es oprtimista, agresivo, entusiasta, rápido en dar respuestas y presiona PATRA acelerar la toma de decisiones.','Es una persona impulsiva que puede convertirse en mentalmente sobreactivo y toma decisiones apresuradas. Con frecuencia se impacienta.'),(12,'Liderazgo','I','Bajos','Es muy precavido, sumamente serio.','Tiene problemas en la toma de decisiones, vacila demasiado.'),(13,'Modo de Vida','T','Altos','Trabaja aprisa y logra bastante. Está preparado internamente para la alta producción.','Tiene mucha visión interna y tiende a ser neurótico. Puede andar apresurado excesivamente. No pude lograr terminar su trabajo de forma eficiente.'),(14,'Modo de Vida','T','Bajos','Esta persona es tranquila, no está frustrada, sabe tomar las cosas como son y raras veces se apresura.','Poco le importa el tiempo y el ritmo de trabajo. Toma las cosas con mucha facilidad a un ritmo que resulta inconsistente.'),(15,'Modo de Vida','V','Altos','Tiene mucha energía para actividades físicas. Comúnmente es un individuo agradable, que tiene mucha fuerza física, probablemente trabaja con herramientas, tiene una actividad deportiva.','Puede tender a involucrarse exageradamente en actividades físicas, cuando debería estar concentrado en alguna cosa. Puede tener dificultad para permanecer sentado durante ocho horas al día.'),(16,'Modo de Vida','V','Bajos','Tiene capacidad para permanecer sentado.','Se no ha estado enfermo recientemente puede ser un neurótico cansado.'),(17,'Naturaleza Social','X','Altos','Tiene orgullo de sí mismo y de su estilo. Puede ser efectivo en grupos cuando no se muestre demasiado exhibicionista.','Es un exhibicionista. Hace las cosas para causar buena impresión, más que para ser efectivo.'),(18,'Naturaleza Social','X','Bajos','Puede tener una pequeña motivación a representar un papel y a no ser sincero. Es modesto.','Es tímido y no se vende a sí mismo.'),(19,'Naturaleza Social','S','Altos','Crea una buena atmósfera, buenas relaciones sociales, se interesa por los derechos de los demás y de sí mismo y establece buenas comunicaciones.','Puede estar preocupado por los aspectos sociales. Puede empelar bastante tiempo en las amenidades sociales en lugar de hacer un trabajo bien o resolver un conflicto.'),(20,'Naturaleza Social','S','Bajos','Es un ganador, un trabajador que dirige bien la energía.','A menudo no tiene tacto social. Es un introvertido y se siente torpe socialmente.'),(21,'Naturaleza Social','B','Altos','Esta bien consciente de las actividades del grupo. Tiene interés en cómo se siente el grupo y tiene un gusto natural por las personas.','Es dependiente del grupo. Puede ser demasiado sensitivo a las necesidades del mismo y cegarse a otras necesidades: como la de producción.'),(22,'Naturaleza Social','B','Bajos','Puede hacer frente a un grupo y pensar independientemente de él. La presión que el grupo ejerce no le convence con facilidad. Deben presentársele argumentos de peso.','Es básicamente un lobo solitario. No es sensitivo a las actividades y sentimientos del grupo.'),(23,'Naturaleza Social','O','Altos','Esta consciente de las necesidades de los demás y probablemente tiene conocimientos sutiles acerca de otros. Establece buenas relaciones muy cordiales y sinceras con las personas.','Puede se lastimado profundamente. Evalúa lo que le dicen en términos de sí es o no apreciado. Tiende a prejuciarse cuando juzga a otros porque vive en un mundo emocional controlado por relaciones interpersonales intensas.'),(24,'Naturaleza Social','O','Bajos','Es muy analítico en su manera de pensar. Tiende a ser imparcial.','Se resiste a intimar con las personas. Sería incompatible con puntuaciones altas en esta letra.'),(25,'Adaptación al trabajo','R','Altos','Es un planeador a largo plazo. Esta interesado en teoría y se refleja en su actividad.','Es un soñador. Puede involucrarse tanto en la teoría que puede no hacer mucho en las situaciones prácticas y concretas.'),(26,'Adaptación al trabajo','R','Bajos','Es una persona que hace las cosas más que un planeador teórico. Tiende a ser práctico.','Noe está interesado en la teoría. No puede planear suficiente y organizar las tareas.'),(27,'Adaptación al trabajo','D','Altos','Encuentra gusto en trabajar con detalles. Esta interesado y preocupado acerca de la exactitud de las cosas.','Puede perderse en el detalle y mal interpretar conceptos.'),(28,'Adaptación al trabajo','D','Bajos','Puede ser un delegador y diferenciar detalles importantes.','No disfruta los detalles y por lo tanto puede tratar de evitarlos.'),(29,'Adaptación al trabajo','C','Altos','Es una persona que estructura las cosas y es agradable estar con ella porque es pulcra, ordenada y cuidadosa.','Tiende a ser muy terco y rígido. Puede ser tan ordenado que llega al grado de interferir con eficiencia.'),(30,'Adaptación al trabajo','C','Bajos','Tolera la confusión. Es flexible en su manera de pensar.','No se preocupa demasiado en cuanto al orden y el sistema.'),(31,'Naturaleza Emocional','Z','Altos','Es abierto a nuevas ideas y entusiasta acerca del cambio.','No tiene descanso interno y se aburre fácilmente. Puede no permanecer en una función el tiempo suficiente como para su valor real.'),(32,'Naturaleza Emocional','Z','Bajos','Se puede adaptar a la rutina fácilmente sin aburrirse.','Es el tipo de “vara en el lodo” y ofrece resistencia al cambio.'),(33,'Naturaleza Emocional','E','Altos','Es confiable, constante, calmado y tiene control emocional y madurez. Probablemente es maneja bien en situaciones emocionales.','Es tan calmado y controlado que puede parecer como emocionalmente pasivo, aburrido y sin influencia.'),(34,'Naturaleza Emocional','E','Bajos','Es dramático y aporta mucha energía cuando trabaja. Se siente emocionalmente involucrado en su trabajo.','Tiene poca restricción emocional. Cambia de estados de ánimo fácilmente. Cambia su actitud con su estado de ánimo.'),(35,'Naturaleza Emocional','K','Altos','Tiende a ser abierto y franco con las personas. Tiende a desmenuzar el conflicto más que a ignorarlo o evitarlo.','Se ofende con facilidad. Tiene una “basura en el hombro” y es fácil de malinterpretar negativamente lo que se le dice.'),(36,'Naturaleza Emocional','K','Bajos','Puede ver las cosas desde una posición elevada y objetiva y no le gusta lastimar a nadie.','Es un introvertido emocionalmente que trata de embotellar sus sentimientos y tiene problema para enfrentarse a los conflictos.'),(37,'Subordinación','F','Altos','Es un hombre bueno, leal, de compañía. Es sensible a cómo se siente la gente y tiene buenos conocimientos en cuanto a lo que se dice y se siente.','No está preocupado en cuanto a agradar a su jefe. Raras veces toma la posición de estar fuertemente en contra de una posición.'),(38,'Subordinación','F','Bajos','No necesita ningún empuje de su jefe. Es motivado por el trabajo, no por la “palmada en la espalda” de su jefe.','Tiende a ser rebelde, está pronto a retar a la autoridad y bajarla de pedestal.'),(39,'Subordinación','W','Altos','Es una persona que tiene gran respeto por las reglas. Puede seguir lo que se le indica sin distorsionarlo.','No le agradan las reglas o tiene conflicto con ellas. No es autónomo.'),(40,'Subordinación','W','Bajos','Es autónomo. Esta dirigido hacia las metas mas que orientado al trabajo. Quiere saber qué debe hacerse, no cómo debe hacerse.','Tiene dificultad en seguir las reglas exactamente en la forma en que están establecidas. Le gusta ir y venir a su antojo.');
/*!40000 ALTER TABLE `interpretacionkostick` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nivelacademico`
--

DROP TABLE IF EXISTS `nivelacademico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nivelacademico` (
  `idNivelAcademico` int NOT NULL AUTO_INCREMENT,
  `nombreNivelAcademico` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`idNivelAcademico`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nivelacademico`
--

LOCK TABLES `nivelacademico` WRITE;
/*!40000 ALTER TABLE `nivelacademico` DISABLE KEYS */;
INSERT INTO `nivelacademico` VALUES (1,'Maestría'),(2,'Doctorado'),(3,'Licenciatura');
/*!40000 ALTER TABLE `nivelacademico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opciones16pf`
--

DROP TABLE IF EXISTS `opciones16pf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opciones16pf` (
  `idOpcion16PF` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `idPregunta16PF` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `opcion16PF` varchar(1) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `descripcionOpcion16PF` varchar(250) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `valor16PF` int DEFAULT NULL,
  PRIMARY KEY (`idOpcion16PF`),
  KEY `idPregunta16PF` (`idPregunta16PF`),
  CONSTRAINT `opciones16pf_ibfk_1` FOREIGN KEY (`idPregunta16PF`) REFERENCES `preguntas16pf` (`idPregunta16PF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opciones16pf`
--

LOCK TABLES `opciones16pf` WRITE;
/*!40000 ALTER TABLE `opciones16pf` DISABLE KEYS */;
INSERT INTO `opciones16pf` VALUES ('6129d859-2089-11f0-a293-a0294223b12a','5f510808-2089-11f0-a293-a0294223b12a','A','Las máquinas o llevar registros',2),('612a49fd-2089-11f0-a293-a0294223b12a','5f510808-2089-11f0-a293-a0294223b12a','B','?',1),('612a6893-2089-11f0-a293-a0294223b12a','5f510808-2089-11f0-a293-a0294223b12a','C','Entrevistar y hablar con personas',0),('612a7938-2089-11f0-a293-a0294223b12a','5f522dbf-2089-11f0-a293-a0294223b12a','A','Verdadero',2),('612a94dd-2089-11f0-a293-a0294223b12a','5f522dbf-2089-11f0-a293-a0294223b12a','B','?',1),('612aad1a-2089-11f0-a293-a0294223b12a','5f522dbf-2089-11f0-a293-a0294223b12a','C','Falso',0),('612abf65-2089-11f0-a293-a0294223b12a','5f5232a6-2089-11f0-a293-a0294223b12a','A','Se lo señalo',0),('612acfc3-2089-11f0-a293-a0294223b12a','5f5232a6-2089-11f0-a293-a0294223b12a','B','?',1),('612adc8c-2089-11f0-a293-a0294223b12a','5f5232a6-2089-11f0-a293-a0294223b12a','C','Lo paso por alto',2),('612af43d-2089-11f0-a293-a0294223b12a','5f523483-2089-11f0-a293-a0294223b12a','A','Verdadero',2),('612b0bc2-2089-11f0-a293-a0294223b12a','5f523483-2089-11f0-a293-a0294223b12a','B','?',1),('612b25e2-2089-11f0-a293-a0294223b12a','5f523483-2089-11f0-a293-a0294223b12a','C','Falso',0),('612b3dcf-2089-11f0-a293-a0294223b12a','5f52361f-2089-11f0-a293-a0294223b12a','A','Verdadero',2),('612b555c-2089-11f0-a293-a0294223b12a','5f52361f-2089-11f0-a293-a0294223b12a','B','?',1),('612b69cd-2089-11f0-a293-a0294223b12a','5f52361f-2089-11f0-a293-a0294223b12a','C','Falso',0),('612b83a1-2089-11f0-a293-a0294223b12a','5f5236c0-2089-11f0-a293-a0294223b12a','A','Verdadero',0),('612b9b6a-2089-11f0-a293-a0294223b12a','5f5236c0-2089-11f0-a293-a0294223b12a','B','?',1),('612ba347-2089-11f0-a293-a0294223b12a','5f5236c0-2089-11f0-a293-a0294223b12a','C','Falso',2),('612bbce8-2089-11f0-a293-a0294223b12a','5f523807-2089-11f0-a293-a0294223b12a','A','Una persona con capacidad de tipo medio, pero con una moral estricta',2),('612bd51d-2089-11f0-a293-a0294223b12a','5f523807-2089-11f0-a293-a0294223b12a','B','?',1),('612beb60-2089-11f0-a293-a0294223b12a','5f523807-2089-11f0-a293-a0294223b12a','C','Una persona con talento, aunque a veces no sea responsable',0),('612bf60f-2089-11f0-a293-a0294223b12a','5f523973-2089-11f0-a293-a0294223b12a','A','Ingeniero de la construcción',2),('612c0fe1-2089-11f0-a293-a0294223b12a','5f523973-2089-11f0-a293-a0294223b12a','B','?',1),('612c27b2-2089-11f0-a293-a0294223b12a','5f523973-2089-11f0-a293-a0294223b12a','C','Escritor de teatro',0),('612c3f9b-2089-11f0-a293-a0294223b12a','5f523ae0-2089-11f0-a293-a0294223b12a','A','Verdadero',2),('612c578d-2089-11f0-a293-a0294223b12a','5f523ae0-2089-11f0-a293-a0294223b12a','B','?',1),('612c7168-2089-11f0-a293-a0294223b12a','5f523ae0-2089-11f0-a293-a0294223b12a','C','Falso',0),('612c77ec-2089-11f0-a293-a0294223b12a','5f523c52-2089-11f0-a293-a0294223b12a','A','Verdadero',0),('612c879d-2089-11f0-a293-a0294223b12a','5f523c52-2089-11f0-a293-a0294223b12a','B','?',1),('612c9f7f-2089-11f0-a293-a0294223b12a','5f523c52-2089-11f0-a293-a0294223b12a','C','Falso',2),('612cb98a-2089-11f0-a293-a0294223b12a','5f523dc7-2089-11f0-a293-a0294223b12a','A','Sí',2),('612cc29b-2089-11f0-a293-a0294223b12a','5f523dc7-2089-11f0-a293-a0294223b12a','B','?',1),('612cc9c9-2089-11f0-a293-a0294223b12a','5f523dc7-2089-11f0-a293-a0294223b12a','C','No',0),('612ce1a6-2089-11f0-a293-a0294223b12a','5f523f42-2089-11f0-a293-a0294223b12a','A','Verdadero',2),('612cfbfa-2089-11f0-a293-a0294223b12a','5f523f42-2089-11f0-a293-a0294223b12a','B','?',1),('612d0452-2089-11f0-a293-a0294223b12a','5f523f42-2089-11f0-a293-a0294223b12a','C','Falso',0),('612d08d0-2089-11f0-a293-a0294223b12a','5f5240be-2089-11f0-a293-a0294223b12a','A','Verdadero',2),('612d0f27-2089-11f0-a293-a0294223b12a','5f5240be-2089-11f0-a293-a0294223b12a','B','?',1),('612d2283-2089-11f0-a293-a0294223b12a','5f5240be-2089-11f0-a293-a0294223b12a','C','Falso',0),('612d2cd0-2089-11f0-a293-a0294223b12a','5f524229-2089-11f0-a293-a0294223b12a','A','Verdadero',0),('612d3908-2089-11f0-a293-a0294223b12a','5f524229-2089-11f0-a293-a0294223b12a','B','?',1),('612d4713-2089-11f0-a293-a0294223b12a','5f524229-2089-11f0-a293-a0294223b12a','C','Falso',2),('612d5304-2089-11f0-a293-a0294223b12a','5f52445c-2089-11f0-a293-a0294223b12a','A','Con facilidad cuando las personas parecen estar interesadas',0),('612d5777-2089-11f0-a293-a0294223b12a','5f52445c-2089-11f0-a293-a0294223b12a','B','?',1),('612d5c7c-2089-11f0-a293-a0294223b12a','5f52445c-2089-11f0-a293-a0294223b12a','C','Solo si no tengo más remedio',2),('612d6208-2089-11f0-a293-a0294223b12a','5f5245ba-2089-11f0-a293-a0294223b12a','A','Algunas veces.',2),('612d6a0a-2089-11f0-a293-a0294223b12a','5f5245ba-2089-11f0-a293-a0294223b12a','B','?',1),('612d6f84-2089-11f0-a293-a0294223b12a','5f5245ba-2089-11f0-a293-a0294223b12a','C','Nunca',0),('612d9726-2089-11f0-a293-a0294223b12a','5f5246c2-2089-11f0-a293-a0294223b12a','A','Casi nunca',0),('612db0b7-2089-11f0-a293-a0294223b12a','5f5246c2-2089-11f0-a293-a0294223b12a','B','?',1),('612dc8b8-2089-11f0-a293-a0294223b12a','5f5246c2-2089-11f0-a293-a0294223b12a','C','A menudo',2),('612def72-2089-11f0-a293-a0294223b12a','5f5247bf-2089-11f0-a293-a0294223b12a','A','Comentar mis problemas con los amigos',2),('612dfd05-2089-11f0-a293-a0294223b12a','5f5247bf-2089-11f0-a293-a0294223b12a','B','?',1),('612e0694-2089-11f0-a293-a0294223b12a','5f5247bf-2089-11f0-a293-a0294223b12a','C','Guardarlos para mis adentros',0),('612e0f5a-2089-11f0-a293-a0294223b12a','5f5248bc-2089-11f0-a293-a0294223b12a','A','Casi nunca',2),('612e21e1-2089-11f0-a293-a0294223b12a','5f5248bc-2089-11f0-a293-a0294223b12a','B','?',1),('612e4127-2089-11f0-a293-a0294223b12a','5f5248bc-2089-11f0-a293-a0294223b12a','C','A menudo',0),('612e4521-2089-11f0-a293-a0294223b12a','5f524a07-2089-11f0-a293-a0294223b12a','A','Sí',2),('612e4d2a-2089-11f0-a293-a0294223b12a','5f524a07-2089-11f0-a293-a0294223b12a','B','?',1),('612e55b5-2089-11f0-a293-a0294223b12a','5f524a07-2089-11f0-a293-a0294223b12a','C','No',0),('612e5a57-2089-11f0-a293-a0294223b12a','5f524b8e-2089-11f0-a293-a0294223b12a','A','No me perturba',2),('612e60bf-2089-11f0-a293-a0294223b12a','5f524b8e-2089-11f0-a293-a0294223b12a','B','?',1),('612e71cc-2089-11f0-a293-a0294223b12a','5f524b8e-2089-11f0-a293-a0294223b12a','C','Normalmente me hace daño',0),('612e89df-2089-11f0-a293-a0294223b12a','5f524c96-2089-11f0-a293-a0294223b12a','A','Discutir el significado de nuestras diferencias básicas',2),('612e9874-2089-11f0-a293-a0294223b12a','5f524c96-2089-11f0-a293-a0294223b12a','B','?',1),('612e9f6c-2089-11f0-a293-a0294223b12a','5f524c96-2089-11f0-a293-a0294223b12a','C','Cambiar el tema',0),('612ea2eb-2089-11f0-a293-a0294223b12a','5f524d9b-2089-11f0-a293-a0294223b12a','A','Verdadero',0),('612ea63e-2089-11f0-a293-a0294223b12a','5f524d9b-2089-11f0-a293-a0294223b12a','B','?',1),('612ea986-2089-11f0-a293-a0294223b12a','5f524d9b-2089-11f0-a293-a0294223b12a','C','Falso',2),('612eacd4-2089-11f0-a293-a0294223b12a','5f524e93-2089-11f0-a293-a0294223b12a','A','Verdadero, para evitar problemas',0),('612eb01e-2089-11f0-a293-a0294223b12a','5f524e93-2089-11f0-a293-a0294223b12a','B','?',1),('612eb831-2089-11f0-a293-a0294223b12a','5f524e93-2089-11f0-a293-a0294223b12a','C','Falso, porque podría hacer algo más interesante',2),('612ec194-2089-11f0-a293-a0294223b12a','5f524fac-2089-11f0-a293-a0294223b12a','A','Con otros',2),('612ecae0-2089-11f0-a293-a0294223b12a','5f524fac-2089-11f0-a293-a0294223b12a','B','?',1),('612ed48a-2089-11f0-a293-a0294223b12a','5f524fac-2089-11f0-a293-a0294223b12a','C','Yo solo',0),('612edea4-2089-11f0-a293-a0294223b12a','5f5250a2-2089-11f0-a293-a0294223b12a','A','Raras veces',0),('612ee7e5-2089-11f0-a293-a0294223b12a','5f5250a2-2089-11f0-a293-a0294223b12a','B','?',1),('612ef133-2089-11f0-a293-a0294223b12a','5f5250a2-2089-11f0-a293-a0294223b12a','C','A menudo',2),('612f0abe-2089-11f0-a293-a0294223b12a','5f5251b4-2089-11f0-a293-a0294223b12a','A','Verdadero',2),('612f243d-2089-11f0-a293-a0294223b12a','5f5251b4-2089-11f0-a293-a0294223b12a','B','?',1),('612f3dba-2089-11f0-a293-a0294223b12a','5f5251b4-2089-11f0-a293-a0294223b12a','C','Falso',0),('612f5970-2089-11f0-a293-a0294223b12a','5f5252d0-2089-11f0-a293-a0294223b12a','A','Verdadero',2),('612f72c1-2089-11f0-a293-a0294223b12a','5f5252d0-2089-11f0-a293-a0294223b12a','B','?',1),('612f8c3f-2089-11f0-a293-a0294223b12a','5f5252d0-2089-11f0-a293-a0294223b12a','C','Falso',0),('612fa7df-2089-11f0-a293-a0294223b12a','5f5253df-2089-11f0-a293-a0294223b12a','A','Verdadero',2),('612fc119-2089-11f0-a293-a0294223b12a','5f5253df-2089-11f0-a293-a0294223b12a','B','?',1),('612fda92-2089-11f0-a293-a0294223b12a','5f5253df-2089-11f0-a293-a0294223b12a','C','Falso',0),('612ff636-2089-11f0-a293-a0294223b12a','5f5254e7-2089-11f0-a293-a0294223b12a','A','Eso me molestaría e irritaría',2),('61300f9e-2089-11f0-a293-a0294223b12a','5f5254e7-2089-11f0-a293-a0294223b12a','B','?',1),('61302926-2089-11f0-a293-a0294223b12a','5f5254e7-2089-11f0-a293-a0294223b12a','C','Me parecería bien y estaría contento de cambiarlos',0),('61305159-2089-11f0-a293-a0294223b12a','5f5255f7-2089-11f0-a293-a0294223b12a','A','Estar en una oficina, organizado y atendiendo a personas',2),('61306adc-2089-11f0-a293-a0294223b12a','5f5255f7-2089-11f0-a293-a0294223b12a','B','?',1),('613084ad-2089-11f0-a293-a0294223b12a','5f5255f7-2089-11f0-a293-a0294223b12a','C','Ser arquitecto dibujar planos en un despacho tranquilo',0),('6130a2e2-2089-11f0-a293-a0294223b12a','5f5256f9-2089-11f0-a293-a0294223b12a','A','Me siento como si no pudiera dormir',2),('6130ad4e-2089-11f0-a293-a0294223b12a','5f5256f9-2089-11f0-a293-a0294223b12a','B','?',1),('6130ba5b-2089-11f0-a293-a0294223b12a','5f5256f9-2089-11f0-a293-a0294223b12a','C','Continúo de un modo normal',0),('6130c1db-2089-11f0-a293-a0294223b12a','5f525805-2089-11f0-a293-a0294223b12a','A','Verdadero',0),('6130c887-2089-11f0-a293-a0294223b12a','5f525805-2089-11f0-a293-a0294223b12a','B','?',1),('6130d486-2089-11f0-a293-a0294223b12a','5f525805-2089-11f0-a293-a0294223b12a','C','Falso',2),('6130e07e-2089-11f0-a293-a0294223b12a','5f525a4a-2089-11f0-a293-a0294223b12a','A','Verdadero',2),('6130eb02-2089-11f0-a293-a0294223b12a','5f525a4a-2089-11f0-a293-a0294223b12a','B','?',1),('6130f540-2089-11f0-a293-a0294223b12a','5f525a4a-2089-11f0-a293-a0294223b12a','C','Falso',0),('6130ff6c-2089-11f0-a293-a0294223b12a','5f525bed-2089-11f0-a293-a0294223b12a','A','Verdadero',0),('6131099d-2089-11f0-a293-a0294223b12a','5f525bed-2089-11f0-a293-a0294223b12a','B','?',1),('61311412-2089-11f0-a293-a0294223b12a','5f525bed-2089-11f0-a293-a0294223b12a','C','Falso',2),('61311e45-2089-11f0-a293-a0294223b12a','5f525d7e-2089-11f0-a293-a0294223b12a','A','Verdadero',0),('61312acb-2089-11f0-a293-a0294223b12a','5f525d7e-2089-11f0-a293-a0294223b12a','B','?',1),('61314185-2089-11f0-a293-a0294223b12a','5f525d7e-2089-11f0-a293-a0294223b12a','C','Falso',2),('613157d7-2089-11f0-a293-a0294223b12a','5f525f04-2089-11f0-a293-a0294223b12a','A','Haciendo con tranquilidad y sosiego algo por lo que tenga afición',0),('61316e16-2089-11f0-a293-a0294223b12a','5f525f04-2089-11f0-a293-a0294223b12a','B','?',1),('61318633-2089-11f0-a293-a0294223b12a','5f525f04-2089-11f0-a293-a0294223b12a','C','En una fiesta animada',2),('61319cac-2089-11f0-a293-a0294223b12a','5f52607b-2089-11f0-a293-a0294223b12a','A','Sí',2),('6131b2ee-2089-11f0-a293-a0294223b12a','5f52607b-2089-11f0-a293-a0294223b12a','B','?',1),('6131cb0f-2089-11f0-a293-a0294223b12a','5f52607b-2089-11f0-a293-a0294223b12a','C','No',0),('6131ef8b-2089-11f0-a293-a0294223b12a','5f5261ea-2089-11f0-a293-a0294223b12a','A','Verdadero',2),('6131f5c3-2089-11f0-a293-a0294223b12a','5f5261ea-2089-11f0-a293-a0294223b12a','B','?',1),('6131ff25-2089-11f0-a293-a0294223b12a','5f5261ea-2089-11f0-a293-a0294223b12a','C','Falso',0),('6132095e-2089-11f0-a293-a0294223b12a','5f526370-2089-11f0-a293-a0294223b12a','A','Verdadero',0),('6132168c-2089-11f0-a293-a0294223b12a','5f526370-2089-11f0-a293-a0294223b12a','B','?',1),('613220e8-2089-11f0-a293-a0294223b12a','5f526370-2089-11f0-a293-a0294223b12a','C','Falso',2),('61322f42-2089-11f0-a293-a0294223b12a','5f5264da-2089-11f0-a293-a0294223b12a','A','Verdadero',2),('61323974-2089-11f0-a293-a0294223b12a','5f5264da-2089-11f0-a293-a0294223b12a','B','?',1),('61324893-2089-11f0-a293-a0294223b12a','5f5264da-2089-11f0-a293-a0294223b12a','C','Falso',0),('613258ce-2089-11f0-a293-a0294223b12a','5f52663b-2089-11f0-a293-a0294223b12a','A','La esgrima o la danza',0),('61326957-2089-11f0-a293-a0294223b12a','5f52663b-2089-11f0-a293-a0294223b12a','B','?',1),('613279ca-2089-11f0-a293-a0294223b12a','5f52663b-2089-11f0-a293-a0294223b12a','C','El tenis o la lucha libre',2),('61328896-2089-11f0-a293-a0294223b12a','5f52679d-2089-11f0-a293-a0294223b12a','A','Verdadero',2),('6132d0a5-2089-11f0-a293-a0294223b12a','5f52679d-2089-11f0-a293-a0294223b12a','B','?',1),('6133099a-2089-11f0-a293-a0294223b12a','5f52679d-2089-11f0-a293-a0294223b12a','C','Falso',0),('61332f7c-2089-11f0-a293-a0294223b12a','5f526904-2089-11f0-a293-a0294223b12a','A','Verdadero',2),('61333e53-2089-11f0-a293-a0294223b12a','5f526904-2089-11f0-a293-a0294223b12a','B','?',1),('61334a30-2089-11f0-a293-a0294223b12a','5f526904-2089-11f0-a293-a0294223b12a','C','Falso',0),('6133546c-2089-11f0-a293-a0294223b12a','5f526a6c-2089-11f0-a293-a0294223b12a','A','Casi nunca',0),('61335d24-2089-11f0-a293-a0294223b12a','5f526a6c-2089-11f0-a293-a0294223b12a','B','?',1),('61336699-2089-11f0-a293-a0294223b12a','5f526a6c-2089-11f0-a293-a0294223b12a','C','A menudo',2),('61337188-2089-11f0-a293-a0294223b12a','5f526bd0-2089-11f0-a293-a0294223b12a','A','Siempre están haciendo cosas prácticas que necesitan ser hechas',0),('61337f28-2089-11f0-a293-a0294223b12a','5f526bd0-2089-11f0-a293-a0294223b12a','B','?',1),('61338ce9-2089-11f0-a293-a0294223b12a','5f526bd0-2089-11f0-a293-a0294223b12a','C','Imaginan o piensan acerca de cosas sobre sí mismas',2),('613408d5-2089-11f0-a293-a0294223b12a','5f526d31-2089-11f0-a293-a0294223b12a','A','Verdadero',2),('61341407-2089-11f0-a293-a0294223b12a','5f526d31-2089-11f0-a293-a0294223b12a','B','?',1),('61341d2c-2089-11f0-a293-a0294223b12a','5f526d31-2089-11f0-a293-a0294223b12a','C','Falso',0),('6134260f-2089-11f0-a293-a0294223b12a','5f527025-2089-11f0-a293-a0294223b12a','A','Verdadero',2),('61342ed2-2089-11f0-a293-a0294223b12a','5f527025-2089-11f0-a293-a0294223b12a','B','?',1),('61343792-2089-11f0-a293-a0294223b12a','5f527025-2089-11f0-a293-a0294223b12a','C','Falso',0),('6134405f-2089-11f0-a293-a0294223b12a','5f5271b6-2089-11f0-a293-a0294223b12a','A','Verdadero',2),('61344aa2-2089-11f0-a293-a0294223b12a','5f5271b6-2089-11f0-a293-a0294223b12a','B','?',1),('61345362-2089-11f0-a293-a0294223b12a','5f5271b6-2089-11f0-a293-a0294223b12a','C','Falso',0),('61345c1b-2089-11f0-a293-a0294223b12a','5f527316-2089-11f0-a293-a0294223b12a','A','Verdadero',0),('61346f7f-2089-11f0-a293-a0294223b12a','5f527316-2089-11f0-a293-a0294223b12a','B','?',1),('61348755-2089-11f0-a293-a0294223b12a','5f527316-2089-11f0-a293-a0294223b12a','C','Falso',2),('6134a15d-2089-11f0-a293-a0294223b12a','5f527489-2089-11f0-a293-a0294223b12a','A','Normalmente verdadero',0),('6134b94d-2089-11f0-a293-a0294223b12a','5f527489-2089-11f0-a293-a0294223b12a','B','?',1),('6134d140-2089-11f0-a293-a0294223b12a','5f527489-2089-11f0-a293-a0294223b12a','C','Normalmente falso',2),('6134eb1f-2089-11f0-a293-a0294223b12a','5f527610-2089-11f0-a293-a0294223b12a','A','Verdadero, normalmente no me gustan',2),('61350301-2089-11f0-a293-a0294223b12a','5f527610-2089-11f0-a293-a0294223b12a','B','?',1),('61351b11-2089-11f0-a293-a0294223b12a','5f527610-2089-11f0-a293-a0294223b12a','C','Falso, normalmente las encuentro interesantes',0),('613534e4-2089-11f0-a293-a0294223b12a','5f52779a-2089-11f0-a293-a0294223b12a','A','Buscar un significado personal a la vida',0),('61354cff-2089-11f0-a293-a0294223b12a','5f52779a-2089-11f0-a293-a0294223b12a','B','?',1),('61356525-2089-11f0-a293-a0294223b12a','5f52779a-2089-11f0-a293-a0294223b12a','C','Asegurarme un trabajo con un buen sueldo',2),('61357d02-2089-11f0-a293-a0294223b12a','5f527927-2089-11f0-a293-a0294223b12a','A','Verdadero',0),('61359045-2089-11f0-a293-a0294223b12a','5f527927-2089-11f0-a293-a0294223b12a','B','?',1),('6135991f-2089-11f0-a293-a0294223b12a','5f527927-2089-11f0-a293-a0294223b12a','C','Falso',2),('6135a1f5-2089-11f0-a293-a0294223b12a','5f527ac6-2089-11f0-a293-a0294223b12a','A','Más ciudadanos íntegros y constantes',2),('6135aaa8-2089-11f0-a293-a0294223b12a','5f527ac6-2089-11f0-a293-a0294223b12a','B','?',1),('6135b3af-2089-11f0-a293-a0294223b12a','5f527ac6-2089-11f0-a293-a0294223b12a','C','Más reformadores con opiniones sobre cómo mejorar el mundo',0),('6135bc7c-2089-11f0-a293-a0294223b12a','5f527c51-2089-11f0-a293-a0294223b12a','A','Se forman equipos o se tiene un compañero',0),('6135c8b5-2089-11f0-a293-a0294223b12a','5f527c51-2089-11f0-a293-a0294223b12a','B','?',1),('6135e316-2089-11f0-a293-a0294223b12a','5f527c51-2089-11f0-a293-a0294223b12a','C','Cada uno hace su partida',2),('6135fb5e-2089-11f0-a293-a0294223b12a','5f527dea-2089-11f0-a293-a0294223b12a','A','Verdadero',2),('613612fe-2089-11f0-a293-a0294223b12a','5f527dea-2089-11f0-a293-a0294223b12a','B','?',1),('61362caf-2089-11f0-a293-a0294223b12a','5f527dea-2089-11f0-a293-a0294223b12a','C','Falso',0),('6136448f-2089-11f0-a293-a0294223b12a','5f527f87-2089-11f0-a293-a0294223b12a','A','Verdadero',2),('61365c50-2089-11f0-a293-a0294223b12a','5f527f87-2089-11f0-a293-a0294223b12a','B','?',1),('6136760c-2089-11f0-a293-a0294223b12a','5f527f87-2089-11f0-a293-a0294223b12a','C','Falso',0),('61368def-2089-11f0-a293-a0294223b12a','5f528128-2089-11f0-a293-a0294223b12a','A','Verdadero',2),('6136a5ab-2089-11f0-a293-a0294223b12a','5f528128-2089-11f0-a293-a0294223b12a','B','?',1),('6136c7ea-2089-11f0-a293-a0294223b12a','5f528128-2089-11f0-a293-a0294223b12a','C','Falso',0),('6136e044-2089-11f0-a293-a0294223b12a','5f5282ae-2089-11f0-a293-a0294223b12a','A','Verdadero, no me siento mal',2),('6136fa8b-2089-11f0-a293-a0294223b12a','5f5282ae-2089-11f0-a293-a0294223b12a','B','?',1),('6137139b-2089-11f0-a293-a0294223b12a','5f5282ae-2089-11f0-a293-a0294223b12a','C','Falso, me molesta',0),('61371da0-2089-11f0-a293-a0294223b12a','5f52842e-2089-11f0-a293-a0294223b12a','A','Verdadero',0),('6137359a-2089-11f0-a293-a0294223b12a','5f52842e-2089-11f0-a293-a0294223b12a','B','?',1),('61374d61-2089-11f0-a293-a0294223b12a','5f52842e-2089-11f0-a293-a0294223b12a','C','Falso',2),('61376714-2089-11f0-a293-a0294223b12a','5f5285a3-2089-11f0-a293-a0294223b12a','A','Verdadero',2),('61377f09-2089-11f0-a293-a0294223b12a','5f5285a3-2089-11f0-a293-a0294223b12a','B','?',1),('613796ec-2089-11f0-a293-a0294223b12a','5f5285a3-2089-11f0-a293-a0294223b12a','C','Falso',0),('6137b5f7-2089-11f0-a293-a0294223b12a','5f52872a-2089-11f0-a293-a0294223b12a','A','Verdadero',0),('6137bf69-2089-11f0-a293-a0294223b12a','5f52872a-2089-11f0-a293-a0294223b12a','B','?',1),('6137c83e-2089-11f0-a293-a0294223b12a','5f52872a-2089-11f0-a293-a0294223b12a','C','Falso',2),('6137d100-2089-11f0-a293-a0294223b12a','5f5288b0-2089-11f0-a293-a0294223b12a','A','Verdadero',2),('6137d9af-2089-11f0-a293-a0294223b12a','5f5288b0-2089-11f0-a293-a0294223b12a','B','?',1),('6137e2b4-2089-11f0-a293-a0294223b12a','5f5288b0-2089-11f0-a293-a0294223b12a','C','Falso',0),('6137eb8e-2089-11f0-a293-a0294223b12a','5f528a27-2089-11f0-a293-a0294223b12a','A','Verdadero',2),('6137f439-2089-11f0-a293-a0294223b12a','5f528a27-2089-11f0-a293-a0294223b12a','B','?',1),('6137fab0-2089-11f0-a293-a0294223b12a','5f528a27-2089-11f0-a293-a0294223b12a','C','Falso',0),('6138039e-2089-11f0-a293-a0294223b12a','5f528ba3-2089-11f0-a293-a0294223b12a','A','Verdadero',0),('613810d6-2089-11f0-a293-a0294223b12a','5f528ba3-2089-11f0-a293-a0294223b12a','B','?',1),('61382898-2089-11f0-a293-a0294223b12a','5f528ba3-2089-11f0-a293-a0294223b12a','C','Falso',2),('613832f4-2089-11f0-a293-a0294223b12a','5f528d21-2089-11f0-a293-a0294223b12a','A','No están demasiado satisfechas',2),('61384f85-2089-11f0-a293-a0294223b12a','5f528d21-2089-11f0-a293-a0294223b12a','B','?',1),('613860b1-2089-11f0-a293-a0294223b12a','5f528d21-2089-11f0-a293-a0294223b12a','C','Están bien satisfechas',0),('6138715e-2089-11f0-a293-a0294223b12a','5f528eb7-2089-11f0-a293-a0294223b12a','A','Verdadero',2),('61388663-2089-11f0-a293-a0294223b12a','5f528eb7-2089-11f0-a293-a0294223b12a','B','?',1),('6138a341-2089-11f0-a293-a0294223b12a','5f528eb7-2089-11f0-a293-a0294223b12a','C','Falso',0),('6138ac9e-2089-11f0-a293-a0294223b12a','5f52905c-2089-11f0-a293-a0294223b12a','A','Verdadero',2),('6138f4d8-2089-11f0-a293-a0294223b12a','5f52905c-2089-11f0-a293-a0294223b12a','B','?',1),('61393042-2089-11f0-a293-a0294223b12a','5f52905c-2089-11f0-a293-a0294223b12a','C','Falso',0),('6139410c-2089-11f0-a293-a0294223b12a','5f5291d3-2089-11f0-a293-a0294223b12a','A','De modo aseado y sencillo',0),('61395507-2089-11f0-a293-a0294223b12a','5f5291d3-2089-11f0-a293-a0294223b12a','B','?',1),('6139595d-2089-11f0-a293-a0294223b12a','5f5291d3-2089-11f0-a293-a0294223b12a','C','A la moda y original',2),('613974d9-2089-11f0-a293-a0294223b12a','5f529343-2089-11f0-a293-a0294223b12a','A','Verdadero',0),('61398ce0-2089-11f0-a293-a0294223b12a','5f529343-2089-11f0-a293-a0294223b12a','B','?',1),('6139a4c6-2089-11f0-a293-a0294223b12a','5f529343-2089-11f0-a293-a0294223b12a','C','Falso',2),('6139bccc-2089-11f0-a293-a0294223b12a','5f5294ac-2089-11f0-a293-a0294223b12a','A','Verdadero, porque no siempre son necesarias',2),('6139d6fc-2089-11f0-a293-a0294223b12a','5f5294ac-2089-11f0-a293-a0294223b12a','B','?',1),('6139ef13-2089-11f0-a293-a0294223b12a','5f5294ac-2089-11f0-a293-a0294223b12a','C','Falso, por que es importante hacer las cosas correctamente',0),('6139f794-2089-11f0-a293-a0294223b12a','5f529662-2089-11f0-a293-a0294223b12a','A','Nunca me ha dado problemas',2),('613a11a2-2089-11f0-a293-a0294223b12a','5f529662-2089-11f0-a293-a0294223b12a','B','?',1),('613a1a0a-2089-11f0-a293-a0294223b12a','5f529662-2089-11f0-a293-a0294223b12a','C','Me cuesta bastante',0),('613a31c9-2089-11f0-a293-a0294223b12a','5f5297ce-2089-11f0-a293-a0294223b12a','A','Literatura o cine',2),('613a49a5-2089-11f0-a293-a0294223b12a','5f5297ce-2089-11f0-a293-a0294223b12a','B','?',1),('613a59e3-2089-11f0-a293-a0294223b12a','5f5297ce-2089-11f0-a293-a0294223b12a','C','Deportes o política',0),('613a70ce-2089-11f0-a293-a0294223b12a','5f529941-2089-11f0-a293-a0294223b12a','A','A veces',0),('613a94f4-2089-11f0-a293-a0294223b12a','5f529941-2089-11f0-a293-a0294223b12a','B','?',1),('613aaedd-2089-11f0-a293-a0294223b12a','5f529941-2089-11f0-a293-a0294223b12a','C','Raras veces',2),('613ac27a-2089-11f0-a293-a0294223b12a','5f529aac-2089-11f0-a293-a0294223b12a','A','Verdadero',2),('613acb6b-2089-11f0-a293-a0294223b12a','5f529aac-2089-11f0-a293-a0294223b12a','B','?',1),('613adec8-2089-11f0-a293-a0294223b12a','5f529aac-2089-11f0-a293-a0294223b12a','C','Falso',0),('613af250-2089-11f0-a293-a0294223b12a','5f529c18-2089-11f0-a293-a0294223b12a','A','Verdadero',0),('613b0754-2089-11f0-a293-a0294223b12a','5f529c18-2089-11f0-a293-a0294223b12a','B','?',1),('613b1ad8-2089-11f0-a293-a0294223b12a','5f529c18-2089-11f0-a293-a0294223b12a','C','Falso',2),('613b2dff-2089-11f0-a293-a0294223b12a','5f529d84-2089-11f0-a293-a0294223b12a','A','Casi nunca',2),('613b4908-2089-11f0-a293-a0294223b12a','5f529d84-2089-11f0-a293-a0294223b12a','B','?',1),('613b5e22-2089-11f0-a293-a0294223b12a','5f529d84-2089-11f0-a293-a0294223b12a','C','A menudo',0),('613b7015-2089-11f0-a293-a0294223b12a','5f529eeb-2089-11f0-a293-a0294223b12a','A','Verdadero',0),('613b75f5-2089-11f0-a293-a0294223b12a','5f529eeb-2089-11f0-a293-a0294223b12a','B','?',1),('613b85ff-2089-11f0-a293-a0294223b12a','5f529eeb-2089-11f0-a293-a0294223b12a','C','Falso',2),('613b9601-2089-11f0-a293-a0294223b12a','5f52a057-2089-11f0-a293-a0294223b12a','A','Normalmente verdadero',2),('613ba74f-2089-11f0-a293-a0294223b12a','5f52a057-2089-11f0-a293-a0294223b12a','B','?',1),('613bb783-2089-11f0-a293-a0294223b12a','5f52a057-2089-11f0-a293-a0294223b12a','C','Normalmente falso',0),('613bc796-2089-11f0-a293-a0294223b12a','5f52a1c1-2089-11f0-a293-a0294223b12a','A','Las cosas prácticas que me rodean',0),('613bd7a4-2089-11f0-a293-a0294223b12a','5f52a1c1-2089-11f0-a293-a0294223b12a','B','?',1),('613be8c2-2089-11f0-a293-a0294223b12a','5f52a1c1-2089-11f0-a293-a0294223b12a','C','Los pensamientos y la imaginación',2),('613bf8fd-2089-11f0-a293-a0294223b12a','5f52a332-2089-11f0-a293-a0294223b12a','A','Casi nunca',2),('613c0830-2089-11f0-a293-a0294223b12a','5f52a332-2089-11f0-a293-a0294223b12a','B','?',1),('613c10a5-2089-11f0-a293-a0294223b12a','5f52a332-2089-11f0-a293-a0294223b12a','C','A menudo',0),('613c1b08-2089-11f0-a293-a0294223b12a','5f52a46e-2089-11f0-a293-a0294223b12a','A','Verdadero',2),('613c28da-2089-11f0-a293-a0294223b12a','5f52a46e-2089-11f0-a293-a0294223b12a','B','?',1),('613c37cd-2089-11f0-a293-a0294223b12a','5f52a46e-2089-11f0-a293-a0294223b12a','C','Falso',0),('613c45c1-2089-11f0-a293-a0294223b12a','5f52a571-2089-11f0-a293-a0294223b12a','A','\"Poner todas las cartas sobre la mesa\"',2),('613c539a-2089-11f0-a293-a0294223b12a','5f52a571-2089-11f0-a293-a0294223b12a','B','?',1),('613c6173-2089-11f0-a293-a0294223b12a','5f52a571-2089-11f0-a293-a0294223b12a','C','\"No descubrir tu propio juego\"',0),('613c6843-2089-11f0-a293-a0294223b12a','5f52a689-2089-11f0-a293-a0294223b12a','A','Verdadero',0),('613c75f1-2089-11f0-a293-a0294223b12a','5f52a689-2089-11f0-a293-a0294223b12a','B','?',1),('613c8272-2089-11f0-a293-a0294223b12a','5f52a689-2089-11f0-a293-a0294223b12a','C','Falso',2),('613c96d8-2089-11f0-a293-a0294223b12a','5f52a79c-2089-11f0-a293-a0294223b12a','A','Es estable y tradicional en sus intereses',0),('613ca023-2089-11f0-a293-a0294223b12a','5f52a79c-2089-11f0-a293-a0294223b12a','B','?',1),('613cafaa-2089-11f0-a293-a0294223b12a','5f52a79c-2089-11f0-a293-a0294223b12a','C','Reconsidera seriamente sus puntos de vista sobre la vida',2),('613cc03a-2089-11f0-a293-a0294223b12a','5f52a8a9-2089-11f0-a293-a0294223b12a','A','Verdadero',2),('613cd0d8-2089-11f0-a293-a0294223b12a','5f52a8a9-2089-11f0-a293-a0294223b12a','B','?',1),('613ce1f3-2089-11f0-a293-a0294223b12a','5f52a8a9-2089-11f0-a293-a0294223b12a','C','Falso',0),('613cf552-2089-11f0-a293-a0294223b12a','5f52a9a4-2089-11f0-a293-a0294223b12a','A','Me aburre y me da sueño',0),('613d062b-2089-11f0-a293-a0294223b12a','5f52a9a4-2089-11f0-a293-a0294223b12a','B','?',1),('613d160a-2089-11f0-a293-a0294223b12a','5f52a9a4-2089-11f0-a293-a0294223b12a','C','Me da seguridad y confianza',2),('613d2cde-2089-11f0-a293-a0294223b12a','5f52aaad-2089-11f0-a293-a0294223b12a','A','Verdadero',2),('613d4747-2089-11f0-a293-a0294223b12a','5f52aaad-2089-11f0-a293-a0294223b12a','B','?',1),('613d68e1-2089-11f0-a293-a0294223b12a','5f52aaad-2089-11f0-a293-a0294223b12a','C','Falso',0),('613d8cb1-2089-11f0-a293-a0294223b12a','5f52abbf-2089-11f0-a293-a0294223b12a','A','Verdadero',0),('613d916e-2089-11f0-a293-a0294223b12a','5f52abbf-2089-11f0-a293-a0294223b12a','B','?',1),('613d9557-2089-11f0-a293-a0294223b12a','5f52abbf-2089-11f0-a293-a0294223b12a','C','Falso',2),('613d9963-2089-11f0-a293-a0294223b12a','5f52ace0-2089-11f0-a293-a0294223b12a','A','Verdadero',2),('613d9d68-2089-11f0-a293-a0294223b12a','5f52ace0-2089-11f0-a293-a0294223b12a','B','?',1),('613da0e5-2089-11f0-a293-a0294223b12a','5f52ace0-2089-11f0-a293-a0294223b12a','C','Falso, me cuesta ser paciente',0),('613da466-2089-11f0-a293-a0294223b12a','5f52ae26-2089-11f0-a293-a0294223b12a','A','Verdadero',2),('613da813-2089-11f0-a293-a0294223b12a','5f52ae26-2089-11f0-a293-a0294223b12a','B','?',1),('613dab68-2089-11f0-a293-a0294223b12a','5f52ae26-2089-11f0-a293-a0294223b12a','C','Falso',0),('613dae9f-2089-11f0-a293-a0294223b12a','5f52af5a-2089-11f0-a293-a0294223b12a','A','Verdadero',0),('613db1b1-2089-11f0-a293-a0294223b12a','5f52af5a-2089-11f0-a293-a0294223b12a','B','?',1),('613db5a7-2089-11f0-a293-a0294223b12a','5f52af5a-2089-11f0-a293-a0294223b12a','C','Falso',2),('613db8d2-2089-11f0-a293-a0294223b12a','5f52b079-2089-11f0-a293-a0294223b12a','A','Verdadero, no me pongo',0),('613dbbf1-2089-11f0-a293-a0294223b12a','5f52b079-2089-11f0-a293-a0294223b12a','B','?',1),('613dc6cd-2089-11f0-a293-a0294223b12a','5f52b079-2089-11f0-a293-a0294223b12a','C','Falso, me pongo intranquilo',2),('613dd271-2089-11f0-a293-a0294223b12a','5f52b194-2089-11f0-a293-a0294223b12a','A','A veces',0),('613ddf10-2089-11f0-a293-a0294223b12a','5f52b194-2089-11f0-a293-a0294223b12a','B','?',1),('613deba2-2089-11f0-a293-a0294223b12a','5f52b194-2089-11f0-a293-a0294223b12a','C','Nunca',2),('613df8ad-2089-11f0-a293-a0294223b12a','5f52b2a6-2089-11f0-a293-a0294223b12a','A','Verdadero',0),('613e051a-2089-11f0-a293-a0294223b12a','5f52b2a6-2089-11f0-a293-a0294223b12a','B','?',1),('613e117c-2089-11f0-a293-a0294223b12a','5f52b2a6-2089-11f0-a293-a0294223b12a','C','Falso',2),('613e2302-2089-11f0-a293-a0294223b12a','5f52b3d1-2089-11f0-a293-a0294223b12a','A','Verdadero',2),('613e3df4-2089-11f0-a293-a0294223b12a','5f52b3d1-2089-11f0-a293-a0294223b12a','B','?',1),('613e56b2-2089-11f0-a293-a0294223b12a','5f52b3d1-2089-11f0-a293-a0294223b12a','C','Falso',0),('613e6f52-2089-11f0-a293-a0294223b12a','5f52b4ee-2089-11f0-a293-a0294223b12a','A','Investigarlo en el laboratorio',2),('613e7c0a-2089-11f0-a293-a0294223b12a','5f52b4ee-2089-11f0-a293-a0294223b12a','B','?',1),('613e8594-2089-11f0-a293-a0294223b12a','5f52b4ee-2089-11f0-a293-a0294223b12a','C','Mostrar a las personas su utilización',0),('613e8eb8-2089-11f0-a293-a0294223b12a','5f52b609-2089-11f0-a293-a0294223b12a','A','Verdadero',0),('613e977e-2089-11f0-a293-a0294223b12a','5f52b609-2089-11f0-a293-a0294223b12a','B','?',1),('613ea043-2089-11f0-a293-a0294223b12a','5f52b609-2089-11f0-a293-a0294223b12a','C','Falso',2),('613ea902-2089-11f0-a293-a0294223b12a','5f52b742-2089-11f0-a293-a0294223b12a','A','Verdadero',0),('613eb1b7-2089-11f0-a293-a0294223b12a','5f52b742-2089-11f0-a293-a0294223b12a','B','?',1),('613ebbf2-2089-11f0-a293-a0294223b12a','5f52b742-2089-11f0-a293-a0294223b12a','C','Falso',2),('613ec5e1-2089-11f0-a293-a0294223b12a','5f52b861-2089-11f0-a293-a0294223b12a','A','A veces',2),('613eced6-2089-11f0-a293-a0294223b12a','5f52b861-2089-11f0-a293-a0294223b12a','B','?',1),('613ed7e2-2089-11f0-a293-a0294223b12a','5f52b861-2089-11f0-a293-a0294223b12a','C','Raras veces',0),('613ee444-2089-11f0-a293-a0294223b12a','5f52b981-2089-11f0-a293-a0294223b12a','A','No protestaría y les seguiría',0),('613ef086-2089-11f0-a293-a0294223b12a','5f52b981-2089-11f0-a293-a0294223b12a','B','?',1),('613efb07-2089-11f0-a293-a0294223b12a','5f52b981-2089-11f0-a293-a0294223b12a','C','Les haría saber que yo creía que mi camino era mejor',2),('613f0a1c-2089-11f0-a293-a0294223b12a','5f52baa5-2089-11f0-a293-a0294223b12a','A','Verdadero',0),('613f4b79-2089-11f0-a293-a0294223b12a','5f52baa5-2089-11f0-a293-a0294223b12a','B','?',1),('613f593f-2089-11f0-a293-a0294223b12a','5f52baa5-2089-11f0-a293-a0294223b12a','C','Falso',2),('613f647c-2089-11f0-a293-a0294223b12a','5f52bbad-2089-11f0-a293-a0294223b12a','A','Lo indicaría y lo pagaría',0),('613f6f64-2089-11f0-a293-a0294223b12a','5f52bbad-2089-11f0-a293-a0294223b12a','B','?',1),('613f7a2c-2089-11f0-a293-a0294223b12a','5f52bbad-2089-11f0-a293-a0294223b12a','C','Yo no tengo por qué decírselo',2),('613f84fd-2089-11f0-a293-a0294223b12a','5f52bcb3-2089-11f0-a293-a0294223b12a','A','Verdadero',2),('613f916e-2089-11f0-a293-a0294223b12a','5f52bcb3-2089-11f0-a293-a0294223b12a','B','?',1),('613f9c3f-2089-11f0-a293-a0294223b12a','5f52bcb3-2089-11f0-a293-a0294223b12a','C','Falso',0),('613fa6f9-2089-11f0-a293-a0294223b12a','5f52be35-2089-11f0-a293-a0294223b12a','A','Verdadero',2),('613fb1d6-2089-11f0-a293-a0294223b12a','5f52be35-2089-11f0-a293-a0294223b12a','B','?',1),('613fbb76-2089-11f0-a293-a0294223b12a','5f52be35-2089-11f0-a293-a0294223b12a','C','Falso',0),('613fc522-2089-11f0-a293-a0294223b12a','5f52bf43-2089-11f0-a293-a0294223b12a','A','Verdadero',0),('613fcec4-2089-11f0-a293-a0294223b12a','5f52bf43-2089-11f0-a293-a0294223b12a','B','?',1),('613fd956-2089-11f0-a293-a0294223b12a','5f52bf43-2089-11f0-a293-a0294223b12a','C','Falso',2),('613fe108-2089-11f0-a293-a0294223b12a','5f52c059-2089-11f0-a293-a0294223b12a','A','Verdadero',0),('613fe9e2-2089-11f0-a293-a0294223b12a','5f52c059-2089-11f0-a293-a0294223b12a','B','?',1),('613ff385-2089-11f0-a293-a0294223b12a','5f52c059-2089-11f0-a293-a0294223b12a','C','Falso',2),('613ffc74-2089-11f0-a293-a0294223b12a','5f52c15b-2089-11f0-a293-a0294223b12a','A','Casi nunca',0),('61400536-2089-11f0-a293-a0294223b12a','5f52c15b-2089-11f0-a293-a0294223b12a','B','?',1),('61400dfb-2089-11f0-a293-a0294223b12a','5f52c15b-2089-11f0-a293-a0294223b12a','C','A menudo',2),('614016b1-2089-11f0-a293-a0294223b12a','5f52c25c-2089-11f0-a293-a0294223b12a','A','Verdadero',1),('61401f71-2089-11f0-a293-a0294223b12a','5f52c25c-2089-11f0-a293-a0294223b12a','B','?',1),('61402910-2089-11f0-a293-a0294223b12a','5f52c25c-2089-11f0-a293-a0294223b12a','C','Falso',0),('614031dc-2089-11f0-a293-a0294223b12a','5f52c352-2089-11f0-a293-a0294223b12a','A','Verdadero',0),('61403a93-2089-11f0-a293-a0294223b12a','5f52c352-2089-11f0-a293-a0294223b12a','B','?',1),('61404357-2089-11f0-a293-a0294223b12a','5f52c352-2089-11f0-a293-a0294223b12a','C','Falso',2),('61404c27-2089-11f0-a293-a0294223b12a','5f52eb74-2089-11f0-a293-a0294223b12a','A','Verdadero, no se puede confiar en ella',0),('614054f8-2089-11f0-a293-a0294223b12a','5f52eb74-2089-11f0-a293-a0294223b12a','B','?',1),('61405dbe-2089-11f0-a293-a0294223b12a','5f52eb74-2089-11f0-a293-a0294223b12a','C','Falso, se puede confiar en ella',2),('61406690-2089-11f0-a293-a0294223b12a','5f52ee6e-2089-11f0-a293-a0294223b12a','A','Verdadero',0),('61406f38-2089-11f0-a293-a0294223b12a','5f52ee6e-2089-11f0-a293-a0294223b12a','B','?',1),('614078d3-2089-11f0-a293-a0294223b12a','5f52ee6e-2089-11f0-a293-a0294223b12a','C','Falso',2),('614081a2-2089-11f0-a293-a0294223b12a','5f52ef94-2089-11f0-a293-a0294223b12a','A','Verdadero',0),('61408a5b-2089-11f0-a293-a0294223b12a','5f52ef94-2089-11f0-a293-a0294223b12a','B','?',1),('61409043-2089-11f0-a293-a0294223b12a','5f52ef94-2089-11f0-a293-a0294223b12a','C','Falso',2),('614098e1-2089-11f0-a293-a0294223b12a','5f52f09e-2089-11f0-a293-a0294223b12a','A','A veces',0),('6140a1a0-2089-11f0-a293-a0294223b12a','5f52f09e-2089-11f0-a293-a0294223b12a','B','?',1),('6140d520-2089-11f0-a293-a0294223b12a','5f52f09e-2089-11f0-a293-a0294223b12a','C','Nunca',2),('6140e043-2089-11f0-a293-a0294223b12a','5f52f1a9-2089-11f0-a293-a0294223b12a','A','Verdadero',0),('6140e9e6-2089-11f0-a293-a0294223b12a','5f52f1a9-2089-11f0-a293-a0294223b12a','B','?',1),('6140f2cf-2089-11f0-a293-a0294223b12a','5f52f1a9-2089-11f0-a293-a0294223b12a','C','Falso',2),('6140fba6-2089-11f0-a293-a0294223b12a','5f52f2a6-2089-11f0-a293-a0294223b12a','A','Verdadero',2),('6141046f-2089-11f0-a293-a0294223b12a','5f52f2a6-2089-11f0-a293-a0294223b12a','B','?',1),('61410d43-2089-11f0-a293-a0294223b12a','5f52f2a6-2089-11f0-a293-a0294223b12a','C','Falso',0),('614117c8-2089-11f0-a293-a0294223b12a','5f52f39e-2089-11f0-a293-a0294223b12a','A','Verdadero',2),('614120eb-2089-11f0-a293-a0294223b12a','5f52f39e-2089-11f0-a293-a0294223b12a','B','?',1),('614129f0-2089-11f0-a293-a0294223b12a','5f52f39e-2089-11f0-a293-a0294223b12a','C','Falso',0),('61413715-2089-11f0-a293-a0294223b12a','5f52f48e-2089-11f0-a293-a0294223b12a','A','Casi nunca',0),('614140cf-2089-11f0-a293-a0294223b12a','5f52f48e-2089-11f0-a293-a0294223b12a','B','?',1),('61414ac0-2089-11f0-a293-a0294223b12a','5f52f48e-2089-11f0-a293-a0294223b12a','C','A menudo',2),('61415a0f-2089-11f0-a293-a0294223b12a','5f52f57f-2089-11f0-a293-a0294223b12a','A','Los artículos sobre los problemas sociales',0),('614164de-2089-11f0-a293-a0294223b12a','5f52f57f-2089-11f0-a293-a0294223b12a','B','?',1),('61416e91-2089-11f0-a293-a0294223b12a','5f52f57f-2089-11f0-a293-a0294223b12a','C','Todas las noticias locales',2),('61417881-2089-11f0-a293-a0294223b12a','5f52f677-2089-11f0-a293-a0294223b12a','A','Leer o trabajar en solitario en un proyecto',0),('6141821b-2089-11f0-a293-a0294223b12a','5f52f677-2089-11f0-a293-a0294223b12a','B','?',1),('61418b36-2089-11f0-a293-a0294223b12a','5f52f677-2089-11f0-a293-a0294223b12a','C','Hacer alguna tarea con los amigos',2),('6141954f-2089-11f0-a293-a0294223b12a','5f52f758-2089-11f0-a293-a0294223b12a','A','Dejarlo a un lado hasta que no haya más remedio que hacerlo',2),('61419ec6-2089-11f0-a293-a0294223b12a','5f52f758-2089-11f0-a293-a0294223b12a','B','?',1),('6141a870-2089-11f0-a293-a0294223b12a','5f52f758-2089-11f0-a293-a0294223b12a','C','Comenzar a hacerlo de inmediato',0),('6141cbd5-2089-11f0-a293-a0294223b12a','5f52f84d-2089-11f0-a293-a0294223b12a','A','Con un grupo de gente',0),('6141dde1-2089-11f0-a293-a0294223b12a','5f52f84d-2089-11f0-a293-a0294223b12a','B','?',1),('6141ee48-2089-11f0-a293-a0294223b12a','5f52f84d-2089-11f0-a293-a0294223b12a','C','En solitario',2),('6141fdf0-2089-11f0-a293-a0294223b12a','5f52f94f-2089-11f0-a293-a0294223b12a','A','Verdadero',0),('61420f63-2089-11f0-a293-a0294223b12a','5f52f94f-2089-11f0-a293-a0294223b12a','B','?',1),('61421dcb-2089-11f0-a293-a0294223b12a','5f52f94f-2089-11f0-a293-a0294223b12a','C','Falso',2),('61422cca-2089-11f0-a293-a0294223b12a','5f52fa5d-2089-11f0-a293-a0294223b12a','A','Verdadero',0),('61423b28-2089-11f0-a293-a0294223b12a','5f52fa5d-2089-11f0-a293-a0294223b12a','B','?',1),('614246dc-2089-11f0-a293-a0294223b12a','5f52fa5d-2089-11f0-a293-a0294223b12a','C','Falso',2),('614253cd-2089-11f0-a293-a0294223b12a','5f52fb54-2089-11f0-a293-a0294223b12a','A','Verdadero',0),('61425f7d-2089-11f0-a293-a0294223b12a','5f52fb54-2089-11f0-a293-a0294223b12a','B','?',1),('61426924-2089-11f0-a293-a0294223b12a','5f52fb54-2089-11f0-a293-a0294223b12a','C','Falso',2),('614274b2-2089-11f0-a293-a0294223b12a','5f52fc46-2089-11f0-a293-a0294223b12a','A','Cálida y amigable',0),('61427e5c-2089-11f0-a293-a0294223b12a','5f52fc46-2089-11f0-a293-a0294223b12a','B','?',1),('6142883c-2089-11f0-a293-a0294223b12a','5f52fc46-2089-11f0-a293-a0294223b12a','C','Formal y objetiva',2),('61429260-2089-11f0-a293-a0294223b12a','5f52fd36-2089-11f0-a293-a0294223b12a','A','Verdadero',0),('61429caf-2089-11f0-a293-a0294223b12a','5f52fd36-2089-11f0-a293-a0294223b12a','B','?',1),('6142a866-2089-11f0-a293-a0294223b12a','5f52fd36-2089-11f0-a293-a0294223b12a','C','Falso',2),('6142b33d-2089-11f0-a293-a0294223b12a','5f52fe4b-2089-11f0-a293-a0294223b12a','A','Hacer o reparar algo',2),('6142c8d3-2089-11f0-a293-a0294223b12a','5f52fe4b-2089-11f0-a293-a0294223b12a','B','?',1),('6142e5db-2089-11f0-a293-a0294223b12a','5f52fe4b-2089-11f0-a293-a0294223b12a','C','Trabajar en grupo en una tarea comunitaria',0),('6143071f-2089-11f0-a293-a0294223b12a','5f52ff3e-2089-11f0-a293-a0294223b12a','A','Verdadero',0),('614323b3-2089-11f0-a293-a0294223b12a','5f52ff3e-2089-11f0-a293-a0294223b12a','B','?',1),('61433d40-2089-11f0-a293-a0294223b12a','5f52ff3e-2089-11f0-a293-a0294223b12a','C','Falso',2),('61434dc3-2089-11f0-a293-a0294223b12a','5f530028-2089-11f0-a293-a0294223b12a','A','Normalmente verdadero',0),('614359c7-2089-11f0-a293-a0294223b12a','5f530028-2089-11f0-a293-a0294223b12a','B','?',1),('61436520-2089-11f0-a293-a0294223b12a','5f530028-2089-11f0-a293-a0294223b12a','C','Normalmente falso',2),('6143705b-2089-11f0-a293-a0294223b12a','5f530121-2089-11f0-a293-a0294223b12a','A','Verdadero',0),('61437b3f-2089-11f0-a293-a0294223b12a','5f530121-2089-11f0-a293-a0294223b12a','B','?',1),('6143963d-2089-11f0-a293-a0294223b12a','5f530121-2089-11f0-a293-a0294223b12a','C','Falso',2),('6143a879-2089-11f0-a293-a0294223b12a','5f530344-2089-11f0-a293-a0294223b12a','A','Verdadero',2),('6143b1c7-2089-11f0-a293-a0294223b12a','5f530344-2089-11f0-a293-a0294223b12a','B','?',1),('6143bec0-2089-11f0-a293-a0294223b12a','5f530344-2089-11f0-a293-a0294223b12a','C','Falso',0),('6143c9c8-2089-11f0-a293-a0294223b12a','5f530519-2089-11f0-a293-a0294223b12a','A','Verdadero',0),('6143d5d8-2089-11f0-a293-a0294223b12a','5f530519-2089-11f0-a293-a0294223b12a','B','?',1),('6143e492-2089-11f0-a293-a0294223b12a','5f530519-2089-11f0-a293-a0294223b12a','C','Falso',2),('6143eeee-2089-11f0-a293-a0294223b12a','5f5306ad-2089-11f0-a293-a0294223b12a','A','Verdadero',0),('6143f949-2089-11f0-a293-a0294223b12a','5f5306ad-2089-11f0-a293-a0294223b12a','B','?',1),('614403bc-2089-11f0-a293-a0294223b12a','5f5306ad-2089-11f0-a293-a0294223b12a','C','Falso',2),('614417d0-2089-11f0-a293-a0294223b12a','5f530840-2089-11f0-a293-a0294223b12a','A','Podría incumplirlas si tiene razones especiales para ello',2),('6144376e-2089-11f0-a293-a0294223b12a','5f530840-2089-11f0-a293-a0294223b12a','B','?',1),('61445477-2089-11f0-a293-a0294223b12a','5f530840-2089-11f0-a293-a0294223b12a','C','Debería seguirlas a pesar de todo',0),('614482c0-2089-11f0-a293-a0294223b12a','5f5309c0-2089-11f0-a293-a0294223b12a','A','Verdadero',2),('61448b4a-2089-11f0-a293-a0294223b12a','5f5309c0-2089-11f0-a293-a0294223b12a','B','?',1),('614494b8-2089-11f0-a293-a0294223b12a','5f5309c0-2089-11f0-a293-a0294223b12a','C','Falso',0),('6144a976-2089-11f0-a293-a0294223b12a','5f530b2c-2089-11f0-a293-a0294223b12a','A','Verdadero',2),('6144b336-2089-11f0-a293-a0294223b12a','5f530b2c-2089-11f0-a293-a0294223b12a','B','?',1),('6144bc68-2089-11f0-a293-a0294223b12a','5f530b2c-2089-11f0-a293-a0294223b12a','C','Falso',0),('6144c75f-2089-11f0-a293-a0294223b12a','5f530ca0-2089-11f0-a293-a0294223b12a','A','Casi nunca',0),('6144d09d-2089-11f0-a293-a0294223b12a','5f530ca0-2089-11f0-a293-a0294223b12a','B','?',1),('6144e126-2089-11f0-a293-a0294223b12a','5f530ca0-2089-11f0-a293-a0294223b12a','C','A menudo',2),('6144f980-2089-11f0-a293-a0294223b12a','5f530e24-2089-11f0-a293-a0294223b12a','A','Hacer o construir algo',2),('6145115d-2089-11f0-a293-a0294223b12a','5f530e24-2089-11f0-a293-a0294223b12a','B','?',1),('61452881-2089-11f0-a293-a0294223b12a','5f530e24-2089-11f0-a293-a0294223b12a','C','Leer o imaginar cosas ideales',0),('614533c2-2089-11f0-a293-a0294223b12a','5f530f9c-2089-11f0-a293-a0294223b12a','A','Verdadero',0),('614545ab-2089-11f0-a293-a0294223b12a','5f530f9c-2089-11f0-a293-a0294223b12a','B','?',1),('61455fbf-2089-11f0-a293-a0294223b12a','5f530f9c-2089-11f0-a293-a0294223b12a','C','Falso',2),('6145783e-2089-11f0-a293-a0294223b12a','5f531116-2089-11f0-a293-a0294223b12a','A','Verdadero',0),('6145904e-2089-11f0-a293-a0294223b12a','5f531116-2089-11f0-a293-a0294223b12a','B','?',1),('6145a89c-2089-11f0-a293-a0294223b12a','5f531116-2089-11f0-a293-a0294223b12a','C','Falso',2),('6145c2d3-2089-11f0-a293-a0294223b12a','5f53128c-2089-11f0-a293-a0294223b12a','A','Normalmente verdadero',2),('6145db0b-2089-11f0-a293-a0294223b12a','5f53128c-2089-11f0-a293-a0294223b12a','B','?',1),('6145eb5b-2089-11f0-a293-a0294223b12a','5f53128c-2089-11f0-a293-a0294223b12a','C','Normalmente falso',0),('61460274-2089-11f0-a293-a0294223b12a','5f5313fb-2089-11f0-a293-a0294223b12a','A','A veces',0),('61461b43-2089-11f0-a293-a0294223b12a','5f5313fb-2089-11f0-a293-a0294223b12a','B','?',1),('61462ad4-2089-11f0-a293-a0294223b12a','5f5313fb-2089-11f0-a293-a0294223b12a','C','Raras veces',2),('614634a7-2089-11f0-a293-a0294223b12a','5f531524-2089-11f0-a293-a0294223b12a','A','Verdadero',0),('61464ee7-2089-11f0-a293-a0294223b12a','5f531524-2089-11f0-a293-a0294223b12a','B','?',1),('6146671e-2089-11f0-a293-a0294223b12a','5f531524-2089-11f0-a293-a0294223b12a','C','Falso',2),('61467f53-2089-11f0-a293-a0294223b12a','5f531618-2089-11f0-a293-a0294223b12a','A','Verdadero',0),('6146974c-2089-11f0-a293-a0294223b12a','5f531618-2089-11f0-a293-a0294223b12a','B','?',1),('6146b194-2089-11f0-a293-a0294223b12a','5f531618-2089-11f0-a293-a0294223b12a','C','Falso',2),('6146c9cf-2089-11f0-a293-a0294223b12a','5f5316fa-2089-11f0-a293-a0294223b12a','A','Se cuestionan o cambian métodos que son ya satisfactorios',2),('6146e208-2089-11f0-a293-a0294223b12a','5f5316fa-2089-11f0-a293-a0294223b12a','B','?',1),('6146fd4a-2089-11f0-a293-a0294223b12a','5f5316fa-2089-11f0-a293-a0294223b12a','C','Descartan enfoques nuevos o prometedores',0),('614715b7-2089-11f0-a293-a0294223b12a','5f5317d4-2089-11f0-a293-a0294223b12a','A','Verdadero',0),('61473d7d-2089-11f0-a293-a0294223b12a','5f5317d4-2089-11f0-a293-a0294223b12a','B','?',1),('61475607-2089-11f0-a293-a0294223b12a','5f5317d4-2089-11f0-a293-a0294223b12a','C','Falso',2),('61476193-2089-11f0-a293-a0294223b12a','5f531926-2089-11f0-a293-a0294223b12a','A','Verdadero',0),('6147774c-2089-11f0-a293-a0294223b12a','5f531926-2089-11f0-a293-a0294223b12a','B','?',1),('61478e65-2089-11f0-a293-a0294223b12a','5f531926-2089-11f0-a293-a0294223b12a','C','Falso',2),('61479de2-2089-11f0-a293-a0294223b12a','5f531a94-2089-11f0-a293-a0294223b12a','A','Verdadero',2),('6147b5f6-2089-11f0-a293-a0294223b12a','5f531a94-2089-11f0-a293-a0294223b12a','B','?',1),('6147ce04-2089-11f0-a293-a0294223b12a','5f531a94-2089-11f0-a293-a0294223b12a','C','Falso',0),('6147e86f-2089-11f0-a293-a0294223b12a','5f531c01-2089-11f0-a293-a0294223b12a','A','Verdadero',2),('6147fc38-2089-11f0-a293-a0294223b12a','5f531c01-2089-11f0-a293-a0294223b12a','B','?',1),('61480820-2089-11f0-a293-a0294223b12a','5f531c01-2089-11f0-a293-a0294223b12a','C','Falso',0),('614815ce-2089-11f0-a293-a0294223b12a','5f531d82-2089-11f0-a293-a0294223b12a','A','Verdadero',0),('61483032-2089-11f0-a293-a0294223b12a','5f531d82-2089-11f0-a293-a0294223b12a','B','?',1),('61484854-2089-11f0-a293-a0294223b12a','5f531d82-2089-11f0-a293-a0294223b12a','C','Falso',2),('614856f8-2089-11f0-a293-a0294223b12a','5f531f03-2089-11f0-a293-a0294223b12a','A','Siempre',0),('61486f10-2089-11f0-a293-a0294223b12a','5f531f03-2089-11f0-a293-a0294223b12a','B','?',1),('614899d3-2089-11f0-a293-a0294223b12a','5f531f03-2089-11f0-a293-a0294223b12a','C','A veces',2),('6148bc5c-2089-11f0-a293-a0294223b12a','5f532088-2089-11f0-a293-a0294223b12a','A','Algunos trabajos no deberían ser hechos tan cuidadosamente como otros',0),('6148d5d5-2089-11f0-a293-a0294223b12a','5f532088-2089-11f0-a293-a0294223b12a','B','?',1),('6148eee2-2089-11f0-a293-a0294223b12a','5f532088-2089-11f0-a293-a0294223b12a','C','Cualquier trabajo habría que hacerlo bien si es que se va a hacer',2),('61490a24-2089-11f0-a293-a0294223b12a','5f532188-2089-11f0-a293-a0294223b12a','A','Verdadero',0),('61492649-2089-11f0-a293-a0294223b12a','5f532188-2089-11f0-a293-a0294223b12a','B','?',1),('61493eec-2089-11f0-a293-a0294223b12a','5f532188-2089-11f0-a293-a0294223b12a','C','Falso',2),('61495950-2089-11f0-a293-a0294223b12a','5f532302-2089-11f0-a293-a0294223b12a','A','Verdadero',0),('6149680e-2089-11f0-a293-a0294223b12a','5f532302-2089-11f0-a293-a0294223b12a','B','?',1),('614979e6-2089-11f0-a293-a0294223b12a','5f532302-2089-11f0-a293-a0294223b12a','C','Falso',2),('6149930c-2089-11f0-a293-a0294223b12a','5f5323fa-2089-11f0-a293-a0294223b12a','A','Verdadero',2),('6149ad78-2089-11f0-a293-a0294223b12a','5f5323fa-2089-11f0-a293-a0294223b12a','B','?',1),('6149bf59-2089-11f0-a293-a0294223b12a','5f5323fa-2089-11f0-a293-a0294223b12a','C','Falso',0),('6149d08d-2089-11f0-a293-a0294223b12a','5f532508-2089-11f0-a293-a0294223b12a','A','Sí',2),('6149e411-2089-11f0-a293-a0294223b12a','5f532508-2089-11f0-a293-a0294223b12a','B','?',1),('6149f452-2089-11f0-a293-a0294223b12a','5f532508-2089-11f0-a293-a0294223b12a','C','No',0),('614a0610-2089-11f0-a293-a0294223b12a','5f5325f7-2089-11f0-a293-a0294223b12a','A','Verdadero',0),('614a1615-2089-11f0-a293-a0294223b12a','5f5325f7-2089-11f0-a293-a0294223b12a','B','?',1),('614a2647-2089-11f0-a293-a0294223b12a','5f5325f7-2089-11f0-a293-a0294223b12a','C','Falso',2),('614a3413-2089-11f0-a293-a0294223b12a','5f5326eb-2089-11f0-a293-a0294223b12a','A','Muy raras veces',2),('614a4301-2089-11f0-a293-a0294223b12a','5f5326eb-2089-11f0-a293-a0294223b12a','B','?',1),('614a55da-2089-11f0-a293-a0294223b12a','5f5326eb-2089-11f0-a293-a0294223b12a','C','Bastante a menudo',0),('614a6745-2089-11f0-a293-a0294223b12a','5f5328c7-2089-11f0-a293-a0294223b12a','A','Verdadero',0),('614a7721-2089-11f0-a293-a0294223b12a','5f5328c7-2089-11f0-a293-a0294223b12a','B','?',1),('614a84ff-2089-11f0-a293-a0294223b12a','5f5328c7-2089-11f0-a293-a0294223b12a','C','Falso',2),('614ad5e4-2089-11f0-a293-a0294223b12a','5f5329ba-2089-11f0-a293-a0294223b12a','A','Verdadero, puedo afrontarlos fácilmente',0),('614ae34b-2089-11f0-a293-a0294223b12a','5f5329ba-2089-11f0-a293-a0294223b12a','B','?',1),('614af066-2089-11f0-a293-a0294223b12a','5f5329ba-2089-11f0-a293-a0294223b12a','C','Falso',2),('614afcaa-2089-11f0-a293-a0294223b12a','5f532a93-2089-11f0-a293-a0294223b12a','A','No le doy importancia',0),('614b08ee-2089-11f0-a293-a0294223b12a','5f532a93-2089-11f0-a293-a0294223b12a','B','?',1),('614b1743-2089-11f0-a293-a0294223b12a','5f532a93-2089-11f0-a293-a0294223b12a','C','Se lo digo',2),('614b239a-2089-11f0-a293-a0294223b12a','5f53755b-2089-11f0-a293-a0294223b12a','A','Ser claramente serio en la vida cotidiana',2),('614b2fbd-2089-11f0-a293-a0294223b12a','5f53755b-2089-11f0-a293-a0294223b12a','B','?',1),('614b3a43-2089-11f0-a293-a0294223b12a','5f53755b-2089-11f0-a293-a0294223b12a','C','Seguir casi siempre el dicho \"Diviértete y sé feliz\"',0),('614b425f-2089-11f0-a293-a0294223b12a','5f5377ce-2089-11f0-a293-a0294223b12a','A','Verdadero',2),('614b4d9d-2089-11f0-a293-a0294223b12a','5f5377ce-2089-11f0-a293-a0294223b12a','B','?',1),('614b5b2d-2089-11f0-a293-a0294223b12a','5f5377ce-2089-11f0-a293-a0294223b12a','C','Falso',0),('614b6ba9-2089-11f0-a293-a0294223b12a','5f5378e8-2089-11f0-a293-a0294223b12a','A','Verdadero',2),('614b83e6-2089-11f0-a293-a0294223b12a','5f5378e8-2089-11f0-a293-a0294223b12a','B','?',1),('614b8cf4-2089-11f0-a293-a0294223b12a','5f5378e8-2089-11f0-a293-a0294223b12a','C','Falso',0),('614b96f7-2089-11f0-a293-a0294223b12a','5f5379e0-2089-11f0-a293-a0294223b12a','A','Verdadero',0),('614bae27-2089-11f0-a293-a0294223b12a','5f5379e0-2089-11f0-a293-a0294223b12a','B','?',1),('614bb9f0-2089-11f0-a293-a0294223b12a','5f5379e0-2089-11f0-a293-a0294223b12a','C','Falso',2),('614bc3a4-2089-11f0-a293-a0294223b12a','5f537ad0-2089-11f0-a293-a0294223b12a','A','Se sigan normas estrictas de conducta',2),('614bce4d-2089-11f0-a293-a0294223b12a','5f537ad0-2089-11f0-a293-a0294223b12a','B','?',1),('614bd821-2089-11f0-a293-a0294223b12a','5f537ad0-2089-11f0-a293-a0294223b12a','C','No haya muchas normas',0),('614be322-2089-11f0-a293-a0294223b12a','5f537bbc-2089-11f0-a293-a0294223b12a','A','Verdadero',0),('614bed2c-2089-11f0-a293-a0294223b12a','5f537bbc-2089-11f0-a293-a0294223b12a','B','?',1),('614bf739-2089-11f0-a293-a0294223b12a','5f537bbc-2089-11f0-a293-a0294223b12a','C','Falso',2),('614c018a-2089-11f0-a293-a0294223b12a','5f537cab-2089-11f0-a293-a0294223b12a','A','Un programa sobre nuevos inventos prácticos',2),('614c0a9c-2089-11f0-a293-a0294223b12a','5f537cab-2089-11f0-a293-a0294223b12a','B','?',1),('614c13bc-2089-11f0-a293-a0294223b12a','5f537cab-2089-11f0-a293-a0294223b12a','C','Un concierto de un artista famoso',0),('614c1d07-2089-11f0-a293-a0294223b12a','5f537d8e-2089-11f0-a293-a0294223b12a','A','Minuto',1),('614c5280-2089-11f0-a293-a0294223b12a','5f537d8e-2089-11f0-a293-a0294223b12a','B','Milisegundo',0),('614c5f5e-2089-11f0-a293-a0294223b12a','5f537d8e-2089-11f0-a293-a0294223b12a','C','Hora',0),('614c6de6-2089-11f0-a293-a0294223b12a','5f537e75-2089-11f0-a293-a0294223b12a','A','Araña',0),('614c8562-2089-11f0-a293-a0294223b12a','5f537e75-2089-11f0-a293-a0294223b12a','B','Gusano',0),('614c9ca5-2089-11f0-a293-a0294223b12a','5f537e75-2089-11f0-a293-a0294223b12a','C','Insecto',1),('614ca736-2089-11f0-a293-a0294223b12a','5f537f5e-2089-11f0-a293-a0294223b12a','A','Cordero',0),('614cb1ea-2089-11f0-a293-a0294223b12a','5f537f5e-2089-11f0-a293-a0294223b12a','B','Pollo',1),('614cc98e-2089-11f0-a293-a0294223b12a','5f537f5e-2089-11f0-a293-a0294223b12a','C','Merluza',0),('614cdeeb-2089-11f0-a293-a0294223b12a','5f53803f-2089-11f0-a293-a0294223b12a','A','Lava',0),('614cf5bb-2089-11f0-a293-a0294223b12a','5f53803f-2089-11f0-a293-a0294223b12a','B','Arena',0),('614d0d63-2089-11f0-a293-a0294223b12a','5f53803f-2089-11f0-a293-a0294223b12a','C','Petróleo',1),('614d2201-2089-11f0-a293-a0294223b12a','5f538122-2089-11f0-a293-a0294223b12a','A','Malo',0),('614d43a5-2089-11f0-a293-a0294223b12a','5f538122-2089-11f0-a293-a0294223b12a','B','Santo',0),('614d5b53-2089-11f0-a293-a0294223b12a','5f538122-2089-11f0-a293-a0294223b12a','C','Óptimo',1),('614d67ae-2089-11f0-a293-a0294223b12a','5f538202-2089-11f0-a293-a0294223b12a','A','Terminal',0),('614d71f2-2089-11f0-a293-a0294223b12a','5f538202-2089-11f0-a293-a0294223b12a','B','Estacional',1),('614d7be2-2089-11f0-a293-a0294223b12a','5f538202-2089-11f0-a293-a0294223b12a','C','Cíclico',0),('614d8774-2089-11f0-a293-a0294223b12a','5f5382e5-2089-11f0-a293-a0294223b12a','A','Gato',0),('614d91b9-2089-11f0-a293-a0294223b12a','5f5382e5-2089-11f0-a293-a0294223b12a','B','Cerca',1),('614d9b9d-2089-11f0-a293-a0294223b12a','5f5382e5-2089-11f0-a293-a0294223b12a','C','Planeta',0),('614da57f-2089-11f0-a293-a0294223b12a','5f5383cb-2089-11f0-a293-a0294223b12a','A','Bueno',1),('614daf38-2089-11f0-a293-a0294223b12a','5f5383cb-2089-11f0-a293-a0294223b12a','B','Erróneo',0),('614db859-2089-11f0-a293-a0294223b12a','5f5383cb-2089-11f0-a293-a0294223b12a','C','Adecuado',0),('614dcdb6-2089-11f0-a293-a0294223b12a','5f5384ae-2089-11f0-a293-a0294223b12a','A','Probable',0),('614dde02-2089-11f0-a293-a0294223b12a','5f5384ae-2089-11f0-a293-a0294223b12a','B','Eventual',1),('614de8d2-2089-11f0-a293-a0294223b12a','5f5384ae-2089-11f0-a293-a0294223b12a','C','Inseguro',0),('614df4c4-2089-11f0-a293-a0294223b12a','5f538598-2089-11f0-a293-a0294223b12a','A','Casual',0),('614dfee2-2089-11f0-a293-a0294223b12a','5f538598-2089-11f0-a293-a0294223b12a','B','Puntual',1),('614e09db-2089-11f0-a293-a0294223b12a','5f538598-2089-11f0-a293-a0294223b12a','C','Incorrecto',0),('614e1507-2089-11f0-a293-a0294223b12a','5f53867f-2089-11f0-a293-a0294223b12a','A','20',0),('614e2048-2089-11f0-a293-a0294223b12a','5f53867f-2089-11f0-a293-a0294223b12a','B','25',1),('614e2b42-2089-11f0-a293-a0294223b12a','5f53867f-2089-11f0-a293-a0294223b12a','C','32',0),('614e357d-2089-11f0-a293-a0294223b12a','5f538762-2089-11f0-a293-a0294223b12a','A','H',1),('614e4033-2089-11f0-a293-a0294223b12a','5f538762-2089-11f0-a293-a0294223b12a','B','K',0),('614e49d5-2089-11f0-a293-a0294223b12a','5f538762-2089-11f0-a293-a0294223b12a','C','J',0),('614e511a-2089-11f0-a293-a0294223b12a','5f538844-2089-11f0-a293-a0294223b12a','A','M',0),('614e5a62-2089-11f0-a293-a0294223b12a','5f538844-2089-11f0-a293-a0294223b12a','B','N',0),('614e6341-2089-11f0-a293-a0294223b12a','5f538844-2089-11f0-a293-a0294223b12a','C','O',1),('614e6ad8-2089-11f0-a293-a0294223b12a','5f538924-2089-11f0-a293-a0294223b12a','A','3 / 4',1),('614e73ad-2089-11f0-a293-a0294223b12a','5f538924-2089-11f0-a293-a0294223b12a','B','4 / 3',0),('614e8b32-2089-11f0-a293-a0294223b12a','5f538924-2089-11f0-a293-a0294223b12a','C','3 / 2',0),('614ea0fa-2089-11f0-a293-a0294223b12a','5f538a0c-2089-11f0-a293-a0294223b12a','A','5',1),('614eaeed-2089-11f0-a293-a0294223b12a','5f538a0c-2089-11f0-a293-a0294223b12a','B','4',0),('614ebcbc-2089-11f0-a293-a0294223b12a','5f538a0c-2089-11f0-a293-a0294223b12a','C','-3',0);
/*!40000 ALTER TABLE `opciones16pf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opcioneskostick`
--

DROP TABLE IF EXISTS `opcioneskostick`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opcioneskostick` (
  `idOpcionKostick` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `idPreguntaKostick` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `opcionKostick` varchar(1) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `descripcionOpcionKostick` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`idOpcionKostick`),
  KEY `idPreguntaKostick` (`idPreguntaKostick`),
  CONSTRAINT `opcioneskostick_ibfk_1` FOREIGN KEY (`idPreguntaKostick`) REFERENCES `preguntaskostick` (`idPreguntaKostick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opcioneskostick`
--

LOCK TABLES `opcioneskostick` WRITE;
/*!40000 ALTER TABLE `opcioneskostick` DISABLE KEYS */;
INSERT INTO `opcioneskostick` VALUES ('a131e448-2088-11f0-a293-a0294223b12a','a0cdfd30-2088-11f0-a293-a0294223b12a','a','Soy trabajador tenaz'),('a132023a-2088-11f0-a293-a0294223b12a','a0cdfd30-2088-11f0-a293-a0294223b12a','b','No soy de humor variable'),('a132054c-2088-11f0-a293-a0294223b12a','a0cf3170-2088-11f0-a293-a0294223b12a','a','Me gusta hacer el trabajo mejor que los demás'),('a1320710-2088-11f0-a293-a0294223b12a','a0cf3170-2088-11f0-a293-a0294223b12a','b','Me gusta seguir con lo que he empezado hasta terminarlo'),('a13208a8-2088-11f0-a293-a0294223b12a','a0cf36b4-2088-11f0-a293-a0294223b12a','a','Me gusta enseñar a la gente como hacer las cosas '),('a1320cd5-2088-11f0-a293-a0294223b12a','a0cf36b4-2088-11f0-a293-a0294223b12a','b','Me gusta hacer las cosas lo mejor posible'),('a132116e-2088-11f0-a293-a0294223b12a','a0cf389b-2088-11f0-a293-a0294223b12a','a','Me gusta hacer cosas graciosas'),('a1321318-2088-11f0-a293-a0294223b12a','a0cf389b-2088-11f0-a293-a0294223b12a','b','Me gusta decir a la gente lo que tiene que hacer'),('a132151c-2088-11f0-a293-a0294223b12a','a0cf39e2-2088-11f0-a293-a0294223b12a','a','Me gusta pertenecer a grupos'),('a1321af1-2088-11f0-a293-a0294223b12a','a0cf39e2-2088-11f0-a293-a0294223b12a','b','Me gusta ser tomado en cuenta en los grupos'),('a1321fbc-2088-11f0-a293-a0294223b12a','a0cf4b35-2088-11f0-a293-a0294223b12a','a','Me gusta hacer un amigo íntimo'),('a1322476-2088-11f0-a293-a0294223b12a','a0cf4b35-2088-11f0-a293-a0294223b12a','b','Me gusta hacer amistad con el grupo'),('a132293d-2088-11f0-a293-a0294223b12a','a0cf4ea0-2088-11f0-a293-a0294223b12a','a','Soy rápido en cambiar cuando lo creo necesario '),('a1322dfb-2088-11f0-a293-a0294223b12a','a0cf4ea0-2088-11f0-a293-a0294223b12a','b','Intento hacer amigos íntimos'),('a13232f9-2088-11f0-a293-a0294223b12a','a0cf5078-2088-11f0-a293-a0294223b12a','a','Me gusta devolverla cuando alguien me ofende'),('a13237c6-2088-11f0-a293-a0294223b12a','a0cf5078-2088-11f0-a293-a0294223b12a','b','Me gusta hacer cosas nuevas o diferentes'),('a1323cc1-2088-11f0-a293-a0294223b12a','a0cf5208-2088-11f0-a293-a0294223b12a','a','Quiero que mi jefe me estime'),('a13241a3-2088-11f0-a293-a0294223b12a','a0cf5208-2088-11f0-a293-a0294223b12a','b','Me gusta decir a la gente cuando están equivocados'),('a132467f-2088-11f0-a293-a0294223b12a','a0cf537b-2088-11f0-a293-a0294223b12a','a','Me gusta seguir las instrucciones que se dan'),('a1324b60-2088-11f0-a293-a0294223b12a','a0cf537b-2088-11f0-a293-a0294223b12a','b','Me gusta agradar a mis superiores'),('a13251b9-2088-11f0-a293-a0294223b12a','a0cf54e5-2088-11f0-a293-a0294223b12a','a','Me esfuerzo mucho'),('a13256b8-2088-11f0-a293-a0294223b12a','a0cf54e5-2088-11f0-a293-a0294223b12a','b','Soy ordenado, pongo todo en su sitio'),('a1325b8b-2088-11f0-a293-a0294223b12a','a0cf5664-2088-11f0-a293-a0294223b12a','a','Consigo que la gente haga lo que yo quiero'),('a132605f-2088-11f0-a293-a0294223b12a','a0cf5664-2088-11f0-a293-a0294223b12a','b','No me altero fácilmente'),('a1326531-2088-11f0-a293-a0294223b12a','a0cf57d9-2088-11f0-a293-a0294223b12a','a','Me gusta decir al grupo lo que tiene que hacer'),('a13269ee-2088-11f0-a293-a0294223b12a','a0cf57d9-2088-11f0-a293-a0294223b12a','b','Siempre continúo un trabajo hasta que este hecho'),('a1326ebc-2088-11f0-a293-a0294223b12a','a0cf5949-2088-11f0-a293-a0294223b12a','a','Me gusta ser animado e interesante'),('a13274d1-2088-11f0-a293-a0294223b12a','a0cf5949-2088-11f0-a293-a0294223b12a','b','Yo quiero tener mucho éxito'),('a13279ba-2088-11f0-a293-a0294223b12a','a0cf5ab4-2088-11f0-a293-a0294223b12a','a','Me gusta ¨encajar¨ con grupos'),('a1327ea3-2088-11f0-a293-a0294223b12a','a0cf5ab4-2088-11f0-a293-a0294223b12a','b','Me gusta ayudar a las personas a tomar decisiones'),('a1328312-2088-11f0-a293-a0294223b12a','a0cf5c12-2088-11f0-a293-a0294223b12a','a','Me preocupa cuando alguien no me estima'),('a13284c1-2088-11f0-a293-a0294223b12a','a0cf5c12-2088-11f0-a293-a0294223b12a','b','Me gusta que la gente note mi presencia'),('a1328972-2088-11f0-a293-a0294223b12a','a0cf5d8d-2088-11f0-a293-a0294223b12a','a','Me gusta probar cosas nuevas'),('a1328e34-2088-11f0-a293-a0294223b12a','a0cf5d8d-2088-11f0-a293-a0294223b12a','b','Prefiero trabajar con otras personas que solo'),('a132928c-2088-11f0-a293-a0294223b12a','a0cf5ef1-2088-11f0-a293-a0294223b12a','a','Algunas veces culpo a otros cuando las cosas salen mal'),('a1329421-2088-11f0-a293-a0294223b12a','a0cf5ef1-2088-11f0-a293-a0294223b12a','b','Me molesta cuando no le gusto a alguien'),('a132988f-2088-11f0-a293-a0294223b12a','a0cf6047-2088-11f0-a293-a0294223b12a','a','Me gusta complacer a mis superiores'),('a1329d59-2088-11f0-a293-a0294223b12a','a0cf6047-2088-11f0-a293-a0294223b12a','b','Me gusta intentar trabajos nuevos y diferentes'),('a132a33f-2088-11f0-a293-a0294223b12a','a0cf61b0-2088-11f0-a293-a0294223b12a','a','Me gusta tener instrucciones detalladas para hacer un trabajo '),('a132a812-2088-11f0-a293-a0294223b12a','a0cf61b0-2088-11f0-a293-a0294223b12a','b','Me gusta decírselo a la gente cuando me enfada'),('a132acdf-2088-11f0-a293-a0294223b12a','a0cf6311-2088-11f0-a293-a0294223b12a','a','Siempre me esfuerzo mucho'),('a132b18f-2088-11f0-a293-a0294223b12a','a0cf6311-2088-11f0-a293-a0294223b12a','b','Me gusta ir paso a paso con gran cuidado'),('a132b650-2088-11f0-a293-a0294223b12a','a0cf6478-2088-11f0-a293-a0294223b12a','a','Soy un buen dirigente'),('a132bafe-2088-11f0-a293-a0294223b12a','a0cf6478-2088-11f0-a293-a0294223b12a','b','Organizo bien el trabajo de un puesto'),('a132bfe8-2088-11f0-a293-a0294223b12a','a0cf6615-2088-11f0-a293-a0294223b12a','a','Me enfado con facilidad'),('a132c52c-2088-11f0-a293-a0294223b12a','a0cf6615-2088-11f0-a293-a0294223b12a','b','Soy lento tomando decisiones'),('a132c9fc-2088-11f0-a293-a0294223b12a','a0cf6787-2088-11f0-a293-a0294223b12a','a','Me gusta trabajar en varias actividades al mismo tiempo'),('a132ceb9-2088-11f0-a293-a0294223b12a','a0cf6787-2088-11f0-a293-a0294223b12a','b','Cuando estoy en grupo me gusta estar callado'),('a132d3b1-2088-11f0-a293-a0294223b12a','a0cf68f4-2088-11f0-a293-a0294223b12a','a','Me encanta que me inviten'),('a132d892-2088-11f0-a293-a0294223b12a','a0cf68f4-2088-11f0-a293-a0294223b12a','b','Me gusta hacer las cosas mejor que los demás'),('a132dd8c-2088-11f0-a293-a0294223b12a','a0cf6a5b-2088-11f0-a293-a0294223b12a','a','Me gusta hacer amigos íntimos'),('a132e253-2088-11f0-a293-a0294223b12a','a0cf6a5b-2088-11f0-a293-a0294223b12a','b','Me gusta aconsejar a los demás'),('a132e722-2088-11f0-a293-a0294223b12a','a0cf6bbd-2088-11f0-a293-a0294223b12a','a','Me gusta hacer cosas nuevas y diferentes'),('a132ebed-2088-11f0-a293-a0294223b12a','a0cf6bbd-2088-11f0-a293-a0294223b12a','b','Me gusta hablar de mis éxitos'),('a132f1bc-2088-11f0-a293-a0294223b12a','a0cf6d22-2088-11f0-a293-a0294223b12a','a','Cuando tengo razón me gusta luchar por ella'),('a132f677-2088-11f0-a293-a0294223b12a','a0cf6d22-2088-11f0-a293-a0294223b12a','b','Me gusta pertenecer a un grupo'),('a132fb45-2088-11f0-a293-a0294223b12a','a0cf6e86-2088-11f0-a293-a0294223b12a','a','Evito ser diferente a los demás'),('a133002c-2088-11f0-a293-a0294223b12a','a0cf6e86-2088-11f0-a293-a0294223b12a','b','Intento acercarme mucho a la gente'),('a133050f-2088-11f0-a293-a0294223b12a','a0cf70a0-2088-11f0-a293-a0294223b12a','a','Me gusta que me digan exactamente como hacer las cosas'),('a13309d8-2088-11f0-a293-a0294223b12a','a0cf70a0-2088-11f0-a293-a0294223b12a','b','Me aburro fácilmente'),('a1330ebe-2088-11f0-a293-a0294223b12a','a0cf724f-2088-11f0-a293-a0294223b12a','a','Trabajo mucho'),('a1331384-2088-11f0-a293-a0294223b12a','a0cf724f-2088-11f0-a293-a0294223b12a','b','Pienso y planeo mucho'),('a1331861-2088-11f0-a293-a0294223b12a','a0cf73bb-2088-11f0-a293-a0294223b12a','a','Me gusta dirigir el grupo'),('a1331d2e-2088-11f0-a293-a0294223b12a','a0cf73bb-2088-11f0-a293-a0294223b12a','b','Los pequeños detalles me interesan'),('a1332211-2088-11f0-a293-a0294223b12a','a0cf752b-2088-11f0-a293-a0294223b12a','a','Tomo decisiones fácil y rápidamente'),('a13326eb-2088-11f0-a293-a0294223b12a','a0cf752b-2088-11f0-a293-a0294223b12a','b','Tengo mis cosas cuidadas y ordenadas'),('a1332bcf-2088-11f0-a293-a0294223b12a','a0cf7678-2088-11f0-a293-a0294223b12a','a','Hago las cosas de prisa'),('a1333099-2088-11f0-a293-a0294223b12a','a0cf7678-2088-11f0-a293-a0294223b12a','b','Yo no me pongo enfadado ni triste a menudo'),('a1333595-2088-11f0-a293-a0294223b12a','a0cf77ca-2088-11f0-a293-a0294223b12a','a','Quiero ser parte del grupo'),('a1333a5f-2088-11f0-a293-a0294223b12a','a0cf77ca-2088-11f0-a293-a0294223b12a','b','Quiero hacer un solo trabajo a un tiempo'),('a1334049-2088-11f0-a293-a0294223b12a','a0cf791d-2088-11f0-a293-a0294223b12a','a','Intento hacer amigos íntimos'),('a1334509-2088-11f0-a293-a0294223b12a','a0cf791d-2088-11f0-a293-a0294223b12a','b','Intento mucho ser el mejor'),('a13349cb-2088-11f0-a293-a0294223b12a','a0cf7a8e-2088-11f0-a293-a0294223b12a','a','Me gustan los nuevos estilos en trajes y coches'),('a1334e85-2088-11f0-a293-a0294223b12a','a0cf7a8e-2088-11f0-a293-a0294223b12a','b','Me gusta ser responsable por otros'),('a1335366-2088-11f0-a293-a0294223b12a','a0cf7bdd-2088-11f0-a293-a0294223b12a','a','Disfruto discutiendo'),('a133582b-2088-11f0-a293-a0294223b12a','a0cf7bdd-2088-11f0-a293-a0294223b12a','b','Me gusta que me pongan atención'),('a1335ce7-2088-11f0-a293-a0294223b12a','a0cf7d32-2088-11f0-a293-a0294223b12a','a','Me gusta agradar a mis superiores'),('a13361a4-2088-11f0-a293-a0294223b12a','a0cf7d32-2088-11f0-a293-a0294223b12a','b','Estoy interesado en ser parte del grupo'),('a1336661-2088-11f0-a293-a0294223b12a','a0cf7e84-2088-11f0-a293-a0294223b12a','a','Me gusta seguir las reglas con cuidado'),('a1336b1c-2088-11f0-a293-a0294223b12a','a0cf7e84-2088-11f0-a293-a0294223b12a','b','Me gusta que la gente me conozca muy bien'),('a1336ff8-2088-11f0-a293-a0294223b12a','a0cf7fe2-2088-11f0-a293-a0294223b12a','a','Me esfuerzo mucho'),('a1337621-2088-11f0-a293-a0294223b12a','a0cf7fe2-2088-11f0-a293-a0294223b12a','b','Soy muy amigable'),('a1337b31-2088-11f0-a293-a0294223b12a','a0cf813d-2088-11f0-a293-a0294223b12a','a','La gente piensa que soy un buen ¨dirigente¨'),('a1337fe1-2088-11f0-a293-a0294223b12a','a0cf813d-2088-11f0-a293-a0294223b12a','b','Pienso con cuidado y largamente'),('a13384b1-2088-11f0-a293-a0294223b12a','a0cf82cb-2088-11f0-a293-a0294223b12a','a','A menudo me arriesgo'),('a1338968-2088-11f0-a293-a0294223b12a','a0cf82cb-2088-11f0-a293-a0294223b12a','b','Me gusta protestar por pequeñas cosas'),('a1338f31-2088-11f0-a293-a0294223b12a','a0cf8425-2088-11f0-a293-a0294223b12a','a','La gente piensa que trabajo de prisa'),('a13393ec-2088-11f0-a293-a0294223b12a','a0cf8425-2088-11f0-a293-a0294223b12a','b','La gente piensa que tengo mis cosas cuidadas'),('a13398ae-2088-11f0-a293-a0294223b12a','a0cf857a-2088-11f0-a293-a0294223b12a','a','Me gusta jugar y hacer deportes'),('a1339d62-2088-11f0-a293-a0294223b12a','a0cf857a-2088-11f0-a293-a0294223b12a','b','Soy muy agradable'),('a133a225-2088-11f0-a293-a0294223b12a','a0cf86d3-2088-11f0-a293-a0294223b12a','a','Me gusta que la gente esté unida y sea amistosa'),('a133a6d7-2088-11f0-a293-a0294223b12a','a0cf86d3-2088-11f0-a293-a0294223b12a','b','Siempre trato de terminar lo que he empezado'),('a133ab9c-2088-11f0-a293-a0294223b12a','a0cf8827-2088-11f0-a293-a0294223b12a','a','Me gusta experimentar y probar nuevas cosas'),('a133b064-2088-11f0-a293-a0294223b12a','a0cf8827-2088-11f0-a293-a0294223b12a','b','Me gusta hacer bien un trabajo difícil'),('a133b558-2088-11f0-a293-a0294223b12a','a0cf8978-2088-11f0-a293-a0294223b12a','a','Me gusta que me traten justamente'),('a133ba1d-2088-11f0-a293-a0294223b12a','a0cf8978-2088-11f0-a293-a0294223b12a','b','Me gusta decir a los demás como hacer las cosas'),('a133bef9-2088-11f0-a293-a0294223b12a','a0cf8ac8-2088-11f0-a293-a0294223b12a','a','Me gusta hacer aquello que esperan de mí'),('a133c3b9-2088-11f0-a293-a0294223b12a','a0cf8ac8-2088-11f0-a293-a0294223b12a','b','Me gusta que me tomen en cuenta'),('a133c8b6-2088-11f0-a293-a0294223b12a','a0cf8c16-2088-11f0-a293-a0294223b12a','a','Me gusta tener instrucciones precisas para hacer un trabajo'),('a133ce1b-2088-11f0-a293-a0294223b12a','a0cf8c16-2088-11f0-a293-a0294223b12a','b','Me gusta estar con la gente'),('a133d327-2088-11f0-a293-a0294223b12a','a0cf8ebc-2088-11f0-a293-a0294223b12a','a','Siempre trato de hacer mi trabajo perfecto'),('a133d7ee-2088-11f0-a293-a0294223b12a','a0cf8ebc-2088-11f0-a293-a0294223b12a','b','Me dicen que prácticamente soy incansable'),('a133ddfd-2088-11f0-a293-a0294223b12a','a0cf901b-2088-11f0-a293-a0294223b12a','a','Soy el tipo dirigente'),('a133e2d0-2088-11f0-a293-a0294223b12a','a0cf901b-2088-11f0-a293-a0294223b12a','b','Hago amigos fácilmente'),('a133e7f6-2088-11f0-a293-a0294223b12a','a0cf916c-2088-11f0-a293-a0294223b12a','a','Asumo riesgos'),('a133ecb9-2088-11f0-a293-a0294223b12a','a0cf916c-2088-11f0-a293-a0294223b12a','b','Pienso mucho'),('a133f2e7-2088-11f0-a293-a0294223b12a','a0cf92bb-2088-11f0-a293-a0294223b12a','a','Trabajo a un paso rápido y constante '),('a133f7b7-2088-11f0-a293-a0294223b12a','a0cf92bb-2088-11f0-a293-a0294223b12a','b','Disfruto trabajando en detalles'),('a133fc8a-2088-11f0-a293-a0294223b12a','a0cf93ff-2088-11f0-a293-a0294223b12a','a','Tengo mucha energía para juegos y deportes'),('a134014a-2088-11f0-a293-a0294223b12a','a0cf93ff-2088-11f0-a293-a0294223b12a','b','Tengo mis cosas cuidadas y ordenadas'),('a134060c-2088-11f0-a293-a0294223b12a','a0cf9566-2088-11f0-a293-a0294223b12a','a','Me llevo bien con todo el mundo'),('a1340ac8-2088-11f0-a293-a0294223b12a','a0cf9566-2088-11f0-a293-a0294223b12a','b','Soy de temperamento estable'),('a1340f99-2088-11f0-a293-a0294223b12a','a0cf96cc-2088-11f0-a293-a0294223b12a','a','Quiero conocer nueva gente y hacer cosas nuevas'),('a1341464-2088-11f0-a293-a0294223b12a','a0cf96cc-2088-11f0-a293-a0294223b12a','b','Siempre quiero terminar el trabajo que he empezado'),('a1341944-2088-11f0-a293-a0294223b12a','a0cf9822-2088-11f0-a293-a0294223b12a','a','Normalmente lucho por lo que yo creo'),('a1341e04-2088-11f0-a293-a0294223b12a','a0cf9822-2088-11f0-a293-a0294223b12a','b','Normalmente me gusta trabajar mucho'),('a134233c-2088-11f0-a293-a0294223b12a','a0cf997f-2088-11f0-a293-a0294223b12a','a','Me gustan las sugerencias de las personas que admiro'),('a134859b-2088-11f0-a293-a0294223b12a','a0cf997f-2088-11f0-a293-a0294223b12a','b','Me gusta estar encargado de otras personas'),('a1348877-2088-11f0-a293-a0294223b12a','a0cf9acf-2088-11f0-a293-a0294223b12a','a','Me dejo influenciar mucho por la gente'),('a1348b01-2088-11f0-a293-a0294223b12a','a0cf9acf-2088-11f0-a293-a0294223b12a','b','Me gusta ser el centro de atención'),('a1348fb3-2088-11f0-a293-a0294223b12a','a0cf9c23-2088-11f0-a293-a0294223b12a','a','Normalmente trabajo mucho'),('a1349514-2088-11f0-a293-a0294223b12a','a0cf9c23-2088-11f0-a293-a0294223b12a','b','Normalmente trabajo de prisa'),('a13499d8-2088-11f0-a293-a0294223b12a','a0cf9d84-2088-11f0-a293-a0294223b12a','a','Cuando hablo el grupo escucha'),('a1349b62-2088-11f0-a293-a0294223b12a','a0cf9d84-2088-11f0-a293-a0294223b12a','b','Soy hábil con herramientas'),('a1349ee7-2088-11f0-a293-a0294223b12a','a0cf9f00-2088-11f0-a293-a0294223b12a','a','Soy lento en hacer amigos'),('a134a390-2088-11f0-a293-a0294223b12a','a0cf9f00-2088-11f0-a293-a0294223b12a','b','Soy lento en decidirme'),('a134a84c-2088-11f0-a293-a0294223b12a','a0cfa06c-2088-11f0-a293-a0294223b12a','a','Normalmente como de prisa'),('a134acf7-2088-11f0-a293-a0294223b12a','a0cfa06c-2088-11f0-a293-a0294223b12a','b','Disfruto leyendo'),('a134b1b4-2088-11f0-a293-a0294223b12a','a0cfa1eb-2088-11f0-a293-a0294223b12a','a','Me gusta el trabajo en donde puedo moverme'),('a134b65a-2088-11f0-a293-a0294223b12a','a0cfa1eb-2088-11f0-a293-a0294223b12a','b','Me gusta el trabajo que tenga que hacerse con cuidado'),('a134bb18-2088-11f0-a293-a0294223b12a','a0cfa382-2088-11f0-a293-a0294223b12a','a','Hago el mayor número posible de amigos'),('a134c059-2088-11f0-a293-a0294223b12a','a0cfa382-2088-11f0-a293-a0294223b12a','b','Encuentro lo que he guardado'),('a134c69f-2088-11f0-a293-a0294223b12a','a0cfa544-2088-11f0-a293-a0294223b12a','a','Planeo a largo plazo'),('a134cb50-2088-11f0-a293-a0294223b12a','a0cfa544-2088-11f0-a293-a0294223b12a','b','Siempre soy agradable'),('a134d02f-2088-11f0-a293-a0294223b12a','a0cfa6cb-2088-11f0-a293-a0294223b12a','a','Tengo gran orgullo de mi buen nombre'),('a134d54a-2088-11f0-a293-a0294223b12a','a0cfa6cb-2088-11f0-a293-a0294223b12a','b','Insisto en un problema hasta que esta resuelto'),('a134da12-2088-11f0-a293-a0294223b12a','a0cfa84a-2088-11f0-a293-a0294223b12a','a','Me gusta agradar a la gente que admiro'),('a134deb5-2088-11f0-a293-a0294223b12a','a0cfa84a-2088-11f0-a293-a0294223b12a','b','Quiero tener éxito'),('a134e222-2088-11f0-a293-a0294223b12a','a0cfa9ad-2088-11f0-a293-a0294223b12a','a','Me gusta que otros tomen decisiones para el grupo'),('a134e654-2088-11f0-a293-a0294223b12a','a0cfa9ad-2088-11f0-a293-a0294223b12a','b','A mi me gusta tomar decisiones para el grupo'),('a134eb23-2088-11f0-a293-a0294223b12a','a0cfab06-2088-11f0-a293-a0294223b12a','a','Siempre me esfuerzo mucho'),('a134efdf-2088-11f0-a293-a0294223b12a','a0cfab06-2088-11f0-a293-a0294223b12a','b','Tomo decisiones fácil y rápidamente'),('a134f4ab-2088-11f0-a293-a0294223b12a','a0cfac79-2088-11f0-a293-a0294223b12a','a','El grupo hace normalmente lo que yo quiero'),('a134f95f-2088-11f0-a293-a0294223b12a','a0cfac79-2088-11f0-a293-a0294223b12a','b','Normalmente tengo prisa'),('a134fe3f-2088-11f0-a293-a0294223b12a','a0cfadde-2088-11f0-a293-a0294223b12a','a','A menudo me siento cansado'),('a1350318-2088-11f0-a293-a0294223b12a','a0cfadde-2088-11f0-a293-a0294223b12a','b','Soy lento tomando decisiones'),('a13507fa-2088-11f0-a293-a0294223b12a','a0cfaf45-2088-11f0-a293-a0294223b12a','a','Trabajo de prisa'),('a1350ccd-2088-11f0-a293-a0294223b12a','a0cfaf45-2088-11f0-a293-a0294223b12a','b','Hago amigos en seguida'),('a13511ca-2088-11f0-a293-a0294223b12a','a0cfb0ef-2088-11f0-a293-a0294223b12a','a','Normalmente tengo energía y vigor'),('a135184f-2088-11f0-a293-a0294223b12a','a0cfb0ef-2088-11f0-a293-a0294223b12a','b','Dedico mucho tiempo a pensar'),('a1351d36-2088-11f0-a293-a0294223b12a','a0cfb254-2088-11f0-a293-a0294223b12a','a','Soy muy cordial con la gente'),('a13521ff-2088-11f0-a293-a0294223b12a','a0cfb254-2088-11f0-a293-a0294223b12a','b','Me gusta el trabajo que requiere precisión'),('a13526e0-2088-11f0-a293-a0294223b12a','a0cfb3c4-2088-11f0-a293-a0294223b12a','a','Pienso y planeo mucho'),('a1352cac-2088-11f0-a293-a0294223b12a','a0cfb3c4-2088-11f0-a293-a0294223b12a','b','Guardo todas las cosas en su sitio'),('a1353196-2088-11f0-a293-a0294223b12a','a0cfb53a-2088-11f0-a293-a0294223b12a','a','Me gusta el trabajo que requiere detalles'),('a1353665-2088-11f0-a293-a0294223b12a','a0cfb53a-2088-11f0-a293-a0294223b12a','b','Tardo en enfadarme'),('a1353b34-2088-11f0-a293-a0294223b12a','a0cfb6b1-2088-11f0-a293-a0294223b12a','a','Me gusta seguir a la gente que admiro'),('a1353ffe-2088-11f0-a293-a0294223b12a','a0cfb6b1-2088-11f0-a293-a0294223b12a','b','Siempre termino el trabajo que he empezado'),('a13544d5-2088-11f0-a293-a0294223b12a','a0cfb828-2088-11f0-a293-a0294223b12a','a','Me gustan las instrucciones claras'),('a1354990-2088-11f0-a293-a0294223b12a','a0cfb828-2088-11f0-a293-a0294223b12a','b','Me gusta trabajar intensamente'),('a1354e5f-2088-11f0-a293-a0294223b12a','a0cfb99c-2088-11f0-a293-a0294223b12a','a','Persigo aquello que deseo'),('a135532c-2088-11f0-a293-a0294223b12a','a0cfb99c-2088-11f0-a293-a0294223b12a','b','Soy un buen ¨dirigente¨'),('a135580f-2088-11f0-a293-a0294223b12a','a0cfbaf4-2088-11f0-a293-a0294223b12a','a','Hago que los demás trabajen mucho'),('a1355d02-2088-11f0-a293-a0294223b12a','a0cfbaf4-2088-11f0-a293-a0294223b12a','b','Soy desenfadado, sin presiones'),('a135635c-2088-11f0-a293-a0294223b12a','a0cfbc52-2088-11f0-a293-a0294223b12a','a','Tomo decisiones rápidas'),('a1356826-2088-11f0-a293-a0294223b12a','a0cfbc52-2088-11f0-a293-a0294223b12a','b','Hablo de prisa'),('a1356cf6-2088-11f0-a293-a0294223b12a','a0cfbda5-2088-11f0-a293-a0294223b12a','a','Normalmente trabajo de prisa'),('a13571ba-2088-11f0-a293-a0294223b12a','a0cfbda5-2088-11f0-a293-a0294223b12a','b','Hago ejercicio con regularidad'),('a1357698-2088-11f0-a293-a0294223b12a','a0cfbf09-2088-11f0-a293-a0294223b12a','a','No me gusta conocer gente'),('a1357b62-2088-11f0-a293-a0294223b12a','a0cfbf09-2088-11f0-a293-a0294223b12a','b','Me canso en seguida'),('a1358045-2088-11f0-a293-a0294223b12a','a0cfc091-2088-11f0-a293-a0294223b12a','a','Hago muchísimos amigos'),('a135852d-2088-11f0-a293-a0294223b12a','a0cfc091-2088-11f0-a293-a0294223b12a','b','Dedico mucho tiempo a pensar'),('a1358a11-2088-11f0-a293-a0294223b12a','a0cfc201-2088-11f0-a293-a0294223b12a','a','Me gusta pensar sobre teoría'),('a1358edc-2088-11f0-a293-a0294223b12a','a0cfc201-2088-11f0-a293-a0294223b12a','b','Me gusta trabajar con detalles'),('a13593b4-2088-11f0-a293-a0294223b12a','a0cfc379-2088-11f0-a293-a0294223b12a','a','Me gusta trabajar con detalles'),('a1359883-2088-11f0-a293-a0294223b12a','a0cfc379-2088-11f0-a293-a0294223b12a','b','Me gusta organizar mi trabajo'),('a1359d62-2088-11f0-a293-a0294223b12a','a0cfc4e0-2088-11f0-a293-a0294223b12a','a','Pongo las cosas en su sitio'),('a135a231-2088-11f0-a293-a0294223b12a','a0cfc4e0-2088-11f0-a293-a0294223b12a','b','Siempre soy agradable'),('a135dbf1-2088-11f0-a293-a0294223b12a','a0cfc64c-2088-11f0-a293-a0294223b12a','a','Me gusta que me digan que he de hacer'),('a135e259-2088-11f0-a293-a0294223b12a','a0cfc64c-2088-11f0-a293-a0294223b12a','b','Tengo que terminar con lo que he empezado');
/*!40000 ALTER TABLE `opcioneskostick` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opcionesotis`
--

DROP TABLE IF EXISTS `opcionesotis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opcionesotis` (
  `idOpcionOtis` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `idPreguntaOtis` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `opcionOtis` int DEFAULT NULL,
  `descripcionOpcion` text COLLATE utf8mb4_general_ci,
  `esCorrecta` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idOpcionOtis`),
  KEY `idPreguntaOtis` (`idPreguntaOtis`),
  CONSTRAINT `opcionesotis_ibfk_1` FOREIGN KEY (`idPreguntaOtis`) REFERENCES `preguntasotis` (`idPreguntaOtis`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opcionesotis`
--

LOCK TABLES `opcionesotis` WRITE;
/*!40000 ALTER TABLE `opcionesotis` DISABLE KEYS */;
INSERT INTO `opcionesotis` VALUES ('9ad42f4c-1508-11f0-90d1-020197ac33d8','951751e8-1508-11f0-90d1-020197ac33d8',1,'Cosa',0),('9ad43bf5-1508-11f0-90d1-020197ac33d8','951751e8-1508-11f0-90d1-020197ac33d8',2,'Mueble',0),('9ad44473-1508-11f0-90d1-020197ac33d8','951751e8-1508-11f0-90d1-020197ac33d8',3,'Arma',0),('9ad44a72-1508-11f0-90d1-020197ac33d8','951751e8-1508-11f0-90d1-020197ac33d8',4,'Herramienta',1),('9ad450bd-1508-11f0-90d1-020197ac33d8','951751e8-1508-11f0-90d1-020197ac33d8',5,'Máquina',0),('9ad55126-1508-11f0-90d1-020197ac33d8','95175528-1508-11f0-90d1-020197ac33d8',1,'Conseguir',0),('9ad55e3c-1508-11f0-90d1-020197ac33d8','95175528-1508-11f0-90d1-020197ac33d8',2,'Decaer',0),('9ad56462-1508-11f0-90d1-020197ac33d8','95175528-1508-11f0-90d1-020197ac33d8',3,'Perder',1),('9ad5698c-1508-11f0-90d1-020197ac33d8','95175528-1508-11f0-90d1-020197ac33d8',4,'Acceder',0),('9ad56cd4-1508-11f0-90d1-020197ac33d8','95175528-1508-11f0-90d1-020197ac33d8',5,'Ensayar',0),('9ad64aa3-1508-11f0-90d1-020197ac33d8','95175649-1508-11f0-90d1-020197ac33d8',1,'La manteca',0),('9ad65198-1508-11f0-90d1-020197ac33d8','95175649-1508-11f0-90d1-020197ac33d8',2,'La harina',0),('9ad65506-1508-11f0-90d1-020197ac33d8','95175649-1508-11f0-90d1-020197ac33d8',3,'Y la leche',0),('9ad658e5-1508-11f0-90d1-020197ac33d8','95175649-1508-11f0-90d1-020197ac33d8',4,'El hombre',1),('9ad65c39-1508-11f0-90d1-020197ac33d8','95175649-1508-11f0-90d1-020197ac33d8',5,'La cosecha',0),('9ad71700-1508-11f0-90d1-020197ac33d8','95175731-1508-11f0-90d1-020197ac33d8',1,'El humo',0),('9ad724f3-1508-11f0-90d1-020197ac33d8','95175731-1508-11f0-90d1-020197ac33d8',2,'La motocicleta',0),('9ad72e06-1508-11f0-90d1-020197ac33d8','95175731-1508-11f0-90d1-020197ac33d8',3,'Las ruedas',0),('9ad734b0-1508-11f0-90d1-020197ac33d8','95175731-1508-11f0-90d1-020197ac33d8',4,'La gasolina',1),('9ad73ace-1508-11f0-90d1-020197ac33d8','95175731-1508-11f0-90d1-020197ac33d8',5,'La bocina',0),('9ad808cc-1508-11f0-90d1-020197ac33d8','951757f9-1508-11f0-90d1-020197ac33d8',1,'35',0),('9ad814f5-1508-11f0-90d1-020197ac33d8','951757f9-1508-11f0-90d1-020197ac33d8',2,'40',1),('9ad81cab-1508-11f0-90d1-020197ac33d8','951757f9-1508-11f0-90d1-020197ac33d8',3,'42',0),('9ad823e2-1508-11f0-90d1-020197ac33d8','951757f9-1508-11f0-90d1-020197ac33d8',4,'45',0),('9ad82cc1-1508-11f0-90d1-020197ac33d8','951757f9-1508-11f0-90d1-020197ac33d8',5,'48',0),('9ad8ea49-1508-11f0-90d1-020197ac33d8','951758d5-1508-11f0-90d1-020197ac33d8',1,'La pierna',1),('9ad8f446-1508-11f0-90d1-020197ac33d8','951758d5-1508-11f0-90d1-020197ac33d8',2,'El pulgar',0),('9ad8fb30-1508-11f0-90d1-020197ac33d8','951758d5-1508-11f0-90d1-020197ac33d8',3,'El dedo',0),('9ad901ee-1508-11f0-90d1-020197ac33d8','951758d5-1508-11f0-90d1-020197ac33d8',4,'El puño',0),('9ad9091c-1508-11f0-90d1-020197ac33d8','951758d5-1508-11f0-90d1-020197ac33d8',5,'La rodilla',0),('9ad9f424-1508-11f0-90d1-020197ac33d8','95175994-1508-11f0-90d1-020197ac33d8',1,'Miente',0),('9ada025d-1508-11f0-90d1-020197ac33d8','95175994-1508-11f0-90d1-020197ac33d8',2,'Bromea',0),('9ada07d4-1508-11f0-90d1-020197ac33d8','95175994-1508-11f0-90d1-020197ac33d8',3,'Engaña',0),('9ada0ddd-1508-11f0-90d1-020197ac33d8','95175994-1508-11f0-90d1-020197ac33d8',4,'Se divierte',0),('9ada1584-1508-11f0-90d1-020197ac33d8','95175994-1508-11f0-90d1-020197ac33d8',5,'Se alaba',1),('9adaffb8-1508-11f0-90d1-020197ac33d8','95175a52-1508-11f0-90d1-020197ac33d8',1,'Seria',0),('9adb0a1e-1508-11f0-90d1-020197ac33d8','95175a52-1508-11f0-90d1-020197ac33d8',2,'Ansiosa',0),('9adb1102-1508-11f0-90d1-020197ac33d8','95175a52-1508-11f0-90d1-020197ac33d8',3,'Trabajadora',0),('9adb1715-1508-11f0-90d1-020197ac33d8','95175a52-1508-11f0-90d1-020197ac33d8',4,'Enérgica',0),('9adb1d53-1508-11f0-90d1-020197ac33d8','95175a52-1508-11f0-90d1-020197ac33d8',5,'Tímida',1),('9adbef5c-1508-11f0-90d1-020197ac33d8','95175b18-1508-11f0-90d1-020197ac33d8',1,'El dedo',1),('9adbf8a9-1508-11f0-90d1-020197ac33d8','95175b18-1508-11f0-90d1-020197ac33d8',2,'La aguja',0),('9adbfee8-1508-11f0-90d1-020197ac33d8','95175b18-1508-11f0-90d1-020197ac33d8',3,'El hilo',0),('9adc04b1-1508-11f0-90d1-020197ac33d8','95175b18-1508-11f0-90d1-020197ac33d8',4,'La mano',0),('9adc0a40-1508-11f0-90d1-020197ac33d8','95175b18-1508-11f0-90d1-020197ac33d8',5,'La costura',0),('9adceb3d-1508-11f0-90d1-020197ac33d8','95175d1e-1508-11f0-90d1-020197ac33d8',1,'Hermano',0),('9adcf293-1508-11f0-90d1-020197ac33d8','95175d1e-1508-11f0-90d1-020197ac33d8',2,'Sobrino',0),('9adcf8d8-1508-11f0-90d1-020197ac33d8','95175d1e-1508-11f0-90d1-020197ac33d8',3,'Primo',1),('9adcfda6-1508-11f0-90d1-020197ac33d8','95175d1e-1508-11f0-90d1-020197ac33d8',4,'Tío',0),('9add03e0-1508-11f0-90d1-020197ac33d8','95175d1e-1508-11f0-90d1-020197ac33d8',5,'Nieto',0),('9ade0b58-1508-11f0-90d1-020197ac33d8','95175e21-1508-11f0-90d1-020197ac33d8',1,'6.456',0),('9ade154e-1508-11f0-90d1-020197ac33d8','95175e21-1508-11f0-90d1-020197ac33d8',2,'8.968',1),('9ade1a48-1508-11f0-90d1-020197ac33d8','95175e21-1508-11f0-90d1-020197ac33d8',3,'4.265',0),('9ade1eac-1508-11f0-90d1-020197ac33d8','95175e21-1508-11f0-90d1-020197ac33d8',4,'5.064',0),('9ade22f7-1508-11f0-90d1-020197ac33d8','95175e21-1508-11f0-90d1-020197ac33d8',5,'4.108',0),('9adf3919-1508-11f0-90d1-020197ac33d8','95175ee5-1508-11f0-90d1-020197ac33d8',1,'Probable',0),('9adf42c8-1508-11f0-90d1-020197ac33d8','95175ee5-1508-11f0-90d1-020197ac33d8',2,'Seguro',1),('9adf4b1b-1508-11f0-90d1-020197ac33d8','95175ee5-1508-11f0-90d1-020197ac33d8',3,'Dudoso',0),('9adf5282-1508-11f0-90d1-020197ac33d8','95175ee5-1508-11f0-90d1-020197ac33d8',4,'Posible',0),('9adf58dc-1508-11f0-90d1-020197ac33d8','95175ee5-1508-11f0-90d1-020197ac33d8',5,'Diferido',0),('9ae05dff-1508-11f0-90d1-020197ac33d8','95175f9f-1508-11f0-90d1-020197ac33d8',1,'Norte',0),('9ae065d5-1508-11f0-90d1-020197ac33d8','95175f9f-1508-11f0-90d1-020197ac33d8',2,'Polo',0),('9ae06a8a-1508-11f0-90d1-020197ac33d8','95175f9f-1508-11f0-90d1-020197ac33d8',3,'Ecuador',0),('9ae0708c-1508-11f0-90d1-020197ac33d8','95175f9f-1508-11f0-90d1-020197ac33d8',4,'Sur',0),('9ae07a87-1508-11f0-90d1-020197ac33d8','95175f9f-1508-11f0-90d1-020197ac33d8',5,'Oeste',1),('9ae162b4-1508-11f0-90d1-020197ac33d8','95176059-1508-11f0-90d1-020197ac33d8',1,'Tristeza',0),('9ae16b4e-1508-11f0-90d1-020197ac33d8','95176059-1508-11f0-90d1-020197ac33d8',2,'Humildad',1),('9ae17137-1508-11f0-90d1-020197ac33d8','95176059-1508-11f0-90d1-020197ac33d8',3,'Pobreza',0),('9ae17716-1508-11f0-90d1-020197ac33d8','95176059-1508-11f0-90d1-020197ac33d8',4,'Variedad',0),('9ae17d6c-1508-11f0-90d1-020197ac33d8','95176059-1508-11f0-90d1-020197ac33d8',5,'Altanería',0),('9ae259c4-1508-11f0-90d1-020197ac33d8','95176108-1508-11f0-90d1-020197ac33d8',1,'Pera',0),('9ae260b5-1508-11f0-90d1-020197ac33d8','95176108-1508-11f0-90d1-020197ac33d8',2,'Plátano',0),('9ae26584-1508-11f0-90d1-020197ac33d8','95176108-1508-11f0-90d1-020197ac33d8',3,'Naranja',0),('9ae269e7-1508-11f0-90d1-020197ac33d8','95176108-1508-11f0-90d1-020197ac33d8',4,'Pelota',1),('9ae26eff-1508-11f0-90d1-020197ac33d8','95176108-1508-11f0-90d1-020197ac33d8',5,'Higo',0),('9ae377ac-1508-11f0-90d1-020197ac33d8','951761cb-1508-11f0-90d1-020197ac33d8',1,'Una cosa redonda que hace tic-tac',0),('9ae37f1e-1508-11f0-90d1-020197ac33d8','951761cb-1508-11f0-90d1-020197ac33d8',2,'Un aparato que se coloca en las torres',0),('9ae383d6-1508-11f0-90d1-020197ac33d8','951761cb-1508-11f0-90d1-020197ac33d8',3,'Un instrumento redondo con una cadena',0),('9ae38a5e-1508-11f0-90d1-020197ac33d8','951761cb-1508-11f0-90d1-020197ac33d8',4,'Un instrumento que mide el tiempo',1),('9ae38eff-1508-11f0-90d1-020197ac33d8','951761cb-1508-11f0-90d1-020197ac33d8',5,'Una cosa redonda que tiene aguja y un cristal',0),('9ae4862d-1508-11f0-90d1-020197ac33d8','9517629a-1508-11f0-90d1-020197ac33d8',1,'7',0),('9ae48dc7-1508-11f0-90d1-020197ac33d8','9517629a-1508-11f0-90d1-020197ac33d8',2,'4',0),('9ae4946f-1508-11f0-90d1-020197ac33d8','9517629a-1508-11f0-90d1-020197ac33d8',3,'11',0),('9ae49afa-1508-11f0-90d1-020197ac33d8','9517629a-1508-11f0-90d1-020197ac33d8',4,'3',1),('9ae4a06c-1508-11f0-90d1-020197ac33d8','9517629a-1508-11f0-90d1-020197ac33d8',5,'10',0),('9ae5777f-1508-11f0-90d1-020197ac33d8','95176370-1508-11f0-90d1-020197ac33d8',1,'A la carrera',0),('9ae57d83-1508-11f0-90d1-020197ac33d8','95176370-1508-11f0-90d1-020197ac33d8',2,'Al caballo',0),('9ae581a3-1508-11f0-90d1-020197ac33d8','95176370-1508-11f0-90d1-020197ac33d8',3,'Al tranvía',0),('9ae584cf-1508-11f0-90d1-020197ac33d8','95176370-1508-11f0-90d1-020197ac33d8',4,'Al tren',0),('9ae5879a-1508-11f0-90d1-020197ac33d8','95176370-1508-11f0-90d1-020197ac33d8',5,'A la bicicleta',1),('9ae69c8f-1508-11f0-90d1-020197ac33d8','95176439-1508-11f0-90d1-020197ac33d8',1,'Con el fin de que los transeúntes sepan en dónde están',0),('9ae6a587-1508-11f0-90d1-020197ac33d8','95176439-1508-11f0-90d1-020197ac33d8',2,'Para que se puedan ver bien los artículos expuestos y la gente sienta deseos de comprar',1),('9ae6abcb-1508-11f0-90d1-020197ac33d8','95176439-1508-11f0-90d1-020197ac33d8',3,'Porque los comercios pagan muy barata la corriente eléctrica',0),('9ae6b109-1508-11f0-90d1-020197ac33d8','95176439-1508-11f0-90d1-020197ac33d8',4,'Para aumentar la iluminación de la calle',0),('9ae6b5ea-1508-11f0-90d1-020197ac33d8','95176439-1508-11f0-90d1-020197ac33d8',5,'Porque el Ayuntamiento les obliga',0),('9ae7ae2f-1508-11f0-90d1-020197ac33d8','95176501-1508-11f0-90d1-020197ac33d8',1,'Semilla',0),('9ae7b79f-1508-11f0-90d1-020197ac33d8','95176501-1508-11f0-90d1-020197ac33d8',2,'Árbol',0),('9ae7be93-1508-11f0-90d1-020197ac33d8','95176501-1508-11f0-90d1-020197ac33d8',3,'Ciruela',1),('9ae7c54a-1508-11f0-90d1-020197ac33d8','95176501-1508-11f0-90d1-020197ac33d8',4,'Jugo',0),('9ae7cc6d-1508-11f0-90d1-020197ac33d8','95176501-1508-11f0-90d1-020197ac33d8',5,'Mondadura',0),('9ae8a7eb-1508-11f0-90d1-020197ac33d8','951765c2-1508-11f0-90d1-020197ac33d8',1,'La J',0),('9ae8afe0-1508-11f0-90d1-020197ac33d8','951765c2-1508-11f0-90d1-020197ac33d8',2,'La G',0),('9ae8b706-1508-11f0-90d1-020197ac33d8','951765c2-1508-11f0-90d1-020197ac33d8',3,'La M',0),('9ae8bc73-1508-11f0-90d1-020197ac33d8','951765c2-1508-11f0-90d1-020197ac33d8',4,'La L',1),('9ae8c21f-1508-11f0-90d1-020197ac33d8','951765c2-1508-11f0-90d1-020197ac33d8',5,'La N',0),('9ae9b1ad-1508-11f0-90d1-020197ac33d8','9517667c-1508-11f0-90d1-020197ac33d8',1,'La Presidencia del Consejo de Ministros',0),('9ae9b989-1508-11f0-90d1-020197ac33d8','9517667c-1508-11f0-90d1-020197ac33d8',2,'El Senado',0),('9ae9bd06-1508-11f0-90d1-020197ac33d8','9517667c-1508-11f0-90d1-020197ac33d8',3,'La República',1),('9ae9c010-1508-11f0-90d1-020197ac33d8','9517667c-1508-11f0-90d1-020197ac33d8',4,'Un Monárquico',0),('9ae9c2e2-1508-11f0-90d1-020197ac33d8','9517667c-1508-11f0-90d1-020197ac33d8',5,'Un republicano',0),('9aeccb4c-1508-11f0-90d1-020197ac33d8','9517672a-1508-11f0-90d1-020197ac33d8',1,'La almohada',0),('9aecd9f6-1508-11f0-90d1-020197ac33d8','9517672a-1508-11f0-90d1-020197ac33d8',2,'El conejo',0),('9aece15a-1508-11f0-90d1-020197ac33d8','9517672a-1508-11f0-90d1-020197ac33d8',3,'El pájaro',1),('9aece873-1508-11f0-90d1-020197ac33d8','9517672a-1508-11f0-90d1-020197ac33d8',4,'La cabra',0),('9aecef8c-1508-11f0-90d1-020197ac33d8','9517672a-1508-11f0-90d1-020197ac33d8',5,'La cama',0),('9aedfc2e-1508-11f0-90d1-020197ac33d8','951767d1-1508-11f0-90d1-020197ac33d8',1,'Un animal terrestre',0),('9aee06e6-1508-11f0-90d1-020197ac33d8','951767d1-1508-11f0-90d1-020197ac33d8',2,'Un ser que tiene cuatro patas y una cola',0),('9aee10f6-1508-11f0-90d1-020197ac33d8','951767d1-1508-11f0-90d1-020197ac33d8',3,'Un animal pequeño y avispado',0),('9aee1658-1508-11f0-90d1-020197ac33d8','951767d1-1508-11f0-90d1-020197ac33d8',4,'Un carnero joven',1),('9aee1ad2-1508-11f0-90d1-020197ac33d8','951767d1-1508-11f0-90d1-020197ac33d8',5,'Un animalito que come hierba',0),('9aef06b3-1508-11f0-90d1-020197ac33d8','95176888-1508-11f0-90d1-020197ac33d8',1,'Suave',0),('9aef0f32-1508-11f0-90d1-020197ac33d8','95176888-1508-11f0-90d1-020197ac33d8',2,'Pequeño',0),('9aef1646-1508-11f0-90d1-020197ac33d8','95176888-1508-11f0-90d1-020197ac33d8',3,'Macizo',0),('9aef1f75-1508-11f0-90d1-020197ac33d8','95176888-1508-11f0-90d1-020197ac33d8',4,'Gris',0),('9aef2871-1508-11f0-90d1-020197ac33d8','95176888-1508-11f0-90d1-020197ac33d8',5,'Ruido',1),('9af00db6-1508-11f0-90d1-020197ac33d8','95176949-1508-11f0-90d1-020197ac33d8',1,'Muy bueno',0),('9af018b4-1508-11f0-90d1-020197ac33d8','95176949-1508-11f0-90d1-020197ac33d8',2,'Mediano',0),('9af01da8-1508-11f0-90d1-020197ac33d8','95176949-1508-11f0-90d1-020197ac33d8',3,'Malo',1),('9af02215-1508-11f0-90d1-020197ac33d8','95176949-1508-11f0-90d1-020197ac33d8',4,'Nulo',0),('9af0265e-1508-11f0-90d1-020197ac33d8','95176949-1508-11f0-90d1-020197ac33d8',5,'Superior',0),('9af12645-1508-11f0-90d1-020197ac33d8','95176a16-1508-11f0-90d1-020197ac33d8',1,'Billete',0),('9af12ff5-1508-11f0-90d1-020197ac33d8','95176a16-1508-11f0-90d1-020197ac33d8',2,'Hueso',0),('9af1364f-1508-11f0-90d1-020197ac33d8','95176a16-1508-11f0-90d1-020197ac33d8',3,'Cuerda',0),('9af13b9b-1508-11f0-90d1-020197ac33d8','95176a16-1508-11f0-90d1-020197ac33d8',4,'Lápiz',0),('9af1420d-1508-11f0-90d1-020197ac33d8','95176a16-1508-11f0-90d1-020197ac33d8',5,'Llave',1),('9af28a30-1508-11f0-90d1-020197ac33d8','95176ad2-1508-11f0-90d1-020197ac33d8',1,'Rabia',0),('9af296cc-1508-11f0-90d1-020197ac33d8','95176ad2-1508-11f0-90d1-020197ac33d8',2,'Piedad',1),('9af29bdf-1508-11f0-90d1-020197ac33d8','95176ad2-1508-11f0-90d1-020197ac33d8',3,'Desprecio',0),('9af2a18b-1508-11f0-90d1-020197ac33d8','95176ad2-1508-11f0-90d1-020197ac33d8',4,'Desdén',0),('9af2ae33-1508-11f0-90d1-020197ac33d8','95176ad2-1508-11f0-90d1-020197ac33d8',5,'Añoranza',0),('9af3bfa8-1508-11f0-90d1-020197ac33d8','95176ba8-1508-11f0-90d1-020197ac33d8',1,'Exploración',0),('9af3c80a-1508-11f0-90d1-020197ac33d8','95176ba8-1508-11f0-90d1-020197ac33d8',2,'Adaptación',0),('9af3ce56-1508-11f0-90d1-020197ac33d8','95176ba8-1508-11f0-90d1-020197ac33d8',3,'Renovación',0),('9af3d441-1508-11f0-90d1-020197ac33d8','95176ba8-1508-11f0-90d1-020197ac33d8',4,'Novedad',0),('9af3dbc5-1508-11f0-90d1-020197ac33d8','95176ba8-1508-11f0-90d1-020197ac33d8',5,'Invención',1),('9af4cfcb-1508-11f0-90d1-020197ac33d8','95176c72-1508-11f0-90d1-020197ac33d8',1,'Vuelo',0),('9af4d959-1508-11f0-90d1-020197ac33d8','95176c72-1508-11f0-90d1-020197ac33d8',2,'Miel',0),('9af4df25-1508-11f0-90d1-020197ac33d8','95176c72-1508-11f0-90d1-020197ac33d8',3,'Alas',0),('9af4e49a-1508-11f0-90d1-020197ac33d8','95176c72-1508-11f0-90d1-020197ac33d8',4,'Cera',0),('9af4ec58-1508-11f0-90d1-020197ac33d8','95176c72-1508-11f0-90d1-020197ac33d8',5,'Aguijón',1),('9af5ebeb-1508-11f0-90d1-020197ac33d8','95176d32-1508-11f0-90d1-020197ac33d8',1,'7',1),('9af5f156-1508-11f0-90d1-020197ac33d8','95176d32-1508-11f0-90d1-020197ac33d8',2,'6',0),('9af5f49e-1508-11f0-90d1-020197ac33d8','95176d32-1508-11f0-90d1-020197ac33d8',3,'5',0),('9af5f783-1508-11f0-90d1-020197ac33d8','95176d32-1508-11f0-90d1-020197ac33d8',4,'8',0),('9af5fa4b-1508-11f0-90d1-020197ac33d8','95176d32-1508-11f0-90d1-020197ac33d8',5,'9',0),('9af72e9d-1508-11f0-90d1-020197ac33d8','95176df2-1508-11f0-90d1-020197ac33d8',1,'Los caballos son cada día más escasos',0),('9af73973-1508-11f0-90d1-020197ac33d8','95176df2-1508-11f0-90d1-020197ac33d8',2,'Los caballos se desbocan fácilmente',0),('9af74018-1508-11f0-90d1-020197ac33d8','95176df2-1508-11f0-90d1-020197ac33d8',3,'Los autos nos hacen ganar tiempo',1),('9af74677-1508-11f0-90d1-020197ac33d8','95176df2-1508-11f0-90d1-020197ac33d8',4,'Los autos son más económicos que los carros',0),('9af74ce1-1508-11f0-90d1-020197ac33d8','95176df2-1508-11f0-90d1-020197ac33d8',5,'Las reparaciones de los autos son más baratas que las de los carros',0),('9af89095-1508-11f0-90d1-020197ac33d8','95176eb6-1508-11f0-90d1-020197ac33d8',1,'La manzana',0),('9af89d2c-1508-11f0-90d1-020197ac33d8','95176eb6-1508-11f0-90d1-020197ac33d8',2,'El huevo',1),('9af8a4f3-1508-11f0-90d1-020197ac33d8','95176eb6-1508-11f0-90d1-020197ac33d8',3,'El jugo',0),('9af8ab7c-1508-11f0-90d1-020197ac33d8','95176eb6-1508-11f0-90d1-020197ac33d8',4,'El melocotón',0),('9af8b406-1508-11f0-90d1-020197ac33d8','95176eb6-1508-11f0-90d1-020197ac33d8',5,'La gallina',0),('9af9c265-1508-11f0-90d1-020197ac33d8','95176f7c-1508-11f0-90d1-020197ac33d8',1,'Juez',0),('9af9cc5d-1508-11f0-90d1-020197ac33d8','95176f7c-1508-11f0-90d1-020197ac33d8',2,'Hospicio',0),('9af9d2e0-1508-11f0-90d1-020197ac33d8','95176f7c-1508-11f0-90d1-020197ac33d8',3,'Doctor',0),('9af9d795-1508-11f0-90d1-020197ac33d8','95176f7c-1508-11f0-90d1-020197ac33d8',4,'Presidio',1),('9af9dcbd-1508-11f0-90d1-020197ac33d8','95176f7c-1508-11f0-90d1-020197ac33d8',5,'Sentencia',0),('9afc88fa-1508-11f0-90d1-020197ac33d8','95177056-1508-11f0-90d1-020197ac33d8',1,'La S',0),('9afc9698-1508-11f0-90d1-020197ac33d8','95177056-1508-11f0-90d1-020197ac33d8',2,'La N',0),('9afc9c5b-1508-11f0-90d1-020197ac33d8','95177056-1508-11f0-90d1-020197ac33d8',3,'La O',1),('9afca19e-1508-11f0-90d1-020197ac33d8','95177056-1508-11f0-90d1-020197ac33d8',4,'La D',0),('9afca6b1-1508-11f0-90d1-020197ac33d8','95177056-1508-11f0-90d1-020197ac33d8',5,'La C',0),('9afd9734-1508-11f0-90d1-020197ac33d8','9517711e-1508-11f0-90d1-020197ac33d8',1,'10',1),('9afda0dd-1508-11f0-90d1-020197ac33d8','9517711e-1508-11f0-90d1-020197ac33d8',2,'5',0),('9afda4fe-1508-11f0-90d1-020197ac33d8','9517711e-1508-11f0-90d1-020197ac33d8',3,'8',0),('9afda841-1508-11f0-90d1-020197ac33d8','9517711e-1508-11f0-90d1-020197ac33d8',4,'3',0),('9afdab52-1508-11f0-90d1-020197ac33d8','9517711e-1508-11f0-90d1-020197ac33d8',5,'25',0),('9afea0ee-1508-11f0-90d1-020197ac33d8','951771e6-1508-11f0-90d1-020197ac33d8',1,'Se va',0),('9afea8d3-1508-11f0-90d1-020197ac33d8','951771e6-1508-11f0-90d1-020197ac33d8',2,'Decrece',1),('9afeb0cf-1508-11f0-90d1-020197ac33d8','951771e6-1508-11f0-90d1-020197ac33d8',3,'Se agota',0),('9afeb4cd-1508-11f0-90d1-020197ac33d8','951771e6-1508-11f0-90d1-020197ac33d8',4,'Muere',0),('9afeb83c-1508-11f0-90d1-020197ac33d8','951771e6-1508-11f0-90d1-020197ac33d8',5,'Desaparece',0),('9afffbde-1508-11f0-90d1-020197ac33d8','95177333-1508-11f0-90d1-020197ac33d8',1,'Hay oro que no brilla',0),('9b0002e5-1508-11f0-90d1-020197ac33d8','95177333-1508-11f0-90d1-020197ac33d8',2,'No hay que dejarse llevar por las apariencias',1),('9b0006ce-1508-11f0-90d1-020197ac33d8','95177333-1508-11f0-90d1-020197ac33d8',3,'El diamante es más brillante que el oro',0),('9b000a58-1508-11f0-90d1-020197ac33d8','95177333-1508-11f0-90d1-020197ac33d8',4,'No hay que llevar bisutería que imite al oro',0),('9b000ea4-1508-11f0-90d1-020197ac33d8','95177333-1508-11f0-90d1-020197ac33d8',5,'Hay gentes a quienes gusta ostentar su riqueza',0),('9b00ffbc-1508-11f0-90d1-020197ac33d8','951773f7-1508-11f0-90d1-020197ac33d8',1,'La D',1),('9b0106f2-1508-11f0-90d1-020197ac33d8','951773f7-1508-11f0-90d1-020197ac33d8',2,'La K',0),('9b010b29-1508-11f0-90d1-020197ac33d8','951773f7-1508-11f0-90d1-020197ac33d8',3,'La M',0),('9b010f83-1508-11f0-90d1-020197ac33d8','951773f7-1508-11f0-90d1-020197ac33d8',4,'La S',0),('9b01131e-1508-11f0-90d1-020197ac33d8','951773f7-1508-11f0-90d1-020197ac33d8',5,'La C',0),('9b021c8b-1508-11f0-90d1-020197ac33d8','951774bb-1508-11f0-90d1-020197ac33d8',1,'Es preferible poseer una pequeña cosa que esperar una grande',1),('9b022309-1508-11f0-90d1-020197ac33d8','951774bb-1508-11f0-90d1-020197ac33d8',2,'El corazón fuerte no se deja rendir por la lisonja',0),('9b0226d7-1508-11f0-90d1-020197ac33d8','951774bb-1508-11f0-90d1-020197ac33d8',3,'Ningún hombre suele apartarse de la verdad sin engañarse a sí mismo',0),('9b022b02-1508-11f0-90d1-020197ac33d8','951774bb-1508-11f0-90d1-020197ac33d8',4,'El que está en todas partes no está en ninguna',0),('9b022ef9-1508-11f0-90d1-020197ac33d8','951774bb-1508-11f0-90d1-020197ac33d8',5,'Cuando se tiene una cosa hay que procurar conservarla',0),('9b02fa52-1508-11f0-90d1-020197ac33d8','95177587-1508-11f0-90d1-020197ac33d8',1,'Retoño',0),('9b0304e4-1508-11f0-90d1-020197ac33d8','95177587-1508-11f0-90d1-020197ac33d8',2,'Hoja',0),('9b0311c0-1508-11f0-90d1-020197ac33d8','95177587-1508-11f0-90d1-020197ac33d8',3,'Árbol',1),('9b0317f1-1508-11f0-90d1-020197ac33d8','95177587-1508-11f0-90d1-020197ac33d8',4,'Rama',0),('9b031e6a-1508-11f0-90d1-020197ac33d8','95177587-1508-11f0-90d1-020197ac33d8',5,'Tronco',0),('9b0408af-1508-11f0-90d1-020197ac33d8','95177645-1508-11f0-90d1-020197ac33d8',1,'La D',0),('9b040e80-1508-11f0-90d1-020197ac33d8','95177645-1508-11f0-90d1-020197ac33d8',2,'La Q',1),('9b04121e-1508-11f0-90d1-020197ac33d8','95177645-1508-11f0-90d1-020197ac33d8',3,'La A',0),('9b04156e-1508-11f0-90d1-020197ac33d8','95177645-1508-11f0-90d1-020197ac33d8',4,'La C',0),('9b0418ba-1508-11f0-90d1-020197ac33d8','95177645-1508-11f0-90d1-020197ac33d8',5,'La Y',0),('9b04edd5-1508-11f0-90d1-020197ac33d8','95177708-1508-11f0-90d1-020197ac33d8',1,'Mayor',1),('9b04f5ce-1508-11f0-90d1-020197ac33d8','95177708-1508-11f0-90d1-020197ac33d8',2,'Más pequeño',0),('9b04faaa-1508-11f0-90d1-020197ac33d8','95177708-1508-11f0-90d1-020197ac33d8',3,'Iguales',0),('9b04fe39-1508-11f0-90d1-020197ac33d8','95177708-1508-11f0-90d1-020197ac33d8',4,'No se puede saber',0),('9b050167-1508-11f0-90d1-020197ac33d8','95177708-1508-11f0-90d1-020197ac33d8',5,'Ninguna de las anteriores',0),('9b05c24e-1508-11f0-90d1-020197ac33d8','951777d1-1508-11f0-90d1-020197ac33d8',1,'Raspador',0),('9b05c7c9-1508-11f0-90d1-020197ac33d8','951777d1-1508-11f0-90d1-020197ac33d8',2,'Queso',0),('9b05cb2f-1508-11f0-90d1-020197ac33d8','951777d1-1508-11f0-90d1-020197ac33d8',3,'Gruta',1),('9b05ce39-1508-11f0-90d1-020197ac33d8','951777d1-1508-11f0-90d1-020197ac33d8',4,'Noche',0),('9b05d11c-1508-11f0-90d1-020197ac33d8','951777d1-1508-11f0-90d1-020197ac33d8',5,'Pintura',0),('9b06c470-1508-11f0-90d1-020197ac33d8','95177895-1508-11f0-90d1-020197ac33d8',1,'La G',0),('9b06ca73-1508-11f0-90d1-020197ac33d8','95177895-1508-11f0-90d1-020197ac33d8',2,'La T',1),('9b06ce2f-1508-11f0-90d1-020197ac33d8','95177895-1508-11f0-90d1-020197ac33d8',3,'La S',0),('9b06d18c-1508-11f0-90d1-020197ac33d8','95177895-1508-11f0-90d1-020197ac33d8',4,'La C',0),('9b06d4e1-1508-11f0-90d1-020197ac33d8','95177895-1508-11f0-90d1-020197ac33d8',5,'La A',0),('9b07d956-1508-11f0-90d1-020197ac33d8','95177968-1508-11f0-90d1-020197ac33d8',1,'Resuélvete a hacer lo que debes y haz sin falta lo que hayas resuelto',0),('9b07e01a-1508-11f0-90d1-020197ac33d8','95177968-1508-11f0-90d1-020197ac33d8',2,'Hay que ganarse la vida a fuerza de amor',0),('9b07e66b-1508-11f0-90d1-020197ac33d8','95177968-1508-11f0-90d1-020197ac33d8',3,'No se deben menospreciar las cosas pequeñas',1),('9b07ec48-1508-11f0-90d1-020197ac33d8','95177968-1508-11f0-90d1-020197ac33d8',4,'En casa pobre no es necesario granero',0),('9b07f259-1508-11f0-90d1-020197ac33d8','95177968-1508-11f0-90d1-020197ac33d8',5,'Las personas deben ayudarse unas a otras',0),('9b08db38-1508-11f0-90d1-020197ac33d8','95177a1e-1508-11f0-90d1-020197ac33d8',1,'Carlos es mayor que Juan',0),('9b08e2ff-1508-11f0-90d1-020197ac33d8','95177a1e-1508-11f0-90d1-020197ac33d8',2,'Juan y Carlos tienen la misma edad',0),('9b08e792-1508-11f0-90d1-020197ac33d8','95177a1e-1508-11f0-90d1-020197ac33d8',3,'Carlos es más joven que Juan',1),('9b08eb94-1508-11f0-90d1-020197ac33d8','95177a1e-1508-11f0-90d1-020197ac33d8',4,'Juan es menor que Carlos',0),('9b08ef29-1508-11f0-90d1-020197ac33d8','95177a1e-1508-11f0-90d1-020197ac33d8',5,'José es el menor de los tres',0),('9b0b4476-1508-11f0-90d1-020197ac33d8','95177ace-1508-11f0-90d1-020197ac33d8',1,'La T',1),('9b0b4ae6-1508-11f0-90d1-020197ac33d8','95177ace-1508-11f0-90d1-020197ac33d8',2,'La P',0),('9b0b4eb8-1508-11f0-90d1-020197ac33d8','95177ace-1508-11f0-90d1-020197ac33d8',3,'La D',0),('9b0b521d-1508-11f0-90d1-020197ac33d8','95177ace-1508-11f0-90d1-020197ac33d8',4,'La B',0),('9b0b561a-1508-11f0-90d1-020197ac33d8','95177ace-1508-11f0-90d1-020197ac33d8',5,'La S',0),('9b0c2755-1508-11f0-90d1-020197ac33d8','95177b89-1508-11f0-90d1-020197ac33d8',1,'10',0),('9b0c2d01-1508-11f0-90d1-020197ac33d8','95177b89-1508-11f0-90d1-020197ac33d8',2,'12',0),('9b0c308e-1508-11f0-90d1-020197ac33d8','95177b89-1508-11f0-90d1-020197ac33d8',3,'13',1),('9b0c3398-1508-11f0-90d1-020197ac33d8','95177b89-1508-11f0-90d1-020197ac33d8',4,'15',0),('9b0c369c-1508-11f0-90d1-020197ac33d8','95177b89-1508-11f0-90d1-020197ac33d8',5,'8',0),('9b0d22eb-1508-11f0-90d1-020197ac33d8','95177c3d-1508-11f0-90d1-020197ac33d8',1,'Un error',0),('9b0d2bbe-1508-11f0-90d1-020197ac33d8','95177c3d-1508-11f0-90d1-020197ac33d8',2,'Una afirmación voluntariamente falsa',1),('9b0d321f-1508-11f0-90d1-020197ac33d8','95177c3d-1508-11f0-90d1-020197ac33d8',3,'Una afirmación involuntariamente falsa',0),('9b0d359b-1508-11f0-90d1-020197ac33d8','95177c3d-1508-11f0-90d1-020197ac33d8',4,'Una exageración',0),('9b0d3896-1508-11f0-90d1-020197ac33d8','95177c3d-1508-11f0-90d1-020197ac33d8',5,'Una respuesta inexacta',0),('9b0e11bb-1508-11f0-90d1-020197ac33d8','95177cc3-1508-11f0-90d1-020197ac33d8',1,'La M',0),('9b0e1857-1508-11f0-90d1-020197ac33d8','95177cc3-1508-11f0-90d1-020197ac33d8',2,'La Y',0),('9b0e1c21-1508-11f0-90d1-020197ac33d8','95177cc3-1508-11f0-90d1-020197ac33d8',3,'La S',0),('9b0e1f4b-1508-11f0-90d1-020197ac33d8','95177cc3-1508-11f0-90d1-020197ac33d8',4,'La G',1),('9b0e225f-1508-11f0-90d1-020197ac33d8','95177cc3-1508-11f0-90d1-020197ac33d8',5,'La P',0),('9b0edfbc-1508-11f0-90d1-020197ac33d8','95177d2f-1508-11f0-90d1-020197ac33d8',1,'Permanente',1),('9b0ee4f4-1508-11f0-90d1-020197ac33d8','95177d2f-1508-11f0-90d1-020197ac33d8',2,'Firme',0),('9b0ee893-1508-11f0-90d1-020197ac33d8','95177d2f-1508-11f0-90d1-020197ac33d8',3,'Estacionaria',0),('9b0eebe0-1508-11f0-90d1-020197ac33d8','95177d2f-1508-11f0-90d1-020197ac33d8',4,'Sólida',0),('9b0eef1f-1508-11f0-90d1-020197ac33d8','95177d2f-1508-11f0-90d1-020197ac33d8',5,'Verdadera',0),('9b0fc365-1508-11f0-90d1-020197ac33d8','95177f9c-1508-11f0-90d1-020197ac33d8',1,'Andrés es mayor que Luis',1),('9b0fcac6-1508-11f0-90d1-020197ac33d8','95177f9c-1508-11f0-90d1-020197ac33d8',2,'Pablo es el más joven',0),('9b0fcfeb-1508-11f0-90d1-020197ac33d8','95177f9c-1508-11f0-90d1-020197ac33d8',3,'Andrés y Luis tienen la misma edad',0),('9b0fd8d6-1508-11f0-90d1-020197ac33d8','95177f9c-1508-11f0-90d1-020197ac33d8',4,'El mayor de todos es Luis',0),('9b0fdf45-1508-11f0-90d1-020197ac33d8','95177f9c-1508-11f0-90d1-020197ac33d8',5,'Pablo es mayor que Andrés',0),('9b10ccb5-1508-11f0-90d1-020197ac33d8','95178073-1508-11f0-90d1-020197ac33d8',1,'Árbol',0),('9b10d354-1508-11f0-90d1-020197ac33d8','95178073-1508-11f0-90d1-020197ac33d8',2,'Muñeca',0),('9b10d7e3-1508-11f0-90d1-020197ac33d8','95178073-1508-11f0-90d1-020197ac33d8',3,'Carnero',1),('9b10db45-1508-11f0-90d1-020197ac33d8','95178073-1508-11f0-90d1-020197ac33d8',4,'Pluma',0),('9b10de5c-1508-11f0-90d1-020197ac33d8','95178073-1508-11f0-90d1-020197ac33d8',5,'Pie',0),('9b11c63b-1508-11f0-90d1-020197ac33d8','95178144-1508-11f0-90d1-020197ac33d8',1,'El hierro batido en frío, es malo',0),('9b11cbac-1508-11f0-90d1-020197ac33d8','95178144-1508-11f0-90d1-020197ac33d8',2,'No se pueden hacer varias cosas a mismo tiempo',0),('9b11cf55-1508-11f0-90d1-020197ac33d8','95178144-1508-11f0-90d1-020197ac33d8',3,'Hay que saber aprovechar el momento oportuno',1),('9b11d2b8-1508-11f0-90d1-020197ac33d8','95178144-1508-11f0-90d1-020197ac33d8',4,'Los herreros han de trabajar siempre de prisa',0),('9b11d5fc-1508-11f0-90d1-020197ac33d8','95178144-1508-11f0-90d1-020197ac33d8',5,'El trabajo del hierro es cansado',0),('9b12a42a-1508-11f0-90d1-020197ac33d8','951781ef-1508-11f0-90d1-020197ac33d8',1,'La S',0),('9b12aa56-1508-11f0-90d1-020197ac33d8','951781ef-1508-11f0-90d1-020197ac33d8',2,'La M',0),('9b12af49-1508-11f0-90d1-020197ac33d8','951781ef-1508-11f0-90d1-020197ac33d8',3,'La H',0),('9b12b39c-1508-11f0-90d1-020197ac33d8','951781ef-1508-11f0-90d1-020197ac33d8',4,'La D',1),('9b12b7bc-1508-11f0-90d1-020197ac33d8','951781ef-1508-11f0-90d1-020197ac33d8',5,'La A',0),('9b13677c-1508-11f0-90d1-020197ac33d8','9517828f-1508-11f0-90d1-020197ac33d8',1,'El estado',0),('9b136cf3-1508-11f0-90d1-020197ac33d8','9517828f-1508-11f0-90d1-020197ac33d8',2,'La provincia',0),('9b1371d9-1508-11f0-90d1-020197ac33d8','9517828f-1508-11f0-90d1-020197ac33d8',3,'La ciudad',1),('9b137650-1508-11f0-90d1-020197ac33d8','9517828f-1508-11f0-90d1-020197ac33d8',4,'El patrón',0),('9b137a75-1508-11f0-90d1-020197ac33d8','9517828f-1508-11f0-90d1-020197ac33d8',5,'El juez',0),('9b143ed5-1508-11f0-90d1-020197ac33d8','95178324-1508-11f0-90d1-020197ac33d8',1,'1',0),('9b144477-1508-11f0-90d1-020197ac33d8','95178324-1508-11f0-90d1-020197ac33d8',2,'2',0),('9b1448eb-1508-11f0-90d1-020197ac33d8','95178324-1508-11f0-90d1-020197ac33d8',3,'3',1),('9b144cff-1508-11f0-90d1-020197ac33d8','95178324-1508-11f0-90d1-020197ac33d8',4,'6',0),('9b1452be-1508-11f0-90d1-020197ac33d8','95178324-1508-11f0-90d1-020197ac33d8',5,'5',0),('9b1509d7-1508-11f0-90d1-020197ac33d8','951783c4-1508-11f0-90d1-020197ac33d8',1,'Promesa',0),('9b15117a-1508-11f0-90d1-020197ac33d8','951783c4-1508-11f0-90d1-020197ac33d8',2,'Debate',0),('9b1515d3-1508-11f0-90d1-020197ac33d8','951783c4-1508-11f0-90d1-020197ac33d8',3,'Amnistía',0),('9b151953-1508-11f0-90d1-020197ac33d8','951783c4-1508-11f0-90d1-020197ac33d8',4,'Proceso',0),('9b151e0d-1508-11f0-90d1-020197ac33d8','951783c4-1508-11f0-90d1-020197ac33d8',5,'Avenencia',1),('9b15f244-1508-11f0-90d1-020197ac33d8','95178466-1508-11f0-90d1-020197ac33d8',1,'La E',0),('9b15f88d-1508-11f0-90d1-020197ac33d8','95178466-1508-11f0-90d1-020197ac33d8',2,'La F',0),('9b15fc42-1508-11f0-90d1-020197ac33d8','95178466-1508-11f0-90d1-020197ac33d8',3,'La L',0),('9b15ff90-1508-11f0-90d1-020197ac33d8','95178466-1508-11f0-90d1-020197ac33d8',4,'La S',1),('9b1602aa-1508-11f0-90d1-020197ac33d8','95178466-1508-11f0-90d1-020197ac33d8',5,'La D',0),('9b16d20e-1508-11f0-90d1-020197ac33d8','95178608-1508-11f0-90d1-020197ac33d8',1,'2',0),('9b16d8fc-1508-11f0-90d1-020197ac33d8','95178608-1508-11f0-90d1-020197ac33d8',2,'3',0),('9b16de90-1508-11f0-90d1-020197ac33d8','95178608-1508-11f0-90d1-020197ac33d8',3,'4',1),('9b16e245-1508-11f0-90d1-020197ac33d8','95178608-1508-11f0-90d1-020197ac33d8',4,'5',0),('9b16e5a7-1508-11f0-90d1-020197ac33d8','95178608-1508-11f0-90d1-020197ac33d8',5,'6',0),('9b17bd47-1508-11f0-90d1-020197ac33d8','95178716-1508-11f0-90d1-020197ac33d8',1,'Un tubo de cristal graduado que contiene mercurio',0),('9b17c3ed-1508-11f0-90d1-020197ac33d8','95178716-1508-11f0-90d1-020197ac33d8',2,'Un instrumento para medir la fiebre',0),('9b17c7a3-1508-11f0-90d1-020197ac33d8','95178716-1508-11f0-90d1-020197ac33d8',3,'Un aparato muy sensible a calor',0),('9b17cae1-1508-11f0-90d1-020197ac33d8','95178716-1508-11f0-90d1-020197ac33d8',4,'Un instrumento para medir la temperatura',1),('9b17cdf9-1508-11f0-90d1-020197ac33d8','95178716-1508-11f0-90d1-020197ac33d8',5,'Un objeto que utilizan los médicos',0),('9b189b94-1508-11f0-90d1-020197ac33d8','9517892e-1508-11f0-90d1-020197ac33d8',1,'Bravo',1),('9b18a4dd-1508-11f0-90d1-020197ac33d8','9517892e-1508-11f0-90d1-020197ac33d8',2,'Busto',0),('9b18aae5-1508-11f0-90d1-020197ac33d8','9517892e-1508-11f0-90d1-020197ac33d8',3,'Brocha',0),('9b18b0c2-1508-11f0-90d1-020197ac33d8','9517892e-1508-11f0-90d1-020197ac33d8',4,'Bujía',0),('9b18b63b-1508-11f0-90d1-020197ac33d8','9517892e-1508-11f0-90d1-020197ac33d8',5,'Bretón',0),('9b1b7138-1508-11f0-90d1-020197ac33d8','951789fd-1508-11f0-90d1-020197ac33d8',1,'10',0),('9b1b7b7b-1508-11f0-90d1-020197ac33d8','951789fd-1508-11f0-90d1-020197ac33d8',2,'14',0),('9b1b814e-1508-11f0-90d1-020197ac33d8','951789fd-1508-11f0-90d1-020197ac33d8',3,'16',1),('9b1b87dc-1508-11f0-90d1-020197ac33d8','951789fd-1508-11f0-90d1-020197ac33d8',4,'24',0),('9b1b8d36-1508-11f0-90d1-020197ac33d8','951789fd-1508-11f0-90d1-020197ac33d8',5,'6',0),('9b1cb98f-1508-11f0-90d1-020197ac33d8','95178aa6-1508-11f0-90d1-020197ac33d8',1,'Banal',0),('9b1cc38a-1508-11f0-90d1-020197ac33d8','95178aa6-1508-11f0-90d1-020197ac33d8',2,'Vivo',0),('9b1cc9dd-1508-11f0-90d1-020197ac33d8','95178aa6-1508-11f0-90d1-020197ac33d8',3,'Difícil',0),('9b1ccf3d-1508-11f0-90d1-020197ac33d8','95178aa6-1508-11f0-90d1-020197ac33d8',4,'Raro',1),('9b1cd46c-1508-11f0-90d1-020197ac33d8','95178aa6-1508-11f0-90d1-020197ac33d8',5,'Interesante',0),('9b1df329-1508-11f0-90d1-020197ac33d8','95178b6b-1508-11f0-90d1-020197ac33d8',1,'Navío',0),('9b1dfde8-1508-11f0-90d1-020197ac33d8','95178b6b-1508-11f0-90d1-020197ac33d8',2,'Ejército',0),('9b1e03ee-1508-11f0-90d1-020197ac33d8','95178b6b-1508-11f0-90d1-020197ac33d8',3,'Rey',1),('9b1e0984-1508-11f0-90d1-020197ac33d8','95178b6b-1508-11f0-90d1-020197ac33d8',4,'República',0),('9b1e0f1b-1508-11f0-90d1-020197ac33d8','95178b6b-1508-11f0-90d1-020197ac33d8',5,'Soldado',0),('9b1f2b36-1508-11f0-90d1-020197ac33d8','95178c1d-1508-11f0-90d1-020197ac33d8',1,'La A',1),('9b1f3546-1508-11f0-90d1-020197ac33d8','95178c1d-1508-11f0-90d1-020197ac33d8',2,'La V',0),('9b1f3ae9-1508-11f0-90d1-020197ac33d8','95178c1d-1508-11f0-90d1-020197ac33d8',3,'La H',0),('9b1f402c-1508-11f0-90d1-020197ac33d8','95178c1d-1508-11f0-90d1-020197ac33d8',4,'La B',0),('9b1f4561-1508-11f0-90d1-020197ac33d8','95178c1d-1508-11f0-90d1-020197ac33d8',5,'La N',0),('9b204711-1508-11f0-90d1-020197ac33d8','95178e50-1508-11f0-90d1-020197ac33d8',1,'Un animal que tiene cola',0),('9b204f52-1508-11f0-90d1-020197ac33d8','95178e50-1508-11f0-90d1-020197ac33d8',2,'Un ser viviente',0),('9b2054f6-1508-11f0-90d1-020197ac33d8','95178e50-1508-11f0-90d1-020197ac33d8',3,'Una cosa que trabaja',0),('9b205ce7-1508-11f0-90d1-020197ac33d8','95178e50-1508-11f0-90d1-020197ac33d8',4,'Un rumiante',1),('9b207d5c-1508-11f0-90d1-020197ac33d8','95178e50-1508-11f0-90d1-020197ac33d8',5,'Un animal que tira de los coches',0),('9b218f9f-1508-11f0-90d1-020197ac33d8','95178f48-1508-11f0-90d1-020197ac33d8',1,'La K',0),('9b219972-1508-11f0-90d1-020197ac33d8','95178f48-1508-11f0-90d1-020197ac33d8',2,'La P',0),('9b219ecb-1508-11f0-90d1-020197ac33d8','95178f48-1508-11f0-90d1-020197ac33d8',3,'La B',0),('9b21a564-1508-11f0-90d1-020197ac33d8','95178f48-1508-11f0-90d1-020197ac33d8',4,'La Q',1),('9b21aa53-1508-11f0-90d1-020197ac33d8','95178f48-1508-11f0-90d1-020197ac33d8',5,'La Y',0),('9b22bd00-1508-11f0-90d1-020197ac33d8','95179018-1508-11f0-90d1-020197ac33d8',1,'La A',0),('9b22c647-1508-11f0-90d1-020197ac33d8','95179018-1508-11f0-90d1-020197ac33d8',2,'La M',1),('9b22cb8c-1508-11f0-90d1-020197ac33d8','95179018-1508-11f0-90d1-020197ac33d8',3,'La Q',0),('9b22d094-1508-11f0-90d1-020197ac33d8','95179018-1508-11f0-90d1-020197ac33d8',4,'La D',0),('9b22d59f-1508-11f0-90d1-020197ac33d8','95179018-1508-11f0-90d1-020197ac33d8',5,'La L',0),('9b23c7bc-1508-11f0-90d1-020197ac33d8','951790e7-1508-11f0-90d1-020197ac33d8',1,'Juez',0),('9b23d18a-1508-11f0-90d1-020197ac33d8','951790e7-1508-11f0-90d1-020197ac33d8',2,'Nervio',0),('9b23d772-1508-11f0-90d1-020197ac33d8','951790e7-1508-11f0-90d1-020197ac33d8',3,'Hora',0),('9b23dd2f-1508-11f0-90d1-020197ac33d8','951790e7-1508-11f0-90d1-020197ac33d8',4,'Norte',1),('9b23e6eb-1508-11f0-90d1-020197ac33d8','951790e7-1508-11f0-90d1-020197ac33d8',5,'Labio',0),('9b24dcbe-1508-11f0-90d1-020197ac33d8','951792c3-1508-11f0-90d1-020197ac33d8',1,'La A',1),('9b24e604-1508-11f0-90d1-020197ac33d8','951792c3-1508-11f0-90d1-020197ac33d8',2,'La E',0),('9b24ef7d-1508-11f0-90d1-020197ac33d8','951792c3-1508-11f0-90d1-020197ac33d8',3,'La L',0),('9b24f730-1508-11f0-90d1-020197ac33d8','951792c3-1508-11f0-90d1-020197ac33d8',4,'La R',0),('9b24fe7a-1508-11f0-90d1-020197ac33d8','951792c3-1508-11f0-90d1-020197ac33d8',5,'La B',0),('9b25ffde-1508-11f0-90d1-020197ac33d8','951793b3-1508-11f0-90d1-020197ac33d8',1,'14',0),('9b2607dc-1508-11f0-90d1-020197ac33d8','951793b3-1508-11f0-90d1-020197ac33d8',2,'17',1),('9b260e5a-1508-11f0-90d1-020197ac33d8','951793b3-1508-11f0-90d1-020197ac33d8',3,'20',0),('9b2613b2-1508-11f0-90d1-020197ac33d8','951793b3-1508-11f0-90d1-020197ac33d8',4,'15',0),('9b26197f-1508-11f0-90d1-020197ac33d8','951793b3-1508-11f0-90d1-020197ac33d8',5,'16',0),('9b26f74f-1508-11f0-90d1-020197ac33d8','9517947f-1508-11f0-90d1-020197ac33d8',1,'10',0),('9b2701dd-1508-11f0-90d1-020197ac33d8','9517947f-1508-11f0-90d1-020197ac33d8',2,'5',0),('9b2709c9-1508-11f0-90d1-020197ac33d8','9517947f-1508-11f0-90d1-020197ac33d8',3,'2',1),('9b2710c5-1508-11f0-90d1-020197ac33d8','9517947f-1508-11f0-90d1-020197ac33d8',4,'4',0),('9b2717b6-1508-11f0-90d1-020197ac33d8','9517947f-1508-11f0-90d1-020197ac33d8',5,'25',0),('9b27f253-1508-11f0-90d1-020197ac33d8','95179550-1508-11f0-90d1-020197ac33d8',1,'3',0),('9b27f798-1508-11f0-90d1-020197ac33d8','95179550-1508-11f0-90d1-020197ac33d8',2,'4',0),('9b27fd18-1508-11f0-90d1-020197ac33d8','95179550-1508-11f0-90d1-020197ac33d8',3,'1',0),('9b28004b-1508-11f0-90d1-020197ac33d8','95179550-1508-11f0-90d1-020197ac33d8',4,'7',0),('9b280335-1508-11f0-90d1-020197ac33d8','95179550-1508-11f0-90d1-020197ac33d8',5,'8',1);
/*!40000 ALTER TABLE `opcionesotis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opcionesterman`
--

DROP TABLE IF EXISTS `opcionesterman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opcionesterman` (
  `idOpcionTerman` int NOT NULL AUTO_INCREMENT,
  `idPreguntaTerman` int NOT NULL,
  `opcionTerman` int NOT NULL,
  `descripcionTerman` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `esCorrecta` tinyint(1) NOT NULL,
  PRIMARY KEY (`idOpcionTerman`),
  KEY `idPreguntaTerman` (`idPreguntaTerman`)
) ENGINE=InnoDB AUTO_INCREMENT=515 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opcionesterman`
--

LOCK TABLES `opcionesterman` WRITE;
/*!40000 ALTER TABLE `opcionesterman` DISABLE KEYS */;
INSERT INTO `opcionesterman` VALUES (1,1,1,'A) Granos',0),(2,1,2,'B) Petróleo',1),(3,1,3,'C) Trementina',0),(4,1,4,'D) Semillas',0),(5,2,1,'A) 1,000 kgs.',1),(6,2,2,'B) 2,000 kgs.',0),(7,2,3,'C) 3,000 kgs.',0),(8,2,4,'D) 4,000 kgs.',0),(9,3,1,'A) Mazatlán',0),(10,3,2,'B) Acapulco',1),(11,3,3,'C) Progreso',0),(12,3,4,'D) Veracruz',0),(13,4,1,'A) Ver',1),(14,4,2,'B) Oír',0),(15,4,3,'C) Probar',0),(16,4,4,'D) Sentir',0),(17,5,1,'A) Corteza',0),(18,5,2,'B) Fruto',1),(19,5,3,'C) Hojas',0),(20,5,4,'D) Raíz',0),(21,6,1,'A) Carnero',0),(22,6,2,'B) Vaca',0),(23,6,3,'C) Gallina',0),(24,6,4,'D) Cerdo',1),(25,7,1,'A) Abdomen',0),(26,7,2,'B) Cabeza',0),(27,7,3,'C) Garganta',1),(28,7,4,'D) Espalda',0),(29,8,1,'A) Muerte',1),(30,8,2,'B) Enfermedad',0),(31,8,3,'C) Fiebre',0),(32,8,4,'D) Malestar',0),(33,9,1,'A) Perforar',0),(34,9,2,'B) Cortar',0),(35,9,3,'C) Levantar',1),(36,9,4,'D) Exprimir',0),(37,10,1,'A) Pentágono',0),(38,10,2,'B) Paralelogramo',0),(39,10,3,'C) Hexágono',1),(40,10,4,'D) Trapecio',0),(41,11,1,'A) Lluvia',0),(42,11,2,'B) Viento',0),(43,11,3,'C) Electricidad',1),(44,11,4,'D) Presión',0),(45,12,1,'A) Agricultura',0),(46,12,2,'B) Música',1),(47,12,3,'C) Fotografía',0),(48,12,4,'D) Estenografía',0),(49,13,1,'A) Azules',0),(50,13,2,'B) Verdes',1),(51,13,3,'C) Rojas',0),(52,13,4,'D) Amarillas',0),(53,14,1,'A) Pie',0),(54,14,2,'B) Pulgada',0),(55,14,3,'C) Yarda',1),(56,14,4,'D) Milla',0),(57,15,1,'A) Animales',1),(58,15,2,'B) Yerbas',0),(59,15,3,'C) Bosques',0),(60,15,4,'D) Minas',0),(61,16,1,'A) Medicina',0),(62,16,2,'B) Teología',0),(63,16,3,'C) Leyes',1),(64,16,4,'D) Pedagogía',0),(65,17,1,'A) Las estrellas desaparecerían',0),(66,17,2,'B) Los meses serían más largos',0),(67,17,3,'C) La Tierra estaría más caliente',1),(68,18,1,'A) El nogal es fuerte',1),(69,18,2,'B) Se corta fácilmente',0),(70,18,3,'C) Sus frenos no son buenos',0),(71,19,1,'A) Tiene más rueda',0),(72,19,2,'B) Es más pesado',1),(73,19,3,'C) Sus frenos no son buenos',0),(74,20,1,'A) Que los robles son débiles',0),(75,20,2,'B) Que son mejores los golpes pequeños',0),(76,20,3,'C) Que el esfuerzo constante logra resultados sorprendentes',1),(77,21,1,'A) Que no debemos vigilarla, cuando este en el fuego',0),(78,21,2,'B) Que tarda en hervir',0),(79,21,3,'C) Que el tiempo se alarga cuando esperamos',1),(80,22,1,'A) Que el pasto se siembra en el verano',0),(81,22,2,'B) Que debemos aprovechar nuestras oportunidades',1),(82,22,3,'C) Que el pasto no debe cortarse esta noche',0),(83,23,1,'A) Que un zapatero no debe abandonar sus zapatos',0),(84,23,2,'B) Que los zapateros no deben estar ociosos',0),(85,23,3,'C) Que debemos trabajar en lo que podemos hacer mejor',1),(86,24,1,'A) Que el palo sirve para apretar',0),(87,24,2,'B) Que las cuñas siempre son de madera',0),(88,24,3,'C) Nos exigen más las personas que nos conocen',1),(89,25,1,'A) La máquina lo hace flotar',0),(90,25,2,'B) Porque tiene grandes espacios huecos',1),(91,25,3,'C) Contiene algo de madera',0),(92,26,1,'A) Las alas ofrecen una amplia superficie ligera',1),(93,26,2,'B) Mantien el aire fuera del cuerpo',0),(94,26,3,'C) Disminuyen su peso',0),(95,27,1,'A) Que las golondrinas regresan',0),(96,27,2,'B) Que un simple dato no es suficiente',1),(97,27,3,'C) Que los pájaros se agregan a nuestros planes de verano',0),(98,28,1,'Opuesto',1),(99,28,2,'Igual',0),(100,29,1,'Opuesto',0),(101,29,2,'Igual',1),(102,30,1,'Opuesto',1),(103,30,2,'Igual',0),(104,31,1,'Opuesto',1),(105,31,2,'Igual',0),(106,32,1,'Opuesto',1),(107,32,2,'Igual',0),(108,33,1,'Opuesto',1),(109,33,2,'Igual',0),(110,34,1,'Opuesto',0),(111,34,2,'Igual',1),(112,35,1,'Opuesto',0),(113,35,2,'Igual',1),(114,36,1,'Opuesto',1),(115,36,2,'Igual',0),(116,37,1,'Opuesto',0),(117,37,2,'Igual',1),(118,38,1,'Opuesto',1),(119,38,2,'Igual',0),(120,39,1,'Opuesto',1),(121,39,2,'Igual',0),(122,40,1,'Opuesto',1),(123,40,2,'Igual',0),(124,41,1,'Opuesto',0),(125,41,2,'Igual',1),(126,42,1,'Opuesto',1),(127,42,2,'Igual',0),(128,43,1,'Opuesto',1),(129,43,2,'Igual',0),(130,44,1,'Opuesto',0),(131,44,2,'Igual',1),(132,45,1,'Opuesto',1),(133,45,2,'Igual',0),(134,46,1,'Opuesto',0),(135,46,2,'Igual',1),(136,47,1,'Opuesto',1),(137,47,2,'Igual',0),(138,48,1,'Opuesto',1),(139,48,2,'Igual',0),(140,49,1,'Opuesto',1),(141,49,2,'Igual',0),(142,50,1,'Opuesto',0),(143,50,2,'Igual',1),(144,51,1,'Opuesto',0),(145,51,2,'Igual',1),(146,52,1,'Opuesto',0),(147,52,2,'Igual',1),(148,53,1,'Opuesto',1),(149,53,2,'Igual',0),(150,54,1,'Opuesto',0),(151,54,2,'Igual',1),(152,55,1,'Opuesto',0),(153,55,2,'Igual',1),(154,56,1,'Opuesto',1),(155,56,2,'Igual',0),(156,57,1,'Opuesto',0),(157,57,2,'Igual',1),(158,58,1,'A) Altura',0),(159,58,2,'B) Circunferencia',1),(160,58,3,'C) Latitud',0),(161,58,4,'D) Longitud',0),(162,58,5,'E) Radio',1),(163,59,1,'A) Huesos',1),(164,59,2,'B) Huevos',0),(165,59,3,'C) Pico',1),(166,59,4,'D) Nido',0),(167,59,5,'E) Canto',0),(168,60,1,'A) Oyente',0),(169,60,2,'B) Piano',0),(170,60,3,'C) Ritmo',1),(171,60,4,'D) Sonido',1),(172,60,5,'E) Violin',0),(173,61,1,'A) Alimentos',1),(174,61,2,'B) Música',0),(175,61,3,'C) Personas',1),(176,61,4,'D) Discursos',0),(177,61,5,'E) Anfitrión',0),(178,62,1,'A) Arnés',0),(179,62,2,'B) Cascos',1),(180,62,3,'C) Herraduras',0),(181,62,4,'D) Establo',0),(182,62,5,'E) Cola',1),(183,63,1,'A) Cartas',0),(184,63,2,'B) Multas',0),(185,63,3,'C) Jugadores',1),(186,63,4,'D) Castigos',0),(187,63,5,'E) Reglas',1),(188,64,1,'A) Calor',0),(189,64,2,'B) Tamaño',1),(190,64,3,'C) Sabor',0),(191,64,4,'D) Valor',0),(192,64,5,'E) Peso',1),(193,65,1,'A) Acuerdos',0),(194,65,2,'B) Personas',1),(195,65,3,'C) Preguntas',0),(196,65,4,'D) Ingenio',0),(197,65,5,'E) Palabras',1),(198,66,1,'A) Acreedor',1),(199,66,2,'B) Deudor',1),(200,66,3,'C) Interés',0),(201,66,4,'D) Hipoteca',0),(202,66,5,'E) Pago',0),(203,67,1,'A) País',1),(204,67,2,'B) Ocupación',0),(205,67,3,'C) Derechos',1),(206,67,4,'D) Propiedad',0),(207,67,5,'E) Voto',0),(208,68,1,'A) Animales',0),(209,68,2,'B) Orden',1),(210,68,3,'C) Colecciones',1),(211,68,4,'D) Minerales',0),(212,68,5,'E) Visitantes',0),(213,69,1,'A) Obligación',1),(214,69,2,'B) Acuerdo',1),(215,69,3,'C) Amistad',0),(216,69,4,'D) Respeto',0),(217,69,5,'E) Satisfacción',0),(218,70,1,'A) Animales',0),(219,70,2,'B) Flores',0),(220,70,3,'C) Sombra',1),(221,70,4,'D) Maleza',0),(222,70,5,'E) Árboles',1),(223,71,1,'A) Dificultad',1),(224,71,2,'B) Desaliento',0),(225,71,3,'C) Fracaso',0),(226,71,4,'D) Impedimento',1),(227,71,5,'E) Estímulo',0),(228,72,1,'A) Aversión',1),(229,72,2,'B) Desagrado',1),(230,72,3,'C) Temor',0),(231,72,4,'D) Ira',0),(232,72,5,'E) Timidez',0),(233,73,1,'A) Anuncios',0),(234,73,2,'B) Papel',1),(235,73,3,'C) Fotografías',0),(236,73,4,'D) Grabados',0),(237,73,5,'E) Impresión',1),(238,74,1,'A) Argumento',1),(239,74,2,'B) Desargumentos',1),(240,74,3,'C) Aversión',0),(241,74,4,'D) Público',0),(242,74,5,'E) Resúmen',0),(243,75,1,'A) Máquina',0),(244,75,2,'B) Cañones',0),(245,75,3,'C) Quilla',1),(246,75,4,'D) Timón',1),(247,75,5,'E) Velas',0),(248,76,1,'20',1),(249,77,1,'11',1),(250,78,1,'50',1),(251,79,1,'50',1),(252,80,1,'12',1),(253,81,1,'18',1),(254,82,1,'500',1),(255,83,1,'2',1),(256,84,1,'28',1),(257,85,1,'360',1),(258,86,1,'2',1),(259,87,1,'25',1),(260,88,1,'Si',1),(261,88,2,'No',0),(262,89,1,'Si',0),(263,89,2,'No',1),(264,90,1,'Si',0),(265,90,2,'No',1),(266,91,1,'Si',1),(267,91,2,'No',0),(268,92,1,'Si',1),(269,92,2,'No',0),(270,93,1,'Si',0),(271,93,2,'No',1),(272,94,1,'Si',0),(273,94,2,'No',1),(274,95,1,'Si',0),(275,95,2,'No',1),(276,96,1,'Si',1),(277,96,2,'No',0),(278,97,1,'Si',1),(279,97,2,'No',0),(280,98,1,'Si',0),(281,98,2,'No',1),(282,99,1,'Si',0),(283,99,2,'No',1),(284,100,1,'Si',0),(285,100,2,'No',1),(286,101,1,'Si',1),(287,101,2,'No',0),(288,102,1,'Si',0),(289,102,2,'No',1),(290,103,1,'Si',0),(291,103,2,'No',1),(292,104,1,'Si',1),(293,104,2,'No',0),(294,105,1,'Si',0),(295,105,2,'No',1),(296,106,1,'Si',1),(297,106,2,'No',0),(298,107,1,'Si',1),(299,107,2,'No',0),(300,108,1,'A) comer',1),(301,108,2,'B) hambre',0),(302,108,3,'C) agua',0),(303,108,4,'D) cocinar',0),(304,109,1,'A) años',1),(305,109,2,'B) hora',0),(306,109,3,'C) minuto',0),(307,109,4,'D) siglo',0),(308,110,1,'A) olor',0),(309,110,2,'B) hoja',0),(310,110,3,'C) planta',1),(311,110,4,'D) espina',0),(312,111,1,'A) negro',0),(313,111,2,'B) esclavitud',1),(314,111,3,'C) libre',0),(315,111,4,'D) sufrir',0),(316,112,1,'A) canta',0),(317,112,2,'B) estuvo',1),(318,112,3,'C) hablando',0),(319,112,4,'D) cantó',0),(320,113,1,'A) semana',0),(321,113,2,'B) jueves',0),(322,113,3,'C) día',0),(323,113,4,'D) sábado',1),(324,114,1,'A) botella',0),(325,114,2,'B) peso',0),(326,114,3,'C) ligero',1),(327,114,4,'D) flotar',0),(328,115,1,'A) tristeza',1),(329,115,2,'B) suerte',0),(330,115,3,'C) fracasar',0),(331,115,4,'D) trabajo',0),(332,116,1,'A) lobo',1),(333,116,2,'B) ladrido',0),(334,116,3,'C) mordida',0),(335,116,4,'D) agarrar',0),(336,117,1,'A) Z',0),(337,117,2,'B) 45',0),(338,117,3,'C) 35',0),(339,117,4,'D) 25',1),(340,118,1,'A) muerte',0),(341,118,2,'B) alegría',1),(342,118,3,'C) mortaja',0),(343,118,4,'D) doctor',0),(344,119,1,'A) comer',0),(345,119,2,'B) pájaro',0),(346,119,3,'C) vida',1),(347,119,4,'D) malo',0),(348,120,1,'A) 18',0),(349,120,2,'B) 27',1),(350,120,3,'C) 36',0),(351,120,4,'D) 45',0),(352,121,1,'A) beber',0),(353,121,2,'B) claro',0),(354,121,3,'C) sed',1),(355,121,4,'D) puro',0),(356,122,1,'A) éstos',0),(357,122,2,'B) aquel',0),(358,122,3,'C) ése',1),(359,122,4,'D) entonces',0),(360,123,1,'A) agua',0),(361,123,2,'B) pez',0),(362,123,3,'C) escama',1),(363,123,4,'D) nadar',0),(364,124,1,'A) patria',0),(365,124,2,'B) honrado',1),(366,124,3,'C) canción',0),(367,124,4,'D) estudio',0),(368,125,1,'A) tercero',0),(369,125,2,'B) último',0),(370,125,3,'C) cuarto',1),(371,125,4,'D) poste',0),(372,126,1,'A) marina',0),(373,126,2,'B) soldado',0),(374,126,3,'C) general',1),(375,126,4,'D) sargento',0),(376,127,1,'A) pronombre',0),(377,127,2,'B) adverbio',0),(378,127,3,'C) verbo',1),(379,127,4,'D) adjetivo',0),(380,128,1,'Verdadero',1),(381,128,2,'Falso',0),(382,129,1,'Verdadero',0),(383,129,2,'Falso',1),(384,130,1,'Verdadero',1),(385,130,2,'Falso',0),(386,131,1,'Verdadero',1),(387,131,2,'Falso',0),(388,132,1,'Verdadero',1),(389,132,2,'Falso',0),(390,133,1,'Verdadero',0),(391,133,2,'Falso',1),(392,134,1,'Verdadero',0),(393,134,2,'Falso',1),(394,135,1,'Verdadero',1),(395,135,2,'Falso',0),(396,136,1,'Verdadero',1),(397,136,2,'Falso',0),(398,137,1,'Verdadero',0),(399,137,2,'Falso',1),(400,138,1,'Verdadero',0),(401,138,2,'Falso',1),(402,139,1,'Verdadero',0),(403,139,2,'Falso',1),(404,140,1,'Verdadero',1),(405,140,2,'Falso',0),(406,141,1,'Verdadero',1),(407,141,2,'Falso',0),(408,142,1,'Verdadero',1),(409,142,2,'Falso',0),(410,143,1,'Verdadero',1),(411,143,2,'Falso',0),(412,144,1,'Verdadero',0),(413,144,2,'Falso',1),(414,145,1,'A) Saltar',0),(415,145,2,'B) Correr',0),(416,145,3,'C) Brincar',0),(417,145,4,'D) Pararse',1),(418,145,5,'E) Caminar',0),(419,146,1,'A) Monarquía',0),(420,146,2,'B) Comunista',0),(421,146,3,'C) Demócrata',0),(422,146,4,'D) Anarquista',0),(423,146,5,'E) Católico',1),(424,147,1,'A) Muerte',0),(425,147,2,'B) Duelo',0),(426,147,3,'C) Paseo',1),(427,147,4,'D) Pobreza',0),(428,147,5,'E) Tristeza',0),(429,148,1,'A) Carpintero',1),(430,148,2,'B) Doctor',0),(431,148,3,'C) Abogado',0),(432,148,4,'D) Ingeniero',0),(433,148,5,'E) Profesor',0),(434,149,1,'A) Cama',0),(435,149,2,'B) Silla',0),(436,149,3,'C) Plato',1),(437,149,4,'D) Sofá',0),(438,149,5,'E) Mesa',0),(439,150,1,'A) Francisco',0),(440,150,2,'B) Santiago',0),(441,150,3,'C) Juan',0),(442,150,4,'D) Sara',1),(443,150,5,'E) Guillermo',0),(444,151,1,'A) Duro',0),(445,151,2,'B) Áspero',0),(446,151,3,'C) Liso',0),(447,151,4,'D) Suave',0),(448,151,5,'E) Dulce',1),(449,152,1,'A) Digestión',1),(450,152,2,'B) Oído',0),(451,152,3,'C) Vista',0),(452,152,4,'D) Olfato',0),(453,152,5,'E) Tacto',0),(454,153,1,'A) Automóvil',0),(455,153,2,'B) Bicicleta',0),(456,153,3,'C) Guayín',0),(457,153,4,'D) Telégrafo',1),(458,153,5,'E) Tren',0),(459,154,1,'A) Abajo',0),(460,154,2,'B) Acá',0),(461,154,3,'C) Reciente',1),(462,154,4,'D) Arriba',0),(463,154,5,'E) Allá',0),(464,155,1,'A) Hidalgo',0),(465,155,2,'B) Morelos',0),(466,155,3,'C) Bravo',0),(467,155,4,'D) Matamoros',0),(468,155,5,'E) Bolívar',1),(469,156,1,'A) Danés',0),(470,156,2,'B) Galgo',0),(471,156,3,'C) Buldog',0),(472,156,4,'D) Pekinés',0),(473,156,5,'E) Longhorn',1),(474,157,1,'A) Tela',1),(475,157,2,'B) Algodón',0),(476,157,3,'C) Lino',0),(477,157,4,'D) Seda',0),(478,157,5,'E) Lana',0),(479,158,1,'A) Ira',0),(480,158,2,'B) Odio',0),(481,158,3,'C) Alegría',0),(482,158,4,'D) Piedad',0),(483,158,5,'E) Razonamiento',1),(484,159,1,'A) Edison',0),(485,159,2,'B) Franklin',0),(486,159,3,'C) Marconi',0),(487,159,4,'D) Fulton',0),(488,159,5,'E) Shakespeare',1),(489,160,1,'A) Mariposa',1),(490,160,2,'B) Halcón',0),(491,160,3,'C) Avestruz',0),(492,160,4,'D) Petirrojo',0),(493,160,5,'E) Golondrina',0),(494,161,1,'A) Dar',0),(495,161,2,'B) Prestar',0),(496,161,3,'C) Perder',0),(497,161,4,'D) Ahorrar',1),(498,161,5,'E) Derrochar',0),(499,162,1,'A) Australia',0),(500,162,2,'B) Cuba',0),(501,162,3,'C) Córcega',0),(502,162,4,'D) Irlanda',0),(503,162,5,'E) España',1),(504,163,1,'2 - 1',1),(505,164,1,'33 - 38',1),(506,165,1,'64 - 128',1),(507,166,1,'2 - 2',1),(508,167,1,'13 - 13.1/4',1),(509,168,1,'20 - 21',1),(510,169,1,'1/4 - 1/8',1),(511,170,1,'85.3 - 94.3',1),(512,171,1,'6 - 8',1),(513,172,1,'33 - 34',1),(514,173,1,'25 - 125',1);
/*!40000 ALTER TABLE `opcionesterman` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paises`
--

DROP TABLE IF EXISTS `paises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paises` (
  `idPais` int NOT NULL AUTO_INCREMENT,
  `nombrePais` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`idPais`)
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paises`
--

LOCK TABLES `paises` WRITE;
/*!40000 ALTER TABLE `paises` DISABLE KEYS */;
INSERT INTO `paises` VALUES (1,'Argentina'),(2,'Brasil'),(3,'Canadá'),(4,'Chile'),(5,'China'),(6,'Colombia'),(7,'Egipto'),(8,'España'),(9,'Estados Unidos'),(10,'Francia'),(11,'Alemania'),(12,'India'),(13,'Italia'),(14,'Japón'),(15,'México'),(16,'Países Bajos'),(17,'Perú'),(18,'Reino Unido'),(19,'Rusia'),(20,'Sudáfrica'),(21,'Australia'),(22,'Corea del Sur'),(23,'Portugal'),(24,'Turquía'),(25,'Grecia'),(26,'Suiza'),(27,'Suecia'),(28,'Noruega'),(29,'Dinamarca'),(30,'Finlandia'),(31,'Afganistán'),(32,'Albania'),(33,'Andorra'),(34,'Angola'),(35,'Antigua y Barbuda'),(36,'Arabia Saudita'),(37,'Argelia'),(38,'Armenia'),(39,'Azerbaiyán'),(40,'Bahamas'),(41,'Bangladés'),(42,'Barbados'),(43,'Baréin'),(44,'Bélgica'),(45,'Belice'),(46,'Benín'),(47,'Bielorrusia'),(48,'Birmania'),(49,'Bolivia'),(50,'Bosnia y Herzegovina'),(51,'Botsuana'),(52,'Brunéi'),(53,'Bulgaria'),(54,'Burkina Faso'),(55,'Burundi'),(56,'Bután'),(57,'Cabo Verde'),(58,'Camboya'),(59,'Camerún'),(60,'Catar'),(61,'Chad'),(62,'Chipre'),(63,'Ciudad del Vaticano'),(64,'Comoras'),(65,'Corea del Norte'),(66,'Costa de Marfil'),(67,'Costa Rica'),(68,'Cuba'),(69,'Dominica'),(70,'Ecuador'),(71,'El Salvador'),(72,'Emiratos Árabes Unidos'),(73,'Eritrea'),(74,'Eslovaquia'),(75,'Eslovenia'),(76,'Estonia'),(77,'Etiopía'),(78,'Filipinas'),(79,'Fiyi'),(80,'Gabón'),(81,'Gambia'),(82,'Georgia'),(83,'Ghana'),(84,'Granada'),(85,'Guatemala'),(86,'Guinea'),(87,'Guinea ecuatorial'),(88,'Guinea-Bisáu'),(89,'Haití'),(90,'Honduras'),(91,'Hungría'),(92,'Indonesia'),(93,'Irak'),(94,'Irán'),(95,'Irlanda'),(96,'Islandia'),(97,'Islas Marshall'),(98,'Islas Salomón'),(99,'Israel'),(100,'Jamaica'),(101,'Jordania'),(102,'Kazajistán'),(103,'Kenia'),(104,'Kirguistán'),(105,'Kiribati'),(106,'Kuwait'),(107,'Laos'),(108,'Lesoto'),(109,'Letonia'),(110,'Líbano'),(111,'Liberia'),(112,'Libia'),(113,'Liechtenstein'),(114,'Lituania'),(115,'Luxemburgo'),(116,'Madagascar'),(117,'Malasia'),(118,'Malaui'),(119,'Maldivas'),(120,'Malí'),(121,'Malta'),(122,'Marruecos'),(123,'Mauricio'),(124,'Mauritania'),(125,'Micronesia'),(126,'Moldavia'),(127,'Mónaco'),(128,'Mongolia'),(129,'Montenegro'),(130,'Mozambique'),(131,'Namibia'),(132,'Nauru'),(133,'Nepal'),(134,'Nicaragua'),(135,'Níger'),(136,'Nigeria'),(137,'Nueva Zelanda'),(138,'Omán'),(139,'Pakistán'),(140,'Palaos'),(141,'Panamá'),(142,'Papúa Nueva Guinea'),(143,'Paraguay'),(144,'Polonia'),(145,'República Centroafricana'),(146,'República Checa'),(147,'República de Macedonia'),(148,'República del Congo'),(149,'República Democrática del Congo'),(150,'República Dominicana'),(151,'República Sudafricana'),(152,'Ruanda'),(153,'Rumanía'),(154,'Samoa'),(155,'San Cristóbal y Nieves'),(156,'San Marino'),(157,'San Vicente y las Granadinas'),(158,'Santa Lucía'),(159,'Santo Tomé y Príncipe'),(160,'Senegal'),(161,'Serbia'),(162,'Seychelles'),(163,'Sierra Leona'),(164,'Singapur'),(165,'Siria'),(166,'Somalia'),(167,'Sri Lanka'),(168,'Suazilandia'),(169,'Sudán'),(170,'Sudán del Sur'),(171,'Surinam'),(172,'Tailandia'),(173,'Tanzania'),(174,'Tayikistán'),(175,'Timor Oriental'),(176,'Togo'),(177,'Tonga'),(178,'Trinidad y Tobago'),(179,'Túnez'),(180,'Turkmenistán'),(181,'Tuvalu'),(182,'Ucrania'),(183,'Uganda'),(184,'Uruguay'),(185,'Uzbekistán'),(186,'Vanuatu'),(187,'Venezuela'),(188,'Vietnam'),(189,'Yemen'),(190,'Yibuti'),(191,'Zambia'),(192,'Zimbabue');
/*!40000 ALTER TABLE `paises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parametros16pf`
--

DROP TABLE IF EXISTS `parametros16pf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parametros16pf` (
  `idAspirante` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `idGrupo` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `A` int NOT NULL DEFAULT '0',
  `B` int NOT NULL DEFAULT '0',
  `C` int NOT NULL DEFAULT '0',
  `E` int NOT NULL DEFAULT '0',
  `F` int NOT NULL DEFAULT '0',
  `G` int NOT NULL DEFAULT '0',
  `H` int NOT NULL DEFAULT '0',
  `I` int NOT NULL DEFAULT '0',
  `L` int NOT NULL DEFAULT '0',
  `M` int NOT NULL DEFAULT '0',
  `N` int NOT NULL DEFAULT '0',
  `O` int NOT NULL DEFAULT '0',
  `Q1` int NOT NULL DEFAULT '0',
  `Q2` int NOT NULL DEFAULT '0',
  `Q3` int NOT NULL DEFAULT '0',
  `Q4` int NOT NULL DEFAULT '0',
  `IM` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`idAspirante`,`idGrupo`),
  KEY `parametros16pf_ibfk_1` (`idAspirante`),
  KEY `parametros16pf_ibfk_2` (`idGrupo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parametros16pf`
--

LOCK TABLES `parametros16pf` WRITE;
/*!40000 ALTER TABLE `parametros16pf` DISABLE KEYS */;
INSERT INTO `parametros16pf` VALUES ('86678ff7-31c6-11f0-8e65-020197ac33d8','8677199b-26fe-11f0-9737-020197ac33d8',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),('9364aa1b-2702-11f0-9737-020197ac33d8','8ace6af8-2702-11f0-9737-020197ac33d8',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),('9364d780-2702-11f0-9737-020197ac33d8','8ace6af8-2702-11f0-9737-020197ac33d8',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),('9364d7be-2702-11f0-9737-020197ac33d8','8ace6af8-2702-11f0-9737-020197ac33d8',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),('9364f231-2702-11f0-9737-020197ac33d8','8ace6af8-2702-11f0-9737-020197ac33d8',8,6,11,14,13,15,2,13,12,11,13,12,11,15,10,6,10),('9364f8ac-2702-11f0-9737-020197ac33d8','8ace6af8-2702-11f0-9737-020197ac33d8',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),('93650168-2702-11f0-9737-020197ac33d8','8ace6af8-2702-11f0-9737-020197ac33d8',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),('93651b9a-2702-11f0-9737-020197ac33d8','8ace6af8-2702-11f0-9737-020197ac33d8',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),('93651c09-2702-11f0-9737-020197ac33d8','8ace6af8-2702-11f0-9737-020197ac33d8',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),('9366596e-2702-11f0-9737-020197ac33d8','8ace6af8-2702-11f0-9737-020197ac33d8',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),('93669e61-2702-11f0-9737-020197ac33d8','8ace6af8-2702-11f0-9737-020197ac33d8',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `parametros16pf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preguntas16pf`
--

DROP TABLE IF EXISTS `preguntas16pf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preguntas16pf` (
  `idPregunta16PF` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `idPrueba` int DEFAULT NULL,
  `pregunta16PF` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `letraAporte` varchar(3) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `numeroPregunta16PF` int DEFAULT NULL,
  PRIMARY KEY (`idPregunta16PF`),
  KEY `idPrueba` (`idPrueba`),
  CONSTRAINT `preguntas16pf_ibfk_1` FOREIGN KEY (`idPrueba`) REFERENCES `pruebas` (`idPrueba`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preguntas16pf`
--

LOCK TABLES `preguntas16pf` WRITE;
/*!40000 ALTER TABLE `preguntas16pf` DISABLE KEYS */;
INSERT INTO `preguntas16pf` VALUES ('5f510808-2089-11f0-a293-a0294223b12a',2,'En un negocio sería más interesante encargarse de:','A',1),('5f522dbf-2089-11f0-a293-a0294223b12a',2,'Normalmente me voy a dormir sintiéndome satisfecho de cómo ha ido el día.','C',2),('5f5232a6-2089-11f0-a293-a0294223b12a',2,'Si observo que la línea de razonamiento de otra persona es incorrecta, normalmente:','A',3),('5f523483-2089-11f0-a293-a0294223b12a',2,'Me gusta muchísimo tener invitados y hacer que se lo pasen bien.','F',4),('5f52361f-2089-11f0-a293-a0294223b12a',2,'Cuando tomo una decisión siempre pienso cuidadosamente en lo que es correcto y justo.','G',5),('5f5236c0-2089-11f0-a293-a0294223b12a',2,'Me atrae más pasar una tarde ocupado en una tarea tranquila a la que tenga afición que estar en una reunión animada.','H',6),('5f523807-2089-11f0-a293-a0294223b12a',2,'Admiro más a:','G',7),('5f523973-2089-11f0-a293-a0294223b12a',2,'Sería más interesante ser:','L',8),('5f523ae0-2089-11f0-a293-a0294223b12a',2,'Normalmente soy el que da el primer paso al hacer amigos.','M',9),('5f523c52-2089-11f0-a293-a0294223b12a',2,'Me encantan las buenas novelas u obras de teatro/cine.','N',10),('5f523dc7-2089-11f0-a293-a0294223b12a',2,'Cuando la gente autoritaria trata de dominarme, hago justamente lo contrario de lo que quiere.','M',11),('5f523f42-2089-11f0-a293-a0294223b12a',2,'Algunas veces no congenio muy bien con los demás porque mis ideas no son convencionales y corrientes.','Q1',12),('5f5240be-2089-11f0-a293-a0294223b12a',2,'Muchas personas te \"apuñalarían por la espalda\" para salir ellas adelante.','Q2',13),('5f524229-2089-11f0-a293-a0294223b12a',2,'Me meto en problemas porque a veces sigo adelante con mis ideas sin comentarlas con las personas que puedan estar implicadas.','Q1',14),('5f52445c-2089-11f0-a293-a0294223b12a',2,'Hablo de mis sentimientos:','Q2',15),('5f5245ba-2089-11f0-a293-a0294223b12a',2,'Me aprovecho de la gente.','Q4',16),('5f5246c2-2089-11f0-a293-a0294223b12a',2,'Mis pensmaientos son demasiado complicados y profundos como para ser comprendidos por muchas personas.','IM',17),('5f5247bf-2089-11f0-a293-a0294223b12a',2,'Prefiero:','Q4',18),('5f5248bc-2089-11f0-a293-a0294223b12a',2,'Pienso acerca de cosas que debería haber dicho pero que no las dije.','A',19),('5f524a07-2089-11f0-a293-a0294223b12a',2,'Siempre estoy alerta ante los intentos de propaganda en las cosas que leo.','C',20),('5f524b8e-2089-11f0-a293-a0294223b12a',2,'Si las personas actúan como si yo no les gustara:','E',21),('5f524c96-2089-11f0-a293-a0294223b12a',2,'Si las personas actúan como si yo no les gustara:','F',22),('5f524d9b-2089-11f0-a293-a0294223b12a',2,'He dicho cosas que hirieron los sentimientos de otros.','G',23),('5f524e93-2089-11f0-a293-a0294223b12a',2,'Si tuviera que cocinar o construir algo seguiría las instrucciones exactamente.','H',24),('5f524fac-2089-11f0-a293-a0294223b12a',2,'A la hora de construir o hacer algo preferiría trabajar:','G',25),('5f5250a2-2089-11f0-a293-a0294223b12a',2,'Me gusta hacer planes con antelación para no perder tiempo entre las tareas.','L',26),('5f5251b4-2089-11f0-a293-a0294223b12a',2,'Normalmente me gusta hacer mis planes yo solo, sin interrupciones y sugerencias de otros.','M',27),('5f5252d0-2089-11f0-a293-a0294223b12a',2,'Cuando me siento tenso incluso pequeñas cosas me sacan de quicio.','N',28),('5f5253df-2089-11f0-a293-a0294223b12a',2,'Puedo encontrarme bastante a gusto en un ambiente desorganizado.','M',29),('5f5254e7-2089-11f0-a293-a0294223b12a',2,'Si mis planes, cuidadosmanete elaborados, tuvieran que ser cambiados a causa de otras personas:','Q1',30),('5f5255f7-2089-11f0-a293-a0294223b12a',2,'Preferiría:','Q2',31),('5f5256f9-2089-11f0-a293-a0294223b12a',2,'Cuando las pequeñas cosas comienzan a marchar mal unas detrás de otras:','Q1',32),('5f525805-2089-11f0-a293-a0294223b12a',2,'Me satisface y entretiene cuidar de las necesidades de los demás.','Q2',33),('5f525a4a-2089-11f0-a293-a0294223b12a',2,'A veces hago observaciones tontas, a modo de broma, para sorprender a los demás.','Q4',34),('5f525bed-2089-11f0-a293-a0294223b12a',2,'Cuando llega el momento de hacer algo que he planeado y esperado, a veces no me apetece ya continuarlo.','IM',35),('5f525d7e-2089-11f0-a293-a0294223b12a',2,'En las situaciones que dependen de mí me siento bien dando instrucciones a los demás.','Q4',36),('5f525f04-2089-11f0-a293-a0294223b12a',2,'Preferiría emplear una tarde:','A',37),('5f52607b-2089-11f0-a293-a0294223b12a',2,'Cuando yo sé muy bien lo que el grupo tiene que hacer me gusta ser el único en dar las órdenes.','C',38),('5f5261ea-2089-11f0-a293-a0294223b12a',2,'Me divierte mucho el rápido y vivaz humor de algunas series de televisión.','E',39),('5f526370-2089-11f0-a293-a0294223b12a',2,'Le doy más valor y respeto a las normas y buenas maneras que a una vida fácil.','F',40),('5f5264da-2089-11f0-a293-a0294223b12a',2,'Me encuentro tímido y retraído a la hora de haer amigos entre personas desconocidas. ','G',41),('5f52663b-2089-11f0-a293-a0294223b12a',2,'Si pudiera, preferiría hacer ejercicio con:','H',42),('5f52679d-2089-11f0-a293-a0294223b12a',2,'Normalmente hay una gran diferencia entre lo que la gente dice y lo que hace.','I',43),('5f526904-2089-11f0-a293-a0294223b12a',2,'Resultaría más interesante ser músico que mecánico.','L',44),('5f526a6c-2089-11f0-a293-a0294223b12a',2,'Las personas forman su opinión acerca de mí demasiado rápidamente.','M',45),('5f526bd0-2089-11f0-a293-a0294223b12a',2,'Soy de esas personas que:','N',46),('5f526d31-2089-11f0-a293-a0294223b12a',2,'Algunas personas creen que es difícil intimar conmigo.','M',47),('5f527025-2089-11f0-a293-a0294223b12a',2,'Puedo engañar a las personas siendo amigable cuando en realidad me desagradan.','Q1',48),('5f5271b6-2089-11f0-a293-a0294223b12a',2,'Mis pensamientos tienden más a girar sobre cosas realistas y prácticas.','Q2',49),('5f527316-2089-11f0-a293-a0294223b12a',2,'Suelo ser reservado y guardar mis problemas para mis adentros.','Q1',50),('5f527489-2089-11f0-a293-a0294223b12a',2,'Después de tomar una decisión sobre algo sigo pensando si será acertada o errónea.','Q2',51),('5f527610-2089-11f0-a293-a0294223b12a',2,'En el fondo no me gustan las personas que son \"diferentes\" u originales.','Q3',52),('5f52779a-2089-11f0-a293-a0294223b12a',2,'Estoy más interesado en:','IM',53),('5f527927-2089-11f0-a293-a0294223b12a',2,'Me perturbo más que otros cuando las personas se enfadan entre ellas.','Q4',54),('5f527ac6-2089-11f0-a293-a0294223b12a',2,'Lo que este mundo necesita es:','A',55),('5f527c51-2089-11f0-a293-a0294223b12a',2,'Prefiero los juegos en los que:','C',56),('5f527dea-2089-11f0-a293-a0294223b12a',2,'Normalmente dejo algunas cosas a la buena suerte en vez de hacer planes complejos y con detalle.','E',57),('5f527f87-2089-11f0-a293-a0294223b12a',2,'Frecuentemente tengo periodos de tiempo  en que me es difícil abandonar el sentimiento de compadecerme a mí mismo/a.','F',58),('5f528128-2089-11f0-a293-a0294223b12a',2,'Mis mejores horas del día son aquellos en que estoy solo con mis pensamientos y proyectos.','G',59),('5f5282ae-2089-11f0-a293-a0294223b12a',2,'Si la gente me interrumpe cuando estoy intentando hacer algo, eso no me perturba.','H',60),('5f52842e-2089-11f0-a293-a0294223b12a',2,'Siempre conservo mis pertenencias en perfectas condiciones.','I',61),('5f5285a3-2089-11f0-a293-a0294223b12a',2,'A veces me siento frustrado por las personas demasiado rápidamente.','L',62),('5f52872a-2089-11f0-a293-a0294223b12a',2,'No me siento a gusto cuando hablo o muestro mis sentimientos de afecto o cariño.','M',63),('5f5288b0-2089-11f0-a293-a0294223b12a',2,'En mi vida personal casi siempre alcanzo las metas que me pongo.','N',64),('5f528a27-2089-11f0-a293-a0294223b12a',2,'Si el sueldo fuera el mismo preferiría ser un científico más que un directivo de ventas.','M',65),('5f528ba3-2089-11f0-a293-a0294223b12a',2,'Si la gente hace algo incorrecto, normalmente le digo lo que pienso.','Q1',66),('5f528d21-2089-11f0-a293-a0294223b12a',2,'Pienso que mis necesidades emocionales:','O',67),('5f528eb7-2089-11f0-a293-a0294223b12a',2,'Normalmente me gusta estar en medio de mucha actividad y excitación.','Q1',68),('5f52905c-2089-11f0-a293-a0294223b12a',2,'La gente debería insistir, más de lo que hace ahora, en que las normas morales sean seguidas estrictamente.','Q2',69),('5f5291d3-2089-11f0-a293-a0294223b12a',2,'Prefiero vestir:','Q3',70),('5f529343-2089-11f0-a293-a0294223b12a',2,'Me suelo sentir desconcertado si de pronto paso a ser el centro de la atención en un grupo social.','IM',71),('5f5294ac-2089-11f0-a293-a0294223b12a',2,'Me pone irritado que la gente insista en que yo siga las mínimas reglas de seguridad.','Q4',72),('5f529662-2089-11f0-a293-a0294223b12a',2,'Comenzar a conversar con extraños:','A',73),('5f5297ce-2089-11f0-a293-a0294223b12a',2,'Si trabajara en un periódico, preferiría los temas de:','C',74),('5f529941-2089-11f0-a293-a0294223b12a',2,'Dejo que pequeñas csas me perturben más de lo que debieran.','E',75),('5f529aac-2089-11f0-a293-a0294223b12a',2,'Es acertado estar en guardia con los que hablan de modo amable, porque se pueden aprovechar de uno.','F',76),('5f529c18-2089-11f0-a293-a0294223b12a',2,'En la calle me detendría más a contemplar a un artista pintando que a ver la construcción de un edificio.','G',77),('5f529d84-2089-11f0-a293-a0294223b12a',2,'Las personas se hacen perezosas en su trabajo cuando consiguen hacerlo con facilidad.','H',78),('5f529eeb-2089-11f0-a293-a0294223b12a',2,'Se me ocurren ideas nuevas sobre todo tipo de cosas, demasiadas para ponerlas en práctica.','I',79),('5f52a057-2089-11f0-a293-a0294223b12a',2,'Cuando hablo con alguien que no conozco todavía, no doy más informacion que la necesaria.','L',80),('5f52a1c1-2089-11f0-a293-a0294223b12a',2,'Pongo más atención en:','M',81),('5f52a332-2089-11f0-a293-a0294223b12a',2,'Cuando la gente me critica delante de otros me siento muy descorazonado/a y herido/a.','N',82),('5f52a46e-2089-11f0-a293-a0294223b12a',2,'Encuentro más interesante a la gente si sus puntos de vista son diferentes de los de la mayoría.','M',83),('5f52a571-2089-11f0-a293-a0294223b12a',2,'Al tratar con la gente es mejor:','Q1',84),('5f52a689-2089-11f0-a293-a0294223b12a',2,'A veces me gustaría más ponerme en mi sitio que perdonar y olvidar.','O',85),('5f52a79c-2089-11f0-a293-a0294223b12a',2,'Me gusta la gente que:','Q1',86),('5f52a8a9-2089-11f0-a293-a0294223b12a',2,'A veces me siento demasiado responsable sobre las cosas que suceden a mi alrededor.','Q2',87),('5f52a9a4-2089-11f0-a293-a0294223b12a',2,'El trabajo que me es familiar y habitual:','Q3',88),('5f52aaad-2089-11f0-a293-a0294223b12a',2,'Logro terminar las cosas mejor cuando trabajo solo que cuando lo hago en equipo.','IM',89),('5f52abbf-2089-11f0-a293-a0294223b12a',2,'Normalmente no me importa si mi habitación está desordenada','Q4',90),('5f52ace0-2089-11f0-a293-a0294223b12a',2,'Me  resulta fácil ser paciente, aun cuando alguien es lento para comprender lo que estoy explicándole.','A',91),('5f52ae26-2089-11f0-a293-a0294223b12a',2,'Me gusta unirme a otros que van a hacer algo juntos, como ir a un museo o de excursión.','C',92),('5f52af5a-2089-11f0-a293-a0294223b12a',2,'Soy algo perfeccionista y me gusta que las cosas se hagan bien.','E',93),('5f52b079-2089-11f0-a293-a0294223b12a',2,'Cuando tengo que hacer una larga cola por algún motivo, no me pongo tan intranquilo y nervioso como la mayoría.','F',94),('5f52b194-2089-11f0-a293-a0294223b12a',2,'La gente me trata menos razonablemente de lo que merecen mis buenas intenciones.','G',95),('5f52b2a6-2089-11f0-a293-a0294223b12a',2,'Me la paso bien con gente que muestra abiertamente sus emociones.','H',96),('5f52b3d1-2089-11f0-a293-a0294223b12a',2,'No dejo que me depriman pequeñas cosas.','I',97),('5f52b4ee-2089-11f0-a293-a0294223b12a',2,'Si pudiera ayudar en el desarrollo de un invento útil preferiría encargarme de:','L',98),('5f52b609-2089-11f0-a293-a0294223b12a',2,'Si ser cortés y amable no da resultado puedo ser rudo y astuto cuando sea necesario.','M',99),('5f52b742-2089-11f0-a293-a0294223b12a',2,'Me gusta ir a menudo a espectáculos y diversiones.','N',100),('5f52b861-2089-11f0-a293-a0294223b12a',2,'Me siento insatisfecho conmigo mismo/a.','O',101),('5f52b981-2089-11f0-a293-a0294223b12a',2,'Si nos perdiéramos en una ciudad y los amigos no estuvieran de acuerdo conmigo en el camino a  seguir:','Q1',102),('5f52baa5-2089-11f0-a293-a0294223b12a',2,'La gente me considera una persona animada y sin preocupaciones.','O',103),('5f52bbad-2089-11f0-a293-a0294223b12a',2,'Si el banco se descuidara y no me cobrara algo que debiera, creo que:','Q1',104),('5f52bcb3-2089-11f0-a293-a0294223b12a',2,'Siempre tengo que estar luchando contra mi timidez.','Q2',105),('5f52be35-2089-11f0-a293-a0294223b12a',2,'Los profesores, sacerdotes y otras personas emplean mucho tiempo intentando impedirnos hacer lo que deseamos.','Q3',106),('5f52bf43-2089-11f0-a293-a0294223b12a',2,'Cuando estoy con un grupo, normalmente me siento, escucho y dejo que los demás lleven el peso de la conversación.','IM',107),('5f52c059-2089-11f0-a293-a0294223b12a',2,'Normalmente aprecio más la belleza de un poema que una excelente estrategia en un deporte.','Q4',108),('5f52c15b-2089-11f0-a293-a0294223b12a',2,'Si uno es franco y abierto los demás intentan aprovecharse de él.','A',109),('5f52c25c-2089-11f0-a293-a0294223b12a',2,'Siempre me interesan las cosas mecánicas y soy bastante bueno para arreglarlas.','C',110),('5f52c352-2089-11f0-a293-a0294223b12a',2,'A veces estoy tan enfrascado en mis pensamientos que, a no ser que salga de ellos, pierdo la noción del tiempo y desordeno o no encuentro mis cosas.','E',111),('5f52eb74-2089-11f0-a293-a0294223b12a',2,'Parece como si no pudiera confiar en más de la mitad de la gente que voy conociendo.','F',112),('5f52ee6e-2089-11f0-a293-a0294223b12a',2,'Normalmente descubro que conozco a los demás mejor que ellos me conocen a mí.','G',113),('5f52ef94-2089-11f0-a293-a0294223b12a',2,'A menudo los demás dicen que mis ideas son realistas y prácticas.','H',114),('5f52f09e-2089-11f0-a293-a0294223b12a',2,'Si creo que lo merecen, hago agudas y sarcásticas observaciones a los demás.','I',115),('5f52f1a9-2089-11f0-a293-a0294223b12a',2,'A veces me siento como si hubiera hecho algo malo, aunque realmente no lo haya hecho.','L',116),('5f52f2a6-2089-11f0-a293-a0294223b12a',2,'Me resulta fácil hablar sobre mi vida, incluso sobre aspectos que otros considerarían muy personales.','I',117),('5f52f39e-2089-11f0-a293-a0294223b12a',2,'Me gusta diseñar modos por los que el mundo pudiera cambiar y mejorar.','N',118),('5f52f48e-2089-11f0-a293-a0294223b12a',2,'Tiendo a ser muy sensible y preocuparme mucho acerca de algo que he hecho.','O',119),('5f52f57f-2089-11f0-a293-a0294223b12a',2,'En el periódico que acostumbro a hojear me interesa más por:','Q1',120),('5f52f677-2089-11f0-a293-a0294223b12a',2,'Preferiría emplear una tarde libre en:','O',121),('5f52f758-2089-11f0-a293-a0294223b12a',2,'Cuando hay algo molesto que hacer, prefiero:','Q3',122),('5f52f84d-2089-11f0-a293-a0294223b12a',2,'Prefiero tomar la comida de mediodía:','Q2',123),('5f52f94f-2089-11f0-a293-a0294223b12a',2,'Soy paciente con las personas, incluso cuando no son corteses y consideradas con mis sentimientos.','Q3',124),('5f52fa5d-2089-11f0-a293-a0294223b12a',2,'Cuando hago algo, normalmente me tomo tiempo para pensar antes en todo lo que necesito para la tarea.','IM',125),('5f52fb54-2089-11f0-a293-a0294223b12a',2,'Me siento molesto cuando la gente emplea mucho tiempo para explicar algo.','Q4',126),('5f52fc46-2089-11f0-a293-a0294223b12a',2,'Mis amigos probablemente me describen como una persona:','A',127),('5f52fd36-2089-11f0-a293-a0294223b12a',2,'Cuando algo me perturba, normalmente me olvido pronto de ello.','C',128),('5f52fe4b-2089-11f0-a293-a0294223b12a',2,'Como afición agradable prefiero:','E',129),('5f52ff3e-2089-11f0-a293-a0294223b12a',2,'Creo que debo reclamar si en el restaurante recibo mal servicio o alimentos deficientes.','F',130),('5f530028-2089-11f0-a293-a0294223b12a',2,'Tengo más cambios de humor que la mayoría de las personas que conozco.','G',131),('5f530121-2089-11f0-a293-a0294223b12a',2,'Cuando los demás no ven las cosas como las veo yo, normalmente logro convencerlos.','H',132),('5f530344-2089-11f0-a293-a0294223b12a',2,'Creo que ser libre para hacer lo que desee es más importante que tener buenos modales y respectar las normas.','I',133),('5f530519-2089-11f0-a293-a0294223b12a',2,'Me encanta hacer reír a la gente con historias ingeniosas.','L',134),('5f5306ad-2089-11f0-a293-a0294223b12a',2,'Me considero una persona socialmente muy atrevida y comunicativa.','I',135),('5f530840-2089-11f0-a293-a0294223b12a',2,'Si una persona es lo suficientemente lista para eludir las normas sin que parezca que las incumple:','N',136),('5f5309c0-2089-11f0-a293-a0294223b12a',2,'Cuando me uno a un nuevo grupo, normalmente encajo pronto.','O',137),('5f530b2c-2089-11f0-a293-a0294223b12a',2,'Prefiero leer historias rudas o de acción realista más que novelas sentimentales e imaginativas.','Q1',138),('5f530ca0-2089-11f0-a293-a0294223b12a',2,'Sospecho que la persona que se muestra abiertamente amigable conmigo pueda ser desleal cuando yo no esté delante.','O',139),('5f530e24-2089-11f0-a293-a0294223b12a',2,'Cuando era niño empleaba la mayor parte de mi tiempo en','Q3',140),('5f530f9c-2089-11f0-a293-a0294223b12a',2,'Muchas personas son demasiado quisquillosas y sensibles, y por su propio bien deberían \"endurecerse\".','IM',141),('5f531116-2089-11f0-a293-a0294223b12a',2,'Me muestro tan interesado en pensar en las ideas que a veces paso por alto los detalles prácticos.','Q3',142),('5f53128c-2089-11f0-a293-a0294223b12a',2,'Si alguien me hace una pregunta demasiado personal intento cuidadosamente evitar contestarla.','IM',143),('5f5313fb-2089-11f0-a293-a0294223b12a',2,'Cuando me piden hacer una tarea voluntaria digo que estoy demasiado ocupado.','Q4',144),('5f531524-2089-11f0-a293-a0294223b12a',2,'Mis amigos me consideran una persona algo abstraída y no siempre práctica.','A',145),('5f531618-2089-11f0-a293-a0294223b12a',2,'Me siento muy abatido cuando la gente me critica en un grupo.','C',146),('5f5316fa-2089-11f0-a293-a0294223b12a',2,'Les surgen más problemas a quienes:','E',147),('5f5317d4-2089-11f0-a293-a0294223b12a',2,'Soy muy cuidadoso cuando se trata de elegir a alguien con quien \"abrirme\" francamente.','F',148),('5f531926-2089-11f0-a293-a0294223b12a',2,'Me gusta más intentar nuevos modos de hacer las cosas que seguir caminos ya conocidos.','G',149),('5f531a94-2089-11f0-a293-a0294223b12a',2,'Los demás dicen que suelo ser demasiado/a crítico/a conmigo mismo/a','H',150),('5f531c01-2089-11f0-a293-a0294223b12a',2,'Generalmente me gusta más una comida si contiene alimentos familiares y cotidianos que si tiene alimentos poco corrientes.','I',151),('5f531d82-2089-11f0-a293-a0294223b12a',2,'Puedo pasar fácilmente una mañana entera sin tener necesidad de hablar con alguien.','L',152),('5f531f03-2089-11f0-a293-a0294223b12a',2,'Deseo ayudar a las personas.','I',153),('5f532088-2089-11f0-a293-a0294223b12a',2,'Yo creo que:','N',154),('5f532188-2089-11f0-a293-a0294223b12a',2,'Me resulta difícil ser paciente cuando la gente me critica.','O',155),('5f532302-2089-11f0-a293-a0294223b12a',2,'Prefiero los momentos en que hay gente a mi alrededor.','N',156),('5f5323fa-2089-11f0-a293-a0294223b12a',2,'Cuando realizo una tarea no me encuentro satisfecho a no ser que ponga especial atención incluso a los pequeños detalles.','O',157),('5f532508-2089-11f0-a293-a0294223b12a',2,'Algunas veces me \"sacan de quicio\" de un modo insoportable pequeñas  cosas, aunque reconozca que son triviales.','Q3',158),('5f5325f7-2089-11f0-a293-a0294223b12a',2,'Me gusta más escuchar a la gente hablar de sus sentimientos personales que de otros temas.','IM',159),('5f5326eb-2089-11f0-a293-a0294223b12a',2,'Hay ocasiones en que no me siento de humor para ver a nadie.','Q3',160),('5f5328c7-2089-11f0-a293-a0294223b12a',2,'Me gustaría más ser consejero orientador que arquitecto.','IM',161),('5f5329ba-2089-11f0-a293-a0294223b12a',2,'En mi vida cotidiana casi nunca me encuentro con problemas que no puedo afrontar.','IM',162),('5f532a93-2089-11f0-a293-a0294223b12a',2,'Cuando las personas hacen algo que me molesta, normalmente:','A',163),('5f53755b-2089-11f0-a293-a0294223b12a',2,'Yo creo más en:','C',164),('5f5377ce-2089-11f0-a293-a0294223b12a',2,'Me gusta que haya alguna compettividad en las cosas que hago.','E',165),('5f5378e8-2089-11f0-a293-a0294223b12a',2,'La mayoría de las normas se han hecho para no cumplirlas cuando haya buenas razones para ello','F',166),('5f5379e0-2089-11f0-a293-a0294223b12a',2,'Me cuesta bastante hablar delante de un grupo numeroso de personas.','E',167),('5f537ad0-2089-11f0-a293-a0294223b12a',2,'Preferiría un hogar en el que:','H',168),('5f537bbc-2089-11f0-a293-a0294223b12a',2,'En las reuniones sociales suelo sentirme tímido e inseguro de mí mismo/a.','I',169),('5f537cab-2089-11f0-a293-a0294223b12a',2,'En la televisión prefiero:','L',170),('5f537d8e-2089-11f0-a293-a0294223b12a',2,'“Minuto” es a “hora” como “segundo” es a:','B',171),('5f537e75-2089-11f0-a293-a0294223b12a',2,'\"Renacuajo\" es a \"rana\" como \"larva\" es a:','B',172),('5f537f5e-2089-11f0-a293-a0294223b12a',2,'“Jamón” es a “cerdo” como “chuleta” es a:','B',173),('5f53803f-2089-11f0-a293-a0294223b12a',2,'“Hielo” es a “agua” como “roca” es a:','B',174),('5f538122-2089-11f0-a293-a0294223b12a',2,'“Mejor” es a “pésimo” como “peor” es a:','B',175),('5f538202-2089-11f0-a293-a0294223b12a',2,'¿Cuál de las tres palabras indica algo diferente de las otras dos?','B',176),('5f5382e5-2089-11f0-a293-a0294223b12a',2,'¿Cuál de las tres palabras indica algo diferente de las otras dos?','B',177),('5f5383cb-2089-11f0-a293-a0294223b12a',2,'Lo opuesto de “correcto” es lo opuesto de:','B',178),('5f5384ae-2089-11f0-a293-a0294223b12a',2,'¿Cuál de las tres palabras indica algo diferente de las otras dos?','B',179),('5f538598-2089-11f0-a293-a0294223b12a',2,'Lo opuesto de lo opuesto de “inexacto” es:','B',180),('5f53867f-2089-11f0-a293-a0294223b12a',2,'¿Qué número debe seguir al final de éstos? 1 – 4 – 9 – 16…','B',181),('5f538762-2089-11f0-a293-a0294223b12a',2,'¿Qué letra debe seguir al final de éstas?    A – B – D – G...','B',182),('5f538844-2089-11f0-a293-a0294223b12a',2,'¿Qué letra debe seguir al final de éstas? E – I – L…','B',183),('5f538924-2089-11f0-a293-a0294223b12a',2,'¿Qué número debe seguir al final de éstos? 1/12 – 1/6 – 1/3 – 2/3...','B',184),('5f538a0c-2089-11f0-a293-a0294223b12a',2,'¿Qué número debe seguir al final de éstos? 1  2  0  3  -1…','B',185);
/*!40000 ALTER TABLE `preguntas16pf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preguntasformatoentrevista`
--

DROP TABLE IF EXISTS `preguntasformatoentrevista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preguntasformatoentrevista` (
  `idPreguntaFormatoEntrevista` int NOT NULL AUTO_INCREMENT,
  `nombrePreguntaFormatoEntrevista` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tipoPregunta` varchar(60) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `seccion` varchar(60) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`idPreguntaFormatoEntrevista`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preguntasformatoentrevista`
--

LOCK TABLES `preguntasformatoentrevista` WRITE;
/*!40000 ALTER TABLE `preguntasformatoentrevista` DISABLE KEYS */;
INSERT INTO `preguntasformatoentrevista` VALUES (103,'Fecha','date','Datos personales'),(104,'Nombre','text','Datos personales'),(105,'Apellido Paterno','text','Datos personales'),(106,'Apellido Materno','text','Datos personales'),(107,'Fecha de Nacimiento','date','Datos personales'),(108,'Edad','number','Datos personales'),(109,'Género','text','Datos personales'),(110,'Estado Civil','text','Datos personales'),(111,'Nacionalidad','text','Datos personales'),(112,'Estado de origen','text','Datos personales'),(113,'Dirección Actual','text','Datos personales'),(114,'Teléfono Fijo','tel','Datos personales'),(115,'Celular','tel','Datos personales'),(116,'Correo','email','Datos personales'),(117,'Realice una descripción amplia de su persona','textarea','Datos personales'),(118,'Describa su estado de ánimo cotidiano','textarea','Datos personales'),(119,'Describa su estado de ánimo en situaciones de presión','textarea','Datos personales'),(120,'Describa su estado de ánimo en situaciones críticas','textarea','Datos personales'),(121,'¿Cómo considera que es su estado de salud?','textarea','Datos personales'),(122,'¿A qué dedica sus tiempos libres?','textarea','Datos personales'),(123,'Nombre de la Licenciatura','text','Datos academicos'),(124,'Institución de Procedencia','text','Datos academicos'),(125,'Promedio de egreso','number','Datos academicos'),(126,'Generación (año)','number','Datos academicos'),(127,'Grado máximo de estudios','text','Datos academicos'),(128,'Maestría o especialidad (en caso de tener)','text','Datos academicos'),(129,'Institución donde curso la Maestría','text','Datos academicos'),(130,'Promedio de egreso de la Maestría','number','Datos academicos'),(131,'Cursos y Diplomados (Escribir los de los últimos tres años)','textarea','Datos academicos'),(132,'Idiomas que domina','textarea','Datos academicos'),(133,'¿Cómo considera que ha sido su desempeño académico hasta llegar a este posgrado?','textarea','Datos academicos'),(134,'¿Cuáles han sido los cursos de actualización, los seminarios o congresos a los que ha asistido que le han brindado mayores herramientas en su desarrollo profesional o personal?','textarea','Datos academicos'),(135,'¿Cómo surge el interés en este programa de posgrado?','textarea','Datos academicos'),(136,'¿Cuál es la finalidad de estudiar este posgrado y cómo se integrará en sus experiencias personales y/o profesionales?','textarea','Datos academicos'),(137,'¿Cuáles son sus expectativas acerca de las aportaciones que le pueda hacer este posgrado?','textarea','Datos academicos'),(138,'Explique su visión respecto a su desarrollo profesional en años posteriores a su egreso de este posgrado','textarea','Datos academicos'),(139,'¿Está dispuesto a cambiar de residencia?','textarea','Datos academicos'),(140,'Escribe el último trabajo en el que te desempeñaste','text','Datos laborales'),(141,'Lugar donde trabaja','text','Datos laborales'),(142,'Nombre de la empresa','text','Datos laborales'),(143,'Puesto que desempeña','text','Datos laborales'),(144,'Años en la empresa','number','Datos laborales'),(145,'Actividades que realiza','textarea','Datos laborales'),(146,'Sueldo que percibe','number','Datos laborales'),(147,'Tiene personal a su cargo','text','Datos laborales'),(148,'¿Cómo considera que es la relación que tiene con su jefe inmediato?','textarea','Datos laborales'),(149,'¿Cuál es la relación que tiene con el personal a su cargo?','textarea','Datos laborales'),(150,'¿Cuál es el mayor reto que se ha encontrado en los trabajos que ha tenido y como lo ha resuelto?','textarea','Datos laborales'),(151,'¿La empresa en la que trabaja está enterada de sus intereses académicos?','textarea','Datos laborales'),(152,'¿Cuál ha sido la reacción de la empresa ante estos intereses?','textarea','Datos laborales'),(153,'¿Considera combinar sus actividades profesionales con las académicas?','textarea','Datos laborales');
/*!40000 ALTER TABLE `preguntasformatoentrevista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preguntashartman`
--

DROP TABLE IF EXISTS `preguntashartman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preguntashartman` (
  `idPreguntaHartman` int NOT NULL AUTO_INCREMENT,
  `idPrueba` int NOT NULL,
  `fasePregunta` int NOT NULL,
  `numeroPregunta` int NOT NULL,
  `preguntaHartman` varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  `valorHartman` varchar(5) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`idPreguntaHartman`),
  KEY `idPrueba` (`idPrueba`),
  CONSTRAINT `preguntashartman_ibfk_1` FOREIGN KEY (`idPrueba`) REFERENCES `pruebas` (`idPrueba`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preguntashartman`
--

LOCK TABLES `preguntashartman` WRITE;
/*!40000 ALTER TABLE `preguntashartman` DISABLE KEYS */;
INSERT INTO `preguntashartman` VALUES (1,3,1,1,'Una buena comida','6'),(2,3,1,2,'Un mejoramiento técnico','9'),(3,3,1,3,'Una idea absurda','10'),(4,3,1,4,'Una multa','11'),(5,3,1,5,'Basura','13'),(6,3,1,6,'Un científico dedicado','5'),(7,3,1,7,'Hacer estallar un avión en vuelo con pasajeros dentro','17'),(8,3,1,8,'Quemar un hereje en la hoguera','16'),(9,3,1,9,'Un cortocircuito eléctrico','12'),(10,3,1,10,'Con este anillo de tomo por espos@','4'),(11,3,1,11,'Un bebe','1'),(12,3,1,12,'Torturar una persona','18'),(13,3,1,13,'Amor a la naturaleza','2'),(14,3,1,14,'Un chiflado','14'),(15,3,1,15,'Una línea de producción en serie','8'),(16,3,1,16,'Esclavitud','15'),(17,3,1,17,'Un genio matemático','3'),(18,3,1,18,'Un uniforme','7'),(19,3,2,1,'Me gusta mi trabajo y me hace bien','6'),(20,3,2,2,'El universo es un sistema notablemente armonioso','9'),(21,3,2,3,'El mundo no tiene mucho sentido para mi','10'),(22,3,2,4,'Por más intensamente que trabaje, siempre me sentiré frustrado','11'),(23,3,2,5,'Las condiciones en en que trabajo son lamentables y arruinan mi labor','13'),(24,3,2,6,'Yo me siento a gusto en el mundo','5'),(25,3,2,7,'Detesto mi trabajo','17'),(26,3,2,8,'Mi via está trastornando al mundo','16'),(27,3,2,9,'Mi trabajo no contribuye con nada al mundo','12'),(28,3,2,10,'Mi trabajo pone de manifiesto lo mejor que hay en mí','4'),(29,3,2,11,'Estoy contento con ser yo mismo','1'),(30,3,2,12,'Maldigo el día en que nací','18'),(31,3,2,13,'Me encanta mi trabajo','2'),(32,3,2,14,'Me molesta que el Universo no tenga sentido','14'),(33,3,2,15,'Cuanto mejor comprendo mi lugar en el mundo, tanto mejor me va en mi trabajo','8'),(34,3,2,16,'Mi trabajo me hace desdichado','15'),(35,3,2,17,'Amor la belleza del mundo','3'),(36,3,2,18,'Mi trabajo contribuye a la belleza y armonía del mundo','7');
/*!40000 ALTER TABLE `preguntashartman` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preguntaskostick`
--

DROP TABLE IF EXISTS `preguntaskostick`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preguntaskostick` (
  `idPreguntaKostick` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `idPrueba` int DEFAULT NULL,
  `numeroPreguntaKostick` int DEFAULT NULL,
  PRIMARY KEY (`idPreguntaKostick`),
  KEY `idPrueba` (`idPrueba`),
  CONSTRAINT `preguntaskostick_ibfk_1` FOREIGN KEY (`idPrueba`) REFERENCES `pruebas` (`idPrueba`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preguntaskostick`
--

LOCK TABLES `preguntaskostick` WRITE;
/*!40000 ALTER TABLE `preguntaskostick` DISABLE KEYS */;
INSERT INTO `preguntaskostick` VALUES ('a0cdfd30-2088-11f0-a293-a0294223b12a',1,1),('a0cf3170-2088-11f0-a293-a0294223b12a',1,2),('a0cf36b4-2088-11f0-a293-a0294223b12a',1,3),('a0cf389b-2088-11f0-a293-a0294223b12a',1,4),('a0cf39e2-2088-11f0-a293-a0294223b12a',1,5),('a0cf4b35-2088-11f0-a293-a0294223b12a',1,6),('a0cf4ea0-2088-11f0-a293-a0294223b12a',1,7),('a0cf5078-2088-11f0-a293-a0294223b12a',1,8),('a0cf5208-2088-11f0-a293-a0294223b12a',1,9),('a0cf537b-2088-11f0-a293-a0294223b12a',1,10),('a0cf54e5-2088-11f0-a293-a0294223b12a',1,11),('a0cf5664-2088-11f0-a293-a0294223b12a',1,12),('a0cf57d9-2088-11f0-a293-a0294223b12a',1,13),('a0cf5949-2088-11f0-a293-a0294223b12a',1,14),('a0cf5ab4-2088-11f0-a293-a0294223b12a',1,15),('a0cf5c12-2088-11f0-a293-a0294223b12a',1,16),('a0cf5d8d-2088-11f0-a293-a0294223b12a',1,17),('a0cf5ef1-2088-11f0-a293-a0294223b12a',1,18),('a0cf6047-2088-11f0-a293-a0294223b12a',1,19),('a0cf61b0-2088-11f0-a293-a0294223b12a',1,20),('a0cf6311-2088-11f0-a293-a0294223b12a',1,21),('a0cf6478-2088-11f0-a293-a0294223b12a',1,22),('a0cf6615-2088-11f0-a293-a0294223b12a',1,23),('a0cf6787-2088-11f0-a293-a0294223b12a',1,24),('a0cf68f4-2088-11f0-a293-a0294223b12a',1,25),('a0cf6a5b-2088-11f0-a293-a0294223b12a',1,26),('a0cf6bbd-2088-11f0-a293-a0294223b12a',1,27),('a0cf6d22-2088-11f0-a293-a0294223b12a',1,28),('a0cf6e86-2088-11f0-a293-a0294223b12a',1,29),('a0cf70a0-2088-11f0-a293-a0294223b12a',1,30),('a0cf724f-2088-11f0-a293-a0294223b12a',1,31),('a0cf73bb-2088-11f0-a293-a0294223b12a',1,32),('a0cf752b-2088-11f0-a293-a0294223b12a',1,33),('a0cf7678-2088-11f0-a293-a0294223b12a',1,34),('a0cf77ca-2088-11f0-a293-a0294223b12a',1,35),('a0cf791d-2088-11f0-a293-a0294223b12a',1,36),('a0cf7a8e-2088-11f0-a293-a0294223b12a',1,37),('a0cf7bdd-2088-11f0-a293-a0294223b12a',1,38),('a0cf7d32-2088-11f0-a293-a0294223b12a',1,39),('a0cf7e84-2088-11f0-a293-a0294223b12a',1,40),('a0cf7fe2-2088-11f0-a293-a0294223b12a',1,41),('a0cf813d-2088-11f0-a293-a0294223b12a',1,42),('a0cf82cb-2088-11f0-a293-a0294223b12a',1,43),('a0cf8425-2088-11f0-a293-a0294223b12a',1,44),('a0cf857a-2088-11f0-a293-a0294223b12a',1,45),('a0cf86d3-2088-11f0-a293-a0294223b12a',1,46),('a0cf8827-2088-11f0-a293-a0294223b12a',1,47),('a0cf8978-2088-11f0-a293-a0294223b12a',1,48),('a0cf8ac8-2088-11f0-a293-a0294223b12a',1,49),('a0cf8c16-2088-11f0-a293-a0294223b12a',1,50),('a0cf8ebc-2088-11f0-a293-a0294223b12a',1,51),('a0cf901b-2088-11f0-a293-a0294223b12a',1,52),('a0cf916c-2088-11f0-a293-a0294223b12a',1,53),('a0cf92bb-2088-11f0-a293-a0294223b12a',1,54),('a0cf93ff-2088-11f0-a293-a0294223b12a',1,55),('a0cf9566-2088-11f0-a293-a0294223b12a',1,56),('a0cf96cc-2088-11f0-a293-a0294223b12a',1,57),('a0cf9822-2088-11f0-a293-a0294223b12a',1,58),('a0cf997f-2088-11f0-a293-a0294223b12a',1,59),('a0cf9acf-2088-11f0-a293-a0294223b12a',1,60),('a0cf9c23-2088-11f0-a293-a0294223b12a',1,61),('a0cf9d84-2088-11f0-a293-a0294223b12a',1,62),('a0cf9f00-2088-11f0-a293-a0294223b12a',1,63),('a0cfa06c-2088-11f0-a293-a0294223b12a',1,64),('a0cfa1eb-2088-11f0-a293-a0294223b12a',1,65),('a0cfa382-2088-11f0-a293-a0294223b12a',1,66),('a0cfa544-2088-11f0-a293-a0294223b12a',1,67),('a0cfa6cb-2088-11f0-a293-a0294223b12a',1,68),('a0cfa84a-2088-11f0-a293-a0294223b12a',1,69),('a0cfa9ad-2088-11f0-a293-a0294223b12a',1,70),('a0cfab06-2088-11f0-a293-a0294223b12a',1,71),('a0cfac79-2088-11f0-a293-a0294223b12a',1,72),('a0cfadde-2088-11f0-a293-a0294223b12a',1,73),('a0cfaf45-2088-11f0-a293-a0294223b12a',1,74),('a0cfb0ef-2088-11f0-a293-a0294223b12a',1,75),('a0cfb254-2088-11f0-a293-a0294223b12a',1,76),('a0cfb3c4-2088-11f0-a293-a0294223b12a',1,77),('a0cfb53a-2088-11f0-a293-a0294223b12a',1,78),('a0cfb6b1-2088-11f0-a293-a0294223b12a',1,79),('a0cfb828-2088-11f0-a293-a0294223b12a',1,80),('a0cfb99c-2088-11f0-a293-a0294223b12a',1,81),('a0cfbaf4-2088-11f0-a293-a0294223b12a',1,82),('a0cfbc52-2088-11f0-a293-a0294223b12a',1,83),('a0cfbda5-2088-11f0-a293-a0294223b12a',1,84),('a0cfbf09-2088-11f0-a293-a0294223b12a',1,85),('a0cfc091-2088-11f0-a293-a0294223b12a',1,86),('a0cfc201-2088-11f0-a293-a0294223b12a',1,87),('a0cfc379-2088-11f0-a293-a0294223b12a',1,88),('a0cfc4e0-2088-11f0-a293-a0294223b12a',1,89),('a0cfc64c-2088-11f0-a293-a0294223b12a',1,90);
/*!40000 ALTER TABLE `preguntaskostick` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preguntasotis`
--

DROP TABLE IF EXISTS `preguntasotis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preguntasotis` (
  `idPreguntaOtis` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `idPrueba` int DEFAULT NULL,
  `numeroPregunta` int DEFAULT NULL,
  `preguntaOtis` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `idAreaOtis` int DEFAULT NULL,
  PRIMARY KEY (`idPreguntaOtis`),
  KEY `idPrueba` (`idPrueba`),
  KEY `fk_PO_A` (`idAreaOtis`),
  CONSTRAINT `fk_PO_A` FOREIGN KEY (`idAreaOtis`) REFERENCES `areasotis` (`idAreaOtis`),
  CONSTRAINT `preguntasotis_ibfk_1` FOREIGN KEY (`idPrueba`) REFERENCES `pruebas` (`idPrueba`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preguntasotis`
--

LOCK TABLES `preguntasotis` WRITE;
/*!40000 ALTER TABLE `preguntasotis` DISABLE KEYS */;
INSERT INTO `preguntasotis` VALUES ('951751e8-1508-11f0-90d1-020197ac33d8',5,1,'¿Qué expresa mejor lo que es un martillo?',1),('95175528-1508-11f0-90d1-020197ac33d8',5,2,'¿Cuál de estas cinco palabras significa lo contrario de GANAR?',1),('95175649-1508-11f0-90d1-020197ac33d8',5,3,'La hierba es para la vaca lo que el pan es para…',2),('95175731-1508-11f0-90d1-020197ac33d8',5,4,'¿Qué es para el automóvil lo que el carbón es para la locomotora?',2),('951757f9-1508-11f0-90d1-020197ac33d8',5,5,'Los números que vienen aquí debajo forman una serie y uno de ellos no es correcto. ¿Qué número debería figurar en su lugar?            5  10  15  20  25  30  35  39  45  50',5),('951758d5-1508-11f0-90d1-020197ac33d8',5,6,'La mano es para el brazo lo que el pie es para…',2),('95175994-1508-11f0-90d1-020197ac33d8',5,7,'De un muchacho que no hace más que hablar de sus cualidades y de su sabiduría, se dice que…',1),('95175a52-1508-11f0-90d1-020197ac33d8',5,8,'De una persona que tiene deseos de hacer una cosa pero teme al fracaso, se dice que es…',1),('95175b18-1508-11f0-90d1-020197ac33d8',5,9,'El sombrero es para la cabeza lo que el dedal es para…',2),('95175d1e-1508-11f0-90d1-020197ac33d8',5,10,'El hijo de la hermana de mi padre es mi…',2),('95175e21-1508-11f0-90d1-020197ac33d8',5,11,'¿Cuál de estas cantidades es la mayor?',5),('95175ee5-1508-11f0-90d1-020197ac33d8',5,12,'Cuando sabemos que un acontecimiento va a pasar sin ninguna clase de dudas, decimos que es…',1),('95175f9f-1508-11f0-90d1-020197ac33d8',5,13,'¿Qué palabra indica el lado opuesto de ESTE?',1),('95176059-1508-11f0-90d1-020197ac33d8',5,14,'¿Qué palabra indica lo contrario a SOBERBIA? ',1),('95176108-1508-11f0-90d1-020197ac33d8',5,15,'¿Cuál de estas cinco cosas no debería agruparse a las demás?',2),('951761cb-1508-11f0-90d1-020197ac33d8',5,16,'¿Qué definición de éstas expresa más exactamente lo que es un reloj?',4),('9517629a-1508-11f0-90d1-020197ac33d8',5,17,'Si una persona, al salir de su casa, anda siete pasos hacia la derecha y después retrocede cuatro a la izquierda, ¿A cuantos pasos está de su casa? ',5),('95176370-1508-11f0-90d1-020197ac33d8',5,18,'Si comparamos el automóvil a una carreta, ¿A qué deberíamos comparar una motocicleta?',2),('95176439-1508-11f0-90d1-020197ac33d8',5,19,'¿Cuál es la razón por la cuál las fachadas de los comercios están muy iluminadas?',4),('95176501-1508-11f0-90d1-020197ac33d8',5,20,'¿Cuál de estas cinco cosas tiene más parecido con manzana, melocotón y pera?',1),('951765c2-1508-11f0-90d1-020197ac33d8',5,21,'En el abecedario, ¿Qué letra sigue de la K?',3),('9517667c-1508-11f0-90d1-020197ac33d8',5,22,'El Rey es a la monarquía lo que el Presidente es a…',2),('9517672a-1508-11f0-90d1-020197ac33d8',5,23,'La lana es para el carnero lo que las plumas son para…',2),('951767d1-1508-11f0-90d1-020197ac33d8',5,24,'¿Cuál de estas definiciones expresa más exactamente lo que es un cordero?',4),('95176888-1508-11f0-90d1-020197ac33d8',5,25,'Pesado es a plomo lo que sonoro es a…',2),('95176949-1508-11f0-90d1-020197ac33d8',5,26,'Mejor es a bueno lo que peor es a…',2),('95176a16-1508-11f0-90d1-020197ac33d8',5,27,'¿Cuál de estas cosas tiene más parecido con tenazas, alambre y clavo?',1),('95176ad2-1508-11f0-90d1-020197ac33d8',5,28,'Ante el dolor de los demás normalmente sentimos…',1),('95176ba8-1508-11f0-90d1-020197ac33d8',5,29,'Cuando alguien concibe una nueva máquina, se dice que ha hecho una…',1),('95176c72-1508-11f0-90d1-020197ac33d8',5,30,'¿Qué es para la abeja lo que las uñas son para el gato?',2),('95176d32-1508-11f0-90d1-020197ac33d8',5,31,'Uno de los números de esta serie está equivocado. ¿Qué número debería figurar en su lugar?                    1  7  2  7  3  7  4  7  5  7  6  7  8  7',5),('95176df2-1508-11f0-90d1-020197ac33d8',5,32,'¿Cuál es la principal razón por la que vemos cada día sustituir los carros por los automóviles?',4),('95176eb6-1508-11f0-90d1-020197ac33d8',5,33,'La corteza es para la naranja y la vaina es para el guisante lo que la cáscara es para…',2),('95176f7c-1508-11f0-90d1-020197ac33d8',5,34,'¿Qué es para el criminal lo que el hospital es para el enfermo?',2),('95177056-1508-11f0-90d1-020197ac33d8',5,35,'Si estos números estuviesen ordenados, ¿Por qué letra empezaría el del centro?      Ocho  Diez   Seis   Nueve   Siete',3),('9517711e-1508-11f0-90d1-020197ac33d8',5,36,'A 30 centavos la hoja de papel, ¿Cuántas podrán comprarse por 3 pesos?',5),('951771e6-1508-11f0-90d1-020197ac33d8',5,37,'De una cantidad que disminuye se dice que…',1),('95177333-1508-11f0-90d1-020197ac33d8',5,38,'Hay un refrán que dice \"No es oro todo lo que reluce\" y esto significa:',4),('951773f7-1508-11f0-90d1-020197ac33d8',5,39,'En una lengua extranjera KOLO quiere decir \"niño\" y DAAK KOLO \"niño bueno\", ¿Por qué letra empieza la palabra que significa \"bueno\" en ese idioma?',3),('951774bb-1508-11f0-90d1-020197ac33d8',5,40,'Este refrán, \"Más vale pájaro en mano que ciento volando\", quiere decir:',4),('95177587-1508-11f0-90d1-020197ac33d8',5,41,'¿Cuál de estas cinco cosas es más completa?',1),('95177645-1508-11f0-90d1-020197ac33d8',5,42,'Si estas palabras estuviesen convenientemente ordenadas para formar una frase, ¿Por qué letra empezaría la tercera palabra?      CON  DIME  ERES  QUIEN  DIRE  ANDAS  Y  TE  QUIEN',3),('95177708-1508-11f0-90d1-020197ac33d8',5,43,'Si Jorge es mayor que Pedro, y Pedro es mayor que Juan, entonces Jorge es ______ que Juan.',2),('951777d1-1508-11f0-90d1-020197ac33d8',5,44,'¿Cuál de estas palabras es la primera que aparece en el diccionario?',3),('95177895-1508-11f0-90d1-020197ac33d8',5,45,'Si las palabras General, Teniente, Soldado, Coronel y Alférez estuviesen colocadas indicando el orden jerárquico que significan, ¿Por qué letra empezaría la del centro?             (Alférez: Oficial de categoría menor al teniente)',3),('95177968-1508-11f0-90d1-020197ac33d8',5,46,'Hay un refrán que dice: \"Un grano no hace granero, pero ayuda al compañero\", y esto significa:',4),('95177a1e-1508-11f0-90d1-020197ac33d8',5,47,'Si Juan es mayor que José, y José tiene la misma edad que Carlos entonces…',2),('95177ace-1508-11f0-90d1-020197ac33d8',5,48,'Ordenando la frase que viene aquí debajo, ¿Por qué letra empezaría la última palabra?     A  FALTA  TORTAS  BUENAS  PAN  SON  DE',3),('95177b89-1508-11f0-90d1-020197ac33d8',5,49,'Si en una caja hubiera dos más pequeñas y dentro de cada una de estas dos hubiera cinco, ¿Cuántas habría en total?',5),('95177c3d-1508-11f0-90d1-020197ac33d8',5,50,'¿Qué indica mejor lo que es una mentira?',4),('95177cc3-1508-11f0-90d1-020197ac33d8',5,51,'En un idioma extranjero SOTO GRON quiere decir \"muy caliente\" y PASS GRON \"muy frío\", ¿Por qué letra empieza la palabra que significa \"muy\" en ese idioma?',3),('95177d2f-1508-11f0-90d1-020197ac33d8',5,52,'La palabra que mejor expresa que una cosa o institución se mantiene a lo largo del tiempo es…',1),('95177f9c-1508-11f0-90d1-020197ac33d8',5,53,'Si Pablo es mayor que Luis y si Pablo es más joven que Andrés, entonces…',2),('95178073-1508-11f0-90d1-020197ac33d8',5,54,'¿Cuál de estas cosas tiene más parecido con serpiente, vaca y gorrión?',1),('95178144-1508-11f0-90d1-020197ac33d8',5,55,'Hay un refrán que dice: \"A hierro caliente, batir de repente\", y esto significa:',4),('951781ef-1508-11f0-90d1-020197ac33d8',5,56,'Si las palabras que vienen aquí debajo estuviesen ordenadas, ¿Por qué letra empezaría la del centro?        Semana  Año  Hora  Segundo  Día  Mes  Minuto',3),('9517828f-1508-11f0-90d1-020197ac33d8',5,57,' El capitán es para el barco lo que el alcalde es para…',2),('95178324-1508-11f0-90d1-020197ac33d8',5,58,'Uno de los números de la serie que viene aquí debajo está equivocado, ¿Qué número debiera figurar en su lugar?       2  3  4  3  2  3  4  2  2  4',5),('951783c4-1508-11f0-90d1-020197ac33d8',5,59,'Si un pleito se resuelve por mutuas concesiones se dice que ha habido…',1),('95178466-1508-11f0-90d1-020197ac33d8',5,60,'La oración que viene aquí debajo tiene las palabras desordenadas. ¿Qué letra debe marcarse atendiendo a la frase ordenada?       FRASE  LA  LETRA  SEÑALE  PRIMERA  ESTA  DE',3),('95178608-1508-11f0-90d1-020197ac33d8',5,61,'En la serie de números, que aparece debajo, cuente todos los 5 que están delante de un 7, ¿Cuántos son?    7 5 3 5 7 2 3 7 5 6 7 7 2 5 7 3 4 7 7 5 2 0 7 5 7 8 3 7 2 5 1 7 9 6 5 7',3),('95178716-1508-11f0-90d1-020197ac33d8',5,62,'¿Qué indica mejor lo que es un termómetro?',4),('9517892e-1508-11f0-90d1-020197ac33d8',5,63,'¿Cuál de estas palabras es la primera que aparece en un diccionario?',3),('951789fd-1508-11f0-90d1-020197ac33d8',5,64,'Uno de los números de la serie que aparece aquí debajo está equivocado. ¿Qué número debiera figurar en su lugar?    1  2  4  8  12  32  64',5),('95178aa6-1508-11f0-90d1-020197ac33d8',5,65,'¿Cuál de estas palabras significa lo contrario de COMUN?',1),('95178b6b-1508-11f0-90d1-020197ac33d8',5,66,'¿Cuál de estas cinco cosas tiene más parecido con Presidente, Almirante y General?',1),('95178c1d-1508-11f0-90d1-020197ac33d8',5,67,'Si las palabras que aparecen aquí debajo estuvieran ordenadas, ¿Por qué letra empezaría la del centro?     Adolescente  Niño  Hombre  Viejo  Bebé',3),('95178e50-1508-11f0-90d1-020197ac33d8',5,68,'¿Cuál de estas definiciones indica más exactamente lo que es un caballo?',4),('95178f48-1508-11f0-90d1-020197ac33d8',5,69,'En un idioma extranjero BECO PRAC quiere decir \"un poco de pan\", KLUP PRAC \"un poco de leche\" y BECO OTOH KLUP PRAC \"un poco de pan y leche\", ¿Por qué letra empieza la palabra que significa \"y\" en dicho idioma?',3),('95179018-1508-11f0-90d1-020197ac33d8',5,70,'Si las palabras que aparecen aquí debajo estuviesen convenientemente ordenadas para formar una frase, ¿Por qué letra empezaría la tercera palabra?     MADRUGA  QUIEN   LE  DIOS  A  AYUDA',3),('951790e7-1508-11f0-90d1-020197ac33d8',5,71,'¿Cuál de estas palabras es la última que aparece en un diccionario?',3),('951792c3-1508-11f0-90d1-020197ac33d8',5,72,'Si se ordena la frase que aparece aquí debajo, ¿qué letra cumple lo que se dice en ella? EN LETRA LÍNEA A ESCRIBA LA LA',3),('951793b3-1508-11f0-90d1-020197ac33d8',5,73,'Uno de los números de la serie que aparece aquí debajo está equivocado, ¿Qué número debería figurar en su lugar?         1  2  5  6  9  10  13  14  16  18',5),('9517947f-1508-11f0-90d1-020197ac33d8',5,74,'Si un ciclista recorre 250 metros en 25 segundos, ¿Cuántos metros recorrerá en un quinto de segundo?',5),('95179550-1508-11f0-90d1-020197ac33d8',5,75,'Si la frase que aparece aquí debajo estuviera ordenada, ¿qué número cumple lo que en ella se dice? Y SUMA CUATRO ESCRIBA TRES LA UNO DE',3);
/*!40000 ALTER TABLE `preguntasotis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preguntasterman`
--

DROP TABLE IF EXISTS `preguntasterman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preguntasterman` (
  `idPreguntaTerman` int NOT NULL,
  `idSerieTerman` int NOT NULL,
  `numeroPregunta` int NOT NULL,
  `preguntaTerman` varchar(500) COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`idPreguntaTerman`),
  KEY `idSerieTerman` (`idSerieTerman`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preguntasterman`
--

LOCK TABLES `preguntasterman` WRITE;
/*!40000 ALTER TABLE `preguntasterman` DISABLE KEYS */;
INSERT INTO `preguntasterman` VALUES (1,1,1,'La gasolina se extrae de: '),(2,1,2,'Una tonelada tiene: '),(3,1,3,'La mayoría de nuestras exportaciones salen por: '),(4,1,4,'El nervio óptico sirve para: '),(5,1,5,'El café es una especie de: '),(6,1,6,'El jamón es carne de: '),(7,1,7,'La laringe está en: '),(8,1,8,'La guillotina causa la: '),(9,1,9,'La grúa se usa para: '),(10,1,10,'Un figura de seis lados se llama: '),(11,1,11,'El kilowatt mide:'),(12,1,12,'La pauta se usa en: '),(13,1,13,'Las esmeraldas son: '),(14,1,14,'El metro es aproximadamente igual a: '),(15,1,15,'Las esponjas se obtienen de: '),(16,1,16,'Fraude es un término usado en: '),(17,2,1,'Si la tierra estuviera más cerca del sol: '),(18,2,2,'Los rayos de una rueda están frecuentemente hechos de nogal porque: '),(19,2,3,'Un tren se detiene con más dificultad que un automóvil porque: '),(20,2,4,'El dicho \"A golpecitos se derriba un roble\", quiere decir: '),(21,2,5,'El dicho \"Una olla vigilada nunca hierve\", quiere decir: '),(22,2,6,'El dicho \"Siembra pasto mientras haya sol\", quiere decir: '),(23,2,7,'El dicho \"Zapatero a tus zapatos\", quiere decir: '),(24,2,8,'El dicho: \"La cuña para que apriete debe de ser del mismo palo\" quiere decir: '),(25,2,9,'Un acorazado de acero flota porque: '),(26,2,10,'Las plumas de las alas ayudan al pájaro a volar porque: '),(27,2,11,'El dicho: \"Una golondrina no hace verano\", quiere decir: '),(28,3,1,'Salado - Dulce'),(29,3,2,'Alegrarse - Regocijarse'),(30,3,3,'Mayor - Menor'),(31,3,4,'Sentarse - Pararse'),(32,3,5,'Desperdiciar - Aprovechar'),(33,3,6,'Conceder - Negar'),(34,3,7,'Tónico - Estimulante'),(35,3,8,'Rebajar - Denigrar'),(36,3,9,'Prohibir - Permitir'),(37,3,10,'Osadía - Audaz'),(38,3,11,'Arrebatado - Prudente'),(39,3,12,'Obtuso - Agudo'),(40,3,13,'Inepto - Experto'),(41,3,14,'Esquivar - Rehuir'),(42,3,15,'Rebelarse - Someterse'),(43,3,16,'Monotonía - Variedad'),(44,3,17,'Confrontar - Consolar'),(45,3,18,'Expeler - Retener'),(46,3,19,'Dócil - Sumiso'),(47,3,20,'Transitorio - Permanente'),(48,3,21,'Seguridad - Riesgo'),(49,3,22,'Aprobar - Objetar'),(50,3,23,'Expeler - Arrojar'),(51,3,24,'Engaño - Impostura'),(52,3,25,'Mitigar - Apaciguar'),(53,3,26,'Incitar - Aplacar'),(54,3,27,'Reverencia - Veneración'),(55,3,28,'Sobriedad - Frugalidad'),(56,3,29,'Aumentar - Menguar'),(57,3,30,'Incitar - Instigar'),(58,4,1,'UN CIRCULO tiene siempre:'),(59,4,2,'UN PAJARO tiene siempre:'),(60,4,3,'LA MUSICA tiene siempre:'),(61,4,4,'UN BANQUETE tiene siempre:'),(62,4,5,'UN CABALLO tiene siempre:'),(63,4,6,'UN JUEGO tiene siempre:'),(64,4,7,'UN OBJETO tiene siempre:'),(65,4,8,'UNA CONVERSACION tiene siempre:'),(66,4,9,'UNA DEUDA tiene siempre:'),(67,4,10,'UN CIUDADANO tiene siempre:'),(68,4,11,'UN MUSEO tiene siempre:'),(69,4,12,'UN COMPROMISO implica siempre:'),(70,4,13,'UN BOSQUE tiene siempre:'),(71,4,14,'LOS OBSTACULOS tienen siempre:'),(72,4,15,'EL ABORRECIMIENTO tiene siempre:'),(73,4,16,'UNA REVISTA tiene siempre:'),(74,4,17,'LA CONTROVERSIA implica siempre:'),(75,4,18,'UN BARCO tiene siempre:'),(76,5,1,'A 2 por 5 centavos, ¿Cuántos lápices pueden comprarse con 50 centavos?'),(77,5,2,'¿Cuántas horas tardará un automóvil en recorrer 660 kilómetros a la velocidad de 60 kilómetros por hora?'),(78,5,3,'Si un hombre gana $20.00 diarios y gasta $14.00 ¿cuántos días tardará en ahorrar $ 300.00?'),(79,5,4,'Si dos pasteles cuestan $ 0.60, ¿cuántos centavos cuesta la sexta parte de un pastel?'),(80,5,5,'¿Cuántas veces más es 2 X 3 X 4 X 5, que 3 X 4?'),(81,5,6,'¿Cuánto es el 16 por ciento de 120?'),(82,5,7,'El cuatro por ciento de $ 1,000 es igual al ocho por ciento de ¿qué cantidad?'),(83,5,8,'La capacidad de un refrigerador rectangular es de 48 metros cúbicos. Si tiene seis metros de largo por cuatro de ancho, ¿cuál es su altura?'),(84,5,9,'Si 7 hombres hacen un pozo de 40 metros en dos días, ¿cuántos hombres se necesitan para hacerlo en medio día?'),(85,5,10,'A, tiene $180.00; B, tiene 2/3 de lo que tiene A; C 1/2 de lo que tiene B, ¿cuánto tienen todos juntos?'),(86,5,11,'Si un hombre corre 100 metros en 10 segundos, ¿cuántos metros recorrerá como promedio en 1/5 de segundo?'),(87,5,12,'Un hombre gasta ¼ de su sueldo en casa y alimentos y 4/8 en otros gastos, ¿qué tanto por ciento de su sueldo ahorra?'),(88,6,1,'La higiene, ¿es esencial para la salud?'),(89,6,2,'Los taquígrafos, ¿usan el microscopio?'),(90,6,3,'Los tiranos, ¿son justos con sus inferiores?'),(91,6,4,'Las personas desamparadas, ¿están sujetas con frecuencia a la caridad?'),(92,6,5,'Las personas venerables, ¿son por lo común respetadas?'),(93,6,6,'Es el escorbuto, ¿un medicamento?'),(94,6,7,'Es la amonestación, ¿una clase de instrumento musical?'),(95,6,8,'Son los colores opacos, ¿preferidos por las banderas nacionales?'),(96,6,9,'Las cosas misteriosas, ¿son, a veces, pavorosas?'),(97,6,10,'Las personas conscientes, ¿cometen alguna vez errores?'),(98,6,11,'¿Son carnívoros los carneros?'),(99,6,12,'¿Se dan asignaturas a los caballos?'),(100,6,13,'Las cartas anónimas, ¿llevan alguna vez firma de quien las escribe?'),(101,6,14,'¿Son discontinuos los sonidos intermitentes?'),(102,6,15,'Las enfermedades, ¿estimulan el buen juicio?'),(103,6,16,'¿Son siempre perversos los hechos premeditados?'),(104,6,17,'El contacto social, ¿tiende a reducir la timidez?'),(105,6,18,'¿Son enfermas las personas que tienen mal carácter?'),(106,6,19,'Se caracteriza generalmente el rencor, ¿por la persistencia?'),(107,6,20,'Meticuloso ¿quiere decir lo mismo que cuidadoso?'),(108,7,1,'ABRIGO es a USAR como el PAN es a:'),(109,7,2,'SEMANA es a MES como MES es a:'),(110,7,3,'LEON es a ANIMAL como ROSA es a:'),(111,7,4,'LIBERTAD es a INDEPENDENCIA como CAUTIVERIO es a:'),(112,7,5,'DECIR es a DIJO como ESTAR es a: '),(113,7,6,'LUNES es a MARTES como VIERNES es a:'),(114,7,7,'PLOMO es a PESADO como CORCHO es a:'),(115,7,8,'EXITO es a ALEGRIA como FRACASO es a:'),(116,7,9,'GATO es a TIGRE como PERRO es a:'),(117,7,10,'4 es a 16 como 5 es a:'),(118,7,11,'LLORAR es a REIR como TRISTE es a:'),(119,7,12,'VENENO es a MUERTE como ALIMENTO es a:'),(120,7,13,'1 es a 3 como 9 es a:'),(121,7,14,'ALIMENTO es a HAMBRE como AGUA es a:'),(122,7,15,'AQUI es a ALLI como ESTE es a:'),(123,7,16,'TIGRE es a PELO como TRUCHA es a:'),(124,7,17,'PERVERTIDO es a DEPRAVADO como INCORRUPTO es a:'),(125,7,18,'B es a D como SEGUNDO es a:'),(126,7,19,'ESTADO es a GOBERNADOR como EJERCITO es a:'),(127,7,20,'SUJETO es a PREDICADO como NOMBRE es a:'),(128,8,1,'con crecen los niños edad la'),(129,8,2,'buena mar beber el para agua de es'),(130,8,3,'lo es paz la guerra opuesta la a'),(131,8,4,'caballos automóvil un que caminan los despacio más'),(132,8,5,'consejo a veces es buen seguir un difícil'),(133,8,6,'cuatrocientos todas páginas contienen libros los'),(134,8,7,'crecen las que fresas el roble más'),(135,8,8,'verdadera la comparada no puede amistad ser'),(136,8,9,'envidia la perjudicial gula son y la'),(137,8,10,'nunca acciones premiadas las deben buenas ser'),(138,8,11,'exteriores engañan nunca apariencias las nos'),(139,8,12,'nunca es hombre las que acciones demuestran un lo'),(140,8,13,'ciertas siempre muerte de causan clases enfermedades'),(141,8,14,'odio indeseables aversión sentimientos el son y la'),(142,8,15,'frecuentemente por juzgar podemos acciones hombres nosotros sus a los'),(143,8,16,'una es sábana sarapes tan nunca los caliente como'),(144,8,17,'nunca que descuidados los tropiezan son'),(145,9,1,'Ponga la letra de la palabra que no corresponda con las demás del renglón'),(146,9,2,'Ponga la letra de la palabra que no corresponda con las demás del renglón'),(147,9,3,'Ponga la letra de la palabra que no corresponda con las demás del renglón'),(148,9,4,'Ponga la letra de la palabra que no corresponda con las demás del renglón'),(149,9,5,'Ponga la letra de la palabra que no corresponda con las demás del renglón'),(150,9,6,'Ponga la letra de la palabra que no corresponda con las demás del renglón'),(151,9,7,'Ponga la letra de la palabra que no corresponda con las demás del renglón'),(152,9,8,'Ponga la letra de la palabra que no corresponda con las demás del renglón'),(153,9,9,'Ponga la letra de la palabra que no corresponda con las demás del renglón'),(154,9,10,'Ponga la letra de la palabra que no corresponda con las demás del renglón'),(155,9,11,'Ponga la letra de la palabra que no corresponda con las demás del renglón'),(156,9,12,'Ponga la letra de la palabra que no corresponda con las demás del renglón'),(157,9,13,'Ponga la letra de la palabra que no corresponda con las demás del renglón'),(158,9,14,'Ponga la letra de la palabra que no corresponda con las demás del renglón'),(159,9,15,'Ponga la letra de la palabra que no corresponda con las demás del renglón'),(160,9,16,'Ponga la letra de la palabra que no corresponda con las demás del renglón'),(161,9,17,'Ponga la letra de la palabra que no corresponda con las demás del renglón'),(162,9,18,'Ponga la letra de la palabra que no corresponda con las demás del renglón'),(163,10,1,'Serie: 8  -  7  -  6  -  5  -  4  -  3'),(164,10,2,'Serie: 3  -  8  -  13  -  18  -  23  -  28'),(165,10,3,'Serie: 1  -  2  -  4  -  8  -  16  -  32'),(166,10,4,'Serie: 8  -  8  -  6  -  6  -  4  -  4'),(167,10,5,'Serie: 11.3/4  -  12  -  12.1/4  -  12.1/2  -  12.3/4'),(168,10,6,'Serie: 8  -  9  -  12  -  13  -  16  -  17'),(169,10,7,'Serie: 16  -  8  -  4  -  2  -  1  -  1/2'),(170,10,8,'Serie: 31.3  -  40.3  -  49.3  -  58.3  -  67.3  -  76.3'),(171,10,9,'Serie: 3  -  5  -  4  -  6  -  5  -  7'),(172,10,10,'Serie: 7  -  11  -  15  -  16  -  20  -  24  -  25  -  29'),(173,10,11,'Serie: 1/25  -  1/5  -  1  -  5');
/*!40000 ALTER TABLE `preguntasterman` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privilegios`
--

DROP TABLE IF EXISTS `privilegios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `privilegios` (
  `idPrivilegio` int NOT NULL AUTO_INCREMENT,
  `nombrePrivilegio` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`idPrivilegio`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privilegios`
--

LOCK TABLES `privilegios` WRITE;
/*!40000 ALTER TABLE `privilegios` DISABLE KEYS */;
INSERT INTO `privilegios` VALUES (1,'Autenticación'),(2,'Consultar TyC'),(3,'Registrar instituciones'),(4,'Consultar información de instituciones'),(5,'Editar instituciones'),(6,'Desactivar instituciones'),(7,'Registrar grupos'),(8,'Consultar información de grupos'),(9,'Editar grupos'),(10,'Desactivar grupos'),(11,'Añadir aspirantes'),(12,'Consultar información de aspirantes'),(13,'Editar aspirantes'),(14,'Desactivar aspirantes'),(15,'Consultar respuestas'),(16,'Consultar análisis'),(17,'Consultar documentación'),(18,'Consultar información de pruebas'),(19,'Consultar pruebas'),(20,'Realizar pruebas'),(21,'Subir archivos'),(22,'Contestar formato de entrevista'),(23,'Consultar psicólogos'),(24,'Consultar coordinadores'),(25,'Registrar psicólogo'),(26,'Registrar coordinador'),(27,'Editar psicólogo'),(28,'Editar coordinador'),(29,'Desactivar psicólogo'),(30,'Desactivar coordinador');
/*!40000 ALTER TABLE `privilegios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pruebas`
--

DROP TABLE IF EXISTS `pruebas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pruebas` (
  `idPrueba` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `instrucciones` text COLLATE utf8mb4_general_ci,
  `duracion` int DEFAULT NULL,
  PRIMARY KEY (`idPrueba`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pruebas`
--

LOCK TABLES `pruebas` WRITE;
/*!40000 ALTER TABLE `pruebas` DISABLE KEYS */;
INSERT INTO `pruebas` VALUES (1,'KOSTICK','Prueba proyectiva que analiza rasgos de personalidad y comportamiento.','Hay 90 pares de frases, usted debe escoger de cada par aquella frase que sea más afín con su forma de ser o de pensar.\n\nA veces tendrá la impresión de que ninguna refleja esa afinidad o, al contrario, que ambas lo hacen; en todo caso, usted debe optar por alguna de las dos.\n\nEsta prueba debería tomarle aproximadamente de 20 a 30 minutos, y aunque no es cronometrada, contará con 2 horas para contestarla.\n\nNo podrá regresar una vez que haya respondido una pregunta.',7200),(2,'PRUEBA DE 16PF','Inventario de personalidad que mide 16 factores primarios de la personalidad.','A continuación encontrará una serie de frases que permitirán conocer sus actitudes e intereses.\n\nEn general, no existen contestaciones correctas o incorrectas, porque las personas tienen distintos intereses y ven las cosas desde distintos puntos de vista.\n\nConteste con sinceridad; de esta forma se podrá conocer mejor su forma de ser. Cada frase contiene tres posibles respuestas (A, B y C) y normalmente la alternativa B viene con un interrogante, para ser señalada cuando no es posible decidirse entre la A ó la C. Intente inclinarse por las opciones de respuesta A o C. Sólo en caso de que no pueda decidirse, escoja la letra B.\n\n\nSeleccione la opción que más se aplica a usted. Esta prueba debería tomarle aproximadamente de 30 a 45 minutos, sin embargo, no es cronometrada. \n\nNo podrá regresar una vez que haya respondido una pregunta.\n',7200),(3,'HARTMAN','Evaluación psicológica utilizada en diversos contextos de diagnóstico.','\n\nEsta prueba contiene dos fases. En la primera fase, encontrará usted 18 frases, cada una de estas representa algo a lo cual un individuo puede asignarle\ndiferentes valores (bueno o malo) dependiendo de sus propias consideraciones acerca de qué es bueno o malo.\nLea cuidadosamente todas las frases.\n\nEn la segunda fase, encontrará usted 18 citas, cada una de estas representa algo a lo cual un individuo puede asignarle\ndiferentes valores (bueno o malo) dependiendo de sus propias consideraciones acerca de qué es bueno o malo.\nLea cuidadosamente todas las citas.\n\nRelacione el número 1 con la frase que en su opinión representa el valor más alto, o sea la frase que usted considera que expresa el mejor valor.\nRelacione el número 2 con la frase que usted considera está en segundo lugar, y así sucesivamente. Enumere todas las frases o citas en sentido descendente utilizando un número\ndiferente para cada una de las 18 frases (3, 4 ,5 y así sucesivamente) hasta llegar al número 18 que deberá representar aquella que usted considera que expresa lo peor.\nNo juzgue las frases o citas por la importancia sino exclusivamente por la bondad o maldad que contienen. Concéntrese en su tarea.\nDecida rápidamente qué número le va a asignar a cada una de las frases o citas. Esta prueba suele llevar alrededor de 10 minutos, sin embargo, cuenta con 2 horas para completarla.\n',1200),(4,'TERMAN','Prueba para medir el coeficiente intelectual y evaluar habilidades cognitivas.','\nLea cuidadosamente las instrucciones de cada serie y responda las preguntas como se indica.\nEsta prueba es cronometrada, cada serie tiene un tiempo específico para responderla. Cuando se termine el tiempo de una serie, automáticamente pasará a la siguiente.\nNo podrá regresar una vez que haya respondido una pregunta.',1620),(5,'OTIS','Prueba de inteligencia que mide la capacidad de razonamiento lógico y abstracto.','instruccionesOtis.txt',1800),(6,'Colores de Luscher','Evaluación basada en la selección de colores para analizar el estado emocional.','instruccionesColores',NULL);
/*!40000 ALTER TABLE `pruebas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `responde16pf`
--

DROP TABLE IF EXISTS `responde16pf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `responde16pf` (
  `idRespuesta16PF` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `idPregunta16PF` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `idGrupo` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `idAspirante` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `idOpcion16PF` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `tiempo` decimal(12,3) NOT NULL,
  PRIMARY KEY (`idPregunta16PF`,`idGrupo`,`idAspirante`),
  KEY `responde16PF_ibfk_1` (`idGrupo`),
  KEY `responde16PF_ibfk_2` (`idAspirante`),
  KEY `responde16PF_ibfk_3` (`idOpcion16PF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responde16pf`
--

LOCK TABLES `responde16pf` WRITE;
/*!40000 ALTER TABLE `responde16pf` DISABLE KEYS */;
INSERT INTO `responde16pf` VALUES ('2fdf557c-ba35-450e-80e8-5d42d393abad','5f510808-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','6129d859-2089-11f0-a293-a0294223b12a',8.870),('d12ff80f-1393-41ed-bd61-5ec45ad943b0','5f522dbf-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','612a7938-2089-11f0-a293-a0294223b12a',13.810),('88d5b825-aa54-4a70-b5ba-a7758ac7aafb','5f5232a6-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','612abf65-2089-11f0-a293-a0294223b12a',20.300),('78dc5c30-2215-4cd7-9114-309bbe1491d8','5f523483-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','612af43d-2089-11f0-a293-a0294223b12a',25.170),('9b4bfa0f-161b-4130-806d-f24133e9fdee','5f52361f-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','612b3dcf-2089-11f0-a293-a0294223b12a',30.290),('fcf1161b-0a89-4998-9331-184e8bac2c35','5f5236c0-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','612b83a1-2089-11f0-a293-a0294223b12a',39.370),('ee27d9eb-4e8b-46ad-a1aa-de6d6ba0d38b','5f523807-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','612bbce8-2089-11f0-a293-a0294223b12a',47.560),('6c0badd1-ce17-4bf6-96f8-918cb598a5dc','5f523973-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','612bf60f-2089-11f0-a293-a0294223b12a',51.150),('ea14a097-3c19-4dbf-910d-d6cfc3d7aac7','5f523ae0-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','612c7168-2089-11f0-a293-a0294223b12a',54.760),('dc537f1a-8bd5-49d0-b785-192fcab5d9f6','5f523c52-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','612c77ec-2089-11f0-a293-a0294223b12a',58.290),('1eb8ea76-b27d-41d4-806c-594afa98e07e','5f523dc7-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','612cb98a-2089-11f0-a293-a0294223b12a',65.630),('7c2bbd7c-0f3d-4cf6-bf58-6cbbfe6714a1','5f523f42-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','612d0452-2089-11f0-a293-a0294223b12a',71.690),('7149c026-0ab5-4ff0-9976-a1de33d78644','5f5240be-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','612d08d0-2089-11f0-a293-a0294223b12a',77.930),('41722099-d2c7-42d1-81d6-1c531ac486e8','5f524229-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','612d2cd0-2089-11f0-a293-a0294223b12a',83.620),('84c62358-6c1f-4ac8-8e03-015af269317e','5f52445c-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','612d5c7c-2089-11f0-a293-a0294223b12a',87.850),('2252608f-b763-4cee-928f-8a50dfad4f49','5f5245ba-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','612d6f84-2089-11f0-a293-a0294223b12a',90.270),('249be7c3-bf7a-45b0-8949-2847ba5a86ca','5f5246c2-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','612d9726-2089-11f0-a293-a0294223b12a',95.670),('28dc5158-e6ee-498f-9184-fd985d6be3d9','5f5247bf-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','612e0694-2089-11f0-a293-a0294223b12a',99.040),('165fe05b-2887-4dc2-b285-b6d7f91f2931','5f5248bc-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','612e0f5a-2089-11f0-a293-a0294223b12a',105.990),('9d84b1c8-5564-4a54-86e2-295fc0ee65ee','5f524a07-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','612e55b5-2089-11f0-a293-a0294223b12a',111.160),('d3847671-7838-4ed6-8a16-53eda47b148b','5f524b8e-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','612e5a57-2089-11f0-a293-a0294223b12a',116.390),('9d5c64b0-e2d6-4266-a194-2f070837f6f0','5f524c96-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','612e89df-2089-11f0-a293-a0294223b12a',123.600),('275fa7e5-5829-4c58-9869-94f348e41796','5f524d9b-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','612ea986-2089-11f0-a293-a0294223b12a',127.490),('99ae0ab7-506f-4c7c-8b1a-2646f49a3ea5','5f524e93-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','612eacd4-2089-11f0-a293-a0294223b12a',133.010),('74c7f8cd-4e5f-49d8-8b2e-670c90905b91','5f524fac-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','612ed48a-2089-11f0-a293-a0294223b12a',137.940),('085bf5e7-3f8c-476b-b2be-16cff975bfe0','5f5250a2-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','612ef133-2089-11f0-a293-a0294223b12a',142.770),('85a3d3f3-54bb-4158-aef3-a6f2f20f8d9e','5f5251b4-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','612f0abe-2089-11f0-a293-a0294223b12a',146.960),('7eb88434-fdc0-40ac-be4f-3b4a8ba8dd63','5f5252d0-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','612f5970-2089-11f0-a293-a0294223b12a',153.740),('3ad44b73-1d24-4735-851f-81e8a2b29c22','5f5253df-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','612fda92-2089-11f0-a293-a0294223b12a',158.960),('6c42fd3e-406d-4723-bf92-652983156d91','5f5254e7-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','61302926-2089-11f0-a293-a0294223b12a',167.320),('b3906a10-2a9e-4237-bed7-5eb21f7a545e','5f5255f7-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','61305159-2089-11f0-a293-a0294223b12a',175.590),('7470757f-0a39-46dd-92c4-94c45f32f1dc','5f5256f9-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','6130a2e2-2089-11f0-a293-a0294223b12a',185.060),('668190bc-7201-471d-bf88-68463dc28585','5f525805-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','6130d486-2089-11f0-a293-a0294223b12a',191.130),('6641f814-2e2f-49a3-9ca4-80c05ac4b288','5f525a4a-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','6130eb02-2089-11f0-a293-a0294223b12a',197.910),('7deb88a3-c6a0-40cd-b836-36967d4da21f','5f525bed-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','6130ff6c-2089-11f0-a293-a0294223b12a',206.380),('20f3c13f-40c3-4e1b-b4d0-d57e1ae8bc53','5f525d7e-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','61314185-2089-11f0-a293-a0294223b12a',215.420),('b836e3f5-0782-45a1-be5d-427e5ecd57ca','5f525f04-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','613157d7-2089-11f0-a293-a0294223b12a',221.150),('3afffcbc-8628-4289-ad78-309c057a6ec7','5f52607b-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','6131cb0f-2089-11f0-a293-a0294223b12a',227.010),('654d1dfc-b24e-4bd7-a6a6-91ecfa424f64','5f5261ea-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','6131ef8b-2089-11f0-a293-a0294223b12a',231.370),('6134e6ad-f324-4564-881a-6173dffa06b5','5f526370-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','6132168c-2089-11f0-a293-a0294223b12a',240.120),('17d48700-5667-4b7e-bb5c-044cbe3dff03','5f5264da-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','61322f42-2089-11f0-a293-a0294223b12a',244.950),('213b340d-d625-404b-a041-454936ef30dc','5f52663b-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','613258ce-2089-11f0-a293-a0294223b12a',250.480),('573c2dd3-8fa2-452b-a628-2ee2e976d6cf','5f52679d-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','61328896-2089-11f0-a293-a0294223b12a',254.620),('452423f4-3254-4f3f-a644-6e410111f900','5f526904-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','61334a30-2089-11f0-a293-a0294223b12a',258.900),('7d9df912-d07c-4adc-893b-9677e2250563','5f526a6c-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','61336699-2089-11f0-a293-a0294223b12a',263.330),('94eed625-20d1-420a-bb95-6590a67a8c76','5f526bd0-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','61337188-2089-11f0-a293-a0294223b12a',272.550),('a201dcb3-1356-45f4-90a2-e592da55bc2d','5f526d31-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','61341407-2089-11f0-a293-a0294223b12a',277.810),('023e33e0-1fcc-4978-bb1d-69e7c3543a1f','5f527025-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','61343792-2089-11f0-a293-a0294223b12a',281.990),('4b659301-b6e8-412e-bb98-14014e7df388','5f5271b6-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','6134405f-2089-11f0-a293-a0294223b12a',287.420),('848582c4-c094-44a1-a852-1b441b09618e','5f527316-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','61345c1b-2089-11f0-a293-a0294223b12a',291.080),('2b9e4e34-eda3-480f-8106-6ed98ea36c85','5f527489-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','6134a15d-2089-11f0-a293-a0294223b12a',298.090),('e563392d-d333-421b-8dc3-2a6d03e1f1ae','5f527610-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','61351b11-2089-11f0-a293-a0294223b12a',302.620),('6be9b5b9-5aa0-4d70-aa5f-d343df557b24','5f52779a-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','61354cff-2089-11f0-a293-a0294223b12a',309.110),('6ad65695-f851-4050-8b38-c635d9fa200f','5f527927-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','61357d02-2089-11f0-a293-a0294223b12a',315.490),('585e9ffd-c0d3-484d-8ca3-bbb817190fb0','5f527ac6-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','6135a1f5-2089-11f0-a293-a0294223b12a',323.100),('41cd82c1-a79f-4256-8130-0ed75fa54413','5f527c51-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','6135e316-2089-11f0-a293-a0294223b12a',327.920),('11041d56-1caf-4c1f-af37-5099f19a2c3f','5f527dea-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','6135fb5e-2089-11f0-a293-a0294223b12a',334.370),('f1ddc3bd-cf1f-4a14-aa52-43d69734d216','5f527f87-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','6136448f-2089-11f0-a293-a0294223b12a',342.420),('f9f89224-3201-4760-903b-49fc77625845','5f528128-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','61368def-2089-11f0-a293-a0294223b12a',347.930),('0e67e35b-1f9e-4336-bffd-ebaac48e83bd','5f5282ae-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','6137139b-2089-11f0-a293-a0294223b12a',355.380),('1c76b36e-ced9-4da5-a3fc-afed5df47ca6','5f52842e-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','61374d61-2089-11f0-a293-a0294223b12a',359.800),('ee6610f1-5eea-4118-9805-e1e34467b7dc','5f5285a3-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','613796ec-2089-11f0-a293-a0294223b12a',365.660),('235aa67f-17dd-4820-a51c-de19848775ca','5f52872a-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','6137b5f7-2089-11f0-a293-a0294223b12a',371.620),('ddf198be-4ded-4d4e-9d7f-cd0e281d17da','5f5288b0-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','6137d100-2089-11f0-a293-a0294223b12a',375.960),('ccf2656b-39e8-4c92-94c5-6f665a045799','5f528a27-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','6137eb8e-2089-11f0-a293-a0294223b12a',387.440),('3a1df750-fc2b-461d-89e9-a867a4172592','5f528ba3-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','61382898-2089-11f0-a293-a0294223b12a',392.910),('948bc65d-b481-4f15-b3ae-469f661966f4','5f528d21-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','613860b1-2089-11f0-a293-a0294223b12a',398.010),('67ffad10-1acb-4e63-9f3c-58f2e0026e87','5f528eb7-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','61388663-2089-11f0-a293-a0294223b12a',403.290),('94d06c84-7930-4472-a02e-89eb9f497631','5f52905c-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','6138ac9e-2089-11f0-a293-a0294223b12a',409.580),('91e7714f-e140-48cf-902a-e7cbf6f928ca','5f5291d3-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','6139410c-2089-11f0-a293-a0294223b12a',415.680),('37338129-7ca3-47c3-a179-561c4849c289','5f529343-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','61398ce0-2089-11f0-a293-a0294223b12a',422.230),('3630580a-122b-4434-879a-0ace5241af95','5f5294ac-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','6139d6fc-2089-11f0-a293-a0294223b12a',428.340),('a5023119-0084-425e-b5da-8b41ae1ef843','5f529662-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','613a1a0a-2089-11f0-a293-a0294223b12a',432.380),('92659001-e541-44a3-a4c9-d80481b4d348','5f5297ce-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','613a59e3-2089-11f0-a293-a0294223b12a',438.780),('5274f6c6-c42a-4424-be87-d51af4803421','5f529941-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','613a70ce-2089-11f0-a293-a0294223b12a',451.600),('246a1f83-d142-49bd-885d-aeaa3d0d8b44','5f529aac-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','613adec8-2089-11f0-a293-a0294223b12a',459.990),('22d7021b-8520-4455-b0d9-ae318e2b58c0','5f529c18-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','613b1ad8-2089-11f0-a293-a0294223b12a',465.610),('10d23499-e546-49d0-bda9-7f7184bb7fc9','5f529d84-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','613b4908-2089-11f0-a293-a0294223b12a',472.030),('f7f55119-9f03-4b74-b228-13e7d37cfb2b','5f529eeb-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','613b75f5-2089-11f0-a293-a0294223b12a',478.780),('9585e194-63ed-49c9-a0fb-babc00b20ba2','5f52a057-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','613b9601-2089-11f0-a293-a0294223b12a',485.170),('3176814e-11ee-4bd2-828e-8c6b0c3e8c6a','5f52a1c1-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','613bc796-2089-11f0-a293-a0294223b12a',490.550),('a722a71a-2d5a-4eee-ac01-bcc135541770','5f52a332-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','613bf8fd-2089-11f0-a293-a0294223b12a',496.190),('a7ff5420-4345-4302-b016-f702c0ff8729','5f52a46e-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','613c1b08-2089-11f0-a293-a0294223b12a',501.040),('94e4c7e2-deec-443e-bd4a-649c047950ec','5f52a571-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','613c45c1-2089-11f0-a293-a0294223b12a',507.590),('c996f3af-5f9f-4fa0-9406-c5617f2f6344','5f52a689-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','613c8272-2089-11f0-a293-a0294223b12a',516.240),('28bec750-0fc4-49bc-a642-0837eb941d46','5f52a79c-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','613c96d8-2089-11f0-a293-a0294223b12a',522.640),('625e62b8-c8e9-4381-922b-14b5d3a89c82','5f52a8a9-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','613cd0d8-2089-11f0-a293-a0294223b12a',528.060),('065efb50-358d-4f7c-b227-11ccdc6b692a','5f52a9a4-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','613cf552-2089-11f0-a293-a0294223b12a',534.020),('4ca22caf-ec87-4279-ad46-43c488250456','5f52aaad-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','613d2cde-2089-11f0-a293-a0294223b12a',538.170),('7e494393-c760-4003-b0cd-c215614afcb1','5f52abbf-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','613d8cb1-2089-11f0-a293-a0294223b12a',541.950),('c9d9b1cd-a35f-421c-9503-7200bd097357','5f52ace0-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','613d9963-2089-11f0-a293-a0294223b12a',546.280),('c95b9f3a-7bd3-4674-9abf-6d8ec8503c99','5f52ae26-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','613dab68-2089-11f0-a293-a0294223b12a',551.650),('cd1ffbaa-3f75-4182-a8e6-9d4ef94162d7','5f52af5a-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','613dae9f-2089-11f0-a293-a0294223b12a',555.010),('e9669f8f-23a1-464f-9b2c-ef5852e48348','5f52b079-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','613dc6cd-2089-11f0-a293-a0294223b12a',566.110),('24a252fa-754c-48d1-95f1-f8edf22618f3','5f52b194-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','613ddf10-2089-11f0-a293-a0294223b12a',574.240),('12838dcd-152f-4304-9fc3-e643c68ab960','5f52b2a6-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','613df8ad-2089-11f0-a293-a0294223b12a',578.720),('1f3a6d4d-a216-4c6b-a976-4c220d88ba00','5f52b3d1-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','613e2302-2089-11f0-a293-a0294223b12a',582.390),('d2a56305-2e57-4a73-8507-da7c97d3bf07','5f52b4ee-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','613e6f52-2089-11f0-a293-a0294223b12a',589.780),('c7d5086f-2cb4-4660-a6dd-396a2ce16467','5f52b609-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','613e8eb8-2089-11f0-a293-a0294223b12a',596.570),('e65d5d97-0499-4253-9f75-e052804f675a','5f52b742-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','613ebbf2-2089-11f0-a293-a0294223b12a',601.670),('a4d6a86e-2ba2-4f8f-9af0-ad173b2258c2','5f52b861-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','613ec5e1-2089-11f0-a293-a0294223b12a',605.870),('9fac0758-bd40-49fc-8c66-9a817a6c4741','5f52b981-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','613efb07-2089-11f0-a293-a0294223b12a',615.100),('371b908b-2aa1-4035-990c-ad905cd57e2c','5f52baa5-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','613f0a1c-2089-11f0-a293-a0294223b12a',620.260),('172500d3-341b-4d81-bb7c-fa8fdbf8bf9b','5f52bbad-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','613f647c-2089-11f0-a293-a0294223b12a',628.470),('f6c62107-50fb-4b2c-9b5b-ba8c6c7e7cd4','5f52bcb3-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','613f84fd-2089-11f0-a293-a0294223b12a',632.770),('0893d3fb-7e5b-4442-bb1e-5ebd592a2898','5f52be35-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','613fa6f9-2089-11f0-a293-a0294223b12a',638.280),('493bb575-6f3c-48ea-9dc5-220342d8d267','5f52bf43-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','613fc522-2089-11f0-a293-a0294223b12a',642.810),('d84c344c-72aa-428e-8d36-50144cd10948','5f52c059-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','613fe108-2089-11f0-a293-a0294223b12a',648.950),('1a4b408b-ac87-4ba4-a491-83d9f6b8235d','5f52c15b-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','613ffc74-2089-11f0-a293-a0294223b12a',653.630),('2aa8b8e1-1442-4c94-80b3-b7279d27f4ab','5f52c25c-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','614016b1-2089-11f0-a293-a0294223b12a',657.790),('50f6552a-e767-4e35-86d3-d2f0ce126347','5f52c352-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','614031dc-2089-11f0-a293-a0294223b12a',664.820),('6c32eed8-450b-4808-8c9a-cd689cd35768','5f52eb74-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','61405dbe-2089-11f0-a293-a0294223b12a',670.590),('f8463276-e071-443f-9a3b-17544d970d5c','5f52ee6e-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','61406690-2089-11f0-a293-a0294223b12a',674.950),('aaff2bc5-c014-4777-87dd-095c41b1fd66','5f52ef94-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','614081a2-2089-11f0-a293-a0294223b12a',678.490),('e937b4f2-c146-4e3d-ae4c-a757a6065e92','5f52f09e-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','6140d520-2089-11f0-a293-a0294223b12a',683.880),('5cf3174b-ff91-498a-b431-9c45f318f304','5f52f1a9-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','6140f2cf-2089-11f0-a293-a0294223b12a',687.880),('a3d4c5ad-9867-46db-9be6-76b50c5ee79c','5f52f2a6-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','61410d43-2089-11f0-a293-a0294223b12a',696.360),('a61a95ae-e6ca-4ca4-a799-a791f367f5cc','5f52f39e-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','614120eb-2089-11f0-a293-a0294223b12a',703.080),('de11d35b-0009-41d3-a5bc-0f551e65546a','5f52f48e-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','61414ac0-2089-11f0-a293-a0294223b12a',707.120),('ad35afa5-8381-4972-a280-01f2c8cbedde','5f52f57f-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','61415a0f-2089-11f0-a293-a0294223b12a',716.840),('c4d37073-17ef-4fea-b297-1da18b2f7d3d','5f52f677-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','61417881-2089-11f0-a293-a0294223b12a',722.910),('b9a892ed-fed5-4d12-93c6-a7028724cb1c','5f52f758-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','6141954f-2089-11f0-a293-a0294223b12a',731.550),('8de111f7-cb8d-4205-9c88-ad6192e89e5a','5f52f84d-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','6141cbd5-2089-11f0-a293-a0294223b12a',736.120),('9ef3d8e7-6906-4291-b460-f646c670de8d','5f52f94f-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','6141fdf0-2089-11f0-a293-a0294223b12a',740.680),('fd80231d-48fa-453b-8624-66cff63b0e40','5f52fa5d-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','61422cca-2089-11f0-a293-a0294223b12a',746.990),('50348bc9-5a66-4c1b-a815-d8b3f6955da0','5f52fb54-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','61426924-2089-11f0-a293-a0294223b12a',750.950),('e5b9cda1-5160-4cd1-b090-6f35dd636a10','5f52fc46-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','614274b2-2089-11f0-a293-a0294223b12a',755.280),('3d6290c1-562b-49de-b624-b97d1800a283','5f52fd36-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','6142a866-2089-11f0-a293-a0294223b12a',760.050),('d77f8070-4050-4709-b49f-93b245a6fd4a','5f52fe4b-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','6142b33d-2089-11f0-a293-a0294223b12a',765.620),('83c6ae4c-9725-4004-8fc2-04ef0a1efad6','5f52ff3e-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','61433d40-2089-11f0-a293-a0294223b12a',772.770),('2dbcdacb-a62c-4038-a004-cced29b22259','5f530028-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','61436520-2089-11f0-a293-a0294223b12a',777.490),('d44a26b8-f247-4107-8728-7555f284d8f5','5f530121-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','6143705b-2089-11f0-a293-a0294223b12a',782.910),('802a49d2-4156-4aa5-a858-c7a2fb0be985','5f530344-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','6143bec0-2089-11f0-a293-a0294223b12a',791.000),('5b6fc839-1b1b-4222-b8b9-0c0768a9cfbf','5f530519-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','6143d5d8-2089-11f0-a293-a0294223b12a',797.360),('a44337ad-b68d-44d6-b68e-3f91b55214e4','5f5306ad-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','614403bc-2089-11f0-a293-a0294223b12a',800.840),('c82c158c-7b4d-4ba1-ac1c-109a369d8872','5f530840-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','61445477-2089-11f0-a293-a0294223b12a',808.770),('d27e1134-e2d0-4a1b-b22e-5470a21d34a7','5f5309c0-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','614482c0-2089-11f0-a293-a0294223b12a',814.420),('79daa8d6-b192-4b29-8ebf-e926f7088a40','5f530b2c-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','6144a976-2089-11f0-a293-a0294223b12a',821.560),('a71f7c79-bde6-411a-88d9-6de5a36a30c8','5f530ca0-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','6144c75f-2089-11f0-a293-a0294223b12a',827.240),('0f361517-dcba-4f74-9a2f-20dffd5dae49','5f530e24-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','6144f980-2089-11f0-a293-a0294223b12a',832.400),('64a568ff-e122-4944-9087-5ee63021440d','5f530f9c-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','614533c2-2089-11f0-a293-a0294223b12a',840.590),('5e116ac8-e096-493f-9ab5-691f86b1cbca','5f531116-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','6145783e-2089-11f0-a293-a0294223b12a',846.560),('a0f5c264-7cb1-46f0-8971-9cebf77db83c','5f53128c-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','6145c2d3-2089-11f0-a293-a0294223b12a',853.080),('b992e455-5662-4c3e-9f06-10dde94964f5','5f5313fb-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','61460274-2089-11f0-a293-a0294223b12a',859.580),('bc435cf3-0650-4af6-b654-afa4e225fd16','5f531524-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','614634a7-2089-11f0-a293-a0294223b12a',866.500),('223a86a8-393c-414b-a08b-8d23fdae9d14','5f531618-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','6146b194-2089-11f0-a293-a0294223b12a',873.730),('18cc42c3-9e44-42d4-8b1d-49b7404b533e','5f5316fa-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','6146c9cf-2089-11f0-a293-a0294223b12a',884.590),('3765738b-97d7-4825-9a19-ba66fd2ad743','5f5317d4-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','614715b7-2089-11f0-a293-a0294223b12a',890.260),('0b9a5f1b-d405-4661-85d8-1e313c69b930','5f531926-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','61476193-2089-11f0-a293-a0294223b12a',895.100),('7d0faaea-3442-4101-9dd8-c8bcf855f8ce','5f531a94-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','6147ce04-2089-11f0-a293-a0294223b12a',898.930),('4f1e142d-e569-40bb-a371-871ebe1f683a','5f531c01-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','61480820-2089-11f0-a293-a0294223b12a',904.300),('15d3b2cf-cead-4ced-8734-f11e81049d81','5f531d82-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','614815ce-2089-11f0-a293-a0294223b12a',909.040),('805fd028-a571-45a2-84db-12f55d7d602b','5f531f03-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','614856f8-2089-11f0-a293-a0294223b12a',912.440),('a5dbdd7c-3a91-4c81-9d07-ece3a661d2b7','5f532088-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','6148eee2-2089-11f0-a293-a0294223b12a',919.470),('43854539-2814-4f4d-ac27-6a4df188ab64','5f532188-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','61493eec-2089-11f0-a293-a0294223b12a',924.680),('81eef56c-da19-4fc8-8524-3da7b16632d0','5f532302-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','614979e6-2089-11f0-a293-a0294223b12a',928.060),('f4e729d8-6d6b-40f1-8ec7-3c166df4e014','5f5323fa-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','6149930c-2089-11f0-a293-a0294223b12a',933.620),('8de4c7cf-d34d-4244-8d6d-9a56fabe89a9','5f532508-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','6149d08d-2089-11f0-a293-a0294223b12a',940.140),('8d2c98a3-13ea-4c81-9df7-8d95c75c1187','5f5325f7-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','614a2647-2089-11f0-a293-a0294223b12a',945.500),('7684c01b-83a2-4f98-8863-ceb027be3cff','5f5326eb-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','614a3413-2089-11f0-a293-a0294223b12a',949.740),('992521dd-2eca-45a6-81a6-687b42fa904d','5f5328c7-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','614a84ff-2089-11f0-a293-a0294223b12a',956.020),('f4776e96-3402-4246-8684-0559a772e478','5f5329ba-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','614ad5e4-2089-11f0-a293-a0294223b12a',963.030),('9737824c-1eea-4704-8f38-7a2484a76047','5f532a93-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','614afcaa-2089-11f0-a293-a0294223b12a',968.260),('d14c3a27-8000-4bb5-ac74-5a0cab85af6b','5f53755b-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','614b239a-2089-11f0-a293-a0294223b12a',975.360),('e855aaf3-b980-45bb-8914-418af2836b25','5f5377ce-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','614b425f-2089-11f0-a293-a0294223b12a',987.180),('c94e7818-186a-4161-92b1-93ac8548b76c','5f5378e8-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','614b8cf4-2089-11f0-a293-a0294223b12a',991.770),('5cbaf758-a0a1-40ce-98db-cf6f6a6f2a26','5f5379e0-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','614bb9f0-2089-11f0-a293-a0294223b12a',996.060),('fdb315f2-31dc-4d20-a377-bac3ea0f79d5','5f537ad0-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','614bce4d-2089-11f0-a293-a0294223b12a',1001.360),('e1cdb79c-604f-450c-b073-63a3f09ec944','5f537bbc-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','614bf739-2089-11f0-a293-a0294223b12a',1005.080),('5600c4ac-b204-45ba-ae6c-aa53f87a1d7d','5f537cab-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','614c0a9c-2089-11f0-a293-a0294223b12a',1010.730),('6eb539ac-384c-46f5-99f7-cb33ff60241f','5f537d8e-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','614c5280-2089-11f0-a293-a0294223b12a',1018.300),('838e43bb-f467-4842-a1ea-3691f1e6ec34','5f537e75-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','614c8562-2089-11f0-a293-a0294223b12a',1023.040),('18d6cdd3-5c6a-4feb-8a63-fe16b32ea8c8','5f537f5e-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','614ca736-2089-11f0-a293-a0294223b12a',1044.040),('4e2c9302-5744-493b-8872-bc33866a4a0b','5f53803f-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','614d0d63-2089-11f0-a293-a0294223b12a',1050.970),('aa897837-4895-49ca-a435-e45e830cf746','5f538122-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','614d5b53-2089-11f0-a293-a0294223b12a',1056.870),('1c2d4275-9518-4c63-b4e6-38831eb48d3b','5f538202-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','614d67ae-2089-11f0-a293-a0294223b12a',1085.830),('d9d5ea08-65f8-484c-b203-b368094ac997','5f5382e5-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','614d91b9-2089-11f0-a293-a0294223b12a',1110.610),('b70bdfa2-1bc8-48ab-9338-603adc52e91f','5f5383cb-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','614daf38-2089-11f0-a293-a0294223b12a',1133.270),('99fd1dbc-5b5b-4584-abb1-797cde7cb393','5f5384ae-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','614de8d2-2089-11f0-a293-a0294223b12a',1139.420),('925ef4fd-c4c2-4763-8d76-8e3d1ebeae5c','5f538598-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','614dfee2-2089-11f0-a293-a0294223b12a',1161.450),('01529cae-6c77-4a75-85b3-ca968639127e','5f53867f-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','614e2048-2089-11f0-a293-a0294223b12a',1206.160),('2462e3ae-aba0-4348-9e19-33bf65efc68c','5f538762-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','614e357d-2089-11f0-a293-a0294223b12a',1214.350),('0a508730-979f-438b-9e02-dce29a7fb3ca','5f538844-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','614e511a-2089-11f0-a293-a0294223b12a',1220.870),('9eb982a9-49bb-44ac-8c30-fd7a1f702556','5f538924-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','614e73ad-2089-11f0-a293-a0294223b12a',1241.690),('578ac3be-e68f-469a-bc83-cbba9dd7565a','614eaeed-2089-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','5f538a0c-2089-11f0-a293-a0294223b12a',1260.270);
/*!40000 ALTER TABLE `responde16pf` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `actualizar_parametros_16pf` AFTER INSERT ON `responde16pf` FOR EACH ROW BEGIN
    DECLARE letra VARCHAR(5);
    DECLARE valor INT(5);

    SELECT p.letraAporte, o.valor16PF
    INTO letra, valor
    FROM preguntas16pf p
    JOIN opciones16pf o ON o.idPregunta16PF = p.idPregunta16PF
    WHERE o.idOpcion16PF = NEW.idOpcion16PF;

    IF letra = 'A' THEN
        UPDATE parametros16pf SET A = A + valor WHERE idAspirante = NEW.idAspirante;
    ELSEIF letra = 'B' THEN
        UPDATE parametros16pf SET B = B + valor WHERE idAspirante = NEW.idAspirante;
    ELSEIF letra = 'C' THEN
        UPDATE parametros16pf SET C = C + valor WHERE idAspirante = NEW.idAspirante;
    ELSEIF letra = 'E' THEN
        UPDATE parametros16pf SET E = E + valor WHERE idAspirante = NEW.idAspirante;
    ELSEIF letra = 'F' THEN
        UPDATE parametros16pf SET F = F + valor WHERE idAspirante = NEW.idAspirante;
    ELSEIF letra = 'G' THEN
        UPDATE parametros16pf SET G = G + valor WHERE idAspirante = NEW.idAspirante;
    ELSEIF letra = 'H' THEN
        UPDATE parametros16pf SET H = H + valor WHERE idAspirante = NEW.idAspirante;
    ELSEIF letra = 'I' THEN
        UPDATE parametros16pf SET I = I + valor WHERE idAspirante = NEW.idAspirante;
    ELSEIF letra = 'L' THEN
        UPDATE parametros16pf SET L = L + valor WHERE idAspirante = NEW.idAspirante;
    ELSEIF letra = 'M' THEN
        UPDATE parametros16pf SET M = M + valor WHERE idAspirante = NEW.idAspirante;
    ELSEIF letra = 'N' THEN
        UPDATE parametros16pf SET N = N + valor WHERE idAspirante = NEW.idAspirante;
    ELSEIF letra = 'O' THEN
        UPDATE parametros16pf SET O = O + valor WHERE idAspirante = NEW.idAspirante;
    ELSEIF letra = 'Q1' THEN
        UPDATE parametros16pf SET Q1 = Q1 + valor WHERE idAspirante = NEW.idAspirante;
    ELSEIF letra = 'Q2' THEN
        UPDATE parametros16pf SET Q2 = Q2 + valor WHERE idAspirante = NEW.idAspirante;
    ELSEIF letra = 'Q3' THEN
        UPDATE parametros16pf SET Q3 = Q3 + valor WHERE idAspirante = NEW.idAspirante;
    ELSEIF letra = 'Q4' THEN
        UPDATE parametros16pf SET Q4 = Q4 + valor WHERE idAspirante = NEW.idAspirante;
    ELSEIF letra = 'IM' THEN
        UPDATE parametros16pf SET IM = IM + valor WHERE idAspirante = NEW.idAspirante;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `respondekostick`
--

DROP TABLE IF EXISTS `respondekostick`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `respondekostick` (
  `idRespuestaKostick` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `idPreguntaKostick` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `idGrupo` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `idAspirante` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `idOpcionKostick` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `tiempo` decimal(12,3) NOT NULL,
  PRIMARY KEY (`idPreguntaKostick`,`idGrupo`,`idAspirante`),
  KEY `respondeKostick_ibfk_1` (`idGrupo`),
  KEY `respondeKostick_ibfk_2` (`idAspirante`),
  KEY `respondeKostick_ibfk_3` (`idOpcionKostick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respondekostick`
--

LOCK TABLES `respondekostick` WRITE;
/*!40000 ALTER TABLE `respondekostick` DISABLE KEYS */;
INSERT INTO `respondekostick` VALUES ('4c1850de-0e34-4643-a15c-f999051e59d7','a0cdfd30-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a131e448-2088-11f0-a293-a0294223b12a',3.660),('b58db1b4-918a-451e-ac18-077de54c58d5','a0cf3170-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a132054c-2088-11f0-a293-a0294223b12a',11.280),('dbb34f4c-94d8-4a2b-961a-acb5c614857b','a0cf36b4-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a13208a8-2088-11f0-a293-a0294223b12a',15.240),('01042459-c1ae-4905-82d2-fa3ef6d7580e','a0cf389b-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a1321318-2088-11f0-a293-a0294223b12a',18.760),('03b967f9-1864-4120-8599-d941573a1b15','a0cf39e2-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a1321af1-2088-11f0-a293-a0294223b12a',22.680),('8086ba62-4a0a-43c0-a83a-24f96c16c82a','a0cf4b35-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a1321fbc-2088-11f0-a293-a0294223b12a',25.890),('6ee4d699-d390-4797-ad7c-198ef00fca2c','a0cf4ea0-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a132293d-2088-11f0-a293-a0294223b12a',30.740),('7d700362-8467-4507-9d4e-9b08e7fdb8b2','a0cf5078-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a13237c6-2088-11f0-a293-a0294223b12a',34.190),('35daf3e8-6004-4000-a9fe-c98be81d6a44','a0cf5208-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a1323cc1-2088-11f0-a293-a0294223b12a',37.790),('2fade3cf-c9e4-4b91-8bec-7f8f8648d411','a0cf537b-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a132467f-2088-11f0-a293-a0294223b12a',42.800),('409d1ddc-e47e-4005-bc6d-16ea86a49482','a0cf54e5-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a13251b9-2088-11f0-a293-a0294223b12a',46.090),('4f87778f-8eec-41ef-b128-3746289a0549','a0cf5664-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a1325b8b-2088-11f0-a293-a0294223b12a',49.730),('e72e2ec4-bc7e-4ddf-a21c-78d9b70d3b44','a0cf57d9-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a1326531-2088-11f0-a293-a0294223b12a',53.700),('0aefca36-8595-4d6e-8ef2-8b3ea07ae53c','a0cf5949-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a13274d1-2088-11f0-a293-a0294223b12a',56.980),('bee1461f-1e3d-4a38-8401-610b122cc2f8','a0cf5ab4-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a1327ea3-2088-11f0-a293-a0294223b12a',60.020),('42a71269-3b7c-470d-a623-bb390d892982','a0cf5c12-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a13284c1-2088-11f0-a293-a0294223b12a',63.740),('e2e70467-676c-43f2-9dd6-03c69a28f533','a0cf5d8d-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a1328972-2088-11f0-a293-a0294223b12a',73.830),('73499f36-fa28-42cc-809b-fb8e667bd243','a0cf5ef1-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a1329421-2088-11f0-a293-a0294223b12a',79.790),('3a8ca8bc-2ff1-4126-976f-49c2bef6ad71','a0cf6047-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a1329d59-2088-11f0-a293-a0294223b12a',83.870),('0daf5a6f-192a-44ed-b507-1a63f69d6884','a0cf61b0-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a132a33f-2088-11f0-a293-a0294223b12a',89.180),('d8a5fa38-e24a-47da-9d8e-82727bdf2271','a0cf6311-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a132acdf-2088-11f0-a293-a0294223b12a',93.110),('bca52fc9-7334-4f32-9c5c-bb88db50fd5a','a0cf6478-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a132b650-2088-11f0-a293-a0294223b12a',97.000),('ad248604-0ed2-41ee-ad74-bf12adf6d652','a0cf6615-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a132c52c-2088-11f0-a293-a0294223b12a',99.840),('67edb30f-051c-4d75-9481-67a0be242833','a0cf6787-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a132c9fc-2088-11f0-a293-a0294223b12a',103.230),('2776f67b-f2f3-403a-904b-7c6bd45e5ac0','a0cf68f4-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a132d892-2088-11f0-a293-a0294223b12a',106.750),('24fbcf88-3378-411a-a85c-00dc13e60e74','a0cf6a5b-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a132dd8c-2088-11f0-a293-a0294223b12a',109.520),('e3884109-3618-4285-8710-bc92b81e7a64','a0cf6bbd-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a132e722-2088-11f0-a293-a0294223b12a',114.550),('ca5b4bd9-72c5-4f9b-a6b9-900c47e69f08','a0cf6d22-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a132f1bc-2088-11f0-a293-a0294223b12a',118.500),('6356b7f3-53e1-401c-b166-2d549aeb319e','a0cf6e86-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a133002c-2088-11f0-a293-a0294223b12a',124.000),('5eb354d0-b299-4373-93de-794c279dcc16','a0cf70a0-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a133050f-2088-11f0-a293-a0294223b12a',127.450),('b2232d23-85c5-4497-8f2b-54c2cb6719e7','a0cf724f-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a1330ebe-2088-11f0-a293-a0294223b12a',130.460),('b3f200c5-3fcf-4acd-ae8c-e4e31550fedc','a0cf73bb-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a1331861-2088-11f0-a293-a0294223b12a',132.450),('ea11021f-d04e-42c5-906b-64b2b0305dd6','a0cf752b-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a1332211-2088-11f0-a293-a0294223b12a',136.600),('718c2284-07e2-4221-b0c2-17d7e114aa82','a0cf7678-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a1333099-2088-11f0-a293-a0294223b12a',141.120),('d2f937fd-ccd6-450b-85f3-6bfd78e7af57','a0cf77ca-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a1333595-2088-11f0-a293-a0294223b12a',148.570),('feffaef7-dce2-4e68-be64-08753c598c2c','a0cf791d-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a1334049-2088-11f0-a293-a0294223b12a',150.690),('72121e3a-e982-42f3-8f8c-ddfd1ca1e39f','a0cf7a8e-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a1334e85-2088-11f0-a293-a0294223b12a',156.200),('9fcbecfb-552d-4bea-b260-2f965d7058cf','a0cf7bdd-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a133582b-2088-11f0-a293-a0294223b12a',158.710),('aa47e01c-75ce-4a09-9de6-b47344c686db','a0cf7d32-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a13361a4-2088-11f0-a293-a0294223b12a',161.470),('519b3907-4f9a-4705-80f7-0bf8103cef7b','a0cf7e84-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a1336661-2088-11f0-a293-a0294223b12a',165.720),('b0b36014-5a78-499c-a38e-dfb754ab0a23','a0cf7fe2-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a1336ff8-2088-11f0-a293-a0294223b12a',167.740),('6a84b2a4-befb-428e-815f-f59216e8b4a3','a0cf813d-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a1337b31-2088-11f0-a293-a0294223b12a',169.970),('e1c4ba9d-62d9-4d32-923a-7aa25ce3dd19','a0cf82cb-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a13384b1-2088-11f0-a293-a0294223b12a',178.370),('47dc0613-1c5c-4b9a-8b7d-cb10fd1efc23','a0cf8425-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a13393ec-2088-11f0-a293-a0294223b12a',183.660),('54f529d8-9314-4841-b4f6-1214b60423c4','a0cf857a-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a13398ae-2088-11f0-a293-a0294223b12a',185.850),('f219b2f6-73d8-4c01-a771-a2153282ea94','a0cf86d3-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a133a225-2088-11f0-a293-a0294223b12a',190.580),('62db5ab3-5174-40bc-8f56-0d3df4188b10','a0cf8827-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a133b064-2088-11f0-a293-a0294223b12a',194.280),('7952d388-b0a9-481b-89f1-ae0060beff44','a0cf8978-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a133b558-2088-11f0-a293-a0294223b12a',198.320),('b3df7165-fc26-4d4b-bb4b-f06cf49a9de2','a0cf8ac8-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a133bef9-2088-11f0-a293-a0294223b12a',201.400),('5863136c-6a95-49b4-b671-adfffe400ed0','a0cf8c16-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a133c8b6-2088-11f0-a293-a0294223b12a',203.960),('e799cb81-34a9-4047-ba4f-7057309d458e','a0cf8ebc-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a133d327-2088-11f0-a293-a0294223b12a',209.890),('0f768741-1d13-46d8-b291-0e927f4ee999','a0cf901b-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a133ddfd-2088-11f0-a293-a0294223b12a',212.140),('54868a2f-ee7a-4b46-b811-67e4b3d31bd0','a0cf916c-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a133ecb9-2088-11f0-a293-a0294223b12a',214.470),('e79cb693-a824-4ff1-a0cb-0a9a0b5cf2bc','a0cf92bb-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a133f2e7-2088-11f0-a293-a0294223b12a',217.990),('a244f2a5-d82c-4ba4-83f0-b1e8e7e89b1a','a0cf93ff-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a133fc8a-2088-11f0-a293-a0294223b12a',221.040),('4b78d20e-9af3-41b1-948a-6e6e8ab48cc0','a0cf9566-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a1340ac8-2088-11f0-a293-a0294223b12a',224.640),('327fec11-8095-4995-8419-351221831095','a0cf96cc-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a1341464-2088-11f0-a293-a0294223b12a',228.680),('3aae12aa-fa3b-4c0f-8aef-ad57d8e4ffe5','a0cf9822-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a1341944-2088-11f0-a293-a0294223b12a',235.200),('51085c3c-3abf-48ce-b031-eecd23b62175','a0cf997f-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a134233c-2088-11f0-a293-a0294223b12a',238.720),('9ba044db-9ff5-450e-a403-1dbd84355964','a0cf9acf-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a1348b01-2088-11f0-a293-a0294223b12a',242.500),('e6c2735c-3c5e-41af-ad82-95de0454dfb4','a0cf9c23-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a1348fb3-2088-11f0-a293-a0294223b12a',245.700),('2e42e693-56f5-4cfc-8420-b9b1dc966274','a0cf9d84-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a13499d8-2088-11f0-a293-a0294223b12a',250.000),('8d49a632-c379-412c-9271-5ce296c63fdc','a0cf9f00-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a134a390-2088-11f0-a293-a0294223b12a',253.510),('51fb815a-dfb7-442e-86fc-598220c390a9','a0cfa06c-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a134a84c-2088-11f0-a293-a0294223b12a',257.950),('d7df42da-a778-42a2-a0f4-bd1e78ec337d','a0cfa1eb-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a134b1b4-2088-11f0-a293-a0294223b12a',262.160),('1f95c10b-25bd-4bad-ad76-0972ec789851','a0cfa382-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a134c059-2088-11f0-a293-a0294223b12a',265.660),('34a81b2b-37cb-4ef4-b114-f05ee9912270','a0cfa544-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a134c69f-2088-11f0-a293-a0294223b12a',268.450),('ef9ba2bd-ce02-4fb4-85ca-a055e2632264','a0cfa6cb-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a134d02f-2088-11f0-a293-a0294223b12a',272.730),('e4cb3aa1-52db-4577-917d-e945d8bf89ff','a0cfa84a-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a134da12-2088-11f0-a293-a0294223b12a',280.380),('6f36b26b-e801-4a77-bc27-3dbac78f91fa','a0cfa9ad-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a134e654-2088-11f0-a293-a0294223b12a',284.270),('a53a5522-3985-4a98-9bd6-830105af2089','a0cfab06-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a134eb23-2088-11f0-a293-a0294223b12a',288.720),('1ab2288b-f3d3-4ad9-8137-424ef30ba3ca','a0cfac79-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a134f4ab-2088-11f0-a293-a0294223b12a',291.530),('a6b52364-ff3a-48f2-8763-d03487978be3','a0cfadde-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a134fe3f-2088-11f0-a293-a0294223b12a',294.710),('82ecf9fc-2b8c-42dc-8fca-66a7d9457334','a0cfaf45-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a13507fa-2088-11f0-a293-a0294223b12a',298.760),('47183944-5d77-48e8-be2c-0a7eb3b80fae','a0cfb0ef-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a135184f-2088-11f0-a293-a0294223b12a',302.830),('1c096e40-90cc-4517-a43c-1f34d12125e6','a0cfb254-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a1351d36-2088-11f0-a293-a0294223b12a',307.270),('cb407ca9-4956-41d9-a5e4-c0b0b29563cd','a0cfb3c4-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a13526e0-2088-11f0-a293-a0294223b12a',310.000),('00e40eb6-66dc-45af-8073-64763abd40a1','a0cfb53a-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a1353196-2088-11f0-a293-a0294223b12a',313.330),('e2c77fc9-c783-45f0-87d8-e9eebdafe618','a0cfb6b1-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a1353b34-2088-11f0-a293-a0294223b12a',316.570),('df722238-ec74-45a3-9638-b7e70fb338a3','a0cfb828-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a13544d5-2088-11f0-a293-a0294223b12a',319.340),('1ccfdfe4-82b5-4483-9a1d-28481b173582','a0cfb99c-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a135532c-2088-11f0-a293-a0294223b12a',322.200),('9a83d64e-65aa-4cf6-b305-18b6248bd9fb','a0cfbaf4-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a135580f-2088-11f0-a293-a0294223b12a',326.430),('043d6b7f-baf0-49e8-9f1e-37f8de9bec5b','a0cfbc52-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a135635c-2088-11f0-a293-a0294223b12a',328.620),('b8840fa3-e30d-461d-b14e-b66dd6bbdaa2','a0cfbda5-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a1356cf6-2088-11f0-a293-a0294223b12a',331.750),('106f75e6-faed-4d4c-b465-70b645639fc1','a0cfbf09-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a1357698-2088-11f0-a293-a0294223b12a',334.900),('36f960d4-a499-4548-9773-5aebbae9dad2','a0cfc091-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a135852d-2088-11f0-a293-a0294223b12a',337.480),('8e1cefb5-cf3c-4076-a565-d60e534a5ddd','a0cfc201-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a1358a11-2088-11f0-a293-a0294223b12a',342.170),('78e3d499-3be7-4433-b71d-15fdb0fe86fe','a0cfc379-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a1359883-2088-11f0-a293-a0294223b12a',369.000),('53b50f69-e55d-42e9-bca3-e92263a33070','a0cfc4e0-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a1359d62-2088-11f0-a293-a0294223b12a',377.160),('f9525199-6485-4f92-ad86-0da83fc697f5','a0cfc64c-2088-11f0-a293-a0294223b12a','8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8','a135e259-2088-11f0-a293-a0294223b12a',387.200);
/*!40000 ALTER TABLE `respondekostick` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respuestaotisaspirante`
--

DROP TABLE IF EXISTS `respuestaotisaspirante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `respuestaotisaspirante` (
  `idRespuestaOtis` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `idAspirante` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `idGrupo` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `idPreguntaOtis` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `idOpcionOtis` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `idPrueba` int DEFAULT NULL,
  `respuestaAbierta` varchar(5) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tiempoRespuesta` int DEFAULT NULL,
  PRIMARY KEY (`idRespuestaOtis`),
  KEY `idAspirante` (`idAspirante`),
  KEY `idPreguntaOtis` (`idPreguntaOtis`),
  KEY `idOpcionOtis` (`idOpcionOtis`),
  KEY `idPrueba` (`idPrueba`),
  KEY `idGrupo` (`idGrupo`),
  CONSTRAINT `respuestaotisaspirante_ibfk_1` FOREIGN KEY (`idAspirante`) REFERENCES `aspirantes` (`idAspirante`),
  CONSTRAINT `respuestaotisaspirante_ibfk_2` FOREIGN KEY (`idPreguntaOtis`) REFERENCES `preguntasotis` (`idPreguntaOtis`),
  CONSTRAINT `respuestaotisaspirante_ibfk_3` FOREIGN KEY (`idOpcionOtis`) REFERENCES `opcionesotis` (`idOpcionOtis`),
  CONSTRAINT `respuestaotisaspirante_ibfk_4` FOREIGN KEY (`idPrueba`) REFERENCES `pruebas` (`idPrueba`),
  CONSTRAINT `respuestaotisaspirante_ibfk_5` FOREIGN KEY (`idGrupo`) REFERENCES `grupos` (`idGrupo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuestaotisaspirante`
--

LOCK TABLES `respuestaotisaspirante` WRITE;
/*!40000 ALTER TABLE `respuestaotisaspirante` DISABLE KEYS */;
/*!40000 ALTER TABLE `respuestaotisaspirante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respuestas16pfaspirante`
--

DROP TABLE IF EXISTS `respuestas16pfaspirante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `respuestas16pfaspirante` (
  `idRespuesta16PF` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `idAspirante` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `idGrupo` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `idPregunta16PF` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `idOpcion16PF` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `idPrueba` int DEFAULT NULL,
  `tiempoRespuesta` int DEFAULT NULL,
  PRIMARY KEY (`idRespuesta16PF`),
  KEY `idAspirante` (`idAspirante`),
  KEY `idGrupo` (`idGrupo`),
  KEY `idPregunta16PF` (`idPregunta16PF`),
  KEY `idOpcion16PF` (`idOpcion16PF`),
  KEY `idPrueba` (`idPrueba`),
  CONSTRAINT `respuestas16pfaspirante_ibfk_1` FOREIGN KEY (`idAspirante`) REFERENCES `aspirantes` (`idAspirante`),
  CONSTRAINT `respuestas16pfaspirante_ibfk_2` FOREIGN KEY (`idGrupo`) REFERENCES `grupos` (`idGrupo`),
  CONSTRAINT `respuestas16pfaspirante_ibfk_3` FOREIGN KEY (`idPregunta16PF`) REFERENCES `preguntas16pf` (`idPregunta16PF`),
  CONSTRAINT `respuestas16pfaspirante_ibfk_4` FOREIGN KEY (`idOpcion16PF`) REFERENCES `opciones16pf` (`idOpcion16PF`),
  CONSTRAINT `respuestas16pfaspirante_ibfk_5` FOREIGN KEY (`idPrueba`) REFERENCES `pruebas` (`idPrueba`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuestas16pfaspirante`
--

LOCK TABLES `respuestas16pfaspirante` WRITE;
/*!40000 ALTER TABLE `respuestas16pfaspirante` DISABLE KEYS */;
/*!40000 ALTER TABLE `respuestas16pfaspirante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respuestashartman`
--

DROP TABLE IF EXISTS `respuestashartman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `respuestashartman` (
  `idRespuestaHartman` int NOT NULL AUTO_INCREMENT,
  `idAspirante` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `idGrupo` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `idPreguntaHartman` int NOT NULL,
  `idPrueba` int NOT NULL,
  `respuestaAbierta` varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  `tiempoRespuesta` int NOT NULL,
  PRIMARY KEY (`idRespuestaHartman`),
  KEY `idAspirante` (`idAspirante`),
  KEY `idGrupo` (`idGrupo`),
  KEY `idPreguntaHartman` (`idPreguntaHartman`),
  KEY `idPrueba` (`idPrueba`),
  CONSTRAINT `respuestashartman_ibfk_1` FOREIGN KEY (`idAspirante`) REFERENCES `aspirantes` (`idAspirante`),
  CONSTRAINT `respuestashartman_ibfk_2` FOREIGN KEY (`idGrupo`) REFERENCES `grupos` (`idGrupo`),
  CONSTRAINT `respuestashartman_ibfk_3` FOREIGN KEY (`idPreguntaHartman`) REFERENCES `preguntashartman` (`idPreguntaHartman`),
  CONSTRAINT `respuestashartman_ibfk_4` FOREIGN KEY (`idPrueba`) REFERENCES `pruebas` (`idPrueba`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuestashartman`
--

LOCK TABLES `respuestashartman` WRITE;
/*!40000 ALTER TABLE `respuestashartman` DISABLE KEYS */;
/*!40000 ALTER TABLE `respuestashartman` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respuestaskostickaspirante`
--

DROP TABLE IF EXISTS `respuestaskostickaspirante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `respuestaskostickaspirante` (
  `idRespuestaKostick` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `idAspirante` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `idGrupo` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `idPreguntaKostick` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `idOpcionKostick` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `idPrueba` int DEFAULT NULL,
  `tiempoRespuesta` int DEFAULT NULL,
  PRIMARY KEY (`idRespuestaKostick`),
  KEY `idAspirante` (`idAspirante`),
  KEY `idGrupo` (`idGrupo`),
  KEY `idPreguntaKostick` (`idPreguntaKostick`),
  KEY `idOpcionKostick` (`idOpcionKostick`),
  KEY `idPrueba` (`idPrueba`),
  CONSTRAINT `respuestaskostickaspirante_ibfk_1` FOREIGN KEY (`idAspirante`) REFERENCES `aspirantes` (`idAspirante`),
  CONSTRAINT `respuestaskostickaspirante_ibfk_2` FOREIGN KEY (`idGrupo`) REFERENCES `grupos` (`idGrupo`),
  CONSTRAINT `respuestaskostickaspirante_ibfk_3` FOREIGN KEY (`idPreguntaKostick`) REFERENCES `preguntaskostick` (`idPreguntaKostick`),
  CONSTRAINT `respuestaskostickaspirante_ibfk_4` FOREIGN KEY (`idOpcionKostick`) REFERENCES `opcioneskostick` (`idOpcionKostick`),
  CONSTRAINT `respuestaskostickaspirante_ibfk_5` FOREIGN KEY (`idPrueba`) REFERENCES `pruebas` (`idPrueba`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuestaskostickaspirante`
--

LOCK TABLES `respuestaskostickaspirante` WRITE;
/*!40000 ALTER TABLE `respuestaskostickaspirante` DISABLE KEYS */;
/*!40000 ALTER TABLE `respuestaskostickaspirante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respuestastermanaspirante`
--

DROP TABLE IF EXISTS `respuestastermanaspirante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `respuestastermanaspirante` (
  `idRespuestaTerman` int NOT NULL AUTO_INCREMENT,
  `idAspirante` varchar(36) COLLATE utf8mb4_spanish_ci NOT NULL,
  `idGrupo` varchar(36) COLLATE utf8mb4_spanish_ci NOT NULL,
  `idPreguntaTerman` int NOT NULL,
  `idPrueba` int NOT NULL,
  `respuestaAbierta` varchar(500) COLLATE utf8mb4_spanish_ci NOT NULL,
  `tiempoRespuesta` int NOT NULL,
  PRIMARY KEY (`idRespuestaTerman`),
  KEY `idAspirante` (`idAspirante`),
  KEY `idGrupo` (`idGrupo`),
  KEY `idPreguntaTerman` (`idPreguntaTerman`),
  KEY `idPrueba` (`idPrueba`)
) ENGINE=InnoDB AUTO_INCREMENT=384 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuestastermanaspirante`
--

LOCK TABLES `respuestastermanaspirante` WRITE;
/*!40000 ALTER TABLE `respuestastermanaspirante` DISABLE KEYS */;
/*!40000 ALTER TABLE `respuestastermanaspirante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resultadoshartman`
--

DROP TABLE IF EXISTS `resultadoshartman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resultadoshartman` (
  `idAspirante` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `idGrupo` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `fraseDimI` float NOT NULL,
  `fraseDimE` float NOT NULL,
  `fraseDimS` float NOT NULL,
  `fraseDif` float NOT NULL,
  `fraseDimGeneral` float NOT NULL,
  `fraseDimPorcentaje` float NOT NULL,
  `fraseIntI` float NOT NULL,
  `fraseIntE` float NOT NULL,
  `fraseIntS` float NOT NULL,
  `fraseIntGeneral` float NOT NULL,
  `fraseIntPorcentaje` float NOT NULL,
  `fraseDi` float NOT NULL,
  `fraseDIS` float NOT NULL,
  `fraseAiPorcentaje` float NOT NULL,
  `fraseVQ1` float NOT NULL,
  `fraseVQ2` float NOT NULL,
  `citaDimI` float NOT NULL,
  `citaDimE` float NOT NULL,
  `citaDimS` float NOT NULL,
  `citaDif` float NOT NULL,
  `citaDimGeneral` float NOT NULL,
  `citaDimPorcentaje` float NOT NULL,
  `citaIntI` float NOT NULL,
  `citaIntE` float NOT NULL,
  `citaIntS` float NOT NULL,
  `citaIntGeneral` float NOT NULL,
  `citaIntPorcentaje` float NOT NULL,
  `citaDi` float NOT NULL,
  `citaDIS` float NOT NULL,
  `citaAiPorcentaje` float NOT NULL,
  `citaSQ1` float NOT NULL,
  `citaSQ2` float NOT NULL,
  `BQr1` float NOT NULL,
  `BQa1` float NOT NULL,
  `BQr2` float NOT NULL,
  `BQa2` float NOT NULL,
  `CQ1` float NOT NULL,
  `CQ2` float NOT NULL,
  KEY `idAspirante` (`idAspirante`),
  KEY `idGrupo` (`idGrupo`),
  CONSTRAINT `resultadoshartman_ibfk_1` FOREIGN KEY (`idAspirante`) REFERENCES `aspirantes` (`idAspirante`),
  CONSTRAINT `resultadoshartman_ibfk_2` FOREIGN KEY (`idGrupo`) REFERENCES `grupos` (`idGrupo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resultadoshartman`
--

LOCK TABLES `resultadoshartman` WRITE;
/*!40000 ALTER TABLE `resultadoshartman` DISABLE KEYS */;
/*!40000 ALTER TABLE `resultadoshartman` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resultadoskostick`
--

DROP TABLE IF EXISTS `resultadoskostick`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resultadoskostick` (
  `idGrupo` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `idAspirante` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci NOT NULL,
  `G` int NOT NULL,
  `L` int NOT NULL,
  `I` int NOT NULL,
  `T` int NOT NULL,
  `V` int NOT NULL,
  `S` int NOT NULL,
  `R` int NOT NULL,
  `D` int NOT NULL,
  `C` int NOT NULL,
  `E` int NOT NULL,
  `W` int NOT NULL,
  `F` int NOT NULL,
  `K` int NOT NULL,
  `Z` int NOT NULL,
  `O` int NOT NULL,
  `B` int NOT NULL,
  `X` int NOT NULL,
  `P` int NOT NULL,
  `A` int NOT NULL,
  `N` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resultadoskostick`
--

LOCK TABLES `resultadoskostick` WRITE;
/*!40000 ALTER TABLE `resultadoskostick` DISABLE KEYS */;
INSERT INTO `resultadoskostick` VALUES ('660cd23c-260f-11f0-9737-020197ac33d8','534fd092-261a-11f0-9737-020197ac33d8',9,8,7,6,5,4,3,2,1,0,9,8,7,6,5,4,3,2,1,0),('c93757df-26db-11f0-9737-020197ac33d8','e42bf42d-26db-11f0-9737-020197ac33d8',0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9),('8ace6af8-2702-11f0-9737-020197ac33d8','9364f231-2702-11f0-9737-020197ac33d8',8,9,4,4,4,2,6,1,4,3,6,5,4,5,6,2,5,6,4,2);
/*!40000 ALTER TABLE `resultadoskostick` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resultadosseriesterman`
--

DROP TABLE IF EXISTS `resultadosseriesterman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resultadosseriesterman` (
  `idResultadoSerieTerman` int NOT NULL AUTO_INCREMENT,
  `idAspirante` varchar(36) COLLATE utf8mb4_spanish_ci NOT NULL,
  `idGrupo` varchar(36) COLLATE utf8mb4_spanish_ci NOT NULL,
  `idSerieTerman` int NOT NULL,
  `idCalificacionTerman` int NOT NULL,
  `categoria` varchar(500) COLLATE utf8mb4_spanish_ci NOT NULL,
  `puntuacion` int NOT NULL,
  `rango` varchar(500) COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`idResultadoSerieTerman`),
  KEY `idAspirante` (`idAspirante`),
  KEY `idGrupo` (`idGrupo`),
  KEY `idSerieTerman` (`idSerieTerman`),
  KEY `idCalificacionTerman` (`idCalificacionTerman`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resultadosseriesterman`
--

LOCK TABLES `resultadosseriesterman` WRITE;
/*!40000 ALTER TABLE `resultadosseriesterman` DISABLE KEYS */;
/*!40000 ALTER TABLE `resultadosseriesterman` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `idRol` int NOT NULL AUTO_INCREMENT,
  `nombreRol` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`idRol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Coordinador'),(2,'Psicologo'),(3,'Aspirante');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rolesprivilegios`
--

DROP TABLE IF EXISTS `rolesprivilegios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rolesprivilegios` (
  `idRol` int NOT NULL,
  `idPrivilegio` int NOT NULL,
  PRIMARY KEY (`idRol`,`idPrivilegio`),
  KEY `idPrivilegio` (`idPrivilegio`),
  CONSTRAINT `rolesprivilegios_ibfk_1` FOREIGN KEY (`idRol`) REFERENCES `roles` (`idRol`),
  CONSTRAINT `rolesprivilegios_ibfk_2` FOREIGN KEY (`idPrivilegio`) REFERENCES `privilegios` (`idPrivilegio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rolesprivilegios`
--

LOCK TABLES `rolesprivilegios` WRITE;
/*!40000 ALTER TABLE `rolesprivilegios` DISABLE KEYS */;
INSERT INTO `rolesprivilegios` VALUES (1,1),(2,1),(3,1),(1,2),(2,2),(3,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(3,19),(3,20),(3,21),(3,22),(2,23),(2,24),(2,25),(2,26),(2,27),(2,28),(2,29),(2,30);
/*!40000 ALTER TABLE `rolesprivilegios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seleccionescolores`
--

DROP TABLE IF EXISTS `seleccionescolores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seleccionescolores` (
  `idSeleccionColores` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `idPrueba` int DEFAULT NULL,
  `idAspirante` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `idGrupo` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `idColor` int DEFAULT NULL,
  `posicion` int DEFAULT NULL,
  `fase` int DEFAULT NULL,
  PRIMARY KEY (`idSeleccionColores`),
  KEY `idPrueba` (`idPrueba`),
  KEY `idAspirante` (`idAspirante`),
  KEY `idColor` (`idColor`),
  KEY `idGrupo` (`idGrupo`),
  CONSTRAINT `seleccionescolores_ibfk_1` FOREIGN KEY (`idPrueba`) REFERENCES `pruebas` (`idPrueba`),
  CONSTRAINT `seleccionescolores_ibfk_2` FOREIGN KEY (`idAspirante`) REFERENCES `aspirantes` (`idAspirante`),
  CONSTRAINT `seleccionescolores_ibfk_3` FOREIGN KEY (`idColor`) REFERENCES `colores` (`idColor`),
  CONSTRAINT `seleccionescolores_ibfk_4` FOREIGN KEY (`idGrupo`) REFERENCES `grupos` (`idGrupo`),
  CONSTRAINT `seleccionescolores_chk_1` CHECK (((`posicion` <= 7) and (`posicion` >= 0))),
  CONSTRAINT `seleccionescolores_chk_2` CHECK (((`fase` = 1) or (`fase` = 2)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seleccionescolores`
--

LOCK TABLES `seleccionescolores` WRITE;
/*!40000 ALTER TABLE `seleccionescolores` DISABLE KEYS */;
/*!40000 ALTER TABLE `seleccionescolores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seriesterman`
--

DROP TABLE IF EXISTS `seriesterman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seriesterman` (
  `idSerieTerman` int NOT NULL AUTO_INCREMENT,
  `idPrueba` int NOT NULL,
  `duracion` int NOT NULL,
  `nombreSeccion` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `instruccion` longtext COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`idSerieTerman`),
  KEY `idPrueba` (`idPrueba`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seriesterman`
--

LOCK TABLES `seriesterman` WRITE;
/*!40000 ALTER TABLE `seriesterman` DISABLE KEYS */;
INSERT INTO `seriesterman` VALUES (1,4,120,'Información y conocimientos','Selecciona la letra correspondiente a la palabra que complete correctamente la oración.'),(2,4,120,'Comprensión','Lea cada cuestión y seleccione la letra correspondiente a la mejor respuesta.'),(3,4,120,'Significados verbales','Cuando las dos palabras signifiquen lo mismo, seleccione Igual, cuando signifique lo opuesto, seleccione Opuesto.'),(4,4,180,'Selección lógica','Seleccione dos letras correspondientes a las dos palabras que indican algo que siempre\r\ntiene el sujeto, seleccione dos para cada renglón. No importa el orden.'),(5,4,300,'Aritmética','Encuentre las respuestas lo más pronto posible. Escriba en el espacio de respuesta. Solo acepta números.'),(6,4,120,'Juicio práctico','Anote la respuesta correcta.'),(7,4,120,'Analogías','Seleccione la letra correspondiente a la palabra que complete correctamente la oración.'),(8,4,180,'Ordenamiento de frases','Las palabras de cada una de las oraciones siguientes están mezcladas, ordene cada una de las oraciones si el\r\nsignificado de la oración es verdadero, seleccione Verdadero; si el significado es falso, seleccione Falso.'),(9,4,120,'Clasificación','Ponga la letra que no corresponda con los demás del renglón.'),(10,4,240,'Seriación','En cada renglón procure encontrar como están hechas las series después escriba en los espacios de respuesta, los\r\ndos números que deban seguir en cada serie. Solo acepta números.');
/*!40000 ALTER TABLE `seriesterman` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoinstitucion`
--

DROP TABLE IF EXISTS `tipoinstitucion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipoinstitucion` (
  `idTipoInstitucion` int NOT NULL AUTO_INCREMENT,
  `nombreTipoInstitucion` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`idTipoInstitucion`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoinstitucion`
--

LOCK TABLES `tipoinstitucion` WRITE;
/*!40000 ALTER TABLE `tipoinstitucion` DISABLE KEYS */;
INSERT INTO `tipoinstitucion` VALUES (1,'Educativa Pública'),(2,'Educativa Privada');
/*!40000 ALTER TABLE `tipoinstitucion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `idUsuario` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `usuario` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `estatusUsuario` tinyint(1) DEFAULT NULL,
  `nombreUsuario` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `apellidoPaterno` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `apellidoMaterno` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `correo` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `lada` varchar(4) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `numeroTelefono` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `idRol` int DEFAULT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `idRol` (`idRol`),
  KEY `usuario` (`usuario`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`idRol`) REFERENCES `roles` (`idRol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES ('510a7ecf-3e4f-11f0-8e65-020197ac33d8','bernardo.laing@gmail.com',1,'Bernardo','Laing','Bernal','bernardo.laing@gmail.com','52','4422497177',1),('510a8324-3e4f-11f0-8e65-020197ac33d8','claudia.calvo.tercero@gmail.com',1,'Claudia','Calvo','Tercero','claudia.calvo.tercero@gmail.com','+52','4523416752',1),('510a8493-3e4f-11f0-8e65-020197ac33d8','clau1863@yahoo.com.mx',1,'Claudia','Cook','Gonzalez','clau1863@yahoo.com.mx','+52','4423410957',1),('510a85fa-3e4f-11f0-8e65-020197ac33d8','rossmachuca@gmail.com',1,'Rosalia','Machuca','Munguia','rossmachuca@gmail.com','+52','4421151238',1),('5c9fb49a-3efd-11f0-8e65-020197ac33d8','psicodx.03@gmail.com',1,'PRUEBA','PSICODX','prueba','psicodx.03@gmail.com','52','4423837566',3),('8866e7d0-3e4f-11f0-8e65-020197ac33d8','ferdivaldezg@gmail.com',1,'Fernanda','Valdez','Guillen','ferdivaldezg@gmail.com','52','4422497177',1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `updateUsuario` BEFORE UPDATE ON `usuarios` FOR EACH ROW BEGIN
    IF NEW.correo != OLD.correo THEN
        SET NEW.usuario = NEW.correo;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `vistapreguntasrespustasaspirante`
--

DROP TABLE IF EXISTS `vistapreguntasrespustasaspirante`;
/*!50001 DROP VIEW IF EXISTS `vistapreguntasrespustasaspirante`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vistapreguntasrespustasaspirante` AS SELECT 
 1 AS `numeroPregunta`,
 1 AS `preguntaOtis`,
 1 AS `opcionOtis`,
 1 AS `descripcionOpcion`,
 1 AS `esCorrecta`,
 1 AS `tiempoRespuesta`,
 1 AS `respuestaAbierta`,
 1 AS `idAspirante`,
 1 AS `idPrueba`,
 1 AS `idGrupo`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vistapruebasaspirantes`
--

DROP TABLE IF EXISTS `vistapruebasaspirantes`;
/*!50001 DROP VIEW IF EXISTS `vistapruebasaspirantes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vistapruebasaspirantes` AS SELECT 
 1 AS `nombre`,
 1 AS `nombreEstatus`,
 1 AS `descripcion`,
 1 AS `fechaLimite`,
 1 AS `duracion`,
 1 AS `idAspirante`,
 1 AS `nombreGrupo`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vistapreguntasrespustasaspirante`
--

/*!50001 DROP VIEW IF EXISTS `vistapreguntasrespustasaspirante`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vistapreguntasrespustasaspirante` AS select `po`.`numeroPregunta` AS `numeroPregunta`,`po`.`preguntaOtis` AS `preguntaOtis`,`oo`.`opcionOtis` AS `opcionOtis`,`oo`.`descripcionOpcion` AS `descripcionOpcion`,`oo`.`esCorrecta` AS `esCorrecta`,`roa`.`tiempoRespuesta` AS `tiempoRespuesta`,`roa`.`respuestaAbierta` AS `respuestaAbierta`,`roa`.`idAspirante` AS `idAspirante`,`roa`.`idPrueba` AS `idPrueba`,`roa`.`idGrupo` AS `idGrupo` from ((`respuestaotisaspirante` `roa` join `preguntasotis` `po` on((`roa`.`idPreguntaOtis` = `po`.`idPreguntaOtis`))) join `opcionesotis` `oo` on((`roa`.`idOpcionOtis` = `oo`.`idOpcionOtis`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vistapruebasaspirantes`
--

/*!50001 DROP VIEW IF EXISTS `vistapruebasaspirantes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vistapruebasaspirantes` AS select `p`.`nombre` AS `nombre`,`e`.`nombreEstatus` AS `nombreEstatus`,`p`.`descripcion` AS `descripcion`,`agp`.`fechaLimite` AS `fechaLimite`,`p`.`duracion` AS `duracion`,`a`.`idAspirante` AS `idAspirante`,`g`.`nombreGrupo` AS `nombreGrupo` from ((((`pruebas` `p` join `aspirantesgrupospruebas` `agp` on((`p`.`idPrueba` = `agp`.`idPrueba`))) join `estatusprueba` `e` on((`agp`.`idEstatus` = `e`.`idEstatus`))) join `aspirantes` `a` on((`agp`.`idAspirante` = `a`.`idAspirante`))) join `grupos` `g` on((`agp`.`idGrupo` = `g`.`idGrupo`))) */;
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

-- Dump completed on 2025-06-02 15:35:53


CREATE TABLE `reuniones` (
    idReunion VARCHAR(36) PRIMARY KEY, -- UUID
    tipo ENUM('group', '1on1') NOT NULL,
    idGrupo VARCHAR(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    idAspirante VARCHAR(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,      -- Only for 1on1
    idPsicologo VARCHAR(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,      -- Only for 1on1
    titulo VARCHAR(255) NOT NULL,
    fecha DATE NOT NULL,
    horaInicio TIME NOT NULL,
    horaFin TIME NOT NULL,
    link VARCHAR(512) NOT NULL,
    creadaPor VARCHAR(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,            -- User who created the meeting
    creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    -- Foreign keys
    CONSTRAINT fk_reuniones_grupo FOREIGN KEY (idGrupo) REFERENCES grupos(idGrupo),
    CONSTRAINT fk_reuniones_aspirante FOREIGN KEY (idAspirante) REFERENCES aspirantes(idAspirante),
    CONSTRAINT fk_reuniones_psicologo FOREIGN KEY (idPsicologo) REFERENCES usuarios(idUsuario),
    CONSTRAINT fk_reuniones_creadapor FOREIGN KEY (creadaPor) REFERENCES usuarios(idUsuario),
    -- Constraints for uniqueness
    CONSTRAINT unique_group_meeting UNIQUE (idGrupo, tipo),
    CONSTRAINT unique_1on1_meeting UNIQUE (idGrupo, idAspirante, tipo)
);