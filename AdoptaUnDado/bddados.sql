-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 07-02-2023 a las 08:43:36
-- Versión del servidor: 5.7.36
-- Versión de PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bddados`
--

DROP TABLE IF EXISTS `lineapedido`;
DROP TABLE IF EXISTS `compra`;
DROP TABLE IF EXISTS `articulo`;
DROP TABLE IF EXISTS `categoria`;
DROP TABLE IF EXISTS `usuario`;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulo`
--

CREATE TABLE IF NOT EXISTS `articulo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `idCategoria` int(11) NOT NULL,
  `precio` double NOT NULL,
  `imagen` varchar(80),
  `stock` int(11) NOT NULL COMMENT 'cantidad disponible',
  PRIMARY KEY (`id`),
  KEY `fk_articulo_categoria` (`idCategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `articulo`
--

INSERT INTO `articulo` (`nombre`,`idCategoria`,`precio`,`imagen`,`stock`) VALUES 
('Antonia','2','10','img/dado_d-6.jpg','22'),
('Manolo','1','12','img/dado_d4_20x20x20_mm.webp','12'),
('Nicolasio','3','15','img/dado_d-8.jpg','22'),
('Eustaquio','5','22','img/dado_d12_20x20x20_mm.webp','3'),
('Tutifruti','7','22','img/pack6.jpg','23'),
('Los luceros','8','22','img/dados-d6-14-mm-brillan-en-oscuridad.jpg','23'),
('Los Joses','7','31','img/pack-7.jpg','16'),
('Las Marias','10','10','img/pack-42-dados-D4-D6-D8-D10-D12-D20.webp','9');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE IF NOT EXISTS `categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`nombre`) VALUES 
('d-4'),
('d-6'),
('d-8'),
('d-10'),
('d-12'),
('d-20'),
('pack(4-10)'),
('pack(10-20)'),
('pack(20-40)'),
('pack(+40)'),
('objetos');


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE IF NOT EXISTS `compra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total` double NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lineapedido`
--

CREATE TABLE IF NOT EXISTS `lineapedido` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dniUsuario` varchar(9) COLLATE utf8_spanish_ci NOT NULL,
  `idArticulo` int(11) NOT NULL,
  `precio` double NOT NULL,
  `cantidad` int(11) NOT NULL,
  `idCompra` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dniUsuario` (`dniUsuario`),
  KEY `idArticulo` (`idArticulo`),
  KEY `idCompra` (`idCompra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `dni` varchar(9) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `apellido` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(70) COLLATE utf8_spanish_ci NOT NULL UNIQUE,
  `password` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `municipio` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `provincia` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `pais` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `codigopostal` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `imagen` varchar(80),
  `rol` int(1) NOT NULL COMMENT '0:admin 1:usuario',
  `verificado` int(1) DEFAULT NULL COMMENT '0:=no verificado, 1:= verificado',
  PRIMARY KEY (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`dni`, `nombre`, `apellido`, `email`, `password`, `descripcion`, `direccion`, `municipio`, `provincia`, `pais`, `codigopostal`, `telefono`, `imagen`, `rol`, `verificado`) VALUES
('0', 'asd', 'diosito', 'admin@asd.com', 'asd', 'Mafioso de los dados. Buenos dias', 'el pozo', 'desgraciado', 'Bello', 'olimpo', '66666', '000000000', '', 0, 1),
('1', 'admin', 'armin', 'admin@admin.com', 'admin', 'Criador de Dados', 'mihogarcito', 'muro maria', 'paradis', 'eldia', '00000', '000000000', '', 0, 1),
('71350477S', 'furra', 'encubierta', 'patri@furra.com', 'dw2', 'Patri no lo admite', 'avenida los furros', 'furricity', 'Madrid', 'furriland', '00000', '000000000', '', 1, 1),
('61690444A', 'ander', 'bat', 'ander@furro.com', 'dw2', 'amante de los dados', 'avenida los furros', 'furricity', 'Madrid', 'furriland', '00000', '000000000', '', 1, 0);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `articulo`
--
ALTER TABLE `articulo`
  ADD CONSTRAINT `fk_articulo_categoria` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`id`);

--
-- Filtros para la tabla `lineapedido`
--
ALTER TABLE `lineapedido`
  ADD CONSTRAINT `lineapedido_ibfk_1` FOREIGN KEY (`dniUsuario`) REFERENCES `usuario` (`dni`),
  ADD CONSTRAINT `lineapedido_ibfk_2` FOREIGN KEY (`idArticulo`) REFERENCES `articulo` (`id`),
  ADD CONSTRAINT `lineapedido_ibfk_3` FOREIGN KEY (`idCompra`) REFERENCES `compra` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
