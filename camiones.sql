-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-11-2018 a las 06:32:21
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `camiones`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almacen`
--

CREATE TABLE `almacen` (
  `ID_ALMACEN` int(11) NOT NULL,
  `NOMBRE_ALMACEN` varchar(20) DEFAULT NULL,
  `TELEFONO_ALMACEN` varchar(10) DEFAULT NULL,
  `DIRECCION_ALMACEN` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `almacen`
--

INSERT INTO `almacen` (`ID_ALMACEN`, `NOMBRE_ALMACEN`, `TELEFONO_ALMACEN`, `DIRECCION_ALMACEN`) VALUES
(1, 'SUPERMAXI', '022612733', 'LA RECOLETA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `camion`
--

CREATE TABLE `camion` (
  `MATRICULA_CAMION` varchar(10) NOT NULL,
  `CEDULA_CHOFER` varchar(10) NOT NULL,
  `VOLUMEN_CAMION` float DEFAULT NULL,
  `PESO_CAMION` float DEFAULT NULL,
  `ESTADO_CAMION` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `camion`
--

INSERT INTO `camion` (`MATRICULA_CAMION`, `CEDULA_CHOFER`, `VOLUMEN_CAMION`, `PESO_CAMION`, `ESTADO_CAMION`) VALUES
('PYI0889', '1900481357', 1000, 1000, 'ACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `chofer`
--

CREATE TABLE `chofer` (
  `CEDULA_CHOFER` varchar(10) NOT NULL,
  `NOMBRE_CHOFER` varchar(20) DEFAULT NULL,
  `APELLIDO_CHOFER` varchar(20) DEFAULT NULL,
  `DIRECCION_CHOFER` varchar(20) DEFAULT NULL,
  `LICENCIA_CHOFER` varchar(10) DEFAULT NULL,
  `SUELDO_CHOFER` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `chofer`
--

INSERT INTO `chofer` (`CEDULA_CHOFER`, `NOMBRE_CHOFER`, `APELLIDO_CHOFER`, `DIRECCION_CHOFER`, `LICENCIA_CHOFER`, `SUELDO_CHOFER`) VALUES
('1900481357', 'Edwin', 'Flores', 'La Recoleta', 'D', 1200);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `ID_PEDIDO` int(11) NOT NULL,
  `ID_ALMACEN` int(11) NOT NULL,
  `ID_TIENDA` int(11) NOT NULL,
  `ID_VIAJE` int(11) DEFAULT NULL,
  `PESO_PEDIDO` float DEFAULT NULL,
  `VOLUMEN_PEDIDO` float DEFAULT NULL,
  `FECHAENVIO_PEDIDO` date DEFAULT NULL,
  `FECHAENTREGA_PEDIDO` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`ID_PEDIDO`, `ID_ALMACEN`, `ID_TIENDA`, `ID_VIAJE`, `PESO_PEDIDO`, `VOLUMEN_PEDIDO`, `FECHAENVIO_PEDIDO`, `FECHAENTREGA_PEDIDO`) VALUES
(1, 1, 2, NULL, 20, 20, '2018-11-15', NULL),
(2, 1, 2, NULL, 20, 20, '2018-11-15', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tienda`
--

CREATE TABLE `tienda` (
  `ID_TIENDA` int(11) NOT NULL,
  `NOMBRE_TIENDA` varchar(20) DEFAULT NULL,
  `TELEFONO_TIENDA` varchar(10) DEFAULT NULL,
  `DIRECCION_TIENDA` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tienda`
--

INSERT INTO `tienda` (`ID_TIENDA`, `NOMBRE_TIENDA`, `TELEFONO_TIENDA`, `DIRECCION_TIENDA`) VALUES
(2, 'AKI', '022615478', 'EL EJIDO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `ID_USUARIO` varchar(30) NOT NULL,
  `PASS_USUARIO` varchar(256) DEFAULT NULL,
  `NOMBRE_USUARIO` varchar(30) DEFAULT NULL,
  `APELLIDO_USUARIO` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `viaje`
--

CREATE TABLE `viaje` (
  `ID_VIAJE` int(11) NOT NULL,
  `MATRICULA_CAMION` varchar(10) NOT NULL,
  `RUTA_VIAJE` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `almacen`
--
ALTER TABLE `almacen`
  ADD PRIMARY KEY (`ID_ALMACEN`);

--
-- Indices de la tabla `camion`
--
ALTER TABLE `camion`
  ADD PRIMARY KEY (`MATRICULA_CAMION`),
  ADD KEY `FK_MANEJA` (`CEDULA_CHOFER`);

--
-- Indices de la tabla `chofer`
--
ALTER TABLE `chofer`
  ADD PRIMARY KEY (`CEDULA_CHOFER`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`ID_PEDIDO`),
  ADD KEY `FK_DESTINO` (`ID_TIENDA`),
  ADD KEY `FK_GESTIONA` (`ID_VIAJE`),
  ADD KEY `FK_ORIGEN` (`ID_ALMACEN`);

--
-- Indices de la tabla `tienda`
--
ALTER TABLE `tienda`
  ADD PRIMARY KEY (`ID_TIENDA`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID_USUARIO`);

--
-- Indices de la tabla `viaje`
--
ALTER TABLE `viaje`
  ADD PRIMARY KEY (`ID_VIAJE`),
  ADD KEY `FK_SOLICITA` (`MATRICULA_CAMION`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `ID_PEDIDO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `camion`
--
ALTER TABLE `camion`
  ADD CONSTRAINT `FK_MANEJA` FOREIGN KEY (`CEDULA_CHOFER`) REFERENCES `chofer` (`CEDULA_CHOFER`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `FK_DESTINO` FOREIGN KEY (`ID_TIENDA`) REFERENCES `tienda` (`ID_TIENDA`),
  ADD CONSTRAINT `FK_GESTIONA` FOREIGN KEY (`ID_VIAJE`) REFERENCES `viaje` (`ID_VIAJE`),
  ADD CONSTRAINT `FK_ORIGEN` FOREIGN KEY (`ID_ALMACEN`) REFERENCES `almacen` (`ID_ALMACEN`);

--
-- Filtros para la tabla `viaje`
--
ALTER TABLE `viaje`
  ADD CONSTRAINT `FK_SOLICITA` FOREIGN KEY (`MATRICULA_CAMION`) REFERENCES `camion` (`MATRICULA_CAMION`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
