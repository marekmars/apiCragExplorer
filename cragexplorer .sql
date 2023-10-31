-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-10-2023 a las 03:59:12
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cragexplorer`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ascensos`
--

CREATE TABLE `ascensos` (
  `id` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idSesion` int(11) NOT NULL,
  `idTipo` int(11) NOT NULL,
  `intentos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ascensos`
--

INSERT INTO `ascensos` (`id`, `idUsuario`, `idSesion`, `idTipo`, `intentos`) VALUES
(1, 9, 2, 3, 2),
(2, 9, 3, 1, 1),
(3, 9, 5, 3, 2),
(4, 9, 7, 2, 1),
(5, 9, 9, 1, 1),
(6, 9, 10, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estilos`
--

CREATE TABLE `estilos` (
  `id` int(11) NOT NULL,
  `estiloN` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estilos`
--

INSERT INTO `estilos` (`id`, `estiloN`) VALUES
(1, 'placa'),
(2, 'desplome'),
(3, 'slab');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `favoritos`
--

CREATE TABLE `favoritos` (
  `id` int(11) NOT NULL,
  `idVia` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `favoritos`
--

INSERT INTO `favoritos` (`id`, `idVia`, `idUsuario`, `fecha`) VALUES
(1, 83, 9, '2023-06-01 19:38:32'),
(2, 93, 9, '2023-07-13 19:38:32'),
(3, 94, 9, '2023-07-14 19:38:32'),
(4, 47, 9, '2023-07-13 19:38:32'),
(5, 59, 9, '2023-08-17 19:38:32');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fotos`
--

CREATE TABLE `fotos` (
  `id` int(11) NOT NULL,
  `idVia` int(11) NOT NULL,
  `url` varchar(250) NOT NULL,
  `idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `fotos`
--

INSERT INTO `fotos` (`id`, `idVia`, `url`, `idUsuario`) VALUES
(1, 38, 'uploads/fotos/via_38_sda12Axc.jpg', 9),
(2, 39, 'uploads/fotos/via_39_sd4g2JF2.jpg', 9),
(3, 46, 'uploads/fotos/via_46_aB3Cf5.jpg', 9),
(4, 47, 'uploads/fotos/via_47_X8dYK9.jpg', 9),
(5, 60, 'uploads/fotos/via_60_z1PqR7.jpg', 9),
(6, 63, 'uploads/fotos/via_63_M6NvLp.jpg', 9),
(7, 71, 'uploads/fotos/via_71_HtO2Ws.jpg', 9),
(8, 73, 'uploads/fotos/via_73_eU9iJl.jpg', 9),
(23, 84, 'uploads/fotos/via_84_a89S867.jpg', 9),
(24, 110, 'uploads/fotos/via_110_r3R6dsa.jpg', 16),
(25, 116, 'uploads/fotos/via_116_sad3213.jpg', 17),
(26, 117, 'uploads/fotos/via_117_D3Sgd2.jpg', 9),
(27, 125, 'uploads/fotos/via_125_df3A5ff.jpg', 17),
(28, 126, 'uploads/fotos/via_126_123dsw.jpg', 9),
(29, 137, 'uploads/fotos/via_137_4578dsaf.jpg', 17),
(30, 139, 'uploads/fotos/via_139_fdQe345.jpg', 18),
(31, 145, 'uploads/fotos/via_145_sad546.jpg', 9),
(32, 147, 'uploads/fotos/via_147_sad47E.jpg', 9),
(33, 335, 'uploads/fotos/via_335_sad345.jpg', 9),
(34, 336, 'uploads/fotos/via_336_sad342.jpg', 9),
(35, 338, 'uploads/fotos/via_338_sado65.jpg', 17),
(37, 4, 'uploads/fotos/via_4_sda12Axc.jpg', 9),
(38, 8, 'uploads/fotos/via_8_sda12Axc.jpg', 9),
(43, 5, 'uploads/Fotos/via_5_7mHLuxwDWN.jpg', 16),
(44, 5, 'uploads/Fotos/via_5_rZCtJWBRGn.jpg', 16),
(45, 24, 'uploads/Fotos/via_24_xn511wYgda.jpg', 16);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grados`
--

CREATE TABLE `grados` (
  `id` int(11) NOT NULL,
  `gradoN` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `grados`
--

INSERT INTO `grados` (`id`, `gradoN`) VALUES
(1, '4'),
(2, '4+'),
(3, '5'),
(4, '5+'),
(5, '6'),
(6, '6a'),
(7, '6a+'),
(8, '6b'),
(9, '6b+'),
(10, '6c'),
(11, '6c+'),
(12, '7'),
(13, '7a'),
(14, '7a+'),
(15, '7b'),
(16, '7b+'),
(17, '7c'),
(18, '7c+'),
(19, '8'),
(20, '8a'),
(21, '8a+'),
(22, '8b'),
(23, '8b+'),
(24, '8c'),
(25, '8c+'),
(26, '9'),
(27, '9a'),
(28, '9a+'),
(29, '9b'),
(30, '9b+'),
(31, '9c');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resenias`
--

CREATE TABLE `resenias` (
  `id` int(11) NOT NULL,
  `idVia` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `comentario` varchar(500) NOT NULL,
  `calificacion` int(1) NOT NULL,
  `fecha` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `resenias`
--

INSERT INTO `resenias` (`id`, `idVia`, `idUsuario`, `comentario`, `calificacion`, `fecha`) VALUES
(1, 47, 9, 'Amanecer en la Cumbre\" es una ruta clásica que te llevará a través de una serie de desafiantes fisuras y placas. Comienza en una pendiente empinada y te lleva por una serie de movimientos técnicos, incluyendo un tramo expuesto con magníficas vistas panorámicas. La ruta culmina en una repisa con espacio suficiente para descansar y disfrutar de un amanecer espectacular en la cumbre. Es una experiencia que te dejará sin aliento en más de un sentido', 4, '2023-11-20 00:00:00'),
(2, 46, 9, 'Sueños Verticales\" es una ruta vertical impresionante en el Cañón del Diablo. Con movimientos exigentes y una secuencia de agarres pequeños, esta ruta es un sueño hecho realidad para los escaladores experimentados. La exposición en el tramo superior añade emoción a la escalada. Alcanzarás la cima exhausto pero con una sensación de logro que te dejará ansioso por volver a intentarlo', 4, '2023-04-19 00:00:00'),
(3, 71, 9, 'Es una ruta de escalada de alto desplome en el Parque Nacional de las Rocas que pondrá a prueba tus límites físicos y mentales. La ruta comienza con un impresionante techo que requiere una combinación de fuerza y agilidad para superar. Los agarres son pequeños y escasos, lo que añade una dosis adicional de dificultad', 5, '2023-10-28 00:00:00'),
(4, 340, 16, 'Esta emocionante ruta de escalada ofrece un desafío increíble en un entorno natural impresionante. Con movimientos técnicos y una exposición vertiginosa, esta vía se destaca por sus emocionantes pasajes. Prepárate para disfrutar de una experiencia vertiginosa mientras te enfrentas a esta asombrosa vía. ¡Un verdadero placer para los amantes de la escalada en busca de emociones fuertes!\r\n\r\n\r\n\r\n\r\n\r\n', 4, '2023-03-26 00:00:00'),
(58, 1, 9, '¡Una excelente vía para principiantes! Disfruté mucho de la escalada aquí.', 4, '2023-09-06 00:00:00'),
(59, 2, 16, 'La vía 2 es emocionante, ¡me encantó el reto que ofrece!', 5, '2023-09-18 00:00:00'),
(60, 3, 9, 'Subir la vía 3 fue una gran experiencia. Definitivamente recomendable.', 4, '2023-07-13 00:00:00'),
(61, 4, 16, 'Me gustó la vía 4, aunque algunos movimientos fueron complicados.', 3, '2023-07-04 00:00:00'),
(62, 5, 9, 'Gran vía para mejorar tus habilidades de escalada. Disfruté cada momento.', 4, '2023-12-10 00:00:00'),
(63, 6, 16, 'La vía 6 me dejó sin aliento. ¡Una escalada emocionante!', 5, '2023-03-09 00:00:00'),
(64, 7, 9, 'La vía 7 es un desafío. Pero llegar a la cima es una gran recompensa.', 4, '2023-02-05 00:00:00'),
(65, 8, 16, '¡La vía 8 es simplemente asombrosa! Una de mis favoritas.', 5, '2023-12-07 00:00:00'),
(66, 9, 9, 'Disfruté de cada agarre en la vía 9. Definitivamente la repetiré.', 4, '2023-05-17 00:00:00'),
(67, 10, 16, 'Subir la vía 10 fue todo un logro. ¡Una gran experiencia!', 4, '2023-01-27 00:00:00'),
(68, 11, 9, 'Me divertí escalando la vía 11. ¡Una experiencia inolvidable!', 3, '2023-03-30 00:00:00'),
(69, 12, 16, 'La vía 12 fue un buen desafío. ¡Estoy satisfecho con mi escalada!', 4, '2023-12-29 00:00:00'),
(70, 13, 9, 'La vía 13 es un reto técnico. Pero lo logré y valió la pena.', 4, '2023-03-28 00:00:00'),
(71, 14, 16, 'Me encantó la vía 14. Cada movimiento es emocionante.', 5, '2023-03-19 00:00:00'),
(72, 15, 9, 'La vía 15 ofrece una vista impresionante. ¡Una gran escalada!', 4, '2023-05-06 00:00:00'),
(73, 16, 16, 'La vía 16 es un desafío físico. ¡Pero lo logré!', 3, '2023-01-29 00:00:00'),
(74, 17, 9, 'La vía 17 es un buen lugar para aprender. Recomiendo a los principiantes.', 3, '2023-05-15 00:00:00'),
(75, 18, 16, 'La vía 18 es una aventura. ¡Definitivamente para escaladores experimentados!', 4, '2023-08-07 00:00:00'),
(76, 19, 9, 'La vía 19 es intensa. ¡Una escalada que recordaré por mucho tiempo!', 4, '2023-11-23 00:00:00'),
(77, 20, 16, 'La vía 20 es un reto para los más valientes. ¡Una gran experiencia!', 4, '2023-09-04 00:00:00'),
(78, 21, 9, 'La vía 21 es perfecta para escaladores principiantes. ¡Me divertí mucho!', 4, '2023-09-11 00:00:00'),
(79, 22, 16, 'Una escalada emocionante en la vía 22. Cada movimiento cuenta.', 5, '2023-06-10 00:00:00'),
(80, 23, 9, 'Disfruté de la vía 23, aunque algunos pasos eran desafiantes.', 3, '2023-02-14 00:00:00'),
(81, 24, 16, 'La vía 24 ofrece una gran vista. ¡Vale la pena subirla!', 4, '2023-04-17 00:00:00'),
(82, 25, 9, 'La vía 25 es un buen lugar para mejorar tus habilidades.', 4, '2023-02-02 00:00:00'),
(83, 26, 16, 'La vía 26 es un reto técnico. ¡Una experiencia gratificante!', 4, '2023-07-28 00:00:00'),
(84, 27, 9, 'Subir la vía 27 fue un gran logro personal. ¡Muy satisfecho!', 4, '2023-08-05 00:00:00'),
(85, 28, 16, 'La vía 28 es desafiante y emocionante. ¡La escalada es genial!', 5, '2023-04-03 00:00:00'),
(86, 29, 9, 'Me encantó la vía 29. Los movimientos son muy interesantes.', 5, '2023-06-28 00:00:00'),
(87, 30, 16, 'La vía 30 es un buen desafío para escaladores intermedios.', 4, '2023-09-05 00:00:00'),
(88, 31, 9, 'La vía 31 me desafió de principio a fin. ¡Una experiencia increíble!', 4, '2023-12-06 00:00:00'),
(89, 32, 16, 'La vía 32 es un gran lugar para disfrutar de la naturaleza y la escalada.', 4, '2023-08-14 00:00:00'),
(90, 33, 9, 'La vía 33 ofrece una vista espectacular desde la cima. ¡Una maravilla!', 5, '2023-04-19 00:00:00'),
(91, 34, 16, 'Me sentí muy bien al superar los desafíos de la vía 34.', 4, '2023-08-18 00:00:00'),
(92, 35, 9, 'La vía 35 es perfecta para escaladores avanzados. ¡Intensa y emocionante!', 5, '2023-04-02 00:00:00'),
(93, 36, 16, 'Me gustó la vía 36, aunque algunos movimientos eran complicados.', 3, '2023-05-14 00:00:00'),
(94, 37, 9, 'La vía 37 es un lugar agradable para aprender a escalar. Recomendable para principiantes.', 3, '2023-01-30 00:00:00'),
(95, 38, 16, 'La vía 38 es un desafío técnico. ¡Pero gratificante!', 4, '2023-04-21 00:00:00'),
(96, 39, 9, 'Subir la vía 39 fue un gran logro. ¡Una experiencia impresionante!', 4, '2023-04-09 00:00:00'),
(97, 40, 16, 'La vía 40 es un reto para escaladores experimentados. ¡Una aventura!', 4, '2023-06-13 00:00:00'),
(237, 41, 9, 'La vía 41 es un reto emocionante. ¡Una gran escalada!', 4, '2023-06-05 00:00:00'),
(255, 43, 9, 'La vía 43 ofrece una vista panorámica. ¡Vale la pena!', 4, '2023-10-15 00:00:00'),
(256, 44, 16, 'La vía 44 es un buen lugar para mejorar tus habilidades de escalada.', 4, '2023-08-31 00:00:00'),
(263, 45, 9, 'La vía 45 me desafió físicamente. ¡Me encantó!', 4, '2023-12-16 00:00:00'),
(264, 46, 16, 'Me gustó la vía 46. Cada agarre es emocionante.', 5, '2023-10-17 00:00:00'),
(329, 56, 16, 'La vía 56 es un lugar impresionante para escalar. ¡Lo recomiendo!', 5, '2023-02-04 00:00:00'),
(531, 80, 9, 'La vía 51 es un emocionante desafío. ¡La escalada es genial!', 4, '2023-02-05 00:00:00'),
(543, 42, 16, 'Disfruté mucho de la vía 42. ¡Una experiencia inolvidable!', 5, '2023-03-15 00:00:00'),
(548, 47, 9, 'La vía 47 es un reto técnico interesante. ¡La recomiendo!', 4, '2023-09-16 00:00:00'),
(549, 48, 16, 'Subir la vía 48 fue un gran logro personal. ¡Una experiencia asombrosa!', 5, '2023-12-11 00:00:00'),
(550, 49, 9, 'La vía 49 ofrece una experiencia única. ¡Increíble escalada!', 5, '2023-08-05 00:00:00'),
(638, 57, 9, 'La vía 57 es un desafío emocionante. ¡Increíble escalada!', 5, '2023-02-19 00:00:00'),
(639, 58, 16, 'Me sentí muy bien al superar los obstáculos de la vía 58.', 4, '2023-11-24 00:00:00'),
(640, 59, 9, 'La vía 59 es perfecta para escaladores avanzados. ¡Una aventura!', 5, '2023-01-29 00:00:00'),
(641, 60, 16, 'Me gustó la vía 60. Los movimientos son interesantes.', 4, '2023-09-15 00:00:00'),
(642, 61, 9, 'La vía 61 es un lugar impresionante para aprender a escalar.', 4, '2023-04-15 00:00:00'),
(643, 62, 16, 'La vía 62 ofrece una vista espectacular desde la cima. ¡Una maravilla!', 5, '2023-04-27 00:00:00'),
(644, 63, 9, 'Disfruté de la vía 63, aunque algunos pasos eran desafiantes.', 3, '2023-09-26 00:00:00'),
(645, 68, 16, 'La vía 68 es desafiante y emocionante. ¡La escalada es genial!', 5, '2023-09-20 00:00:00'),
(646, 69, 9, 'Me encantó la vía 69. Los movimientos son muy interesantes.', 5, '2023-05-23 00:00:00'),
(647, 70, 16, 'La vía 70 es un buen desafío para escaladores intermedios.', 4, '2023-10-16 00:00:00'),
(648, 71, 9, 'La vía 71 me desafió de principio a fin. ¡Una experiencia increíble!', 4, '2023-10-15 00:00:00'),
(649, 72, 16, 'La vía 72 es un gran lugar para disfrutar de la naturaleza y la escalada.', 4, '2023-07-25 00:00:00'),
(650, 73, 9, 'La vía 73 ofrece una vista espectacular desde la cima. ¡Una maravilla!', 5, '2023-06-15 00:00:00'),
(651, 74, 16, 'Me sentí muy bien al superar los desafíos de la vía 74.', 4, '2023-07-30 00:00:00'),
(652, 75, 9, 'La vía 75 es perfecta para escaladores avanzados. ¡Intensa y emocionante!', 5, '2023-07-12 00:00:00'),
(653, 76, 16, 'Me gustó la vía 76, aunque algunos movimientos eran complicados.', 3, '2023-11-25 00:00:00'),
(654, 77, 9, 'La vía 77 es un lugar agradable para aprender a escalar. Recomendable para principiantes.', 3, '2023-12-04 00:00:00'),
(656, 79, 9, 'Subir la vía 79 fue un gran logro. ¡Una experiencia impresionante!', 4, '2023-12-01 00:00:00'),
(657, 80, 16, 'La vía 80 es un reto para escaladores experimentados. ¡Una aventura!', 4, '2023-10-24 00:00:00'),
(658, 81, 9, 'La vía 81 es un emocionante desafío. ¡La escalada es genial!', 4, '2023-04-25 00:00:00'),
(659, 82, 16, 'Me encantó la vía 82. Cada movimiento es emocionante.', 5, '2023-02-16 00:00:00'),
(660, 83, 9, 'La vía 83 ofrece un emocionante ascenso. ¡Una experiencia única!', 4, '2023-09-12 00:00:00'),
(661, 84, 16, 'Subir la vía 84 es un logro personal. ¡Muy satisfecho!', 4, '2023-02-06 00:00:00'),
(662, 85, 9, 'La vía 85 es un reto técnico. ¡Una experiencia asombrosa!', 4, '2023-06-01 00:00:00'),
(663, 86, 16, 'La vía 86 es un lugar impresionante para escalar. ¡Lo recomiendo!', 5, '2023-10-08 00:00:00'),
(664, 87, 9, 'La vía 87 es un desafío emocionante. ¡Increíble escalada!', 5, '2023-08-10 00:00:00'),
(665, 90, 16, 'Me gustó la vía 90. Los movimientos son interesantes.', 4, '2023-09-20 00:00:00'),
(666, 91, 9, 'La vía 91 es un lugar impresionante para aprender a escalar.', 4, '2023-10-12 00:00:00'),
(667, 92, 16, 'La vía 92 ofrece una vista espectacular desde la cima. ¡Una maravilla!', 5, '2023-09-27 00:00:00'),
(668, 93, 9, 'Disfruté de la vía 93, aunque algunos pasos eran desafiantes.', 3, '2023-05-08 00:00:00'),
(669, 94, 16, 'La vía 94 ofrece una gran vista panorámica. ¡Vale la pena subirla!', 4, '2023-07-13 00:00:00'),
(670, 95, 9, 'La vía 95 es un buen lugar para mejorar tus habilidades.', 4, '2023-08-10 00:00:00'),
(671, 96, 16, 'La vía 96 es un reto técnico. ¡Una experiencia gratificante!', 4, '2023-06-11 00:00:00'),
(672, 97, 9, 'Subir la vía 97 fue un gran logro personal. ¡Muy satisfecho!', 4, '2023-05-23 00:00:00'),
(673, 98, 16, 'La vía 98 es desafiante y emocionante. ¡La escalada es genial!', 5, '2023-08-19 00:00:00'),
(674, 99, 9, 'Me encantó la vía 99. Los movimientos son muy interesantes.', 5, '2023-12-23 00:00:00'),
(675, 100, 16, 'La vía 100 es un buen desafío para escaladores intermedios.', 4, '2023-12-29 00:00:00'),
(726, 101, 9, 'La vía 101 es un emocionante desafío. ¡La escalada es genial!', 4, '2023-01-15 00:00:00'),
(727, 102, 16, 'Me encantó la vía 102. Cada movimiento es emocionante.', 5, '2023-03-19 00:00:00'),
(728, 103, 9, 'La vía 103 ofrece un emocionante ascenso. ¡Una experiencia única!', 4, '2023-12-12 00:00:00'),
(729, 104, 16, 'Subir la vía 104 es un logro personal. ¡Muy satisfecho!', 4, '2023-02-04 00:00:00'),
(730, 105, 9, 'La vía 105 es un reto técnico. ¡Una experiencia asombrosa!', 4, '2023-08-19 00:00:00'),
(731, 106, 16, 'La vía 106 es un lugar impresionante para escalar. ¡Lo recomiendo!', 5, '2023-11-16 00:00:00'),
(732, 107, 9, 'La vía 107 es un desafío emocionante. ¡Increíble escalada!', 5, '2023-06-24 00:00:00'),
(733, 108, 16, 'Me sentí muy bien al superar los obstáculos de la vía 108.', 4, '2023-10-07 00:00:00'),
(734, 109, 9, 'La vía 109 es perfecta para escaladores avanzados. ¡Una aventura!', 5, '2023-05-26 00:00:00'),
(735, 110, 16, 'Me gustó la vía 110. Los movimientos son interesantes.', 4, '2023-09-12 00:00:00'),
(736, 111, 9, 'La vía 111 es un lugar impresionante para aprender a escalar.', 4, '2023-04-15 00:00:00'),
(737, 112, 16, 'La vía 112 ofrece una vista espectacular desde la cima. ¡Una maravilla!', 5, '2023-05-06 00:00:00'),
(738, 113, 9, 'Disfruté de la vía 113, aunque algunos pasos eran desafiantes.', 3, '2023-11-09 00:00:00'),
(739, 114, 16, 'La vía 114 ofrece una gran vista panorámica. ¡Vale la pena subirla!', 4, '2023-03-31 00:00:00'),
(740, 115, 9, 'La vía 115 es un buen lugar para mejorar tus habilidades.', 4, '2023-08-29 00:00:00'),
(741, 116, 16, 'La vía 116 es un reto técnico. ¡Una experiencia gratificante!', 4, '2023-07-26 00:00:00'),
(742, 117, 9, 'Subir la vía 117 fue un gran logro personal. ¡Muy satisfecho!', 4, '2023-11-05 00:00:00'),
(743, 118, 16, 'La vía 118 es desafiante y emocionante. ¡La escalada es genial!', 5, '2023-07-13 00:00:00'),
(744, 119, 9, 'Me encantó la vía 119. Los movimientos son muy interesantes.', 5, '2023-02-10 00:00:00'),
(745, 120, 16, 'La vía 120 es un buen desafío para escaladores intermedios.', 4, '2023-12-22 00:00:00'),
(746, 121, 9, 'La vía 121 me desafió de principio a fin. ¡Una experiencia increíble!', 4, '2023-07-13 00:00:00'),
(747, 122, 16, 'La vía 122 es un gran lugar para disfrutar de la naturaleza y la escalada.', 4, '2023-09-24 00:00:00'),
(749, 124, 16, 'Me sentí muy bien al superar los desafíos de la vía 124.', 4, '2023-01-22 00:00:00'),
(750, 125, 9, 'La vía 125 es perfecta para escaladores avanzados. ¡Intensa y emocionante!', 5, '2023-02-06 00:00:00'),
(751, 126, 16, 'Me gustó la vía 126, aunque algunos movimientos eran complicados.', 3, '2023-05-02 00:00:00'),
(753, 128, 16, 'La vía 128 es un desafío técnico. ¡Pero gratificante!', 4, '2023-05-12 00:00:00'),
(754, 129, 9, 'Subir la vía 129 fue un gran logro. ¡Una experiencia impresionante!', 4, '2023-10-19 00:00:00'),
(755, 130, 16, 'La vía 130 es un reto para escaladores experimentados. ¡Una aventura!', 4, '2023-11-30 00:00:00'),
(758, 133, 9, 'La vía 133 ofrece un emocionante ascenso. ¡Una experiencia única!', 4, '2023-03-03 00:00:00'),
(759, 134, 16, 'Subir la vía 134 es un logro personal. ¡Muy satisfecho!', 4, '2023-02-09 00:00:00'),
(760, 135, 9, 'La vía 135 es un reto técnico. ¡Una experiencia asombrosa!', 4, '2023-01-13 00:00:00'),
(761, 136, 16, 'La vía 136 es un lugar impresionante para escalar. ¡Lo recomiendo!', 5, '2023-11-07 00:00:00'),
(762, 137, 9, 'La vía 137 es un desafío emocionante. ¡Increíble escalada!', 5, '2023-02-25 00:00:00'),
(763, 138, 16, 'Me sentí muy bien al superar los obstáculos de la vía 138.', 4, '2023-03-15 00:00:00'),
(764, 139, 9, 'La vía 139 es perfecta para escaladores avanzados. ¡Una aventura!', 5, '2023-07-20 00:00:00'),
(765, 140, 16, 'Me gustó la vía 140. Los movimientos son interesantes.', 4, '2023-02-23 00:00:00'),
(766, 141, 9, 'La vía 141 es un lugar impresionante para aprender a escalar.', 4, '2023-01-30 00:00:00'),
(768, 143, 9, 'Disfruté de la vía 143, aunque algunos pasos eran desafiantes.', 3, '2023-12-20 00:00:00'),
(769, 144, 16, 'La vía 144 ofrece una gran vista panorámica. ¡Vale la pena subirla!', 4, '2023-08-08 00:00:00'),
(770, 145, 9, 'La vía 145 es un buen lugar para mejorar tus habilidades.', 4, '2023-02-08 00:00:00'),
(772, 147, 9, 'Subir la vía 147 fue un gran logro personal. ¡Muy satisfecho!', 4, '2023-09-19 00:00:00'),
(932, 270, 16, 'Me sentí muy bien al superar los desafíos de la vía 270.', 4, '2023-04-09 00:00:00'),
(971, 336, 16, 'La vía 336 ofrece una vista espectacular desde la cima. ¡Una maravilla!', 5, '2023-03-13 00:00:00'),
(972, 339, 9, 'Disfruté de la vía 339, aunque algunos pasos eran desafiantes.', 3, '2023-03-05 00:00:00'),
(973, 342, 16, 'La vía 342 ofrece una gran vista panorámica. ¡Vale la pena subirla!', 4, '2023-04-13 00:00:00'),
(974, 345, 9, 'La vía 345 es un buen lugar para mejorar tus habilidades.', 4, '2023-11-20 00:00:00'),
(976, 351, 9, 'Subir la vía 351 fue un gran logro personal. ¡Muy satisfecho!', 4, '2023-08-02 00:00:00'),
(977, 354, 16, 'La vía 354 es desafiante y emocionante. ¡La escalada es genial!', 5, '2023-04-07 00:00:00'),
(978, 357, 9, 'Me encantó la vía 357. Los movimientos son muy interesantes.', 5, '2023-07-28 00:00:00'),
(979, 81, 9, 'Las chapas estan muy iunseguras', 3, '2023-01-24 00:00:00'),
(980, 81, 17, 'No me gusto la via esta muy vieja', 2, '2023-08-08 00:00:00'),
(1011, 1, 19, 'Excelente ruta de escalada con una gran variedad de agarres y desafíos técnicos. ¡Me encantó!', 5, '2023-10-29 11:02:50'),
(1012, 1, 20, 'La ruta es decente, pero algunos agarres podrían estar mejor colocados.', 3, '2023-10-30 12:15:30'),
(1013, 1, 21, 'Disfruté escalando esta ruta. Los agarres son buenos y el nivel de dificultad es adecuado.', 4, '2023-10-31 13:28:10'),
(1014, 2, 22, 'Esta ruta ofrece una vista impresionante desde la cima. ¡Vale totalmente la pena el esfuerzo!', 5, '2023-11-01 14:40:50'),
(1015, 2, 23, 'La ruta es un poco larga pero la vista en la cima hace que valga la pena.', 4, '2023-11-02 15:53:30'),
(1016, 2, 24, 'El servicio en esta ruta es bueno pero los agarres podrían estar mejor.', 3, '2023-11-03 17:06:10'),
(1017, 3, 25, 'Esta ruta tiene un nivel de dificultad adecuado y el personal es muy amable.', 4, '2023-11-04 00:00:00'),
(1018, 4, 19, 'La ruta es desafiante pero gratificante. ¡Definitivamente volvería a escalarla!', 5, '2023-11-05 18:19:30'),
(1019, 4, 20, 'La ruta es decente, pero podría beneficiarse de más variedad en los agarres.', 3, '2023-11-06 19:32:10'),
(1020, 4, 21, 'Disfruté escalando esta ruta. Los agarres son buenos y el nivel de dificultad es justo.', 4, '2023-11-07 20:44:50'),
(1021, 5, 22, 'Esta ruta ofrece una vista impresionante desde la cima. ¡Vale totalmente la pena el esfuerzo!', 5, '2023-11-08 21:57:30'),
(1022, 5, 23, 'La ruta es un poco larga pero la vista en la cima hace que valga la pena.', 4, '2023-11-09 23:10:10'),
(1023, 5, 24, 'El servicio en esta ruta es bueno pero los agarres podrían estar mejor.', 3, '2023-11-10 00:22:50'),
(1024, 6, 25, 'Esta ruta tiene un nivel de dificultad adecuado y el personal es muy amable.', 4, '2023-11-11 01:35:30'),
(1025, 6, 26, 'Impresionante vista panorámica durante todo el viaje. ¡Vale totalmente la pena el esfuerzo!', 5, '2023-11-12 02:48:10'),
(1026, 6, 27, 'La ruta es un poco larga pero la vista en la cima hace que valga la pena.', 4, '2023-11-13 04:00:50'),
(1027, 7, 28, 'Buen servicio pero los asientos eran un poco incómodos.', 3, '2023-11-14 05:13:30'),
(1028, 7, 19, 'El viaje fue cómodo y el personal muy amable.', 4, '2023-11-15 06:26:10'),
(1029, 7, 20, 'Impresionante vista panorámica durante todo el viaje.', 5, '2023-11-16 07:38:50'),
(1030, 8, 21, 'El viaje fue largo pero valió la pena por el destino.', 4, '2023-11-17 08:51:30'),
(1031, 8, 22, 'Buen servicio pero los asientos eran un poco incómodos.', 3, '2023-11-18 10:04:10'),
(1032, 8, 23, 'El viaje fue cómodo y el personal muy amable.', 4, '2023-11-19 11:16:50'),
(1033, 9, 24, 'Impresionante vista panorámica durante todo el viaje.', 5, '2023-11-20 12:29:30'),
(1034, 9, 25, 'El viaje fue largo pero valió la pena por el destino.', 4, '2023-11-21 13:42:10'),
(1035, 9, 26, 'Buen servicio pero los asientos eran un poco incómodos.', 3, '2023-11-22 00:00:00'),
(1036, 10, 27, 'El viaje fue cómodo y el personal muy amable.', 4, '2023-11-23 14:54:50'),
(1037, 10, 28, 'Impresionante vista panorámica durante todo el viaje.', 5, '2023-11-24 16:07:30'),
(1038, 10, 19, 'La ruta es un poco larga pero la vista en la cima hace que valga la pena.', 4, '2023-11-25 17:20:10'),
(1039, 11, 20, 'Buen servicio pero los asientos eran un poco incómodos.', 3, '2023-11-26 18:32:50'),
(1040, 11, 21, 'El viaje fue cómodo y el personal muy amable.', 4, '2023-11-27 19:45:30'),
(1041, 11, 22, 'Impresionante vista panorámica durante todo el viaje.', 5, '2023-11-28 20:58:10'),
(1042, 12, 23, 'La ruta es un poco larga pero la vista en la cima hace que valga la pena.', 4, '2023-11-29 22:10:50'),
(1043, 12, 24, 'Buen servicio pero los asientos eran un poco incómodos.', 3, '2023-11-30 23:23:30'),
(1044, 12, 25, 'El viaje fue cómodo y el personal muy amable.', 4, '2023-12-01 00:36:10'),
(1045, 13, 26, 'Impresionante vista panorámica durante todo el viaje.', 5, '2023-12-02 01:48:50'),
(1046, 13, 27, 'La ruta es un poco larga pero la vista en la cima hace que valga la pena.', 4, '2023-12-03 00:00:00'),
(1047, 14, 28, 'Buen servicio pero los asientos eran un poco incómodos.', 3, '2023-12-04 02:01:30'),
(1048, 14, 19, 'El viaje fue cómodo y el personal muy amable.', 4, '2023-12-05 03:14:10'),
(1049, 14, 20, 'Impresionante vista panorámica durante todo el viaje.', 5, '2023-12-06 04:26:50'),
(1050, 15, 21, 'La ruta es un poco larga pero la vista en la cima hace que valga la pena.', 4, '2023-12-07 05:39:30'),
(1051, 15, 22, 'Buen servicio pero los asientos eran un poco incómodos.', 3, '2023-12-08 06:52:10'),
(1052, 15, 23, 'El viaje fue cómodo y el personal muy amable.', 4, '2023-12-09 08:04:50'),
(1053, 16, 24, 'Impresionante vista panorámica durante todo el viaje.', 5, '2023-12-10 09:17:30'),
(1054, 16, 25, 'La ruta es un poco larga pero la vista en la cima hace que valga la pena.', 4, '2023-12-11 00:00:00'),
(1055, 17, 26, 'Buen servicio pero los asientos eran un poco incómodos.', 3, '2023-12-12 10:30:10'),
(1056, 17, 27, 'El viaje fue cómodo y el personal muy amable.', 4, '2023-12-13 11:42:50'),
(1057, 17, 28, 'Impresionante vista panorámica durante todo el viaje.', 5, '2023-12-14 12:55:30'),
(1058, 18, 19, 'La ruta es un poco larga pero la vista en la cima hace que valga la pena.', 4, '2023-12-15 14:08:10'),
(1059, 18, 20, 'Buen servicio pero los asientos eran un poco incómodos.', 3, '2023-12-16 15:20:50'),
(1060, 18, 21, 'El viaje fue cómodo y el personal muy amable.', 4, '2023-12-17 16:33:30'),
(1061, 19, 22, 'Impresionante vista panorámica durante todo el viaje.', 5, '2023-12-18 17:46:10'),
(1062, 19, 23, 'La ruta es un poco larga pero la vista en la cima hace que valga la pena.', 4, '2023-12-19 00:00:00'),
(1063, 19, 24, 'Buen servicio pero los asientos eran un poco incómodos.', 3, '2023-12-20 20:11:30'),
(1064, 20, 25, 'El viaje fue cómodo y el personal muy amable.', 4, '2023-12-21 21:24:10'),
(1065, 20, 26, 'Impresionante vista panorámica durante todo el viaje.', 5, '2023-12-22 22:36:50'),
(1066, 20, 27, 'La ruta es un poco larga pero la vista en la cima hace que valga la pena.', 4, '2023-12-23 23:49:30'),
(1067, 21, 28, 'Buen servicio pero los asientos eran un poco incómodos.', 3, '2023-12-24 01:02:10'),
(1068, 21, 19, 'El viaje fue cómodo y el personal muy amable.', 4, '2023-12-25 02:14:50'),
(1069, 21, 20, 'Impresionante vista panorámica durante todo el viaje.', 5, '2023-12-26 03:27:30'),
(1070, 22, 21, 'La ruta es un poco larga pero la vista en la cima hace que valga la pena.', 4, '2023-12-27 04:40:10'),
(1071, 22, 22, 'Buen servicio pero los asientos eran un poco incómodos.', 3, '2023-12-28 05:52:50'),
(1072, 22, 23, 'El viaje fue cómodo y el personal muy amable.', 4, '2023-12-29 07:05:30'),
(1073, 23, 24, 'Impresionante vista panorámica durante todo el viaje.', 5, '2023-12-30 08:18:10'),
(1074, 23, 25, 'La ruta es un poco larga pero la vista en la cima hace que valga la pena.', 4, '2023-12-31 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sectores`
--

CREATE TABLE `sectores` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `latitud` double NOT NULL,
  `longitud` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sectores`
--

INSERT INTO `sectores` (`id`, `nombre`, `latitud`, `longitud`) VALUES
(1, 'Valle de Pancanta', -32.929002540867835, -66.08492063477838),
(2, 'Villa del Cármen', -32.93839215798386, -65.00641499665913),
(3, 'Alpa Corral', -32.638895388870566, -64.73466516188388),
(4, 'Casa de Piedra', -32.3510091382376, -64.94562154679592),
(5, 'La Torrecita', -33.09838491635877, -65.00767052666792),
(6, 'Los Hornillos', -31.879912766154533, -64.95507386466396),
(7, 'La Ola', -31.641883989969717, -64.89566810606972),
(8, 'Cueva de las Brujas', -32.090028322564756, -64.43707357467062),
(9, 'Copina', -31.524245044640246, -64.70556611675585),
(10, 'La Cantera', -31.62878718978761, -64.46626104021182),
(11, 'Vuelo del Cóndor', -31.675954382645855, -64.89415844773536);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sesiones`
--

CREATE TABLE `sesiones` (
  `id` int(11) NOT NULL,
  `idVia` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `porcentaje` double NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sesiones`
--

INSERT INTO `sesiones` (`id`, `idVia`, `idUsuario`, `porcentaje`, `fecha`) VALUES
(1, 38, 9, 80, '2023-10-24 00:26:48'),
(2, 38, 9, 100, '2023-10-24 00:26:48'),
(3, 39, 9, 100, '2023-10-24 00:26:48'),
(4, 46, 9, 50, '2023-10-24 00:26:48'),
(5, 46, 9, 100, '2023-10-24 00:26:48'),
(6, 47, 9, 80, '2023-10-24 00:26:48'),
(7, 60, 9, 100, '2023-10-24 00:26:48'),
(8, 63, 9, 70, '2023-10-24 00:26:48'),
(9, 71, 9, 100, '2023-10-24 00:26:48'),
(10, 72, 9, 100, '2023-10-24 00:26:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos`
--

CREATE TABLE `tipos` (
  `id` int(11) NOT NULL,
  `tipo` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipos`
--

INSERT INTO `tipos` (`id`, `tipo`) VALUES
(1, 'Onsight'),
(2, 'Flash'),
(3, 'Redpoint'),
(4, 'TopRope');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(11) NOT NULL,
  `apellido` varchar(11) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `clave` varchar(250) NOT NULL,
  `avatar` varchar(250) NOT NULL,
  `google` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `apellido`, `correo`, `clave`, `avatar`, `google`) VALUES
(9, 'juan', 'Pérez ', 'juan@mail.com', 'myl4T6FgkMUdldPQ96rZUnNYn0ho5fyVIc39WWFLd8Y=', 'uploads/avatars/img_avatar_9.jpg', 0),
(16, 'Marco', 'Silva', 'nelsonmarcosilva@gmail.com', 'TaU/layhFhl+NkpAAgEL5ahTo/n0+CxQe63cYkNXtsE=', 'uploads/avatars/img_avatar_16.jpg', 1),
(17, 'Marco', 'Silva', 'lacasitamerlo@gmail.com', 'sk9YFmwRbGJ57Mzim+uIOpk8DK+2ov6VugZarPslm78=', 'uploads/avatars/img_avatar_17.jpg', 1),
(18, 'Marco', 'Silva', 'mailpruebalab3@gmail.com', 'KZ13g06g59BKg8Uk6KMTxHeUGXrZ0yZH7rkwm24hHPE=', 'uploads/avatars/img_avatar_18.jpg', 1),
(19, 'Rocio', 'Diaz', 'rocio@gmail.com', 'myl4T6FgkMUdldPQ96rZUnNYn0ho5fyVIc39WWFLd8Y=', 'uploads/avatars/img_avatar_19.jpg', 0),
(20, 'María', 'López', 'maria@gmail.com', 'myl4T6FgkMUdldPQ96rZUnNYn0ho5fyVIc39WWFLd8Y=', 'uploads/avatars/img_avatar_20.jpg', 0),
(21, 'Carlos', 'González', 'carlos@gmail.com', 'myl4T6FgkMUdldPQ96rZUnNYn0ho5fyVIc39WWFLd8Y=', 'uploads/avatars/img_avatar_21.jpg', 0),
(22, 'Laura', 'Martínez', 'laura@gmail.com', 'myl4T6FgkMUdldPQ96rZUnNYn0ho5fyVIc39WWFLd8Y=', 'uploads/avatars/img_avatar_22.jpg', 0),
(23, 'Pedro', 'Rodríguez', 'pedro@gmail.com', 'myl4T6FgkMUdldPQ96rZUnNYn0ho5fyVIc39WWFLd8Y=', 'uploads/avatars/img_avatar_23.jpg', 0),
(24, 'Ana', 'Sánchez', 'ana@gmail.com', 'myl4T6FgkMUdldPQ96rZUnNYn0ho5fyVIc39WWFLd8Y=', 'uploads/avatars/img_avatar_24.jpg', 0),
(25, 'Luis', 'Fernández', 'luis@gmail.com', 'myl4T6FgkMUdldPQ96rZUnNYn0ho5fyVIc39WWFLd8Y=', 'uploads/avatars/img_avatar_25.jpg', 0),
(26, 'Elena', 'Díaz', 'elena@gmail.com', 'myl4T6FgkMUdldPQ96rZUnNYn0ho5fyVIc39WWFLd8Y=', 'uploads/avatars/img_avatar_26.jpg', 0),
(27, 'Javier', 'Hernández', 'javier@gmail.com', 'myl4T6FgkMUdldPQ96rZUnNYn0ho5fyVIc39WWFLd8Y=', 'uploads/avatars/img_avatar_27.jpg', 0),
(28, 'Sara', 'Torres', 'sara@gmail.com', 'myl4T6FgkMUdldPQ96rZUnNYn0ho5fyVIc39WWFLd8Y=', 'uploads/avatars/img_avatar_28.jpg', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vias`
--

CREATE TABLE `vias` (
  `id` int(11) NOT NULL,
  `idZona` int(11) NOT NULL,
  `idEstilo` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `idGrado` int(11) NOT NULL,
  `chapas` int(11) NOT NULL,
  `altura` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `vias`
--

INSERT INTO `vias` (`id`, `idZona`, `idEstilo`, `nombre`, `idGrado`, `chapas`, `altura`) VALUES
(1, 1, 1, 'La cortita', 6, 4, 6),
(2, 1, 1, 'Ni mate', 3, 6, 11),
(3, 1, 3, 'Los cara norte', 2, 8, 11),
(4, 1, 1, 'San Gri-Gri', 6, 8, 12),
(5, 1, 1, 'Gancho perfecto', 9, 10, 12),
(6, 1, 3, '¡Vieja devolveme la batería!', 4, 8, 18),
(7, 1, 1, 'Guacho paragua', 6, 8, 17),
(8, 1, 3, 'Proyectorchs', 4, 7, 15),
(9, 1, 3, 'Metele que son pasteles', 4, 5, 8),
(10, 1, 1, 'El último amor paraguayo', 4, 6, 8),
(11, 1, 1, 'La gargolita', 4, 7, 8),
(12, 1, 3, 'Vía 13', 1, 8, 9),
(13, 2, 3, 'Camino al cielo', 1, 11, 18),
(14, 2, 1, 'La durita', 8, 6, 10),
(15, 2, 1, 'El clavito', 8, 7, 12),
(16, 2, 1, 'Los comienzos', 9, 8, 12),
(17, 2, 1, 'La vaca y el pollito', 8, 7, 12),
(18, 2, 1, 'Nooo che!', 6, 6, 12),
(19, 2, 1, 'Cortocircuito', 13, 10, 16),
(20, 2, 1, 'Jamón del medio', 13, 8, 16),
(21, 2, 2, 'Jamón crudo', 16, 12, 16),
(22, 2, 2, 'Cagó la máquina', 16, 8, 12),
(23, 2, 1, '¡Pará de sufrir!', 20, 6, 9),
(24, 3, 2, 'El mal del local', 10, 5, 9),
(25, 3, 2, 'A disfrutarla', 14, 7, 12),
(26, 3, 2, 'Popeye el marino', 17, 9, 15),
(27, 3, 2, 'Gatito', 8, 8, 17),
(28, 3, 2, 'Ruda-dura', 16, 7, 11),
(29, 3, 2, 'El tercer viaje', 17, 7, 15),
(30, 3, 2, 'La encontré', 17, 7, 15),
(31, 3, 2, 'Assssaaa', 17, 7, 17),
(32, 3, 1, '¿Qué pasó?', 15, 7, 18),
(33, 3, 2, 'Con lo que encontré', 13, 7, 17),
(34, 3, 2, 'Lindo lugar.. ¿no?', 13, 6, 17),
(35, 4, 1, 'Via 1', 8, 6, 8),
(36, 4, 1, 'Quet donin pel cul', 9, 4, 8),
(37, 4, 1, 'Vía 3', 7, 4, 8),
(38, 4, 1, '6 varas y media', 6, 6, 8),
(39, 4, 1, 'Pasito a pasito', 6, 6, 8),
(40, 4, 2, 'Manos de manteca', 10, 5, 8),
(41, 5, 1, 'Durita es poco', 11, 7, 12),
(42, 5, 1, 'Directo al cenit', 9, 7, 12),
(43, 5, 1, 'Mi pequeño paraíso', 7, 8, 12),
(44, 12, 3, 'Chapa y sigue', 3, 7, 20),
(45, 12, 3, 'Marcella', 3, 8, 20),
(46, 6, 1, 'Reventando mecha', 7, 6, 8),
(47, 6, 2, 'Gorila Stone', 7, 7, 12),
(48, 6, 2, 'Debilidades manifiestas', 8, 6, 12),
(49, 7, 3, 'Primeros pasos de Abril', 1, 7, 15),
(56, 8, 3, 'La madre de José', 3, 8, 20),
(57, 8, 3, 'Trancas', 3, 7, 20),
(58, 8, 3, 'Barrancas', 3, 7, 20),
(59, 8, 1, 'Hare Krishna', 8, 8, 20),
(60, 8, 1, 'Sol de invierno', 7, 8, 15),
(61, 9, 1, 'Supermegaway', 4, 6, 10),
(62, 9, 1, 'Son cosas mías ', 7, 6, 10),
(63, 9, 1, 'Rasguña las piedras', 7, 6, 10),
(68, 10, 2, 'Danza imperial', 10, 6, 18),
(69, 10, 1, 'Refugio dominguero', 8, 6, 18),
(70, 10, 3, 'Cuarto intermedio ', 3, 7, 18),
(71, 10, 2, 'Noche de chamamé.. Ayayayyy', 14, 6, 15),
(72, 11, 1, 'É lo que hay', 4, 6, 10),
(73, 11, 1, 'Tira pararriba', 8, 7, 15),
(74, 11, 1, 'Mamón hijo puta cabrón', 9, 5, 15),
(75, 11, 1, 'La polenta hace puf puf', 7, 6, 15),
(76, 11, 1, 'Dale que no muerde', 9, 6, 15),
(77, 11, 1, 'Escapistas del espacio', 8, 6, 15),
(79, 16, 3, 'Via 2', 3, 6, 15),
(80, 16, 2, 'Me la dijo un amigo', 8, 8, 13),
(81, 16, 2, 'El techo de los muertos', 13, 8, 10),
(82, 16, 2, 'Que siga la fiesta', 11, 6, 8),
(83, 16, 1, 'Descomposición compuesta', 4, 6, 8),
(84, 16, 2, 'Chinche Molle', 10, 7, 9),
(85, 16, 2, 'El desplome rebelde', 8, 8, 8),
(86, 16, 2, 'Un día libre', 11, 7, 10),
(87, 16, 2, 'El estreno de Milwoking', 14, 7, 9),
(90, 16, 1, 'Tosiendo', 3, 7, 10),
(91, 17, 1, 'Muy buena tu salida', 9, 7, 8),
(92, 17, 1, 'Mariposa traicionera', 4, 8, 6),
(93, 17, 1, 'Toma vegetal', 7, 11, 13),
(94, 17, 1, 'Hilando fino', 7, 9, 13),
(95, 17, 3, 'La pionera', 3, 9, 13),
(96, 17, 1, 'El chaguar', 8, 8, 13),
(97, 17, 1, 'Las dos chapas', 7, 8, 12),
(98, 17, 1, 'La psicológica', 4, 8, 10),
(99, 28, 1, 'Los héroes nunca mueren', 14, 8, 10),
(100, 28, 1, 'El fuego interior', 11, 8, 12),
(101, 18, 1, 'Tequila en la roca', 9, 6, 10),
(102, 18, 1, 'Reality show', 13, 7, 10),
(103, 29, 1, 'Camino a la Cima', 10, 7, 19),
(104, 29, 2, 'Roca Desafiante', 13, 9, 22),
(105, 29, 3, 'Aventura Vertical', 15, 11, 25),
(106, 30, 1, 'Pared en Ascenso', 14, 8, 21),
(107, 30, 2, 'Ruta del Coraje', 16, 10, 24),
(108, 30, 3, 'Risco Intrépido', 18, 12, 27),
(109, 31, 1, 'Pico Majestuoso', 13, 9, 20.5),
(110, 31, 2, 'Ruta en Granito', 15, 11, 22),
(111, 31, 3, 'Desafío Aéreo', 18, 10, 24.5),
(112, 32, 1, 'Cresta Emocionante', 14, 10, 26),
(113, 32, 2, 'Ruta Vertical', 16, 12, 28),
(114, 32, 3, 'Pared del Valor', 19, 9, 25.5),
(115, 33, 1, 'Cumbre Desafiante', 15, 11, 30),
(116, 33, 2, 'Pared Escarpada', 17, 13, 28.5),
(117, 33, 3, 'Ruta en Rocas', 20, 12, 32),
(118, 34, 1, 'Pared Vertical', 16, 9, 24),
(119, 34, 2, 'Ruta Extrema', 19, 15, 26.5),
(120, 34, 3, 'Ruta del Alba', 21, 11, 29),
(121, 35, 1, 'Cresta en lo Alto', 18, 12, 28),
(122, 35, 2, 'Pared del Desafío', 20, 14, 30.5),
(124, 36, 1, 'Pico de la Aventura', 19, 11, 26.5),
(125, 36, 2, 'Ruta en la Cima', 21, 16, 29),
(126, 36, 3, 'Ruta Escarpada', 23, 12, 31.5),
(128, 37, 2, 'Pared de la Cumbre', 22, 17, 35),
(129, 37, 3, 'Ruta del Desafío', 24, 14, 37.5),
(130, 38, 1, 'Cresta en el Cielo', 22, 15, 34),
(133, 39, 1, 'Ruta de las Agujas', 23, 16, 37),
(134, 39, 2, 'Cresta en la Cima', 25, 19, 39.5),
(135, 39, 3, 'Desafío en lo Alto', 27, 17, 42),
(136, 40, 1, 'Pared del Coraje', 24, 18, 38),
(137, 40, 2, 'Camino al Desafío', 26, 20, 41),
(138, 40, 3, 'Ruta en las Nubes', 28, 18, 44),
(139, 41, 1, 'Desafío Vertical', 25, 20, 40),
(140, 41, 2, 'Ruta de la Aventura', 27, 21, 43),
(141, 41, 3, 'Pico del Coraje', 29, 19, 46),
(143, 42, 2, 'Cresta en las Nubes', 28, 23, 45),
(144, 42, 3, 'Pared del Amanecer', 30, 20, 48),
(145, 43, 1, 'Cresta en el Amanecer', 27, 23, 44),
(147, 43, 3, 'Ruta en lo Alto', 31, 21, 50),
(270, 38, 3, 'Pared de la Aventura', 26, 16, 39),
(334, 44, 1, 'Ruta en el Amanecer', 9, 25, 46),
(335, 44, 2, 'Cresta del Desafío', 12, 26, 49),
(336, 44, 3, 'Pared del Aventurero', 30, 22, 52),
(338, 45, 2, 'Ruta de lo Imposible', 21, 28, 51),
(339, 45, 3, 'Desafío Extremo', 6, 23, 54),
(340, 46, 1, 'Ruta de lo Inexplorado', 29, 28, 50),
(341, 46, 2, 'Cresta en la Cumbre', 1, 30, 53),
(342, 46, 3, 'Pared de la Hazaña', 13, 24, 56),
(343, 47, 1, 'Desafío en la Cumbre', 29, 29, 52),
(344, 47, 2, 'Pared de la Exploración', 14, 31, 55),
(345, 47, 3, 'Ruta en la Hazaña', 13, 25, 58),
(346, 48, 1, 'Pico de la Exploración', 22, 30, 54),
(347, 48, 2, 'Ruta en lo Desconocido', 7, 32, 57),
(349, 19, 1, 'Ruta Amanecer', 20, 12, 28),
(351, 20, 1, 'Ruta de la Montaña', 13, 14, 30),
(353, 21, 1, 'Camino en las Nubes', 3, 16, 32),
(354, 21, 2, 'Ruta del Alpinista', 5, 18, 35),
(355, 22, 1, 'Pared del Cielo', 17, 19, 36),
(356, 22, 2, 'Ruta en las Alturas', 8, 20, 38),
(357, 23, 1, 'Cresta Aérea', 19, 20, 38),
(359, 24, 1, 'Pico Extremo', 23, 23, 40),
(363, 26, 1, 'Camino en las Alturas', 20, 27, 45),
(365, 27, 1, 'Cresta del Alpinista', 24, 28, 48);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zonas`
--

CREATE TABLE `zonas` (
  `id` int(11) NOT NULL,
  `idSector` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `zonas`
--

INSERT INTO `zonas` (`id`, `idSector`, `nombre`) VALUES
(1, 1, 'De la Ruta / Cara sudeste'),
(2, 1, 'La Vieja Escuela / Cara noroeste'),
(3, 1, 'El Desplome / Cara noroeste'),
(4, 2, 'Bloque de Acampe'),
(5, 2, 'Piedra Blanca '),
(6, 2, 'Gorila Stone'),
(7, 2, 'La Rampa '),
(8, 2, 'Aguja del Topo '),
(9, 2, 'Placa del Topo '),
(10, 2, 'Aguja Escondida '),
(11, 2, 'La Placa de Ganesha'),
(12, 2, 'El Erecto'),
(16, 4, 'Casa de Piedra'),
(17, 4, 'La Pionera'),
(18, 4, 'Tequila'),
(19, 3, 'Vaca Muerta'),
(20, 3, 'La Bomba'),
(21, 3, 'Panal'),
(22, 3, 'Rio Arriva'),
(23, 5, 'Zona Unica'),
(24, 6, 'Zona Unica'),
(25, 7, 'Mogote de las Estrellas'),
(26, 7, 'Ultimo Sol de Marzo'),
(27, 11, 'Zona Unica'),
(28, 4, 'Los Heroes'),
(29, 5, 'Roca Firme'),
(30, 5, 'Pared del Cielo'),
(31, 5, 'Cumbre de Aventura'),
(32, 6, 'Monte Vertical'),
(33, 6, 'Pico de Ascenso'),
(34, 6, 'Agujas de Granito'),
(35, 7, 'Escalada Épica'),
(36, 7, 'Pared de Desafíos'),
(37, 7, 'Riscos Salvajes'),
(38, 8, 'Rocas Majestuosas'),
(39, 8, 'Loma de la Adrenalina'),
(40, 8, 'Rocas Alpinas'),
(41, 9, 'Montaña de los Valientes'),
(42, 9, 'Desfiladero del Coraje'),
(43, 9, 'Cima del Valor'),
(44, 10, 'Crag Escarpado'),
(45, 10, 'Cresta Intrépida'),
(46, 10, 'Roca de la Libertad'),
(47, 11, 'Pico del Entusiasmo'),
(48, 11, 'Vertiginosa Aventura');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ascensos`
--
ALTER TABLE `ascensos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUsuario5_fk` (`idUsuario`),
  ADD KEY `idSesion_fk` (`idSesion`),
  ADD KEY `idTipo_fk` (`idTipo`);

--
-- Indices de la tabla `estilos`
--
ALTER TABLE `estilos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `favoritos`
--
ALTER TABLE `favoritos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idVia2_fk` (`idVia`),
  ADD KEY `idUsuario2_fk` (`idUsuario`);

--
-- Indices de la tabla `fotos`
--
ALTER TABLE `fotos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `idVia` (`idVia`);

--
-- Indices de la tabla `grados`
--
ALTER TABLE `grados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `resenias`
--
ALTER TABLE `resenias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUsuario4_fk` (`idUsuario`),
  ADD KEY `idVia4_fk` (`idVia`);

--
-- Indices de la tabla `sectores`
--
ALTER TABLE `sectores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sesiones`
--
ALTER TABLE `sesiones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idVia3_fk` (`idVia`),
  ADD KEY `idUsuario3_fk` (`idUsuario`);

--
-- Indices de la tabla `tipos`
--
ALTER TABLE `tipos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `vias`
--
ALTER TABLE `vias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idZona_fk` (`idZona`),
  ADD KEY `idEstilo_fk` (`idEstilo`),
  ADD KEY `idGrado_fk` (`idGrado`);

--
-- Indices de la tabla `zonas`
--
ALTER TABLE `zonas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_sector_fk` (`idSector`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ascensos`
--
ALTER TABLE `ascensos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `estilos`
--
ALTER TABLE `estilos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `favoritos`
--
ALTER TABLE `favoritos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `fotos`
--
ALTER TABLE `fotos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT de la tabla `grados`
--
ALTER TABLE `grados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `resenias`
--
ALTER TABLE `resenias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1075;

--
-- AUTO_INCREMENT de la tabla `sectores`
--
ALTER TABLE `sectores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `sesiones`
--
ALTER TABLE `sesiones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tipos`
--
ALTER TABLE `tipos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `vias`
--
ALTER TABLE `vias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=369;

--
-- AUTO_INCREMENT de la tabla `zonas`
--
ALTER TABLE `zonas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ascensos`
--
ALTER TABLE `ascensos`
  ADD CONSTRAINT `idSesion_fk` FOREIGN KEY (`idSesion`) REFERENCES `sesiones` (`id`),
  ADD CONSTRAINT `idTipo_fk` FOREIGN KEY (`idTipo`) REFERENCES `tipos` (`id`),
  ADD CONSTRAINT `idUsuario5_fk` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `favoritos`
--
ALTER TABLE `favoritos`
  ADD CONSTRAINT `idUsuario2_fk` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `idVia2_fk` FOREIGN KEY (`idVia`) REFERENCES `vias` (`id`);

--
-- Filtros para la tabla `fotos`
--
ALTER TABLE `fotos`
  ADD CONSTRAINT `idUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `idVia` FOREIGN KEY (`idVia`) REFERENCES `vias` (`id`);

--
-- Filtros para la tabla `resenias`
--
ALTER TABLE `resenias`
  ADD CONSTRAINT `idUsuario4_fk` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `idVia4_fk` FOREIGN KEY (`idVia`) REFERENCES `vias` (`id`);

--
-- Filtros para la tabla `sesiones`
--
ALTER TABLE `sesiones`
  ADD CONSTRAINT `idUsuario3_fk` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `idVia3_fk` FOREIGN KEY (`idVia`) REFERENCES `vias` (`id`);

--
-- Filtros para la tabla `vias`
--
ALTER TABLE `vias`
  ADD CONSTRAINT `idEstilo_fk` FOREIGN KEY (`idEstilo`) REFERENCES `estilos` (`id`),
  ADD CONSTRAINT `idGrado_fk` FOREIGN KEY (`idGrado`) REFERENCES `grados` (`id`),
  ADD CONSTRAINT `idZona_fk` FOREIGN KEY (`idZona`) REFERENCES `zonas` (`id`);

--
-- Filtros para la tabla `zonas`
--
ALTER TABLE `zonas`
  ADD CONSTRAINT `id_sector_fk` FOREIGN KEY (`idSector`) REFERENCES `sectores` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
