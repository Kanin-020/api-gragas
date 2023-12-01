-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 01-12-2023 a las 00:22:19
-- Versión del servidor: 8.0.31
-- Versión de PHP: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gragas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `commentId` int NOT NULL AUTO_INCREMENT,
  `status` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `content` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `date` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`commentId`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comments`
--

INSERT INTO `comments` (`commentId`, `status`, `content`, `date`) VALUES
(1, 'Activo', 'Avance satisfactorio, espero revisión del supervisor.', '12/11/2023, 09:30:00'),
(2, 'Activo', 'Necesito más información sobre los requisitos.', '13/11/2023, 14:45:00'),
(3, 'Pendiente', 'Esperando aprobación para continuar.', '14/11/2023, 11:20:00'),
(4, 'Pendiente', 'Iniciando desarrollo del módulo de usuario.', '15/11/2023, 08:10:00'),
(5, 'Activo', 'Problema identificado con la interfaz de usuario.', '16/11/2023, 10:55:00'),
(6, 'Activo', 'Revisión de código completada.', '17/11/2023, 13:40:00'),
(7, 'Pendiente', 'Es necesario hacer ajustes en la base de datos.', '18/11/2023, 15:25:00'),
(8, 'Activo', 'Trabajando en la integración con API externa.', '19/11/2023, 09:30:00'),
(9, 'Pendiente', 'Esperando confirmación de requisitos adicionales.', '20/11/2023, 14:45:00'),
(10, 'Activo', 'Avance en la creación de la interfaz de usuario.', '21/11/2023, 11:20:00'),
(11, 'Pendiente', 'Problema con la compatibilidad de navegadores.', '22/11/2023, 08:10:00'),
(12, 'Activo', 'Revisión de código en proceso.', '23/11/2023, 10:55:00'),
(13, 'Activo', 'Necesaria reunión para definir detalles.', '24/11/2023, 13:40:00'),
(14, 'Pendiente', 'Falta información sobre el diseño deseado.', '25/11/2023, 15:25:00'),
(15, 'Activo', 'Iniciando la implementación de la lógica de negocios.', '26/11/2023, 09:30:00'),
(16, 'Pendiente', 'Esperando aprobación para la elección del framework.', '27/11/2023, 14:45:00'),
(17, 'Pendiente', 'Problema con la conexión a la base de datos.', '28/11/2023, 08:10:00'),
(18, 'Activo', 'Revisión de requisitos en curso.', '29/11/2023, 10:55:00'),
(19, 'Activo', 'Desarrollo del módulo de autenticación en progreso.', '30/11/2023, 13:40:00'),
(20, 'Pendiente', 'Es necesario definir el flujo de trabajo.', '01/12/2023, 15:25:00'),
(21, 'Pendiente', 'Problema identificado con la integración de API.', '02/12/2023, 09:30:00'),
(22, 'Activo', 'Es necesario ajustar el rendimiento del sistema.', '03/12/2023, 14:45:00'),
(23, 'Activo', 'Reunión programada para discutir cambios en el diseño.', '04/12/2023, 11:20:00'),
(24, 'Pendiente', 'Falta información sobre los casos de prueba.', '05/12/2023, 08:10:00'),
(25, 'Activo', 'Problema con la conexión a la base de datos.', '06/12/2023, 10:55:00'),
(26, 'Activo', 'Iniciando desarrollo del módulo de reportes.', '07/12/2023, 13:40:00'),
(27, 'Pendiente', 'Esperando aprobación para la elección del framewor', '08/12/2023, 15:25:00'),
(28, 'Activo', 'Problema identificado con la interfaz de usuario.', '09/12/2023, 09:30:00'),
(29, 'Pendiente', 'Es necesario hacer ajustes en la base de datos.', '10/12/2023, 14:45:00'),
(30, 'Pendiente', 'Falta información sobre los casos de prueba.', '11/12/2023, 11:20:00'),
(31, 'Activo', 'Revisión de requisitos en curso.', '12/12/2023, 08:10:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `projects`
--

DROP TABLE IF EXISTS `projects`;
CREATE TABLE IF NOT EXISTS `projects` (
  `projectId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `creationDate` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `deadline` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`projectId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `projects`
--

INSERT INTO `projects` (`projectId`, `name`, `description`, `status`, `creationDate`, `deadline`) VALUES
(1, 'Proyecto de Desarrollo Web', 'Desarrollo de un sitio web corporativo', 'Activo', '10/11/2023, 08:30:00', '30/12/2023, 18:00:00'),
(2, 'Sistema de Gestión de Inventario', 'Desarrollo de una aplicación para gestionar inventarios', 'Activo', '15/11/2023, 09:45:00', '28/02/2024, 16:30:00'),
(3, 'Aplicación Móvil de Red Social', 'Desarrollo de una aplicación móvil para conectarse con amigos', 'Finalizado', '05/10/2023, 14:20:00', '15/12/2023, 20:45:00'),
(4, 'Proyecto de Investigación AI', 'Investigación en inteligencia artificial', 'Activo', '20/11/2023, 11:00:00', '10/03/2024, 15:15:00'),
(5, 'Migración a la Nube', 'Migración de servidores a la nube', 'Activo', '08/11/2023, 10:10:00', '25/01/2024, 12:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `relations_comments`
--

DROP TABLE IF EXISTS `relations_comments`;
CREATE TABLE IF NOT EXISTS `relations_comments` (
  `relation_commentId` int NOT NULL AUTO_INCREMENT,
  `commentId` int NOT NULL,
  `taskId` int NOT NULL,
  `userId` int NOT NULL,
  PRIMARY KEY (`relation_commentId`),
  KEY `commentId` (`commentId`),
  KEY `taskId` (`taskId`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `relations_comments`
--

INSERT INTO `relations_comments` (`relation_commentId`, `commentId`, `taskId`, `userId`) VALUES
(1, 1, 1, 1),
(2, 2, 1, 3),
(3, 3, 1, 1),
(4, 4, 2, 1),
(5, 5, 2, 1),
(6, 6, 3, 6),
(7, 7, 3, 5),
(8, 8, 4, 4),
(9, 9, 4, 4),
(10, 10, 4, 4),
(11, 11, 5, 6),
(12, 12, 5, 4),
(13, 13, 6, 6),
(14, 14, 6, 8),
(15, 15, 7, 2),
(16, 16, 7, 8),
(17, 17, 8, 8),
(18, 18, 8, 4),
(19, 19, 9, 6),
(20, 20, 9, 7),
(21, 21, 10, 2),
(22, 22, 10, 4),
(23, 23, 10, 8),
(24, 24, 11, 2),
(25, 25, 11, 4),
(26, 26, 12, 8),
(27, 27, 12, 7),
(28, 28, 13, 2),
(29, 29, 13, 4),
(30, 30, 13, 6),
(31, 31, 13, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `relations_projects`
--

DROP TABLE IF EXISTS `relations_projects`;
CREATE TABLE IF NOT EXISTS `relations_projects` (
  `relation_projectId` int NOT NULL AUTO_INCREMENT,
  `projectId` int NOT NULL,
  `taskId` int DEFAULT NULL,
  `userId` int NOT NULL,
  PRIMARY KEY (`relation_projectId`),
  KEY `projectId` (`projectId`),
  KEY `taskId` (`taskId`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `relations_projects`
--

INSERT INTO `relations_projects` (`relation_projectId`, `projectId`, `taskId`, `userId`) VALUES
(1, 1, NULL, 6),
(2, 1, NULL, 1),
(3, 1, NULL, 3),
(4, 1, NULL, 5),
(5, 2, NULL, 6),
(6, 2, NULL, 4),
(7, 2, NULL, 8),
(8, 3, NULL, 2),
(9, 3, NULL, 6),
(10, 3, NULL, 1),
(11, 3, NULL, 3),
(12, 3, NULL, 7),
(13, 3, NULL, 4),
(14, 3, NULL, 8),
(15, 4, NULL, 2),
(16, 4, NULL, 4),
(17, 4, NULL, 8),
(18, 5, NULL, 2),
(19, 5, NULL, 7),
(20, 5, NULL, 5),
(21, 1, 1, 1),
(22, 1, 1, 3),
(23, 1, 2, 1),
(24, 1, 2, 3),
(25, 1, 3, 1),
(26, 1, 3, 5),
(27, 1, 3, 3),
(28, 2, 4, 4),
(29, 2, 5, 4),
(30, 2, 6, 8),
(31, 3, 7, 1),
(32, 3, 7, 3),
(33, 3, 8, 4),
(34, 3, 8, 3),
(35, 3, 9, 7),
(36, 3, 9, 8),
(37, 4, 10, 8),
(38, 4, 11, 4),
(39, 4, 12, 8),
(40, 5, 13, 5),
(41, 5, 14, 5),
(42, 5, 15, 7),
(43, 5, 14, 7),
(44, 3, 7, 7),
(45, 3, 9, 1),
(46, 3, 8, 8),
(47, 5, NULL, 1),
(48, 5, 13, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tasks`
--

