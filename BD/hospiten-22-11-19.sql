CREATE DATABASE  IF NOT EXISTS `hospiten` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `hospiten`;
-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hospiten
-- ------------------------------------------------------
-- Server version	5.7.26

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
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamentos` (
  `id_departamento` int(11) NOT NULL,
  `dep_nombre` varchar(45) DEFAULT NULL,
  `estatus` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id_departamento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` VALUES (1,'Administracion','A'),(2,'Enfermeria','A'),(3,'Intendencia','A'),(4,'Mantenimiento','A'),(5,'Sistemas','A'),(6,'Medicos','A'),(7,'Admision','A');
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `id_empleado` int(11) NOT NULL,
  `emp_numero_empleado` int(11) DEFAULT NULL,
  `emp_apaterno` varchar(25) DEFAULT NULL,
  `emp_amaterno` varchar(25) DEFAULT NULL,
  `emp_nombre` varchar(45) DEFAULT NULL,
  `emp_fecha_nacimiento` date DEFAULT NULL,
  `id_departamento` int(11) DEFAULT NULL,
  `estatus` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id_empleado`),
  KEY `id_departamento_idx` (`id_departamento`),
  CONSTRAINT `id_departamento` FOREIGN KEY (`id_departamento`) REFERENCES `departamentos` (`id_departamento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,5452,'Garcia','Garcia','Luis Fernando','1996-07-28',5,'A'),(2,7455,'Gomez','Perez','Carlos','1990-05-05',6,'A'),(3,7485,'Lopez','Marquez','Juab','1997-01-29',4,'A'),(4,4544,'Rodriguez','Rodriguez','Edgar','1990-02-20',1,'A'),(5,744,'Alvarez','Perez','Alan','1995-11-30',2,'A'),(6,2843,'Garcia','Garcia','David','1989-01-05',1,'A');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habitaciones`
--

DROP TABLE IF EXISTS `habitaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `habitaciones` (
  `id_habitacion` int(11) NOT NULL AUTO_INCREMENT,
  `hab_nombre` varchar(45) DEFAULT NULL,
  `hab_estado` varchar(12) DEFAULT NULL,
  `hab_fecha_ocupacion` date DEFAULT NULL,
  `estatus` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id_habitacion`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habitaciones`
--

LOCK TABLES `habitaciones` WRITE;
/*!40000 ALTER TABLE `habitaciones` DISABLE KEYS */;
INSERT INTO `habitaciones` VALUES (1,'UCI','Disponible',NULL,'A'),(2,'URGENCIAS','Disponible',NULL,'A'),(3,'HABITACION 1','Ocupado','2019-09-21','A'),(4,'QUIROFANO 1','Disponible',NULL,'A'),(5,'QUIROFANO 2','Disponible',NULL,'A'),(6,'HABITACION 2','Ocupado','2019-09-25','A'),(7,'HABITACION 3','Disponible',NULL,'A'),(8,'QUIROFANO 3','Disponible',NULL,'A'),(9,'QUIROFANO 4','Ocupado','2019-09-25','A'),(10,'HABITACION 4','Ocupado','2019-09-23','A'),(11,'HABITACION 5','Disponible',NULL,'A'),(12,'HABITACION 6','Disponible',NULL,'A');
/*!40000 ALTER TABLE `habitaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingresos`
--

DROP TABLE IF EXISTS `ingresos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingresos` (
  `id_ingreso` int(11) NOT NULL AUTO_INCREMENT,
  `ing_fecha` date DEFAULT NULL,
  `ing_diagnostico` longtext,
  `ing_alta` bit(1) DEFAULT NULL,
  `id_paciente` int(11) DEFAULT NULL,
  `estatus` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id_ingreso`),
  KEY `id_paciente_idx` (`id_paciente`),
  CONSTRAINT `id_paciente` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingresos`
--

LOCK TABLES `ingresos` WRITE;
/*!40000 ALTER TABLE `ingresos` DISABLE KEYS */;
INSERT INTO `ingresos` VALUES (1,'2019-09-15','PRUEBA 1',_binary '\0',1,'A'),(2,'2019-09-21','PRUEBA 2',_binary '\0',3,'A'),(3,'2019-09-17','PRUEBA 3',_binary '',5,'A'),(4,'2019-09-23','PRUEBA 4',_binary '',9,'A'),(5,'2019-09-20','PRUEBA 5',_binary '\0',7,'A'),(6,'2019-09-03','PRUEBA 6',_binary '\0',6,'A'),(7,'2019-08-11','PRUEBA 7',_binary '\0',5,'A'),(8,'2019-09-07','PRUEBA 8',_binary '',7,'A'),(9,'2019-07-08','PRUEBA 9',_binary '\0',5,'A'),(10,'2019-09-08','PRUEBA 10',_binary '\0',3,'A');
/*!40000 ALTER TABLE `ingresos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `noticias`
--

DROP TABLE IF EXISTS `noticias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `noticias` (
  `id_publicacion` int(11) NOT NULL AUTO_INCREMENT,
  `not_titulo` varchar(45) DEFAULT NULL,
  `not_contenido` longtext,
  `not_fecha` date DEFAULT NULL,
  `not_imagen` longblob,
  `not_link` varchar(99) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `estatus` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id_publicacion`),
  KEY `id_usuario_idx` (`id_usuario`),
  CONSTRAINT `id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noticias`
--

LOCK TABLES `noticias` WRITE;
/*!40000 ALTER TABLE `noticias` DISABLE KEYS */;
/*!40000 ALTER TABLE `noticias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pacientes`
--

DROP TABLE IF EXISTS `pacientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pacientes` (
  `id_paciente` int(11) NOT NULL AUTO_INCREMENT,
  `pac_apaterno` varchar(45) DEFAULT NULL,
  `pac_amaterno` varchar(45) DEFAULT NULL,
  `pac_nombre` varchar(45) DEFAULT NULL,
  `pac_fecha_nacimiento` date DEFAULT NULL,
  `pac_telefono` varchar(12) DEFAULT NULL,
  `estatus` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id_paciente`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pacientes`
--

LOCK TABLES `pacientes` WRITE;
/*!40000 ALTER TABLE `pacientes` DISABLE KEYS */;
INSERT INTO `pacientes` VALUES (1,'Garcia','Garcia','Fernando','1996-07-28','6241787829','A'),(2,'Garcia','Mejia','Jose Luis','1985-03-15','5517532168','A'),(3,'Martinez','Perez','Edgar','2000-01-29','6852314596','A'),(4,'Guzman','Loera','Joaquin','1970-03-21','8763210296','A'),(5,'Lopez','Alvarez','Jose Manuel','1985-03-15','6852314596','A'),(6,'Monterrubio','Vazques','Mario','1980-06-29','5412369741','A'),(7,'Montes','Garcia','Juan','1986-02-14','6325632369','A'),(8,'Perez','Alvarez','Perla','1992-04-21','7852369512','A'),(9,'Garcia','Perez','Daniela','1999-08-07','6213652986','A'),(10,'Zambada','Guzman','Ismael','1975-05-20','6662587349','A');
/*!40000 ALTER TABLE `pacientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiposusuario`
--

DROP TABLE IF EXISTS `tiposusuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tiposusuario` (
  `id_tipousuario` int(11) NOT NULL AUTO_INCREMENT,
  `tipousuario` varchar(15) DEFAULT NULL,
  `estatus` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id_tipousuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiposusuario`
--

LOCK TABLES `tiposusuario` WRITE;
/*!40000 ALTER TABLE `tiposusuario` DISABLE KEYS */;
INSERT INTO `tiposusuario` VALUES (1,'ADMINISTRADOR','A'),(2,'ESTANDAR','A'),(3,'BASICO','A');
/*!40000 ALTER TABLE `tiposusuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `usu_usuario` varchar(45) DEFAULT NULL,
  `usu_contrasena` varchar(45) DEFAULT NULL,
  `usu_apaterno` varchar(45) DEFAULT NULL,
  `usu_amaterno` varchar(45) DEFAULT NULL,
  `usu_nombre` varchar(45) DEFAULT NULL,
  `usu_telefono` varchar(12) DEFAULT NULL,
  `id_tipousuario` int(11) DEFAULT NULL,
  `estatus` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `id_tipousuario_idx` (`id_tipousuario`),
  CONSTRAINT `id_tipousuario` FOREIGN KEY (`id_tipousuario`) REFERENCES `tiposusuario` (`id_tipousuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,NULL,NULL,'GARCIA','GARCIA','LUIS FERNANDO','6241787829',1,'A');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_empleados`
--

DROP TABLE IF EXISTS `view_empleados`;
/*!50001 DROP VIEW IF EXISTS `view_empleados`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_empleados` AS SELECT 
 1 AS `emp_numero_empleado`,
 1 AS `emp_apaterno`,
 1 AS `emp_amaterno`,
 1 AS `emp_nombre`,
 1 AS `fechadenacimiento`,
 1 AS `dep_nombre`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_habitaciones`
--

DROP TABLE IF EXISTS `view_habitaciones`;
/*!50001 DROP VIEW IF EXISTS `view_habitaciones`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_habitaciones` AS SELECT 
 1 AS `hab_nombre`,
 1 AS `hab_estado`,
 1 AS `hab_fecha_ocupacion`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_pacientes`
--

DROP TABLE IF EXISTS `view_pacientes`;
/*!50001 DROP VIEW IF EXISTS `view_pacientes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_pacientes` AS SELECT 
 1 AS `id_ingreso`,
 1 AS `pac_apaterno`,
 1 AS `pac_amaterno`,
 1 AS `pac_nombre`,
 1 AS `ing_diagnostico`,
 1 AS `ing_fecha`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `view_empleados`
--

/*!50001 DROP VIEW IF EXISTS `view_empleados`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_empleados` AS select `empleados`.`emp_numero_empleado` AS `emp_numero_empleado`,`empleados`.`emp_apaterno` AS `emp_apaterno`,`empleados`.`emp_amaterno` AS `emp_amaterno`,`empleados`.`emp_nombre` AS `emp_nombre`,date_format(`empleados`.`emp_fecha_nacimiento`,'%d/%m/%Y') AS `fechadenacimiento`,`departamentos`.`dep_nombre` AS `dep_nombre` from (`empleados` join `departamentos`) where ((`empleados`.`estatus` = 'A') and (`empleados`.`id_departamento` = `departamentos`.`id_departamento`)) order by date_format(`empleados`.`emp_fecha_nacimiento`,'%m'),date_format(`empleados`.`emp_fecha_nacimiento`,'%d'),date_format(`empleados`.`emp_fecha_nacimiento`,'%y') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_habitaciones`
--

/*!50001 DROP VIEW IF EXISTS `view_habitaciones`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_habitaciones` AS select `habitaciones`.`hab_nombre` AS `hab_nombre`,`habitaciones`.`hab_estado` AS `hab_estado`,`habitaciones`.`hab_fecha_ocupacion` AS `hab_fecha_ocupacion` from `habitaciones` where (`habitaciones`.`estatus` = 'A') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_pacientes`
--

/*!50001 DROP VIEW IF EXISTS `view_pacientes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_pacientes` AS select `ingresos`.`id_ingreso` AS `id_ingreso`,`pacientes`.`pac_apaterno` AS `pac_apaterno`,`pacientes`.`pac_amaterno` AS `pac_amaterno`,`pacientes`.`pac_nombre` AS `pac_nombre`,`ingresos`.`ing_diagnostico` AS `ing_diagnostico`,`ingresos`.`ing_fecha` AS `ing_fecha` from (`pacientes` join `ingresos`) where ((`ingresos`.`ing_alta` = 0) and (`ingresos`.`estatus` = 'A') and (`ingresos`.`id_paciente` = `pacientes`.`id_paciente`)) order by `ingresos`.`ing_fecha` */;
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

-- Dump completed on 2019-11-22 17:23:30
