-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 07, 2025 at 06:32 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `psytech2`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegistrarAspiranteEnGrupo` (IN `uUsuario` VARCHAR(50), IN `uNombreUsuario` VARCHAR(50), IN `uApellidoPaterno` VARCHAR(50), IN `uApellidoMaterno` VARCHAR(50), IN `uCorreo` VARCHAR(50), IN `uLada` VARCHAR(4), IN `uNumeroTelefono` VARCHAR(10), IN `uNombreRol` VARCHAR(50), IN `uInstitucionProcedencia` VARCHAR(50), IN `uIdPais` VARCHAR(36), IN `uIdEstado` VARCHAR(36), IN `uIdGrupo` VARCHAR(36))   BEGIN
INSERT INTO usuarios VALUES (uuid(), uUsuario, 1, uNombreUsuario, uApellidoPaterno,
							uApellidoMaterno, uCorreo, uLada, uNumeroTelefono, (
                                                    SELECT idRol 
                                                    FROM roles 
                                                    WHERE nombreRol = uNombreRol)
                            );

INSERT INTO aspirantes VALUES (uuid(), 
                               (SELECT idUsuario 
                                FROM usuarios 
                                WHERE usuario = uUsuario
                               -- LIMIT 1
                               ),
                               uInstitucionProcedencia, uIdPais, uIdEstado, null, null
                              );

INSERT INTO gruposaspirantes VALUES(
    								uIdGrupo,
    							(SELECT idAspirante
                                    FROM aspirantes, usuarios
                                    WHERE aspirantes.idUsuario = usuarios.idUsuario
                                    AND usuarios.usuario = uUsuario
                                    -- LIMIT 1
                                )
									);
                                    END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `areasotis`
--

CREATE TABLE `areasotis` (
  `idAreaOtis` int(11) NOT NULL,
  `nombreAreaOtis` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `areasotis`
--

INSERT INTO `areasotis` (`idAreaOtis`, `nombreAreaOtis`) VALUES
(1, 'Comprensión Verbal'),
(2, 'Lógica del pensamiento'),
(3, 'Comprensión Espacial'),
(4, 'Fluidez Verbal'),
(5, 'Habilidad Numérica');

-- --------------------------------------------------------

--
-- Table structure for table `aspirantes`
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
-- Dumping data for table `aspirantes`
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
('feb54e28-0b91-11f0-a231-047c163ab16f', '20ca0765-0a75-11f0-aa07-a0294223b12a', '', 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `aspirantesgrupospruebas`
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
-- Dumping data for table `aspirantesgrupospruebas`
--

INSERT INTO `aspirantesgrupospruebas` (`idGrupo`, `idPrueba`, `idAspirante`, `idEstatus`, `fechaAsignacion`, `fechaLimite`) VALUES
('1ed87e17-0b79-11f0-a231-047c163ab16f', 6, '3c7d1bd5-0b79-11f0-a231-047c163ab16f', 1, '2025-03-27', '2025-03-29'),
('3768c32d-0485-11f0-843f-10f60a355c40', 5, '20ca725d-0a75-11f0-aa07-a0294223b12a', 1, '2025-03-26', '2025-03-31'),
('3768c32d-0485-11f0-843f-10f60a355c40', 5, '26cd1eed-0a75-11f0-aa07-a0294223b12a', 1, '2025-03-26', '2025-03-31'),
('3768c32d-0485-11f0-843f-10f60a355c40', 5, '5509f944-0a68-11f0-aa07-a0294223b12a', 2, '2025-03-26', '2025-03-31'),
('3768c32d-0485-11f0-843f-10f60a355c40', 5, '9c86af86-0a67-11f0-aa07-a0294223b12a', 2, '2025-03-26', '2025-03-31'),
('3768c32d-0485-11f0-843f-10f60a355c40', 6, '20ca725d-0a75-11f0-aa07-a0294223b12a', 1, '2025-03-26', '2025-03-31'),
('3768c32d-0485-11f0-843f-10f60a355c40', 6, '26cd1eed-0a75-11f0-aa07-a0294223b12a', 1, '2025-03-26', '2025-03-31'),
('3768c32d-0485-11f0-843f-10f60a355c40', 6, '5509f944-0a68-11f0-aa07-a0294223b12a', 2, '2025-03-26', '2025-03-31'),
('3768c32d-0485-11f0-843f-10f60a355c40', 6, '9c86af86-0a67-11f0-aa07-a0294223b12a', 1, '2025-03-26', '2025-03-31'),
('58ddc7eb-0ba6-11f0-a231-047c163ab16f', 5, '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', 2, '2025-03-28', '2025-03-31'),
('58ddc7eb-0ba6-11f0-a231-047c163ab16f', 6, '6ee3dd8b-0ba6-11f0-a231-047c163ab16f', 1, '2025-03-28', '2025-03-31'),
('81d14e2a-0b90-11f0-a231-047c163ab16f', 6, 'b19b45b0-0b90-11f0-a231-047c163ab16f', 1, '2025-03-27', '2025-03-31'),
('aae297d1-0b96-11f0-a231-047c163ab16f', 6, 'cd906319-0b96-11f0-a231-047c163ab16f', 1, '2025-03-27', '2025-04-01'),
('e2906a1c-0b84-11f0-a231-047c163ab16f', 6, '03b07212-0b85-11f0-a231-047c163ab16f', 2, '2025-03-27', '2025-03-29'),
('e2906a1c-0b84-11f0-a231-047c163ab16f', 6, '6db0089e-0f7c-11f0-aede-a0294223b12a', 2, '2025-04-01', '2025-03-29');

-- --------------------------------------------------------

--
-- Table structure for table `aspirantespreguntasformatoentrevista`
--

CREATE TABLE `aspirantespreguntasformatoentrevista` (
  `idAspirante` varchar(36) NOT NULL,
  `idPreguntaFormatoEntrevista` int(11) NOT NULL,
  `respuestaAspirante` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `aspirantespreguntasformatoentrevista`
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
-- Table structure for table `colores`
--

CREATE TABLE `colores` (
  `idColor` int(11) NOT NULL,
  `nombreColor` varchar(50) DEFAULT NULL,
  `numeroColor` int(11) DEFAULT NULL,
  `significado` varchar(50) DEFAULT NULL,
  `hexColor` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `colores`
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
-- Table structure for table `datospersonales`
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
-- Dumping data for table `datospersonales`
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
-- Table structure for table `estadocivil`
--

CREATE TABLE `estadocivil` (
  `idEstadoCivil` int(11) NOT NULL,
  `nombreEstadoCivil` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `estadocivil`
--

INSERT INTO `estadocivil` (`idEstadoCivil`, `nombreEstadoCivil`) VALUES
(1, 'Soltero'),
(2, 'Casado'),
(3, 'Divorciado'),
(4, 'Unión libre'),
(5, 'Viudo');

-- --------------------------------------------------------

--
-- Table structure for table `estados`
--

CREATE TABLE `estados` (
  `idEstado` int(11) NOT NULL,
  `nombreEstado` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `estados`
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
-- Table structure for table `estatusprueba`
--

CREATE TABLE `estatusprueba` (
  `idEstatus` int(11) NOT NULL,
  `nombreEstatus` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `estatusprueba`
--

INSERT INTO `estatusprueba` (`idEstatus`, `nombreEstatus`) VALUES
(1, 'Completada'),
(2, 'Pendiente'),
(3, 'En progreso'),
(4, 'Vencida');

-- --------------------------------------------------------

--
-- Table structure for table `familiares`
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
-- Dumping data for table `familiares`
--

INSERT INTO `familiares` (`idFamiliar`, `idAspirante`, `rolFamiliar`, `nombreFamiliar`, `edadFamiliar`, `idGenero`, `idEstadoCivil`, `hijoDe`, `estadoDeVida`) VALUES
('644d3dbf-0b99-11f0-a231-047c163ab16f', 'cd906319-0b96-11f0-a231-047c163ab16f', 'Abuelo', 'Eduardo Juarez', 2, 2, 1, NULL, 1),
('7d72e8c0-0b99-11f0-a231-047c163ab16f', 'cd906319-0b96-11f0-a231-047c163ab16f', 'Padre', 'José José', 34, 2, 2, '644d3dbf-0b99-11f0-a231-047c163ab16f', 1),
('da58287e-0ad1-11f0-aa07-a0294223b12a', '9c86af86-0a67-11f0-aa07-a0294223b12a', 'Padre', 'Eduardo Juarez', 40, 2, 1, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `generos`
--

CREATE TABLE `generos` (
  `idGenero` int(11) NOT NULL,
  `nombreGenero` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `generos`
--

INSERT INTO `generos` (`idGenero`, `nombreGenero`) VALUES
(1, 'Femenino'),
(2, 'Masculino'),
(3, 'No binario'),
(4, 'Género fluido'),
(5, 'Prefiero no decir');

-- --------------------------------------------------------

--
-- Table structure for table `grupos`
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
-- Dumping data for table `grupos`
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
('58ddc7eb-0ba6-11f0-a231-047c163ab16f', 'Grupo 7001', 1, 'Ago-Dic', 2025, 'Ingeniería en Biotecnología', '45e582b8-0ba6-11f0-a231-047c163ab16f', 3),
('7ae44614-0b76-11f0-a231-047c163ab16f', 'Maestría en Ciencia y Tecnología de Alimentos', 1, 'Feb-Jun', 2025, 'Ciencia y Tecnología de Alimentos', 'eda618cd-0483-11f0-843f-10f60a355c40', 1),
('81d14e2a-0b90-11f0-a231-047c163ab16f', 'Grupo_Tecmi1', 1, 'Ago-Dic', 2025, 'Administración de empresas', '65eee0af-0b90-11f0-a231-047c163ab16f', 3),
('aae297d1-0b96-11f0-a231-047c163ab16f', 'Grupo B', 1, 'Feb-Jun', 2024, 'Mecatrónica', '8bdfb94c-0b96-11f0-a231-047c163ab16f', 3),
('bc221d4d-0acd-11f0-aa07-a0294223b12a', 'Grupo_4321', 1, 'Feb-Jun', 2025, 'ITC', 'eda64c5e-0483-11f0-843f-10f60a355c40', 1),
('c305303e-0aca-11f0-aa07-a0294223b12a', 'Grupo_123', 1, 'Feb-Jun', 2025, 'ITC', 'eda64c5e-0483-11f0-843f-10f60a355c40', 3),
('dceaa5c4-0acc-11f0-aa07-a0294223b12a', 'Grupo_321', 1, 'Feb-Jun', 2025, 'ITC', 'eda64c5e-0483-11f0-843f-10f60a355c40', 2),
('e2906a1c-0b84-11f0-a231-047c163ab16f', 'Computer Science', 1, 'Ago-Dic', 2025, 'ITC', 'cf25de22-0b84-11f0-a231-047c163ab16f', 3);

-- --------------------------------------------------------

--
-- Table structure for table `gruposaspirantes`
--

CREATE TABLE `gruposaspirantes` (
  `idGrupo` varchar(36) NOT NULL,
  `idAspirante` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gruposaspirantes`
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
('e2906a1c-0b84-11f0-a231-047c163ab16f', '03b07212-0b85-11f0-a231-047c163ab16f'),
('e2906a1c-0b84-11f0-a231-047c163ab16f', '6db0089e-0f7c-11f0-aede-a0294223b12a');