DROP TABLE IF EXISTS `tasks`;
CREATE TABLE IF NOT EXISTS `tasks` (
  `taskId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `creationDate` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `deadline` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`taskId`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tasks`
--

INSERT INTO `tasks` (`taskId`, `name`, `description`, `status`, `creationDate`, `deadline`) VALUES
(1, 'Diseño de Interfaz', 'Crear el diseño de la interfaz de usuario', 'Activo', '12/11/2023, 09:00:00', '20/11/2023, 15:00:00'),
(2, 'Desarrollo de Backend', 'Implementar la lógica del servidor', 'Activo', '15/11/2023, 10:30:00', '25/11/2023, 18:00:00'),
(3, 'Pruebas de Usabilidad', 'Realizar pruebas de usabilidad del sitio web', 'Activo', '18/11/2023, 14:00:00', '28/11/2023, 16:30:00'),
(4, 'Análisis de Requisitos', 'Realizar análisis detallado de requisitos', 'Activo', '20/11/2023, 11:30:00', '30/11/2023, 17:00:00'),
(5, 'Desarrollo de Funcionalidades', 'Implementar las funcionalidades del sistema de inventario', 'Activo', '25/11/2023, 13:00:00', '05/12/2023, 18:30:00'),
(6, 'Pruebas de Integración', 'Realizar pruebas de integración del sistema de inventario', 'Activo', '28/11/2023, 16:45:00', '10/12/2023, 15:00:00'),
(7, 'Desarrollo de Funcionalidades', 'Implementar las funcionalidades de la aplicación movil', 'Finalizado', '05/10/2023, 14:30:00', '15/11/2023, 20:00:00'),
(8, 'Pruebas de Rendimiento', 'Realizar pruebas de rendimiento de la aplicación m', 'Finalizado', '10/10/2023, 10:00:00', '20/11/2023, 18:30:00'),
(9, 'Lanzamiento de la Aplicación', 'Preparar el lanzamiento oficial de la aplicación movil', 'Finalizado', '15/11/2023, 12:00:00', '25/11/2023, 16:00:00'),
(10, 'Investigación en Machine Learning', 'Realizar investigación en algoritmos de machine learning', 'Activo', '21/11/2023, 10:45:00', '01/12/2023, 17:30:00'),
(11, 'Desarrollo de Prototipo', 'Crear un prototipo utilizando modelos de machine learning', 'Activo', '25/11/2023, 12:30:00', '05/12/2023, 18:00:00'),
(12, 'Evaluación y Ajuste', 'Evaluar el rendimiento del prototipo y realizar ajustes', 'Activo', '30/11/2023, 14:15:00', '10/12/2023, 16:30:00'),
(13, 'Planificación de Migración', 'Elaborar un plan detallado para la migración a la nube', 'Activo', '10/11/2023, 10:00:00', '20/11/2023, 15:30:00'),
(14, 'Implementación en la Nube', 'Realizar la migración de servidores a la plataforma en la nube', 'Activo', '15/11/2023, 12:30:00', '25/11/2023, 17:00:00'),
(15, 'Pruebas Post-Migración', 'Realizar pruebas de funcionamiento después de la migración', 'Activo', '18/11/2023, 14:45:00', '28/11/2023, 16:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `role` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `creationDate` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `lastLoginDate` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`userId`, `name`, `email`, `password`, `role`, `creationDate`, `lastLoginDate`) VALUES
(1, 'Charlie', '123', '123', 'trabajador', '26/10/2023, 18:31:15', '30/11/2023, 02:40:43'),
(2, 'Kanin', '456', '456', 'administrador', '26/10/2023, 18:32:31', '30/11/2023, 02:44:08'),
(3, 'Juan Pérez', 'juan.perez@example.com', 'password123', 'trabajador', '12/11/2023, 09:00:00', '13/11/2023, 14:30:00'),
(4, 'Ana García', 'ana.garcia@example.com', 'securepass456', 'trabajador', '15/11/2023, 10:30:00', '17/11/2023, 16:45:00'),
(5, 'Carlos Rodríguez', 'carlos.rodriguez@example.com', 'pass123word', 'trabajador', '18/11/2023, 14:00:00', '20/11/2023, 17:30:00'),
(6, 'María López', 'maria.lopez@example.com', 'strongpass789', 'administrador', '20/11/2023, 11:30:00', '22/11/2023, 18:00:00'),
(7, 'Luis Torres', 'luis.torres@example.com', 'secretpass567', 'trabajador', '25/11/2023, 13:00:00', '27/11/2023, 16:30:00'),
(8, 'Laura Méndez', 'laura.mendez@example.com', 'mypassword890', 'trabajador', '28/11/2023, 16:45:00', '30/11/2023, 15:00:00');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `relations_comments`
--
ALTER TABLE `relations_comments`
  ADD CONSTRAINT `relations_comments_ibfk_1` FOREIGN KEY (`commentId`) REFERENCES `comments` (`commentId`),
  ADD CONSTRAINT `relations_comments_ibfk_2` FOREIGN KEY (`taskId`) REFERENCES `tasks` (`taskId`),
  ADD CONSTRAINT `relations_comments_ibfk_3` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`);

--
-- Filtros para la tabla `relations_projects`
--
ALTER TABLE `relations_projects`
  ADD CONSTRAINT `relations_projects_ibfk_1` FOREIGN KEY (`projectId`) REFERENCES `projects` (`projectId`),
  ADD CONSTRAINT `relations_projects_ibfk_2` FOREIGN KEY (`taskId`) REFERENCES `tasks` (`taskId`),
  ADD CONSTRAINT `relations_projects_ibfk_3` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
