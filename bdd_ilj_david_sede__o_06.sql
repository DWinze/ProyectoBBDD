-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 29-04-2019 a las 11:56:10
-- Versión del servidor: 5.7.24
-- Versión de PHP: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdd_ilj_david_sedeño_06`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

DROP TABLE IF EXISTS `alumnos`;
CREATE TABLE IF NOT EXISTS `alumnos` (
  `DNI_ALUMNO` char(9) NOT NULL,
  `NOMBRE_ALUMNO` varchar(20) NOT NULL,
  `APELLIDO1_ALUMNO` varchar(20) NOT NULL,
  `APELLIDO2_ALUMNO` varchar(20) DEFAULT NULL,
  `FECHA_NACIMIENTO_ALUMNO` date NOT NULL,
  PRIMARY KEY (`DNI_ALUMNO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`DNI_ALUMNO`, `NOMBRE_ALUMNO`, `APELLIDO1_ALUMNO`, `APELLIDO2_ALUMNO`, `FECHA_NACIMIENTO_ALUMNO`) VALUES
('12341234A', 'JESUS', 'ARANDA', 'BADORREY', '1997-11-16'),
('12345678A', 'DAVID', 'SEDEÑO', 'GARCIA', '1997-07-20'),
('48291723Y', 'KARIM', 'AlKHAMLICHI', 'AYDA', '1997-01-17'),
('54627481G', 'FRANCISCO', 'CABADAS', 'GARCIA', '1995-04-18'),
('84372891L', 'DANIEL', 'MANSO', 'CANTALAPIEDRA', '1997-02-17'),
('92348149O', 'AITOR', 'CARRILLO', 'JUAN', '1996-09-18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `centros`
--

DROP TABLE IF EXISTS `centros`;
CREATE TABLE IF NOT EXISTS `centros` (
  `NOMBRE_CENTRO` varchar(50) NOT NULL,
  `CP` char(5) NOT NULL,
  PRIMARY KEY (`NOMBRE_CENTRO`,`CP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `centros`
--

INSERT INTO `centros` (`NOMBRE_CENTRO`, `CP`) VALUES
('C.E.I.P EUROPA   ', '28914'),
('C.P EL PRADO (PINTO)', '28320'),
('C.P SAN SEBASTIAN', '28904'),
('CP SANTA MARGARITA MARIA DE ALACOQUE (GETAFE)', '28903'),
('I.E.S CALDERÓN DE LA BARCA   ', '28912'),
('I.E.S JUAN DE LA CIERVA', '28045'),
('I.E.S LAGUNA DE JOATZEL', '28903'),
('I.E.S LAZARILLO DE TORMES', '45001'),
('I.E.S MANUEL AZAÑA', '28903'),
('I.E.S MENÉNDEZ PELAYO', '28903'),
('I.E.S. VICENTE ALEXAINDRE', '28320'),
('LICEO SAN PABLO', '28913');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

DROP TABLE IF EXISTS `curso`;
CREATE TABLE IF NOT EXISTS `curso` (
  `NOMBRE_CURSO` varchar(20) NOT NULL,
  `FECHA_CURSO` date NOT NULL,
  `FECHA_CURSO_FIN` date NOT NULL,
  PRIMARY KEY (`NOMBRE_CURSO`,`FECHA_CURSO`,`FECHA_CURSO_FIN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matricula`
--

DROP TABLE IF EXISTS `matricula`;
CREATE TABLE IF NOT EXISTS `matricula` (
  `NOMBRE_TITULO` varchar(20) NOT NULL,
  `DNI_ALUMNO` char(9) NOT NULL,
  `TITULADO` tinyint(1) NOT NULL,
  PRIMARY KEY (`NOMBRE_TITULO`,`DNI_ALUMNO`),
  KEY `DNI_ALUMNO` (`DNI_ALUMNO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulo`
--

DROP TABLE IF EXISTS `modulo`;
CREATE TABLE IF NOT EXISTS `modulo` (
  `ASIGNATURA1` varchar(20) NOT NULL,
  `ASIGNATURA2` varchar(20) NOT NULL,
  `ASIGNATURA3` varchar(20) NOT NULL,
  PRIMARY KEY (`ASIGNATURA1`,`ASIGNATURA2`,`ASIGNATURA3`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nota_alumno`
--

DROP TABLE IF EXISTS `nota_alumno`;
CREATE TABLE IF NOT EXISTS `nota_alumno` (
  `DNI_ALUMNO` char(9) NOT NULL,
  `ASIGNATURA1` varchar(20) NOT NULL,
  `ASIGNATURA2` varchar(20) NOT NULL,
  `ASIGNATURA3` varchar(20) NOT NULL,
  `NOTA1` int(11) NOT NULL,
  `NOTA2` int(11) NOT NULL,
  `NOTA3` int(11) NOT NULL,
  PRIMARY KEY (`DNI_ALUMNO`,`ASIGNATURA1`,`ASIGNATURA2`,`ASIGNATURA3`,`NOTA1`,`NOTA2`,`NOTA3`),
  KEY `ASIGNATURA1` (`ASIGNATURA1`,`ASIGNATURA2`,`ASIGNATURA3`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `titulos`
--

DROP TABLE IF EXISTS `titulos`;
CREATE TABLE IF NOT EXISTS `titulos` (
  `NOMBRE_CURSO` varchar(20) NOT NULL,
  `COD_TITULO` char(20) NOT NULL,
  `NOMBRE_TITULO` varchar(20) NOT NULL,
  `NOMBRE_CENTRO` varchar(50) NOT NULL,
  `CP` char(5) NOT NULL,
  `FECHA_CURSO` date NOT NULL,
  `FECHA_CURSO_FIN` date NOT NULL,
  `DNI_ALUMNO` char(9) NOT NULL,
  `ASIGNATURA1` varchar(20) NOT NULL,
  `NOTA1` int(11) NOT NULL,
  `ASIGNATURA2` varchar(20) NOT NULL,
  `NOTA2` int(11) NOT NULL,
  `ASIGNATURA3` varchar(20) NOT NULL,
  `NOTA3` int(11) NOT NULL,
  PRIMARY KEY (`NOMBRE_TITULO`),
  KEY `NOMBRE_CENTRO` (`NOMBRE_CENTRO`,`CP`),
  KEY `NOMBRE_CURSO` (`NOMBRE_CURSO`,`FECHA_CURSO`,`FECHA_CURSO_FIN`),
  KEY `DNI_ALUMNO` (`DNI_ALUMNO`,`ASIGNATURA1`,`ASIGNATURA2`,`ASIGNATURA3`,`NOTA1`,`NOTA2`,`NOTA3`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `matricula`
--
ALTER TABLE `matricula`
  ADD CONSTRAINT `matricula_ibfk_1` FOREIGN KEY (`DNI_ALUMNO`) REFERENCES `alumnos` (`DNI_ALUMNO`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `matricula_ibfk_2` FOREIGN KEY (`NOMBRE_TITULO`) REFERENCES `titulos` (`NOMBRE_TITULO`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `nota_alumno`
--
ALTER TABLE `nota_alumno`
  ADD CONSTRAINT `nota_alumno_ibfk_1` FOREIGN KEY (`DNI_ALUMNO`) REFERENCES `alumnos` (`DNI_ALUMNO`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nota_alumno_ibfk_2` FOREIGN KEY (`ASIGNATURA1`,`ASIGNATURA2`,`ASIGNATURA3`) REFERENCES `modulo` (`ASIGNATURA1`, `ASIGNATURA2`, `ASIGNATURA3`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `titulos`
--
ALTER TABLE `titulos`
  ADD CONSTRAINT `titulos_ibfk_1` FOREIGN KEY (`NOMBRE_CENTRO`,`CP`) REFERENCES `centros` (`NOMBRE_CENTRO`, `CP`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `titulos_ibfk_2` FOREIGN KEY (`NOMBRE_CURSO`,`FECHA_CURSO`,`FECHA_CURSO_FIN`) REFERENCES `curso` (`NOMBRE_CURSO`, `FECHA_CURSO`, `FECHA_CURSO_FIN`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `titulos_ibfk_3` FOREIGN KEY (`DNI_ALUMNO`,`ASIGNATURA1`,`ASIGNATURA2`,`ASIGNATURA3`,`NOTA1`,`NOTA2`,`NOTA3`) REFERENCES `nota_alumno` (`DNI_ALUMNO`, `ASIGNATURA1`, `ASIGNATURA2`, `ASIGNATURA3`, `NOTA1`, `NOTA2`, `NOTA3`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
