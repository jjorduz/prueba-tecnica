-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-07-2020 a las 05:20:11
-- Versión del servidor: 10.1.35-MariaDB
-- Versión de PHP: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `offimedicas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nucleos`
--

CREATE TABLE `nucleos` (
  `id` int(11) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `id_padre` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `nucleos`
--

INSERT INTO `nucleos` (`id`, `user_id`, `id_padre`, `created_at`, `updated_at`) VALUES
(7, 15, NULL, '2020-07-08 02:17:33', '2020-07-08 02:17:33'),
(8, 16, 7, '2020-07-08 02:23:10', '2020-07-08 02:23:10'),
(9, 17, 7, '2020-07-08 02:24:10', '2020-07-08 02:24:10'),
(12, 22, NULL, '2020-07-08 03:00:12', '2020-07-08 03:00:12'),
(13, 23, NULL, '2020-07-08 03:00:47', '2020-07-08 03:00:47'),
(14, 23, 12, '2020-07-08 03:00:47', '2020-07-08 03:00:47'),
(15, 24, NULL, '2020-07-08 03:02:52', '2020-07-08 03:02:52'),
(16, 24, 13, '2020-07-08 03:02:52', '2020-07-08 03:02:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `identificacion` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `apellido` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `direccion` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `identificacion`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `apellido`, `direccion`) VALUES
(3, '1', 'martin', 'asdas@asd.com', '$2y$10$a0/IkrX2yF.hpxM9GGbAvOGbLz15MW/XytfhdDkSk12Ko4rZBHGEq', NULL, '2020-07-08 02:39:38', '2020-07-08 06:43:22', 'perez', 'asd'),
(4, '5', 'martin 2', 'asdas@correo.comasd', '$2y$10$a0/IkrX2yF.hpxM9GGbAvOGbLz15MW/XytfhdDkSk12Ko4rZBHGEq', NULL, '2020-07-08 02:39:38', '2020-07-08 06:43:51', 'perez 2', 'asd'),
(8, '3', 'jose editado', 'jose@123.editado', '$2y$10$a0/IkrX2yF.hpxM9GGbAvOGbLz15MW/XytfhdDkSk12Ko4rZBHGEq', NULL, '2020-07-08 02:39:38', '2020-07-08 06:45:26', 'apellido editado', 'direccion editado'),
(9, '7', 'odilia', 'correo@hhh.com', '$2y$10$a0/IkrX2yF.hpxM9GGbAvOGbLz15MW/XytfhdDkSk12Ko4rZBHGEq', NULL, '2020-07-08 02:39:38', '2020-07-08 06:24:06', 'apellido', 'direcicon'),
(10, '9', 'pedro', 'pedro@correo.com', '$2y$10$a0/IkrX2yF.hpxM9GGbAvOGbLz15MW/XytfhdDkSk12Ko4rZBHGEq', NULL, '2020-07-08 02:39:38', '2020-07-08 06:24:51', 'apellido', 'direcicon'),
(14, '2', 'maria', 'maria@alquichire.com', '$2y$10$a0/IkrX2yF.hpxM9GGbAvOGbLz15MW/XytfhdDkSk12Ko4rZBHGEq', NULL, '2020-07-08 02:39:38', '2020-07-08 07:09:26', 'alquchire', 'calle falsa'),
(15, '1099547330', 'carlos', 'carlos@sanchezacero.com.coss', '$2y$10$a0/IkrX2yF.hpxM9GGbAvOGbLz15MW/XytfhdDkSk12Ko4rZBHGEq', NULL, '2020-07-08 02:39:38', '2020-07-08 07:17:33', 'sanchez', 'asd'),
(16, '28427328', 'odilia', 'odilia@acero.com', '$2y$10$a0/IkrX2yF.hpxM9GGbAvOGbLz15MW/XytfhdDkSk12Ko4rZBHGEq', NULL, '2020-07-08 02:39:38', '2020-07-08 07:23:10', 'acero', 'sadasd'),
(17, '28427329', 'bibian', 'bibian@ruiz.com', '$2y$10$a0/IkrX2yF.hpxM9GGbAvOGbLz15MW/XytfhdDkSk12Ko4rZBHGEq', NULL, '2020-07-08 02:39:38', '2020-07-08 07:24:10', 'ruiz', 'calle falsa 123'),
(18, '7003', 'jose123', 'jose123@correo.com', '$2y$10$a0/IkrX2yF.hpxM9GGbAvOGbLz15MW/XytfhdDkSk12Ko4rZBHGEq', NULL, '2020-07-08 07:39:07', '2020-07-08 07:39:07', 'jose123', 'jose123'),
(22, '91516787', 'jose', 'jose@orduz.com', '$2y$10$IDH/3GeIHd10Oyx8ZLXy7uZilH3IpfEUePmiSmtA8Jfe76/gGhpIi', NULL, '2020-07-08 08:00:12', '2020-07-08 08:00:12', 'orduz', 'direccino jose jlian'),
(23, '37811011', 'oliva', 'oliva@gmail.com', '$2y$10$2T66u.4On9hMVhIuxHG1W.F.taYzdQc0V4WNbP1NFG/Tfq3ZOTxHW', NULL, '2020-07-08 08:00:47', '2020-07-08 08:00:47', 'roman', 'direccino oliva'),
(24, '999999', 'retbaidi', 'reynao@gmai.com', '$2y$10$ThXR8yFwBl3EZXOCjlYT0Odz.1I4nHVgMywlE.vRvy2ktnH2Vytj.', NULL, '2020-07-08 08:02:52', '2020-07-08 08:02:52', 'irdyz', 'direcion reyando');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `nucleos`
--
ALTER TABLE `nucleos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_jefe` (`user_id`,`id_padre`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `nucleos`
--
ALTER TABLE `nucleos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `nucleos`
--
ALTER TABLE `nucleos`
  ADD CONSTRAINT `nucleos_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
