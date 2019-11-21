-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 21-11-2019 a las 03:28:53
-- Versión del servidor: 5.7.26
-- Versión de PHP: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hospiten`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habitaciones`
--

DROP TABLE IF EXISTS `habitaciones`;
CREATE TABLE IF NOT EXISTS `habitaciones` (
  `id_habitacion` int(11) NOT NULL AUTO_INCREMENT,
  `hab_nombre` varchar(45) DEFAULT NULL,
  `hab_estado` varchar(12) DEFAULT NULL,
  `hab_fecha_ocupacion` date DEFAULT NULL,
  `estatus` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id_habitacion`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `habitaciones`
--

INSERT INTO `habitaciones` (`id_habitacion`, `hab_nombre`, `hab_estado`, `hab_fecha_ocupacion`, `estatus`) VALUES
(1, 'UCI', 'Disponible', NULL, 'A'),
(2, 'URGENCIAS', 'Disponible', NULL, 'A'),
(3, 'HABITACION 1', 'Ocupado', '2019-09-21', 'A'),
(4, 'QUIROFANO 1', 'Disponible', NULL, 'A'),
(5, 'QUIROFANO 2', 'Disponible', NULL, 'A'),
(6, 'HABITACION 2', 'Ocupado', '2019-09-25', 'A'),
(7, 'HABITACION 3', 'Disponible', NULL, 'A'),
(8, 'QUIROFANO 3', 'Disponible', NULL, 'A'),
(9, 'QUIROFANO 4', 'Ocupado', '2019-09-25', 'A'),
(10, 'HABITACION 4', 'Ocupado', '2019-09-23', 'A'),
(11, 'HABITACION 5', 'Disponible', NULL, 'A'),
(12, 'HABITACION 6', 'Disponible', NULL, 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingresos`
--

DROP TABLE IF EXISTS `ingresos`;
CREATE TABLE IF NOT EXISTS `ingresos` (
  `id_ingreso` int(11) NOT NULL AUTO_INCREMENT,
  `ing_fecha` date DEFAULT NULL,
  `ing_diagnostico` longtext,
  `ing_alta` bit(1) DEFAULT NULL,
  `id_paciente` int(11) DEFAULT NULL,
  `estatus` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id_ingreso`),
  KEY `id_paciente_idx` (`id_paciente`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ingresos`
--

INSERT INTO `ingresos` (`id_ingreso`, `ing_fecha`, `ing_diagnostico`, `ing_alta`, `id_paciente`, `estatus`) VALUES
(1, '2019-09-15', 'PRUEBA 1', b'0', 1, 'A'),
(2, '2019-09-21', 'PRUEBA 2', b'0', 3, 'A'),
(3, '2019-09-17', 'PRUEBA 3', b'1', 5, 'A'),
(4, '2019-09-23', 'PRUEBA 4', b'1', 9, 'A'),
(5, '2019-09-20', 'PRUEBA 5', b'0', 7, 'A'),
(6, '2019-09-03', 'PRUEBA 6', b'0', 6, 'A'),
(7, '2019-08-11', 'PRUEBA 7', b'0', 5, 'A'),
(8, '2019-09-07', 'PRUEBA 8', b'1', 7, 'A'),
(9, '2019-07-08', 'PRUEBA 9', b'0', 5, 'A'),
(10, '2019-09-08', 'PRUEBA 10', b'0', 3, 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

DROP TABLE IF EXISTS `pacientes`;
CREATE TABLE IF NOT EXISTS `pacientes` (
  `id_paciente` int(11) NOT NULL AUTO_INCREMENT,
  `pac_apaterno` varchar(45) DEFAULT NULL,
  `pac_amaterno` varchar(45) DEFAULT NULL,
  `pac_nombre` varchar(45) DEFAULT NULL,
  `pac_fecha_nacimiento` date DEFAULT NULL,
  `pac_telefono` varchar(12) DEFAULT NULL,
  `estatus` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id_paciente`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`id_paciente`, `pac_apaterno`, `pac_amaterno`, `pac_nombre`, `pac_fecha_nacimiento`, `pac_telefono`, `estatus`) VALUES
(1, 'Garcia', 'Garcia', 'Fernando', '1996-07-28', '6241787829', 'A'),
(2, 'Garcia', 'Mejia', 'Jose Luis', '1985-03-15', '5517532168', 'A'),
(3, 'Martinez', 'Perez', 'Edgar', '2000-01-29', '6852314596', 'A'),
(4, 'Guzman', 'Loera', 'Joaquin', '1970-03-21', '8763210296', 'A'),
(5, 'Lopez', 'Alvarez', 'Jose Manuel', '1985-03-15', '6852314596', 'A'),
(6, 'Monterrubio', 'Vazques', 'Mario', '1980-06-29', '5412369741', 'A'),
(7, 'Montes', 'Garcia', 'Juan', '1986-02-14', '6325632369', 'A'),
(8, 'Perez', 'Alvarez', 'Perla', '1992-04-21', '7852369512', 'A'),
(9, 'Garcia', 'Perez', 'Daniela', '1999-08-07', '6213652986', 'A'),
(10, 'Zambada', 'Guzman', 'Ismael', '1975-05-20', '6662587349', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publicaciones`
--

DROP TABLE IF EXISTS `publicaciones`;
CREATE TABLE IF NOT EXISTS `publicaciones` (
  `id_publicacion` int(11) NOT NULL AUTO_INCREMENT,
  `pub_titulo` varchar(45) DEFAULT NULL,
  `pub_contenido` longtext,
  `pub_fecha` date DEFAULT NULL,
  `pub_imagen` longblob,
  `id_usuario` int(11) DEFAULT NULL,
  `estatus` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id_publicacion`),
  KEY `id_usuario_idx` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposusuario`
--

DROP TABLE IF EXISTS `tiposusuario`;
CREATE TABLE IF NOT EXISTS `tiposusuario` (
  `id_tipousuario` int(11) NOT NULL AUTO_INCREMENT,
  `tipousuario` varchar(15) DEFAULT NULL,
  `estatus` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id_tipousuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiposusuario`
--

INSERT INTO `tiposusuario` (`id_tipousuario`, `tipousuario`, `estatus`) VALUES
(1, 'ADMINISTRADOR', 'A'),
(2, 'ESTANDAR', 'A'),
(3, 'BASICO', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `usu_usuario` varchar(100) DEFAULT NULL,
  `usu_contrasena` varchar(100) DEFAULT NULL,
  `usu_apaterno` varchar(45) DEFAULT NULL,
  `usu_amaterno` varchar(45) DEFAULT NULL,
  `usu_nombre` varchar(45) DEFAULT NULL,
  `usu_telefono` varchar(12) DEFAULT NULL,
  `id_tipousuario` int(11) DEFAULT NULL,
  `estatus` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `id_tipousuario_idx` (`id_tipousuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `usu_usuario`, `usu_contrasena`, `usu_apaterno`, `usu_amaterno`, `usu_nombre`, `usu_telefono`, `id_tipousuario`, `estatus`) VALUES
(1, '1', 'c4ca4238a0b923820dcc509a6f75849b', 'GARCIA', 'GARCIA', 'LUIS FERNANDO', '6241787829', 1, 'A');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ingresos`
--
ALTER TABLE `ingresos`
  ADD CONSTRAINT `id_paciente` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `publicaciones`
--
ALTER TABLE `publicaciones`
  ADD CONSTRAINT `id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `id_tipousuario` FOREIGN KEY (`id_tipousuario`) REFERENCES `tiposusuario` (`id_tipousuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
