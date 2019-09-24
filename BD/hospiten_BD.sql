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
-- Table structure for table `habitaciones`
--

DROP TABLE IF EXISTS `habitaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `habitaciones` (
  `id_habitacion` int(11) NOT NULL,
  `hab_nombre` varchar(45) DEFAULT NULL,
  `hab_estado` int(11) DEFAULT NULL,
  `estatus` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id_habitacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habitaciones`
--

LOCK TABLES `habitaciones` WRITE;
/*!40000 ALTER TABLE `habitaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `habitaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingresos`
--

DROP TABLE IF EXISTS `ingresos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingresos` (
  `id_ingreso` int(11) NOT NULL,
  `ing_fecha` date DEFAULT NULL,
  `ing_diagnostico` longtext,
  `ing_alta` bit(1) DEFAULT NULL,
  `id_paciente` int(11) DEFAULT NULL,
  `estatus` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id_ingreso`),
  KEY `id_paciente_idx` (`id_paciente`),
  CONSTRAINT `id_paciente` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingresos`
--

LOCK TABLES `ingresos` WRITE;
/*!40000 ALTER TABLE `ingresos` DISABLE KEYS */;
/*!40000 ALTER TABLE `ingresos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pacientes`
--

DROP TABLE IF EXISTS `pacientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pacientes` (
  `id_paciente` int(11) NOT NULL,
  `pac_apaterno` varchar(45) DEFAULT NULL,
  `pac_amaterno` varchar(45) DEFAULT NULL,
  `pac_nombre` varchar(45) DEFAULT NULL,
  `pac_fecha_nacimiento` date DEFAULT NULL,
  `pac_telefono` varchar(12) DEFAULT NULL,
  `estatus` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id_paciente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pacientes`
--

LOCK TABLES `pacientes` WRITE;
/*!40000 ALTER TABLE `pacientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `pacientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publicaciones`
--

DROP TABLE IF EXISTS `publicaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publicaciones` (
  `id_publicacion` int(11) NOT NULL,
  `pub_titulo` varchar(45) DEFAULT NULL,
  `pub_contenido` longtext,
  `pub_fecha` date DEFAULT NULL,
  `pub_imagen` longblob,
  `id_usuario` int(11) DEFAULT NULL,
  `estatus` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id_publicacion`),
  KEY `id_usuario_idx` (`id_usuario`),
  CONSTRAINT `id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publicaciones`
--

LOCK TABLES `publicaciones` WRITE;
/*!40000 ALTER TABLE `publicaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `publicaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiposusuario`
--

DROP TABLE IF EXISTS `tiposusuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tiposusuario` (
  `id_tipousuario` int(11) NOT NULL,
  `tipousuario` varchar(15) DEFAULT NULL,
  `estatus` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id_tipousuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiposusuario`
--

LOCK TABLES `tiposusuario` WRITE;
/*!40000 ALTER TABLE `tiposusuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tiposusuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `usu_apaterno` varchar(45) DEFAULT NULL,
  `usu_amaterno` varchar(45) DEFAULT NULL,
  `usu_nombre` varchar(45) DEFAULT NULL,
  `usu_telefono` varchar(12) DEFAULT NULL,
  `id_tipousuario` int(11) DEFAULT NULL,
  `estatus` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `id_tipousuario_idx` (`id_tipousuario`),
  CONSTRAINT `id_tipousuario` FOREIGN KEY (`id_tipousuario`) REFERENCES `tiposusuario` (`id_tipousuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-23 17:06:24
