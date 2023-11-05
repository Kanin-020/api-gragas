-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 05-11-2023 a las 00:19:03
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
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `date` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`commentId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comments`
--

INSERT INTO `comments` (`commentId`, `status`, `content`, `date`) VALUES
(1, 'Pendiente', 'Comentario', 'Hoy'),
(2, 'Activo', 'Comentario2', 'Hoy'),
(3, 'Activo', 'Comentario3', 'Hoy');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `projects`
--

DROP TABLE IF EXISTS `projects`;
CREATE TABLE IF NOT EXISTS `projects` (
  `projectId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `creationDate` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `deadline` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`projectId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `projects`
--

INSERT INTO `projects` (`projectId`, `name`, `description`, `status`, `creationDate`, `deadline`) VALUES
(1, 'Gragas', 'Proyecto 1', 'Activo', 'hoy', 'mañana'),
(2, 'Project2', 'Proyecto2', 'Pendiente', 'Hoy', 'Mañana'),
(3, 'Project3', 'Proyecto3', 'Activo', 'Hoy', 'Mañana');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `relations_comments`
--

INSERT INTO `relations_comments` (`relation_commentId`, `commentId`, `taskId`, `userId`) VALUES
(1, 1, 3, 2),
(2, 2, 3, 1),
(3, 3, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `relations_projects`
--

DROP TABLE IF EXISTS `relations_projects`;
CREATE TABLE IF NOT EXISTS `relations_projects` (
  `relation_projectId` int NOT NULL AUTO_INCREMENT,
  `projectId` int NOT NULL,
  `taskId` int NOT NULL,
  `userId` int NOT NULL,
  PRIMARY KEY (`relation_projectId`),
  KEY `projectId` (`projectId`),
  KEY `taskId` (`taskId`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `relations_projects`
--

INSERT INTO `relations_projects` (`relation_projectId`, `projectId`, `taskId`, `userId`) VALUES
(1, 1, 1, 1),
(2, 2, 2, 1),
(3, 3, 3, 1),
(4, 1, 4, 1),
(5, 2, 5, 2),
(6, 3, 6, 1),
(7, 1, 7, 2),
(8, 2, 8, 2),
(9, 3, 9, 2),
(10, 1, 10, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tasks`
--

DROP TABLE IF EXISTS `tasks`;
CREATE TABLE IF NOT EXISTS `tasks` (
  `taskId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `creationDate` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `deadline` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`taskId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tasks`
--

INSERT INTO `tasks` (`taskId`, `name`, `description`, `status`, `creationDate`, `deadline`) VALUES
(1, 'Tarea1', 'Descripción de tarea', 'Activo', 'hoy', 'mañana'),
(2, 'Tarea2', 'descripcion1', 'activo', 'creacion', 'finalizacion'),
(3, 'Tarea3', 'descripcion1', 'activo', 'creacion', 'finalizacion'),
(4, 'Tarea4', 'descripcion1', 'activo', 'creacion', 'finalizacion'),
(5, 'Tarea5', 'descripcion1', 'activo', 'creacion', 'finalizacion'),
(6, 'Tarea6', 'descripcion1', 'activo', 'creacion', 'finalizacion'),
(7, 'Tarea7', 'descripcion1', 'activo', 'creacion', 'finalizacion'),
(8, 'Tarea8', 'descripcion1', 'activo', 'creacion', 'finalizacion'),
(9, 'Tarea9', 'descripcion1', 'activo', 'creacion', 'finalizacion'),
(10, 'Tarea10', 'descripcion1', 'activo', 'creacion', 'finalizacion');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`userId`, `name`, `email`, `password`, `role`, `creationDate`, `lastLoginDate`) VALUES
(1, 'Charlie', '123', '123', 'trabajador', '26/10/2023, 18:31:15', '30/10/2023, 19:53:49'),
(2, 'Kanin', '456', '456', 'administrador', '26/10/2023, 18:32:31', '30/10/2023, 19:50:23'),
(3, 'Freddy', '890', '890', 'trabajador', 'amogos', 'amogos');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `relations_comments`
--
ALTER TABLE `relations_comments`
  ADD CONSTRAINT `relations_comments_ibfk_1` FOREIGN KEY (`commentId`) REFERENCES `comments` (`commentId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `relations_comments_ibfk_2` FOREIGN KEY (`taskId`) REFERENCES `tasks` (`taskId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `relations_comments_ibfk_3` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `relations_projects`
--
ALTER TABLE `relations_projects`
  ADD CONSTRAINT `relations_projects_ibfk_1` FOREIGN KEY (`projectId`) REFERENCES `projects` (`projectId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `relations_projects_ibfk_2` FOREIGN KEY (`taskId`) REFERENCES `tasks` (`taskId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `relations_projects_ibfk_3` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
