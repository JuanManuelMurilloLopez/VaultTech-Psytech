-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-04-2025 a las 19:48:50
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `psytech`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegistrarAspiranteEnGrupo` (IN `uUsuario` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci, IN `uNombreUsuario` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci, IN `uApellidoPaterno` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci, IN `uApellidoMaterno` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci, IN `uCorreo` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci, IN `uLada` VARCHAR(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci, IN `uNumeroTelefono` VARCHAR(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci, IN `uNombreRol` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci, IN `uInstitucionProcedencia` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci, IN `uIdPais` VARCHAR(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci, IN `uIdEstado` VARCHAR(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci, IN `uIdGrupo` VARCHAR(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci)   BEGIN
    INSERT INTO usuarios
    VALUES (
        uuid(),
        uUsuario,
        1,
        uNombreUsuario,
        uApellidoPaterno,
        uApellidoMaterno,
        uCorreo,
        uLada,
        uNumeroTelefono,
        (
            SELECT idRol
            FROM roles
            WHERE nombreRol = uNombreRol
        )
    );

    INSERT INTO aspirantes
    VALUES (
        uuid(),
        (
            SELECT idUsuario
            FROM usuarios
            WHERE usuario = uUsuario
        ),
        uInstitucionProcedencia,
        uIdPais,
        uIdEstado,
        null,
        null
    );

    INSERT INTO gruposaspirantes
    VALUES (
        uIdGrupo,
        (
            SELECT idAspirante
            FROM aspirantes, usuarios
            WHERE aspirantes.idUsuario = usuarios.idUsuario
              AND usuarios.usuario = uUsuario
        )
    );
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `areasotis`
--

CREATE TABLE `areasotis` (
  `idAreaOtis` int,
  `nombreAreaOtis` varchar(30)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `areasotis`
--

INSERT INTO `areasotis` (`idAreaOtis`, `nombreAreaOtis`) VALUES
(1, 'Comprensión Verbal'),
(2, 'Lógica del pensamiento'),
(3, 'Comprensión Espacial'),
(4, 'Fluidez Verbal'),
(5, 'Habilidad Numérica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aspirantes`
--

