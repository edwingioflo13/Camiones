-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-11-2018 a las 20:41:44
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
(1, 'Lafavorita', '0983513314', 'NacionesUnidas'),
(2, 'Comandato', '0996393405', 'NacionesUnidasyAmazonas'),
(3, 'Riviera', '0996399025', 'Duran'),
(4, 'Deprati', '023654987', 'Carcelen'),
(5, 'Maraton', '3660757', 'OrellanayAlmagro'),
(6, 'JuanEljuri', '032478596', 'CarapungoyQuitus'),
(7, 'Apple', '024785212', 'Cumbaya');

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
('1', '1512367849', 1, 1, 'ACTIVO'),
('MBC2343', '0245968745', 800, 500, 'ACTIVO'),
('PBN6013', '1900481357', 800, 500, 'ACTIVO'),
('PBX4703', '1512367849', 800, 500, 'ACTIVO'),
('PCF9056', '1720235060', 900, 500, 'INACTIVO'),
('PEC2356', '1875426566', 1200, 600, 'INACTIVO'),
('PYI0889', '1900481357', 1000, 1000, 'ACTIVO'),
('TBC1223', '1717258964', 1000, 600, 'ACTIVO'),
('TDJ4569', '0245968745', 700, 450, 'ACTIVO'),
('TUC6969', '1715882328', 700, 300, 'ACTIVO'),
('TYU7457', '0245968745', 700, 300, 'ACTIVO');

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
('0245968745', 'Javier', 'Cordova', 'Sangolqui', 'D', 1100),
('1512367849', 'Jhony', 'Rivera', 'Panecillo', 'B', 850),
('1712458956', 'Karla', 'Tejada', 'CarcelenAlto', 'A', 500),
('1715882328', 'Diego', 'Acosta', 'CiudadelaEjercito', 'B', 1000),
('1717258964', 'Juan', 'Suarez', 'TumbacoySingapur', 'D', 920),
('1720209376', 'Maria', 'Alban', 'Quitumbe', 'C', 800),
('1720235060', 'Marianela', 'Cordova', 'Guamani', 'A', 500),
('1793324574', 'Tania', 'Reyes', 'MachalayCuenca', 'B', 700),
('1875426566', 'Jesica', 'Benitez', 'SanCarlos', 'E', 1100),
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
(1, 1, 2, 163, 20, 20, '2018-11-15', '2018-11-15'),
(2, 1, 2, 163, 20, 20, '2018-11-15', NULL),
(3, 1, 2, 163, 150, 40, '2018-11-15', NULL),
(4, 1, 1, NULL, 300, 500, '2018-11-15', NULL),
(5, 1, 2, 163, 200, 500, '2018-11-15', NULL),
(6, 4, 5, NULL, 400, 800, '2018-11-15', NULL),
(7, 2, 6, NULL, 600, 1200, '2018-11-15', NULL),
(8, 5, 5, NULL, 450, 900, '2018-11-15', NULL),
(9, 6, 3, NULL, 400, 800, '2018-11-15', NULL),
(10, 4, 4, NULL, 500, 1000, '2018-11-15', NULL);

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
(1, 'Tia', '023789654', 'Cumbaya'),
(2, 'AKI', '022615478', 'EL EJIDO'),
(3, 'AbarrotesPepito', '022587456', 'Quitumbe'),
(4, 'SanMarcos', '036985471', 'Elrecreo'),
(5, 'DeportivosAlejandra', '023654781', 'LaEsperanza'),
(6, 'Magda', '02254565', 'SangolquiCentro'),
(7, 'SantaMaria', '0998875147', 'Chillogallo'),
(8, 'TelevisionesCarlitos', '032145624', 'Latacunga'),
(9, 'Hogar', '035685421', 'Villaflora'),
(10, 'RopaDeportivaMaria', '0985625452', 'LaEsperanza');

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
  `RUTA_VIAJE` varchar(20) DEFAULT NULL,
  `PLACA_VIAJE` varchar(10) NOT NULL,
  `ALMACEN_VIAJE` varchar(50) NOT NULL,
  `TIENDA_VIAJE` varchar(50) NOT NULL,
  `PESO_VIAJE` float NOT NULL,
  `VOLUMEN_VIAJE` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `viaje`
--

INSERT INTO `viaje` (`ID_VIAJE`, `MATRICULA_CAMION`, `RUTA_VIAJE`, `PLACA_VIAJE`, `ALMACEN_VIAJE`, `TIENDA_VIAJE`, `PESO_VIAJE`, `VOLUMEN_VIAJE`) VALUES
(163, 'MBC2343', '1-2', 'MBC2343', 'Lafavorita', 'AKI', 390, 580);

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
  MODIFY `ID_PEDIDO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
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