-- --------------------------------------------------------

--
-- Table structure for table `grupospruebas`
--

CREATE TABLE `grupospruebas` (
  `idGrupo` varchar(36) NOT NULL,
  `idPrueba` int(11) NOT NULL,
  `fechaAsignacion` date DEFAULT NULL,
  `fechaLimite` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `grupospruebas`
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
('58ddc7eb-0ba6-11f0-a231-047c163ab16f', 5, '2025-03-28', '2025-03-31'),
('58ddc7eb-0ba6-11f0-a231-047c163ab16f', 6, '2025-03-28', '2025-03-31'),
('81d14e2a-0b90-11f0-a231-047c163ab16f', 6, '2025-03-27', '2025-03-31'),
('aae297d1-0b96-11f0-a231-047c163ab16f', 6, '2025-03-27', '2025-04-01'),
('bc221d4d-0acd-11f0-aa07-a0294223b12a', 1, '2025-03-26', '2025-03-28'),
('bc221d4d-0acd-11f0-aa07-a0294223b12a', 2, '2025-03-26', '2025-03-28'),
('bc221d4d-0acd-11f0-aa07-a0294223b12a', 3, '2025-03-26', '2025-03-28'),
('bc221d4d-0acd-11f0-aa07-a0294223b12a', 4, '2025-03-26', '2025-03-28'),
('bc221d4d-0acd-11f0-aa07-a0294223b12a', 5, '2025-03-26', '2025-03-28'),
('bc221d4d-0acd-11f0-aa07-a0294223b12a', 6, '2025-03-26', '2025-03-28'),
('dceaa5c4-0acc-11f0-aa07-a0294223b12a', 2, NULL, NULL),
('e2906a1c-0b84-11f0-a231-047c163ab16f', 6, '2025-03-27', '2025-03-29');

-- --------------------------------------------------------

--
-- Table structure for table `institucion`
--

CREATE TABLE `institucion` (
  `idInstitucion` varchar(36) NOT NULL,
  `nombreInstitucion` varchar(100) DEFAULT NULL,
  `estatusInstitucion` tinyint(1) DEFAULT NULL,
  `idTipoInstitucion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `institucion`
--

INSERT INTO `institucion` (`idInstitucion`, `nombreInstitucion`, `estatusInstitucion`, `idTipoInstitucion`) VALUES
('45e582b8-0ba6-11f0-a231-047c163ab16f', 'Benemérita Universidad Autónoma de Puebla', 1, 1),
('47cbd520-0b84-11f0-a231-047c163ab16f', 'UVM', 1, 2),
('65eee0af-0b90-11f0-a231-047c163ab16f', 'Tecmilenio', 1, 2),
('8bdfb94c-0b96-11f0-a231-047c163ab16f', 'CBTIS', 1, 1),
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
-- Table structure for table `nivelacademico`
--

CREATE TABLE `nivelacademico` (
  `idNivelAcademico` int(11) NOT NULL,
  `nombreNivelAcademico` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nivelacademico`
--

INSERT INTO `nivelacademico` (`idNivelAcademico`, `nombreNivelAcademico`) VALUES
(1, 'Maestría'),
(2, 'Doctorado'),
(3, 'Licenciatura');

-- --------------------------------------------------------

--
-- Table structure for table `opciones16pf`
--

CREATE TABLE `opciones16pf` (
  `idOpcion16PF` varchar(36) NOT NULL,
  `idPregunta16PF` varchar(36) DEFAULT NULL,
  `opcion16PF` varchar(1) DEFAULT NULL,
  `descripcionOpcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `opcioneskostick`
--

CREATE TABLE `opcioneskostick` (
  `idOpcionKostick` varchar(36) NOT NULL,
  `idPreguntaKostick` varchar(36) DEFAULT NULL,
  `opcionKostick` varchar(1) DEFAULT NULL,
  `descripcionOpcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `opcionesotis`
--

CREATE TABLE `opcionesotis` (
  `idOpcionOtis` varchar(36) NOT NULL,
  `idPreguntaOtis` varchar(36) DEFAULT NULL,
  `opcionOtis` int(11) DEFAULT NULL,
  `descripcionOpcion` text DEFAULT NULL,
  `esCorrecta` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `opcionesotis`
--

INSERT INTO `opcionesotis` (`idOpcionOtis`, `idPreguntaOtis`, `opcionOtis`, `descripcionOpcion`, `esCorrecta`) VALUES
('a3f5b2ea-051f-11f0-8012-246eba5990c8', 'ae34a7af-0517-11f0-8012-246eba5990c8', 1, 'Roja', 0),
('a3f5d22a-051f-11f0-8012-246eba5990c8', 'ae34a7af-0517-11f0-8012-246eba5990c8', 2, 'Redonda', 0),
('a3f5d332-051f-11f0-8012-246eba5990c8', 'ae34a7af-0517-11f0-8012-246eba5990c8', 3, 'Sabrosa', 0),
('a3f5d39d-051f-11f0-8012-246eba5990c8', 'ae34a7af-0517-11f0-8012-246eba5990c8', 4, 'Fruta', 1),
('a3f5d3f6-051f-11f0-8012-246eba5990c8', 'ae34a7af-0517-11f0-8012-246eba5990c8', 5, 'Comida', 0),
('a3f85d19-051f-11f0-8012-246eba5990c8', 'ae34dd7d-0517-11f0-8012-246eba5990c8', 1, 'Curva', 0),
('a3f869a7-051f-11f0-8012-246eba5990c8', 'ae34dd7d-0517-11f0-8012-246eba5990c8', 2, 'Redondo', 0),
('a3f86ab2-051f-11f0-8012-246eba5990c8', 'ae34dd7d-0517-11f0-8012-246eba5990c8', 3, 'Figura', 1),
('a3f86b2e-051f-11f0-8012-246eba5990c8', 'ae34dd7d-0517-11f0-8012-246eba5990c8', 4, 'Punto', 0),
('a3f86c0c-051f-11f0-8012-246eba5990c8', 'ae34dd7d-0517-11f0-8012-246eba5990c8', 5, 'Línea', 0),
('a3fa5472-051f-11f0-8012-246eba5990c8', 'ae34ddfa-0517-11f0-8012-246eba5990c8', 1, 'FRAMO', 0),
('a3fa5f8b-051f-11f0-8012-246eba5990c8', 'ae34ddfa-0517-11f0-8012-246eba5990c8', 2, 'FORMA', 1),
('a3fa6046-051f-11f0-8012-246eba5990c8', 'ae34ddfa-0517-11f0-8012-246eba5990c8', 3, 'MAFRO', 0),
('a3fa609c-051f-11f0-8012-246eba5990c8', 'ae34ddfa-0517-11f0-8012-246eba5990c8', 4, 'FORMO', 0),
('a3fa60ec-051f-11f0-8012-246eba5990c8', 'ae34ddfa-0517-11f0-8012-246eba5990c8', 5, 'MARFO', 0),
('a3fc2d66-051f-11f0-8012-246eba5990c8', 'ae34de1a-0517-11f0-8012-246eba5990c8', 1, 'GOTA', 1),
('a3fc363f-051f-11f0-8012-246eba5990c8', 'ae34de1a-0517-11f0-8012-246eba5990c8', 2, 'TOGA', 0),
('a3fc384c-051f-11f0-8012-246eba5990c8', 'ae34de1a-0517-11f0-8012-246eba5990c8', 3, 'ATGO', 0),
('a3fc38b2-051f-11f0-8012-246eba5990c8', 'ae34de1a-0517-11f0-8012-246eba5990c8', 4, 'OGAT', 0),
('a3fc390b-051f-11f0-8012-246eba5990c8', 'ae34de1a-0517-11f0-8012-246eba5990c8', 5, 'TOAG', 0),
('a3fe011b-051f-11f0-8012-246eba5990c8', 'ae34de34-0517-11f0-8012-246eba5990c8', 1, 'Patata', 0),
('a3fe08e6-051f-11f0-8012-246eba5990c8', 'ae34de34-0517-11f0-8012-246eba5990c8', 2, 'Zanahoria', 0),
('a3fe09a2-051f-11f0-8012-246eba5990c8', 'ae34de34-0517-11f0-8012-246eba5990c8', 3, 'Manzana', 1),
('a3fe09fb-051f-11f0-8012-246eba5990c8', 'ae34de34-0517-11f0-8012-246eba5990c8', 4, 'Cebolla', 0),
('a3fe0a51-051f-11f0-8012-246eba5990c8', 'ae34de34-0517-11f0-8012-246eba5990c8', 5, 'Remolacha', 0),
('a3ffd545-051f-11f0-8012-246eba5990c8', 'ae34de4d-0517-11f0-8012-246eba5990c8', 1, '22', 0),
('a3ffde39-051f-11f0-8012-246eba5990c8', 'ae34de4d-0517-11f0-8012-246eba5990c8', 2, '24', 1),
('a3ffdeec-051f-11f0-8012-246eba5990c8', 'ae34de4d-0517-11f0-8012-246eba5990c8', 3, '25', 0),
('a3ffdf48-051f-11f0-8012-246eba5990c8', 'ae34de4d-0517-11f0-8012-246eba5990c8', 4, '26', 0),
('a3ffdf98-051f-11f0-8012-246eba5990c8', 'ae34de4d-0517-11f0-8012-246eba5990c8', 5, '28', 0),
('a401e4a3-051f-11f0-8012-246eba5990c8', 'ae34de65-0517-11f0-8012-246eba5990c8', 1, 'Miércoles', 0),
('a401ed7b-051f-11f0-8012-246eba5990c8', 'ae34de65-0517-11f0-8012-246eba5990c8', 2, 'Jueves', 1),
('a401ee3b-051f-11f0-8012-246eba5990c8', 'ae34de65-0517-11f0-8012-246eba5990c8', 3, 'Viernes', 0),
('a401ee99-051f-11f0-8012-246eba5990c8', 'ae34de65-0517-11f0-8012-246eba5990c8', 4, 'Sábado', 0),
('a401eef5-051f-11f0-8012-246eba5990c8', 'ae34de65-0517-11f0-8012-246eba5990c8', 5, 'Martes', 0),
('a403efdb-051f-11f0-8012-246eba5990c8', 'ae34de7c-0517-11f0-8012-246eba5990c8', 1, '2 pesos', 0),
('a403f871-051f-11f0-8012-246eba5990c8', 'ae34de7c-0517-11f0-8012-246eba5990c8', 2, '3 pesos', 1),
('a403f92b-051f-11f0-8012-246eba5990c8', 'ae34de7c-0517-11f0-8012-246eba5990c8', 3, '4 pesos', 0),
('a403f985-051f-11f0-8012-246eba5990c8', 'ae34de7c-0517-11f0-8012-246eba5990c8', 4, '27 pesos', 0),
('a403f9dc-051f-11f0-8012-246eba5990c8', 'ae34de7c-0517-11f0-8012-246eba5990c8', 5, '30 pesos', 0),
('a405d2df-051f-11f0-8012-246eba5990c8', 'ae34de9d-0517-11f0-8012-246eba5990c8', 1, '3 hombres', 0),
('a405e99e-051f-11f0-8012-246eba5990c8', 'ae34de9d-0517-11f0-8012-246eba5990c8', 2, '7 hombres', 0),
('a405ea5b-051f-11f0-8012-246eba5990c8', 'ae34de9d-0517-11f0-8012-246eba5990c8', 3, '10 hombres', 0),
('a405eab5-051f-11f0-8012-246eba5990c8', 'ae34de9d-0517-11f0-8012-246eba5990c8', 4, '21 hombres', 1),
('a405eb13-051f-11f0-8012-246eba5990c8', 'ae34de9d-0517-11f0-8012-246eba5990c8', 5, '24 hombres', 0),
('a4082411-051f-11f0-8012-246eba5990c8', 'ae34deb7-0517-11f0-8012-246eba5990c8', 1, '3 pasteles', 0),
('a4083253-051f-11f0-8012-246eba5990c8', 'ae34deb7-0517-11f0-8012-246eba5990c8', 2, '4 pasteles', 0),
('a4083325-051f-11f0-8012-246eba5990c8', 'ae34deb7-0517-11f0-8012-246eba5990c8', 3, '6 pasteles', 1),
('a4083392-051f-11f0-8012-246eba5990c8', 'ae34deb7-0517-11f0-8012-246eba5990c8', 4, '9 pasteles', 0),
('a40833f2-051f-11f0-8012-246eba5990c8', 'ae34deb7-0517-11f0-8012-246eba5990c8', 5, '15 pasteles', 0),
('a40a4479-051f-11f0-8012-246eba5990c8', 'ae34ded1-0517-11f0-8012-246eba5990c8', 1, '2', 0),
('a40a5394-051f-11f0-8012-246eba5990c8', 'ae34ded1-0517-11f0-8012-246eba5990c8', 2, '4', 0),
('a40a545f-051f-11f0-8012-246eba5990c8', 'ae34ded1-0517-11f0-8012-246eba5990c8', 3, '8', 0),
('a40a54c2-051f-11f0-8012-246eba5990c8', 'ae34ded1-0517-11f0-8012-246eba5990c8', 4, '12', 1),
('a40a5516-051f-11f0-8012-246eba5990c8', 'ae34ded1-0517-11f0-8012-246eba5990c8', 5, '16', 0),
('a40c4fe0-051f-11f0-8012-246eba5990c8', 'ae34dee8-0517-11f0-8012-246eba5990c8', 1, '3 horas', 0),
('a40c5915-051f-11f0-8012-246eba5990c8', 'ae34dee8-0517-11f0-8012-246eba5990c8', 2, '4 horas', 0),
('a40c59e5-051f-11f0-8012-246eba5990c8', 'ae34dee8-0517-11f0-8012-246eba5990c8', 3, '5 horas', 1),
('a40c5a48-051f-11f0-8012-246eba5990c8', 'ae34dee8-0517-11f0-8012-246eba5990c8', 4, '6 horas', 0),
('a40c5aa2-051f-11f0-8012-246eba5990c8', 'ae34dee8-0517-11f0-8012-246eba5990c8', 5, '18000 horas', 0),
('a40e33b9-051f-11f0-8012-246eba5990c8', 'ae34df00-0517-11f0-8012-246eba5990c8', 1, '66 años', 1),
('a40e3c92-051f-11f0-8012-246eba5990c8', 'ae34df00-0517-11f0-8012-246eba5990c8', 2, '80 años', 0),
('a40e3d5a-051f-11f0-8012-246eba5990c8', 'ae34df00-0517-11f0-8012-246eba5990c8', 3, '54 años', 0),
('a40e3dd8-051f-11f0-8012-246eba5990c8', 'ae34df00-0517-11f0-8012-246eba5990c8', 4, '60 años', 0),
('a40e3e2f-051f-11f0-8012-246eba5990c8', 'ae34df00-0517-11f0-8012-246eba5990c8', 5, '52 años', 0),
('a4102c59-051f-11f0-8012-246eba5990c8', 'ae34df1d-0517-11f0-8012-246eba5990c8', 1, 'Primero', 0),
('a4103819-051f-11f0-8012-246eba5990c8', 'ae34df1d-0517-11f0-8012-246eba5990c8', 2, 'Segundo', 1),
('a41038e7-051f-11f0-8012-246eba5990c8', 'ae34df1d-0517-11f0-8012-246eba5990c8', 3, 'Tercero', 0),
('a41039b2-051f-11f0-8012-246eba5990c8', 'ae34df1d-0517-11f0-8012-246eba5990c8', 4, 'Depende de cuántos corredores hay', 0),
('a4103a42-051f-11f0-8012-246eba5990c8', 'ae34df1d-0517-11f0-8012-246eba5990c8', 5, 'No se puede determinar', 0),
('a4123a76-051f-11f0-8012-246eba5990c8', 'ae34df36-0517-11f0-8012-246eba5990c8', 1, '21 casas', 0),
('a4124749-051f-11f0-8012-246eba5990c8', 'ae34df36-0517-11f0-8012-246eba5990c8', 2, '28 casas', 0),
('a41249b7-051f-11f0-8012-246eba5990c8', 'ae34df36-0517-11f0-8012-246eba5990c8', 3, '36 casas', 0),
('a4124ad8-051f-11f0-8012-246eba5990c8', 'ae34df36-0517-11f0-8012-246eba5990c8', 4, '42 casas', 1),
('a4124b88-051f-11f0-8012-246eba5990c8', 'ae34df36-0517-11f0-8012-246eba5990c8', 5, '126 casas', 0),
('a41461e7-051f-11f0-8012-246eba5990c8', 'ae34df4f-0517-11f0-8012-246eba5990c8', 1, 'El primero', 0),
('a4146a8e-051f-11f0-8012-246eba5990c8', 'ae34df4f-0517-11f0-8012-246eba5990c8', 2, 'El segundo', 0),
('a4146b3e-051f-11f0-8012-246eba5990c8', 'ae34df4f-0517-11f0-8012-246eba5990c8', 3, 'Ambos', 1),
('a4146b9a-051f-11f0-8012-246eba5990c8', 'ae34df4f-0517-11f0-8012-246eba5990c8', 4, 'Ninguno', 0),
('a4146be9-051f-11f0-8012-246eba5990c8', 'ae34df4f-0517-11f0-8012-246eba5990c8', 5, 'No se puede determinar', 0),
('a4167408-051f-11f0-8012-246eba5990c8', 'ae34df66-0517-11f0-8012-246eba5990c8', 1, '32 pies', 1),
('a416800d-051f-11f0-8012-246eba5990c8', 'ae34df66-0517-11f0-8012-246eba5990c8', 2, '48 pies', 0),
('a41680f6-051f-11f0-8012-246eba5990c8', 'ae34df66-0517-11f0-8012-246eba5990c8', 3, '64 pies', 0),
('a4168150-051f-11f0-8012-246eba5990c8', 'ae34df66-0517-11f0-8012-246eba5990c8', 4, '112 pies', 0),
('a41681ac-051f-11f0-8012-246eba5990c8', 'ae34df66-0517-11f0-8012-246eba5990c8', 5, '16 pies', 0),
('a4186f49-051f-11f0-8012-246eba5990c8', 'ae34df87-0517-11f0-8012-246eba5990c8', 1, 'Nadar', 0),
('a4187c7f-051f-11f0-8012-246eba5990c8', 'ae34df87-0517-11f0-8012-246eba5990c8', 2, 'Agua', 1),
('a4187ddf-051f-11f0-8012-246eba5990c8', 'ae34df87-0517-11f0-8012-246eba5990c8', 3, 'Escamas', 0),
('a4187e48-051f-11f0-8012-246eba5990c8', 'ae34df87-0517-11f0-8012-246eba5990c8', 4, 'Mar', 0),
('a4187eb8-051f-11f0-8012-246eba5990c8', 'ae34df87-0517-11f0-8012-246eba5990c8', 5, 'Branquias', 0),
('a41a25f9-051f-11f0-8012-246eba5990c8', 'ae34df9d-0517-11f0-8012-246eba5990c8', 1, '1 naranja', 0),
('a41a3274-051f-11f0-8012-246eba5990c8', 'ae34df9d-0517-11f0-8012-246eba5990c8', 2, '1.5 naranjas', 1),
('a41a3339-051f-11f0-8012-246eba5990c8', 'ae34df9d-0517-11f0-8012-246eba5990c8', 3, '2 naranjas', 0),
('a41a3396-051f-11f0-8012-246eba5990c8', 'ae34df9d-0517-11f0-8012-246eba5990c8', 4, '3 naranjas', 0),
('a41a33e9-051f-11f0-8012-246eba5990c8', 'ae34df9d-0517-11f0-8012-246eba5990c8', 5, '4 naranjas', 0),
('a41b9969-051f-11f0-8012-246eba5990c8', 'ae34dfb8-0517-11f0-8012-246eba5990c8', 1, 'mayor', 1),
('a41ba406-051f-11f0-8012-246eba5990c8', 'ae34dfb8-0517-11f0-8012-246eba5990c8', 2, 'menor', 0),
('a41ba4c4-051f-11f0-8012-246eba5990c8', 'ae34dfb8-0517-11f0-8012-246eba5990c8', 3, 'igual', 0),
('a41ba519-051f-11f0-8012-246eba5990c8', 'ae34dfb8-0517-11f0-8012-246eba5990c8', 4, 'no se puede determinar', 0),
('a41ba56f-051f-11f0-8012-246eba5990c8', 'ae34dfb8-0517-11f0-8012-246eba5990c8', 5, 'diferente', 0);

-- --------------------------------------------------------

--
-- Table structure for table `opcionesterman`
--

CREATE TABLE `opcionesterman` (
  `idOpcionTerman` varchar(36) NOT NULL,
  `idPreguntaTerman` varchar(36) DEFAULT NULL,
  `opcionTerman` int(11) DEFAULT NULL,
  `descripcionOpcion` text DEFAULT NULL,
  `esCorrecta` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `otp`
--

CREATE TABLE `otp` (
  `idOTP` int(11) NOT NULL,
  `idUsuario` varchar(36) DEFAULT NULL,
  `codigo` int(11) DEFAULT NULL,
  `validez` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `usado` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `otp`
--

INSERT INTO `otp` (`idOTP`, `idUsuario`, `codigo`, `validez`, `usado`) VALUES
(1, '20c24205-0482-11f0-843f-10f60a355c40', 822923, '2025-04-07 05:45:01', 0),
(2, '20c24205-0482-11f0-843f-10f60a355c40', 336757, '2025-04-07 05:45:42', 0),
(3, '20c232ef-0482-11f0-843f-10f60a355c40', 163536, '2025-04-07 05:41:17', 1),
(4, '20c24c8c-0482-11f0-843f-10f60a355c40', 421089, '2025-04-07 05:42:22', 1),
(5, '20c232ef-0482-11f0-843f-10f60a355c40', 805397, '2025-04-07 15:04:49', 0),
(6, '20c24c8c-0482-11f0-843f-10f60a355c40', 352170, '2025-04-07 15:01:10', 1);

-- --------------------------------------------------------

--
-- Table structure for table `paises`
--

CREATE TABLE `paises` (
  `idPais` int(11) NOT NULL,
  `nombrePais` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `paises`
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
-- Table structure for table `preguntas16pf`
--

CREATE TABLE `preguntas16pf` (
  `idPregunta16PF` varchar(36) NOT NULL,
  `idPrueba` int(11) DEFAULT NULL,
  `numeroPregunta` int(11) DEFAULT NULL,
  `pregunta16PF` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `preguntasformatoentrevista`
--

CREATE TABLE `preguntasformatoentrevista` (
  `idPreguntaFormatoEntrevista` int(11) NOT NULL,
  `nombrePreguntaFormatoEntrevista` varchar(255) DEFAULT NULL,
  `tipoPregunta` varchar(60) DEFAULT NULL,
  `seccion` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `preguntasformatoentrevista`
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
-- Table structure for table `preguntashartman`
--

CREATE TABLE `preguntashartman` (
  `idPreguntaHartman` varchar(36) NOT NULL,
  `idPrueba` int(11) DEFAULT NULL,
  `fasePregunta` enum('1','2') DEFAULT NULL,
  `numeroPregunta` int(11) DEFAULT NULL,
  `preguntaHartman` varchar(255) DEFAULT NULL,
  `valorHartman` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `preguntaskostick`
--

CREATE TABLE `preguntaskostick` (
  `idPreguntaKostick` varchar(36) NOT NULL,
  `idPrueba` int(11) DEFAULT NULL,
  `numeroPregunta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `preguntasotis`
--

CREATE TABLE `preguntasotis` (
  `idPreguntaOtis` varchar(36) NOT NULL,
  `idPrueba` int(11) DEFAULT NULL,
  `numeroPregunta` int(11) DEFAULT NULL,
  `preguntaOtis` varchar(255) DEFAULT NULL,
  `idAreaOtis` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `preguntasotis`
--

INSERT INTO `preguntasotis` (`idPreguntaOtis`, `idPrueba`, `numeroPregunta`, `preguntaOtis`, `idAreaOtis`) VALUES
('ae34a7af-0517-11f0-8012-246eba5990c8', 5, 1, '¿Cuál de estas cinco palabras indica mejor lo que es una manzana?', 3),
('ae34dd7d-0517-11f0-8012-246eba5990c8', 5, 2, '¿Cuál de estas cinco palabras indica mejor lo que es un círculo?', 2),
('ae34ddfa-0517-11f0-8012-246eba5990c8', 5, 3, 'Si reordenamos las letras \"ROFMA\", ¿qué palabra se forma?', 1),
('ae34de1a-0517-11f0-8012-246eba5990c8', 5, 4, 'Si reordenamos las letras \"GATO\", ¿qué palabra se forma?', 5),
('ae34de34-0517-11f0-8012-246eba5990c8', 5, 5, '¿Cuál de estas cinco cosas no pertenece al mismo grupo?', 4),
('ae34de4d-0517-11f0-8012-246eba5990c8', 5, 6, '¿Qué número sigue en esta serie: 4, 8, 12, 16, 20, ...?', 3),
('ae34de65-0517-11f0-8012-246eba5990c8', 5, 7, 'Si el día después de mañana es domingo, ¿qué día fue ayer?', 2),
('ae34de7c-0517-11f0-8012-246eba5990c8', 5, 8, 'Un comerciante compró algunos artículos por 27 pesos y los vendió por 30 pesos. ¿Cuánto ganó?', 1),
('ae34de9d-0517-11f0-8012-246eba5990c8', 5, 9, 'Si 3 hombres pueden hacer un trabajo en 7 días, ¿cuántos hombres se necesitan para hacerlo en 1 día?', 5),
('ae34deb7-0517-11f0-8012-246eba5990c8', 5, 10, 'Si dos pasteles cuestan 30 centavos, ¿cuántos pasteles se pueden comprar con 90 centavos?', 4),
('ae34ded1-0517-11f0-8012-246eba5990c8', 5, 11, '¿Cuál de estos cinco números no pertenece al mismo grupo? 2, 4, 8, 12, 16', 3),
('ae34dee8-0517-11f0-8012-246eba5990c8', 5, 12, 'Si un tren viaja a 60 kilómetros por hora, ¿cuánto tiempo tardará en recorrer 300 kilómetros?', 2),
('ae34df00-0517-11f0-8012-246eba5990c8', 5, 13, 'Si una persona tiene 14 años y su hermano tiene el doble de edad, ¿cuántos años tendrá el hermano cuando la persona tenga 40 años?', 2),
('ae34df1d-0517-11f0-8012-246eba5990c8', 5, 14, 'En una carrera, si adelantas al segundo, ¿en qué posición terminarás?', 1),
('ae34df36-0517-11f0-8012-246eba5990c8', 5, 15, 'Si 7 hombres construyen 6 casas en 3 días, ¿cuántas casas construirán 21 hombres en 7 días?', 5),
('ae34df4f-0517-11f0-8012-246eba5990c8', 5, 16, 'Si uno dice \"Un hombre puede hacer un trabajo en 4 días\" y otro dice \"Cuatro hombres pueden hacer el trabajo en 1 día\", ¿quién tiene razón?', 4),
('ae34df66-0517-11f0-8012-246eba5990c8', 5, 17, 'Si un objeto cae 16 pies en el primer segundo, 48 pies en los dos primeros segundos, y 80 pies en los tres primeros segundos, ¿cuántos pies caerá en el cuarto segundo?', 3),
('ae34df87-0517-11f0-8012-246eba5990c8', 5, 18, 'Completa la analogía: Pájaro es a aire como pez es a...', 2),
('ae34df9d-0517-11f0-8012-246eba5990c8', 5, 19, 'Si Juan tiene 5 naranjas y Pedro tiene 8 naranjas, ¿cuántas naranjas debe dar Pedro a Juan para que ambos tengan la misma cantidad?', 1),
('ae34dfb8-0517-11f0-8012-246eba5990c8', 5, 20, 'Si X es mayor que Y, y Y es mayor que Z, entonces X es __ que Z.', 5);

-- --------------------------------------------------------

--
-- Table structure for table `preguntasterman`
--

CREATE TABLE `preguntasterman` (
  `idPreguntaTerman` varchar(36) NOT NULL,
  `idSerieTerman` int(11) DEFAULT NULL,
  `numeroPregunta` int(11) DEFAULT NULL,
  `preguntaTerman` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `privilegios`
--

CREATE TABLE `privilegios` (
  `idPrivilegio` int(11) NOT NULL,
  `nombrePrivilegio` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `privilegios`
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
-- Table structure for table `pruebas`
--

CREATE TABLE `pruebas` (
  `idPrueba` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `instrucciones` varchar(255) DEFAULT NULL,
  `tiempo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pruebas`
--

INSERT INTO `pruebas` (`idPrueba`, `nombre`, `descripcion`, `instrucciones`, `tiempo`) VALUES
(1, 'KOSTICK', 'Prueba proyectiva que analiza rasgos de personalidad y comportamiento.', 'instruccionesKostick.txt', NULL),
(2, 'PRUEBA DE 16PF', 'Inventario de personalidad que mide 16 factores primarios de la personalidad.', 'instrucciones16PF.txt', NULL),
(3, 'HARTMAN', 'Evaluación psicológica utilizada en diversos contextos de diagnóstico.', 'instruccionesHartman.txt', NULL),
(4, 'TERMAN', 'Prueba para medir el coeficiente intelectual y evaluar habilidades cognitivas.', 'instruccionesTerman.txt', NULL),
(5, 'OTIS', 'Prueba de inteligencia que mide la capacidad de razonamiento lógico y abstracto.', 'instruccionesOtis.txt', 30),
(6, 'Colores de Luscher', 'Evaluación basada en la selección de colores para analizar el estado emocional.', 'instruccionesColores.txt', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `respuestaotisaspirante`
--

CREATE TABLE `respuestaotisaspirante` (
  `idRespuestaOtis` varchar(36) NOT NULL,
  `idAspirante` varchar(36) DEFAULT NULL,
  `idGrupo` varchar(36) DEFAULT NULL,
  `idPreguntaOtis` varchar(36) DEFAULT NULL,
  `idOpcionOtis` varchar(36) DEFAULT NULL,
  `idPrueba` int(11) DEFAULT NULL,
  `respuestaAbierta` varchar(5) DEFAULT NULL,
  `tiempoRespuesta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `respuestaotisaspirante`
--

INSERT INTO `respuestaotisaspirante` (`idRespuestaOtis`, `idAspirante`, `idGrupo`, `idPreguntaOtis`, `idOpcionOtis`, `idPrueba`, `respuestaAbierta`, `tiempoRespuesta`) VALUES
('3a223bac-10a2-11f0-aede-a0294223b12a', '39dd9664-0482-11f0-843f-10f60a355c40', '3768c32d-0485-11f0-843f-10f60a355c40', 'ae34ddfa-0517-11f0-8012-246eba5990c8', 'a3fa5f8b-051f-11f0-8012-246eba5990c8', 5, NULL, 25),
('5206bb04-10a2-11f0-aede-a0294223b12a', '39dd9664-0482-11f0-843f-10f60a355c40', '3768c32d-0485-11f0-843f-10f60a355c40', 'ae34de7c-0517-11f0-8012-246eba5990c8', 'a403f871-051f-11f0-8012-246eba5990c8', 5, NULL, 25),
('6c14c1ec-10a2-11f0-aede-a0294223b12a', '39dd9664-0482-11f0-843f-10f60a355c40', '3768c32d-0485-11f0-843f-10f60a355c40', 'ae34de34-0517-11f0-8012-246eba5990c8', 'a3fe011b-051f-11f0-8012-246eba5990c8', 5, NULL, 25),
('746f5ffb-10a1-11f0-aede-a0294223b12a', '39dd9664-0482-11f0-843f-10f60a355c40', '3768c32d-0485-11f0-843f-10f60a355c40', 'ae34a7af-0517-11f0-8012-246eba5990c8', 'a3f5b2ea-051f-11f0-8012-246eba5990c8', 5, NULL, 25),
('8916180f-10a2-11f0-aede-a0294223b12a', '39dd9664-0482-11f0-843f-10f60a355c40', '3768c32d-0485-11f0-843f-10f60a355c40', 'ae34deb7-0517-11f0-8012-246eba5990c8', 'a4083253-051f-11f0-8012-246eba5990c8', 5, NULL, 25),
('9ed7f5ae-10a2-11f0-aede-a0294223b12a', '39dd9664-0482-11f0-843f-10f60a355c40', '3768c32d-0485-11f0-843f-10f60a355c40', 'ae34df4f-0517-11f0-8012-246eba5990c8', 'a41461e7-051f-11f0-8012-246eba5990c8', 5, NULL, 25),
('aa44d996-051f-11f0-8012-246eba5990c8', '39dd9664-0482-11f0-843f-10f60a355c40', '3768c32d-0485-11f0-843f-10f60a355c40', 'ae34a7af-0517-11f0-8012-246eba5990c8', 'a3f5d39d-051f-11f0-8012-246eba5990c8', 5, NULL, 25),
('aa450a3b-051f-11f0-8012-246eba5990c8', '39dddea9-0482-11f0-843f-10f60a355c40', '3768c32d-0485-11f0-843f-10f60a355c40', 'ae34dd7d-0517-11f0-8012-246eba5990c8', 'a3f86ab2-051f-11f0-8012-246eba5990c8', 5, NULL, 18),
('aa450c31-051f-11f0-8012-246eba5990c8', '39dde372-0482-11f0-843f-10f60a355c40', '3768c32d-0485-11f0-843f-10f60a355c40', 'ae34ddfa-0517-11f0-8012-246eba5990c8', 'a3fa6046-051f-11f0-8012-246eba5990c8', 5, NULL, 32),
('aa450d63-051f-11f0-8012-246eba5990c8', '39dde598-0482-11f0-843f-10f60a355c40', '3768c32d-0485-11f0-843f-10f60a355c40', 'ae34de1a-0517-11f0-8012-246eba5990c8', 'a3fc2d66-051f-11f0-8012-246eba5990c8', 5, NULL, 15),
('aa450ec3-051f-11f0-8012-246eba5990c8', '39de5c40-0482-11f0-843f-10f60a355c40', '3768c32d-0485-11f0-843f-10f60a355c40', 'ae34de34-0517-11f0-8012-246eba5990c8', 'a3fe09a2-051f-11f0-8012-246eba5990c8', 5, NULL, 28),
('aa4510a0-051f-11f0-8012-246eba5990c8', '39de6041-0482-11f0-843f-10f60a355c40', '3768c32d-0485-11f0-843f-10f60a355c40', 'ae34de4d-0517-11f0-8012-246eba5990c8', 'a3ffdf48-051f-11f0-8012-246eba5990c8', 5, NULL, 45),
('aa451222-051f-11f0-8012-246eba5990c8', '39de6272-0482-11f0-843f-10f60a355c40', '3768c32d-0485-11f0-843f-10f60a355c40', 'ae34de65-0517-11f0-8012-246eba5990c8', 'a401ed7b-051f-11f0-8012-246eba5990c8', 5, NULL, 30),
('aa455bd5-051f-11f0-8012-246eba5990c8', '39de6468-0482-11f0-843f-10f60a355c40', '3768c32d-0485-11f0-843f-10f60a355c40', 'ae34de7c-0517-11f0-8012-246eba5990c8', 'a403f871-051f-11f0-8012-246eba5990c8', 5, NULL, 22),
('aa455e0e-051f-11f0-8012-246eba5990c8', '39de664d-0482-11f0-843f-10f60a355c40', '3768c32d-0485-11f0-843f-10f60a355c40', 'ae34de9d-0517-11f0-8012-246eba5990c8', 'a405e99e-051f-11f0-8012-246eba5990c8', 5, NULL, 40),
('aa455f75-051f-11f0-8012-246eba5990c8', '39de6829-0482-11f0-843f-10f60a355c40', '3768c32d-0485-11f0-843f-10f60a355c40', 'ae34deb7-0517-11f0-8012-246eba5990c8', 'a4083325-051f-11f0-8012-246eba5990c8', 5, NULL, 19),
('ce246398-10a2-11f0-aede-a0294223b12a', '39dd9664-0482-11f0-843f-10f60a355c40', '3768c32d-0485-11f0-843f-10f60a355c40', 'ae34de34-0517-11f0-8012-246eba5990c8', 'a3fe09a2-051f-11f0-8012-246eba5990c8', 5, NULL, 25),
('df6bf0e8-10a2-11f0-aede-a0294223b12a', '39dd9664-0482-11f0-843f-10f60a355c40', '3768c32d-0485-11f0-843f-10f60a355c40', 'ae34de1a-0517-11f0-8012-246eba5990c8', 'a3fc363f-051f-11f0-8012-246eba5990c8', 5, NULL, 25),
('ea87edae-10a2-11f0-aede-a0294223b12a', '39dd9664-0482-11f0-843f-10f60a355c40', '3768c32d-0485-11f0-843f-10f60a355c40', 'ae34de9d-0517-11f0-8012-246eba5990c8', 'a405eab5-051f-11f0-8012-246eba5990c8', 5, NULL, 25);

-- --------------------------------------------------------

--
-- Table structure for table `respuestas16pfaspirante`
--

CREATE TABLE `respuestas16pfaspirante` (
  `idRespuesta16PF` varchar(36) NOT NULL,
  `idAspirante` varchar(36) DEFAULT NULL,
  `idGrupo` varchar(36) DEFAULT NULL,
  `idPregunta16PF` varchar(36) DEFAULT NULL,
  `idOpcion16PF` varchar(36) DEFAULT NULL,
  `idPrueba` int(11) DEFAULT NULL,
  `tiempoRespuesta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `respuestashartmanaspirante`
--

CREATE TABLE `respuestashartmanaspirante` (
  `idRespuestaHartman` varchar(36) NOT NULL,
  `idAspirante` varchar(36) DEFAULT NULL,
  `idGrupo` varchar(36) DEFAULT NULL,
  `idPreguntaHartman` varchar(36) DEFAULT NULL,
  `idPrueba` int(11) DEFAULT NULL,
  `respuestaAbierta` int(11) DEFAULT NULL,
  `tiempoRespuesta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `respuestaskostickaspirante`
--

CREATE TABLE `respuestaskostickaspirante` (
  `idRespuestaKostick` varchar(36) NOT NULL,
  `idAspirante` varchar(36) DEFAULT NULL,
  `idGrupo` varchar(36) DEFAULT NULL,
  `idPreguntaKostick` varchar(36) DEFAULT NULL,
  `idOpcionKostick` varchar(36) DEFAULT NULL,
  `idPrueba` int(11) DEFAULT NULL,
  `tiempoRespuesta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `respuestastermanaspirante`
--

CREATE TABLE `respuestastermanaspirante` (
  `idRespuestaTerman` varchar(36) NOT NULL,
  `idAspirante` varchar(36) DEFAULT NULL,
  `idGrupo` varchar(36) DEFAULT NULL,
  `idPreguntaTerman` varchar(36) DEFAULT NULL,
  `idPrueba` int(11) DEFAULT NULL,
  `respuestaAbierta` varchar(20) DEFAULT NULL,
  `tiempoRespuesta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `idRol` int(11) NOT NULL,
  `nombreRol` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`idRol`, `nombreRol`) VALUES
(1, 'Psicologo'),
(2, 'Coordinador'),
(3, 'Aspirante');

-- --------------------------------------------------------

--
-- Table structure for table `rolesprivilegios`
--

CREATE TABLE `rolesprivilegios` (
  `idRol` int(11) NOT NULL,
  `idPrivilegio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rolesprivilegios`
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
-- Table structure for table `seleccionescolores`
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
-- Dumping data for table `seleccionescolores`
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
-- Table structure for table `seriesterman`
--

CREATE TABLE `seriesterman` (
  `idSerieTerman` int(11) NOT NULL,
  `idPrueba` int(11) DEFAULT NULL,
  `duracion` int(11) DEFAULT NULL,
  `nombreSeccion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tipoinstitucion`
--

CREATE TABLE `tipoinstitucion` (
  `idTipoInstitucion` int(11) NOT NULL,
  `nombreTipoInstitucion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tipoinstitucion`
--

INSERT INTO `tipoinstitucion` (`idTipoInstitucion`, `nombreTipoInstitucion`) VALUES
(1, 'Educativa Pública'),
(2, 'Educativa Privada');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
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
-- Dumping data for table `usuarios`
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
('5f74db14-0a64-11f0-aa07-a0294223b12a', 'prueba7', 1, 'prueba7', '1', '1', 'prueba7', '1', '1', 3),
('69a7b366-0a06-11f0-aa07-a0294223b12a', '1312323121', 1, 'prueba7', '1', '1', '1312323121', '1', '1', 3),
('6dafaa48-0f7c-11f0-aede-a0294223b12a', 'juanpp@gmail.com', 1, 'Juan', 'Perez', 'Perez', 'juanpp@gmail.com', '52', '1234567890', 3),
('6ee37c28-0ba6-11f0-a231-047c163ab16f', 'rommelph@gmail.com', 1, 'Rommel', 'Pacheco', 'Hernández', 'rommelph@gmail.com', '52', '4421569563', 3),
('76ad4e10-0a66-11f0-aa07-a0294223b12a', 'prueba9', 1, 'prueba9', '1', '1', 'prueba9', '1', '1', 3),
('7b601ee2-0a67-11f0-aa07-a0294223b12a', 'prueba10', 1, 'prueba10', '1', '1', 'prueba10', '1', '1', 3),
('803571ea-0a08-11f0-aa07-a0294223b12a', 'prueba10', 1, 'prueba10', '1', '1', 'prueba10', '1', '1', 3),
('881fe87c-0a66-11f0-aa07-a0294223b12a', 'prueba10', 1, 'prueba10', '1', '1', 'prueba10', '1', '1', 3),
('8c38333a-0a06-11f0-aa07-a0294223b12a', 'confio', 1, 'estaeslabuena', '1', '1', 'confio', '1', '1', 3),
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
('f246aa4f-0b91-11f0-a231-047c163ab16f', '', 1, '', '', '', '', '', '', 3),
('f292789b-0a04-11f0-aa07-a0294223b12a', 'ejemplo@gmail.com', 1, 'prueba', 'a', '1', 'ejemplo@gmail.com', '52', '1029384756', 3),
('f3adb74f-0a06-11f0-aa07-a0294223b12a', 'Por Favor1', 1, 'Ahora1', 'Sí', 'Ya', 'Por Favor1', '11', '11', 3),
('f5694194-0b74-11f0-a231-047c163ab16f', 'jorgero@gmail.com', 1, 'Jorge', 'Ramírez', 'Ochoa', 'jorgero@gmail.com', '52', '4421567453', 3),
('f9f53634-0b92-11f0-a231-047c163ab16f', '', 1, '', '', '', '', '', '', 3),
('fc7ac20e-0a08-11f0-aa07-a0294223b12a', 'prueba13', 1, 'prueba13', '1', '1', 'prueba13', '1', '1', 3),
('fd0946f6-0b91-11f0-a231-047c163ab16f', '', 1, '', '', '', '', '', '', 3),
('feb4e0ac-0b91-11f0-a231-047c163ab16f', '', 1, '', '', '', '', '', '', 3);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vistapreguntasrespustasaspirante`
-- (See below for the actual view)
--
CREATE TABLE `vistapreguntasrespustasaspirante` (
`numeroPregunta` int(11)
,`preguntaOtis` varchar(255)
,`opcionOtis` int(11)
,`descripcionOpcion` text
,`esCorrecta` tinyint(1)
,`tiempoRespuesta` int(11)
,`respuestaAbierta` varchar(5)
,`idAspirante` varchar(36)
,`idPrueba` int(11)
,`idGrupo` varchar(36)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vistapruebasaspirantes`
-- (See below for the actual view)
--
CREATE TABLE `vistapruebasaspirantes` (
`nombre` varchar(100)
,`nombreEstatus` varchar(20)
,`descripcion` varchar(255)
,`fechaLimite` date
,`tiempo` int(11)
,`idAspirante` varchar(36)
,`nombreGrupo` varchar(100)
);

-- --------------------------------------------------------

--
-- Structure for view `vistapreguntasrespustasaspirante`
--
DROP TABLE IF EXISTS `vistapreguntasrespustasaspirante`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vistapreguntasrespustasaspirante`  AS SELECT `po`.`numeroPregunta` AS `numeroPregunta`, `po`.`preguntaOtis` AS `preguntaOtis`, `oo`.`opcionOtis` AS `opcionOtis`, `oo`.`descripcionOpcion` AS `descripcionOpcion`, `oo`.`esCorrecta` AS `esCorrecta`, `roa`.`tiempoRespuesta` AS `tiempoRespuesta`, `roa`.`respuestaAbierta` AS `respuestaAbierta`, `roa`.`idAspirante` AS `idAspirante`, `roa`.`idPrueba` AS `idPrueba`, `roa`.`idGrupo` AS `idGrupo` FROM ((`respuestaotisaspirante` `roa` join `preguntasotis` `po` on(`roa`.`idPreguntaOtis` = `po`.`idPreguntaOtis`)) join `opcionesotis` `oo` on(`roa`.`idOpcionOtis` = `oo`.`idOpcionOtis`)) ;

-- --------------------------------------------------------

--
-- Structure for view `vistapruebasaspirantes`
--
DROP TABLE IF EXISTS `vistapruebasaspirantes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vistapruebasaspirantes`  AS SELECT `p`.`nombre` AS `nombre`, `e`.`nombreEstatus` AS `nombreEstatus`, `p`.`descripcion` AS `descripcion`, `agp`.`fechaLimite` AS `fechaLimite`, `p`.`tiempo` AS `tiempo`, `a`.`idAspirante` AS `idAspirante`, `g`.`nombreGrupo` AS `nombreGrupo` FROM ((((`pruebas` `p` join `aspirantesgrupospruebas` `agp` on(`p`.`idPrueba` = `agp`.`idPrueba`)) join `estatusprueba` `e` on(`agp`.`idEstatus` = `e`.`idEstatus`)) join `aspirantes` `a` on(`agp`.`idAspirante` = `a`.`idAspirante`)) join `grupos` `g` on(`agp`.`idGrupo` = `g`.`idGrupo`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `areasotis`
--
ALTER TABLE `areasotis`
  ADD PRIMARY KEY (`idAreaOtis`);

--
-- Indexes for table `aspirantes`
--
ALTER TABLE `aspirantes`
  ADD PRIMARY KEY (`idAspirante`),
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `idPais` (`idPais`),
  ADD KEY `idEstado` (`idEstado`);

--
-- Indexes for table `aspirantesgrupospruebas`
--
ALTER TABLE `aspirantesgrupospruebas`
  ADD PRIMARY KEY (`idGrupo`,`idPrueba`,`idAspirante`),
  ADD KEY `idPrueba` (`idPrueba`),
  ADD KEY `idAspirante` (`idAspirante`),
  ADD KEY `idEstatus` (`idEstatus`);

--
-- Indexes for table `aspirantespreguntasformatoentrevista`
--
ALTER TABLE `aspirantespreguntasformatoentrevista`
  ADD PRIMARY KEY (`idAspirante`,`idPreguntaFormatoEntrevista`),
  ADD KEY `idPreguntaFormatoEntrevista` (`idPreguntaFormatoEntrevista`);

--
-- Indexes for table `colores`
--
ALTER TABLE `colores`
  ADD PRIMARY KEY (`idColor`);

--
-- Indexes for table `datospersonales`
--
ALTER TABLE `datospersonales`
  ADD PRIMARY KEY (`idDatosPersonales`),
  ADD UNIQUE KEY `idGrupo` (`idGrupo`,`idPrueba`,`idAspirante`),
  ADD KEY `idPrueba` (`idPrueba`),
  ADD KEY `idAspirante` (`idAspirante`);

--
-- Indexes for table `estadocivil`
--
ALTER TABLE `estadocivil`
  ADD PRIMARY KEY (`idEstadoCivil`);

--
-- Indexes for table `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`idEstado`);

--
-- Indexes for table `estatusprueba`
--
ALTER TABLE `estatusprueba`
  ADD PRIMARY KEY (`idEstatus`);

--
-- Indexes for table `familiares`
--
ALTER TABLE `familiares`
  ADD PRIMARY KEY (`idFamiliar`),
  ADD KEY `idGenero` (`idGenero`),
  ADD KEY `idEstadoCivil` (`idEstadoCivil`),
  ADD KEY `idAspirante` (`idAspirante`),
  ADD KEY `hijoDe` (`hijoDe`);

--
-- Indexes for table `generos`
--
ALTER TABLE `generos`
  ADD PRIMARY KEY (`idGenero`);

--
-- Indexes for table `grupos`
--
ALTER TABLE `grupos`
  ADD PRIMARY KEY (`idGrupo`),
  ADD KEY `idInstitucion` (`idInstitucion`),
  ADD KEY `idNivelAcademico` (`idNivelAcademico`);

--
-- Indexes for table `gruposaspirantes`
--
ALTER TABLE `gruposaspirantes`
  ADD PRIMARY KEY (`idGrupo`,`idAspirante`),
  ADD KEY `idAspirante` (`idAspirante`);

--
-- Indexes for table `grupospruebas`
--
ALTER TABLE `grupospruebas`
  ADD PRIMARY KEY (`idGrupo`,`idPrueba`),
  ADD KEY `idPrueba` (`idPrueba`);

--
-- Indexes for table `institucion`
--
ALTER TABLE `institucion`
  ADD PRIMARY KEY (`idInstitucion`),
  ADD KEY `idTipoInstitucion` (`idTipoInstitucion`);

--
-- Indexes for table `nivelacademico`
--
ALTER TABLE `nivelacademico`
  ADD PRIMARY KEY (`idNivelAcademico`);

--
-- Indexes for table `opciones16pf`
--
ALTER TABLE `opciones16pf`
  ADD PRIMARY KEY (`idOpcion16PF`),
  ADD KEY `idPregunta16PF` (`idPregunta16PF`);

--
-- Indexes for table `opcioneskostick`
--
ALTER TABLE `opcioneskostick`
  ADD PRIMARY KEY (`idOpcionKostick`),
  ADD KEY `idPreguntaKostick` (`idPreguntaKostick`);

--
-- Indexes for table `opcionesotis`
--
ALTER TABLE `opcionesotis`
  ADD PRIMARY KEY (`idOpcionOtis`),
  ADD KEY `idPreguntaOtis` (`idPreguntaOtis`);

--
-- Indexes for table `opcionesterman`
--
ALTER TABLE `opcionesterman`
  ADD PRIMARY KEY (`idOpcionTerman`),
  ADD KEY `idPreguntaTerman` (`idPreguntaTerman`);

--
-- Indexes for table `otp`
--
ALTER TABLE `otp`
  ADD PRIMARY KEY (`idOTP`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indexes for table `paises`
--
ALTER TABLE `paises`
  ADD PRIMARY KEY (`idPais`);

--
-- Indexes for table `preguntas16pf`
--
ALTER TABLE `preguntas16pf`
  ADD PRIMARY KEY (`idPregunta16PF`),
  ADD KEY `idPrueba` (`idPrueba`);

--
-- Indexes for table `preguntasformatoentrevista`
--
ALTER TABLE `preguntasformatoentrevista`
  ADD PRIMARY KEY (`idPreguntaFormatoEntrevista`);

--
-- Indexes for table `preguntashartman`
--
ALTER TABLE `preguntashartman`
  ADD PRIMARY KEY (`idPreguntaHartman`),
  ADD KEY `idPrueba` (`idPrueba`);

--
-- Indexes for table `preguntaskostick`
--
ALTER TABLE `preguntaskostick`
  ADD PRIMARY KEY (`idPreguntaKostick`),
  ADD KEY `idPrueba` (`idPrueba`);

--
-- Indexes for table `preguntasotis`
--
ALTER TABLE `preguntasotis`
  ADD PRIMARY KEY (`idPreguntaOtis`),
  ADD KEY `idPrueba` (`idPrueba`),
  ADD KEY `fk_PO_A` (`idAreaOtis`);

--
-- Indexes for table `preguntasterman`
--
ALTER TABLE `preguntasterman`
  ADD PRIMARY KEY (`idPreguntaTerman`),
  ADD KEY `idSerieTerman` (`idSerieTerman`);

--
-- Indexes for table `privilegios`
--
ALTER TABLE `privilegios`
  ADD PRIMARY KEY (`idPrivilegio`);

--
-- Indexes for table `pruebas`
--
ALTER TABLE `pruebas`
  ADD PRIMARY KEY (`idPrueba`);

--
-- Indexes for table `respuestaotisaspirante`
--
ALTER TABLE `respuestaotisaspirante`
  ADD PRIMARY KEY (`idRespuestaOtis`),
  ADD KEY `idAspirante` (`idAspirante`),
  ADD KEY `idPreguntaOtis` (`idPreguntaOtis`),
  ADD KEY `idOpcionOtis` (`idOpcionOtis`),
  ADD KEY `idPrueba` (`idPrueba`),
  ADD KEY `idGrupo` (`idGrupo`);

--
-- Indexes for table `respuestas16pfaspirante`
--
ALTER TABLE `respuestas16pfaspirante`
  ADD PRIMARY KEY (`idRespuesta16PF`),
  ADD KEY `idAspirante` (`idAspirante`),
  ADD KEY `idGrupo` (`idGrupo`),
  ADD KEY `idPregunta16PF` (`idPregunta16PF`),
  ADD KEY `idOpcion16PF` (`idOpcion16PF`),
  ADD KEY `idPrueba` (`idPrueba`);

--
-- Indexes for table `respuestashartmanaspirante`
--
ALTER TABLE `respuestashartmanaspirante`
  ADD PRIMARY KEY (`idRespuestaHartman`),
  ADD KEY `idAspirante` (`idAspirante`),
  ADD KEY `idGrupo` (`idGrupo`),
  ADD KEY `idPreguntaHartman` (`idPreguntaHartman`),
  ADD KEY `idPrueba` (`idPrueba`);

--
-- Indexes for table `respuestaskostickaspirante`
--
ALTER TABLE `respuestaskostickaspirante`
  ADD PRIMARY KEY (`idRespuestaKostick`),
  ADD KEY `idAspirante` (`idAspirante`),
  ADD KEY `idGrupo` (`idGrupo`),
  ADD KEY `idPreguntaKostick` (`idPreguntaKostick`),
  ADD KEY `idOpcionKostick` (`idOpcionKostick`),
  ADD KEY `idPrueba` (`idPrueba`);

--
-- Indexes for table `respuestastermanaspirante`
--
ALTER TABLE `respuestastermanaspirante`
  ADD PRIMARY KEY (`idRespuestaTerman`),
  ADD KEY `idAspirante` (`idAspirante`),
  ADD KEY `idGrupo` (`idGrupo`),
  ADD KEY `idPreguntaTerman` (`idPreguntaTerman`),
  ADD KEY `idPrueba` (`idPrueba`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`idRol`);

--
-- Indexes for table `rolesprivilegios`
--
ALTER TABLE `rolesprivilegios`
  ADD PRIMARY KEY (`idRol`,`idPrivilegio`),
  ADD KEY `idPrivilegio` (`idPrivilegio`);

--
-- Indexes for table `seleccionescolores`
--
ALTER TABLE `seleccionescolores`
  ADD PRIMARY KEY (`idSeleccionColores`),
  ADD KEY `idPrueba` (`idPrueba`),
  ADD KEY `idAspirante` (`idAspirante`),
  ADD KEY `idColor` (`idColor`),
  ADD KEY `idGrupo` (`idGrupo`);

--
-- Indexes for table `seriesterman`
--
ALTER TABLE `seriesterman`
  ADD PRIMARY KEY (`idSerieTerman`),
  ADD KEY `idPrueba` (`idPrueba`);

--
-- Indexes for table `tipoinstitucion`
--
ALTER TABLE `tipoinstitucion`
  ADD PRIMARY KEY (`idTipoInstitucion`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `idRol` (`idRol`),
  ADD KEY `usuario` (`usuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `areasotis`
--
ALTER TABLE `areasotis`
  MODIFY `idAreaOtis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `colores`
--
ALTER TABLE `colores`
  MODIFY `idColor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `estadocivil`
--
ALTER TABLE `estadocivil`
  MODIFY `idEstadoCivil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `estados`
--
ALTER TABLE `estados`
  MODIFY `idEstado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `estatusprueba`
--
ALTER TABLE `estatusprueba`
  MODIFY `idEstatus` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `generos`
--
ALTER TABLE `generos`
  MODIFY `idGenero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `nivelacademico`
--
ALTER TABLE `nivelacademico`
  MODIFY `idNivelAcademico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `otp`
--
ALTER TABLE `otp`
  MODIFY `idOTP` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `paises`
--
ALTER TABLE `paises`
  MODIFY `idPais` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `preguntasformatoentrevista`
--
ALTER TABLE `preguntasformatoentrevista`
  MODIFY `idPreguntaFormatoEntrevista` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;

--
-- AUTO_INCREMENT for table `privilegios`
--
ALTER TABLE `privilegios`
  MODIFY `idPrivilegio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `pruebas`
--
ALTER TABLE `pruebas`
  MODIFY `idPrueba` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `idRol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `seriesterman`
--
ALTER TABLE `seriesterman`
  MODIFY `idSerieTerman` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tipoinstitucion`
--
ALTER TABLE `tipoinstitucion`
  MODIFY `idTipoInstitucion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `aspirantes`
--
ALTER TABLE `aspirantes`
  ADD CONSTRAINT `aspirantes_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`),
  ADD CONSTRAINT `aspirantes_ibfk_2` FOREIGN KEY (`idPais`) REFERENCES `paises` (`idPais`),
  ADD CONSTRAINT `aspirantes_ibfk_3` FOREIGN KEY (`idEstado`) REFERENCES `estados` (`idEstado`);

--
-- Constraints for table `aspirantesgrupospruebas`
--
ALTER TABLE `aspirantesgrupospruebas`
  ADD CONSTRAINT `aspirantesgrupospruebas_ibfk_1` FOREIGN KEY (`idGrupo`) REFERENCES `grupos` (`idGrupo`),
  ADD CONSTRAINT `aspirantesgrupospruebas_ibfk_2` FOREIGN KEY (`idPrueba`) REFERENCES `pruebas` (`idPrueba`),
  ADD CONSTRAINT `aspirantesgrupospruebas_ibfk_3` FOREIGN KEY (`idAspirante`) REFERENCES `aspirantes` (`idAspirante`),
  ADD CONSTRAINT `aspirantesgrupospruebas_ibfk_4` FOREIGN KEY (`idEstatus`) REFERENCES `estatusprueba` (`idEstatus`);

--
-- Constraints for table `aspirantespreguntasformatoentrevista`
--
ALTER TABLE `aspirantespreguntasformatoentrevista`
  ADD CONSTRAINT `aspirantespreguntasformatoentrevista_ibfk_1` FOREIGN KEY (`idAspirante`) REFERENCES `aspirantes` (`idAspirante`),
  ADD CONSTRAINT `aspirantespreguntasformatoentrevista_ibfk_2` FOREIGN KEY (`idPreguntaFormatoEntrevista`) REFERENCES `preguntasformatoentrevista` (`idPreguntaFormatoEntrevista`);

--
-- Constraints for table `datospersonales`
--
ALTER TABLE `datospersonales`
  ADD CONSTRAINT `datospersonales_ibfk_1` FOREIGN KEY (`idGrupo`) REFERENCES `grupos` (`idGrupo`),
  ADD CONSTRAINT `datospersonales_ibfk_2` FOREIGN KEY (`idPrueba`) REFERENCES `pruebas` (`idPrueba`),
  ADD CONSTRAINT `datospersonales_ibfk_3` FOREIGN KEY (`idAspirante`) REFERENCES `aspirantes` (`idAspirante`);

--
-- Constraints for table `familiares`
--
ALTER TABLE `familiares`
  ADD CONSTRAINT `familiares_ibfk_1` FOREIGN KEY (`idGenero`) REFERENCES `generos` (`idGenero`),
  ADD CONSTRAINT `familiares_ibfk_2` FOREIGN KEY (`idEstadoCivil`) REFERENCES `estadocivil` (`idEstadoCivil`),
  ADD CONSTRAINT `familiares_ibfk_3` FOREIGN KEY (`idAspirante`) REFERENCES `aspirantes` (`idAspirante`),
  ADD CONSTRAINT `familiares_ibfk_4` FOREIGN KEY (`hijoDe`) REFERENCES `familiares` (`idFamiliar`);

--
-- Constraints for table `grupos`
--
ALTER TABLE `grupos`
  ADD CONSTRAINT `grupos_ibfk_1` FOREIGN KEY (`idInstitucion`) REFERENCES `institucion` (`idInstitucion`),
  ADD CONSTRAINT `grupos_ibfk_2` FOREIGN KEY (`idNivelAcademico`) REFERENCES `nivelacademico` (`idNivelAcademico`);

--
-- Constraints for table `gruposaspirantes`
--
ALTER TABLE `gruposaspirantes`
  ADD CONSTRAINT `gruposaspirantes_ibfk_1` FOREIGN KEY (`idGrupo`) REFERENCES `grupos` (`idGrupo`),
  ADD CONSTRAINT `gruposaspirantes_ibfk_2` FOREIGN KEY (`idAspirante`) REFERENCES `aspirantes` (`idAspirante`);

--
-- Constraints for table `grupospruebas`
--
ALTER TABLE `grupospruebas`
  ADD CONSTRAINT `grupospruebas_ibfk_1` FOREIGN KEY (`idGrupo`) REFERENCES `grupos` (`idGrupo`),
  ADD CONSTRAINT `grupospruebas_ibfk_2` FOREIGN KEY (`idPrueba`) REFERENCES `pruebas` (`idPrueba`);

--
-- Constraints for table `institucion`
--
ALTER TABLE `institucion`
  ADD CONSTRAINT `institucion_ibfk_1` FOREIGN KEY (`idTipoInstitucion`) REFERENCES `tipoinstitucion` (`idTipoInstitucion`);

--
-- Constraints for table `opciones16pf`
--
ALTER TABLE `opciones16pf`
  ADD CONSTRAINT `opciones16pf_ibfk_1` FOREIGN KEY (`idPregunta16PF`) REFERENCES `preguntas16pf` (`idPregunta16PF`);

--
-- Constraints for table `opcioneskostick`
--
ALTER TABLE `opcioneskostick`
  ADD CONSTRAINT `opcioneskostick_ibfk_1` FOREIGN KEY (`idPreguntaKostick`) REFERENCES `preguntaskostick` (`idPreguntaKostick`);

--
-- Constraints for table `opcionesotis`
--
ALTER TABLE `opcionesotis`
  ADD CONSTRAINT `opcionesotis_ibfk_1` FOREIGN KEY (`idPreguntaOtis`) REFERENCES `preguntasotis` (`idPreguntaOtis`);

--
-- Constraints for table `opcionesterman`
--
ALTER TABLE `opcionesterman`
  ADD CONSTRAINT `opcionesterman_ibfk_1` FOREIGN KEY (`idPreguntaTerman`) REFERENCES `preguntasterman` (`idPreguntaTerman`);

--
-- Constraints for table `otp`
--
ALTER TABLE `otp`
  ADD CONSTRAINT `otp_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`);

--
-- Constraints for table `preguntas16pf`
--
ALTER TABLE `preguntas16pf`
  ADD CONSTRAINT `preguntas16pf_ibfk_1` FOREIGN KEY (`idPrueba`) REFERENCES `pruebas` (`idPrueba`);

--
-- Constraints for table `preguntashartman`
--
ALTER TABLE `preguntashartman`
  ADD CONSTRAINT `preguntashartman_ibfk_1` FOREIGN KEY (`idPrueba`) REFERENCES `pruebas` (`idPrueba`);

--
-- Constraints for table `preguntaskostick`
--
ALTER TABLE `preguntaskostick`
  ADD CONSTRAINT `preguntaskostick_ibfk_1` FOREIGN KEY (`idPrueba`) REFERENCES `pruebas` (`idPrueba`);

--
-- Constraints for table `preguntasotis`
--
ALTER TABLE `preguntasotis`
  ADD CONSTRAINT `fk_PO_A` FOREIGN KEY (`idAreaOtis`) REFERENCES `areasotis` (`idAreaOtis`),
  ADD CONSTRAINT `preguntasotis_ibfk_1` FOREIGN KEY (`idPrueba`) REFERENCES `pruebas` (`idPrueba`);

--
-- Constraints for table `preguntasterman`
--
ALTER TABLE `preguntasterman`
  ADD CONSTRAINT `preguntasterman_ibfk_1` FOREIGN KEY (`idSerieTerman`) REFERENCES `seriesterman` (`idSerieTerman`);

--
-- Constraints for table `respuestaotisaspirante`
--
ALTER TABLE `respuestaotisaspirante`
  ADD CONSTRAINT `respuestaotisaspirante_ibfk_1` FOREIGN KEY (`idAspirante`) REFERENCES `aspirantes` (`idAspirante`),
  ADD CONSTRAINT `respuestaotisaspirante_ibfk_2` FOREIGN KEY (`idPreguntaOtis`) REFERENCES `preguntasotis` (`idPreguntaOtis`),
  ADD CONSTRAINT `respuestaotisaspirante_ibfk_3` FOREIGN KEY (`idOpcionOtis`) REFERENCES `opcionesotis` (`idOpcionOtis`),
  ADD CONSTRAINT `respuestaotisaspirante_ibfk_4` FOREIGN KEY (`idPrueba`) REFERENCES `pruebas` (`idPrueba`),
  ADD CONSTRAINT `respuestaotisaspirante_ibfk_5` FOREIGN KEY (`idGrupo`) REFERENCES `grupos` (`idGrupo`);

--
-- Constraints for table `respuestas16pfaspirante`
--
ALTER TABLE `respuestas16pfaspirante`
  ADD CONSTRAINT `respuestas16pfaspirante_ibfk_1` FOREIGN KEY (`idAspirante`) REFERENCES `aspirantes` (`idAspirante`),
  ADD CONSTRAINT `respuestas16pfaspirante_ibfk_2` FOREIGN KEY (`idGrupo`) REFERENCES `grupos` (`idGrupo`),
  ADD CONSTRAINT `respuestas16pfaspirante_ibfk_3` FOREIGN KEY (`idPregunta16PF`) REFERENCES `preguntas16pf` (`idPregunta16PF`),
  ADD CONSTRAINT `respuestas16pfaspirante_ibfk_4` FOREIGN KEY (`idOpcion16PF`) REFERENCES `opciones16pf` (`idOpcion16PF`),
  ADD CONSTRAINT `respuestas16pfaspirante_ibfk_5` FOREIGN KEY (`idPrueba`) REFERENCES `pruebas` (`idPrueba`);

--
-- Constraints for table `respuestashartmanaspirante`
--
ALTER TABLE `respuestashartmanaspirante`
  ADD CONSTRAINT `respuestashartmanaspirante_ibfk_1` FOREIGN KEY (`idAspirante`) REFERENCES `aspirantes` (`idAspirante`),
  ADD CONSTRAINT `respuestashartmanaspirante_ibfk_2` FOREIGN KEY (`idGrupo`) REFERENCES `grupos` (`idGrupo`),
  ADD CONSTRAINT `respuestashartmanaspirante_ibfk_3` FOREIGN KEY (`idPreguntaHartman`) REFERENCES `preguntashartman` (`idPreguntaHartman`),
  ADD CONSTRAINT `respuestashartmanaspirante_ibfk_4` FOREIGN KEY (`idPrueba`) REFERENCES `pruebas` (`idPrueba`);

--
-- Constraints for table `respuestaskostickaspirante`
--
ALTER TABLE `respuestaskostickaspirante`
  ADD CONSTRAINT `respuestaskostickaspirante_ibfk_1` FOREIGN KEY (`idAspirante`) REFERENCES `aspirantes` (`idAspirante`),
  ADD CONSTRAINT `respuestaskostickaspirante_ibfk_2` FOREIGN KEY (`idGrupo`) REFERENCES `grupos` (`idGrupo`),
  ADD CONSTRAINT `respuestaskostickaspirante_ibfk_3` FOREIGN KEY (`idPreguntaKostick`) REFERENCES `preguntaskostick` (`idPreguntaKostick`),
  ADD CONSTRAINT `respuestaskostickaspirante_ibfk_4` FOREIGN KEY (`idOpcionKostick`) REFERENCES `opcioneskostick` (`idOpcionKostick`),
  ADD CONSTRAINT `respuestaskostickaspirante_ibfk_5` FOREIGN KEY (`idPrueba`) REFERENCES `pruebas` (`idPrueba`);

--
-- Constraints for table `respuestastermanaspirante`
--
ALTER TABLE `respuestastermanaspirante`
  ADD CONSTRAINT `respuestastermanaspirante_ibfk_1` FOREIGN KEY (`idAspirante`) REFERENCES `aspirantes` (`idAspirante`),
  ADD CONSTRAINT `respuestastermanaspirante_ibfk_2` FOREIGN KEY (`idGrupo`) REFERENCES `grupos` (`idGrupo`),
  ADD CONSTRAINT `respuestastermanaspirante_ibfk_3` FOREIGN KEY (`idPreguntaTerman`) REFERENCES `preguntasterman` (`idPreguntaTerman`),
  ADD CONSTRAINT `respuestastermanaspirante_ibfk_4` FOREIGN KEY (`idPrueba`) REFERENCES `pruebas` (`idPrueba`);

--
-- Constraints for table `rolesprivilegios`
--
ALTER TABLE `rolesprivilegios`
  ADD CONSTRAINT `rolesprivilegios_ibfk_1` FOREIGN KEY (`idRol`) REFERENCES `roles` (`idRol`),
  ADD CONSTRAINT `rolesprivilegios_ibfk_2` FOREIGN KEY (`idPrivilegio`) REFERENCES `privilegios` (`idPrivilegio`);

--
-- Constraints for table `seleccionescolores`
--
ALTER TABLE `seleccionescolores`
  ADD CONSTRAINT `seleccionescolores_ibfk_1` FOREIGN KEY (`idPrueba`) REFERENCES `pruebas` (`idPrueba`),
  ADD CONSTRAINT `seleccionescolores_ibfk_2` FOREIGN KEY (`idAspirante`) REFERENCES `aspirantes` (`idAspirante`),
  ADD CONSTRAINT `seleccionescolores_ibfk_3` FOREIGN KEY (`idColor`) REFERENCES `colores` (`idColor`),
  ADD CONSTRAINT `seleccionescolores_ibfk_4` FOREIGN KEY (`idGrupo`) REFERENCES `grupos` (`idGrupo`);

--
-- Constraints for table `seriesterman`
--
ALTER TABLE `seriesterman`
  ADD CONSTRAINT `seriesterman_ibfk_1` FOREIGN KEY (`idPrueba`) REFERENCES `pruebas` (`idPrueba`);

--
-- Constraints for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`idRol`) REFERENCES `roles` (`idRol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
