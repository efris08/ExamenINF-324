-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-10-2021 a las 13:31:56
-- Versión del servidor: 10.1.32-MariaDB
-- Versión de PHP: 5.6.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_callisaya`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_notas_doc` ()  BEGIN
    SELECT AVG(CASE WHEN D.codigo='01' THEN nota_final ELSE 0 END ) CHUQUISACA,
    AVG(CASE WHEN D.codigo='02' THEN nota_final END ) 'LA PAZ',
    AVG(CASE WHEN D.codigo='03' THEN nota_final ELSE 0 END ) COCHABAMBA,
    AVG(CASE WHEN D.codigo='04' THEN nota_final ELSE 0 END ) ORURO,
    AVG(CASE WHEN D.codigo='05' THEN nota_final ELSE 0 END ) POTOSÍ,
    AVG(CASE WHEN D.codigo='06' THEN nota_final ELSE 0 END ) TARIJA,
    AVG(CASE WHEN D.codigo='07' THEN nota_final ELSE 0 END ) 'SANTA CRUZ',
    AVG(CASE WHEN D.codigo='08' THEN nota_final ELSE 0 END ) BENI,
    AVG(CASE WHEN D.codigo='09' THEN nota_final ELSE 0 END ) PANDO 
    FROM notas N INNER JOIN persona P ON N.ci= P.ci INNER JOIN departamento D ON D.codigo=P.dpto;
   END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_notas_est` (IN `_usuario` VARCHAR(20))  BEGIN
SELECT N.sigla AS 'SIGLA', M.descripcion AS 'MATERIA', N.nota1 AS 'NOTA 1',N.nota2 AS 'NOTA 2',N.nota_final AS 'NOTA FINAL' FROM NOTAS N inner join usuarios U ON N.ci=U.ci inner join persona P ON N.ci=P.ci 
    INNER JOIN materia M ON M.sigla = N.sigla
    WHERE usuario=_usuario;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `id` int(11) DEFAULT NULL,
  `sigla` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `codigo` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`id`, `sigla`, `descripcion`, `codigo`) VALUES
(1, 'CH', 'Chuquisaca', '01'),
(2, 'LP', 'La Paz', '02'),
(3, 'CB', 'Cochabamba', '03'),
(4, 'OR', 'Oruro', '04'),
(5, 'PT', 'Potosí', '05'),
(6, 'TJ', 'Tarija', '06'),
(7, 'SC', 'Santa Cruz', '07'),
(8, 'BE', 'Beni', '08'),
(9, 'PD', 'Pando', '09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia`
--

CREATE TABLE `materia` (
  `Id` int(11) NOT NULL,
  `sigla` varchar(20) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `materia`
--

INSERT INTO `materia` (`Id`, `sigla`, `descripcion`) VALUES
(1, 'INF-324', 'PROGRAMACIÓN I'),
(2, 'INF-354', 'PROGRAMACIÓN II'),
(3, 'INF-365', 'PROGRAMACIÓN III');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

CREATE TABLE `notas` (
  `id` int(11) NOT NULL,
  `ci` int(2) DEFAULT NULL,
  `sigla` varchar(20) DEFAULT NULL,
  `nota1` decimal(10,2) DEFAULT NULL,
  `nota2` decimal(10,2) DEFAULT NULL,
  `nota3` decimal(10,2) DEFAULT NULL,
  `nota_final` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `notas`
--

INSERT INTO `notas` (`id`, `ci`, `sigla`, `nota1`, `nota2`, `nota3`, `nota_final`) VALUES
(4, 111, 'INF-324', '60.00', '50.00', '60.00', '55.00'),
(5, 111, 'INF-354', '70.00', '70.00', '70.00', '70.00'),
(6, 111, 'INF-365', '90.00', '80.00', '70.00', '80.00'),
(7, 123, 'INF-324', '90.00', '85.00', '90.00', '87.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `ci` int(2) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `fecha_nac` varchar(255) DEFAULT NULL,
  `dpto` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`ci`, `nombre`, `fecha_nac`, `dpto`) VALUES
(111, 'Jorge Campos', '15-50-1980', '09'),
(123, 'Efrain Callisaya', '15-05-1992', '02'),
(456, 'Pamela Ponce', '30-07-1995', '03'),
(555, 'Esteban Cambiasso', '14-06-2000', '09'),
(666, 'Gabriel Batistuta', '15-08-1985', '08'),
(789, 'Karim Benzema', '15-06-1995', '02'),
(877, 'MIchael Owen', '16-06-2005', '09'),
(888, 'Elton Jhon', '30-01-1998', '05'),
(999, 'Oscar Ruggeri', '14-09-1998', '05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `descripcion`) VALUES
(1, 'estudiante'),
(2, 'docente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `ci` int(2) NOT NULL DEFAULT '0',
  `usuario` varchar(20) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `id_rol` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `ci`, `usuario`, `password`, `id_rol`) VALUES
(6, 111, 'e111', 'e111', 1),
(7, 123, 'e123', 'e123', 1),
(8, 456, 'e456', 'e456', 1),
(9, 555, 'd555', 'd555', 2),
(10, 666, 'd666', 'd666', 2),
(11, 789, 'd789', 'd789', 2),
(12, 877, 'd877', 'd877', 2),
(13, 888, 'e888', 'e888', 1),
(14, 999, 'e999', 'e999', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `materia`
--
ALTER TABLE `materia`
  ADD PRIMARY KEY (`sigla`);

--
-- Indices de la tabla `notas`
--
ALTER TABLE `notas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_notas` (`ci`),
  ADD KEY `fk_materia` (`sigla`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`ci`),
  ADD KEY `dpto` (`dpto`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_roles` (`id_rol`),
  ADD KEY `fk_ci` (`ci`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `notas`
--
ALTER TABLE `notas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `notas`
--
ALTER TABLE `notas`
  ADD CONSTRAINT `fk_materia` FOREIGN KEY (`sigla`) REFERENCES `materia` (`sigla`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_notas` FOREIGN KEY (`ci`) REFERENCES `persona` (`ci`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `persona_ibfk_1` FOREIGN KEY (`dpto`) REFERENCES `departamento` (`codigo`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_ci` FOREIGN KEY (`ci`) REFERENCES `persona` (`ci`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_roles` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
