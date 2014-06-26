-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 26-06-2014 a las 13:57:33
-- Versión del servidor: 5.6.12-log
-- Versión de PHP: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `intercambiosdb`
--
CREATE DATABASE IF NOT EXISTS `intercambiosdb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `intercambiosdb`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `homologacion`
--

CREATE TABLE IF NOT EXISTS `homologacion` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `materiaLocal` varchar(50) NOT NULL,
  `materiaExtrangero` varchar(50) NOT NULL,
  `numActa` int(11) NOT NULL,
  `fechaActa` date NOT NULL,
  `revision` varchar(20) NOT NULL,
  `intercambio` int(11) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `intercambio` (`intercambio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `institucion`
--

CREATE TABLE IF NOT EXISTS `institucion` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `pais` varchar(40) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Volcado de datos para la tabla `institucion`
--

INSERT INTO `institucion` (`codigo`, `nombre`, `pais`) VALUES
(17, 'Politecnico de Turin', 'Italia'),
(18, 'Politecnico Jaime isaza', 'Colombia'),
(19, 'Autonoma de Mexico', 'Mexico'),
(20, 'Universidad Palermo', 'Venezuela');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `intercambio`
--

CREATE TABLE IF NOT EXISTS `intercambio` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `instOrigen` int(11) NOT NULL,
  `instDestino` int(11) NOT NULL,
  `SemestreInicio` int(11) NOT NULL,
  `SemestreFin` int(11) NOT NULL,
  `estudiante` varchar(20) NOT NULL,
  `tipoIntercambio` int(11) NOT NULL,
  `fechaIda` date NOT NULL,
  `fechaRetorno` date NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `instOrigen` (`instOrigen`),
  KEY `instDestino` (`instDestino`),
  KEY `estudiante` (`estudiante`),
  KEY `tipoIntercambio` (`tipoIntercambio`),
  KEY `SemestreInicio` (`SemestreInicio`),
  KEY `SemestreFin` (`SemestreFin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `usuario` varchar(30) NOT NULL,
  `contrasena` varchar(20) NOT NULL,
  `permisos` int(11) NOT NULL,
  PRIMARY KEY (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `login`
--

INSERT INTO `login` (`usuario`, `contrasena`, `permisos`) VALUES
('estudiante1', 'estudiante1', 3),
('profesor1', 'profesor1', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

CREATE TABLE IF NOT EXISTS `notas` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `archivo` blob NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `intercambio` int(11) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `intercambio` (`intercambio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE IF NOT EXISTS `persona` (
  `cedula` varchar(20) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `programa` varchar(40) DEFAULT NULL,
  `email` varchar(30) NOT NULL,
  `usuario` varchar(30) NOT NULL,
  `tipoUsuario` int(11) NOT NULL,
  PRIMARY KEY (`cedula`),
  KEY `programa` (`programa`),
  KEY `usuario` (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`cedula`, `nombre`, `programa`, `email`, `usuario`, `tipoUsuario`) VALUES
('1040', 'daniel', '504', 'danistiven19@hotmail.com', 'estudiante1', 3),
('1478', 'profesor1', NULL, 'profesor1@gmail.com', 'profesor1', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programa`
--

CREATE TABLE IF NOT EXISTS `programa` (
  `codigo` varchar(15) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `director` varchar(20) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `director` (`director`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `programa`
--

INSERT INTO `programa` (`codigo`, `nombre`, `director`) VALUES
('504', 'SISTEMAS', '1478');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `semestre`
--

CREATE TABLE IF NOT EXISTS `semestre` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `año` int(11) NOT NULL,
  `periodo` int(11) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipointercambio`
--

CREATE TABLE IF NOT EXISTS `tipointercambio` (
  `nombreTipo` varchar(20) NOT NULL,
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `homologacion`
--
ALTER TABLE `homologacion`
  ADD CONSTRAINT `homologacion_ibfk_1` FOREIGN KEY (`intercambio`) REFERENCES `intercambio` (`codigo`);

--
-- Filtros para la tabla `intercambio`
--
ALTER TABLE `intercambio`
  ADD CONSTRAINT `intercambio_ibfk_1` FOREIGN KEY (`instOrigen`) REFERENCES `institucion` (`codigo`),
  ADD CONSTRAINT `intercambio_ibfk_2` FOREIGN KEY (`instDestino`) REFERENCES `institucion` (`codigo`),
  ADD CONSTRAINT `intercambio_ibfk_3` FOREIGN KEY (`estudiante`) REFERENCES `persona` (`cedula`),
  ADD CONSTRAINT `intercambio_ibfk_4` FOREIGN KEY (`tipoIntercambio`) REFERENCES `tipointercambio` (`codigo`),
  ADD CONSTRAINT `intercambio_ibfk_5` FOREIGN KEY (`SemestreInicio`) REFERENCES `semestre` (`codigo`),
  ADD CONSTRAINT `intercambio_ibfk_6` FOREIGN KEY (`SemestreFin`) REFERENCES `semestre` (`codigo`);

--
-- Filtros para la tabla `notas`
--
ALTER TABLE `notas`
  ADD CONSTRAINT `notas_ibfk_1` FOREIGN KEY (`intercambio`) REFERENCES `intercambio` (`codigo`);

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `persona_ibfk_1` FOREIGN KEY (`programa`) REFERENCES `programa` (`codigo`),
  ADD CONSTRAINT `persona_ibfk_2` FOREIGN KEY (`usuario`) REFERENCES `login` (`usuario`);

--
-- Filtros para la tabla `programa`
--
ALTER TABLE `programa`
  ADD CONSTRAINT `programa_ibfk_1` FOREIGN KEY (`director`) REFERENCES `persona` (`cedula`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