CREATE TABLE `aspirantes` (
  `idAspirante` varchar(36) NOT NULL,
  `idUsuario` varchar(36) DEFAULT NULL,
  `institucionProcedencia` varchar(50) DEFAULT NULL,
  `idPais` int(11) DEFAULT NULL,
  `idEstado` int(11) DEFAULT NULL,
  `cv` varchar(255) DEFAULT NULL,
  `kardex` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `aspirantes`
--

INSERT INTO `aspirantes` (`idAspirante`, `idUsuario`, `institucionProcedencia`, `idPais`, `idEstado`, `cv`, `kardex`) VALUES
('0031317b-0a66-11f0-aa07-a0294223b12a', '0030d327-0a66-11f0-aa07-a0294223b12a', '1', 1, 1, 'cv', 'kardex'),
('03b07212-0b85-11f0-a231-047c163ab16f', '03b01b4c-0b85-11f0-a231-047c163ab16f', 'Tec de Monterrey', 15, 16, NULL, NULL),
('0f9d2929-0a08-11f0-aa07-a0294223b12a', '0f9cded4-0a08-11f0-aa07-a0294223b12a', '1', 1, 1, 'ConfirmaciÃ³n _ Viva.pdf2025-04-03', 'ConfirmaciÃ³n _ Viva.pdf2025-04-03'),
('130adcf0-0b92-11f0-a231-047c163ab16f', '130a713b-0b92-11f0-a231-047c163ab16f', '', 1, 1, NULL, NULL),
('17505dd2-0b92-11f0-a231-047c163ab16f', '130a713b-0b92-11f0-a231-047c163ab16f', '', 1, 1, NULL, NULL),
('1aaad8df-0a06-11f0-aa07-a0294223b12a', '1aaa7be7-0a06-11f0-aa07-a0294223b12a', 'Kinder', 1, 1, NULL, NULL),
('20ca725d-0a75-11f0-aa07-a0294223b12a', '20ca0765-0a75-11f0-aa07-a0294223b12a', '', 1, 1, NULL, NULL),
('26cd1eed-0a75-11f0-aa07-a0294223b12a', '26cccd94-0a75-11f0-aa07-a0294223b12a', '1', 1, 1, NULL, NULL),
('323e36a8-0acf-11f0-aa07-a0294223b12a', '20ca0765-0a75-11f0-aa07-a0294223b12a', '', 1, 1, NULL, NULL),
('39dd9664-0482-11f0-843f-10f60a355c40', '20c232ef-0482-11f0-843f-10f60a355c40', 'Universidad Nacional Autónoma de México', 15, 32, 'cv_juanlópez.pdf', 'kardex_juanlópez.pdf'),
('39dddea9-0482-11f0-843f-10f60a355c40', '20c24205-0482-11f0-843f-10f60a355c40', 'Instituto Politécnico Nacional', 15, 14, 'cv_mariaperez.pdf', 'kardex_mariaperez.pdf'),
('39dde372-0482-11f0-843f-10f60a355c40', '20c242c0-0482-11f0-843f-10f60a355c40', 'Universidad de Guadalajara', 15, 13, 'cv_carlosrodriguez.pdf', 'kardex_carlosrodriguez.pdf'),
('39dde598-0482-11f0-843f-10f60a355c40', '20c24307-0482-11f0-843f-10f60a355c40', 'Universidad Autónoma de Nuevo León', 15, 18, 'cv_lauragomez.pdf', 'kardex_lauragomez.pdf'),
('39de5c40-0482-11f0-843f-10f60a355c40', '20c24341-0482-11f0-843f-10f60a355c40', 'Benemérita Universidad Autónoma de Puebla', 15, 20, 'cv_pedrofernandez.pdf', 'kardex_pedrofernandez.pdf'),
('39de6041-0482-11f0-843f-10f60a355c40', '20c24378-0482-11f0-843f-10f60a355c40', 'Universidad de Sonora', 15, 25, 'cv_anamartinez.pdf', 'kardex_anamartinez.pdf'),
('39de6272-0482-11f0-843f-10f60a355c40', '20c243ad-0482-11f0-843f-10f60a355c40', 'Universidad Autónoma de Chihuahua', 15, 6, 'cv_luisramirez.pdf', 'kardex_luisramirez.pdf'),
('39de6468-0482-11f0-843f-10f60a355c40', '20c243df-0482-11f0-843f-10f60a355c40', 'Universidad Autónoma de Baja California', 15, 2, 'cv_sofiaramirez.pdf', 'kardex_sofiaramirez.pdf'),
('39de664d-0482-11f0-843f-10f60a355c40', '20c2441d-0482-11f0-843f-10f60a355c40', 'Universidad Autónoma de Sinaloa', 15, 24, 'cv_miguelramirez.pdf', 'kardex_miguelramirez.pdf'),
('39de6829-0482-11f0-843f-10f60a355c40', '20c244b7-0482-11f0-843f-10f60a355c40', 'Universidad Autónoma del Estado de Hidalgo', 15, 12, 'cv_elenagarcia.pdf', 'kardex_elenagarcia.pdf'),
('39de6a3b-0482-11f0-843f-10f60a355c40', '20c244eb-0482-11f0-843f-10f60a355c40', 'Universidad de Buenos Aires', 1, 32, 'cv_javierfernandez.pdf', 'kardex_javierfernandez.pdf'),
('39de6c18-0482-11f0-843f-10f60a355c40', '20c2451f-0482-11f0-843f-10f60a355c40', 'Pontificia Universidad Católica de Chile', 4, 21, 'cv_luciaramirez.pdf', 'kardex_luciaramirez.pdf'),
('39de6de6-0482-11f0-843f-10f60a355c40', '20c24a4f-0482-11f0-843f-10f60a355c40', 'Universidad de São Paulo', 2, 28, 'cv_fernandotorres.pdf', 'kardex_fernandotorres.pdf'),
('39de6fb4-0482-11f0-843f-10f60a355c40', '20c24a81-0482-11f0-843f-10f60a355c40', 'Universidad de Toronto', 3, 3, 'cv_paulalopez.pdf', 'kardex_paulalopez.pdf'),
('39de71a3-0482-11f0-843f-10f60a355c40', '20c24ab3-0482-11f0-843f-10f60a355c40', 'Universidad Nacional de Colombia', 6, 29, 'cv_ricardogarcia.pdf', 'kardex_ricardogarcia.pdf'),
('39de7374-0482-11f0-843f-10f60a355c40', '20c24ae8-0482-11f0-843f-10f60a355c40', 'Universidad de Harvard', 9, 7, 'cv_gabrielagomez.pdf', 'kardex_gabrielagomez.pdf'),
('39de7539-0482-11f0-843f-10f60a355c40', '20c24b19-0482-11f0-843f-10f60a355c40', 'Universidad de Oxford', 18, 4, 'cv_manuelramirez.pdf', 'kardex_manuelramirez.pdf'),
('39de770d-0482-11f0-843f-10f60a355c40', '20c24b4f-0482-11f0-843f-10f60a355c40', 'Universidad de Tokio', 14, 23, 'cv_valeriagomez.pdf', 'kardex_valeriagomez.pdf'),
('39de7951-0482-11f0-843f-10f60a355c40', '20c24b80-0482-11f0-843f-10f60a355c40', 'Universidad de París', 10, 9, 'cv_raulgarcia.pdf', 'kardex_raulgarcia.pdf'),
('39de7b1e-0482-11f0-843f-10f60a355c40', '20c24c19-0482-11f0-843f-10f60a355c40', 'Universidad de Moscú', 19, 26, 'cv_isabelfernandez.pdf', 'kardex_isabelfernandez.pdf'),
('3c7d1bd5-0b79-11f0-a231-047c163ab16f', '3c7cb413-0b79-11f0-a231-047c163ab16f', 'Tec', 15, 10, NULL, NULL),
('3de8f84f-0a09-11f0-aa07-a0294223b12a', '3de8ae59-0a09-11f0-aa07-a0294223b12a', '1', 1, 1, NULL, NULL),
('3e3e5777-0a06-11f0-aa07-a0294223b12a', '3e3e09b3-0a06-11f0-aa07-a0294223b12a', '1', 1, 1, NULL, NULL),
('437ea42c-0a66-11f0-aa07-a0294223b12a', '0f9cded4-0a08-11f0-aa07-a0294223b12a', '1', 1, 1, NULL, NULL),
('46237b67-0a5e-11f0-aa07-a0294223b12a', '1aaa7be7-0a06-11f0-aa07-a0294223b12a', 'Kinder', 1, 1, NULL, NULL),
('518e6e7c-0a05-11f0-aa07-a0294223b12a', '518e196f-0a05-11f0-aa07-a0294223b12a', 'Kinder', 1, 1, NULL, NULL),
('5509f944-0a68-11f0-aa07-a0294223b12a', '55099067-0a68-11f0-aa07-a0294223b12a', '1', 1, 1, NULL, NULL),
('59e6c8dd-0a08-11f0-aa07-a0294223b12a', '59e5fd18-0a08-11f0-aa07-a0294223b12a', '1', 1, 1, 'ConfirmaciÃ³n _ Viva.pdf2025-04-03', 'ConfirmaciÃ³n _ Viva.pdf2025-04-03'),
('5a7afe95-0a06-11f0-aa07-a0294223b12a', '3e3e09b3-0a06-11f0-aa07-a0294223b12a', '1', 1, 1, NULL, NULL),
('5ca6e202-14a4-11f0-a774-10f60a355c40', '5ca615ab-14a4-11f0-a774-10f60a355c40', 'Tec', 1, 1, NULL, NULL),
('5f75368c-0a64-11f0-aa07-a0294223b12a', '5f74db14-0a64-11f0-aa07-a0294223b12a', '1', 1, 1, 'ConfirmaciÃ³n _ Viva.pdf2025-04-03', 'ConfirmaciÃ³n _ Viva.pdf2025-04-03'),
('69a9ad60-0a06-11f0-aa07-a0294223b12a', '69a7b366-0a06-11f0-aa07-a0294223b12a', '1', 1, 1, NULL, NULL),
('6db0089e-0f7c-11f0-aede-a0294223b12a', '6dafaa48-0f7c-11f0-aede-a0294223b12a', 'Tec de Monterrey', 1, 1, NULL, NULL),
('6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '6ee37c28-0ba6-11f0-a231-047c163ab16f', 'Tecnológico de Monterrey', 15, 21, '97ConfirmaciÃ³n _ Viva.pdf', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f504ConfirmaciÃ³n _ Viva.pdf'),
('76adbf56-0a66-11f0-aa07-a0294223b12a', '59e5fd18-0a08-11f0-aa07-a0294223b12a', '1', 1, 1, NULL, NULL),
('7b6083c2-0a67-11f0-aa07-a0294223b12a', '7b601ee2-0a67-11f0-aa07-a0294223b12a', '1', 1, 1, 'ConfirmaciÃ³n _ Viva.pdf2025-04-03', 'ConfirmaciÃ³n _ Viva.pdf2025-04-03'),
('8035bfdd-0a08-11f0-aa07-a0294223b12a', '803571ea-0a08-11f0-aa07-a0294223b12a', '1', 1, 1, NULL, NULL),
('8820c262-0a66-11f0-aa07-a0294223b12a', '803571ea-0a08-11f0-aa07-a0294223b12a', '1', 1, 1, NULL, NULL),
('8c388780-0a06-11f0-aa07-a0294223b12a', '8c38333a-0a06-11f0-aa07-a0294223b12a', '1', 1, 1, NULL, NULL),
('9c86af86-0a67-11f0-aa07-a0294223b12a', '9c865a12-0a67-11f0-aa07-a0294223b12a', '1', 1, 1, 'ConfirmaciÃ³n _ Viva.pdf2025-04-03', NULL),
('9ed2e17b-0a07-11f0-aa07-a0294223b12a', '9ed29b33-0a07-11f0-aa07-a0294223b12a', 'dasdasdf', 1, 1, NULL, NULL),
('b082516c-0a08-11f0-aa07-a0294223b12a', 'b081cf46-0a08-11f0-aa07-a0294223b12a', '1', 1, 1, NULL, NULL),
('b19b45b0-0b90-11f0-a231-047c163ab16f', 'b19b03d3-0b90-11f0-a231-047c163ab16f', 'PrepaTec', 15, 5, NULL, NULL),
('b1f6c5b6-0b75-11f0-a231-047c163ab16f', 'b1f65073-0b75-11f0-a231-047c163ab16f', 'IPN', 15, 9, NULL, NULL),
('b55dcd98-0a05-11f0-aa07-a0294223b12a', 'b55ced28-0a05-11f0-aa07-a0294223b12a', 'Kinder', 1, 1, NULL, NULL),
('b5bd3ce2-0a65-11f0-aa07-a0294223b12a', 'b5bcf41b-0a65-11f0-aa07-a0294223b12a', '1', 1, 1, NULL, NULL),
('bb8a1683-0a08-11f0-aa07-a0294223b12a', 'b081cf46-0a08-11f0-aa07-a0294223b12a', '1', 1, 1, NULL, NULL),
('beec87f1-0a08-11f0-aa07-a0294223b12a', 'beeb1379-0a08-11f0-aa07-a0294223b12a', '1', 1, 1, NULL, NULL),
('c1abd503-0a06-11f0-aa07-a0294223b12a', 'c1ab664c-0a06-11f0-aa07-a0294223b12a', 'Funciona', 1, 1, NULL, NULL),
('c20a2e1d-0a60-11f0-aa07-a0294223b12a', '3e3e09b3-0a06-11f0-aa07-a0294223b12a', '1', 1, 1, NULL, NULL),
('cd906319-0b96-11f0-a231-047c163ab16f', 'cd9004cb-0b96-11f0-a231-047c163ab16f', 'Secundaria Benito Juarez', 4, 19, NULL, NULL),
('cd963319-0b76-11f0-a231-047c163ab16f', 'cd95bda1-0b76-11f0-a231-047c163ab16f', 'UVM', 15, 21, NULL, NULL),
('d0ef009d-0a04-11f0-aa07-a0294223b12a', 'd0ee999d-0a04-11f0-aa07-a0294223b12a', 'Kinder', 1, 1, NULL, NULL),
('d27ed233-0b91-11f0-a231-047c163ab16f', 'd27e85c1-0b91-11f0-a231-047c163ab16f', 'sdf', 1, 1, NULL, NULL),
('d486ae2b-0a05-11f0-aa07-a0294223b12a', '518e196f-0a05-11f0-aa07-a0294223b12a', 'Kinder', 1, 1, NULL, NULL),
('f2479a66-0b91-11f0-a231-047c163ab16f', '20ca0765-0a75-11f0-aa07-a0294223b12a', '', 1, 1, NULL, NULL),
('f292c823-0a04-11f0-aa07-a0294223b12a', 'd0ee999d-0a04-11f0-aa07-a0294223b12a', 'Kinder', 1, 1, NULL, NULL),
('f3ae43b6-0a06-11f0-aa07-a0294223b12a', 'f3adb74f-0a06-11f0-aa07-a0294223b12a', 'Funciona', 1, 1, NULL, NULL),
('f56a152f-0b74-11f0-a231-047c163ab16f', 'f5694194-0b74-11f0-a231-047c163ab16f', 'UNAM', 15, 14, NULL, NULL),
('f9f5bb60-0b92-11f0-a231-047c163ab16f', '130a713b-0b92-11f0-a231-047c163ab16f', '', 1, 1, NULL, NULL),
('fc7b0970-0a08-11f0-aa07-a0294223b12a', 'fc7ac20e-0a08-11f0-aa07-a0294223b12a', '1', 1, 1, NULL, NULL),
('fd0a8bfb-0b91-11f0-a231-047c163ab16f', '20ca0765-0a75-11f0-aa07-a0294223b12a', '', 1, 1, NULL, NULL),
('feb54e28-0b91-11f0-a231-047c163ab16f', '20ca0765-0a75-11f0-aa07-a0294223b12a', '', 1, 1, NULL, NULL),
('ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'ffcaf075-14a4-11f0-a774-10f60a355c40', 'Tec', 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aspirantesgrupospruebas`
--

CREATE TABLE `aspirantesgrupospruebas` (
  `idGrupo` varchar(36) NOT NULL,
  `idPrueba` int(11) NOT NULL,
  `idAspirante` varchar(36) NOT NULL,
  `idEstatus` int(11) DEFAULT NULL,
  `fechaAsignacion` date DEFAULT NULL,
  `fechaLimite` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `aspirantesgrupospruebas`
--

INSERT INTO `aspirantesgrupospruebas` (`idGrupo`, `idPrueba`, `idAspirante`, `idEstatus`, `fechaAsignacion`, `fechaLimite`) VALUES
('1ed87e17-0b79-11f0-a231-047c163ab16f', 6, '3c7d1bd5-0b79-11f0-a231-047c163ab16f', 1, '2025-03-27', '2025-03-29'),
('3768c32d-0485-11f0-843f-10f60a355c40', 5, '20ca725d-0a75-11f0-aa07-a0294223b12a', 1, '2025-03-26', '2025-03-31'),
('3768c32d-0485-11f0-843f-10f60a355c40', 5, '26cd1eed-0a75-11f0-aa07-a0294223b12a', 1, '2025-03-26', '2025-03-31'),
('3768c32d-0485-11f0-843f-10f60a355c40', 5, '5509f944-0a68-11f0-aa07-a0294223b12a', 1, '2025-03-26', '2025-03-31'),
('3768c32d-0485-11f0-843f-10f60a355c40', 5, '9c86af86-0a67-11f0-aa07-a0294223b12a', 1, '2025-03-26', '2025-03-31'),
('3768c32d-0485-11f0-843f-10f60a355c40', 6, '20ca725d-0a75-11f0-aa07-a0294223b12a', 1, '2025-03-26', '2025-03-31'),
('3768c32d-0485-11f0-843f-10f60a355c40', 6, '26cd1eed-0a75-11f0-aa07-a0294223b12a', 1, '2025-03-26', '2025-03-31'),
('3768c32d-0485-11f0-843f-10f60a355c40', 6, '5509f944-0a68-11f0-aa07-a0294223b12a', 2, '2025-03-26', '2025-03-31'),
('3768c32d-0485-11f0-843f-10f60a355c40', 6, '9c86af86-0a67-11f0-aa07-a0294223b12a', 1, '2025-03-26', '2025-03-31'),
('58ddc7eb-0ba6-11f0-a231-047c163ab16f', 5, '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', 1, '2025-03-28', '2025-03-31'),
('58ddc7eb-0ba6-11f0-a231-047c163ab16f', 6, '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', 1, '2025-03-28', '2025-03-31'),
('81d14e2a-0b90-11f0-a231-047c163ab16f', 6, 'b19b45b0-0b90-11f0-a231-047c163ab16f', 1, '2025-03-27', '2025-03-31'),
('aae297d1-0b96-11f0-a231-047c163ab16f', 6, 'cd906319-0b96-11f0-a231-047c163ab16f', 1, '2025-03-27', '2025-04-01'),
('c28f2c80-14a4-11f0-a774-10f60a355c40', 5, 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 1, '2025-04-08', '2025-04-09'),
('e2906a1c-0b84-11f0-a231-047c163ab16f', 6, '03b07212-0b85-11f0-a231-047c163ab16f', 2, '2025-03-27', '2025-03-29'),
('e2906a1c-0b84-11f0-a231-047c163ab16f', 6, '5ca6e202-14a4-11f0-a774-10f60a355c40', 2, '2025-04-08', '2025-03-29'),
('e2906a1c-0b84-11f0-a231-047c163ab16f', 6, '6db0089e-0f7c-11f0-aede-a0294223b12a', 2, '2025-04-01', '2025-03-29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aspirantespreguntasformatoentrevista`
--

CREATE TABLE `aspirantespreguntasformatoentrevista` (
  `idAspirante` varchar(36) NOT NULL,
  `idPreguntaFormatoEntrevista` int(11) NOT NULL,
  `respuestaAspirante` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `aspirantespreguntasformatoentrevista`
--

INSERT INTO `aspirantespreguntasformatoentrevista` (`idAspirante`, `idPreguntaFormatoEntrevista`, `respuestaAspirante`) VALUES
('39dd9664-0482-11f0-843f-10f60a355c40', 103, ''),
('39dd9664-0482-11f0-843f-10f60a355c40', 104, ''),
('39dd9664-0482-11f0-843f-10f60a355c40', 105, ''),
('39dd9664-0482-11f0-843f-10f60a355c40', 106, ''),
('39dd9664-0482-11f0-843f-10f60a355c40', 107, ''),
('39dd9664-0482-11f0-843f-10f60a355c40', 108, ''),
('39dd9664-0482-11f0-843f-10f60a355c40', 109, ''),
('39dd9664-0482-11f0-843f-10f60a355c40', 110, ''),
('39dd9664-0482-11f0-843f-10f60a355c40', 111, ''),
('39dd9664-0482-11f0-843f-10f60a355c40', 112, ''),
('39dd9664-0482-11f0-843f-10f60a355c40', 113, ''),
('39dd9664-0482-11f0-843f-10f60a355c40', 114, ''),
('39dd9664-0482-11f0-843f-10f60a355c40', 115, ''),
('39dd9664-0482-11f0-843f-10f60a355c40', 116, ''),
('39dd9664-0482-11f0-843f-10f60a355c40', 117, '                            '),
('39dd9664-0482-11f0-843f-10f60a355c40', 118, '                            '),
('39dd9664-0482-11f0-843f-10f60a355c40', 119, '                            '),
('39dd9664-0482-11f0-843f-10f60a355c40', 120, '                            '),
('39dd9664-0482-11f0-843f-10f60a355c40', 121, '                            '),
('39dd9664-0482-11f0-843f-10f60a355c40', 122, '                            '),
('39dd9664-0482-11f0-843f-10f60a355c40', 123, ''),
('39dd9664-0482-11f0-843f-10f60a355c40', 124, ''),
('39dd9664-0482-11f0-843f-10f60a355c40', 125, ''),
('39dd9664-0482-11f0-843f-10f60a355c40', 126, ''),
('39dd9664-0482-11f0-843f-10f60a355c40', 127, ''),
('39dd9664-0482-11f0-843f-10f60a355c40', 128, ''),
('39dd9664-0482-11f0-843f-10f60a355c40', 129, ''),
('39dd9664-0482-11f0-843f-10f60a355c40', 130, ''),
('39dd9664-0482-11f0-843f-10f60a355c40', 131, '                            '),
('39dd9664-0482-11f0-843f-10f60a355c40', 132, '                            '),
('39dd9664-0482-11f0-843f-10f60a355c40', 133, '                            '),
('39dd9664-0482-11f0-843f-10f60a355c40', 134, '                            '),
('39dd9664-0482-11f0-843f-10f60a355c40', 135, '                            '),
('39dd9664-0482-11f0-843f-10f60a355c40', 136, '                            '),
('39dd9664-0482-11f0-843f-10f60a355c40', 137, '                            '),
('39dd9664-0482-11f0-843f-10f60a355c40', 138, '                            '),
('39dd9664-0482-11f0-843f-10f60a355c40', 139, '                            '),
('39dd9664-0482-11f0-843f-10f60a355c40', 140, ''),
('39dd9664-0482-11f0-843f-10f60a355c40', 141, ''),
('39dd9664-0482-11f0-843f-10f60a355c40', 142, ''),
('39dd9664-0482-11f0-843f-10f60a355c40', 143, ''),
('39dd9664-0482-11f0-843f-10f60a355c40', 144, ''),
('39dd9664-0482-11f0-843f-10f60a355c40', 145, '                            '),
('39dd9664-0482-11f0-843f-10f60a355c40', 146, ''),
('39dd9664-0482-11f0-843f-10f60a355c40', 147, ''),
('39dd9664-0482-11f0-843f-10f60a355c40', 148, '                            '),
('39dd9664-0482-11f0-843f-10f60a355c40', 149, '                            '),
('39dd9664-0482-11f0-843f-10f60a355c40', 150, '                            '),
('39dd9664-0482-11f0-843f-10f60a355c40', 151, '                            '),
('39dd9664-0482-11f0-843f-10f60a355c40', 152, '                            '),
('39dd9664-0482-11f0-843f-10f60a355c40', 153, '                            '),
('7b6083c2-0a67-11f0-aa07-a0294223b12a', 103, ''),
('7b6083c2-0a67-11f0-aa07-a0294223b12a', 104, ''),
('7b6083c2-0a67-11f0-aa07-a0294223b12a', 105, ''),
('7b6083c2-0a67-11f0-aa07-a0294223b12a', 106, ''),
('7b6083c2-0a67-11f0-aa07-a0294223b12a', 107, ''),
('7b6083c2-0a67-11f0-aa07-a0294223b12a', 108, ''),
('7b6083c2-0a67-11f0-aa07-a0294223b12a', 109, ''),
('7b6083c2-0a67-11f0-aa07-a0294223b12a', 110, ''),
('7b6083c2-0a67-11f0-aa07-a0294223b12a', 111, ''),
('7b6083c2-0a67-11f0-aa07-a0294223b12a', 112, ''),
('7b6083c2-0a67-11f0-aa07-a0294223b12a', 113, ''),
('7b6083c2-0a67-11f0-aa07-a0294223b12a', 114, ''),
('7b6083c2-0a67-11f0-aa07-a0294223b12a', 115, ''),
('7b6083c2-0a67-11f0-aa07-a0294223b12a', 116, ''),
('7b6083c2-0a67-11f0-aa07-a0294223b12a', 117, '                            '),
('7b6083c2-0a67-11f0-aa07-a0294223b12a', 118, '                            '),
('7b6083c2-0a67-11f0-aa07-a0294223b12a', 119, '                            '),
('7b6083c2-0a67-11f0-aa07-a0294223b12a', 120, '                            '),
('7b6083c2-0a67-11f0-aa07-a0294223b12a', 121, '                            '),
('7b6083c2-0a67-11f0-aa07-a0294223b12a', 122, '                            '),
('7b6083c2-0a67-11f0-aa07-a0294223b12a', 123, ''),
('7b6083c2-0a67-11f0-aa07-a0294223b12a', 124, ''),
('7b6083c2-0a67-11f0-aa07-a0294223b12a', 125, ''),
('7b6083c2-0a67-11f0-aa07-a0294223b12a', 126, ''),
('7b6083c2-0a67-11f0-aa07-a0294223b12a', 127, ''),
('7b6083c2-0a67-11f0-aa07-a0294223b12a', 128, ''),
('7b6083c2-0a67-11f0-aa07-a0294223b12a', 129, ''),
('7b6083c2-0a67-11f0-aa07-a0294223b12a', 130, ''),
('7b6083c2-0a67-11f0-aa07-a0294223b12a', 131, '                            '),
('7b6083c2-0a67-11f0-aa07-a0294223b12a', 132, '                            '),
('7b6083c2-0a67-11f0-aa07-a0294223b12a', 133, '                            '),
('7b6083c2-0a67-11f0-aa07-a0294223b12a', 134, '                            '),
('7b6083c2-0a67-11f0-aa07-a0294223b12a', 135, '                            '),
('7b6083c2-0a67-11f0-aa07-a0294223b12a', 136, '                            '),
('7b6083c2-0a67-11f0-aa07-a0294223b12a', 137, '                            '),
('7b6083c2-0a67-11f0-aa07-a0294223b12a', 138, '                            '),
('7b6083c2-0a67-11f0-aa07-a0294223b12a', 139, '                            '),
('7b6083c2-0a67-11f0-aa07-a0294223b12a', 140, ''),
('7b6083c2-0a67-11f0-aa07-a0294223b12a', 141, ''),
('7b6083c2-0a67-11f0-aa07-a0294223b12a', 142, ''),
('7b6083c2-0a67-11f0-aa07-a0294223b12a', 143, ''),
('7b6083c2-0a67-11f0-aa07-a0294223b12a', 144, ''),
('7b6083c2-0a67-11f0-aa07-a0294223b12a', 145, '                            '),
('7b6083c2-0a67-11f0-aa07-a0294223b12a', 146, ''),
('7b6083c2-0a67-11f0-aa07-a0294223b12a', 147, ''),
('7b6083c2-0a67-11f0-aa07-a0294223b12a', 148, '                            '),
('7b6083c2-0a67-11f0-aa07-a0294223b12a', 149, '                            '),
('7b6083c2-0a67-11f0-aa07-a0294223b12a', 150, '                            '),
('7b6083c2-0a67-11f0-aa07-a0294223b12a', 151, '                            '),
('7b6083c2-0a67-11f0-aa07-a0294223b12a', 152, '                            '),
('7b6083c2-0a67-11f0-aa07-a0294223b12a', 153, '                            '),
('9c86af86-0a67-11f0-aa07-a0294223b12a', 103, ''),
('9c86af86-0a67-11f0-aa07-a0294223b12a', 104, ''),
('9c86af86-0a67-11f0-aa07-a0294223b12a', 105, ''),
('9c86af86-0a67-11f0-aa07-a0294223b12a', 106, ''),
('9c86af86-0a67-11f0-aa07-a0294223b12a', 107, ''),
('9c86af86-0a67-11f0-aa07-a0294223b12a', 108, ''),
('9c86af86-0a67-11f0-aa07-a0294223b12a', 109, ''),
('9c86af86-0a67-11f0-aa07-a0294223b12a', 110, ''),
('9c86af86-0a67-11f0-aa07-a0294223b12a', 111, ''),
('9c86af86-0a67-11f0-aa07-a0294223b12a', 112, ''),
('9c86af86-0a67-11f0-aa07-a0294223b12a', 113, ''),
('9c86af86-0a67-11f0-aa07-a0294223b12a', 114, ''),
('9c86af86-0a67-11f0-aa07-a0294223b12a', 115, ''),
('9c86af86-0a67-11f0-aa07-a0294223b12a', 116, ''),
('9c86af86-0a67-11f0-aa07-a0294223b12a', 117, '                            '),
('9c86af86-0a67-11f0-aa07-a0294223b12a', 118, '                            '),
('9c86af86-0a67-11f0-aa07-a0294223b12a', 119, '                            '),
('9c86af86-0a67-11f0-aa07-a0294223b12a', 120, '                            '),
('9c86af86-0a67-11f0-aa07-a0294223b12a', 121, '                            '),
('9c86af86-0a67-11f0-aa07-a0294223b12a', 122, '                            '),
('9c86af86-0a67-11f0-aa07-a0294223b12a', 123, ''),
('9c86af86-0a67-11f0-aa07-a0294223b12a', 124, ''),
('9c86af86-0a67-11f0-aa07-a0294223b12a', 125, ''),
('9c86af86-0a67-11f0-aa07-a0294223b12a', 126, ''),
('9c86af86-0a67-11f0-aa07-a0294223b12a', 127, ''),
('9c86af86-0a67-11f0-aa07-a0294223b12a', 128, ''),
('9c86af86-0a67-11f0-aa07-a0294223b12a', 129, ''),
('9c86af86-0a67-11f0-aa07-a0294223b12a', 130, ''),
('9c86af86-0a67-11f0-aa07-a0294223b12a', 131, '                            '),
('9c86af86-0a67-11f0-aa07-a0294223b12a', 132, '                            '),
('9c86af86-0a67-11f0-aa07-a0294223b12a', 133, '                            '),
('9c86af86-0a67-11f0-aa07-a0294223b12a', 134, '                            '),
('9c86af86-0a67-11f0-aa07-a0294223b12a', 135, '                            '),
('9c86af86-0a67-11f0-aa07-a0294223b12a', 136, '                            '),
('9c86af86-0a67-11f0-aa07-a0294223b12a', 137, '                            '),
('9c86af86-0a67-11f0-aa07-a0294223b12a', 138, '                            '),
('9c86af86-0a67-11f0-aa07-a0294223b12a', 139, '                            '),
('9c86af86-0a67-11f0-aa07-a0294223b12a', 140, ''),
('9c86af86-0a67-11f0-aa07-a0294223b12a', 141, ''),
('9c86af86-0a67-11f0-aa07-a0294223b12a', 142, ''),
('9c86af86-0a67-11f0-aa07-a0294223b12a', 143, ''),
('9c86af86-0a67-11f0-aa07-a0294223b12a', 144, ''),
('9c86af86-0a67-11f0-aa07-a0294223b12a', 145, '                            '),
('9c86af86-0a67-11f0-aa07-a0294223b12a', 146, ''),
('9c86af86-0a67-11f0-aa07-a0294223b12a', 147, ''),
('9c86af86-0a67-11f0-aa07-a0294223b12a', 148, '                            '),
('9c86af86-0a67-11f0-aa07-a0294223b12a', 149, '                            '),
('9c86af86-0a67-11f0-aa07-a0294223b12a', 150, '                            '),
('9c86af86-0a67-11f0-aa07-a0294223b12a', 151, '                            '),
('9c86af86-0a67-11f0-aa07-a0294223b12a', 152, '                            '),
('9c86af86-0a67-11f0-aa07-a0294223b12a', 153, '                            '),
('cd906319-0b96-11f0-a231-047c163ab16f', 103, '2025-03-27'),
('cd906319-0b96-11f0-a231-047c163ab16f', 104, 'respuesta'),
('cd906319-0b96-11f0-a231-047c163ab16f', 105, 'respuesta'),
('cd906319-0b96-11f0-a231-047c163ab16f', 106, 'respuesta'),
('cd906319-0b96-11f0-a231-047c163ab16f', 107, '2025-03-05'),
('cd906319-0b96-11f0-a231-047c163ab16f', 108, '1'),
('cd906319-0b96-11f0-a231-047c163ab16f', 109, 'respuesta'),
('cd906319-0b96-11f0-a231-047c163ab16f', 110, 'respuesta'),
('cd906319-0b96-11f0-a231-047c163ab16f', 111, 'respuesta'),
('cd906319-0b96-11f0-a231-047c163ab16f', 112, 'respuesta'),
('cd906319-0b96-11f0-a231-047c163ab16f', 113, 'respuesta'),
('cd906319-0b96-11f0-a231-047c163ab16f', 114, 'respuesta'),
('cd906319-0b96-11f0-a231-047c163ab16f', 115, 'respuesta'),
('cd906319-0b96-11f0-a231-047c163ab16f', 116, 'respuesta@gmail.com'),
('cd906319-0b96-11f0-a231-047c163ab16f', 117, '                            respuesta'),
('cd906319-0b96-11f0-a231-047c163ab16f', 118, '                            respuesta'),
('cd906319-0b96-11f0-a231-047c163ab16f', 119, '                            respuesta'),
('cd906319-0b96-11f0-a231-047c163ab16f', 120, '                            respuesta'),
('cd906319-0b96-11f0-a231-047c163ab16f', 121, '                            respuesta'),
('cd906319-0b96-11f0-a231-047c163ab16f', 122, '                            respuesta'),
('cd906319-0b96-11f0-a231-047c163ab16f', 123, 'respuesta'),
('cd906319-0b96-11f0-a231-047c163ab16f', 124, 'respuesta'),
('cd906319-0b96-11f0-a231-047c163ab16f', 125, '9'),
('cd906319-0b96-11f0-a231-047c163ab16f', 126, '2025'),
('cd906319-0b96-11f0-a231-047c163ab16f', 127, 'respuesta'),
('cd906319-0b96-11f0-a231-047c163ab16f', 128, 'respuesta'),
('cd906319-0b96-11f0-a231-047c163ab16f', 129, 'respuesta'),
('cd906319-0b96-11f0-a231-047c163ab16f', 130, '9'),
('cd906319-0b96-11f0-a231-047c163ab16f', 131, '                            respuesta'),
('cd906319-0b96-11f0-a231-047c163ab16f', 132, '                            respuesta'),
('cd906319-0b96-11f0-a231-047c163ab16f', 133, '                            respuesta'),
('cd906319-0b96-11f0-a231-047c163ab16f', 134, '                            respuesta'),
('cd906319-0b96-11f0-a231-047c163ab16f', 135, '                            respuesta'),
('cd906319-0b96-11f0-a231-047c163ab16f', 136, '                            respuesta'),
('cd906319-0b96-11f0-a231-047c163ab16f', 137, '                            respuesta'),
('cd906319-0b96-11f0-a231-047c163ab16f', 138, '                            respuesta'),
('cd906319-0b96-11f0-a231-047c163ab16f', 139, '                            respuesta'),
('cd906319-0b96-11f0-a231-047c163ab16f', 140, 'respuesta'),
('cd906319-0b96-11f0-a231-047c163ab16f', 141, 'respuesta'),
('cd906319-0b96-11f0-a231-047c163ab16f', 142, 'respuesta'),
('cd906319-0b96-11f0-a231-047c163ab16f', 143, 'respuesta'),
('cd906319-0b96-11f0-a231-047c163ab16f', 144, '2'),
('cd906319-0b96-11f0-a231-047c163ab16f', 145, '                            respuesta'),
('cd906319-0b96-11f0-a231-047c163ab16f', 146, '5'),
('cd906319-0b96-11f0-a231-047c163ab16f', 147, 'respuesta'),
('cd906319-0b96-11f0-a231-047c163ab16f', 148, '                            respuesta'),
('cd906319-0b96-11f0-a231-047c163ab16f', 149, '                            respuesta'),
('cd906319-0b96-11f0-a231-047c163ab16f', 150, '                            respuesta'),
('cd906319-0b96-11f0-a231-047c163ab16f', 151, '                            respuesta'),
('cd906319-0b96-11f0-a231-047c163ab16f', 152, '                            respuesta'),
('cd906319-0b96-11f0-a231-047c163ab16f', 153, '                            respuesta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colores`
--

CREATE TABLE `colores` (
  `idColor` int(11) NOT NULL,
  `nombreColor` varchar(50) DEFAULT NULL,
  `numeroColor` int(11) DEFAULT NULL,
  `significado` varchar(50) DEFAULT NULL,
  `hexColor` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `colores`
--

INSERT INTO `colores` (`idColor`, `nombreColor`, `numeroColor`, `significado`, `hexColor`) VALUES
(1, 'Azul', 1, 'Paciencia', '#0F4C81'),
(2, 'Verde', 2, 'Productividad', '#317F43'),
(3, 'Rojo', 3, 'Agresividad', '#D53032'),
(4, 'Amarillo', 4, 'Sociabilidad', '#F2BE22'),
(5, 'Violeta', 5, 'Creatividad', '#7D32D6'),
(6, 'Marrón', 6, 'Vigor', '#6D3F2A'),
(7, 'Negro', 7, 'Satisfacción', '#000000'),
(8, 'Gris', 0, 'Participación', '#A6A6A6');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datospersonales`
--

CREATE TABLE `datospersonales` (
  `idDatosPersonales` varchar(36) NOT NULL,
  `idGrupo` varchar(36) NOT NULL,
  `idPrueba` int(11) NOT NULL,
  `idAspirante` varchar(36) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellidoPaterno` varchar(50) DEFAULT NULL,
  `apellidoMaterno` varchar(50) DEFAULT NULL,
  `puestoSolicitado` varchar(50) DEFAULT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `datospersonales`
--

INSERT INTO `datospersonales` (`idDatosPersonales`, `idGrupo`, `idPrueba`, `idAspirante`, `nombre`, `apellidoPaterno`, `apellidoMaterno`, `puestoSolicitado`, `fecha`) VALUES
('27310cf1-c822-4eba-9d87-43e8dc31fab8', '3768c32d-0485-11f0-843f-10f60a355c40', 6, '9c86af86-0a67-11f0-aa07-a0294223b12a', '1', '1', '1', '1', '2025-04-02'),
('707c791c-0b9a-11f0-a231-047c163ab16f', '81d14e2a-0b90-11f0-a231-047c163ab16f', 6, 'b19b45b0-0b90-11f0-a231-047c163ab16f', 'Dalila', 'Fonseca', 'Maya', 'Ciencia de datos', '2025-03-28'),
('874d20b1-0b79-11f0-a231-047c163ab16f', '1ed87e17-0b79-11f0-a231-047c163ab16f', 6, '3c7d1bd5-0b79-11f0-a231-047c163ab16f', 'Javier', 'Hernandez', 'Cortes', 'Ingeniería en Tecnologías Computacionales', '2025-03-28'),
('8bed4fe7-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', 6, '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', 'Rommel', 'Pacheco', 'Hernández', 'Ingeniería en Biotecnología', '2025-03-28'),
('e6e64d3c-0b96-11f0-a231-047c163ab16f', 'aae297d1-0b96-11f0-a231-047c163ab16f', 6, 'cd906319-0b96-11f0-a231-047c163ab16f', 'Angelo', 'Segura', 'Ibarra', 'Mecatrónica', '2025-03-28'),
('fa075229-07b0-11f0-9462-10f60a355c40', '3768c32d-0485-11f0-843f-10f60a355c40', 5, '39dd9664-0482-11f0-843f-10f60a355c40', 'Juan', 'López', 'García', 'Analista de Datos', '2025-03-23'),
('fa076aea-07b0-11f0-9462-10f60a355c40', '3768c32d-0485-11f0-843f-10f60a355c40', 5, '39dddea9-0482-11f0-843f-10f60a355c40', 'María', 'Pérez', 'Martínez', 'Desarrollador Web', '2025-03-23'),
('fa076d51-07b0-11f0-9462-10f60a355c40', '3768c32d-0485-11f0-843f-10f60a355c40', 5, '39dde372-0482-11f0-843f-10f60a355c40', 'Carlos', 'Rodríguez', 'Fernández', 'Investigador en IA', '2025-03-23'),
('fa076eeb-07b0-11f0-9462-10f60a355c40', '3768c32d-0485-11f0-843f-10f60a355c40', 5, '39dde598-0482-11f0-843f-10f60a355c40', 'Laura', 'Gómez', 'Hernández', 'Psicóloga Organizacional', '2025-03-23'),
('fa07dfac-07b0-11f0-9462-10f60a355c40', '3768c32d-0485-11f0-843f-10f60a355c40', 5, '39de5c40-0482-11f0-843f-10f60a355c40', 'Pedro', 'Fernández', 'Ramírez', 'Ingeniero de Software', '2025-03-23'),
('fa07e1f3-07b0-11f0-9462-10f60a355c40', '3768c32d-0485-11f0-843f-10f60a355c40', 5, '39de6041-0482-11f0-843f-10f60a355c40', 'Ana', 'Martínez', 'López', 'Diseñador UX/UI', '2025-03-23'),
('fa07e343-07b0-11f0-9462-10f60a355c40', '3768c32d-0485-11f0-843f-10f60a355c40', 5, '39de6272-0482-11f0-843f-10f60a355c40', 'Luis', 'Ramírez', 'González', 'Científico de Datos', '2025-03-23'),
('fa07e47f-07b0-11f0-9462-10f60a355c40', '3768c32d-0485-11f0-843f-10f60a355c40', 5, '39de6468-0482-11f0-843f-10f60a355c40', 'Sofía', 'Ramírez', 'Torres', 'Consultor de RRHH', '2025-03-23'),
('fa07e5c1-07b0-11f0-9462-10f60a355c40', '3768c32d-0485-11f0-843f-10f60a355c40', 5, '39de664d-0482-11f0-843f-10f60a355c40', 'Miguel', 'Ramírez', 'Salinas', 'Administrador de Redes', '2025-03-23'),
('fa07e7a6-07b0-11f0-9462-10f60a355c40', '3768c32d-0485-11f0-843f-10f60a355c40', 5, '39de6829-0482-11f0-843f-10f60a355c40', 'Elena', 'García', 'Méndez', 'Analista de Mercado', '2025-03-23'),
('fa07e8f9-07b0-11f0-9462-10f60a355c40', '3768c32d-0485-11f0-843f-10f60a355c40', 6, '39dd9664-0482-11f0-843f-10f60a355c40', 'Juan', 'López', 'García', 'Analista de Sistemas', '2025-03-23'),
('fa07ea37-07b0-11f0-9462-10f60a355c40', '3768c32d-0485-11f0-843f-10f60a355c40', 6, '39dde372-0482-11f0-843f-10f60a355c40', 'Carlos', 'Rodríguez', 'Fernández', 'Ingeniero de Software', '2025-03-23'),
('fa07eb7b-07b0-11f0-9462-10f60a355c40', '3768c32d-0485-11f0-843f-10f60a355c40', 6, '39de5c40-0482-11f0-843f-10f60a355c40', 'Pedro', 'Fernández', 'Ramírez', 'Desarrollador Full Stack', '2025-03-23'),
('fa07ecae-07b0-11f0-9462-10f60a355c40', '3768c32d-0485-11f0-843f-10f60a355c40', 6, '39de6272-0482-11f0-843f-10f60a355c40', 'Luis', 'Ramírez', 'González', 'Especialista en Base de Datos', '2025-03-23'),
('fa07eded-07b0-11f0-9462-10f60a355c40', '3768c32d-0485-11f0-843f-10f60a355c40', 6, '39de664d-0482-11f0-843f-10f60a355c40', 'Miguel', 'Ramírez', 'Salinas', 'Desarrollador Backend', '2025-03-23'),
('fa07ef29-07b0-11f0-9462-10f60a355c40', '3768c32d-0485-11f0-843f-10f60a355c40', 6, '39dddea9-0482-11f0-843f-10f60a355c40', 'María', 'Pérez', 'Martínez', 'Analista de QA', '2025-03-23'),
('fa07f074-07b0-11f0-9462-10f60a355c40', '3768c32d-0485-11f0-843f-10f60a355c40', 6, '39dde598-0482-11f0-843f-10f60a355c40', 'Laura', 'Gómez', 'Hernández', 'Desarrolladora Frontend', '2025-03-23'),
('fa07f420-07b0-11f0-9462-10f60a355c40', '3768c32d-0485-11f0-843f-10f60a355c40', 6, '39de6041-0482-11f0-843f-10f60a355c40', 'Ana', 'Martínez', 'López', 'Ingeniera DevOps', '2025-03-23'),
('fa07f588-07b0-11f0-9462-10f60a355c40', '3768c32d-0485-11f0-843f-10f60a355c40', 6, '39de6468-0482-11f0-843f-10f60a355c40', 'Sofía', 'Ramírez', 'Torres', 'Analista de Seguridad', '2025-03-23'),
('fa07f6d9-07b0-11f0-9462-10f60a355c40', '3768c32d-0485-11f0-843f-10f60a355c40', 6, '39de6829-0482-11f0-843f-10f60a355c40', 'Elena', 'García', 'Méndez', 'Especialista UX', '2025-03-23'),
('fa07f837-07b0-11f0-9462-10f60a355c40', '3768ef7b-0485-11f0-843f-10f60a355c40', 5, '39de6a3b-0482-11f0-843f-10f60a355c40', 'Javier', 'Fernández', 'Torres', 'Ingeniero Industrial', '2025-03-23'),
('fa07f97e-07b0-11f0-9462-10f60a355c40', '3768ef7b-0485-11f0-843f-10f60a355c40', 5, '39de6de6-0482-11f0-843f-10f60a355c40', 'Fernando', 'Torres', 'Vázquez', 'Investigador de Procesos', '2025-03-23'),
('fa07fabe-07b0-11f0-9462-10f60a355c40', '3768ef7b-0485-11f0-843f-10f60a355c40', 5, '39de71a3-0482-11f0-843f-10f60a355c40', 'Ricardo', 'García', 'Morales', 'Ingeniero Mecánico', '2025-03-23'),
('fa07fbfc-07b0-11f0-9462-10f60a355c40', '3768ef7b-0485-11f0-843f-10f60a355c40', 5, '39de7539-0482-11f0-843f-10f60a355c40', 'Manuel', 'Ramírez', 'Suárez', 'Ingeniero de Planta', '2025-03-23'),
('fa07fd3b-07b0-11f0-9462-10f60a355c40', '3768ef7b-0485-11f0-843f-10f60a355c40', 5, '39de7951-0482-11f0-843f-10f60a355c40', 'Raúl', 'García', 'Díaz', 'Especialista en Calidad', '2025-03-23'),
('fa07fe71-07b0-11f0-9462-10f60a355c40', '3768ef7b-0485-11f0-843f-10f60a355c40', 5, '39de6c18-0482-11f0-843f-10f60a355c40', 'Lucía', 'Ramírez', 'Castro', 'Diseñadora Industrial', '2025-03-23'),
('fa07ffac-07b0-11f0-9462-10f60a355c40', '3768ef7b-0485-11f0-843f-10f60a355c40', 5, '39de6fb4-0482-11f0-843f-10f60a355c40', 'Paula', 'López', 'Moreno', 'Ingeniera de Sistemas', '2025-03-23'),
('fa0800e5-07b0-11f0-9462-10f60a355c40', '3768ef7b-0485-11f0-843f-10f60a355c40', 5, '39de7374-0482-11f0-843f-10f60a355c40', 'Gabriela', 'Gómez', 'Soto', 'Analista de Procesos', '2025-03-23'),
('fa080229-07b0-11f0-9462-10f60a355c40', '3768ef7b-0485-11f0-843f-10f60a355c40', 5, '39de770d-0482-11f0-843f-10f60a355c40', 'Valeria', 'Gómez', 'Bravo', 'Ingeniera Eléctrica', '2025-03-23'),
('fa080369-07b0-11f0-9462-10f60a355c40', '3768ef7b-0485-11f0-843f-10f60a355c40', 5, '39de7b1e-0482-11f0-843f-10f60a355c40', 'Isabel', 'Fernández', 'Reyes', 'Supervisora de Producción', '2025-03-23'),
('fa0804aa-07b0-11f0-9462-10f60a355c40', '3768ef7b-0485-11f0-843f-10f60a355c40', 6, '39de6a3b-0482-11f0-843f-10f60a355c40', 'Javier', 'Fernández', 'Torres', 'Ingeniero de Producción', '2025-03-23'),
('fa0805ef-07b0-11f0-9462-10f60a355c40', '3768ef7b-0485-11f0-843f-10f60a355c40', 6, '39de6de6-0482-11f0-843f-10f60a355c40', 'Fernando', 'Torres', 'Vázquez', 'Especialista en Logística', '2025-03-23'),
('fa08073c-07b0-11f0-9462-10f60a355c40', '3768ef7b-0485-11f0-843f-10f60a355c40', 6, '39de71a3-0482-11f0-843f-10f60a355c40', 'Ricardo', 'García', 'Morales', 'Ingeniero de Materiales', '2025-03-23'),
('fa08087c-07b0-11f0-9462-10f60a355c40', '3768ef7b-0485-11f0-843f-10f60a355c40', 6, '39de7539-0482-11f0-843f-10f60a355c40', 'Manuel', 'Ramírez', 'Suárez', 'Supervisor de Calidad', '2025-03-23'),
('fa0809c7-07b0-11f0-9462-10f60a355c40', '3768ef7b-0485-11f0-843f-10f60a355c40', 6, '39de7951-0482-11f0-843f-10f60a355c40', 'Raúl', 'García', 'Díaz', 'Ingeniero de Mantenimiento', '2025-03-23'),
('fa080b01-07b0-11f0-9462-10f60a355c40', '3768ef7b-0485-11f0-843f-10f60a355c40', 6, '39de6c18-0482-11f0-843f-10f60a355c40', 'Lucía', 'Ramírez', 'Castro', 'Ingeniera de Procesos', '2025-03-23'),
('fa080c5d-07b0-11f0-9462-10f60a355c40', '3768ef7b-0485-11f0-843f-10f60a355c40', 6, '39de6fb4-0482-11f0-843f-10f60a355c40', 'Paula', 'López', 'Moreno', 'Analista de Proyectos', '2025-03-23'),
('fa080d9a-07b0-11f0-9462-10f60a355c40', '3768ef7b-0485-11f0-843f-10f60a355c40', 6, '39de7374-0482-11f0-843f-10f60a355c40', 'Gabriela', 'Gómez', 'Soto', 'Ingeniera de Automatización', '2025-03-23'),
('fa080ee1-07b0-11f0-9462-10f60a355c40', '3768ef7b-0485-11f0-843f-10f60a355c40', 6, '39de770d-0482-11f0-843f-10f60a355c40', 'Valeria', 'Gómez', 'Bravo', 'Especialista en Manufactura', '2025-03-23'),
('fa081020-07b0-11f0-9462-10f60a355c40', '3768ef7b-0485-11f0-843f-10f60a355c40', 6, '39de7b1e-0482-11f0-843f-10f60a355c40', 'Isabel', 'Fernández', 'Reyes', 'Ingeniera de Control', '2025-03-23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadocivil`
--

CREATE TABLE `estadocivil` (
  `idEstadoCivil` int(11) NOT NULL,
  `nombreEstadoCivil` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estadocivil`
--

INSERT INTO `estadocivil` (`idEstadoCivil`, `nombreEstadoCivil`) VALUES
(1, 'Soltero'),
(2, 'Casado'),
(3, 'Divorciado'),
(4, 'Unión libre'),
(5, 'Viudo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `idEstado` int(11) NOT NULL,
  `nombreEstado` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`idEstado`, `nombreEstado`) VALUES
(1, 'Aguascalientes'),
(2, 'Baja California'),
(3, 'Baja California Sur'),
(4, 'Campeche'),
(5, 'Chiapas'),
(6, 'Chihuahua'),
(7, 'Coahuila'),
(8, 'Colima'),
(9, 'Durango'),
(10, 'Guanajuato'),
(11, 'Guerrero'),
(12, 'Hidalgo'),
(13, 'Jalisco'),
(14, 'Estado de México'),
(15, 'Michoacán'),
(16, 'Morelos'),
(17, 'Nayarit'),
(18, 'Nuevo León'),
(19, 'Oaxaca'),
(20, 'Puebla'),
(21, 'Querétaro'),
(22, 'Quintana Roo'),
(23, 'San Luis Potosí'),
(24, 'Sinaloa'),
(25, 'Sonora'),
(26, 'Tabasco'),
(27, 'Tamaulipas'),
(28, 'Tlaxcala'),
(29, 'Veracruz'),
(30, 'Yucatán'),
(31, 'Zacatecas'),
(32, 'Ciudad de México');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estatusprueba`
--

CREATE TABLE `estatusprueba` (
  `idEstatus` int(11) NOT NULL,
  `nombreEstatus` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estatusprueba`
--

INSERT INTO `estatusprueba` (`idEstatus`, `nombreEstatus`) VALUES
(1, 'Completada'),
(2, 'Pendiente'),
(3, 'En progreso'),
(4, 'Vencida');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `familiares`
--

CREATE TABLE `familiares` (
  `idFamiliar` varchar(36) NOT NULL,
  `idAspirante` varchar(36) DEFAULT NULL,
  `rolFamiliar` varchar(50) DEFAULT NULL,
  `nombreFamiliar` varchar(255) DEFAULT NULL,
  `edadFamiliar` int(11) DEFAULT NULL,
  `idGenero` int(11) DEFAULT NULL,
  `idEstadoCivil` int(11) DEFAULT NULL,
  `hijoDe` varchar(36) DEFAULT NULL,
  `estadoDeVida` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `familiares`
--

INSERT INTO `familiares` (`idFamiliar`, `idAspirante`, `rolFamiliar`, `nombreFamiliar`, `edadFamiliar`, `idGenero`, `idEstadoCivil`, `hijoDe`, `estadoDeVida`) VALUES
('644d3dbf-0b99-11f0-a231-047c163ab16f', 'cd906319-0b96-11f0-a231-047c163ab16f', 'Abuelo', 'Eduardo Juarez', 2, 2, 1, NULL, 1),
('7d72e8c0-0b99-11f0-a231-047c163ab16f', 'cd906319-0b96-11f0-a231-047c163ab16f', 'Padre', 'José José', 34, 2, 2, '644d3dbf-0b99-11f0-a231-047c163ab16f', 1),
('da58287e-0ad1-11f0-aa07-a0294223b12a', '9c86af86-0a67-11f0-aa07-a0294223b12a', 'Padre', 'Eduardo Juarez', 40, 2, 1, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `generos`
--

CREATE TABLE `generos` (
  `idGenero` int(11) NOT NULL,
  `nombreGenero` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `generos`
--

INSERT INTO `generos` (`idGenero`, `nombreGenero`) VALUES
(1, 'Femenino'),
(2, 'Masculino'),
(3, 'No binario'),
(4, 'Género fluido'),
(5, 'Prefiero no decir');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupos`
--

CREATE TABLE `grupos` (
  `idGrupo` varchar(36) NOT NULL,
  `nombreGrupo` varchar(100) DEFAULT NULL,
  `estatusGrupo` tinyint(1) DEFAULT NULL,
  `cicloEscolar` varchar(50) DEFAULT NULL,
  `anioGeneracion` int(11) DEFAULT NULL,
  `carrera` varchar(100) DEFAULT NULL,
  `idInstitucion` varchar(36) DEFAULT NULL,
  `idNivelAcademico` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `grupos`
--

INSERT INTO `grupos` (`idGrupo`, `nombreGrupo`, `estatusGrupo`, `cicloEscolar`, `anioGeneracion`, `carrera`, `idInstitucion`, `idNivelAcademico`) VALUES
('10553c6b-0f73-11f0-aede-a0294223b12a', 'Grupo_Tecmi2', 1, 'Feb-Jun', 2025, 'Administración de empresas', '45e582b8-0ba6-11f0-a231-047c163ab16f', 2),
('1ed87e17-0b79-11f0-a231-047c163ab16f', 'Grupo_G29', 1, 'Feb-Jun', 2025, 'ITC', 'eda64beb-0483-11f0-843f-10f60a355c40', 3),
('3768c32d-0485-11f0-843f-10f60a355c40', 'G1_ISC', 1, '2025-2026', 2025, 'Ingeniería en Sistemas Computacionales', 'eda618cd-0483-11f0-843f-10f60a355c40', 3),
('3768ef7b-0485-11f0-843f-10f60a355c40', 'G2_II', 1, '2025-2026', 2025, 'Ingeniería Industrial', 'eda64aad-0483-11f0-843f-10f60a355c40', 3),
('3768f0d4-0485-11f0-843f-10f60a355c40', 'G3_DERE', 1, '2025-2026', 2025, 'Derecho', 'eda64b6a-0483-11f0-843f-10f60a355c40', 3),
('3768f18c-0485-11f0-843f-10f60a355c40', 'G4_ARQ', 1, '2025-2026', 2025, 'Arquitectura', 'eda64b9f-0483-11f0-843f-10f60a355c40', 3),
('3768f233-0485-11f0-843f-10f60a355c40', 'G5_MED', 1, '2025-2026', 2025, 'Medicina', 'eda64bc6-0483-11f0-843f-10f60a355c40', 3),
('376937f1-0485-11f0-843f-10f60a355c40', 'G6_CON', 1, '2025-2026', 2025, 'Contaduría', 'eda64beb-0483-11f0-843f-10f60a355c40', 3),
('37693967-0485-11f0-843f-10f60a355c40', 'G7_PSI', 1, '2025-2026', 2025, 'Psicología', 'eda64c11-0483-11f0-843f-10f60a355c40', 3),
('37693a49-0485-11f0-843f-10f60a355c40', 'G8_IE', 1, '2025-2026', 2025, 'Ingeniería Electrónica', 'eda64c35-0483-11f0-843f-10f60a355c40', 3),
('37693afe-0485-11f0-843f-10f60a355c40', 'G9_NI', 1, '2025-2026', 2025, 'Negocios Internacionales', 'eda64c5e-0483-11f0-843f-10f60a355c40', 3),
('37693b92-0485-11f0-843f-10f60a355c40', 'G10_CC', 1, '2025-2026', 2025, 'Ciencias de la Computación', 'eda64c82-0483-11f0-843f-10f60a355c40', 3),
('37693c29-0485-11f0-843f-10f60a355c40', 'G11_IM', 1, '2025-2026', 2025, 'Ingeniería Mecánica', 'eda618cd-0483-11f0-843f-10f60a355c40', 1),
('37693cc4-0485-11f0-843f-10f60a355c40', 'G12_ECO', 1, '2025-2026', 2025, 'Economía', 'eda64aad-0483-11f0-843f-10f60a355c40', 1),
('37693d54-0485-11f0-843f-10f60a355c40', 'G13_BIO', 1, '2025-2026', 2025, 'Biología', 'eda64b6a-0483-11f0-843f-10f60a355c40', 1),
('37693de8-0485-11f0-843f-10f60a355c40', 'G14_IC', 1, '2025-2026', 2025, 'Ingeniería Civil', 'eda64b9f-0483-11f0-843f-10f60a355c40', 1),
('37693e78-0485-11f0-843f-10f60a355c40', 'G15_FIL', 1, '2025-2026', 2025, 'Filosofía', 'eda64bc6-0483-11f0-843f-10f60a355c40', 2),
('37693f26-0485-11f0-843f-10f60a355c40', 'G16_ANT', 1, '2025-2026', 2025, 'Antropología', 'eda64beb-0483-11f0-843f-10f60a355c40', 2),
('37693fb1-0485-11f0-843f-10f60a355c40', 'G17_QUI', 1, '2025-2026', 2025, 'Química', 'eda64c11-0483-11f0-843f-10f60a355c40', 2),
('3769403e-0485-11f0-843f-10f60a355c40', 'G18_MAT', 1, '2025-2026', 2025, 'Matemáticas', 'eda64c35-0483-11f0-843f-10f60a355c40', 2),
('376940c8-0485-11f0-843f-10f60a355c40', 'G19_HIS', 1, '2025-2026', 2025, 'Historia', 'eda64c5e-0483-11f0-843f-10f60a355c40', 2),
('48b3a0be-0acd-11f0-aa07-a0294223b12a', 'Grupo1234', 1, 'Feb-Jun', 2025, 'ITC', 'eda64c5e-0483-11f0-843f-10f60a355c40', 1),
('58ddc7eb-0ba6-11f0-a231-047c163ab16f', 'Grupo 7001', 1, 'Febrero/Julio 2021', 2021, 'Ingeniería en Biotecnología', '45e582b8-0ba6-11f0-a231-047c163ab16f', 3),
('7ae44614-0b76-11f0-a231-047c163ab16f', 'Maestría en Ciencia y Tecnología de Alimentos', 1, 'Feb-Jun', 2025, 'Ciencia y Tecnología de Alimentos', 'eda618cd-0483-11f0-843f-10f60a355c40', 1),
('81d14e2a-0b90-11f0-a231-047c163ab16f', 'Grupo_Tecmi1', 1, 'Ago-Dic', 2025, 'Administración de empresas', '65eee0af-0b90-11f0-a231-047c163ab16f', 3),
('aae297d1-0b96-11f0-a231-047c163ab16f', 'Grupo B', 1, 'Feb-Jun', 2024, 'Mecatrónica', '8bdfb94c-0b96-11f0-a231-047c163ab16f', 3),
('bc221d4d-0acd-11f0-aa07-a0294223b12a', 'Grupo_4321', 1, 'Feb-Jun', 2025, 'ITC', 'eda64c5e-0483-11f0-843f-10f60a355c40', 1),
('c28f2c80-14a4-11f0-a774-10f60a355c40', 'Grupo 120', 1, 'Ago-Dic', 2025, 'Cocina', 'a6fe9d20-14a4-11f0-a774-10f60a355c40', 2),
('c305303e-0aca-11f0-aa07-a0294223b12a', 'Grupo_123', 1, 'Feb-Jun', 2025, 'ITC', 'eda64c5e-0483-11f0-843f-10f60a355c40', 3),
('dceaa5c4-0acc-11f0-aa07-a0294223b12a', 'Grupo_321', 1, 'Feb-Jun', 2025, 'ITC', 'eda64c5e-0483-11f0-843f-10f60a355c40', 2),
('e2906a1c-0b84-11f0-a231-047c163ab16f', 'Computer Science', 1, 'Ago-Dic', 2025, 'ITC', 'cf25de22-0b84-11f0-a231-047c163ab16f', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gruposaspirantes`
--

CREATE TABLE `gruposaspirantes` (
  `idGrupo` varchar(36) NOT NULL,
  `idAspirante` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `gruposaspirantes`
--

INSERT INTO `gruposaspirantes` (`idGrupo`, `idAspirante`) VALUES
('1ed87e17-0b79-11f0-a231-047c163ab16f', '3c7d1bd5-0b79-11f0-a231-047c163ab16f'),
('3768c32d-0485-11f0-843f-10f60a355c40', '0031317b-0a66-11f0-aa07-a0294223b12a'),
('3768c32d-0485-11f0-843f-10f60a355c40', '0f9d2929-0a08-11f0-aa07-a0294223b12a'),
('3768c32d-0485-11f0-843f-10f60a355c40', '1aaad8df-0a06-11f0-aa07-a0294223b12a'),
('3768c32d-0485-11f0-843f-10f60a355c40', '20ca725d-0a75-11f0-aa07-a0294223b12a'),
('3768c32d-0485-11f0-843f-10f60a355c40', '26cd1eed-0a75-11f0-aa07-a0294223b12a'),
('3768c32d-0485-11f0-843f-10f60a355c40', '39dd9664-0482-11f0-843f-10f60a355c40'),
('3768c32d-0485-11f0-843f-10f60a355c40', '39dddea9-0482-11f0-843f-10f60a355c40'),
('3768c32d-0485-11f0-843f-10f60a355c40', '39dde372-0482-11f0-843f-10f60a355c40'),
('3768c32d-0485-11f0-843f-10f60a355c40', '39dde598-0482-11f0-843f-10f60a355c40'),
('3768c32d-0485-11f0-843f-10f60a355c40', '39de5c40-0482-11f0-843f-10f60a355c40'),
('3768c32d-0485-11f0-843f-10f60a355c40', '39de6041-0482-11f0-843f-10f60a355c40'),
('3768c32d-0485-11f0-843f-10f60a355c40', '39de6272-0482-11f0-843f-10f60a355c40'),
('3768c32d-0485-11f0-843f-10f60a355c40', '39de6468-0482-11f0-843f-10f60a355c40'),
('3768c32d-0485-11f0-843f-10f60a355c40', '39de664d-0482-11f0-843f-10f60a355c40'),
('3768c32d-0485-11f0-843f-10f60a355c40', '39de6829-0482-11f0-843f-10f60a355c40'),
('3768c32d-0485-11f0-843f-10f60a355c40', '3e3e5777-0a06-11f0-aa07-a0294223b12a'),
('3768c32d-0485-11f0-843f-10f60a355c40', '5509f944-0a68-11f0-aa07-a0294223b12a'),
('3768c32d-0485-11f0-843f-10f60a355c40', '59e6c8dd-0a08-11f0-aa07-a0294223b12a'),
('3768c32d-0485-11f0-843f-10f60a355c40', '5f75368c-0a64-11f0-aa07-a0294223b12a'),
('3768c32d-0485-11f0-843f-10f60a355c40', '7b6083c2-0a67-11f0-aa07-a0294223b12a'),
('3768c32d-0485-11f0-843f-10f60a355c40', '8035bfdd-0a08-11f0-aa07-a0294223b12a'),
('3768c32d-0485-11f0-843f-10f60a355c40', '9c86af86-0a67-11f0-aa07-a0294223b12a'),
('3768c32d-0485-11f0-843f-10f60a355c40', 'b5bd3ce2-0a65-11f0-aa07-a0294223b12a'),
('3768ef7b-0485-11f0-843f-10f60a355c40', '39dd9664-0482-11f0-843f-10f60a355c40'),
('3768ef7b-0485-11f0-843f-10f60a355c40', '39de6a3b-0482-11f0-843f-10f60a355c40'),
('3768ef7b-0485-11f0-843f-10f60a355c40', '39de6c18-0482-11f0-843f-10f60a355c40'),
('3768ef7b-0485-11f0-843f-10f60a355c40', '39de6de6-0482-11f0-843f-10f60a355c40'),
('3768ef7b-0485-11f0-843f-10f60a355c40', '39de6fb4-0482-11f0-843f-10f60a355c40'),
('3768ef7b-0485-11f0-843f-10f60a355c40', '39de71a3-0482-11f0-843f-10f60a355c40'),
('3768ef7b-0485-11f0-843f-10f60a355c40', '39de7374-0482-11f0-843f-10f60a355c40'),
('3768ef7b-0485-11f0-843f-10f60a355c40', '39de7539-0482-11f0-843f-10f60a355c40'),
('3768ef7b-0485-11f0-843f-10f60a355c40', '39de770d-0482-11f0-843f-10f60a355c40'),
('3768ef7b-0485-11f0-843f-10f60a355c40', '39de7951-0482-11f0-843f-10f60a355c40'),
('3768ef7b-0485-11f0-843f-10f60a355c40', '39de7b1e-0482-11f0-843f-10f60a355c40'),
('37693b92-0485-11f0-843f-10f60a355c40', 'f56a152f-0b74-11f0-a231-047c163ab16f'),
('376940c8-0485-11f0-843f-10f60a355c40', '0f9d2929-0a08-11f0-aa07-a0294223b12a'),
('376940c8-0485-11f0-843f-10f60a355c40', '130adcf0-0b92-11f0-a231-047c163ab16f'),
('376940c8-0485-11f0-843f-10f60a355c40', '1aaad8df-0a06-11f0-aa07-a0294223b12a'),
('376940c8-0485-11f0-843f-10f60a355c40', '20ca725d-0a75-11f0-aa07-a0294223b12a'),
('376940c8-0485-11f0-843f-10f60a355c40', '3de8f84f-0a09-11f0-aa07-a0294223b12a'),
('376940c8-0485-11f0-843f-10f60a355c40', '3e3e5777-0a06-11f0-aa07-a0294223b12a'),
('376940c8-0485-11f0-843f-10f60a355c40', '518e6e7c-0a05-11f0-aa07-a0294223b12a'),
('376940c8-0485-11f0-843f-10f60a355c40', '59e6c8dd-0a08-11f0-aa07-a0294223b12a'),
('376940c8-0485-11f0-843f-10f60a355c40', '69a9ad60-0a06-11f0-aa07-a0294223b12a'),
('376940c8-0485-11f0-843f-10f60a355c40', '8035bfdd-0a08-11f0-aa07-a0294223b12a'),
('376940c8-0485-11f0-843f-10f60a355c40', '8c388780-0a06-11f0-aa07-a0294223b12a'),
('376940c8-0485-11f0-843f-10f60a355c40', '9ed2e17b-0a07-11f0-aa07-a0294223b12a'),
('376940c8-0485-11f0-843f-10f60a355c40', 'b082516c-0a08-11f0-aa07-a0294223b12a'),
('376940c8-0485-11f0-843f-10f60a355c40', 'b1f6c5b6-0b75-11f0-a231-047c163ab16f'),
('376940c8-0485-11f0-843f-10f60a355c40', 'b55dcd98-0a05-11f0-aa07-a0294223b12a'),
('376940c8-0485-11f0-843f-10f60a355c40', 'beec87f1-0a08-11f0-aa07-a0294223b12a'),
('376940c8-0485-11f0-843f-10f60a355c40', 'c1abd503-0a06-11f0-aa07-a0294223b12a'),
('376940c8-0485-11f0-843f-10f60a355c40', 'd27ed233-0b91-11f0-a231-047c163ab16f'),
('376940c8-0485-11f0-843f-10f60a355c40', 'f3ae43b6-0a06-11f0-aa07-a0294223b12a'),
('376940c8-0485-11f0-843f-10f60a355c40', 'fc7b0970-0a08-11f0-aa07-a0294223b12a'),
('58ddc7eb-0ba6-11f0-a231-047c163ab16f', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f'),
('7ae44614-0b76-11f0-a231-047c163ab16f', 'cd963319-0b76-11f0-a231-047c163ab16f'),
('81d14e2a-0b90-11f0-a231-047c163ab16f', 'b19b45b0-0b90-11f0-a231-047c163ab16f'),
('aae297d1-0b96-11f0-a231-047c163ab16f', 'cd906319-0b96-11f0-a231-047c163ab16f'),
('c28f2c80-14a4-11f0-a774-10f60a355c40', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40'),
('e2906a1c-0b84-11f0-a231-047c163ab16f', '03b07212-0b85-11f0-a231-047c163ab16f'),
('e2906a1c-0b84-11f0-a231-047c163ab16f', '5ca6e202-14a4-11f0-a774-10f60a355c40'),
('e2906a1c-0b84-11f0-a231-047c163ab16f', '6db0089e-0f7c-11f0-aede-a0294223b12a');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupospruebas`
--

CREATE TABLE `grupospruebas` (
  `idGrupo` varchar(36) NOT NULL,
  `idPrueba` int(11) NOT NULL,
  `fechaAsignacion` date DEFAULT NULL,
  `fechaLimite` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `grupospruebas`
--

INSERT INTO `grupospruebas` (`idGrupo`, `idPrueba`, `fechaAsignacion`, `fechaLimite`) VALUES
('10553c6b-0f73-11f0-aede-a0294223b12a', 5, '2025-04-01', '2025-05-08'),
('1ed87e17-0b79-11f0-a231-047c163ab16f', 6, '2025-03-27', '2025-03-29'),
('3768c32d-0485-11f0-843f-10f60a355c40', 5, '2025-03-01', '2025-03-31'),
('3768c32d-0485-11f0-843f-10f60a355c40', 6, '2025-03-01', '2025-03-31'),
('48b3a0be-0acd-11f0-aa07-a0294223b12a', 1, NULL, NULL),
('48b3a0be-0acd-11f0-aa07-a0294223b12a', 2, NULL, NULL),
('48b3a0be-0acd-11f0-aa07-a0294223b12a', 3, NULL, NULL),
('48b3a0be-0acd-11f0-aa07-a0294223b12a', 4, NULL, NULL),
('48b3a0be-0acd-11f0-aa07-a0294223b12a', 5, NULL, NULL),
('48b3a0be-0acd-11f0-aa07-a0294223b12a', 6, NULL, NULL),
('58ddc7eb-0ba6-11f0-a231-047c163ab16f', 5, '2025-04-10', '2025-03-31'),
('58ddc7eb-0ba6-11f0-a231-047c163ab16f', 6, '2025-04-10', '2025-03-31'),
('81d14e2a-0b90-11f0-a231-047c163ab16f', 6, '2025-03-27', '2025-03-31'),
('aae297d1-0b96-11f0-a231-047c163ab16f', 6, '2025-03-27', '2025-04-01'),
('bc221d4d-0acd-11f0-aa07-a0294223b12a', 1, '2025-03-26', '2025-03-28'),
('bc221d4d-0acd-11f0-aa07-a0294223b12a', 2, '2025-03-26', '2025-03-28'),
('bc221d4d-0acd-11f0-aa07-a0294223b12a', 3, '2025-03-26', '2025-03-28'),
('bc221d4d-0acd-11f0-aa07-a0294223b12a', 4, '2025-03-26', '2025-03-28'),
('bc221d4d-0acd-11f0-aa07-a0294223b12a', 5, '2025-03-26', '2025-03-28'),
('bc221d4d-0acd-11f0-aa07-a0294223b12a', 6, '2025-03-26', '2025-03-28'),
('c28f2c80-14a4-11f0-a774-10f60a355c40', 5, '2025-04-08', '2025-04-09'),
('dceaa5c4-0acc-11f0-aa07-a0294223b12a', 2, NULL, NULL),
('e2906a1c-0b84-11f0-a231-047c163ab16f', 6, '2025-03-27', '2025-03-29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `institucion`
--

CREATE TABLE `institucion` (
  `idInstitucion` varchar(36) NOT NULL,
  `nombreInstitucion` varchar(100) DEFAULT NULL,
  `estatusInstitucion` tinyint(1) DEFAULT NULL,
  `idTipoInstitucion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `institucion`
--

INSERT INTO `institucion` (`idInstitucion`, `nombreInstitucion`, `estatusInstitucion`, `idTipoInstitucion`) VALUES
('45e582b8-0ba6-11f0-a231-047c163ab16f', 'Benemérita Universidad Autónoma de Puebla', 1, 1),
('47cbd520-0b84-11f0-a231-047c163ab16f', 'UVM', 1, 2),
('65eee0af-0b90-11f0-a231-047c163ab16f', 'Tecmilenio', 1, 2),
('8bdfb94c-0b96-11f0-a231-047c163ab16f', 'CBTIS', 1, 1),
('a6fe9d20-14a4-11f0-a774-10f60a355c40', 'UVM Querétaro ', 1, 2),
('cf25de22-0b84-11f0-a231-047c163ab16f', 'Universidad de Leeds', 1, 1),
('eda618cd-0483-11f0-843f-10f60a355c40', 'Universidad Nacional Autónoma de México', 1, 1),
('eda64aad-0483-11f0-843f-10f60a355c40', 'Tecnológico de Monterrey', 1, 2),
('eda64b6a-0483-11f0-843f-10f60a355c40', 'Universidad Autónoma Metropolitana', 1, 1),
('eda64b9f-0483-11f0-843f-10f60a355c40', 'Universidad de Guadalajara', 1, 1),
('eda64bc6-0483-11f0-843f-10f60a355c40', 'Universidad Anáhuac', 1, 2),
('eda64beb-0483-11f0-843f-10f60a355c40', 'Instituto Politécnico Nacional', 1, 1),
('eda64c11-0483-11f0-843f-10f60a355c40', 'Universidad Iberoamericana', 1, 2),
('eda64c35-0483-11f0-843f-10f60a355c40', 'Universidad Autónoma de Nuevo León', 1, 1),
('eda64c5e-0483-11f0-843f-10f60a355c40', 'Escuela Bancaria y Comercial', 1, 2),
('eda64c82-0483-11f0-843f-10f60a355c40', 'Universidad de Monterrey', 1, 2),
('f18555b3-0b83-11f0-a231-047c163ab16f', 'Universidad Autónoma de Querétaro', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivelacademico`
--

CREATE TABLE `nivelacademico` (
  `idNivelAcademico` int(11) NOT NULL,
  `nombreNivelAcademico` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `nivelacademico`
--

INSERT INTO `nivelacademico` (`idNivelAcademico`, `nombreNivelAcademico`) VALUES
(1, 'Maestría'),
(2, 'Doctorado'),
(3, 'Licenciatura');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opciones16pf`
--

CREATE TABLE `opciones16pf` (
  `idOpcion16PF` varchar(36) NOT NULL,
  `idPregunta16PF` varchar(36) DEFAULT NULL,
  `opcion16PF` varchar(5) DEFAULT NULL,
  `descripcionOpcion16PF` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiene16pf`
--

CREATE TABLE tiene16pf (
  idPregunta16PF varchar(36) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  idPrueba int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opcioneskostick`
--

CREATE TABLE `opcioneskostick` (
  `idOpcionKostick` varchar(36) NOT NULL,
  `idPreguntaKostick` varchar(36) DEFAULT NULL,
  `opcionKostick` varchar(1) DEFAULT NULL,
  `descripcionOpcionKostick` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tienekostick`
--

CREATE TABLE `tienekostick` (
  `idPreguntaKostick` varchar(36) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `idPrueba` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opcionesotis`
--

CREATE TABLE `opcionesotis` (
  `idOpcionOtis` varchar(36) NOT NULL,
  `idPreguntaOtis` varchar(36) DEFAULT NULL,
  `opcionOtis` int(11) DEFAULT NULL,
  `descripcionOpcion` text DEFAULT NULL,
  `esCorrecta` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `opcionesotis`
--

INSERT INTO `opcionesotis` (`idOpcionOtis`, `idPreguntaOtis`, `opcionOtis`, `descripcionOpcion`, `esCorrecta`) VALUES
('8a64f0da-149f-11f0-a774-10f60a355c40', '8363cf89-149f-11f0-a774-10f60a355c40', 1, 'Cosa', 0),
('8a65f6f7-149f-11f0-a774-10f60a355c40', '8363cf89-149f-11f0-a774-10f60a355c40', 2, 'Mueble', 0),
('8a65f907-149f-11f0-a774-10f60a355c40', '8363cf89-149f-11f0-a774-10f60a355c40', 3, 'Arma', 0),
('8a65fa2f-149f-11f0-a774-10f60a355c40', '8363cf89-149f-11f0-a774-10f60a355c40', 4, 'Herramienta', 1),
('8a65fb86-149f-11f0-a774-10f60a355c40', '8363cf89-149f-11f0-a774-10f60a355c40', 5, 'Máquina', 0),
('8a6818d5-149f-11f0-a774-10f60a355c40', '8363d26a-149f-11f0-a774-10f60a355c40', 1, 'Conseguir', 0),
('8a682259-149f-11f0-a774-10f60a355c40', '8363d26a-149f-11f0-a774-10f60a355c40', 2, 'Decaer', 0),
('8a6823d5-149f-11f0-a774-10f60a355c40', '8363d26a-149f-11f0-a774-10f60a355c40', 3, 'Perder', 1),
('8a6824db-149f-11f0-a774-10f60a355c40', '8363d26a-149f-11f0-a774-10f60a355c40', 4, 'Acceder', 0),
('8a6825de-149f-11f0-a774-10f60a355c40', '8363d26a-149f-11f0-a774-10f60a355c40', 5, 'Ensayar', 0),
('8a6929fb-149f-11f0-a774-10f60a355c40', '8363d300-149f-11f0-a774-10f60a355c40', 1, 'La manteca', 0),
('8a693299-149f-11f0-a774-10f60a355c40', '8363d300-149f-11f0-a774-10f60a355c40', 2, 'La harina', 0),
('8a69340f-149f-11f0-a774-10f60a355c40', '8363d300-149f-11f0-a774-10f60a355c40', 3, 'Y la leche', 0),
('8a69350e-149f-11f0-a774-10f60a355c40', '8363d300-149f-11f0-a774-10f60a355c40', 4, 'El hombre', 1),
('8a693607-149f-11f0-a774-10f60a355c40', '8363d300-149f-11f0-a774-10f60a355c40', 5, 'La cosecha', 0),
('8a6a2fd0-149f-11f0-a774-10f60a355c40', '8363d364-149f-11f0-a774-10f60a355c40', 1, 'El humo', 0),
('8a6a3cae-149f-11f0-a774-10f60a355c40', '8363d364-149f-11f0-a774-10f60a355c40', 2, 'La motocicleta', 0),
('8a6a3e23-149f-11f0-a774-10f60a355c40', '8363d364-149f-11f0-a774-10f60a355c40', 3, 'Las ruedas', 0),
('8a6a3f24-149f-11f0-a774-10f60a355c40', '8363d364-149f-11f0-a774-10f60a355c40', 4, 'La gasolina', 1),
('8a6a401e-149f-11f0-a774-10f60a355c40', '8363d364-149f-11f0-a774-10f60a355c40', 5, 'La bocina', 0),
('8a6b457c-149f-11f0-a774-10f60a355c40', '8363d3c6-149f-11f0-a774-10f60a355c40', 1, '35', 0),
('8a6b5230-149f-11f0-a774-10f60a355c40', '8363d3c6-149f-11f0-a774-10f60a355c40', 2, '40', 1),
('8a6b53a2-149f-11f0-a774-10f60a355c40', '8363d3c6-149f-11f0-a774-10f60a355c40', 3, '42', 0),
('8a6b54a0-149f-11f0-a774-10f60a355c40', '8363d3c6-149f-11f0-a774-10f60a355c40', 4, '45', 0),
('8a6b5597-149f-11f0-a774-10f60a355c40', '8363d3c6-149f-11f0-a774-10f60a355c40', 5, '48', 0),
('8a6c47d6-149f-11f0-a774-10f60a355c40', '8363d438-149f-11f0-a774-10f60a355c40', 1, 'La pierna', 1),
('8a6c55fd-149f-11f0-a774-10f60a355c40', '8363d438-149f-11f0-a774-10f60a355c40', 2, 'El pulgar', 0),
('8a6c57a8-149f-11f0-a774-10f60a355c40', '8363d438-149f-11f0-a774-10f60a355c40', 3, 'El dedo', 0),
('8a6c58d0-149f-11f0-a774-10f60a355c40', '8363d438-149f-11f0-a774-10f60a355c40', 4, 'El puño', 0),
('8a6c59ef-149f-11f0-a774-10f60a355c40', '8363d438-149f-11f0-a774-10f60a355c40', 5, 'La rodilla', 0),
('8a6d4f43-149f-11f0-a774-10f60a355c40', '8363d489-149f-11f0-a774-10f60a355c40', 1, 'Miente', 0),
('8a6d58ea-149f-11f0-a774-10f60a355c40', '8363d489-149f-11f0-a774-10f60a355c40', 2, 'Bromea', 0),
('8a6d5aa8-149f-11f0-a774-10f60a355c40', '8363d489-149f-11f0-a774-10f60a355c40', 3, 'Engaña', 0),
('8a6d5bd8-149f-11f0-a774-10f60a355c40', '8363d489-149f-11f0-a774-10f60a355c40', 4, 'Se divierte', 0),
('8a6d5cff-149f-11f0-a774-10f60a355c40', '8363d489-149f-11f0-a774-10f60a355c40', 5, 'Se alaba', 1),
('8a6e588f-149f-11f0-a774-10f60a355c40', '8363d4e1-149f-11f0-a774-10f60a355c40', 1, 'Seria', 0),
('8a6e6248-149f-11f0-a774-10f60a355c40', '8363d4e1-149f-11f0-a774-10f60a355c40', 2, 'Ansiosa', 0),
('8a6e63ff-149f-11f0-a774-10f60a355c40', '8363d4e1-149f-11f0-a774-10f60a355c40', 3, 'Trabajadora', 0),
('8a6e652f-149f-11f0-a774-10f60a355c40', '8363d4e1-149f-11f0-a774-10f60a355c40', 4, 'Enérgica', 0),
('8a6e6659-149f-11f0-a774-10f60a355c40', '8363d4e1-149f-11f0-a774-10f60a355c40', 5, 'Tímida', 1),
('8a6f7304-149f-11f0-a774-10f60a355c40', '8363d533-149f-11f0-a774-10f60a355c40', 1, 'El dedo', 1),
('8a6f7bd2-149f-11f0-a774-10f60a355c40', '8363d533-149f-11f0-a774-10f60a355c40', 2, 'La aguja', 0),
('8a6f7d51-149f-11f0-a774-10f60a355c40', '8363d533-149f-11f0-a774-10f60a355c40', 3, 'El hilo', 0),
('8a6f7e56-149f-11f0-a774-10f60a355c40', '8363d533-149f-11f0-a774-10f60a355c40', 4, 'La mano', 0),
('8a6f7f58-149f-11f0-a774-10f60a355c40', '8363d533-149f-11f0-a774-10f60a355c40', 5, 'La costura', 0),
('8a7097b2-149f-11f0-a774-10f60a355c40', '8363d580-149f-11f0-a774-10f60a355c40', 1, 'Hermano', 0),
('8a70a5b2-149f-11f0-a774-10f60a355c40', '8363d580-149f-11f0-a774-10f60a355c40', 2, 'Sobrino', 0),
('8a70a758-149f-11f0-a774-10f60a355c40', '8363d580-149f-11f0-a774-10f60a355c40', 3, 'Primo', 1),
('8a70a86b-149f-11f0-a774-10f60a355c40', '8363d580-149f-11f0-a774-10f60a355c40', 4, 'Tío', 0),
('8a70a96f-149f-11f0-a774-10f60a355c40', '8363d580-149f-11f0-a774-10f60a355c40', 5, 'Nieto', 0),
('8a71a930-149f-11f0-a774-10f60a355c40', '8363d5d0-149f-11f0-a774-10f60a355c40', 1, '6.456', 0),
('8a71acaf-149f-11f0-a774-10f60a355c40', '8363d5d0-149f-11f0-a774-10f60a355c40', 2, '8.968', 1),
('8a71addc-149f-11f0-a774-10f60a355c40', '8363d5d0-149f-11f0-a774-10f60a355c40', 3, '4.265', 0),
('8a71aeed-149f-11f0-a774-10f60a355c40', '8363d5d0-149f-11f0-a774-10f60a355c40', 4, '5.064', 0),
('8a71affa-149f-11f0-a774-10f60a355c40', '8363d5d0-149f-11f0-a774-10f60a355c40', 5, '4.108', 0),
('8a72b787-149f-11f0-a774-10f60a355c40', '8363d61d-149f-11f0-a774-10f60a355c40', 1, 'Probable', 0),
('8a72ba3e-149f-11f0-a774-10f60a355c40', '8363d61d-149f-11f0-a774-10f60a355c40', 2, 'Seguro', 1),
('8a72bb55-149f-11f0-a774-10f60a355c40', '8363d61d-149f-11f0-a774-10f60a355c40', 3, 'Dudoso', 0),
('8a72bc5b-149f-11f0-a774-10f60a355c40', '8363d61d-149f-11f0-a774-10f60a355c40', 4, 'Posible', 0),
('8a72bd5b-149f-11f0-a774-10f60a355c40', '8363d61d-149f-11f0-a774-10f60a355c40', 5, 'Diferido', 0),
('8a73bef9-149f-11f0-a774-10f60a355c40', '8363d66b-149f-11f0-a774-10f60a355c40', 1, 'Norte', 0),
('8a73c138-149f-11f0-a774-10f60a355c40', '8363d66b-149f-11f0-a774-10f60a355c40', 2, 'Polo', 0),
('8a73c23c-149f-11f0-a774-10f60a355c40', '8363d66b-149f-11f0-a774-10f60a355c40', 3, 'Ecuador', 0),
('8a73c335-149f-11f0-a774-10f60a355c40', '8363d66b-149f-11f0-a774-10f60a355c40', 4, 'Sur', 0),
('8a73c42c-149f-11f0-a774-10f60a355c40', '8363d66b-149f-11f0-a774-10f60a355c40', 5, 'Oeste', 1),
('8a74c18a-149f-11f0-a774-10f60a355c40', '8363d6b6-149f-11f0-a774-10f60a355c40', 1, 'Tristeza', 0),
('8a74c41c-149f-11f0-a774-10f60a355c40', '8363d6b6-149f-11f0-a774-10f60a355c40', 2, 'Humildad', 1),
('8a74c539-149f-11f0-a774-10f60a355c40', '8363d6b6-149f-11f0-a774-10f60a355c40', 3, 'Pobreza', 0),
('8a74c642-149f-11f0-a774-10f60a355c40', '8363d6b6-149f-11f0-a774-10f60a355c40', 4, 'Variedad', 0),
('8a74c746-149f-11f0-a774-10f60a355c40', '8363d6b6-149f-11f0-a774-10f60a355c40', 5, 'Altanería', 0),
('8a75bc50-149f-11f0-a774-10f60a355c40', '8363d702-149f-11f0-a774-10f60a355c40', 1, 'Pera', 0),
('8a75be91-149f-11f0-a774-10f60a355c40', '8363d702-149f-11f0-a774-10f60a355c40', 2, 'Plátano', 0),
('8a75bfaa-149f-11f0-a774-10f60a355c40', '8363d702-149f-11f0-a774-10f60a355c40', 3, 'Naranja', 0),
('8a75c0a9-149f-11f0-a774-10f60a355c40', '8363d702-149f-11f0-a774-10f60a355c40', 4, 'Pelota', 1),
('8a75c1a5-149f-11f0-a774-10f60a355c40', '8363d702-149f-11f0-a774-10f60a355c40', 5, 'Higo', 0),
('8a76b7d2-149f-11f0-a774-10f60a355c40', '8363d753-149f-11f0-a774-10f60a355c40', 1, 'Una cosa redonda que hace tic-tac', 0),
('8a76b9d2-149f-11f0-a774-10f60a355c40', '8363d753-149f-11f0-a774-10f60a355c40', 2, 'Un aparato que se coloca en las torres', 0),
('8a76bae1-149f-11f0-a774-10f60a355c40', '8363d753-149f-11f0-a774-10f60a355c40', 3, 'Un instrumento redondo con una cadena', 0),
('8a76bbd6-149f-11f0-a774-10f60a355c40', '8363d753-149f-11f0-a774-10f60a355c40', 4, 'Un instrumento que mide el tiempo', 1),
('8a76bccc-149f-11f0-a774-10f60a355c40', '8363d753-149f-11f0-a774-10f60a355c40', 5, 'Una cosa redonda que tiene aguja y un cristal', 0),
('8a77cc51-149f-11f0-a774-10f60a355c40', '8363d7a4-149f-11f0-a774-10f60a355c40', 1, '7', 0),
('8a77ce7d-149f-11f0-a774-10f60a355c40', '8363d7a4-149f-11f0-a774-10f60a355c40', 2, '4', 0),
('8a77cf9d-149f-11f0-a774-10f60a355c40', '8363d7a4-149f-11f0-a774-10f60a355c40', 3, '11', 0),
('8a77d0a5-149f-11f0-a774-10f60a355c40', '8363d7a4-149f-11f0-a774-10f60a355c40', 4, '3', 1),
('8a77d1ab-149f-11f0-a774-10f60a355c40', '8363d7a4-149f-11f0-a774-10f60a355c40', 5, '10', 0),
('8a78bee1-149f-11f0-a774-10f60a355c40', '8363d815-149f-11f0-a774-10f60a355c40', 1, 'A la carrera', 0),
('8a78c120-149f-11f0-a774-10f60a355c40', '8363d815-149f-11f0-a774-10f60a355c40', 2, 'Al caballo', 0),
('8a78c27f-149f-11f0-a774-10f60a355c40', '8363d815-149f-11f0-a774-10f60a355c40', 3, 'Al tranvía', 0),
('8a78c3a2-149f-11f0-a774-10f60a355c40', '8363d815-149f-11f0-a774-10f60a355c40', 4, 'Al tren', 0),
('8a78c4bc-149f-11f0-a774-10f60a355c40', '8363d815-149f-11f0-a774-10f60a355c40', 5, 'A la bicicleta', 1),
('8a79b723-149f-11f0-a774-10f60a355c40', '8363d871-149f-11f0-a774-10f60a355c40', 1, 'Con el fin de que los transeúntes sepan en dónde están', 0),
('8a79c0da-149f-11f0-a774-10f60a355c40', '8363d871-149f-11f0-a774-10f60a355c40', 2, 'Para que se puedan ver bien los artículos expuestos y la gente sienta deseos de comprar', 1),
('8a79c2c0-149f-11f0-a774-10f60a355c40', '8363d871-149f-11f0-a774-10f60a355c40', 3, 'Porque los comercios pagan muy barata la corriente eléctrica', 0),
('8a79c404-149f-11f0-a774-10f60a355c40', '8363d871-149f-11f0-a774-10f60a355c40', 4, 'Para aumentar la iluminación de la calle', 0),
('8a79c541-149f-11f0-a774-10f60a355c40', '8363d871-149f-11f0-a774-10f60a355c40', 5, 'Porque el Ayuntamiento les obliga', 0),
('8a7ac61d-149f-11f0-a774-10f60a355c40', '8363d8bc-149f-11f0-a774-10f60a355c40', 1, 'Semilla', 0),
('8a7ac886-149f-11f0-a774-10f60a355c40', '8363d8bc-149f-11f0-a774-10f60a355c40', 2, 'Árbol', 0),
('8a7ac9c4-149f-11f0-a774-10f60a355c40', '8363d8bc-149f-11f0-a774-10f60a355c40', 3, 'Ciruela', 1),
('8a7acb18-149f-11f0-a774-10f60a355c40', '8363d8bc-149f-11f0-a774-10f60a355c40', 4, 'Jugo', 0),
('8a7acc38-149f-11f0-a774-10f60a355c40', '8363d8bc-149f-11f0-a774-10f60a355c40', 5, 'Mondadura', 0),
('8a7bd181-149f-11f0-a774-10f60a355c40', '8363d90f-149f-11f0-a774-10f60a355c40', 1, 'La J', 0),
('8a7bd37f-149f-11f0-a774-10f60a355c40', '8363d90f-149f-11f0-a774-10f60a355c40', 2, 'La G', 0),
('8a7bd48f-149f-11f0-a774-10f60a355c40', '8363d90f-149f-11f0-a774-10f60a355c40', 3, 'La M', 0),
('8a7bd58b-149f-11f0-a774-10f60a355c40', '8363d90f-149f-11f0-a774-10f60a355c40', 4, 'La L', 1),
('8a7bd686-149f-11f0-a774-10f60a355c40', '8363d90f-149f-11f0-a774-10f60a355c40', 5, 'La N', 0),
('8a7ccbc3-149f-11f0-a774-10f60a355c40', '8363d960-149f-11f0-a774-10f60a355c40', 1, 'La Presidencia del Consejo de Ministros', 0),
('8a7cd304-149f-11f0-a774-10f60a355c40', '8363d960-149f-11f0-a774-10f60a355c40', 2, 'El Senado', 0),
('8a7cd55c-149f-11f0-a774-10f60a355c40', '8363d960-149f-11f0-a774-10f60a355c40', 3, 'La República', 1),
('8a7cd71f-149f-11f0-a774-10f60a355c40', '8363d960-149f-11f0-a774-10f60a355c40', 4, 'Un Monárquico', 0),
('8a7cd8df-149f-11f0-a774-10f60a355c40', '8363d960-149f-11f0-a774-10f60a355c40', 5, 'Un republicano', 0),
('8a7df1a9-149f-11f0-a774-10f60a355c40', '8363d9ad-149f-11f0-a774-10f60a355c40', 1, 'La almohada', 0),
('8a7dfacd-149f-11f0-a774-10f60a355c40', '8363d9ad-149f-11f0-a774-10f60a355c40', 2, 'El conejo', 0),
('8a7dfc44-149f-11f0-a774-10f60a355c40', '8363d9ad-149f-11f0-a774-10f60a355c40', 3, 'El pájaro', 1),
('8a7dfd45-149f-11f0-a774-10f60a355c40', '8363d9ad-149f-11f0-a774-10f60a355c40', 4, 'La cabra', 0),
('8a7dfe3e-149f-11f0-a774-10f60a355c40', '8363d9ad-149f-11f0-a774-10f60a355c40', 5, 'La cama', 0),
('8a7ef537-149f-11f0-a774-10f60a355c40', '8363d9ff-149f-11f0-a774-10f60a355c40', 1, 'Un animal terrestre', 0),
('8a7efd14-149f-11f0-a774-10f60a355c40', '8363d9ff-149f-11f0-a774-10f60a355c40', 2, 'Un ser que tiene cuatro patar y una cola', 0),
('8a7f07ae-149f-11f0-a774-10f60a355c40', '8363d9ff-149f-11f0-a774-10f60a355c40', 3, 'Un animal pequeño y avispado', 0),
('8a7f0997-149f-11f0-a774-10f60a355c40', '8363d9ff-149f-11f0-a774-10f60a355c40', 4, 'Un carnero joven', 1),
('8a7f0b40-149f-11f0-a774-10f60a355c40', '8363d9ff-149f-11f0-a774-10f60a355c40', 5, 'Un animalito que come hierba', 0),
('8a8007cc-149f-11f0-a774-10f60a355c40', '8363da5f-149f-11f0-a774-10f60a355c40', 1, 'Suave', 0),
('8a801097-149f-11f0-a774-10f60a355c40', '8363da5f-149f-11f0-a774-10f60a355c40', 2, 'Pequeño', 0),
('8a80120a-149f-11f0-a774-10f60a355c40', '8363da5f-149f-11f0-a774-10f60a355c40', 3, 'Macizo', 0),
('8a80130a-149f-11f0-a774-10f60a355c40', '8363da5f-149f-11f0-a774-10f60a355c40', 4, 'Gris', 0),
('8a801405-149f-11f0-a774-10f60a355c40', '8363da5f-149f-11f0-a774-10f60a355c40', 5, 'Ruido', 1),
('8a812500-149f-11f0-a774-10f60a355c40', '8363dab3-149f-11f0-a774-10f60a355c40', 1, 'Muy bueno', 0),
('8a812e13-149f-11f0-a774-10f60a355c40', '8363dab3-149f-11f0-a774-10f60a355c40', 2, 'Mediano', 0),
('8a812f86-149f-11f0-a774-10f60a355c40', '8363dab3-149f-11f0-a774-10f60a355c40', 3, 'Malo', 1),
('8a813087-149f-11f0-a774-10f60a355c40', '8363dab3-149f-11f0-a774-10f60a355c40', 4, 'Nulo', 0),
('8a813180-149f-11f0-a774-10f60a355c40', '8363dab3-149f-11f0-a774-10f60a355c40', 5, 'Superior', 0),
('8a822044-149f-11f0-a774-10f60a355c40', '8363db03-149f-11f0-a774-10f60a355c40', 1, 'Billete', 0),
('8a82298a-149f-11f0-a774-10f60a355c40', '8363db03-149f-11f0-a774-10f60a355c40', 2, 'Hueso', 0),
('8a822b02-149f-11f0-a774-10f60a355c40', '8363db03-149f-11f0-a774-10f60a355c40', 3, 'Cuerda', 0),
('8a822c03-149f-11f0-a774-10f60a355c40', '8363db03-149f-11f0-a774-10f60a355c40', 4, 'Lápiz', 0),
('8a822cf8-149f-11f0-a774-10f60a355c40', '8363db03-149f-11f0-a774-10f60a355c40', 5, 'Llave', 1),
('8a833afc-149f-11f0-a774-10f60a355c40', '8363db5b-149f-11f0-a774-10f60a355c40', 1, 'Rabia', 0),
('8a834437-149f-11f0-a774-10f60a355c40', '8363db5b-149f-11f0-a774-10f60a355c40', 2, 'Piedad', 1),
('8a8345b3-149f-11f0-a774-10f60a355c40', '8363db5b-149f-11f0-a774-10f60a355c40', 3, 'Desprecio', 0),
('8a8346e5-149f-11f0-a774-10f60a355c40', '8363db5b-149f-11f0-a774-10f60a355c40', 4, 'Desdén', 0),
('8a836845-149f-11f0-a774-10f60a355c40', '8363db5b-149f-11f0-a774-10f60a355c40', 5, 'Añoranza', 0),
('8a84bae9-149f-11f0-a774-10f60a355c40', '8363dbb6-149f-11f0-a774-10f60a355c40', 1, 'Exploración', 0),
('8a84c08b-149f-11f0-a774-10f60a355c40', '8363dbb6-149f-11f0-a774-10f60a355c40', 2, 'Adaptación', 0),
('8a84c2a2-149f-11f0-a774-10f60a355c40', '8363dbb6-149f-11f0-a774-10f60a355c40', 3, 'Renovación', 0),
('8a84c46c-149f-11f0-a774-10f60a355c40', '8363dbb6-149f-11f0-a774-10f60a355c40', 4, 'Novedad', 0),
('8a84c639-149f-11f0-a774-10f60a355c40', '8363dbb6-149f-11f0-a774-10f60a355c40', 5, 'Invención', 1),
('8a860a23-149f-11f0-a774-10f60a355c40', '8363dc09-149f-11f0-a774-10f60a355c40', 1, 'Vuelo', 0),
('8a861177-149f-11f0-a774-10f60a355c40', '8363dc09-149f-11f0-a774-10f60a355c40', 2, 'Miel', 0),
('8a861545-149f-11f0-a774-10f60a355c40', '8363dc09-149f-11f0-a774-10f60a355c40', 3, 'Alas', 0),
('8a861723-149f-11f0-a774-10f60a355c40', '8363dc09-149f-11f0-a774-10f60a355c40', 4, 'Cera', 0),
('8a8618e5-149f-11f0-a774-10f60a355c40', '8363dc09-149f-11f0-a774-10f60a355c40', 5, 'Aguijón', 1),
('8a874867-149f-11f0-a774-10f60a355c40', '8363dc58-149f-11f0-a774-10f60a355c40', 1, '7', 1),
('8a875082-149f-11f0-a774-10f60a355c40', '8363dc58-149f-11f0-a774-10f60a355c40', 2, '6', 0),
('8a875300-149f-11f0-a774-10f60a355c40', '8363dc58-149f-11f0-a774-10f60a355c40', 3, '5', 0),
('8a8754d1-149f-11f0-a774-10f60a355c40', '8363dc58-149f-11f0-a774-10f60a355c40', 4, '8', 0),
('8a875684-149f-11f0-a774-10f60a355c40', '8363dc58-149f-11f0-a774-10f60a355c40', 5, '9', 0),
('8a88d6ea-149f-11f0-a774-10f60a355c40', '8363dcaa-149f-11f0-a774-10f60a355c40', 1, 'Los caballos son cada día más escasos', 0),
('8a88da09-149f-11f0-a774-10f60a355c40', '8363dcaa-149f-11f0-a774-10f60a355c40', 2, 'Los caballos se desbocan fácilmente', 0),
('8a88db1b-149f-11f0-a774-10f60a355c40', '8363dcaa-149f-11f0-a774-10f60a355c40', 3, 'Los autos nos hacen ganar tiempo', 1),
('8a88dc19-149f-11f0-a774-10f60a355c40', '8363dcaa-149f-11f0-a774-10f60a355c40', 4, 'Los autos son más económicos que los carros', 0),
('8a88dd0e-149f-11f0-a774-10f60a355c40', '8363dcaa-149f-11f0-a774-10f60a355c40', 5, 'Las reparaciones de los autos son más baratas que las de los carros', 0),
('8a8ab265-149f-11f0-a774-10f60a355c40', '8363dd06-149f-11f0-a774-10f60a355c40', 1, 'La manzana', 0),
('8a8ab951-149f-11f0-a774-10f60a355c40', '8363dd06-149f-11f0-a774-10f60a355c40', 2, 'El huevo', 1),
('8a8abbac-149f-11f0-a774-10f60a355c40', '8363dd06-149f-11f0-a774-10f60a355c40', 3, 'El jugo', 0),
('8a8abd8c-149f-11f0-a774-10f60a355c40', '8363dd06-149f-11f0-a774-10f60a355c40', 4, 'El melocotón', 0),
('8a8abff2-149f-11f0-a774-10f60a355c40', '8363dd06-149f-11f0-a774-10f60a355c40', 5, 'La gallina', 0),
('8a8bf443-149f-11f0-a774-10f60a355c40', '8363dd5a-149f-11f0-a774-10f60a355c40', 1, 'Juez', 0),
('8a8bf916-149f-11f0-a774-10f60a355c40', '8363dd5a-149f-11f0-a774-10f60a355c40', 2, 'Hospicio', 0),
('8a8bfb6c-149f-11f0-a774-10f60a355c40', '8363dd5a-149f-11f0-a774-10f60a355c40', 3, 'Doctor', 0),
('8a8bfd49-149f-11f0-a774-10f60a355c40', '8363dd5a-149f-11f0-a774-10f60a355c40', 4, 'Presidio', 1),
('8a8bff07-149f-11f0-a774-10f60a355c40', '8363dd5a-149f-11f0-a774-10f60a355c40', 5, 'Sestencia', 0),
('8a8d941f-149f-11f0-a774-10f60a355c40', '8363ddb1-149f-11f0-a774-10f60a355c40', 1, 'La S', 0),
('8a8d9a88-149f-11f0-a774-10f60a355c40', '8363ddb1-149f-11f0-a774-10f60a355c40', 2, 'La N', 0),
('8a8d9d41-149f-11f0-a774-10f60a355c40', '8363ddb1-149f-11f0-a774-10f60a355c40', 3, 'La O', 1),
('8a8d9f28-149f-11f0-a774-10f60a355c40', '8363ddb1-149f-11f0-a774-10f60a355c40', 4, 'La D', 0),
('8a8da0fb-149f-11f0-a774-10f60a355c40', '8363ddb1-149f-11f0-a774-10f60a355c40', 5, 'La C', 0),
('8a8f35ae-149f-11f0-a774-10f60a355c40', '8363de14-149f-11f0-a774-10f60a355c40', 1, '10', 1),
('8a8f3f82-149f-11f0-a774-10f60a355c40', '8363de14-149f-11f0-a774-10f60a355c40', 2, '5', 0),
('8a8f420c-149f-11f0-a774-10f60a355c40', '8363de14-149f-11f0-a774-10f60a355c40', 3, '8', 0),
('8a8f43ec-149f-11f0-a774-10f60a355c40', '8363de14-149f-11f0-a774-10f60a355c40', 4, '3', 0),
('8a8f45b3-149f-11f0-a774-10f60a355c40', '8363de14-149f-11f0-a774-10f60a355c40', 5, '25', 0),
('8a907138-149f-11f0-a774-10f60a355c40', '8363de70-149f-11f0-a774-10f60a355c40', 1, 'Se va', 0),
('8a907980-149f-11f0-a774-10f60a355c40', '8363de70-149f-11f0-a774-10f60a355c40', 2, 'Decrece', 1),
('8a907afb-149f-11f0-a774-10f60a355c40', '8363de70-149f-11f0-a774-10f60a355c40', 3, 'Se agota', 0),
('8a907bfb-149f-11f0-a774-10f60a355c40', '8363de70-149f-11f0-a774-10f60a355c40', 4, 'Muere', 0),
('8a907cf6-149f-11f0-a774-10f60a355c40', '8363de70-149f-11f0-a774-10f60a355c40', 5, 'Desaparece', 0),
('8a919d72-149f-11f0-a774-10f60a355c40', '8363dec5-149f-11f0-a774-10f60a355c40', 1, 'Hay oro que no brilla', 0),
('8a91aa74-149f-11f0-a774-10f60a355c40', '8363dec5-149f-11f0-a774-10f60a355c40', 2, 'No hay que dejarse ', 1),
('8a91abf7-149f-11f0-a774-10f60a355c40', '8363dec5-149f-11f0-a774-10f60a355c40', 3, 'El diamante es más brillante que el oro', 0),
('8a91ad01-149f-11f0-a774-10f60a355c40', '8363dec5-149f-11f0-a774-10f60a355c40', 4, 'No hay que llevar bisutería que imi', 0),
('8a91adfd-149f-11f0-a774-10f60a355c40', '8363dec5-149f-11f0-a774-10f60a355c40', 5, 'Hay gentes a quienes gusta ostentar su riqueza', 0),
('8a92a8db-149f-11f0-a774-10f60a355c40', '8363df20-149f-11f0-a774-10f60a355c40', 1, 'La D', 1),
('8a92aed6-149f-11f0-a774-10f60a355c40', '8363df20-149f-11f0-a774-10f60a355c40', 2, 'La K', 0),
('8a92b013-149f-11f0-a774-10f60a355c40', '8363df20-149f-11f0-a774-10f60a355c40', 3, 'La M', 0),
('8a92b10c-149f-11f0-a774-10f60a355c40', '8363df20-149f-11f0-a774-10f60a355c40', 4, 'La S', 0),
('8a92b1fe-149f-11f0-a774-10f60a355c40', '8363df20-149f-11f0-a774-10f60a355c40', 5, 'La C', 0),
('8a93da7b-149f-11f0-a774-10f60a355c40', '8363df79-149f-11f0-a774-10f60a355c40', 1, 'Es preferible poseer una pequeña cosa que esperar una grande', 1),
('8a93e235-149f-11f0-a774-10f60a355c40', '8363df79-149f-11f0-a774-10f60a355c40', 2, 'El corazón fuerte no se deja rendir por la lisonja', 0),
('8a93e3af-149f-11f0-a774-10f60a355c40', '8363df79-149f-11f0-a774-10f60a355c40', 3, 'Ningún hombre suele apartarse de la verdad sin engañarse a sí mismo', 0),
('8a93e4d4-149f-11f0-a774-10f60a355c40', '8363df79-149f-11f0-a774-10f60a355c40', 4, 'El que está en todas partes no está en ninguna', 0),
('8a93e5e6-149f-11f0-a774-10f60a355c40', '8363df79-149f-11f0-a774-10f60a355c40', 5, 'Cuando se tiene una cosa hay que procurar conservarla', 0),
('8a94f698-149f-11f0-a774-10f60a355c40', '8363dfcd-149f-11f0-a774-10f60a355c40', 1, 'Retoño', 0),
('8a94fceb-149f-11f0-a774-10f60a355c40', '8363dfcd-149f-11f0-a774-10f60a355c40', 2, 'Hoja', 0),
('8a950c5f-149f-11f0-a774-10f60a355c40', '8363dfcd-149f-11f0-a774-10f60a355c40', 3, 'Árbol', 1),
('8a951b06-149f-11f0-a774-10f60a355c40', '8363dfcd-149f-11f0-a774-10f60a355c40', 4, 'Rama', 0),
('8a951c77-149f-11f0-a774-10f60a355c40', '8363dfcd-149f-11f0-a774-10f60a355c40', 5, 'Tronco', 0),
('8a9625c7-149f-11f0-a774-10f60a355c40', '8363e039-149f-11f0-a774-10f60a355c40', 1, 'La D', 0),
('8a962d78-149f-11f0-a774-10f60a355c40', '8363e039-149f-11f0-a774-10f60a355c40', 2, 'La Q', 1),
('8a962ed1-149f-11f0-a774-10f60a355c40', '8363e039-149f-11f0-a774-10f60a355c40', 3, 'La A', 0),
('8a963056-149f-11f0-a774-10f60a355c40', '8363e039-149f-11f0-a774-10f60a355c40', 4, 'La C', 0),
('8a9631fc-149f-11f0-a774-10f60a355c40', '8363e039-149f-11f0-a774-10f60a355c40', 5, 'La Y', 0),
('8a977066-149f-11f0-a774-10f60a355c40', '8363e099-149f-11f0-a774-10f60a355c40', 1, 'Mayor', 1),
('8a977748-149f-11f0-a774-10f60a355c40', '8363e099-149f-11f0-a774-10f60a355c40', 2, 'Más pequeño', 0),
('8a9778a5-149f-11f0-a774-10f60a355c40', '8363e099-149f-11f0-a774-10f60a355c40', 3, 'Iguales', 0),
('8a9779a8-149f-11f0-a774-10f60a355c40', '8363e099-149f-11f0-a774-10f60a355c40', 4, 'No se puede saber', 0),
('8a977aa4-149f-11f0-a774-10f60a355c40', '8363e099-149f-11f0-a774-10f60a355c40', 5, 'Ninguna de las anteriores', 0),
('8a98accf-149f-11f0-a774-10f60a355c40', '8363e0f7-149f-11f0-a774-10f60a355c40', 1, 'Raspador', 0),
('8a98b677-149f-11f0-a774-10f60a355c40', '8363e0f7-149f-11f0-a774-10f60a355c40', 2, 'Queso', 0),
('8a98b81d-149f-11f0-a774-10f60a355c40', '8363e0f7-149f-11f0-a774-10f60a355c40', 3, 'Gruta', 1),
('8a98b92c-149f-11f0-a774-10f60a355c40', '8363e0f7-149f-11f0-a774-10f60a355c40', 4, 'Noche', 0),
('8a98ba2a-149f-11f0-a774-10f60a355c40', '8363e0f7-149f-11f0-a774-10f60a355c40', 5, 'Pintura', 0),
('8a99e554-149f-11f0-a774-10f60a355c40', '8363e14f-149f-11f0-a774-10f60a355c40', 1, 'La G', 0),
('8a99ec17-149f-11f0-a774-10f60a355c40', '8363e14f-149f-11f0-a774-10f60a355c40', 2, 'La T', 1),
('8a99ed9a-149f-11f0-a774-10f60a355c40', '8363e14f-149f-11f0-a774-10f60a355c40', 3, 'La S', 0),
('8a99eea5-149f-11f0-a774-10f60a355c40', '8363e14f-149f-11f0-a774-10f60a355c40', 4, 'La C', 0),
('8a99efa2-149f-11f0-a774-10f60a355c40', '8363e14f-149f-11f0-a774-10f60a355c40', 5, 'La A', 0),
('8a9b069d-149f-11f0-a774-10f60a355c40', '8363e1ae-149f-11f0-a774-10f60a355c40', 1, 'Resuélvete a hacer lo que debes y haz sin falta lo que hayas resuelto', 0),
('8a9b139d-149f-11f0-a774-10f60a355c40', '8363e1ae-149f-11f0-a774-10f60a355c40', 2, 'Hay que ganarse la vida a fuerza de amor', 0),
('8a9b1524-149f-11f0-a774-10f60a355c40', '8363e1ae-149f-11f0-a774-10f60a355c40', 3, 'No se deben menospreciar las cosas pequeñas', 1),
('8a9b1631-149f-11f0-a774-10f60a355c40', '8363e1ae-149f-11f0-a774-10f60a355c40', 4, 'En casa pobre no es necesario granero', 0),
('8a9b1730-149f-11f0-a774-10f60a355c40', '8363e1ae-149f-11f0-a774-10f60a355c40', 5, 'Las personas deben ayudarse unas a otras', 0),
('8a9c3e5e-149f-11f0-a774-10f60a355c40', '8363e20a-149f-11f0-a774-10f60a355c40', 1, 'Carlos es mayor que Juan', 0),
('8a9c4d2f-149f-11f0-a774-10f60a355c40', '8363e20a-149f-11f0-a774-10f60a355c40', 2, 'Juan y Carlos tienen la misma edad', 0),
('8a9c4ecc-149f-11f0-a774-10f60a355c40', '8363e20a-149f-11f0-a774-10f60a355c40', 3, 'Carlos es más joven que Juan', 1),
('8a9c4fd3-149f-11f0-a774-10f60a355c40', '8363e20a-149f-11f0-a774-10f60a355c40', 4, 'Juan es menor que Carlos', 0),
('8a9c50d8-149f-11f0-a774-10f60a355c40', '8363e20a-149f-11f0-a774-10f60a355c40', 5, 'José es el menor de los tres', 0),
('8a9d4bfe-149f-11f0-a774-10f60a355c40', '8363e25e-149f-11f0-a774-10f60a355c40', 1, 'La T', 1),
('8a9d54a2-149f-11f0-a774-10f60a355c40', '8363e25e-149f-11f0-a774-10f60a355c40', 2, 'La P', 0),
('8a9d5620-149f-11f0-a774-10f60a355c40', '8363e25e-149f-11f0-a774-10f60a355c40', 3, 'La D', 0),
('8a9d572b-149f-11f0-a774-10f60a355c40', '8363e25e-149f-11f0-a774-10f60a355c40', 4, 'La B', 0),
('8a9d5823-149f-11f0-a774-10f60a355c40', '8363e25e-149f-11f0-a774-10f60a355c40', 5, 'La S', 0),
('8a9e8959-149f-11f0-a774-10f60a355c40', '8363e2bf-149f-11f0-a774-10f60a355c40', 1, '10', 0),
('8a9e92fa-149f-11f0-a774-10f60a355c40', '8363e2bf-149f-11f0-a774-10f60a355c40', 2, '12', 0),
('8a9e94ba-149f-11f0-a774-10f60a355c40', '8363e2bf-149f-11f0-a774-10f60a355c40', 3, '13', 1),
('8a9e95bc-149f-11f0-a774-10f60a355c40', '8363e2bf-149f-11f0-a774-10f60a355c40', 4, '15', 0),
('8a9e96b4-149f-11f0-a774-10f60a355c40', '8363e2bf-149f-11f0-a774-10f60a355c40', 5, '8', 0),
('8a9f94e4-149f-11f0-a774-10f60a355c40', '8363e330-149f-11f0-a774-10f60a355c40', 1, 'Un error', 0),
('8a9f9dbd-149f-11f0-a774-10f60a355c40', '8363e330-149f-11f0-a774-10f60a355c40', 2, 'Una afirmación voluntariamente falsa', 1),
('8a9f9f3f-149f-11f0-a774-10f60a355c40', '8363e330-149f-11f0-a774-10f60a355c40', 3, 'Una afirmación involuntariamente falsa', 0),
('8a9fa043-149f-11f0-a774-10f60a355c40', '8363e330-149f-11f0-a774-10f60a355c40', 4, 'Una exageración', 0),
('8a9fa141-149f-11f0-a774-10f60a355c40', '8363e330-149f-11f0-a774-10f60a355c40', 5, 'Una respuesta inexacta', 0),
('8aa0d4c6-149f-11f0-a774-10f60a355c40', '8363e395-149f-11f0-a774-10f60a355c40', 1, 'La M', 0),
('8aa0de7d-149f-11f0-a774-10f60a355c40', '8363e395-149f-11f0-a774-10f60a355c40', 2, 'La Y', 0),
('8aa0e002-149f-11f0-a774-10f60a355c40', '8363e395-149f-11f0-a774-10f60a355c40', 3, 'La S', 0),
('8aa0e10d-149f-11f0-a774-10f60a355c40', '8363e395-149f-11f0-a774-10f60a355c40', 4, 'La G', 1),
('8aa0e214-149f-11f0-a774-10f60a355c40', '8363e395-149f-11f0-a774-10f60a355c40', 5, 'La P', 0),
('8aa1e6ae-149f-11f0-a774-10f60a355c40', '8363e3f0-149f-11f0-a774-10f60a355c40', 1, 'Permanente', 1),
('8aa1eef9-149f-11f0-a774-10f60a355c40', '8363e3f0-149f-11f0-a774-10f60a355c40', 2, 'Firme', 0),
('8aa1f072-149f-11f0-a774-10f60a355c40', '8363e3f0-149f-11f0-a774-10f60a355c40', 3, 'Estacionaria', 0),
('8aa1f177-149f-11f0-a774-10f60a355c40', '8363e3f0-149f-11f0-a774-10f60a355c40', 4, 'Sólida', 0),
('8aa1f271-149f-11f0-a774-10f60a355c40', '8363e3f0-149f-11f0-a774-10f60a355c40', 5, 'Verdadera', 0),
('8aa2ff33-149f-11f0-a774-10f60a355c40', '8363e446-149f-11f0-a774-10f60a355c40', 1, 'Andrés es mayor que Luis', 1),
('8aa30926-149f-11f0-a774-10f60a355c40', '8363e446-149f-11f0-a774-10f60a355c40', 2, 'Pablo es el más joven', 0),
('8aa30abd-149f-11f0-a774-10f60a355c40', '8363e446-149f-11f0-a774-10f60a355c40', 3, 'Andrés y Luis tienen la misma edad', 0),
('8aa30bd0-149f-11f0-a774-10f60a355c40', '8363e446-149f-11f0-a774-10f60a355c40', 4, 'El mayor de todos es Luis', 0),
('8aa30cdd-149f-11f0-a774-10f60a355c40', '8363e446-149f-11f0-a774-10f60a355c40', 5, 'Pablo es mayor que Andrés', 0),
('8aa4152b-149f-11f0-a774-10f60a355c40', '8363e499-149f-11f0-a774-10f60a355c40', 1, 'Árbol', 0),
('8aa41e60-149f-11f0-a774-10f60a355c40', '8363e499-149f-11f0-a774-10f60a355c40', 2, 'Muñeca', 0),
('8aa41fda-149f-11f0-a774-10f60a355c40', '8363e499-149f-11f0-a774-10f60a355c40', 3, 'Carnero', 1),
('8aa420e2-149f-11f0-a774-10f60a355c40', '8363e499-149f-11f0-a774-10f60a355c40', 4, 'Pluma', 0),
('8aa421de-149f-11f0-a774-10f60a355c40', '8363e499-149f-11f0-a774-10f60a355c40', 5, 'Pie', 0),
('8aa53a4a-149f-11f0-a774-10f60a355c40', '8363e4ed-149f-11f0-a774-10f60a355c40', 1, 'El hierro batido en frío, es malo', 0),
('8aa543d6-149f-11f0-a774-10f60a355c40', '8363e4ed-149f-11f0-a774-10f60a355c40', 2, 'No se pueden hacer varias cosas a mismo tiempo', 0),
('8aa54552-149f-11f0-a774-10f60a355c40', '8363e4ed-149f-11f0-a774-10f60a355c40', 3, 'Hay que saber aprovechar el momento oportuno', 1),
('8aa54652-149f-11f0-a774-10f60a355c40', '8363e4ed-149f-11f0-a774-10f60a355c40', 4, 'Los herreros han de trabajar siempre de prisa', 0),
('8aa54772-149f-11f0-a774-10f60a355c40', '8363e4ed-149f-11f0-a774-10f60a355c40', 5, 'El trabajo del hierro es cansado', 0),
('8aa6c11f-149f-11f0-a774-10f60a355c40', '8363e548-149f-11f0-a774-10f60a355c40', 1, 'La S', 0),
('8aa6cc7a-149f-11f0-a774-10f60a355c40', '8363e548-149f-11f0-a774-10f60a355c40', 2, 'La M', 0),
('8aa6ce20-149f-11f0-a774-10f60a355c40', '8363e548-149f-11f0-a774-10f60a355c40', 3, 'La H', 0),
('8aa6cf2b-149f-11f0-a774-10f60a355c40', '8363e548-149f-11f0-a774-10f60a355c40', 4, 'La D', 1),
('8aa6d02b-149f-11f0-a774-10f60a355c40', '8363e548-149f-11f0-a774-10f60a355c40', 5, 'La A', 0),
('8aa7c94b-149f-11f0-a774-10f60a355c40', '8363e5a6-149f-11f0-a774-10f60a355c40', 1, 'El estado', 0),
('8aa7d1a7-149f-11f0-a774-10f60a355c40', '8363e5a6-149f-11f0-a774-10f60a355c40', 2, 'La provincia', 0),
('8aa7d31b-149f-11f0-a774-10f60a355c40', '8363e5a6-149f-11f0-a774-10f60a355c40', 3, 'La ciudad', 1),
('8aa7d419-149f-11f0-a774-10f60a355c40', '8363e5a6-149f-11f0-a774-10f60a355c40', 4, 'El patrón', 0),
('8aa7d514-149f-11f0-a774-10f60a355c40', '8363e5a6-149f-11f0-a774-10f60a355c40', 5, 'El juez', 0),
('8aa8d609-149f-11f0-a774-10f60a355c40', '8363e5fa-149f-11f0-a774-10f60a355c40', 1, '1', 0),
('8aa8d8e9-149f-11f0-a774-10f60a355c40', '8363e5fa-149f-11f0-a774-10f60a355c40', 2, '2', 0),
('8aa8d9f9-149f-11f0-a774-10f60a355c40', '8363e5fa-149f-11f0-a774-10f60a355c40', 3, '3', 1),
('8aa8db55-149f-11f0-a774-10f60a355c40', '8363e5fa-149f-11f0-a774-10f60a355c40', 4, '6', 0),
('8aa8dc60-149f-11f0-a774-10f60a355c40', '8363e5fa-149f-11f0-a774-10f60a355c40', 5, '5', 0),
('8aa9e086-149f-11f0-a774-10f60a355c40', '8363e659-149f-11f0-a774-10f60a355c40', 1, 'Promesa', 0),
('8aa9e2b4-149f-11f0-a774-10f60a355c40', '8363e659-149f-11f0-a774-10f60a355c40', 2, 'Debate', 0),
('8aa9e3d1-149f-11f0-a774-10f60a355c40', '8363e659-149f-11f0-a774-10f60a355c40', 3, 'Amnistía', 0),
('8aa9e4ce-149f-11f0-a774-10f60a355c40', '8363e659-149f-11f0-a774-10f60a355c40', 4, 'Proceso', 0),
('8aa9e5c8-149f-11f0-a774-10f60a355c40', '8363e659-149f-11f0-a774-10f60a355c40', 5, 'Avenencia', 1),
('8aab111e-149f-11f0-a774-10f60a355c40', '8363e6ae-149f-11f0-a774-10f60a355c40', 1, 'La E', 0),
('8aab1462-149f-11f0-a774-10f60a355c40', '8363e6ae-149f-11f0-a774-10f60a355c40', 2, 'La F', 0),
('8aab15b4-149f-11f0-a774-10f60a355c40', '8363e6ae-149f-11f0-a774-10f60a355c40', 3, 'La L', 0),
('8aab16d5-149f-11f0-a774-10f60a355c40', '8363e6ae-149f-11f0-a774-10f60a355c40', 4, 'La S', 1),
('8aab17e2-149f-11f0-a774-10f60a355c40', '8363e6ae-149f-11f0-a774-10f60a355c40', 5, 'La D', 0),
('8aac4f45-149f-11f0-a774-10f60a355c40', '8363e70f-149f-11f0-a774-10f60a355c40', 1, '2', 0),
('8aac5905-149f-11f0-a774-10f60a355c40', '8363e70f-149f-11f0-a774-10f60a355c40', 2, '3', 0),
('8aac6a17-149f-11f0-a774-10f60a355c40', '8363e70f-149f-11f0-a774-10f60a355c40', 3, '4', 1),
('8aac6bc6-149f-11f0-a774-10f60a355c40', '8363e70f-149f-11f0-a774-10f60a355c40', 4, '5', 0),
('8aac6d62-149f-11f0-a774-10f60a355c40', '8363e70f-149f-11f0-a774-10f60a355c40', 5, '6', 0),
('8aade1c8-149f-11f0-a774-10f60a355c40', '8363e76d-149f-11f0-a774-10f60a355c40', 1, 'Un tubo de cristal graduado que contiene mercurio', 0),
('8aadedc2-149f-11f0-a774-10f60a355c40', '8363e76d-149f-11f0-a774-10f60a355c40', 2, 'Un instrumento para medir la fiebre', 0),
('8aadf58c-149f-11f0-a774-10f60a355c40', '8363e76d-149f-11f0-a774-10f60a355c40', 3, 'Un aparato muy sensible a calor', 0),
('8aadf804-149f-11f0-a774-10f60a355c40', '8363e76d-149f-11f0-a774-10f60a355c40', 4, 'Un instrumento para medir la temperatura', 1),
('8aadfa30-149f-11f0-a774-10f60a355c40', '8363e76d-149f-11f0-a774-10f60a355c40', 5, 'Un objeto que utilizan los médicos', 0),
('8aaf5d0d-149f-11f0-a774-10f60a355c40', '8363e7c4-149f-11f0-a774-10f60a355c40', 1, 'Bravo', 1),
('8aaf6163-149f-11f0-a774-10f60a355c40', '8363e7c4-149f-11f0-a774-10f60a355c40', 2, 'Busto', 0),
('8aaf62d3-149f-11f0-a774-10f60a355c40', '8363e7c4-149f-11f0-a774-10f60a355c40', 3, 'Brocha', 0),
('8aaf6417-149f-11f0-a774-10f60a355c40', '8363e7c4-149f-11f0-a774-10f60a355c40', 4, 'Bujía', 0),
('8aaf6552-149f-11f0-a774-10f60a355c40', '8363e7c4-149f-11f0-a774-10f60a355c40', 5, 'Bretón', 0),
('8ab0d5b7-149f-11f0-a774-10f60a355c40', '8363e81b-149f-11f0-a774-10f60a355c40', 1, '10', 0),
('8ab0da76-149f-11f0-a774-10f60a355c40', '8363e81b-149f-11f0-a774-10f60a355c40', 2, '14', 0),
('8ab0dcdd-149f-11f0-a774-10f60a355c40', '8363e81b-149f-11f0-a774-10f60a355c40', 3, '16', 1),
('8ab0defb-149f-11f0-a774-10f60a355c40', '8363e81b-149f-11f0-a774-10f60a355c40', 4, '24', 0),
('8ab0e091-149f-11f0-a774-10f60a355c40', '8363e81b-149f-11f0-a774-10f60a355c40', 5, '6', 0),
('8ab20dc2-149f-11f0-a774-10f60a355c40', '8363e878-149f-11f0-a774-10f60a355c40', 1, 'Banal', 0),
('8ab210e8-149f-11f0-a774-10f60a355c40', '8363e878-149f-11f0-a774-10f60a355c40', 2, 'Vivo', 0),
('8ab2122f-149f-11f0-a774-10f60a355c40', '8363e878-149f-11f0-a774-10f60a355c40', 3, 'Difícil', 0),
('8ab2135d-149f-11f0-a774-10f60a355c40', '8363e878-149f-11f0-a774-10f60a355c40', 4, 'Raro', 1),
('8ab21484-149f-11f0-a774-10f60a355c40', '8363e878-149f-11f0-a774-10f60a355c40', 5, 'Interesante', 0),
('8ab3409a-149f-11f0-a774-10f60a355c40', '8363e8df-149f-11f0-a774-10f60a355c40', 1, 'Navío', 0),
('8ab34364-149f-11f0-a774-10f60a355c40', '8363e8df-149f-11f0-a774-10f60a355c40', 2, 'Ejército', 0),
('8ab344ae-149f-11f0-a774-10f60a355c40', '8363e8df-149f-11f0-a774-10f60a355c40', 3, 'Rey', 1),
('8ab3461d-149f-11f0-a774-10f60a355c40', '8363e8df-149f-11f0-a774-10f60a355c40', 4, 'República', 0),
('8ab34770-149f-11f0-a774-10f60a355c40', '8363e8df-149f-11f0-a774-10f60a355c40', 5, 'Soldado', 0),
('8ab46b5f-149f-11f0-a774-10f60a355c40', '8363e937-149f-11f0-a774-10f60a355c40', 1, 'La A', 1),
('8ab4751a-149f-11f0-a774-10f60a355c40', '8363e937-149f-11f0-a774-10f60a355c40', 2, 'La V', 0),
('8ab476dc-149f-11f0-a774-10f60a355c40', '8363e937-149f-11f0-a774-10f60a355c40', 3, 'La H', 0),
('8ab47820-149f-11f0-a774-10f60a355c40', '8363e937-149f-11f0-a774-10f60a355c40', 4, 'La B', 0),
('8ab4794b-149f-11f0-a774-10f60a355c40', '8363e937-149f-11f0-a774-10f60a355c40', 5, 'La N', 0),
('8ab59b78-149f-11f0-a774-10f60a355c40', '8363e9cb-149f-11f0-a774-10f60a355c40', 1, 'Un animal que tiene cola', 0),
('8ab5a72a-149f-11f0-a774-10f60a355c40', '8363e9cb-149f-11f0-a774-10f60a355c40', 2, 'Un ser viviente', 0),
('8ab5ab39-149f-11f0-a774-10f60a355c40', '8363e9cb-149f-11f0-a774-10f60a355c40', 3, 'Una cosa que trabaja', 0),
('8ab5ac95-149f-11f0-a774-10f60a355c40', '8363e9cb-149f-11f0-a774-10f60a355c40', 4, 'Un rumiante', 1),
('8ab5baec-149f-11f0-a774-10f60a355c40', '8363e9cb-149f-11f0-a774-10f60a355c40', 5, 'Un animal que tira de los coches', 0),
('8ab709ae-149f-11f0-a774-10f60a355c40', '8363ea29-149f-11f0-a774-10f60a355c40', 1, 'La K', 0),
('8ab71432-149f-11f0-a774-10f60a355c40', '8363ea29-149f-11f0-a774-10f60a355c40', 2, 'La P', 0),
('8ab7160b-149f-11f0-a774-10f60a355c40', '8363ea29-149f-11f0-a774-10f60a355c40', 3, 'La B', 0),
('8ab7174e-149f-11f0-a774-10f60a355c40', '8363ea29-149f-11f0-a774-10f60a355c40', 4, 'La Q', 1),
('8ab71884-149f-11f0-a774-10f60a355c40', '8363ea29-149f-11f0-a774-10f60a355c40', 5, 'La Y', 0),
('8ab854af-149f-11f0-a774-10f60a355c40', '8363ea91-149f-11f0-a774-10f60a355c40', 1, 'La A', 0),
('8ab857f4-149f-11f0-a774-10f60a355c40', '8363ea91-149f-11f0-a774-10f60a355c40', 2, 'La M', 1),
('8ab8593e-149f-11f0-a774-10f60a355c40', '8363ea91-149f-11f0-a774-10f60a355c40', 3, 'La Q', 0),
('8ab85a69-149f-11f0-a774-10f60a355c40', '8363ea91-149f-11f0-a774-10f60a355c40', 4, 'La D', 0),
('8ab85b8e-149f-11f0-a774-10f60a355c40', '8363ea91-149f-11f0-a774-10f60a355c40', 5, 'La L', 0),
('8ab9b233-149f-11f0-a774-10f60a355c40', '8363eaf3-149f-11f0-a774-10f60a355c40', 1, 'Juez', 0),
('8ab9b50d-149f-11f0-a774-10f60a355c40', '8363eaf3-149f-11f0-a774-10f60a355c40', 2, 'Nervio', 0),
('8ab9b651-149f-11f0-a774-10f60a355c40', '8363eaf3-149f-11f0-a774-10f60a355c40', 3, 'Hora', 0),
('8ab9b783-149f-11f0-a774-10f60a355c40', '8363eaf3-149f-11f0-a774-10f60a355c40', 4, 'Norte', 1),
('8ab9b8a7-149f-11f0-a774-10f60a355c40', '8363eaf3-149f-11f0-a774-10f60a355c40', 5, 'Labio', 0),
('8abb1836-149f-11f0-a774-10f60a355c40', '8363eb47-149f-11f0-a774-10f60a355c40', 1, 'La A', 1),
('8abb1b0b-149f-11f0-a774-10f60a355c40', '8363eb47-149f-11f0-a774-10f60a355c40', 2, 'La E', 0),
('8abb1c64-149f-11f0-a774-10f60a355c40', '8363eb47-149f-11f0-a774-10f60a355c40', 3, 'La L', 0),
('8abb1dab-149f-11f0-a774-10f60a355c40', '8363eb47-149f-11f0-a774-10f60a355c40', 4, 'La R', 0),
('8abb1eda-149f-11f0-a774-10f60a355c40', '8363eb47-149f-11f0-a774-10f60a355c40', 5, 'La B', 0),
('8abccca1-149f-11f0-a774-10f60a355c40', '8363eba1-149f-11f0-a774-10f60a355c40', 1, '14', 0),
('8abcd78b-149f-11f0-a774-10f60a355c40', '8363eba1-149f-11f0-a774-10f60a355c40', 2, '17', 1),
('8abcda73-149f-11f0-a774-10f60a355c40', '8363eba1-149f-11f0-a774-10f60a355c40', 3, '20', 0),
('8abcdc99-149f-11f0-a774-10f60a355c40', '8363eba1-149f-11f0-a774-10f60a355c40', 4, '15', 0),
('8abcdec9-149f-11f0-a774-10f60a355c40', '8363eba1-149f-11f0-a774-10f60a355c40', 5, '16', 0),
('8abe4ee1-149f-11f0-a774-10f60a355c40', '8363ebfd-149f-11f0-a774-10f60a355c40', 1, '10', 0),
('8abe59cd-149f-11f0-a774-10f60a355c40', '8363ebfd-149f-11f0-a774-10f60a355c40', 2, '5', 0),
('8abe5c51-149f-11f0-a774-10f60a355c40', '8363ebfd-149f-11f0-a774-10f60a355c40', 3, '2', 1),
('8abe5e92-149f-11f0-a774-10f60a355c40', '8363ebfd-149f-11f0-a774-10f60a355c40', 4, '4', 0),
('8abe6125-149f-11f0-a774-10f60a355c40', '8363ebfd-149f-11f0-a774-10f60a355c40', 5, '25', 0),
('8abfdb51-149f-11f0-a774-10f60a355c40', '8363ec4e-149f-11f0-a774-10f60a355c40', 1, '3', 0),
('8abfdef1-149f-11f0-a774-10f60a355c40', '8363ec4e-149f-11f0-a774-10f60a355c40', 2, '4', 0),
('8abfe048-149f-11f0-a774-10f60a355c40', '8363ec4e-149f-11f0-a774-10f60a355c40', 3, '1', 0),
('8abfe183-149f-11f0-a774-10f60a355c40', '8363ec4e-149f-11f0-a774-10f60a355c40', 4, '7', 0),
('8abfe2b4-149f-11f0-a774-10f60a355c40', '8363ec4e-149f-11f0-a774-10f60a355c40', 5, '8', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opcionesterman`
--

CREATE TABLE `opcionesterman` (
  `idOpcionTerman` int(11) NOT NULL AUTO_INCREMENT,
  `idPreguntaTerman` int(11) DEFAULT NULL,
  `opcionTerman` int(11) DEFAULT NULL,
  `descripcionTerman` varchar(100) DEFAULT NULL,
  `esCorrecta` boolean DEFAULT NULL,
  PRIMARY KEY (`idOpcionTerman`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `OTP`
--

CREATE TABLE `OTP` (
  `idOTP` int(11) NOT NULL,
  `idUsuario` varchar(36) DEFAULT NULL,
  `codigo` int(11) DEFAULT NULL,
  `validez` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `usado` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `otp`
--

INSERT INTO `otp` (`idOTP`, `idUsuario`, `codigo`, `validez`, `usado`) VALUES
(1, '20c24205-0482-11f0-843f-10f60a355c40', 822923, '2025-04-07 05:45:01', 0),
(2, '20c24205-0482-11f0-843f-10f60a355c40', 336757, '2025-04-07 05:45:42', 0),
(3, '20c232ef-0482-11f0-843f-10f60a355c40', 163536, '2025-04-07 05:41:17', 1),
(4, '20c24c8c-0482-11f0-843f-10f60a355c40', 421089, '2025-04-07 05:42:22', 1),
(5, '20c232ef-0482-11f0-843f-10f60a355c40', 805397, '2025-04-07 15:04:49', 0),
(6, '20c24c8c-0482-11f0-843f-10f60a355c40', 352170, '2025-04-07 15:01:10', 1),
(7, '55099067-0a68-11f0-aa07-a0294223b12a', 748501, '2025-04-08 17:30:20', 1),
(8, '9c865a12-0a67-11f0-aa07-a0294223b12a', 759942, '2025-04-08 17:33:20', 1),
(9, '20c2811f-0482-11f0-843f-10f60a355c40', 116208, '2025-04-08 17:36:03', 1),
(10, '7b601ee2-0a67-11f0-aa07-a0294223b12a', 638015, '2025-04-08 17:39:34', 1),
(11, '6ee37c28-0ba6-11f0-a231-047c163ab16f', 173695, '2025-04-08 17:41:10', 1),
(12, '20c2811f-0482-11f0-843f-10f60a355c40', 916732, '2025-04-08 17:43:27', 1),
(13, '20c2811f-0482-11f0-843f-10f60a355c40', 227374, '2025-04-08 17:48:49', 1),
(14, '20c2811f-0482-11f0-843f-10f60a355c40', 269162, '2025-04-08 17:59:53', 1),
(15, '20c2811f-0482-11f0-843f-10f60a355c40', 967377, '2025-04-08 18:03:46', 1),
(16, '20c2811f-0482-11f0-843f-10f60a355c40', 462043, '2025-04-08 18:07:13', 1),
(17, '20c2811f-0482-11f0-843f-10f60a355c40', 755321, '2025-04-08 18:08:24', 1),
(18, '20c2811f-0482-11f0-843f-10f60a355c40', 830152, '2025-04-08 18:09:09', 1),
(19, 'ffcaf075-14a4-11f0-a774-10f60a355c40', 179618, '2025-04-08 18:12:49', 1),
(20, '20c2820f-0482-11f0-843f-10f60a355c40', 919296, '2025-04-08 18:35:49', 1),
(21, '20c2811f-0482-11f0-843f-10f60a355c40', 264585, '2025-04-08 18:40:27', 1),
(22, '20c232ef-0482-11f0-843f-10f60a355c40', 132025, '2025-04-08 19:25:46', 1),
(23, '20c232ef-0482-11f0-843f-10f60a355c40', 946023, '2025-04-08 19:26:02', 1),
(24, '9c865a12-0a67-11f0-aa07-a0294223b12a', 803387, '2025-04-08 19:26:16', 1),
(25, '20c232ef-0482-11f0-843f-10f60a355c40', 432125, '2025-04-08 19:46:19', 1),
(26, '20c2820f-0482-11f0-843f-10f60a355c40', 347978, '2025-04-09 23:28:05', 1),
(27, '20c2811f-0482-11f0-843f-10f60a355c40', 826884, '2025-04-09 23:31:02', 1),
(28, '20c2811f-0482-11f0-843f-10f60a355c40', 983177, '2025-04-10 01:40:43', 1),
(29, '20c2811f-0482-11f0-843f-10f60a355c40', 727083, '2025-04-10 02:12:53', 1),
(30, '20c2820f-0482-11f0-843f-10f60a355c40', 898165, '2025-04-10 02:58:05', 1),
(31, '20c2811f-0482-11f0-843f-10f60a355c40', 955920, '2025-04-10 03:02:27', 1),
(32, '20c2811f-0482-11f0-843f-10f60a355c40', 423706, '2025-04-10 04:20:17', 0),
(33, '20c2811f-0482-11f0-843f-10f60a355c40', 626212, '2025-04-10 04:22:51', 1),
(34, '20c2811f-0482-11f0-843f-10f60a355c40', 376740, '2025-04-10 04:29:17', 1),
(35, '20c2811f-0482-11f0-843f-10f60a355c40', 769713, '2025-04-10 04:30:56', 1),
(36, '20c2811f-0482-11f0-843f-10f60a355c40', 850278, '2025-04-10 04:46:32', 1),
(37, '20c2811f-0482-11f0-843f-10f60a355c40', 823206, '2025-04-10 04:49:53', 1),
(38, '20c2811f-0482-11f0-843f-10f60a355c40', 699749, '2025-04-10 05:44:36', 1),
(39, '20c2811f-0482-11f0-843f-10f60a355c40', 295544, '2025-04-10 06:00:23', 1),
(40, '20c2820f-0482-11f0-843f-10f60a355c40', 111111, '2025-04-12 19:48:49', 0),
(41, '20c2820f-0482-11f0-843f-10f60a355c40', 111111, '2025-04-12 19:51:22', 0),
(42, '20c2811f-0482-11f0-843f-10f60a355c40', 111111, '2025-04-12 19:54:29', 0),
(43, '20c2811f-0482-11f0-843f-10f60a355c40', 266883, '2025-04-12 19:53:19', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paises`
--

CREATE TABLE `paises` (
  `idPais` int(11) NOT NULL,
  `nombrePais` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `paises`
--

INSERT INTO `paises` (`idPais`, `nombrePais`) VALUES
(1, 'Argentina'),
(2, 'Brasil'),
(3, 'Canadá'),
(4, 'Chile'),
(5, 'China'),
(6, 'Colombia'),
(7, 'Egipto'),
(8, 'España'),
(9, 'Estados Unidos'),
(10, 'Francia'),
(11, 'Alemania'),
(12, 'India'),
(13, 'Italia'),
(14, 'Japón'),
(15, 'México'),
(16, 'Países Bajos'),
(17, 'Perú'),
(18, 'Reino Unido'),
(19, 'Rusia'),
(20, 'Sudáfrica'),
(21, 'Australia'),
(22, 'Corea del Sur'),
(23, 'Portugal'),
(24, 'Turquía'),
(25, 'Grecia'),
(26, 'Suiza'),
(27, 'Suecia'),
(28, 'Noruega'),
(29, 'Dinamarca'),
(30, 'Finlandia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas16pf`
--

CREATE TABLE `preguntas16pf` (
  `idPregunta16PF` varchar(36) NOT NULL,
  `idPrueba` int(11) DEFAULT NULL,
  `numeroPregunta16PF` int(5) DEFAULT NULL,
  `pregunta16PF` varchar(150) DEFAULT NULL,
  `letraAporte` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntasformatoentrevista`
--

CREATE TABLE `preguntasformatoentrevista` (
  `idPreguntaFormatoEntrevista` int(11) NOT NULL,
  `nombrePreguntaFormatoEntrevista` varchar(255) DEFAULT NULL,
  `tipoPregunta` varchar(60) DEFAULT NULL,
  `seccion` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `preguntasformatoentrevista`
--

INSERT INTO `preguntasformatoentrevista` (`idPreguntaFormatoEntrevista`, `nombrePreguntaFormatoEntrevista`, `tipoPregunta`, `seccion`) VALUES
(103, 'Fecha', 'date', 'Datos personales'),
(104, 'Nombre', 'text', 'Datos personales'),
(105, 'Apellido Paterno', 'text', 'Datos personales'),
(106, 'Apellido Materno', 'text', 'Datos personales'),
(107, 'Fecha de Nacimiento', 'date', 'Datos personales'),
(108, 'Edad', 'number', 'Datos personales'),
(109, 'Género', 'text', 'Datos personales'),
(110, 'Estado Civil', 'text', 'Datos personales'),
(111, 'Nacionalidad', 'text', 'Datos personales'),
(112, 'Estado de origen', 'text', 'Datos personales'),
(113, 'Dirección Actual', 'text', 'Datos personales'),
(114, 'Teléfono Fijo', 'tel', 'Datos personales'),
(115, 'Celular', 'tel', 'Datos personales'),
(116, 'Correo', 'email', 'Datos personales'),
(117, 'Realice una descripción amplia de su persona', 'textarea', 'Datos personales'),
(118, 'Describa su estado de ánimo cotidiano', 'textarea', 'Datos personales'),
(119, 'Describa su estado de ánimo en situaciones de presión', 'textarea', 'Datos personales'),
(120, 'Describa su estado de ánimo en situaciones críticas', 'textarea', 'Datos personales'),
(121, '¿Cómo considera que es su estado de salud?', 'textarea', 'Datos personales'),
(122, '¿A qué dedica sus tiempos libres?', 'textarea', 'Datos personales'),
(123, 'Nombre de la Licenciatura', 'text', 'Datos academicos'),
(124, 'Institución de Procedencia', 'text', 'Datos academicos'),
(125, 'Promedio de egreso', 'number', 'Datos academicos'),
(126, 'Generación (año)', 'number', 'Datos academicos'),
(127, 'Grado máximo de estudios', 'text', 'Datos academicos'),
(128, 'Maestría o especialidad (en caso de tener)', 'text', 'Datos academicos'),
(129, 'Institución donde curso la Maestría', 'text', 'Datos academicos'),
(130, 'Promedio de egreso de la Maestría', 'number', 'Datos academicos'),
(131, 'Cursos y Diplomados (Escribir los de los últimos tres años)', 'textarea', 'Datos academicos'),
(132, 'Idiomas que domina', 'textarea', 'Datos academicos'),
(133, '¿Cómo considera que ha sido su desempeño académico hasta llegar a este posgrado?', 'textarea', 'Datos academicos'),
(134, '¿Cuáles han sido los cursos de actualización, los seminarios o congresos a los que ha asistido que le han brindado mayores herramientas en su desarrollo profesional o personal?', 'textarea', 'Datos academicos'),
(135, '¿Cómo surge el interés en este programa de posgrado?', 'textarea', 'Datos academicos'),
(136, '¿Cuál es la finalidad de estudiar este posgrado y cómo se integrará en sus experiencias personales y/o profesionales?', 'textarea', 'Datos academicos'),
(137, '¿Cuáles son sus expectativas acerca de las aportaciones que le pueda hacer este posgrado?', 'textarea', 'Datos academicos'),
(138, 'Explique su visión respecto a su desarrollo profesional en años posteriores a su egreso de este posgrado', 'textarea', 'Datos academicos'),
(139, '¿Está dispuesto a cambiar de residencia?', 'textarea', 'Datos academicos'),
(140, 'Escribe el último trabajo en el que te desempeñaste', 'text', 'Datos laborales'),
(141, 'Lugar donde trabaja', 'text', 'Datos laborales'),
(142, 'Nombre de la empresa', 'text', 'Datos laborales'),
(143, 'Puesto que desempeña', 'text', 'Datos laborales'),
(144, 'Años en la empresa', 'number', 'Datos laborales'),
(145, 'Actividades que realiza', 'textarea', 'Datos laborales'),
(146, 'Sueldo que percibe', 'number', 'Datos laborales'),
(147, 'Tiene personal a su cargo', 'text', 'Datos laborales'),
(148, '¿Cómo considera que es la relación que tiene con su jefe inmediato?', 'textarea', 'Datos laborales'),
(149, '¿Cuál es la relación que tiene con el personal a su cargo?', 'textarea', 'Datos laborales'),
(150, '¿Cuál es el mayor reto que se ha encontrado en los trabajos que ha tenido y como lo ha resuelto?', 'textarea', 'Datos laborales'),
(151, '¿La empresa en la que trabaja está enterada de sus intereses académicos?', 'textarea', 'Datos laborales'),
(152, '¿Cuál ha sido la reacción de la empresa ante estos intereses?', 'textarea', 'Datos laborales'),
(153, '¿Considera combinar sus actividades profesionales con las académicas?', 'textarea', 'Datos laborales');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntashartman`
--

CREATE TABLE `preguntashartman` (
  `idPreguntaHartman` int(11) NOT NULL,
  `idPrueba` int(11) DEFAULT NULL,
  `fasePregunta` int(11) DEFAULT NULL,
  `numeroPregunta` int(11) DEFAULT NULL,
  `preguntaHartman` varchar(500) DEFAULT NULL,
  `valorHartman` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntaskostick`
--

CREATE TABLE `preguntaskostick` (
  `idPreguntaKostick` varchar(36) NOT NULL,
  `idPrueba` int(11) DEFAULT NULL,
  `numeroPreguntaKostick` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntasotis`
--

CREATE TABLE `preguntasotis` (
  `idPreguntaOtis` varchar(36) NOT NULL,
  `idPrueba` int(11) DEFAULT NULL,
  `numeroPregunta` int(11) DEFAULT NULL,
  `preguntaOtis` varchar(255) DEFAULT NULL,
  `idAreaOtis` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `preguntasotis`
--

INSERT INTO `preguntasotis` (`idPreguntaOtis`, `idPrueba`, `numeroPregunta`, `preguntaOtis`, `idAreaOtis`) VALUES
('8363cf89-149f-11f0-a774-10f60a355c40', 5, 1, '¿Qué expresa mejor lo que es un martillo?', 1),
('8363d26a-149f-11f0-a774-10f60a355c40', 5, 2, '¿Cuál de estas cinco palabras significa lo contrario de GANAR?', 1),
('8363d300-149f-11f0-a774-10f60a355c40', 5, 3, 'La hierba es para la vaca lo que el pan es para…', 2),
('8363d364-149f-11f0-a774-10f60a355c40', 5, 4, '¿Qué es para el automóvil lo que el carbón es para la locomotora?', 2),
('8363d3c6-149f-11f0-a774-10f60a355c40', 5, 5, 'Los números que vienen aquí debajo forman una serie y uno de ellos no es correcto. ¿Qué número debería figurar en su lugar?            5  10  15  20  25  30  35  39  45  50', 5),
('8363d438-149f-11f0-a774-10f60a355c40', 5, 6, 'La mano es para el brazo lo que el pie es para…', 2),
('8363d489-149f-11f0-a774-10f60a355c40', 5, 7, 'De un muchacho que no hace más que hablar de sus cualidades y de su sabiduría, se dice que…', 1),
('8363d4e1-149f-11f0-a774-10f60a355c40', 5, 8, 'De una persona que tiene deseos de hacer una cosa pero teme al fracaso, se dice que es…', 1),
('8363d533-149f-11f0-a774-10f60a355c40', 5, 9, 'El sombrero es para la cabeza lo que el dedal es para…', 2),
('8363d580-149f-11f0-a774-10f60a355c40', 5, 10, 'El hijo de la hermana de mi padre es mi…', 2),
('8363d5d0-149f-11f0-a774-10f60a355c40', 5, 11, '¿Cuál de estas cantidades es la mayor?', 5),
('8363d61d-149f-11f0-a774-10f60a355c40', 5, 12, 'Cuando sabemos que un acontecimiento va a pasar sin ninguna clase de dudas, decimos que es…', 1),
('8363d66b-149f-11f0-a774-10f60a355c40', 5, 13, '¿Qué palabra indica el lado opuesto de ESTE?', 1),
('8363d6b6-149f-11f0-a774-10f60a355c40', 5, 14, '¿Qué palabra indica lo contrario a SOBERBIA? ', 1),
('8363d702-149f-11f0-a774-10f60a355c40', 5, 15, '¿Cuál de estas cinco cosas no debería agruparse a las demás?', 2),
('8363d753-149f-11f0-a774-10f60a355c40', 5, 16, '¿Qué definición de éstas expresa más exactamente lo que es un reloj?', 4),
('8363d7a4-149f-11f0-a774-10f60a355c40', 5, 17, 'Si una persona, al salir de su casa, anda siete pasos hacia la derecha y después retrocede cuatro a la izquierda, ¿A cuantos pasos está de su casa? ', 5),
('8363d815-149f-11f0-a774-10f60a355c40', 5, 18, 'Si comparamos el automóvil a una carreta, ¿A qué deberíamos comparar una motocicleta?', 2),
('8363d871-149f-11f0-a774-10f60a355c40', 5, 19, '¿Cuál es la razón por la cuál las fachadas de los comercios están muy iluminadas?', 4),
('8363d8bc-149f-11f0-a774-10f60a355c40', 5, 20, '¿Cuál de estas cinco cosas tiene más parecido con manzana, melocotón y pera?', 1),
('8363d90f-149f-11f0-a774-10f60a355c40', 5, 21, 'En el abecedario, ¿Qué letra sigue de la K?', 3),
('8363d960-149f-11f0-a774-10f60a355c40', 5, 22, 'El Rey es a la monarquía lo que el Presidente es a…', 2),
('8363d9ad-149f-11f0-a774-10f60a355c40', 5, 23, 'La lana es para el carnero lo que las plumas son para…', 2),
('8363d9ff-149f-11f0-a774-10f60a355c40', 5, 24, '¿Cuál de estas definiciones expresa más exactamente lo que es un cordero?', 4),
('8363da5f-149f-11f0-a774-10f60a355c40', 5, 25, 'Pesado es a plomo lo que sonoro es a…', 2),
('8363dab3-149f-11f0-a774-10f60a355c40', 5, 26, 'Mejor es a bueno lo que peor es a…', 2),
('8363db03-149f-11f0-a774-10f60a355c40', 5, 27, '¿Cuál de estas cosas tiene más parecido con tenazas, alambre y clavo?', 1),
('8363db5b-149f-11f0-a774-10f60a355c40', 5, 28, 'Ante el dolor de los demás normalmente sentimos…', 1),
('8363dbb6-149f-11f0-a774-10f60a355c40', 5, 29, 'Cuando alguien concibe una nueva máquina, se dice que ha hecho una…', 1),
('8363dc09-149f-11f0-a774-10f60a355c40', 5, 30, '¿Qué es para la abeja lo que las uñas son para el gato?', 2),
('8363dc58-149f-11f0-a774-10f60a355c40', 5, 31, 'Uno de los números de esta serie está equivocado. ¿Qué número debería figurar en su lugar?                    1  7  2  7  3  7  4  7  5  7  6  7  8  7', 5),
('8363dcaa-149f-11f0-a774-10f60a355c40', 5, 32, '¿Cuál es la principal razón por la que vemos cada día sustituir los carros por los automóviles?', 4),
('8363dd06-149f-11f0-a774-10f60a355c40', 5, 33, 'La corteza es para la naranja y la vaina es para el guisante lo que la cáscara es para…', 2),
('8363dd5a-149f-11f0-a774-10f60a355c40', 5, 34, '¿Qué es para el criminal lo que el hospital es para el enfermo?', 2),
('8363ddb1-149f-11f0-a774-10f60a355c40', 5, 35, 'Si estos números estuviesen ordenados, ¿Por qué letra empezaría el del centro?      Ocho  Diez   Seis   Nueve   Siete', 3),
('8363de14-149f-11f0-a774-10f60a355c40', 5, 36, 'A 30 centavos la hoja de papel, ¿Cuántas podrán comprarse por 3 pesos?', 5),
('8363de70-149f-11f0-a774-10f60a355c40', 5, 37, 'De una cantidad que disminuye se dice que…', 1),
('8363dec5-149f-11f0-a774-10f60a355c40', 5, 38, 'Hay un refrán que dice \"No es oro todo lo que reluce\" y esto significa:', 4),
('8363df20-149f-11f0-a774-10f60a355c40', 5, 39, 'En una lengua extranjera KOLO quiere decir \"niño\" y DAAK KOLO \"niño bueno\", ¿Por qué letra empieza la palabra que significa \"bueno\" en ese idioma?', 3),
('8363df79-149f-11f0-a774-10f60a355c40', 5, 40, 'Este refrán, \"Más vale pájaro en mano que ciento volando\", quiere decir:', 4),
('8363dfcd-149f-11f0-a774-10f60a355c40', 5, 41, '¿Cuál de estas cinco cosas es más completa?', 1),
('8363e039-149f-11f0-a774-10f60a355c40', 5, 42, 'Si estas palabras estuviesen convenientemente ordenadas para formar una frase, ¿Por qué letra empezaría la tercera palabra?      CON  DIME  ERES  QUIEN  DIRE  ANDAS  Y  TE  QUIEN', 3),
('8363e099-149f-11f0-a774-10f60a355c40', 5, 43, 'Si Jorge es mayor que Pedro, y Pedro es mayor que Juan, entonces Jorge es ______ que Juan.', 2),
('8363e0f7-149f-11f0-a774-10f60a355c40', 5, 44, '¿Cuál de estas palabras es la primera que aparece en el diccionario?', 3),
('8363e14f-149f-11f0-a774-10f60a355c40', 5, 45, 'Si las palabras General, Teniente, Soldado, Coronel y Alférez estuviesen colocadas indicando el orden jerárquico que significan, ¿Por qué letra empezaría la del centro?             (Alférez: Oficial de categoría menor al teniente)', 3),
('8363e1ae-149f-11f0-a774-10f60a355c40', 5, 46, 'Hay un refrán que dice: \"Un grano no hace granero, pero ayuda al compañero\", y esto significa:', 4),
('8363e20a-149f-11f0-a774-10f60a355c40', 5, 47, 'Si Juan es mayor que José, y José tiene la misma edad que Carlos entonces…', 2),
('8363e25e-149f-11f0-a774-10f60a355c40', 5, 48, 'Ordenando la frase que viene aquí debajo, ¿Por qué letra empezaría la última palabra?     A  FALTA  TORTAS  BUENAS  PAN  SON  DE', 3),
('8363e2bf-149f-11f0-a774-10f60a355c40', 5, 49, 'Si en una caja hubiera dos más pequeñas y dentro de cada una de estas dos hubiera cinco, ¿Cuántas habría en total?', 5),
('8363e330-149f-11f0-a774-10f60a355c40', 5, 50, '¿Qué indica mejor lo que es una mentira?', 4),
('8363e395-149f-11f0-a774-10f60a355c40', 5, 51, 'En un idioma extranjero SOTO GRON quiere decir \"muy caliente\" y PSS GRON \"muy frío\", ¿Por qué letra empieza la palabra que significa \"muy\" en ese idioma?', 3),
('8363e3f0-149f-11f0-a774-10f60a355c40', 5, 52, 'La palabra que mejor expresa que una cosa o institución se mantiene a lo largo del tiempo es…', 1),
('8363e446-149f-11f0-a774-10f60a355c40', 5, 53, 'Si Pablo es mayor que Luis y si Pablo es más joven que Andrés, entonces…', 2),
('8363e499-149f-11f0-a774-10f60a355c40', 5, 54, '¿Cuál de estas cosas tiene más parecido con serpiente, vaca y gorrión?', 1),
('8363e4ed-149f-11f0-a774-10f60a355c40', 5, 55, 'Hay un refrán que dice: \"A hierro caliente, batir de repente\", y esto significa:', 4),
('8363e548-149f-11f0-a774-10f60a355c40', 5, 56, 'Si las palabras que vienen aquí debajo estuviesen ordenadas, ¿Por qué letra empezaría la del centro?        Semana  Año  Hora  Segundo  Día  Mes  Minuto', 3),
('8363e5a6-149f-11f0-a774-10f60a355c40', 5, 57, ' El capitán es para el barco lo que el alcalde es para…', 2),
('8363e5fa-149f-11f0-a774-10f60a355c40', 5, 58, 'Uno de los números de la serie que viene aquí debajo está equivocado, ¿Qué número debiera figurar en su lugar?       2  3  4  3  2  3  4  2  2  4', 5),
('8363e659-149f-11f0-a774-10f60a355c40', 5, 59, 'Si un pleito se resuelve por mutuas concesiones se dice que ha habido…', 1),
('8363e6ae-149f-11f0-a774-10f60a355c40', 5, 60, 'La oración que viene aquí debajo tiene las palabras desordenadas. ¿Qué letra debe marcarse atendiendo a la frase ordenada?       	FRASE  LA  LETRA  SEÑALE  PRIMERA  ESTA  DE', 3),
('8363e70f-149f-11f0-a774-10f60a355c40', 5, 61, 'En la serie de números, que aparece debajo, cuente todos los 5 que están delante de un 7, ¿Cuántos son?    7 5 3 5 7 2 3 7 5 6 7 7 2 5 7 3 4 7 7 5 2 0 7 5 7 8 3 7 2 5 1 7 9 6 5 7', 3),
('8363e76d-149f-11f0-a774-10f60a355c40', 5, 62, '¿Qué indica mejor lo que es un termómetro?', 4),
('8363e7c4-149f-11f0-a774-10f60a355c40', 5, 63, '¿Cuál de estas palabras es la primera que aparece en un diccionario?', 3),
('8363e81b-149f-11f0-a774-10f60a355c40', 5, 64, 'Uno de los números de la serie que aparece aquí debajo está equivocado. ¿Qué número debiera figurar en su lugar?    1  2  4  8  12  32  64', 5),
('8363e878-149f-11f0-a774-10f60a355c40', 5, 65, '¿Cuál de estas palabras significa lo contrario de COMUN?', 1),
('8363e8df-149f-11f0-a774-10f60a355c40', 5, 66, '¿Cuál de estas cinco cosas tiene más parecido con Presidente, Almirante y General?', 1),
('8363e937-149f-11f0-a774-10f60a355c40', 5, 67, 'Si las palabras que aparecen aquí debajo estuvieran ordenadas, ¿Por qué letra empezaría la del centro?     Adolescente  Niño  Hombre  Viejo  Bebé', 3),
('8363e9cb-149f-11f0-a774-10f60a355c40', 5, 68, '¿Cuál de estas definiciones indica más exactamente lo que es un caballo?', 4),
('8363ea29-149f-11f0-a774-10f60a355c40', 5, 69, 'En un idioma extranjero BECO PRAC quiere decir \"un poco de pan\", KLUP PRAC \"un poco de leche\" y BECO OTOH KLUP PRAC \"un poco de pan y leche\", ¿Por qué letra empieza la palabra que significa \"y\" en dicho idioma?', 3),
('8363ea91-149f-11f0-a774-10f60a355c40', 5, 70, 'Si las palabras que aparecen aquí debajo estuviesen convenientemente ordenadas para formar una frase, ¿Por qué letra empezaría la tercera palabra?     MADRUGA  QUIEN   LE  DIOS  A  AYUDA', 3),
('8363eaf3-149f-11f0-a774-10f60a355c40', 5, 71, '¿Cuál de estas palabras es la última que aparece en un diccionario?', 3),
('8363eb47-149f-11f0-a774-10f60a355c40', 5, 72, 'Si se ordena la frase que aparece aquí debajo, ¿Qué letra cumple lo que se dice en ella?', 3),
('8363eba1-149f-11f0-a774-10f60a355c40', 5, 73, 'Uno de los números de la serie que aparece aquí debajo está equivocado, ¿Qué número debería figurar en su lugar?         1  2  5  6  9  10  13  14  16  18', 5),
('8363ebfd-149f-11f0-a774-10f60a355c40', 5, 74, 'Si un ciclista recorre 250 metros en 25 segundos, ¿Cuántos metros recorrerá en un quinto de segundo?', 5),
('8363ec4e-149f-11f0-a774-10f60a355c40', 5, 75, 'Si la frase que aparece aquí debajo estuviera ordenada, ¿Qué número cumple lo que en ella se dice?        SUMA  CUATRO  ESCRIBA  TRES  LA  UNO  DE', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntasterman`
--

CREATE TABLE `preguntasterman` (
  `idPreguntaTerman` int(11) NOT NULL,
  `idSerieTerman` int(11) DEFAULT NULL,
  `numeroPregunta` int(11) DEFAULT NULL,
  `preguntaTerman` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `privilegios`
--

CREATE TABLE `privilegios` (
  `idPrivilegio` int(11) NOT NULL,
  `nombrePrivilegio` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `privilegios`
--

INSERT INTO `privilegios` (`idPrivilegio`, `nombrePrivilegio`) VALUES
(1, 'Autenticación'),
(2, 'Consultar TyC'),
(3, 'Registrar instituciones'),
(4, 'Consultar información de instituciones'),
(5, 'Editar instituciones'),
(6, 'Desactivar instituciones'),
(7, 'Registrar grupos'),
(8, 'Consultar información de grupos'),
(9, 'Editar grupos'),
(10, 'Desactivar grupos'),
(11, 'Añadir aspirantes'),
(12, 'Consultar información de aspirantes'),
(13, 'Editar aspirantes'),
(14, 'Desactivar aspirantes'),
(15, 'Consultar respuestas'),
(16, 'Consultar análisis'),
(17, 'Consultar documentación'),
(18, 'Consultar información de pruebas'),
(19, 'Consultar pruebas'),
(20, 'Realizar pruebas'),
(21, 'Subir archivos'),
(22, 'Contestar formato de entrevista'),
(23, 'Consultar psicólogos'),
(24, 'Consultar coordinadores'),
(25, 'Registrar psicólogo'),
(26, 'Registrar coordinador'),
(27, 'Editar psicólogo'),
(28, 'Editar coordinador'),
(29, 'Desactivar psicólogo'),
(30, 'Desactivar coordinador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pruebas`
--

CREATE TABLE `pruebas` (
  `idPrueba` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `instrucciones` text DEFAULT NULL,
  `duracion` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pruebas`
--

INSERT INTO `pruebas` (`idPrueba`, `nombre`, `descripcion`, `instrucciones`, `duracion`) VALUES
(1, 'KOSTICK', 'Prueba proyectiva que analiza rasgos de personalidad y comportamiento.', 'instruccionesKostick.txt', NULL),
(2, 'PRUEBA DE 16PF', 'Inventario de personalidad que mide 16 factores primarios de la personalidad.', 'instrucciones16PF.txt', NULL),
(3, 'HARTMAN', 'Evaluación psicológica utilizada en diversos contextos de diagnóstico.', 'instruccionesHartman.txt', NULL),
(4, 'TERMAN', 'Prueba para medir el coeficiente intelectual y evaluar habilidades cognitivas.', 'instruccionesTerman.txt', NULL),
(5, 'OTIS', 'Prueba de inteligencia que mide la capacidad de razonamiento lógico y abstracto.', 'instruccionesOtis.txt', 30),
(6, 'Colores de Luscher', 'Evaluación basada en la selección de colores para analizar el estado emocional.', 'instruccionesColores.txt', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuestaotisaspirante`
--

CREATE TABLE `respuestaotisaspirante` (
  `idRespuestaOtis` varchar(36) NOT NULL,
  `idAspirante` varchar(36) DEFAULT NULL,
  `idGrupo` varchar(36) DEFAULT NULL,
  `idPreguntaOtis` varchar(36) DEFAULT NULL,
  `idOpcionOtis` varchar(36) DEFAULT NULL,
  `idPrueba` int(11) DEFAULT NULL,
  `tiempoRespuesta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `respuestaotisaspirante`
--

INSERT INTO `respuestaotisaspirante` (`idRespuestaOtis`, `idAspirante`, `idGrupo`, `idPreguntaOtis`, `idOpcionOtis`, `idPrueba`, `tiempoRespuesta`) VALUES
('0398cc10-e686-4d09-968a-a1bfc4512b53', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363dab3-149f-11f0-a774-10f60a355c40', '8a813087-149f-11f0-a774-10f60a355c40', 5, 1),
('03a58490-d16d-4f8a-9b3c-d0d461903853', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363e659-149f-11f0-a774-10f60a355c40', '8aa9e5c8-149f-11f0-a774-10f60a355c40', 5, 0),
('0559fbe4-2e54-4e49-8b48-d29a495fdb20', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363e76d-149f-11f0-a774-10f60a355c40', '8aadfa30-149f-11f0-a774-10f60a355c40', 5, 1),
('06e79f91-90ee-4406-86ee-27221850cd92', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363e499-149f-11f0-a774-10f60a355c40', '8aa4152b-149f-11f0-a774-10f60a355c40', 5, 2),
('0a58a542-f3ba-4ea9-a5e2-9caf6c5d2375', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363dd5a-149f-11f0-a774-10f60a355c40', '8a8bff07-149f-11f0-a774-10f60a355c40', 5, 0),
('0dd0b612-cf25-4172-a376-c72f548cf776', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363ddb1-149f-11f0-a774-10f60a355c40', '8a8d9f28-149f-11f0-a774-10f60a355c40', 5, 1),
('0dd81dff-6f87-47f2-a757-4c3ba842045e', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363d871-149f-11f0-a774-10f60a355c40', '8a79c0da-149f-11f0-a774-10f60a355c40', 5, 1),
('0f04ccc8-e176-45d0-a640-6e801ba47bc9', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363e330-149f-11f0-a774-10f60a355c40', '8a9fa141-149f-11f0-a774-10f60a355c40', 5, 1),
('1007869e-3d14-47f7-bd55-905cc1fd59f0', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363e3f0-149f-11f0-a774-10f60a355c40', '8aa1f271-149f-11f0-a774-10f60a355c40', 5, 1),
('1414aaa9-e879-4427-898f-8948bcfd6e85', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363dcaa-149f-11f0-a774-10f60a355c40', '8a88dc19-149f-11f0-a774-10f60a355c40', 5, 3),
('17af597c-0db2-4ee1-aac8-3a7a812c22ea', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363e6ae-149f-11f0-a774-10f60a355c40', '8aab111e-149f-11f0-a774-10f60a355c40', 5, 1),
('17f81cec-13dd-4902-98bf-34370bd9986a', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363dcaa-149f-11f0-a774-10f60a355c40', '8a88dd0e-149f-11f0-a774-10f60a355c40', 5, 1),
('18390237-5320-4610-80b9-9c38f51c00b6', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363d960-149f-11f0-a774-10f60a355c40', '8a7cd55c-149f-11f0-a774-10f60a355c40', 5, 1),
('18a55c4e-a5b2-4ccf-8a27-d059db88573a', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363ec4e-149f-11f0-a774-10f60a355c40', '8abfdef1-149f-11f0-a774-10f60a355c40', 5, 3),
('18ae29ff-d663-41dc-9e61-09837d5b953f', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363e5fa-149f-11f0-a774-10f60a355c40', '8aa8dc60-149f-11f0-a774-10f60a355c40', 5, 1),
('1a3ef7b7-55fe-473f-bb33-2f968a8597b8', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363e039-149f-11f0-a774-10f60a355c40', '8a962ed1-149f-11f0-a774-10f60a355c40', 5, 1),
('1b9b1b63-4da2-46b4-a0fd-c78b765c5c78', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363de14-149f-11f0-a774-10f60a355c40', '8a8f43ec-149f-11f0-a774-10f60a355c40', 5, 1),
('1c8b0e5a-33f0-4e15-a1cd-5b6743a629f8', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363e81b-149f-11f0-a774-10f60a355c40', '8ab0e091-149f-11f0-a774-10f60a355c40', 5, 1),
('1ca5b668-9963-4aa6-a78c-000402b2c28c', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363e20a-149f-11f0-a774-10f60a355c40', '8a9c4d2f-149f-11f0-a774-10f60a355c40', 5, 1),
('1d25eac4-124d-4c89-8a4b-ce2f8b784473', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363df79-149f-11f0-a774-10f60a355c40', '8a93e5e6-149f-11f0-a774-10f60a355c40', 5, 1),
('1e72d2c8-9428-4e3c-a4f5-eead6f31699b', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363dec5-149f-11f0-a774-10f60a355c40', '8a91abf7-149f-11f0-a774-10f60a355c40', 5, 1),
('2099b89b-0120-4d75-916c-9d883937c6d1', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363e0f7-149f-11f0-a774-10f60a355c40', '8a98ba2a-149f-11f0-a774-10f60a355c40', 5, 1),
('23607323-fc53-40c3-82da-32a0efe212fc', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363e446-149f-11f0-a774-10f60a355c40', '8aa30926-149f-11f0-a774-10f60a355c40', 5, 2),
('23708f01-bf6a-495a-9c94-89d6263eb967', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363d7a4-149f-11f0-a774-10f60a355c40', '8a77cc51-149f-11f0-a774-10f60a355c40', 5, 1),
('23f42aa1-343d-4d5f-a310-4cc1e2f48465', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363cf89-149f-11f0-a774-10f60a355c40', '8a64f0da-149f-11f0-a774-10f60a355c40', 5, 2),
('24095898-3ea0-4270-91ee-77c8bf978c11', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363d4e1-149f-11f0-a774-10f60a355c40', '8a6e6248-149f-11f0-a774-10f60a355c40', 5, 1),
('2454ffd9-f761-45cf-847e-660b3276d10f', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363d3c6-149f-11f0-a774-10f60a355c40', '8a6b5230-149f-11f0-a774-10f60a355c40', 5, 2),
('24a7e79d-a8a8-47c1-ae71-f66fda764700', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363d438-149f-11f0-a774-10f60a355c40', '8a6c58d0-149f-11f0-a774-10f60a355c40', 5, 1),
('267e1dad-8b1a-43c1-bea7-ee7c528f3159', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363e7c4-149f-11f0-a774-10f60a355c40', '8aaf6163-149f-11f0-a774-10f60a355c40', 5, 1),
('26cd0c88-5d88-4733-80f6-8c05f3a0c63d', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363e20a-149f-11f0-a774-10f60a355c40', '8a9c50d8-149f-11f0-a774-10f60a355c40', 5, 1),
('2883df7c-9f7a-4a87-9336-4a6e9df84c3e', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363d300-149f-11f0-a774-10f60a355c40', '8a69350e-149f-11f0-a774-10f60a355c40', 5, 1),
('289c10ee-7c7b-493f-91ef-42f2f8c8c475', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363e3f0-149f-11f0-a774-10f60a355c40', '8aa1f072-149f-11f0-a774-10f60a355c40', 5, 1),
('28ae27c9-e350-485e-8a3d-1d69f7f44bba', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363e25e-149f-11f0-a774-10f60a355c40', '8a9d5823-149f-11f0-a774-10f60a355c40', 5, 1),
('2bf48f18-7328-436e-b8c2-2c4606960170', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363ea29-149f-11f0-a774-10f60a355c40', '8ab709ae-149f-11f0-a774-10f60a355c40', 5, 1),
('2c8c3738-86e7-424a-a38c-43f29856630c', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363e446-149f-11f0-a774-10f60a355c40', '8aa30cdd-149f-11f0-a774-10f60a355c40', 5, 0),
('2caef051-9557-4908-8cf0-0a1183f8ab32', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363dd06-149f-11f0-a774-10f60a355c40', '8a8abff2-149f-11f0-a774-10f60a355c40', 5, 1),
('2dc56fa2-ef9c-45a1-ba40-61e8da818487', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363ec4e-149f-11f0-a774-10f60a355c40', '8abfe2b4-149f-11f0-a774-10f60a355c40', 5, 3),
('2e6e0279-e421-474d-9988-095168a87dae', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363ebfd-149f-11f0-a774-10f60a355c40', '8abe6125-149f-11f0-a774-10f60a355c40', 5, 0),
('2e7b8f85-90d8-4ef1-bc24-b61bc945c2c0', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363e9cb-149f-11f0-a774-10f60a355c40', '8ab5baec-149f-11f0-a774-10f60a355c40', 5, 1),
('31ed48f8-4d42-405f-ac8a-d6458597acbb', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363dec5-149f-11f0-a774-10f60a355c40', '8a91ad01-149f-11f0-a774-10f60a355c40', 5, 1),
('336ad7a7-8439-4953-ba48-46cb8fdc98a3', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363d90f-149f-11f0-a774-10f60a355c40', '8a7bd37f-149f-11f0-a774-10f60a355c40', 5, 1),
('33dcf78f-5d56-4699-8ce9-81e2ac82fbfc', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363d489-149f-11f0-a774-10f60a355c40', '8a6d5cff-149f-11f0-a774-10f60a355c40', 5, 0),
('3593d3b3-7fa4-4fb7-ae8b-7c4b50d733c1', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363d5d0-149f-11f0-a774-10f60a355c40', '8a71acaf-149f-11f0-a774-10f60a355c40', 5, 1),
('373769d1-94fa-460b-b9e6-8f25e16d41fd', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363d66b-149f-11f0-a774-10f60a355c40', '8a73bef9-149f-11f0-a774-10f60a355c40', 5, 1),
('38e9a3ae-9880-412c-a372-392b2f36c5b9', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363d702-149f-11f0-a774-10f60a355c40', '8a75bc50-149f-11f0-a774-10f60a355c40', 5, 1),
('3c035c33-fc4e-42e0-a201-9b5f6a6ff06b', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363e548-149f-11f0-a774-10f60a355c40', '8aa6d02b-149f-11f0-a774-10f60a355c40', 5, 1),
('3c34b61b-f29c-46ba-b6df-10382ee5d15f', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363e330-149f-11f0-a774-10f60a355c40', '8a9f94e4-149f-11f0-a774-10f60a355c40', 5, 1),
('3d66e41c-0c7d-4fea-b739-9f1e8ca8b9fd', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363de14-149f-11f0-a774-10f60a355c40', '8a8f45b3-149f-11f0-a774-10f60a355c40', 5, 1),
('3d70d736-2fa3-4664-8f23-85f949a74252', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363e5a6-149f-11f0-a774-10f60a355c40', '8aa7d514-149f-11f0-a774-10f60a355c40', 5, 2),
('3f25b367-37e2-4ffd-ae48-91c16229bd0c', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363df79-149f-11f0-a774-10f60a355c40', '8a93e4d4-149f-11f0-a774-10f60a355c40', 5, 1),
('3f40ffb5-f322-4457-a48d-c652c034c00f', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363df20-149f-11f0-a774-10f60a355c40', '8a92b1fe-149f-11f0-a774-10f60a355c40', 5, 1),
('40059266-ce08-4040-a269-5b34f189e78c', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363dab3-149f-11f0-a774-10f60a355c40', '8a813180-149f-11f0-a774-10f60a355c40', 5, 1),
('414700ba-1519-4810-ad7e-aa59a3cd6e49', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363e499-149f-11f0-a774-10f60a355c40', '8aa421de-149f-11f0-a774-10f60a355c40', 5, 0),
('429bd666-02c7-4adb-abdf-f804f0d65a11', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363e2bf-149f-11f0-a774-10f60a355c40', '8a9e96b4-149f-11f0-a774-10f60a355c40', 5, 0),
('42c49fa6-b347-4f7f-a0a9-6fecf431859d', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363db03-149f-11f0-a774-10f60a355c40', '8a82298a-149f-11f0-a774-10f60a355c40', 5, 1),
('430e3292-a3b2-43a4-bd49-263a7ed16985', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363e76d-149f-11f0-a774-10f60a355c40', '8aadfa30-149f-11f0-a774-10f60a355c40', 5, 2),
('44a33c1b-497b-43de-99c5-9f5227e1046d', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363d5d0-149f-11f0-a774-10f60a355c40', '8a71affa-149f-11f0-a774-10f60a355c40', 5, 1),
('45139f97-1e0b-448f-92c3-39ff621c335a', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363d61d-149f-11f0-a774-10f60a355c40', '8a72bd5b-149f-11f0-a774-10f60a355c40', 5, 1),
('45a7f4f3-ebaf-4eb9-a134-0e86baa5f7ed', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363eaf3-149f-11f0-a774-10f60a355c40', '8ab9b783-149f-11f0-a774-10f60a355c40', 5, 1),
('484f2cc4-28f1-4d19-bea3-f392b75baabc', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363ea29-149f-11f0-a774-10f60a355c40', '8ab71884-149f-11f0-a774-10f60a355c40', 5, 1),
('4a56ecdc-daa0-4add-8e7e-6e60e07d1415', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363dbb6-149f-11f0-a774-10f60a355c40', '8a84c639-149f-11f0-a774-10f60a355c40', 5, 1),
('4b3be839-a032-4381-9171-eec1be3f34d3', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363dbb6-149f-11f0-a774-10f60a355c40', '8a84c2a2-149f-11f0-a774-10f60a355c40', 5, 1),
('4b903be7-9385-45c2-bc25-9426e6672e66', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363cf89-149f-11f0-a774-10f60a355c40', '8a65f6f7-149f-11f0-a774-10f60a355c40', 5, 2),
('4c158495-cf17-42cf-813f-95336e3f8d57', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363d580-149f-11f0-a774-10f60a355c40', '8a7097b2-149f-11f0-a774-10f60a355c40', 5, 1),
('4cc26dd6-cc48-4910-ba11-d62a534d8c90', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363e937-149f-11f0-a774-10f60a355c40', '8ab4751a-149f-11f0-a774-10f60a355c40', 5, 1),
('5095e2d2-7d4a-4ded-84a2-a040453b803c', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363e70f-149f-11f0-a774-10f60a355c40', '8aac6d62-149f-11f0-a774-10f60a355c40', 5, 1),
('5102f07c-fcb6-4674-84f3-3370f08d0df9', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363d815-149f-11f0-a774-10f60a355c40', '8a78c27f-149f-11f0-a774-10f60a355c40', 5, 1),
('51704492-d454-49a3-b19f-7e41c4d83f34', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363d489-149f-11f0-a774-10f60a355c40', '8a6d5aa8-149f-11f0-a774-10f60a355c40', 5, 2),
('530c9c55-1752-4e5f-bf3d-c664b534805d', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363eb47-149f-11f0-a774-10f60a355c40', '8abb1eda-149f-11f0-a774-10f60a355c40', 5, 1),
('56340964-97c0-4998-9cf9-71112a33f47b', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363e4ed-149f-11f0-a774-10f60a355c40', '8aa54652-149f-11f0-a774-10f60a355c40', 5, 0),
('56a560d8-ed6c-46fe-8014-cb11330a5ff9', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363dfcd-149f-11f0-a774-10f60a355c40', '8a950c5f-149f-11f0-a774-10f60a355c40', 5, 1),
('56fff38f-f8dd-4eb3-a6a8-8749f0ca89e7', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363d533-149f-11f0-a774-10f60a355c40', '8a6f7d51-149f-11f0-a774-10f60a355c40', 5, 1),
('59095a70-8bff-4c8a-b929-2bc3f7d0568a', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363db5b-149f-11f0-a774-10f60a355c40', '8a8346e5-149f-11f0-a774-10f60a355c40', 5, 3),
('59982bad-1310-42f4-87a5-49470a23e71b', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363e099-149f-11f0-a774-10f60a355c40', '8a9779a8-149f-11f0-a774-10f60a355c40', 5, 1),
('5b4037e3-637d-4fee-b360-95f462ff0723', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363d364-149f-11f0-a774-10f60a355c40', '8a6a3f24-149f-11f0-a774-10f60a355c40', 5, 1),
('5b63de94-0f50-4fda-982b-35d9ab3c8fa1', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363d489-149f-11f0-a774-10f60a355c40', '8a6d5bd8-149f-11f0-a774-10f60a355c40', 5, 1),
('5c1c0911-f747-4775-a0c3-e7a598972f61', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363db03-149f-11f0-a774-10f60a355c40', '8a82298a-149f-11f0-a774-10f60a355c40', 5, 2),
('5cc5af4e-c44b-4064-941e-57e67577a7c0', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363d3c6-149f-11f0-a774-10f60a355c40', '8a6b5230-149f-11f0-a774-10f60a355c40', 5, 1),
('5e62282e-32de-4628-8c78-2f7db393c43a', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363e81b-149f-11f0-a774-10f60a355c40', '8ab0e091-149f-11f0-a774-10f60a355c40', 5, 1),
('6086d690-5708-497b-8e1e-245d4de21499', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363d9ff-149f-11f0-a774-10f60a355c40', '8a7f07ae-149f-11f0-a774-10f60a355c40', 5, 2),
('61d41d71-cc63-43e7-9759-df9cc8752498', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363d90f-149f-11f0-a774-10f60a355c40', '8a7bd48f-149f-11f0-a774-10f60a355c40', 5, 1),
('62f3d258-250d-4d3d-9115-0f6e5144a454', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363d4e1-149f-11f0-a774-10f60a355c40', '8a6e6659-149f-11f0-a774-10f60a355c40', 5, 1),
('636af01d-6e4e-43e5-86b8-389225d6132d', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363dc58-149f-11f0-a774-10f60a355c40', '8a875684-149f-11f0-a774-10f60a355c40', 5, 1),
('64f95509-b8de-4837-ae89-11b3ab8203e9', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363e548-149f-11f0-a774-10f60a355c40', '8aa6cc7a-149f-11f0-a774-10f60a355c40', 5, 1),
('675cdf6f-d69b-455c-978e-75878431389f', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363dd5a-149f-11f0-a774-10f60a355c40', '8a8bfd49-149f-11f0-a774-10f60a355c40', 5, 1),
('676a5b24-dc8a-49b6-89d0-d4e93871c288', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363db5b-149f-11f0-a774-10f60a355c40', '8a836845-149f-11f0-a774-10f60a355c40', 5, 1),
('6897a3cc-f3b4-441b-a012-40d231c14b23', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363e5fa-149f-11f0-a774-10f60a355c40', '8aa8dc60-149f-11f0-a774-10f60a355c40', 5, 1),
('68c19185-7949-4e97-9507-23c55b88368f', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363d66b-149f-11f0-a774-10f60a355c40', '8a73c23c-149f-11f0-a774-10f60a355c40', 5, 1),
('693676a0-e3f8-4215-80a0-d8f06a307376', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363d364-149f-11f0-a774-10f60a355c40', '8a6a3cae-149f-11f0-a774-10f60a355c40', 5, 1),
('6c22b500-dc67-41ec-b7fa-927f572e17db', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363eaf3-149f-11f0-a774-10f60a355c40', '8ab9b8a7-149f-11f0-a774-10f60a355c40', 5, 1),
('6d0287ee-340d-4197-bd98-4d2771014588', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363d702-149f-11f0-a774-10f60a355c40', '8a75c1a5-149f-11f0-a774-10f60a355c40', 5, 1),
('6d256ed7-1c5e-42cc-89fc-53023da56fd8', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363e3f0-149f-11f0-a774-10f60a355c40', '8aa1f271-149f-11f0-a774-10f60a355c40', 5, 1),
('6d48c347-f787-4402-b67a-533e200fa177', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363d438-149f-11f0-a774-10f60a355c40', '8a6c59ef-149f-11f0-a774-10f60a355c40', 5, 1),
('6ee10fb7-053f-447e-a2ff-49ffa3807524', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363e446-149f-11f0-a774-10f60a355c40', '8aa30cdd-149f-11f0-a774-10f60a355c40', 5, 1),
('6ff36ea5-57bc-4d9a-a8d8-8725b7799317', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363e499-149f-11f0-a774-10f60a355c40', '8aa421de-149f-11f0-a774-10f60a355c40', 5, 1),
('70eb2443-8577-4d5e-9c30-3aa14fdbf054', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363e2bf-149f-11f0-a774-10f60a355c40', '8a9e96b4-149f-11f0-a774-10f60a355c40', 5, 2),
('7264dca2-53aa-44bd-8d38-f39d3e410258', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363e6ae-149f-11f0-a774-10f60a355c40', '8aab17e2-149f-11f0-a774-10f60a355c40', 5, 1),
('72931975-c1e2-46a8-90c1-68ec8c4af2bf', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363e878-149f-11f0-a774-10f60a355c40', '8ab21484-149f-11f0-a774-10f60a355c40', 5, 1),
('74a39852-2820-4b61-a753-e968a1847890', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363e7c4-149f-11f0-a774-10f60a355c40', '8aaf6552-149f-11f0-a774-10f60a355c40', 5, 1),
('75906c67-7099-4ba7-b265-3f78ca0e03ba', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363e878-149f-11f0-a774-10f60a355c40', '8ab20dc2-149f-11f0-a774-10f60a355c40', 5, 1),
('782df2ed-eee2-4b76-b75d-18a04ec7cd4f', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363e8df-149f-11f0-a774-10f60a355c40', '8ab344ae-149f-11f0-a774-10f60a355c40', 5, 1),
('79f4b23c-755a-4732-a7db-7f0a107e657b', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363d8bc-149f-11f0-a774-10f60a355c40', '8a7acc38-149f-11f0-a774-10f60a355c40', 5, 1),
('7a2d52d4-fa94-4927-a4c6-9280d417cdef', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363e1ae-149f-11f0-a774-10f60a355c40', '8a9b1631-149f-11f0-a774-10f60a355c40', 5, 1),
('7a591870-a603-4bba-9557-b95d2bced842', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363e395-149f-11f0-a774-10f60a355c40', '8aa0e10d-149f-11f0-a774-10f60a355c40', 5, 1),
('7a81c1e8-8edf-408c-a637-f9fee9302916', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363d66b-149f-11f0-a774-10f60a355c40', '8a73c42c-149f-11f0-a774-10f60a355c40', 5, 2),
('7c4a2861-74ae-406b-8087-db15fc2e3e07', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363ec4e-149f-11f0-a774-10f60a355c40', '8abfe2b4-149f-11f0-a774-10f60a355c40', 5, 3),
('7cc609f4-12ee-443a-b228-bea3060e511e', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363e7c4-149f-11f0-a774-10f60a355c40', '8aaf6552-149f-11f0-a774-10f60a355c40', 5, 0),
('7cf82a19-6b33-4d87-94ad-0420280c87ae', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363e878-149f-11f0-a774-10f60a355c40', '8ab21484-149f-11f0-a774-10f60a355c40', 5, 0),
('7f1c446a-1f91-40fc-8243-51ef9048552a', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363dab3-149f-11f0-a774-10f60a355c40', '8a812500-149f-11f0-a774-10f60a355c40', 5, 1),
('7fb534be-f20c-404d-a1ee-ef26bce6061c', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363dbb6-149f-11f0-a774-10f60a355c40', '8a84bae9-149f-11f0-a774-10f60a355c40', 5, 1),
('80bd7f85-85c3-4308-8535-7834e1dd58fb', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363d300-149f-11f0-a774-10f60a355c40', '8a69350e-149f-11f0-a774-10f60a355c40', 5, 1),
('81e18d77-b7da-49d0-be23-6f48213e5156', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363d753-149f-11f0-a774-10f60a355c40', '8a76bccc-149f-11f0-a774-10f60a355c40', 5, 1),
('860fd6da-1d4d-4057-a52e-63ea1a92635b', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363e9cb-149f-11f0-a774-10f60a355c40', '8ab5baec-149f-11f0-a774-10f60a355c40', 5, 1),
('86dfedd1-a522-4e0f-bd0d-9b4b16180ec1', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363e14f-149f-11f0-a774-10f60a355c40', '8a99efa2-149f-11f0-a774-10f60a355c40', 5, 2),
('874ee297-efea-4ed7-abcc-87bea58ca492', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363eba1-149f-11f0-a774-10f60a355c40', '8abcdec9-149f-11f0-a774-10f60a355c40', 5, 0),
('87d999d8-d435-4676-957a-4a6a3ce944b2', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363e548-149f-11f0-a774-10f60a355c40', '8aa6d02b-149f-11f0-a774-10f60a355c40', 5, 4),
('8a540dd2-ae6a-4712-8a2b-925f8e72a036', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363dd06-149f-11f0-a774-10f60a355c40', '8a8abbac-149f-11f0-a774-10f60a355c40', 5, 1),
('8b31a9e3-50ed-44da-9b3c-fc9731fdf5c8', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363d753-149f-11f0-a774-10f60a355c40', '8a76bbd6-149f-11f0-a774-10f60a355c40', 5, 1),
('8b64c2e0-b8f0-4e3d-8bed-3379f5fe0444', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363dd5a-149f-11f0-a774-10f60a355c40', '8a8bf916-149f-11f0-a774-10f60a355c40', 5, 2),
('8f630524-450c-4c48-8463-e9f1fcd082e7', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363eb47-149f-11f0-a774-10f60a355c40', '8abb1eda-149f-11f0-a774-10f60a355c40', 5, 1),
('8fb3db96-a770-4f7a-958f-1f8a9449183e', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363e14f-149f-11f0-a774-10f60a355c40', '8a99eea5-149f-11f0-a774-10f60a355c40', 5, 2),
('90412a4b-9468-4652-8d89-5d5b35695d1a', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363e5a6-149f-11f0-a774-10f60a355c40', '8aa7d419-149f-11f0-a774-10f60a355c40', 5, 1),
('9062a79f-b811-4f5f-b6e6-b11878459ad2', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363de70-149f-11f0-a774-10f60a355c40', '8a907afb-149f-11f0-a774-10f60a355c40', 5, 2),
('995354d2-6110-43f6-944d-2c86d5c7d384', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363df79-149f-11f0-a774-10f60a355c40', '8a93da7b-149f-11f0-a774-10f60a355c40', 5, 1),
('9a8d01b2-988a-4986-a6ab-6ee9c5e39211', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363dfcd-149f-11f0-a774-10f60a355c40', '8a950c5f-149f-11f0-a774-10f60a355c40', 5, 1),
('9a8d20ea-e92f-4e73-bf5a-c309f045d39f', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363da5f-149f-11f0-a774-10f60a355c40', '8a801405-149f-11f0-a774-10f60a355c40', 5, 1),
('9bc24177-ef84-480b-9c8e-5b666cc6fc42', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363db5b-149f-11f0-a774-10f60a355c40', '8a833afc-149f-11f0-a774-10f60a355c40', 5, 1),
('9c1f6cda-90e5-4d58-b0bc-99a153beba9e', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363e70f-149f-11f0-a774-10f60a355c40', '8aac6d62-149f-11f0-a774-10f60a355c40', 5, 1),
('9e007544-33e3-4288-8df1-f3a38fe0f020', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363e0f7-149f-11f0-a774-10f60a355c40', '8a98ba2a-149f-11f0-a774-10f60a355c40', 5, 0),
('9e067b27-521d-4b50-882f-7185796408e9', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363dc58-149f-11f0-a774-10f60a355c40', '8a875082-149f-11f0-a774-10f60a355c40', 5, 1),
('9eaf6c67-4fa2-4a4f-ba38-72baa1924257', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363d9ff-149f-11f0-a774-10f60a355c40', '8a7f0b40-149f-11f0-a774-10f60a355c40', 5, 1),
('9f046bf7-f137-45c6-9292-f830996715d1', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363d533-149f-11f0-a774-10f60a355c40', '8a6f7bd2-149f-11f0-a774-10f60a355c40', 5, 1),
('9f12f873-85e6-467b-8bb9-68bc2b0af439', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363dd06-149f-11f0-a774-10f60a355c40', '8a8ab265-149f-11f0-a774-10f60a355c40', 5, 1),
('9fa882bb-bc1f-4b8d-b591-ecbe4183aa81', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363e039-149f-11f0-a774-10f60a355c40', '8a9631fc-149f-11f0-a774-10f60a355c40', 5, 1),
('a155775b-a23e-4d39-972b-b6d26b105e48', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363e8df-149f-11f0-a774-10f60a355c40', '8ab34770-149f-11f0-a774-10f60a355c40', 5, 1),
('a1c16954-d981-4f12-8f33-e289c46f93f3', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363e0f7-149f-11f0-a774-10f60a355c40', '8a98accf-149f-11f0-a774-10f60a355c40', 5, 1),
('a28c29a2-27e9-4c1a-b9d2-2f187ab26f68', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363d7a4-149f-11f0-a774-10f60a355c40', '8a77ce7d-149f-11f0-a774-10f60a355c40', 5, 1),
('a2d41ebc-ca6a-4d93-b2de-819e224e5efb', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363e4ed-149f-11f0-a774-10f60a355c40', '8aa54772-149f-11f0-a774-10f60a355c40', 5, 1),
('a362cfd1-7074-42f9-b31c-3b42cd961c27', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363d871-149f-11f0-a774-10f60a355c40', '8a79c541-149f-11f0-a774-10f60a355c40', 5, 2),
('a581f83a-0694-45e7-a8c7-05bd78a3008d', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363e81b-149f-11f0-a774-10f60a355c40', '8ab0defb-149f-11f0-a774-10f60a355c40', 5, 1),
('a63b3a79-7473-402d-b078-2cebcda4c57b', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363e659-149f-11f0-a774-10f60a355c40', '8aa9e3d1-149f-11f0-a774-10f60a355c40', 5, 2),
('a72bc0bb-4fe0-42c7-b1eb-b4a1ecd69bab', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363d61d-149f-11f0-a774-10f60a355c40', '8a72ba3e-149f-11f0-a774-10f60a355c40', 5, 1),
('a85bb01b-db19-41d7-a2c0-39820e32df9e', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363d61d-149f-11f0-a774-10f60a355c40', '8a72bb55-149f-11f0-a774-10f60a355c40', 5, 1),
('a897eabd-f36b-4ede-afba-013f4fd7292f', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363e937-149f-11f0-a774-10f60a355c40', '8ab47820-149f-11f0-a774-10f60a355c40', 5, 1),
('a971d75a-2474-467a-b44e-691c3781bb89', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363d815-149f-11f0-a774-10f60a355c40', '8a78c3a2-149f-11f0-a774-10f60a355c40', 5, 1),
('aa38584b-49e3-423b-9e1c-5daf247ba5fa', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363eb47-149f-11f0-a774-10f60a355c40', '8abb1836-149f-11f0-a774-10f60a355c40', 5, 1),
('aa79e58e-7745-48a3-b936-868f388b6936', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363d3c6-149f-11f0-a774-10f60a355c40', '8a6b5597-149f-11f0-a774-10f60a355c40', 5, 1),
('aa913e3e-aac7-41cc-87c3-934975107b52', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363e9cb-149f-11f0-a774-10f60a355c40', '8ab5baec-149f-11f0-a774-10f60a355c40', 5, 1),
('ab09d3e1-f0e7-48ff-a06c-5115a80fd320', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363e099-149f-11f0-a774-10f60a355c40', '8a977aa4-149f-11f0-a774-10f60a355c40', 5, 1),
('ab0bdb01-4b1d-44b7-8024-b5819da34dca', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363e1ae-149f-11f0-a774-10f60a355c40', '8a9b1730-149f-11f0-a774-10f60a355c40', 5, 1),
('ab5ad221-ca43-41bd-91a0-d31035c6d4ed', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363d702-149f-11f0-a774-10f60a355c40', '8a75bfaa-149f-11f0-a774-10f60a355c40', 5, 2),
('acb7e24b-ba31-4426-af5e-62adc21a8d6e', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363d26a-149f-11f0-a774-10f60a355c40', '8a6823d5-149f-11f0-a774-10f60a355c40', 5, 2),
('af09d3a5-68b2-4abe-94e7-bf8f949c28fc', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363dc58-149f-11f0-a774-10f60a355c40', '8a875082-149f-11f0-a774-10f60a355c40', 5, 1),
('af9857ea-7251-4e0e-926b-739ac9481c9a', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363e25e-149f-11f0-a774-10f60a355c40', '8a9d5823-149f-11f0-a774-10f60a355c40', 5, 1),
('b032ba8e-9d34-42b3-8656-fd1c245cc3d5', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363e659-149f-11f0-a774-10f60a355c40', '8aa9e2b4-149f-11f0-a774-10f60a355c40', 5, 1),
('b1d0b804-c8e7-486e-95fa-0e808c9850cb', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363d6b6-149f-11f0-a774-10f60a355c40', '8a74c746-149f-11f0-a774-10f60a355c40', 5, 1),
('b23848f4-17fd-4bd8-b2a8-382145ef1c99', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363e25e-149f-11f0-a774-10f60a355c40', '8a9d572b-149f-11f0-a774-10f60a355c40', 5, 0),
('b3a591b5-ddfa-4a12-acc4-f969cc92cba6', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363d26a-149f-11f0-a774-10f60a355c40', '8a6823d5-149f-11f0-a774-10f60a355c40', 5, 1),
('b7d3614c-c4d7-4f54-915f-ec2e06e367f1', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363db03-149f-11f0-a774-10f60a355c40', '8a822cf8-149f-11f0-a774-10f60a355c40', 5, 1),
('b95148f7-2e61-4245-8072-8fcb312034c9', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363d364-149f-11f0-a774-10f60a355c40', '8a6a401e-149f-11f0-a774-10f60a355c40', 5, 3),
('bab19b7d-9aaf-4c75-8ce8-12486a7bc03f', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363ea91-149f-11f0-a774-10f60a355c40', '8ab85b8e-149f-11f0-a774-10f60a355c40', 5, 1),
('bafbee5b-a6ca-4193-ae4b-682bd3bf9fe4', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363d26a-149f-11f0-a774-10f60a355c40', '8a6823d5-149f-11f0-a774-10f60a355c40', 5, 1),
('bb83c1c8-d6c0-46e6-8315-2d44cf42adb3', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363e14f-149f-11f0-a774-10f60a355c40', '8a99eea5-149f-11f0-a774-10f60a355c40', 5, 1),
('be41470c-167d-461c-9ccd-0912010b96e5', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363d580-149f-11f0-a774-10f60a355c40', '8a70a86b-149f-11f0-a774-10f60a355c40', 5, 2),
('bf6ef8a2-71b5-496a-a68f-c57a55a9d7d0', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363dec5-149f-11f0-a774-10f60a355c40', '8a91adfd-149f-11f0-a774-10f60a355c40', 5, 1),
('c0b71c7b-d18a-4167-91f4-17184a0ec705', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363da5f-149f-11f0-a774-10f60a355c40', '8a801405-149f-11f0-a774-10f60a355c40', 5, 1),
('c152b939-c10c-445b-b78e-068a3c6d845c', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363ea91-149f-11f0-a774-10f60a355c40', '8ab85b8e-149f-11f0-a774-10f60a355c40', 5, 0),
('c1f73ef8-7e1a-43ed-a74d-665459ddaeae', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363e20a-149f-11f0-a774-10f60a355c40', '8a9c4ecc-149f-11f0-a774-10f60a355c40', 5, 1),
('c353aa40-2f57-45b2-97d2-7a74cf6ff32b', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363de70-149f-11f0-a774-10f60a355c40', '8a907cf6-149f-11f0-a774-10f60a355c40', 5, 1),
('c5eda9d1-98ef-445a-ade4-a5e0e0cb048e', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363d580-149f-11f0-a774-10f60a355c40', '8a70a96f-149f-11f0-a774-10f60a355c40', 5, 1),
('c606ef59-e619-4e11-ab19-0164c4892ff5', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363d815-149f-11f0-a774-10f60a355c40', '8a78c4bc-149f-11f0-a774-10f60a355c40', 5, 1),
('c649bb24-75d3-453b-8f89-b4a66233ef70', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363d90f-149f-11f0-a774-10f60a355c40', '8a7bd686-149f-11f0-a774-10f60a355c40', 5, 1),
('c653eedb-ea8c-4b3d-b445-67b89be8d398', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363d9ff-149f-11f0-a774-10f60a355c40', '8a7f0997-149f-11f0-a774-10f60a355c40', 5, 1),
('c6bd89b5-e6a6-4a56-9a29-fae806e2c7f1', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363e395-149f-11f0-a774-10f60a355c40', '8aa0e214-149f-11f0-a774-10f60a355c40', 5, 1),
('c744cee5-7d88-46ac-9357-45a4976da94a', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363d7a4-149f-11f0-a774-10f60a355c40', '8a77d1ab-149f-11f0-a774-10f60a355c40', 5, 0),
('c86d8561-adcd-45be-9365-5ab2b6ec9f01', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363d960-149f-11f0-a774-10f60a355c40', '8a7cd304-149f-11f0-a774-10f60a355c40', 5, 1),
('c8de9119-173e-48e3-b000-96884203b75b', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363d8bc-149f-11f0-a774-10f60a355c40', '8a7acb18-149f-11f0-a774-10f60a355c40', 5, 1),
('ca9c4f2f-11c6-4b40-b947-80f999b1240d', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363d753-149f-11f0-a774-10f60a355c40', '8a76bbd6-149f-11f0-a774-10f60a355c40', 5, 1),
('cb53eacc-ff33-468c-8beb-2f98c9d4a655', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363e70f-149f-11f0-a774-10f60a355c40', '8aac6d62-149f-11f0-a774-10f60a355c40', 5, 2),
('cd60abb9-fa41-4522-b038-892d5e48d425', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363eaf3-149f-11f0-a774-10f60a355c40', '8ab9b8a7-149f-11f0-a774-10f60a355c40', 5, 1),
('ce327edd-3f91-4fbe-a87f-062d47e2ac12', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363e4ed-149f-11f0-a774-10f60a355c40', '8aa54552-149f-11f0-a774-10f60a355c40', 5, 1),
('ce524173-6dbc-49d0-a680-e695fa21d8eb', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363d6b6-149f-11f0-a774-10f60a355c40', '8a74c642-149f-11f0-a774-10f60a355c40', 5, 1),
('cef71cab-8fcf-4aa9-b562-649323ed2fc0', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363d9ad-149f-11f0-a774-10f60a355c40', '8a7dfe3e-149f-11f0-a774-10f60a355c40', 5, 1),
('cf631562-feea-4fcc-8388-66e22d4dee1d', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363dc09-149f-11f0-a774-10f60a355c40', '8a861723-149f-11f0-a774-10f60a355c40', 5, 1),
('d08315d6-125b-4d22-af46-f35bf0c0d028', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363e6ae-149f-11f0-a774-10f60a355c40', '8aab17e2-149f-11f0-a774-10f60a355c40', 5, 0),
('d0c34629-cd96-4dcf-bedf-8945b7ec11ce', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363df20-149f-11f0-a774-10f60a355c40', '8a92a8db-149f-11f0-a774-10f60a355c40', 5, 2),
('d2a5b739-9576-47a9-84ed-358bb2fd1ebb', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363e76d-149f-11f0-a774-10f60a355c40', '8aadf58c-149f-11f0-a774-10f60a355c40', 5, 1),
('d2f6ed1f-4590-469a-8352-28d8e94f571d', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363ebfd-149f-11f0-a774-10f60a355c40', '8abe4ee1-149f-11f0-a774-10f60a355c40', 5, 1),
('d357f827-de6a-4066-ad37-29e138d5ab78', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363ebfd-149f-11f0-a774-10f60a355c40', '8abe6125-149f-11f0-a774-10f60a355c40', 5, 1),
('d405d8be-fdea-4fe1-b5c3-9bef05610adb', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363e1ae-149f-11f0-a774-10f60a355c40', '8a9b1524-149f-11f0-a774-10f60a355c40', 5, 1),
('d549378b-ee6b-4057-a3e0-7b55581b2033', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363ddb1-149f-11f0-a774-10f60a355c40', '8a8da0fb-149f-11f0-a774-10f60a355c40', 5, 1),
('d55fb9f0-2001-49d1-b263-cd5f4c9f87d7', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363e330-149f-11f0-a774-10f60a355c40', '8a9fa141-149f-11f0-a774-10f60a355c40', 5, 0),
('d5943363-7f45-4cf8-adb6-c984f782bce2', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363eba1-149f-11f0-a774-10f60a355c40', '8abcdc99-149f-11f0-a774-10f60a355c40', 5, 1),
('da5e90d0-e8a7-4686-a5bc-1430c7f5437f', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363dfcd-149f-11f0-a774-10f60a355c40', '8a951c77-149f-11f0-a774-10f60a355c40', 5, 1),
('dae4a7dd-af14-4e9c-9f56-c6dca758d50e', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363e937-149f-11f0-a774-10f60a355c40', '8ab4794b-149f-11f0-a774-10f60a355c40', 5, 1),
('dd312446-83ef-4492-a509-084a544e350b', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363d9ad-149f-11f0-a774-10f60a355c40', '8a7dfe3e-149f-11f0-a774-10f60a355c40', 5, 1),
('dd80263c-d572-43d1-87e5-6e0e022f4393', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363eba1-149f-11f0-a774-10f60a355c40', '8abcdec9-149f-11f0-a774-10f60a355c40', 5, 0),
('df890627-640a-46fa-b514-1cbd7132329a', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363d9ad-149f-11f0-a774-10f60a355c40', '8a7df1a9-149f-11f0-a774-10f60a355c40', 5, 1),
('e0325062-09ea-466d-a28f-57423917fa6f', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363e395-149f-11f0-a774-10f60a355c40', '8aa0e214-149f-11f0-a774-10f60a355c40', 5, 2),
('e09c7ad5-8a71-448e-8b8c-c8056d035a28', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363d8bc-149f-11f0-a774-10f60a355c40', '8a7ac9c4-149f-11f0-a774-10f60a355c40', 5, 1),
('e1cf324e-6698-4550-ba32-7d7a785b6429', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363dc09-149f-11f0-a774-10f60a355c40', '8a861723-149f-11f0-a774-10f60a355c40', 5, 1),
('e34ce740-eaca-435d-b635-1c66ae0cae22', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363e039-149f-11f0-a774-10f60a355c40', '8a962d78-149f-11f0-a774-10f60a355c40', 5, 1),
('e3974b55-1979-4a40-b1fa-98f66611b745', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363e099-149f-11f0-a774-10f60a355c40', '8a977748-149f-11f0-a774-10f60a355c40', 5, 1),
('e5ef6d3e-bb73-474c-a17c-8a205f165c4c', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363de14-149f-11f0-a774-10f60a355c40', '8a8f3f82-149f-11f0-a774-10f60a355c40', 5, 1),
('e74187ff-2506-4241-98ae-2b40938815ae', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363d871-149f-11f0-a774-10f60a355c40', '8a79c0da-149f-11f0-a774-10f60a355c40', 5, 1),
('e7e9eac7-b1f8-4ac1-9ad5-d21482eb9f71', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363e5a6-149f-11f0-a774-10f60a355c40', '8aa7d514-149f-11f0-a774-10f60a355c40', 5, 1),
('e857a882-5438-42e7-9d57-0218f39fe60c', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363da5f-149f-11f0-a774-10f60a355c40', '8a801405-149f-11f0-a774-10f60a355c40', 5, 1),
('e8969520-945f-4770-a961-23eef5a896d0', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363de70-149f-11f0-a774-10f60a355c40', '8a907980-149f-11f0-a774-10f60a355c40', 5, 1),
('e91d91bb-8cc3-44c3-b691-3d355fa1976b', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363dc09-149f-11f0-a774-10f60a355c40', '8a8618e5-149f-11f0-a774-10f60a355c40', 5, 1),
('e960c61a-5916-4cbf-85ac-f4a408f7b3f0', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363d438-149f-11f0-a774-10f60a355c40', '8a6c55fd-149f-11f0-a774-10f60a355c40', 5, 1),
('e9d353ba-df87-4cf4-9459-f981eddf444c', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363d533-149f-11f0-a774-10f60a355c40', '8a6f7f58-149f-11f0-a774-10f60a355c40', 5, 1),
('ecc9570a-6ff3-456c-83d2-7fd03f9104d3', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363d300-149f-11f0-a774-10f60a355c40', '8a69340f-149f-11f0-a774-10f60a355c40', 5, 1),
('ed959dc1-0fca-4328-9d44-ea92d896f5f5', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363df20-149f-11f0-a774-10f60a355c40', '8a92b1fe-149f-11f0-a774-10f60a355c40', 5, 1),
('ef259019-3ace-4a58-956a-ba70b7656c4c', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363d5d0-149f-11f0-a774-10f60a355c40', '8a71addc-149f-11f0-a774-10f60a355c40', 5, 1),
('f1496f8d-5b02-4493-9fbb-c950084fbf18', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363e5fa-149f-11f0-a774-10f60a355c40', '8aa8db55-149f-11f0-a774-10f60a355c40', 5, 1),
('f46f93a4-12e3-4c1a-af24-ebcee9845217', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363dcaa-149f-11f0-a774-10f60a355c40', '8a88db1b-149f-11f0-a774-10f60a355c40', 5, 1),
('f520ce53-099d-4206-b7d3-dfaa414b8b83', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363d6b6-149f-11f0-a774-10f60a355c40', '8a74c539-149f-11f0-a774-10f60a355c40', 5, 1),
('f9eb69a2-0634-43a5-99f0-622cd7a1b317', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363d4e1-149f-11f0-a774-10f60a355c40', '8a6e6659-149f-11f0-a774-10f60a355c40', 5, 2),
('fb074ef5-5c84-4902-ad6e-4bdfcc887539', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363e2bf-149f-11f0-a774-10f60a355c40', '8a9e92fa-149f-11f0-a774-10f60a355c40', 5, 2),
('fc1074c4-7146-4499-893d-2d40d996f0f9', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363e8df-149f-11f0-a774-10f60a355c40', '8ab34770-149f-11f0-a774-10f60a355c40', 5, 0),
('fd38c4f5-45f8-42f2-9b29-4196273187a3', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363cf89-149f-11f0-a774-10f60a355c40', '8a65f6f7-149f-11f0-a774-10f60a355c40', 5, 4),
('fd4b3e30-2e48-434c-b049-f79507602464', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363ddb1-149f-11f0-a774-10f60a355c40', '8a8d9f28-149f-11f0-a774-10f60a355c40', 5, 1),
('fe9f17d4-31ed-4352-8fa5-282ce5343fc4', 'ffcb3c2e-14a4-11f0-a774-10f60a355c40', 'c28f2c80-14a4-11f0-a774-10f60a355c40', '8363d960-149f-11f0-a774-10f60a355c40', '8a7cd8df-149f-11f0-a774-10f60a355c40', 5, 1),
('ff8518a3-d129-4aa5-8ce8-d1be892142bc', '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', '8363ea91-149f-11f0-a774-10f60a355c40', '8ab857f4-149f-11f0-a774-10f60a355c40', 5, 2),
('ffb250ab-4699-4850-be7d-88854e5404ac', '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', '8363ea29-149f-11f0-a774-10f60a355c40', '8ab71884-149f-11f0-a774-10f60a355c40', 5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `responde16pf`
--

CREATE TABLE `responde16pf` (
  `idRespuesta16PF` varchar(36) NOT NULL,
  `idAspirante` varchar(36) DEFAULT NULL,
  `idGrupo` varchar(36) DEFAULT NULL,
  `idPregunta16PF` varchar(36) DEFAULT NULL,
  `idOpcion16PF` varchar(36) DEFAULT NULL,
  `idPrueba` int(11) DEFAULT NULL,
  `tiempo` DECIMAL(6, 3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuestashartmanaspirante`
--

CREATE TABLE `respuestashartman` (
  `idRespuestaHartman` int(11) NOT NULL,
  `idAspirante` varchar(36) DEFAULT NULL,
  `idGrupo` varchar(36) DEFAULT NULL,
  `idPreguntaHartman` int(11) DEFAULT NULL,
  `idPrueba` int(11) DEFAULT NULL,
  `respuestaAbierta` varchar(500) DEFAULT NULL,
  `tiempoRespuesta` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respondekostick`
--

CREATE TABLE `respondekostick` (
  `idRespuestaKostick` varchar(36) NOT NULL,
  `idAspirante` varchar(36) DEFAULT NULL,
  `idGrupo` varchar(36) DEFAULT NULL,
  `idPreguntaKostick` varchar(36) DEFAULT NULL,
  `idOpcionKostick` varchar(36) DEFAULT NULL,
  `idPrueba` int(11) DEFAULT NULL,
  `tiempo` DECIMAL(6, 3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuestasterman`
--

CREATE TABLE `respuestasterman` (
  `idRespuestaTerman` int(11) NOT NULL,
  `idAspirante` varchar(36) DEFAULT NULL,
  `idGrupo` varchar(36) DEFAULT NULL,
  `idPreguntaTerman` int(11) DEFAULT NULL,
  `idPrueba` int(11) DEFAULT NULL,
  `respuestaAbierta` varchar(500) DEFAULT NULL,
  `tiempoRespuesta` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resultadoshartman`
--

CREATE TABLE `resultadoshartman` (
  `idAspirante` varchar(36) NOT NULL,
  `idGrupo` varchar(36) NOT NULL,
  `fraseDimI` float(11) NOT NULL,
  `fraseDimE` float(11) NOT NULL,
  `fraseDimS` float(11) NOT NULL,
  `fraseDif` float(11) NOT NULL,
  `fraseDimGeneral` float(11) NOT NULL,
  `fraseDimPorcentaje` float(11) NOT NULL,
  `fraseIntI` float(11) NOT NULL,
  `fraseIntE` float(11) NOT NULL,
  `fraseIntS` float(11) NOT NULL,
  `fraseIntGeneral` float(11) NOT NULL,
  `fraseIntPorcentaje` float(11) NOT NULL,
  `fraseD.I` float(11) NOT NULL,
  `fraseDIS` float(11) NOT NULL,
  `fraseVQ1` float(11) NOT NULL,
  `fraseVQ2` float(11) NOT NULL,
  `citaDimI` float(11) NOT NULL,
  `citaDimE` float(11) NOT NULL,
  `citaDimS` float(11) NOT NULL,
  `citaDif` float(11) NOT NULL,
  `citaDimGeneral` float(11) NOT NULL,
  `citaDimPorcentaje` float(11) NOT NULL,
  `citaIntI` float(11) NOT NULL,
  `citaIntE` float(11) NOT NULL,
  `citaIntS` float(11) NOT NULL,
  `citaIntGeneral` float(11) NOT NULL,
  `citaIntPorcentaje` float(11) NOT NULL,
  `citaD.I` float(11) NOT NULL,
  `citaDIS` float(11) NOT NULL,
  `citaSQ1` float(11) NOT NULL,
  `citaSQ2` float(11) NOT NULL,
  `BQr1` float(11) NOT NULL,
  `BQa1` float(11) NOT NULL,
  `BQr2` float(11) NOT NULL,
  `BQa2` float(11) NOT NULL,
  `CQ1` float(11) NOT NULL,
  `CQ2` float(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `idRol` int(11) NOT NULL,
  `nombreRol` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`idRol`, `nombreRol`) VALUES
(1, 'Psicologo'),
(2, 'Coordinador'),
(3, 'Aspirante');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rolesprivilegios`
--

CREATE TABLE `rolesprivilegios` (
  `idRol` int(11) NOT NULL,
  `idPrivilegio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rolesprivilegios`
--

INSERT INTO `rolesprivilegios` (`idRol`, `idPrivilegio`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 18),
(2, 1),
(2, 2),
(2, 23),
(2, 24),
(2, 25),
(2, 26),
(2, 27),
(2, 28),
(2, 29),
(2, 30),
(3, 1),
(3, 2),
(3, 19),
(3, 20),
(3, 21),
(3, 22);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seleccionescolores`
--

CREATE TABLE `seleccionescolores` (
  `idSeleccionColores` varchar(36) NOT NULL,
  `idPrueba` int(11) DEFAULT NULL,
  `idAspirante` varchar(36) DEFAULT NULL,
  `idGrupo` varchar(36) DEFAULT NULL,
  `idColor` int(11) DEFAULT NULL,
  `posicion` int(11) DEFAULT NULL CHECK (`posicion` <= 7 and `posicion` >= 0),
  `fase` int(11) DEFAULT NULL CHECK (`fase` = 1 or `fase` = 2)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `seleccionescolores`
--

INSERT INTO `seleccionescolores` (`idSeleccionColores`, `idPrueba`, `idAspirante`, `idGrupo`, `idColor`, `posicion`, `fase`) VALUES
('6a5a86c9-0f76-11f0-aede-a0294223b12a', 6, '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', 8, 0, 1),
('6a5d0498-0f76-11f0-aede-a0294223b12a', 6, '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', 1, 5, 1),
('6a5d1510-0f76-11f0-aede-a0294223b12a', 6, '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', 3, 7, 1),
('6a5d2115-0f76-11f0-aede-a0294223b12a', 6, '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', 4, 1, 1),
('6a5d2876-0f76-11f0-aede-a0294223b12a', 6, '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', 5, 6, 1),
('6a5d37cc-0f76-11f0-aede-a0294223b12a', 6, '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', 7, 3, 1),
('6a5d6166-0f76-11f0-aede-a0294223b12a', 6, '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', 6, 2, 1),
('6a5d89d5-0f76-11f0-aede-a0294223b12a', 6, '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', 2, 4, 1),
('6a5e07c9-0f76-11f0-aede-a0294223b12a', 6, '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', 7, 0, 2),
('6a5e1153-0f76-11f0-aede-a0294223b12a', 6, '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', 6, 1, 2),
('6a5e1a8e-0f76-11f0-aede-a0294223b12a', 6, '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', 5, 2, 2),
('6a5e1af0-0f76-11f0-aede-a0294223b12a', 6, '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', 8, 3, 2),
('6a5e222e-0f76-11f0-aede-a0294223b12a', 6, '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', 3, 4, 2),
('6a5e2700-0f76-11f0-aede-a0294223b12a', 6, '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', 2, 5, 2),
('6a5e3686-0f76-11f0-aede-a0294223b12a', 6, '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', 1, 6, 2),
('6a5e4271-0f76-11f0-aede-a0294223b12a', 6, '9c86af86-0a67-11f0-aa07-a0294223b12a', '3768c32d-0485-11f0-843f-10f60a355c40', 4, 7, 2),
('707f57e3-0b9a-11f0-a231-047c163ab16f', 6, 'b19b45b0-0b90-11f0-a231-047c163ab16f', '81d14e2a-0b90-11f0-a231-047c163ab16f', 1, 0, 1),
('708149fe-0b9a-11f0-a231-047c163ab16f', 6, 'b19b45b0-0b90-11f0-a231-047c163ab16f', '81d14e2a-0b90-11f0-a231-047c163ab16f', 7, 6, 1),
('708159ee-0b9a-11f0-a231-047c163ab16f', 6, 'b19b45b0-0b90-11f0-a231-047c163ab16f', '81d14e2a-0b90-11f0-a231-047c163ab16f', 4, 1, 1),
('70816381-0b9a-11f0-a231-047c163ab16f', 6, 'b19b45b0-0b90-11f0-a231-047c163ab16f', '81d14e2a-0b90-11f0-a231-047c163ab16f', 2, 2, 1),
('70816692-0b9a-11f0-a231-047c163ab16f', 6, 'b19b45b0-0b90-11f0-a231-047c163ab16f', '81d14e2a-0b90-11f0-a231-047c163ab16f', 5, 3, 1),
('7081691b-0b9a-11f0-a231-047c163ab16f', 6, 'b19b45b0-0b90-11f0-a231-047c163ab16f', '81d14e2a-0b90-11f0-a231-047c163ab16f', 6, 4, 1),
('70817ef1-0b9a-11f0-a231-047c163ab16f', 6, 'b19b45b0-0b90-11f0-a231-047c163ab16f', '81d14e2a-0b90-11f0-a231-047c163ab16f', 8, 5, 1),
('70818505-0b9a-11f0-a231-047c163ab16f', 6, 'b19b45b0-0b90-11f0-a231-047c163ab16f', '81d14e2a-0b90-11f0-a231-047c163ab16f', 3, 7, 1),
('70823368-0b9a-11f0-a231-047c163ab16f', 6, 'b19b45b0-0b90-11f0-a231-047c163ab16f', '81d14e2a-0b90-11f0-a231-047c163ab16f', 3, 1, 2),
('7082336a-0b9a-11f0-a231-047c163ab16f', 6, 'b19b45b0-0b90-11f0-a231-047c163ab16f', '81d14e2a-0b90-11f0-a231-047c163ab16f', 8, 0, 2),
('708235c6-0b9a-11f0-a231-047c163ab16f', 6, 'b19b45b0-0b90-11f0-a231-047c163ab16f', '81d14e2a-0b90-11f0-a231-047c163ab16f', 4, 3, 2),
('70823667-0b9a-11f0-a231-047c163ab16f', 6, 'b19b45b0-0b90-11f0-a231-047c163ab16f', '81d14e2a-0b90-11f0-a231-047c163ab16f', 2, 4, 2),
('708236c3-0b9a-11f0-a231-047c163ab16f', 6, 'b19b45b0-0b90-11f0-a231-047c163ab16f', '81d14e2a-0b90-11f0-a231-047c163ab16f', 5, 2, 2),
('70823b20-0b9a-11f0-a231-047c163ab16f', 6, 'b19b45b0-0b90-11f0-a231-047c163ab16f', '81d14e2a-0b90-11f0-a231-047c163ab16f', 1, 6, 2),
('70823d14-0b9a-11f0-a231-047c163ab16f', 6, 'b19b45b0-0b90-11f0-a231-047c163ab16f', '81d14e2a-0b90-11f0-a231-047c163ab16f', 6, 7, 2),
('70823fa4-0b9a-11f0-a231-047c163ab16f', 6, 'b19b45b0-0b90-11f0-a231-047c163ab16f', '81d14e2a-0b90-11f0-a231-047c163ab16f', 7, 5, 2),
('874f608e-0b79-11f0-a231-047c163ab16f', 6, '3c7d1bd5-0b79-11f0-a231-047c163ab16f', '1ed87e17-0b79-11f0-a231-047c163ab16f', 8, 0, 1),
('874f9b4b-0b79-11f0-a231-047c163ab16f', 6, '3c7d1bd5-0b79-11f0-a231-047c163ab16f', '1ed87e17-0b79-11f0-a231-047c163ab16f', 1, 1, 1),
('874fa3db-0b79-11f0-a231-047c163ab16f', 6, '3c7d1bd5-0b79-11f0-a231-047c163ab16f', '1ed87e17-0b79-11f0-a231-047c163ab16f', 3, 3, 1),
('874fa642-0b79-11f0-a231-047c163ab16f', 6, '3c7d1bd5-0b79-11f0-a231-047c163ab16f', '1ed87e17-0b79-11f0-a231-047c163ab16f', 2, 2, 1),
('874fae2b-0b79-11f0-a231-047c163ab16f', 6, '3c7d1bd5-0b79-11f0-a231-047c163ab16f', '1ed87e17-0b79-11f0-a231-047c163ab16f', 5, 5, 1),
('874fb1a4-0b79-11f0-a231-047c163ab16f', 6, '3c7d1bd5-0b79-11f0-a231-047c163ab16f', '1ed87e17-0b79-11f0-a231-047c163ab16f', 4, 4, 1),
('874fb5f8-0b79-11f0-a231-047c163ab16f', 6, '3c7d1bd5-0b79-11f0-a231-047c163ab16f', '1ed87e17-0b79-11f0-a231-047c163ab16f', 6, 6, 1),
('874fd0ef-0b79-11f0-a231-047c163ab16f', 6, '3c7d1bd5-0b79-11f0-a231-047c163ab16f', '1ed87e17-0b79-11f0-a231-047c163ab16f', 7, 7, 1),
('87513f7d-0b79-11f0-a231-047c163ab16f', 6, '3c7d1bd5-0b79-11f0-a231-047c163ab16f', '1ed87e17-0b79-11f0-a231-047c163ab16f', 8, 0, 2),
('875140f0-0b79-11f0-a231-047c163ab16f', 6, '3c7d1bd5-0b79-11f0-a231-047c163ab16f', '1ed87e17-0b79-11f0-a231-047c163ab16f', 1, 1, 2),
('87516a2a-0b79-11f0-a231-047c163ab16f', 6, '3c7d1bd5-0b79-11f0-a231-047c163ab16f', '1ed87e17-0b79-11f0-a231-047c163ab16f', 2, 2, 2),
('87516e9f-0b79-11f0-a231-047c163ab16f', 6, '3c7d1bd5-0b79-11f0-a231-047c163ab16f', '1ed87e17-0b79-11f0-a231-047c163ab16f', 3, 3, 2),
('875170b0-0b79-11f0-a231-047c163ab16f', 6, '3c7d1bd5-0b79-11f0-a231-047c163ab16f', '1ed87e17-0b79-11f0-a231-047c163ab16f', 5, 5, 2),
('875172da-0b79-11f0-a231-047c163ab16f', 6, '3c7d1bd5-0b79-11f0-a231-047c163ab16f', '1ed87e17-0b79-11f0-a231-047c163ab16f', 6, 6, 2),
('8751759b-0b79-11f0-a231-047c163ab16f', 6, '3c7d1bd5-0b79-11f0-a231-047c163ab16f', '1ed87e17-0b79-11f0-a231-047c163ab16f', 4, 4, 2),
('87518b6a-0b79-11f0-a231-047c163ab16f', 6, '3c7d1bd5-0b79-11f0-a231-047c163ab16f', '1ed87e17-0b79-11f0-a231-047c163ab16f', 7, 7, 2),
('8bf01880-0ba6-11f0-a231-047c163ab16f', 6, '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', 3, 0, 1),
('8bf01e6c-0ba6-11f0-a231-047c163ab16f', 6, '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', 4, 1, 1),
('8bf027f8-0ba6-11f0-a231-047c163ab16f', 6, '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', 5, 2, 1),
('8bf064fa-0ba6-11f0-a231-047c163ab16f', 6, '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', 1, 3, 1),
('8bf08038-0ba6-11f0-a231-047c163ab16f', 6, '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', 7, 5, 1),
('8bf08391-0ba6-11f0-a231-047c163ab16f', 6, '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', 2, 4, 1),
('8bf08ca9-0ba6-11f0-a231-047c163ab16f', 6, '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', 6, 6, 1),
('8bf095af-0ba6-11f0-a231-047c163ab16f', 6, '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', 8, 7, 1),
('8bf15d33-0ba6-11f0-a231-047c163ab16f', 6, '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', 2, 0, 2),
('8bf15fb1-0ba6-11f0-a231-047c163ab16f', 6, '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', 5, 1, 2),
('8bf1636b-0ba6-11f0-a231-047c163ab16f', 6, '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', 1, 2, 2),
('8bf16583-0ba6-11f0-a231-047c163ab16f', 6, '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', 7, 3, 2),
('8bf1694b-0ba6-11f0-a231-047c163ab16f', 6, '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', 6, 4, 2),
('8bf16ab7-0ba6-11f0-a231-047c163ab16f', 6, '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', 8, 6, 2),
('8bf170f8-0ba6-11f0-a231-047c163ab16f', 6, '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', 3, 7, 2),
('8bf1715e-0ba6-11f0-a231-047c163ab16f', 6, '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', '58ddc7eb-0ba6-11f0-a231-047c163ab16f', 4, 5, 2),
('e6e8595e-0b96-11f0-a231-047c163ab16f', 6, 'cd906319-0b96-11f0-a231-047c163ab16f', 'aae297d1-0b96-11f0-a231-047c163ab16f', 4, 1, 1),
('e6e859d7-0b96-11f0-a231-047c163ab16f', 6, 'cd906319-0b96-11f0-a231-047c163ab16f', 'aae297d1-0b96-11f0-a231-047c163ab16f', 3, 0, 1),
('e6e85cfd-0b96-11f0-a231-047c163ab16f', 6, 'cd906319-0b96-11f0-a231-047c163ab16f', 'aae297d1-0b96-11f0-a231-047c163ab16f', 5, 2, 1),
('e6e87777-0b96-11f0-a231-047c163ab16f', 6, 'cd906319-0b96-11f0-a231-047c163ab16f', 'aae297d1-0b96-11f0-a231-047c163ab16f', 2, 3, 1),
('e6e87df6-0b96-11f0-a231-047c163ab16f', 6, 'cd906319-0b96-11f0-a231-047c163ab16f', 'aae297d1-0b96-11f0-a231-047c163ab16f', 1, 4, 1),
('e6e8880d-0b96-11f0-a231-047c163ab16f', 6, 'cd906319-0b96-11f0-a231-047c163ab16f', 'aae297d1-0b96-11f0-a231-047c163ab16f', 7, 5, 1),
('e6e88ac5-0b96-11f0-a231-047c163ab16f', 6, 'cd906319-0b96-11f0-a231-047c163ab16f', 'aae297d1-0b96-11f0-a231-047c163ab16f', 8, 6, 1),
('e6e9be84-0b96-11f0-a231-047c163ab16f', 6, 'cd906319-0b96-11f0-a231-047c163ab16f', 'aae297d1-0b96-11f0-a231-047c163ab16f', 6, 7, 1),
('e6ea29f4-0b96-11f0-a231-047c163ab16f', 6, 'cd906319-0b96-11f0-a231-047c163ab16f', 'aae297d1-0b96-11f0-a231-047c163ab16f', 6, 0, 2),
('e6ea2af7-0b96-11f0-a231-047c163ab16f', 6, 'cd906319-0b96-11f0-a231-047c163ab16f', 'aae297d1-0b96-11f0-a231-047c163ab16f', 5, 1, 2),
('e6ea2dcd-0b96-11f0-a231-047c163ab16f', 6, 'cd906319-0b96-11f0-a231-047c163ab16f', 'aae297d1-0b96-11f0-a231-047c163ab16f', 4, 2, 2),
('e6ea2ec5-0b96-11f0-a231-047c163ab16f', 6, 'cd906319-0b96-11f0-a231-047c163ab16f', 'aae297d1-0b96-11f0-a231-047c163ab16f', 2, 3, 2),
('e6ea31b9-0b96-11f0-a231-047c163ab16f', 6, 'cd906319-0b96-11f0-a231-047c163ab16f', 'aae297d1-0b96-11f0-a231-047c163ab16f', 3, 5, 2),
('e6ea3602-0b96-11f0-a231-047c163ab16f', 6, 'cd906319-0b96-11f0-a231-047c163ab16f', 'aae297d1-0b96-11f0-a231-047c163ab16f', 8, 4, 2),
('e6ea371f-0b96-11f0-a231-047c163ab16f', 6, 'cd906319-0b96-11f0-a231-047c163ab16f', 'aae297d1-0b96-11f0-a231-047c163ab16f', 1, 6, 2),
('e6ea4af7-0b96-11f0-a231-047c163ab16f', 6, 'cd906319-0b96-11f0-a231-047c163ab16f', 'aae297d1-0b96-11f0-a231-047c163ab16f', 7, 7, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seriesterman`
--

CREATE TABLE `seriesterman` (
  `idSerieTerman` int(11) NOT NULL,
  `idPrueba` int(11) DEFAULT NULL,
  `duracion` int DEFAULT NULL,
  `nombreSeccion` varchar(50) DEFAULT NULL,
  `instruccion` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoinstitucion`
--

CREATE TABLE `tipoinstitucion` (
  `idTipoInstitucion` int(11) NOT NULL,
  `nombreTipoInstitucion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipoinstitucion`
--

INSERT INTO `tipoinstitucion` (`idTipoInstitucion`, `nombreTipoInstitucion`) VALUES
(1, 'Educativa Pública'),
(2, 'Educativa Privada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` varchar(36) NOT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `estatusUsuario` tinyint(1) DEFAULT NULL,
  `nombreUsuario` varchar(50) DEFAULT NULL,
  `apellidoPaterno` varchar(50) DEFAULT NULL,
  `apellidoMaterno` varchar(50) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `lada` varchar(4) DEFAULT NULL,
  `numeroTelefono` varchar(10) DEFAULT NULL,
  `idRol` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `usuario`, `estatusUsuario`, `nombreUsuario`, `apellidoPaterno`, `apellidoMaterno`, `correo`, `lada`, `numeroTelefono`, `idRol`) VALUES
('0030d327-0a66-11f0-aa07-a0294223b12a', 'prueba4', 1, 'prueba4', '1', '1', 'prueba4', '1', '1', 3),
('03b01b4c-0b85-11f0-a231-047c163ab16f', 'mauriciort@gmail.com', 1, 'Mauricio', 'Rodriguez', 'Tovar', 'mauriciort@gmail.com', '52', '4428474583', 3),
('0f9cded4-0a08-11f0-aa07-a0294223b12a', 'prueba8', 1, 'prueba8', '1', '1', 'prueba8', '1', '1', 3),
('130a713b-0b92-11f0-a231-047c163ab16f', '', 1, '', '', '', '', '', '', 3),
('1750132e-0b92-11f0-a231-047c163ab16f', '', 1, '', '', '', '', '', '', 3),
('1aaa7be7-0a06-11f0-aa07-a0294223b12a', 'ejemplo@gmail.com', 1, 'prueba5', 'a', '1', 'ejemplo@gmail.com', '52', '1029384756', 3),
('20c232ef-0482-11f0-843f-10f60a355c40', 'juanlópez39', 1, 'Juan', 'López', 'Gómez', 'manuel.ml1245@gmail.com', '+052', '8688240731', 3),
('20c24205-0482-11f0-843f-10f60a355c40', 'maríapérez76', 1, 'María', 'Pérez', 'García', 'maríapérez76@example.com', '+052', '7339866096', 3),
('20c242c0-0482-11f0-843f-10f60a355c40', 'carlosrodríguez58', 1, 'Carlos', 'Rodríguez', 'Torres', 'carlosrodríguez58@example.com', '+052', '1232866055', 3),
('20c24307-0482-11f0-843f-10f60a355c40', 'lauragómez50', 1, 'Laura', 'Gómez', 'Rodríguez', 'lauragómez50@example.com', '+052', '9443372597', 3),
('20c24341-0482-11f0-843f-10f60a355c40', 'pedrofernández59', 1, 'Pedro', 'Fernández', 'Gómez', 'pedrofernández59@example.com', '+052', '5382994090', 3),
('20c24378-0482-11f0-843f-10f60a355c40', 'anamartínez97', 1, 'Ana', 'Martínez', 'Gómez', 'anamartínez97@example.com', '+052', '6480681493', 3),
('20c243ad-0482-11f0-843f-10f60a355c40', 'luisramírez75', 1, 'Luis', 'Ramírez', 'Rodríguez', 'luisramírez75@example.com', '+052', '6932138503', 3),
('20c243df-0482-11f0-843f-10f60a355c40', 'sofíaramírez88', 1, 'Sofía', 'Ramírez', 'García', 'sofíaramírez88@example.com', '+052', '2235029155', 3),
('20c2441d-0482-11f0-843f-10f60a355c40', 'miguelramírez66', 1, 'Miguel', 'Ramírez', 'Rodríguez', 'miguelramírez66@example.com', '+052', '9476762401', 3),
('20c244b7-0482-11f0-843f-10f60a355c40', 'elenagarcía10', 1, 'Elena', 'García', 'Pérez', 'elenagarcía10@example.com', '+052', '8679718329', 3),
('20c244eb-0482-11f0-843f-10f60a355c40', 'javierfernández98', 1, 'Javier', 'Fernández', 'Ramírez', 'javierfernández98@example.com', '+052', '7912683343', 3),
('20c2451f-0482-11f0-843f-10f60a355c40', 'lucíaramírez83', 1, 'Lucía', 'Ramírez', 'Fernández', 'lucíaramírez83@example.com', '+052', '1289913763', 3),
('20c24a4f-0482-11f0-843f-10f60a355c40', 'fernandotorres81', 1, 'Fernando', 'Torres', 'García', 'fernandotorres81@example.com', '+052', '4468826244', 3),
('20c24a81-0482-11f0-843f-10f60a355c40', 'paulalópez49', 1, 'Paula', 'López', 'García', 'paulalópez49@example.com', '+052', '8590871299', 3),
('20c24ab3-0482-11f0-843f-10f60a355c40', 'ricardogarcía68', 1, 'Ricardo', 'García', 'Sánchez', 'ricardogarcía68@example.com', '+052', '2826387132', 3),
('20c24ae8-0482-11f0-843f-10f60a355c40', 'gabrielagómez9', 1, 'Gabriela', 'Gómez', 'Pérez', 'gabrielagómez9@example.com', '+052', '7528096880', 3),
('20c24b19-0482-11f0-843f-10f60a355c40', 'manuelramírez62', 1, 'Manuel', 'Ramírez', 'Pérez', 'manuelramírez62@example.com', '+052', '7483075221', 3),
('20c24b4f-0482-11f0-843f-10f60a355c40', 'valeriagómez68', 1, 'Valeria', 'Gómez', 'Pérez', 'valeriagómez68@example.com', '+052', '2076085744', 3),
('20c24b80-0482-11f0-843f-10f60a355c40', 'raúlgarcía25', 1, 'Raúl', 'García', 'Martínez', 'raúlgarcía25@example.com', '+052', '8917364420', 3),
('20c24c19-0482-11f0-843f-10f60a355c40', 'isabelfernández54', 1, 'Isabel', 'Fernández', 'Gómez', 'isabelfernández54@example.com', '+052', '3622108394', 3),
('20c24c8c-0482-11f0-843f-10f60a355c40', 'carmensanchez43', 1, 'Carmen', 'Sánchez', 'Gutiérrez', 'manuel.ml1245@gmail.com', '+052', '5551234567', 2),
('20c27f60-0482-11f0-843f-10f60a355c40', 'robertomendez78', 1, 'Roberto', 'Méndez', 'Jiménez', 'robertomendez78@example.com', '+052', '5552345678', 2),
('20c28023-0482-11f0-843f-10f60a355c40', 'alexisruiz67', 1, 'Alexis', 'Ruiz', 'Vázquez', 'alexisruiz67@example.com', '+052', '5553456789', 2),
('20c280a4-0482-11f0-843f-10f60a355c40', 'patriciaortiz22', 1, 'Patricia', 'Ortiz', 'Morales', 'patriciaortiz22@example.com', '+052', '5554567890', 2),
('20c2811f-0482-11f0-843f-10f60a355c40', 'eduardocastro91', 1, 'Eduardo', 'Castro', 'Ríos', 'eduardocastro91@example.com', '+052', '5555678901', 2),
('20c281a3-0482-11f0-843f-10f60a355c40', 'marianafuentes36', 1, 'Mariana', 'Fuentes', 'Téllez', 'marianafuentes36@example.com', '+052', '5556789012', 1),
('20c2820f-0482-11f0-843f-10f60a355c40', 'danielbustamante47', 1, 'Daniel', 'Bustamante', 'López', 'danielbustamante47@example.com', '+052', '5557890123', 1),
('20c28331-0482-11f0-843f-10f60a355c40', 'gloriaescobar63', 1, 'Gloria', 'Escobar', 'Miranda', 'gloriaescobar63@example.com', '+052', '5558901234', 1),
('20c28393-0482-11f0-843f-10f60a355c40', 'hectorcardenas19', 1, 'Héctor', 'Cárdenas', 'Reyes', 'hectorcardenas19@example.com', '+052', '5559012345', 1),
('20ca0765-0a75-11f0-aa07-a0294223b12a', '', 1, '', '', '', '', '', '', 3),
('26cccd94-0a75-11f0-aa07-a0294223b12a', 'prueba13', 1, 'prueba13', '1', '1', 'prueba13', '1', '1', 3),
('323dc1d4-0acf-11f0-aa07-a0294223b12a', '', 1, '', '', '', '', '', '', 3),
('3c7cb413-0b79-11f0-a231-047c163ab16f', 'javierhc@gmail.com', 1, 'Javier', 'Hernandez', 'Cortes', 'javierhc@gmail.com', '52', '4429573854', 3),
('3de8ae59-0a09-11f0-aa07-a0294223b12a', 'prueba14', 1, 'prueba14', '1', '1', 'prueba14', '1', '1', 3),
('3e3e09b3-0a06-11f0-aa07-a0294223b12a', '1', 1, 'prueba6', '1', '1', '1', '1', '1', 3),
('437e4a70-0a66-11f0-aa07-a0294223b12a', 'prueba8', 1, 'prueba8', '1', '1', 'prueba8', '1', '1', 3),
('46228f42-0a5e-11f0-aa07-a0294223b12a', 'ejemplo@gmail.com', 1, 'prueba', 'a', '1', 'ejemplo@gmail.com', '52', '1029384756', 3),
('518e196f-0a05-11f0-aa07-a0294223b12a', 'ejemplo@gmail.com', 1, 'prueba3', 'a', '1', 'ejemplo@gmail.com', '52', '1029384756', 3),
('55099067-0a68-11f0-aa07-a0294223b12a', 'prueba12', 1, 'prueba12', '1', '1', 'prueba12', '1', '1', 3),
('59e5fd18-0a08-11f0-aa07-a0294223b12a', 'prueba9', 1, 'prueba9', '1', '1', 'prueba9', '1', '1', 3),
('5a7a84e2-0a06-11f0-aa07-a0294223b12a', '1', 1, 'prueba7', '1', '1', '1', '1', '1', 3),
('5ca615ab-14a4-11f0-a774-10f60a355c40', 'ferdivaldezg@gmail.com', 1, 'Fernanda', 'Valdez', 'Guillén', 'ferdivaldezg@gmail.com', '52', '7329291011', 3),
('5f74db14-0a64-11f0-aa07-a0294223b12a', 'prueba7', 1, 'prueba7', '1', '1', 'prueba7', '1', '1', 3),
('695d82df-14a8-11f0-a774-10f60a355c40', 'juanito@gmail.com', 1, 'Juan', 'Perez', 'Gonzáles ', 'juanito@gmail.com', '+052', '4424454324', 2),
('69a7b366-0a06-11f0-aa07-a0294223b12a', '1312323121', 1, 'prueba7', '1', '1', '1312323121', '1', '1', 3),
('6dafaa48-0f7c-11f0-aede-a0294223b12a', 'juanpp@gmail.com', 1, 'Juan', 'Perez', 'Perez', 'juanpp@gmail.com', '52', '1234567890', 3),
('6ee37c28-0ba6-11f0-a231-047c163ab16f', 'rommelph@gmail.com', 1, 'Rommel', 'Pacheco', 'Hernández', 'rommelph@gmail.com', '52', '4421569563', 3),
('76ad4e10-0a66-11f0-aa07-a0294223b12a', 'prueba9', 1, 'prueba9', '1', '1', 'prueba9', '1', '1', 3),
('7b601ee2-0a67-11f0-aa07-a0294223b12a', 'prueba10', 1, 'prueba10', '1', '1', 'prueba10', '1', '1', 3),
('803571ea-0a08-11f0-aa07-a0294223b12a', 'prueba10', 1, 'prueba10', '1', '1', 'prueba10', '1', '1', 3),
('881fe87c-0a66-11f0-aa07-a0294223b12a', 'prueba10', 1, 'prueba10', '1', '1', 'prueba10', '1', '1', 3),
('8c38333a-0a06-11f0-aa07-a0294223b12a', 'confio', 1, 'estaeslabuena', '1', '1', 'confio', '1', '1', 3),
('91b342de-14a8-11f0-a774-10f60a355c40', 'lili@gmail.com', 1, 'Liliana', 'Valdovinos', 'dksjdks', 'lili@gmail.com', '+052', '2231234543', 1),
('9c865a12-0a67-11f0-aa07-a0294223b12a', 'prueba11', 1, 'prueba11', '1', '1', 'prueba11', '1', '1', 3),
('9ed29b33-0a07-11f0-aa07-a0294223b12a', 'asdfasdgasf', 1, 'dashdasdsad', 'dasdad', 'asdasdas', 'asdfasdgasf', '2', '1', 3),
('b081cf46-0a08-11f0-aa07-a0294223b12a', 'prueba11', 1, 'prueba11', '1', '1', 'prueba11', '1', '1', 3),
('b19b03d3-0b90-11f0-a231-047c163ab16f', 'dalilafm@gmail.com', 1, 'Dalila', 'Fonseca', 'Maya', 'dalilafm@gmail.com', '52', '4421748563', 3),
('b1f65073-0b75-11f0-a231-047c163ab16f', 'jesusgs@gmail.com', 1, 'Jesús', 'Guimenez', 'Sanchez', 'jesusgs@gmail.com', '52', '4421485746', 3),
('b55ced28-0a05-11f0-aa07-a0294223b12a', 'prueba@gmail.com', 1, 'Prueba4', 'a', '1', 'prueba@gmail.com', '52', '1029384756', 3),
('b5bcf41b-0a65-11f0-aa07-a0294223b12a', 'prueba3', 1, 'prueba3', '1', '1', 'prueba3', '1', '1', 3),
('bb89add9-0a08-11f0-aa07-a0294223b12a', 'prueba11', 1, 'prueba11', '1', '1', 'prueba11', '1', '1', 3),
('beeb1379-0a08-11f0-aa07-a0294223b12a', 'prueba12', 1, 'prueba12', '1', '1', 'prueba12', '1', '1', 3),
('c1ab664c-0a06-11f0-aa07-a0294223b12a', 'Por Favor', 1, 'Ahora', 'Sí', 'Ya', 'Por Favor', '11', '11', 3),
('c209d272-0a60-11f0-aa07-a0294223b12a', '1', 1, 'prueba1', '1', '1', '1', '1', '1', 3),
('cd9004cb-0b96-11f0-a231-047c163ab16f', 'angelosi@gmail.com', 1, 'Angelo', 'Segura', 'Ibarra', 'angelosi@gmail.com', '52', '4421843764', 3),
('cd95bda1-0b76-11f0-a231-047c163ab16f', 'guillermomj@gmail.com', 1, 'Guillermo', 'Mendez', 'Juarez', 'guillermomj@gmail.com', '52', '4421754686', 3),
('d0ee999d-0a04-11f0-aa07-a0294223b12a', 'ejemplo@gmail.com', 1, 'prueba', 'a', '1', 'ejemplo@gmail.com', '52', '1029384756', 3),
('d27e85c1-0b91-11f0-a231-047c163ab16f', 'fds', 1, 'fsdf', 'sdfsd', 'fsdf', 'fds', '', '', 3),
('d4865565-0a05-11f0-aa07-a0294223b12a', 'ejemplo@gmail.com', 1, 'prueba5', 'a', '1', 'ejemplo@gmail.com', '52', '1029384756', 3),
('d5854855-14a4-11f0-a774-10f60a355c40', 'ferdivaldezg@gmail.com', 1, 'Fernanda', 'Valdez', 'Guillén', 'ferdivaldezg@gmail.com', '52', '73089283', 3),
('d657f725-14a4-11f0-a774-10f60a355c40', 'ferdivaldezg@gmail.com', 1, 'Fernanda', 'Valdez', 'Guillén', 'ferdivaldezg@gmail.com', '52', '73089283', 3),
('f246aa4f-0b91-11f0-a231-047c163ab16f', '', 1, '', '', '', '', '', '', 3),
('f292789b-0a04-11f0-aa07-a0294223b12a', 'ejemplo@gmail.com', 1, 'prueba', 'a', '1', 'ejemplo@gmail.com', '52', '1029384756', 3),
('f3adb74f-0a06-11f0-aa07-a0294223b12a', 'Por Favor1', 1, 'Ahora1', 'Sí', 'Ya', 'Por Favor1', '11', '11', 3),
('f5694194-0b74-11f0-a231-047c163ab16f', 'jorgero@gmail.com', 1, 'Jorge', 'Ramírez', 'Ochoa', 'jorgero@gmail.com', '52', '4421567453', 3),
('f9f53634-0b92-11f0-a231-047c163ab16f', '', 1, '', '', '', '', '', '', 3),
('fc7ac20e-0a08-11f0-aa07-a0294223b12a', 'prueba13', 1, 'prueba13', '1', '1', 'prueba13', '1', '1', 3),
('fd0946f6-0b91-11f0-a231-047c163ab16f', '', 1, '', '', '', '', '', '', 3),
('feb4e0ac-0b91-11f0-a231-047c163ab16f', '', 1, '', '', '', '', '', '', 3),
('ffcaf075-14a4-11f0-a774-10f60a355c40', 'prueba120@gmail.com', 1, 'prueba', '120', '', 'prueba120@gmail.com', '52', '3130103131', 3);


-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vistapruebasaspirantes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vistapruebasaspirantes` (
`nombre` varchar(100)
,`nombreEstatus` varchar(20)
,`descripcion` varchar(255)
,`fechaLimite` date
,`duracion` int(11)
,`idAspirante` varchar(36)
,`nombreGrupo` varchar(100)
);


-- --------------------------------------------------------

--
-- Estructura para la vista `vistapruebasaspirantes`
--
DROP TABLE IF EXISTS `vistapruebasaspirantes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vistapruebasaspirantes`  AS SELECT `p`.`nombre` AS `nombre`, `e`.`nombreEstatus` AS `nombreEstatus`, `p`.`descripcion` AS `descripcion`, `agp`.`fechaLimite` AS `fechaLimite`, `p`.`duracion` AS `duracion`, `a`.`idAspirante` AS `idAspirante`, `g`.`nombreGrupo` AS `nombreGrupo` FROM ((((`pruebas` `p` join `aspirantesgrupospruebas` `agp` on(`p`.`idPrueba` = `agp`.`idPrueba`)) join `estatusprueba` `e` on(`agp`.`idEstatus` = `e`.`idEstatus`)) join `aspirantes` `a` on(`agp`.`idAspirante` = `a`.`idAspirante`)) join `grupos` `g` on(`agp`.`idGrupo` = `g`.`idGrupo`)) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `areasotis`
--
ALTER TABLE `areasotis`
  ADD PRIMARY KEY (`idAreaOtis`);

--
-- Indices de la tabla `aspirantes`
--
ALTER TABLE `aspirantes`
  ADD PRIMARY KEY (`idAspirante`),
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `idPais` (`idPais`),
  ADD KEY `idEstado` (`idEstado`);

--
-- Indices de la tabla `aspirantesgrupospruebas`
--
ALTER TABLE `aspirantesgrupospruebas`
  ADD PRIMARY KEY (`idGrupo`,`idPrueba`,`idAspirante`),
  ADD KEY `idPrueba` (`idPrueba`),
  ADD KEY `idAspirante` (`idAspirante`),
  ADD KEY `idEstatus` (`idEstatus`);

--
-- Indices de la tabla `aspirantespreguntasformatoentrevista`
--
ALTER TABLE `aspirantespreguntasformatoentrevista`
  ADD PRIMARY KEY (`idAspirante`,`idPreguntaFormatoEntrevista`),
  ADD KEY `idPreguntaFormatoEntrevista` (`idPreguntaFormatoEntrevista`);

--
-- Indices de la tabla `colores`
--
ALTER TABLE `colores`
  ADD PRIMARY KEY (`idColor`);

--
-- Indices de la tabla `datospersonales`
--
ALTER TABLE `datospersonales`
  ADD PRIMARY KEY (`idDatosPersonales`),
  ADD UNIQUE KEY `idGrupo` (`idGrupo`,`idPrueba`,`idAspirante`),
  ADD KEY `idPrueba` (`idPrueba`),
  ADD KEY `idAspirante` (`idAspirante`);

--
-- Indices de la tabla `estadocivil`
--
ALTER TABLE `estadocivil`
  ADD PRIMARY KEY (`idEstadoCivil`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`idEstado`);

--
-- Indices de la tabla `estatusprueba`
--
ALTER TABLE `estatusprueba`
  ADD PRIMARY KEY (`idEstatus`);

--
-- Indices de la tabla `familiares`
--
ALTER TABLE `familiares`
  ADD PRIMARY KEY (`idFamiliar`),
  ADD KEY `idGenero` (`idGenero`),
  ADD KEY `idEstadoCivil` (`idEstadoCivil`),
  ADD KEY `idAspirante` (`idAspirante`),
  ADD KEY `hijoDe` (`hijoDe`);

--
-- Indices de la tabla `generos`
--
ALTER TABLE `generos`
  ADD PRIMARY KEY (`idGenero`);

--
-- Indices de la tabla `grupos`
--
ALTER TABLE `grupos`
  ADD PRIMARY KEY (`idGrupo`),
  ADD KEY `idInstitucion` (`idInstitucion`),
  ADD KEY `idNivelAcademico` (`idNivelAcademico`);

--
-- Indices de la tabla `gruposaspirantes`
--
ALTER TABLE `gruposaspirantes`
  ADD PRIMARY KEY (`idGrupo`,`idAspirante`),
  ADD KEY `idAspirante` (`idAspirante`);

--
-- Indices de la tabla `grupospruebas`
--
ALTER TABLE `grupospruebas`
  ADD PRIMARY KEY (`idGrupo`,`idPrueba`),
  ADD KEY `idPrueba` (`idPrueba`);

--
-- Indices de la tabla `institucion`
--
ALTER TABLE `institucion`
  ADD PRIMARY KEY (`idInstitucion`),
  ADD KEY `idTipoInstitucion` (`idTipoInstitucion`);

--
-- Indices de la tabla `nivelacademico`
--
ALTER TABLE `nivelacademico`
  ADD PRIMARY KEY (`idNivelAcademico`);

--
-- Indices de la tabla `opciones16pf`
--
ALTER TABLE `opciones16pf`
  ADD PRIMARY KEY (`idOpcion16PF`),
  ADD KEY `idPregunta16PF` (`idPregunta16PF`);

--
-- Indices de la tabla `opcioneskostick`
--
ALTER TABLE `opcioneskostick`
  ADD PRIMARY KEY (`idOpcionKostick`),
  ADD KEY `idPreguntaKostick` (`idPreguntaKostick`);

--
-- Indices de la tabla `opcionesotis`
--
ALTER TABLE `opcionesotis`
  ADD PRIMARY KEY (`idOpcionOtis`),
  ADD KEY `idPreguntaOtis` (`idPreguntaOtis`);

--
-- Indices de la tabla `opcionesterman`
--
ALTER TABLE `opcionesterman`
  ADD PRIMARY KEY (`idOpcionTerman`),
  ADD KEY `idPreguntaTerman` (`idPreguntaTerman`);

--
-- Indices de la tabla `otp`
--
ALTER TABLE `otp`
  ADD PRIMARY KEY (`idOTP`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indices de la tabla `paises`
--
ALTER TABLE `paises`
  ADD PRIMARY KEY (`idPais`);

--
-- Indices de la tabla `preguntas16pf`
--
ALTER TABLE `preguntas16pf`
  ADD PRIMARY KEY (`idPregunta16PF`),
  ADD KEY `idPrueba` (`idPrueba`);

--
-- Indices de la tabla `preguntasformatoentrevista`
--
ALTER TABLE `preguntasformatoentrevista`
  ADD PRIMARY KEY (`idPreguntaFormatoEntrevista`);

--
-- Indices de la tabla `preguntashartman`
--
ALTER TABLE `preguntashartman`
  ADD PRIMARY KEY (`idPreguntaHartman`),
  ADD KEY `idPrueba` (`idPrueba`);

-- Indices de la tabla `resultadoshartman`
--
ALTER TABLE `resultadoshartman`
  ADD PRIMARY KEY (`idAspirante`,`idGrupo`),
  ADD KEY `idAspirante` (`idAspirante`),
  ADD KEY `idGrupo` (`idGrupo`);

--
-- Indices de la tabla `preguntaskostick`
--
ALTER TABLE `preguntaskostick`
  ADD PRIMARY KEY (`idPreguntaKostick`),
  ADD KEY `idPrueba` (`idPrueba`);

--
-- Indices de la tabla `preguntasotis`
--
ALTER TABLE `preguntasotis`
  ADD PRIMARY KEY (`idPreguntaOtis`),
  ADD KEY `idPrueba` (`idPrueba`),
  ADD KEY `fk_PO_A` (`idAreaOtis`);

--
-- Indices de la tabla `preguntasterman`
--
ALTER TABLE `preguntasterman`
  ADD PRIMARY KEY (`idPreguntaTerman`),
  ADD KEY `idSerieTerman` (`idSerieTerman`);

--
-- Indices de la tabla `privilegios`
--
ALTER TABLE `privilegios`
  ADD PRIMARY KEY (`idPrivilegio`);

--
-- Indices de la tabla `pruebas`
--
ALTER TABLE `pruebas`
  ADD PRIMARY KEY (`idPrueba`);

--
-- Indices de la tabla `respuestaotisaspirante`
--
ALTER TABLE `respuestaotisaspirante`
  ADD PRIMARY KEY (`idRespuestaOtis`),
  ADD KEY `idAspirante` (`idAspirante`),
  ADD KEY `idPreguntaOtis` (`idPreguntaOtis`),
  ADD KEY `idOpcionOtis` (`idOpcionOtis`),
  ADD KEY `idPrueba` (`idPrueba`),
  ADD KEY `idGrupo` (`idGrupo`);

--
-- Indices de la tabla `responde16pf`
--
ALTER TABLE `responde16pf`
  ADD PRIMARY KEY (`idRespuesta16PF`),
  ADD KEY `idAspirante` (`idAspirante`),
  ADD KEY `idGrupo` (`idGrupo`),
  ADD KEY `idPregunta16PF` (`idPregunta16PF`),
  ADD KEY `idOpcion16PF` (`idOpcion16PF`),
  ADD KEY `idPrueba` (`idPrueba`);

--
-- Indices de la tabla `respuestashartmanaspirante`
--
ALTER TABLE `respuestashartman`
  ADD PRIMARY KEY (`idRespuestaHartman`),
  ADD KEY `idAspirante` (`idAspirante`),
  ADD KEY `idGrupo` (`idGrupo`),
  ADD KEY `idPreguntaHartman` (`idPreguntaHartman`),
  ADD KEY `idPrueba` (`idPrueba`);

--
-- Indices de la tabla `respondekostick`
--
ALTER TABLE `respondekostick`
  ADD PRIMARY KEY (`idRespuestaKostick`),
  ADD KEY `idAspirante` (`idAspirante`),
  ADD KEY `idGrupo` (`idGrupo`),
  ADD KEY `idPreguntaKostick` (`idPreguntaKostick`),
  ADD KEY `idOpcionKostick` (`idOpcionKostick`),
  ADD KEY `idPrueba` (`idPrueba`);

--
-- Indices de la tabla `respuestasterman`
--
ALTER TABLE `respuestasterman`
  ADD PRIMARY KEY (`idRespuestaTerman`),
  ADD KEY `idAspirante` (`idAspirante`),
  ADD KEY `idGrupo` (`idGrupo`),
  ADD KEY `idPreguntaTerman` (`idPreguntaTerman`),
  ADD KEY `idPrueba` (`idPrueba`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`idRol`);

--
-- Indices de la tabla `rolesprivilegios`
--
ALTER TABLE `rolesprivilegios`
  ADD PRIMARY KEY (`idRol`,`idPrivilegio`),
  ADD KEY `idPrivilegio` (`idPrivilegio`);

--
-- Indices de la tabla `seleccionescolores`
--
ALTER TABLE `seleccionescolores`
  ADD PRIMARY KEY (`idSeleccionColores`),
  ADD KEY `idPrueba` (`idPrueba`),
  ADD KEY `idAspirante` (`idAspirante`),
  ADD KEY `idColor` (`idColor`),
  ADD KEY `idGrupo` (`idGrupo`);

--
-- Indices de la tabla `seriesterman`
--
ALTER TABLE `seriesterman`
  ADD PRIMARY KEY (`idSerieTerman`),
  ADD KEY `idPrueba` (`idPrueba`);

--
-- Indices de la tabla `tipoinstitucion`
--
ALTER TABLE `tipoinstitucion`
  ADD PRIMARY KEY (`idTipoInstitucion`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `idRol` (`idRol`),
  ADD KEY `usuario` (`usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `areasotis`
--
ALTER TABLE `areasotis`
  MODIFY `idAreaOtis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `colores`
--
ALTER TABLE `colores`
  MODIFY `idColor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `estadocivil`
--
ALTER TABLE `estadocivil`
  MODIFY `idEstadoCivil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `idEstado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `estatusprueba`
--
ALTER TABLE `estatusprueba`
  MODIFY `idEstatus` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `generos`
--
ALTER TABLE `generos`
  MODIFY `idGenero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `nivelacademico`
--
ALTER TABLE `nivelacademico`
  MODIFY `idNivelAcademico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `otp`
--
ALTER TABLE `otp`
  MODIFY `idOTP` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de la tabla `paises`
--
ALTER TABLE `paises`
  MODIFY `idPais` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `preguntasformatoentrevista`
--
ALTER TABLE `preguntasformatoentrevista`
  MODIFY `idPreguntaFormatoEntrevista` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;

--
-- AUTO_INCREMENT de la tabla `privilegios`
--
ALTER TABLE `privilegios`
  MODIFY `idPrivilegio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `pruebas`
--
ALTER TABLE `pruebas`
  MODIFY `idPrueba` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `idRol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `seriesterman`
--
ALTER TABLE `seriesterman`
  MODIFY `idSerieTerman` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipoinstitucion`
--
ALTER TABLE `tipoinstitucion`
  MODIFY `idTipoInstitucion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `aspirantes`
--
ALTER TABLE `aspirantes`
  ADD CONSTRAINT `aspirantes_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`),
  ADD CONSTRAINT `aspirantes_ibfk_2` FOREIGN KEY (`idPais`) REFERENCES `paises` (`idPais`),
  ADD CONSTRAINT `aspirantes_ibfk_3` FOREIGN KEY (`idEstado`) REFERENCES `estados` (`idEstado`);

--
-- Filtros para la tabla `aspirantesgrupospruebas`
--
ALTER TABLE `aspirantesgrupospruebas`
  ADD CONSTRAINT `aspirantesgrupospruebas_ibfk_1` FOREIGN KEY (`idGrupo`) REFERENCES `grupos` (`idGrupo`),
  ADD CONSTRAINT `aspirantesgrupospruebas_ibfk_2` FOREIGN KEY (`idPrueba`) REFERENCES `pruebas` (`idPrueba`),
  ADD CONSTRAINT `aspirantesgrupospruebas_ibfk_3` FOREIGN KEY (`idAspirante`) REFERENCES `aspirantes` (`idAspirante`),
  ADD CONSTRAINT `aspirantesgrupospruebas_ibfk_4` FOREIGN KEY (`idEstatus`) REFERENCES `estatusprueba` (`idEstatus`);

--
-- Filtros para la tabla `aspirantespreguntasformatoentrevista`
--
ALTER TABLE `aspirantespreguntasformatoentrevista`
  ADD CONSTRAINT `aspirantespreguntasformatoentrevista_ibfk_1` FOREIGN KEY (`idAspirante`) REFERENCES `aspirantes` (`idAspirante`),
  ADD CONSTRAINT `aspirantespreguntasformatoentrevista_ibfk_2` FOREIGN KEY (`idPreguntaFormatoEntrevista`) REFERENCES `preguntasformatoentrevista` (`idPreguntaFormatoEntrevista`);

--
-- Filtros para la tabla `datospersonales`
--
ALTER TABLE `datospersonales`
  ADD CONSTRAINT `datospersonales_ibfk_1` FOREIGN KEY (`idGrupo`) REFERENCES `grupos` (`idGrupo`),
  ADD CONSTRAINT `datospersonales_ibfk_2` FOREIGN KEY (`idPrueba`) REFERENCES `pruebas` (`idPrueba`),
  ADD CONSTRAINT `datospersonales_ibfk_3` FOREIGN KEY (`idAspirante`) REFERENCES `aspirantes` (`idAspirante`);

--
-- Filtros para la tabla `familiares`
--
ALTER TABLE `familiares`
  ADD CONSTRAINT `familiares_ibfk_1` FOREIGN KEY (`idGenero`) REFERENCES `generos` (`idGenero`),
  ADD CONSTRAINT `familiares_ibfk_2` FOREIGN KEY (`idEstadoCivil`) REFERENCES `estadocivil` (`idEstadoCivil`),
  ADD CONSTRAINT `familiares_ibfk_3` FOREIGN KEY (`idAspirante`) REFERENCES `aspirantes` (`idAspirante`),
  ADD CONSTRAINT `familiares_ibfk_4` FOREIGN KEY (`hijoDe`) REFERENCES `familiares` (`idFamiliar`);

--
-- Filtros para la tabla `grupos`
--
ALTER TABLE `grupos`
  ADD CONSTRAINT `grupos_ibfk_1` FOREIGN KEY (`idInstitucion`) REFERENCES `institucion` (`idInstitucion`),
  ADD CONSTRAINT `grupos_ibfk_2` FOREIGN KEY (`idNivelAcademico`) REFERENCES `nivelacademico` (`idNivelAcademico`);

--
-- Filtros para la tabla `gruposaspirantes`
--
ALTER TABLE `gruposaspirantes`
  ADD CONSTRAINT `gruposaspirantes_ibfk_1` FOREIGN KEY (`idGrupo`) REFERENCES `grupos` (`idGrupo`),
  ADD CONSTRAINT `gruposaspirantes_ibfk_2` FOREIGN KEY (`idAspirante`) REFERENCES `aspirantes` (`idAspirante`);

--
-- Filtros para la tabla `grupospruebas`
--
ALTER TABLE `grupospruebas`
  ADD CONSTRAINT `grupospruebas_ibfk_1` FOREIGN KEY (`idGrupo`) REFERENCES `grupos` (`idGrupo`),
  ADD CONSTRAINT `grupospruebas_ibfk_2` FOREIGN KEY (`idPrueba`) REFERENCES `pruebas` (`idPrueba`);

--
-- Filtros para la tabla `institucion`
--
ALTER TABLE `institucion`
  ADD CONSTRAINT `institucion_ibfk_1` FOREIGN KEY (`idTipoInstitucion`) REFERENCES `tipoinstitucion` (`idTipoInstitucion`);

--
-- Filtros para la tabla `opciones16pf`
--
ALTER TABLE `opciones16pf`
  ADD CONSTRAINT `opciones16pf_ibfk_1` FOREIGN KEY (`idPregunta16PF`) REFERENCES `preguntas16pf` (`idPregunta16PF`);

--
-- Filtros para la tabla `opcioneskostick`
--
ALTER TABLE `opcioneskostick`
  ADD CONSTRAINT `opcioneskostick_ibfk_1` FOREIGN KEY (`idPreguntaKostick`) REFERENCES `preguntaskostick` (`idPreguntaKostick`);

--
-- Filtros para la tabla `opcionesotis`
--
ALTER TABLE `opcionesotis`
  ADD CONSTRAINT `opcionesotis_ibfk_1` FOREIGN KEY (`idPreguntaOtis`) REFERENCES `preguntasotis` (`idPreguntaOtis`);

--
-- Filtros para la tabla `opcionesterman`
--
ALTER TABLE `opcionesterman`
  ADD CONSTRAINT `opcionesterman_ibfk_1` FOREIGN KEY (`idPreguntaTerman`) REFERENCES `preguntasterman` (`idPreguntaTerman`);

--
-- Filtros para la tabla `otp`
--
ALTER TABLE `otp`
  ADD CONSTRAINT `otp_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`);

ALTER TABLE OTP MODIFY idOTP INT AUTO_INCREMENT PRIMARY KEY;

--
-- Filtros para la tabla `preguntas16pf`
--
ALTER TABLE `preguntas16pf`
  ADD CONSTRAINT `preguntas16pf_ibfk_1` FOREIGN KEY (`idPrueba`) REFERENCES `pruebas` (`idPrueba`);

--
-- Filtros para la tabla `preguntashartman`
--
ALTER TABLE `preguntashartman`
  ADD CONSTRAINT `preguntashartman_ibfk_1` FOREIGN KEY (`idPrueba`) REFERENCES `pruebas` (`idPrueba`);

--
-- Filtros para la tabla `preguntaskostick`
--
ALTER TABLE `preguntaskostick`
  ADD CONSTRAINT `preguntaskostick_ibfk_1` FOREIGN KEY (`idPrueba`) REFERENCES `pruebas` (`idPrueba`);

--
-- Filtros para la tabla `preguntasotis`
--
ALTER TABLE `preguntasotis`
  ADD CONSTRAINT `fk_PO_A` FOREIGN KEY (`idAreaOtis`) REFERENCES `areasotis` (`idAreaOtis`),
  ADD CONSTRAINT `preguntasotis_ibfk_1` FOREIGN KEY (`idPrueba`) REFERENCES `pruebas` (`idPrueba`);

--
-- Filtros para la tabla `preguntasterman`
--
ALTER TABLE `preguntasterman`
  ADD CONSTRAINT `preguntasterman_ibfk_1` FOREIGN KEY (`idSerieTerman`) REFERENCES `seriesterman` (`idSerieTerman`);

--
-- Filtros para la tabla `respuestaotisaspirante`
--
ALTER TABLE `respuestaotisaspirante`
  ADD CONSTRAINT `respuestaotisaspirante_ibfk_1` FOREIGN KEY (`idAspirante`) REFERENCES `aspirantes` (`idAspirante`),
  ADD CONSTRAINT `respuestaotisaspirante_ibfk_2` FOREIGN KEY (`idPreguntaOtis`) REFERENCES `preguntasotis` (`idPreguntaOtis`),
  ADD CONSTRAINT `respuestaotisaspirante_ibfk_3` FOREIGN KEY (`idOpcionOtis`) REFERENCES `opcionesotis` (`idOpcionOtis`),
  ADD CONSTRAINT `respuestaotisaspirante_ibfk_4` FOREIGN KEY (`idPrueba`) REFERENCES `pruebas` (`idPrueba`),
  ADD CONSTRAINT `respuestaotisaspirante_ibfk_5` FOREIGN KEY (`idGrupo`) REFERENCES `grupos` (`idGrupo`);

--
-- Filtros para la tabla `respuestas16pfaspirante`
--
ALTER TABLE `responde16pf`
  ADD CONSTRAINT `responde16pf_ibfk_1` FOREIGN KEY (`idAspirante`) REFERENCES `aspirantes` (`idAspirante`),
  ADD CONSTRAINT `responde16pf_ibfk_2` FOREIGN KEY (`idGrupo`) REFERENCES `grupos` (`idGrupo`),
  ADD CONSTRAINT `responde16pf_ibfk_3` FOREIGN KEY (`idPregunta16PF`) REFERENCES `preguntas16pf` (`idPregunta16PF`),
  ADD CONSTRAINT `responde16pf_ibfk_4` FOREIGN KEY (`idOpcion16PF`) REFERENCES `opciones16pf` (`idOpcion16PF`),
  ADD CONSTRAINT `responde16pf_ibfk_5` FOREIGN KEY (`idPrueba`) REFERENCES `pruebas` (`idPrueba`);

--
-- Filtros para la tabla `respuestashartmanaspirante`
--
ALTER TABLE `respuestashartman`
  ADD CONSTRAINT `respuestashartman_ibfk_1` FOREIGN KEY (`idAspirante`) REFERENCES `aspirantes` (`idAspirante`),
  ADD CONSTRAINT `respuestashartman_ibfk_2` FOREIGN KEY (`idGrupo`) REFERENCES `grupos` (`idGrupo`),
  ADD CONSTRAINT `respuestashartman_ibfk_3` FOREIGN KEY (`idPreguntaHartman`) REFERENCES `preguntashartman` (`idPreguntaHartman`),
  ADD CONSTRAINT `respuestashartman_ibfk_4` FOREIGN KEY (`idPrueba`) REFERENCES `pruebas` (`idPrueba`);

--
-- Filtros para la tabla `respuestaskostickaspirante`
--
ALTER TABLE `respondekostick`
  ADD CONSTRAINT `respondekostick_ibfk_1` FOREIGN KEY (`idAspirante`) REFERENCES `aspirantes` (`idAspirante`),
  ADD CONSTRAINT `respondekostick_ibfk_2` FOREIGN KEY (`idGrupo`) REFERENCES `grupos` (`idGrupo`),
  ADD CONSTRAINT `respondekostick_ibfk_3` FOREIGN KEY (`idPreguntaKostick`) REFERENCES `preguntaskostick` (`idPreguntaKostick`),
  ADD CONSTRAINT `respondekostick_ibfk_4` FOREIGN KEY (`idOpcionKostick`) REFERENCES `opcioneskostick` (`idOpcionKostick`),
  ADD CONSTRAINT `respondekostick_ibfk_5` FOREIGN KEY (`idPrueba`) REFERENCES `pruebas` (`idPrueba`);

--
-- Filtros para la tabla `respuestastermanaspirante`
--
ALTER TABLE `respuestasterman`
  ADD CONSTRAINT `respuestasterman_ibfk_1` FOREIGN KEY (`idAspirante`) REFERENCES `aspirantes` (`idAspirante`),
  ADD CONSTRAINT `respuestasterman_ibfk_2` FOREIGN KEY (`idGrupo`) REFERENCES `grupos` (`idGrupo`),
  ADD CONSTRAINT `respuestasterman_ibfk_3` FOREIGN KEY (`idPreguntaTerman`) REFERENCES `preguntasterman` (`idPreguntaTerman`),
  ADD CONSTRAINT `respuestasterman_ibfk_4` FOREIGN KEY (`idPrueba`) REFERENCES `pruebas` (`idPrueba`);

--
-- Filtros para la tabla `rolesprivilegios`
--
ALTER TABLE `rolesprivilegios`
  ADD CONSTRAINT `rolesprivilegios_ibfk_1` FOREIGN KEY (`idRol`) REFERENCES `roles` (`idRol`),
  ADD CONSTRAINT `rolesprivilegios_ibfk_2` FOREIGN KEY (`idPrivilegio`) REFERENCES `privilegios` (`idPrivilegio`);

--
-- Filtros para la tabla `seleccionescolores`
--
ALTER TABLE `seleccionescolores`
  ADD CONSTRAINT `seleccionescolores_ibfk_1` FOREIGN KEY (`idPrueba`) REFERENCES `pruebas` (`idPrueba`),
  ADD CONSTRAINT `seleccionescolores_ibfk_2` FOREIGN KEY (`idAspirante`) REFERENCES `aspirantes` (`idAspirante`),
  ADD CONSTRAINT `seleccionescolores_ibfk_3` FOREIGN KEY (`idColor`) REFERENCES `colores` (`idColor`),
  ADD CONSTRAINT `seleccionescolores_ibfk_4` FOREIGN KEY (`idGrupo`) REFERENCES `grupos` (`idGrupo`);

--
-- Filtros para la tabla `seriesterman`
--
ALTER TABLE `seriesterman`
  ADD CONSTRAINT `seriesterman_ibfk_1` FOREIGN KEY (`idPrueba`) REFERENCES `pruebas` (`idPrueba`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`idRol`) REFERENCES `roles` (`idRol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
