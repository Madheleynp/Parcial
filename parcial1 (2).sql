-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 04-03-2022 a las 20:44:29
-- Versión del servidor: 8.0.17
-- Versión de PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `parcial1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignatura`
--

CREATE TABLE `asignatura` (
  `Código_Asignatura` int(11) NOT NULL,
  `Nombre_Asignatura` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `asignatura`
--

INSERT INTO `asignatura` (`Código_Asignatura`, `Nombre_Asignatura`) VALUES
(2, 'Inglés'),
(3, 'Matemática'),
(1, 'QUIMICA'),
(4, 'sociales');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

CREATE TABLE `estudiantes` (
  `Núm_matrícula` int(11) NOT NULL,
  `Nombre_Asignatura` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `FechaNacimiento` date NOT NULL,
  `Teléfono` int(11) NOT NULL,
  `Nombre_Estudiante` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `estudiantes`
--

INSERT INTO `estudiantes` (`Núm_matrícula`, `Nombre_Asignatura`, `FechaNacimiento`, `Teléfono`, `Nombre_Estudiante`) VALUES
(2, 'Inglés', '2003-10-02', 35884129, 'Valentina E'),
(3, 'Matemática', '2003-10-02', 325489755, 'Mayherlis P'),
(1, 'QUIMICA', '2003-10-02', 320458796, 'Madheleyn P'),
(4, 'sociales', '2003-10-02', 328974129, 'Madheleyn P');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesor`
--

CREATE TABLE `profesor` (
  `Núm_matrícula` int(11) NOT NULL,
  `Id_P` int(11) NOT NULL,
  `NIF_P` varchar(10) NOT NULL,
  `Código_Asignatura` int(11) NOT NULL,
  `Nombre_profe` varchar(50) NOT NULL,
  `Especialidad` varchar(225) NOT NULL,
  `Teléfono` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `profesor`
--

INSERT INTO `profesor` (`Núm_matrícula`, `Id_P`, `NIF_P`, `Código_Asignatura`, `Nombre_profe`, `Especialidad`, `Teléfono`) VALUES
(0, 1, 'QII001', 1, 'William Insignares', 'bilingüe, informático y Químico ', 35884129),
(0, 1, 'QII001', 2, 'William Insignares', 'bilingüe, Informático y Químico.', 35884129),
(0, 1, 'QII001', 3, 'William Insignares', 'bilingüe, informático y químico', 35884129),
(0, 2, 'S001', 4, 'Pedro Samper', 'Sociólogo', 325484129),
(1, 1, 'QII001', 4, 'Pedro Samper', 'Sociólogo', 35884129);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD PRIMARY KEY (`Código_Asignatura`),
  ADD KEY `Nombre_Asignatura` (`Nombre_Asignatura`);

--
-- Indices de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD PRIMARY KEY (`Nombre_Asignatura`),
  ADD KEY `Núm_matrícula` (`Núm_matrícula`);

--
-- Indices de la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD KEY `Código_Asignatura` (`Código_Asignatura`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD CONSTRAINT `asignatura_ibfk_1` FOREIGN KEY (`Nombre_Asignatura`) REFERENCES `estudiantes` (`Nombre_Asignatura`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD CONSTRAINT `estudiantes_ibfk_1` FOREIGN KEY (`Núm_matrícula`) REFERENCES `profesor` (`Código_Asignatura`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD CONSTRAINT `profesor_ibfk_1` FOREIGN KEY (`Código_Asignatura`) REFERENCES `asignatura` (`Código_Asignatura`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
