-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-08-2020 a las 00:01:37
-- Versión del servidor: 10.4.13-MariaDB
-- Versión de PHP: 7.2.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `riesgos_bd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividad`
--

CREATE TABLE `actividad` (
  `actividad_id` varchar(45) CHARACTER SET utf8 NOT NULL,
  `actividad_uuid` int(11) NOT NULL,
  `actividad_nombre` varchar(100) NOT NULL,
  `actividad_level` int(11) DEFAULT NULL,
  `actividad_wbs` varchar(100) DEFAULT NULL,
  `proyecto_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `categoria_id` int(11) NOT NULL,
  `categoria_nombre` varchar(45) DEFAULT NULL,
  `categoria_descripcion` tinytext DEFAULT NULL,
  `categoria_default` tinyint(4) NOT NULL DEFAULT 1,
  `categoria_uid` bigint(20) UNSIGNED DEFAULT NULL,
  `rbs_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`categoria_id`, `categoria_nombre`, `categoria_descripcion`, `categoria_default`, `categoria_uid`, `rbs_id`) VALUES
(9, 'Riesgo técnico', '', 0, 98872370386698268, 6),
(10, 'Riesgo de gestión', '', 0, 98872370386698275, 6),
(11, 'Riesgo comercial', '', 0, 98872370386698282, 6),
(12, 'Riesgo externo', '', 0, 98872370386698289, 6),
(13, 'Riesgo comercial', NULL, 1, 98872370386698296, 6),
(15, 'Riesgo técnico', '', 0, 98873742091878402, 8),
(16, 'Riesgo de gestión', '', 0, 98873742091878409, 8),
(17, 'Riesgo comercial', '', 0, 98873742091878416, 8),
(18, 'Riesgo externo', '', 0, 98873742091878423, 8),
(19, 'Riesgo técnico', '', 0, 98875189428748288, 9),
(20, 'Riesgo de gestión', '', 0, 98875189428748295, 9),
(21, 'Riesgo comercial', '', 0, 98875189428748302, 9),
(22, 'Riesgo externo', '', 0, 98875189428748309, 9);

--
-- Disparadores `categoria`
--
DELIMITER $$
CREATE TRIGGER `Agregar sub categorías por defecto` AFTER INSERT ON `categoria` FOR EACH ROW IF (new.categoria_default = 0) THEN

	IF (new.categoria_nombre = 'Riesgo técnico') THEN

#Riesgo técnico

INSERT INTO `sub_categoria`(`sub_categoria_nombre`, `sub_categoria_descripcion`, `sub_categoria_default`, `categoria_id`) 

VALUES 

('Definición del alcance','', 0, new.categoria_id),

('Definición de los requisitos','', 0, new.categoria_id),

('Estimaciones, supuestos y restricciones','', 0, new.categoria_id),

('Procesos técnicos','', 0, new.categoria_id),

('Tecnología','', 0, new.categoria_id),

('Interfaces técnicas','', 0, new.categoria_id);

ELSEIF (new.categoria_nombre = 'Riesgo de gestión') THEN

#Riesgo de gestión

INSERT INTO `sub_categoria`(`sub_categoria_nombre`, `sub_categoria_descripcion`, `sub_categoria_default`, `categoria_id`) 

VALUES 

('Dirección de proyectos','', 0, new.categoria_id),

('Dirección del programa/portafolio','', 0, new.categoria_id),

('Gestión de las operaciones','', 0, new.categoria_id),

('Organización','', 0, new.categoria_id),

('Dotación de recursos','', 0, new.categoria_id),

('Comunicación','', 0, new.categoria_id);

ELSEIF (new.categoria_nombre = 'Riesgo comercial') THEN

#Riesgo comercial

INSERT INTO `sub_categoria`(`sub_categoria_nombre`, `sub_categoria_descripcion`, `sub_categoria_default`, `categoria_id`) 

VALUES 

('Términos y condiciones contractuales','', 0, new.categoria_id),

('Contratación interna','', 0, new.categoria_id),

('Proveedores y vendedores','', 0, new.categoria_id),

('Subcontratos','', 0, new.categoria_id),

('Estabilidad de los clientes','', 0, new.categoria_id),

('Asociaciones y empresas conjuntas','', 0, new.categoria_id);

ELSEIF (new.categoria_nombre = 'Riesgo externo') THEN

#Riesgo externo

INSERT INTO `sub_categoria`(`sub_categoria_nombre`, `sub_categoria_descripcion`, `sub_categoria_default`, `categoria_id`) 

VALUES 

('Legislación','', 0, new.categoria_id),

('Tasas de cambio','', 0, new.categoria_id),

('Sitios/Instalaciones','', 0, new.categoria_id),

('Ambiental/clima','', 0, new.categoria_id),

('Competencia','', 0, new.categoria_id),

('Normativo','', 0, new.categoria_id);

 END IF;
 END IF
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Agregar uuid categoria` BEFORE INSERT ON `categoria` FOR EACH ROW SET NEW.categoria_uid = (SELECT uuid_short())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gerente`
--

CREATE TABLE `gerente` (
  `gerente_id` int(11) NOT NULL,
  `gerente_nombre` varchar(100) DEFAULT NULL,
  `gerente_usuario` varchar(45) NOT NULL,
  `gerente_correo` varchar(100) DEFAULT NULL,
  `gerente_fecha_creacion` datetime DEFAULT current_timestamp(),
  `gerente_correo_institucional` varchar(100) DEFAULT NULL,
  `gerente_profesion` varchar(100) DEFAULT NULL,
  `gerente_empresa` varchar(100) DEFAULT NULL,
  `gerente_metodologias` tinytext DEFAULT NULL,
  `gerente_certificaciones` tinytext DEFAULT NULL,
  `sector_id` int(11) NOT NULL,
  `pais_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `gerente`
--

INSERT INTO `gerente` (`gerente_id`, `gerente_nombre`, `gerente_usuario`, `gerente_correo`, `gerente_fecha_creacion`, `gerente_correo_institucional`, `gerente_profesion`, `gerente_empresa`, `gerente_metodologias`, `gerente_certificaciones`, `sector_id`, `pais_id`) VALUES
(24, NULL, 'user', NULL, '2020-08-24 12:10:16', NULL, NULL, NULL, NULL, NULL, 12, 44),
(28, 'fdg', 'ppp', 'pppq@fdf.com', NULL, NULL, 'ppp', 'ppp', NULL, NULL, 10, 17),
(29, 'nnn', 'nnn', 'nnn@nnn.com', NULL, NULL, 'nnnn', 'nnn', NULL, NULL, 9, 15),
(31, 'rrr', 'rrr', 'rr@rr.com', NULL, NULL, 'rr', 'rr', NULL, NULL, 9, 9),
(32, 'www', 'www', 'ww@ww.com', NULL, NULL, 'ww', 'ww', NULL, NULL, 9, 16);

--
-- Disparadores `gerente`
--
DELIMITER $$
CREATE TRIGGER `agregar tipos de recurso` AFTER INSERT ON `gerente` FOR EACH ROW INSERT INTO `tipo_recurso`(`tipo_recurso_nombre`, `tipo_recurso_descripcion`, `gerente_id`) 
VALUES ('Material', 'Este tipo de recurso se refiere a los suministros, materiales y cualquier otro consumible necesario para completar las tareas.', New.gerente_id),('Trabajo', 'Se trata de los miembros de tu equipo de trabajo. La dedicación de cada individuo se mide en horas de trabajo.',New.gerente_id),('Costo', 'Este tipo de recurso implica un gasto para el proyecto, pero no dependen del trabajo o la duración de una tarea. Pueden tratarse de gastos de representación (comidas, viajes…).', New.gerente_id)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE `pais` (
  `pais_id` int(11) NOT NULL,
  `pais_nombre` varchar(100) DEFAULT NULL,
  `pais_name` varchar(100) NOT NULL,
  `pais_nom` varchar(100) NOT NULL,
  `pais_iso_2` varchar(45) DEFAULT NULL,
  `pais_iso_3` varchar(45) DEFAULT NULL,
  `pais_phone_code` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pais`
--

INSERT INTO `pais` (`pais_id`, `pais_nombre`, `pais_name`, `pais_nom`, `pais_iso_2`, `pais_iso_3`, `pais_phone_code`) VALUES
(1, 'Afganistán', 'Afghanistan', 'Afghanistan', 'AF', 'AFG', '93'),
(2, 'Albania', 'Albania', 'Albanie', 'AL', 'ALB', '355'),
(3, 'Alemania', 'Germany', 'Allemagne', 'DE', 'DEU', '49'),
(4, 'Andorra', 'Andorra', 'Andorra', 'AD', 'AND', '376'),
(5, 'Angola', 'Angola', 'Angola', 'AO', 'AGO', '244'),
(6, 'Anguila', 'Anguilla', 'Anguilla', 'AI', 'AIA', '1 264'),
(7, 'Antártida', 'Antarctica', 'L\'Antarctique', 'AQ', 'ATA', '672'),
(8, 'Antigua y Barbuda', 'Antigua and Barbuda', 'Antigua et Barbuda', 'AG', 'ATG', '1 268'),
(9, 'Arabia Saudita', 'Saudi Arabia', 'Arabie Saoudite', 'SA', 'SAU', '966'),
(10, 'Argelia', 'Algeria', 'Algérie', 'DZ', 'DZA', '213'),
(11, 'Argentina', 'Argentina', 'Argentine', 'AR', 'ARG', '54'),
(12, 'Armenia', 'Armenia', 'L\'Arménie', 'AM', 'ARM', '374'),
(13, 'Aruba', 'Aruba', 'Aruba', 'AW', 'ABW', '297'),
(14, 'Australia', 'Australia', 'Australie', 'AU', 'AUS', '61'),
(15, 'Austria', 'Austria', 'Autriche', 'AT', 'AUT', '43'),
(16, 'Azerbaiyán', 'Azerbaijan', 'L\'Azerbaïdjan', 'AZ', 'AZE', '994'),
(17, 'Bélgica', 'Belgium', 'Belgique', 'BE', 'BEL', '32'),
(18, 'Bahamas', 'Bahamas', 'Bahamas', 'BS', 'BHS', '1 242'),
(19, 'Bahrein', 'Bahrain', 'Bahreïn', 'BH', 'BHR', '973'),
(20, 'Bangladesh', 'Bangladesh', 'Bangladesh', 'BD', 'BGD', '880'),
(21, 'Barbados', 'Barbados', 'Barbade', 'BB', 'BRB', '1 246'),
(22, 'Belice', 'Belize', 'Belize', 'BZ', 'BLZ', '501'),
(23, 'Benín', 'Benin', 'Bénin', 'BJ', 'BEN', '229'),
(24, 'Bhután', 'Bhutan', 'Le Bhoutan', 'BT', 'BTN', '975'),
(25, 'Bielorrusia', 'Belarus', 'Biélorussie', 'BY', 'BLR', '375'),
(26, 'Birmania', 'Myanmar', 'Myanmar', 'MM', 'MMR', '95'),
(27, 'Bolivia', 'Bolivia', 'Bolivie', 'BO', 'BOL', '591'),
(28, 'Bosnia y Herzegovina', 'Bosnia and Herzegovina', 'Bosnie-Herzégovine', 'BA', 'BIH', '387'),
(29, 'Botsuana', 'Botswana', 'Botswana', 'BW', 'BWA', '267'),
(30, 'Brasil', 'Brazil', 'Brésil', 'BR', 'BRA', '55'),
(31, 'Brunéi', 'Brunei', 'Brunei', 'BN', 'BRN', '673'),
(32, 'Bulgaria', 'Bulgaria', 'Bulgarie', 'BG', 'BGR', '359'),
(33, 'Burkina Faso', 'Burkina Faso', 'Burkina Faso', 'BF', 'BFA', '226'),
(34, 'Burundi', 'Burundi', 'Burundi', 'BI', 'BDI', '257'),
(35, 'Cabo Verde', 'Cape Verde', 'Cap-Vert', 'CV', 'CPV', '238'),
(36, 'Camboya', 'Cambodia', 'Cambodge', 'KH', 'KHM', '855'),
(37, 'Camerún', 'Cameroon', 'Cameroun', 'CM', 'CMR', '237'),
(38, 'Canadá', 'Canada', 'Canada', 'CA', 'CAN', '1'),
(39, 'Chad', 'Chad', 'Tchad', 'TD', 'TCD', '235'),
(40, 'Chile', 'Chile', 'Chili', 'CL', 'CHL', '56'),
(41, 'China', 'China', 'Chine', 'CN', 'CHN', '86'),
(42, 'Chipre', 'Cyprus', 'Chypre', 'CY', 'CYP', '357'),
(43, 'Ciudad del Vaticano', 'Vatican City State', 'Cité du Vatican', 'VA', 'VAT', '39'),
(44, 'Colombia', 'Colombia', 'Colombie', 'CO', 'COL', '57'),
(45, 'Comoras', 'Comoros', 'Comores', 'KM', 'COM', '269'),
(46, 'República del Congo', 'Republic of the Congo', 'République du Congo', 'CG', 'COG', '242'),
(47, 'República Democrática del Congo', 'Democratic Republic of the Congo', 'République démocratique du Congo', 'CD', 'COD', '243'),
(48, 'Corea del Norte', 'North Korea', 'Corée du Nord', 'KP', 'PRK', '850'),
(49, 'Corea del Sur', 'South Korea', 'Corée du Sud', 'KR', 'KOR', '82'),
(50, 'Costa de Marfil', 'Ivory Coast', 'Côte-d\'Ivoire', 'CI', 'CIV', '225'),
(51, 'Costa Rica', 'Costa Rica', 'Costa Rica', 'CR', 'CRI', '506'),
(52, 'Croacia', 'Croatia', 'Croatie', 'HR', 'HRV', '385'),
(53, 'Cuba', 'Cuba', 'Cuba', 'CU', 'CUB', '53'),
(54, 'Curazao', 'Curaçao', 'Curaçao', 'CW', 'CWU', '5999'),
(55, 'Dinamarca', 'Denmark', 'Danemark', 'DK', 'DNK', '45'),
(56, 'Dominica', 'Dominica', 'Dominique', 'DM', 'DMA', '1 767'),
(57, 'Ecuador', 'Ecuador', 'Equateur', 'EC', 'ECU', '593'),
(58, 'Egipto', 'Egypt', 'Egypte', 'EG', 'EGY', '20'),
(59, 'El Salvador', 'El Salvador', 'El Salvador', 'SV', 'SLV', '503'),
(60, 'Emiratos Árabes Unidos', 'United Arab Emirates', 'Emirats Arabes Unis', 'AE', 'ARE', '971'),
(61, 'Eritrea', 'Eritrea', 'Erythrée', 'ER', 'ERI', '291'),
(62, 'Eslovaquia', 'Slovakia', 'Slovaquie', 'SK', 'SVK', '421'),
(63, 'Eslovenia', 'Slovenia', 'Slovénie', 'SI', 'SVN', '386'),
(64, 'España', 'Spain', 'Espagne', 'ES', 'ESP', '34'),
(65, 'Estados Unidos de América', 'United States of America', 'États-Unis d\'Amérique', 'US', 'USA', '1'),
(66, 'Estonia', 'Estonia', 'L\'Estonie', 'EE', 'EST', '372'),
(67, 'Etiopía', 'Ethiopia', 'Ethiopie', 'ET', 'ETH', '251'),
(68, 'Filipinas', 'Philippines', 'Philippines', 'PH', 'PHL', '63'),
(69, 'Finlandia', 'Finland', 'Finlande', 'FI', 'FIN', '358'),
(70, 'Fiyi', 'Fiji', 'Fidji', 'FJ', 'FJI', '679'),
(71, 'Francia', 'France', 'France', 'FR', 'FRA', '33'),
(72, 'Gabón', 'Gabon', 'Gabon', 'GA', 'GAB', '241'),
(73, 'Gambia', 'Gambia', 'Gambie', 'GM', 'GMB', '220'),
(74, 'Georgia', 'Georgia', 'Géorgie', 'GE', 'GEO', '995'),
(75, 'Ghana', 'Ghana', 'Ghana', 'GH', 'GHA', '233'),
(76, 'Gibraltar', 'Gibraltar', 'Gibraltar', 'GI', 'GIB', '350'),
(77, 'Granada', 'Grenada', 'Grenade', 'GD', 'GRD', '1 473'),
(78, 'Grecia', 'Greece', 'Grèce', 'GR', 'GRC', '30'),
(79, 'Groenlandia', 'Greenland', 'Groenland', 'GL', 'GRL', '299'),
(80, 'Guadalupe', 'Guadeloupe', 'Guadeloupe', 'GP', 'GLP', '590'),
(81, 'Guam', 'Guam', 'Guam', 'GU', 'GUM', '1 671'),
(82, 'Guatemala', 'Guatemala', 'Guatemala', 'GT', 'GTM', '502'),
(83, 'Guayana Francesa', 'French Guiana', 'Guyane française', 'GF', 'GUF', '594'),
(84, 'Guernsey', 'Guernsey', 'Guernesey', 'GG', 'GGY', '44'),
(85, 'Guinea', 'Guinea', 'Guinée', 'GN', 'GIN', '224'),
(86, 'Guinea Ecuatorial', 'Equatorial Guinea', 'Guinée Equatoriale', 'GQ', 'GNQ', '240'),
(87, 'Guinea-Bissau', 'Guinea-Bissau', 'Guinée-Bissau', 'GW', 'GNB', '245'),
(88, 'Guyana', 'Guyana', 'Guyane', 'GY', 'GUY', '592'),
(89, 'Haití', 'Haiti', 'Haïti', 'HT', 'HTI', '509'),
(90, 'Honduras', 'Honduras', 'Honduras', 'HN', 'HND', '504'),
(91, 'Hong kong', 'Hong Kong', 'Hong Kong', 'HK', 'HKG', '852'),
(92, 'Hungría', 'Hungary', 'Hongrie', 'HU', 'HUN', '36'),
(93, 'India', 'India', 'Inde', 'IN', 'IND', '91'),
(94, 'Indonesia', 'Indonesia', 'Indonésie', 'ID', 'IDN', '62'),
(95, 'Irán', 'Iran', 'Iran', 'IR', 'IRN', '98'),
(96, 'Irak', 'Iraq', 'Irak', 'IQ', 'IRQ', '964'),
(97, 'Irlanda', 'Ireland', 'Irlande', 'IE', 'IRL', '353'),
(98, 'Isla Bouvet', 'Bouvet Island', 'Bouvet Island', 'BV', 'BVT', NULL),
(99, 'Isla de Man', 'Isle of Man', 'Ile de Man', 'IM', 'IMN', '44'),
(100, 'Isla de Navidad', 'Christmas Island', 'Christmas Island', 'CX', 'CXR', '61'),
(101, 'Isla Norfolk', 'Norfolk Island', 'Île de Norfolk', 'NF', 'NFK', '672'),
(102, 'Islandia', 'Iceland', 'Islande', 'IS', 'ISL', '354'),
(103, 'Islas Bermudas', 'Bermuda Islands', 'Bermudes', 'BM', 'BMU', '1 441'),
(104, 'Islas Caimán', 'Cayman Islands', 'Iles Caïmans', 'KY', 'CYM', '1 345'),
(105, 'Islas Cocos (Keeling)', 'Cocos (Keeling) Islands', 'Cocos (Keeling', 'CC', 'CCK', '61'),
(106, 'Islas Cook', 'Cook Islands', 'Iles Cook', 'CK', 'COK', '682'),
(107, 'Islas de Åland', 'Åland Islands', 'Îles Åland', 'AX', 'ALA', '358'),
(108, 'Islas Feroe', 'Faroe Islands', 'Iles Féro', 'FO', 'FRO', '298'),
(109, 'Islas Georgias del Sur y Sandwich del Sur', 'South Georgia and the South Sandwich Islands', 'Géorgie du Sud et les Îles Sandwich du Sud', 'GS', 'SGS', '500'),
(110, 'Islas Heard y McDonald', 'Heard Island and McDonald Islands', 'Les îles Heard et McDonald', 'HM', 'HMD', NULL),
(111, 'Islas Maldivas', 'Maldives', 'Maldives', 'MV', 'MDV', '960'),
(112, 'Islas Malvinas', 'Falkland Islands (Malvinas)', 'Iles Falkland (Malvinas', 'FK', 'FLK', '500'),
(113, 'Islas Marianas del Norte', 'Northern Mariana Islands', 'Iles Mariannes du Nord', 'MP', 'MNP', '1 670'),
(114, 'Islas Marshall', 'Marshall Islands', 'Iles Marshall', 'MH', 'MHL', '692'),
(115, 'Islas Pitcairn', 'Pitcairn Islands', 'Iles Pitcairn', 'PN', 'PCN', '870'),
(116, 'Islas Salomón', 'Solomon Islands', 'Iles Salomon', 'SB', 'SLB', '677'),
(117, 'Islas Turcas y Caicos', 'Turks and Caicos Islands', 'Iles Turques et Caïques', 'TC', 'TCA', '1 649'),
(118, 'Islas Ultramarinas Menores de Estados Unidos', 'United States Minor Outlying Islands', 'États-Unis Îles mineures éloignées', 'UM', 'UMI', '246'),
(119, 'Islas Vírgenes Británicas', 'Virgin Islands', 'Iles Vierges', 'VG', 'VGB', '1 284'),
(120, 'Islas Vírgenes de los Estados Unidos', 'United States Virgin Islands', 'Îles Vierges américaines', 'VI', 'VIR', '1 340'),
(121, 'Israel', 'Israel', 'Israël', 'IL', 'ISR', '972'),
(122, 'Italia', 'Italy', 'Italie', 'IT', 'ITA', '39'),
(123, 'Jamaica', 'Jamaica', 'Jamaïque', 'JM', 'JAM', '1 876'),
(124, 'Japón', 'Japan', 'Japon', 'JP', 'JPN', '81'),
(125, 'Jersey', 'Jersey', 'Maillot', 'JE', 'JEY', '44'),
(126, 'Jordania', 'Jordan', 'Jordan', 'JO', 'JOR', '962'),
(127, 'Kazajistán', 'Kazakhstan', 'Le Kazakhstan', 'KZ', 'KAZ', '7'),
(128, 'Kenia', 'Kenya', 'Kenya', 'KE', 'KEN', '254'),
(129, 'Kirguistán', 'Kyrgyzstan', 'Kirghizstan', 'KG', 'KGZ', '996'),
(130, 'Kiribati', 'Kiribati', 'Kiribati', 'KI', 'KIR', '686'),
(131, 'Kuwait', 'Kuwait', 'Koweït', 'KW', 'KWT', '965'),
(132, 'Líbano', 'Lebanon', 'Liban', 'LB', 'LBN', '961'),
(133, 'Laos', 'Laos', 'Laos', 'LA', 'LAO', '856'),
(134, 'Lesoto', 'Lesotho', 'Lesotho', 'LS', 'LSO', '266'),
(135, 'Letonia', 'Latvia', 'La Lettonie', 'LV', 'LVA', '371'),
(136, 'Liberia', 'Liberia', 'Liberia', 'LR', 'LBR', '231'),
(137, 'Libia', 'Libya', 'Libye', 'LY', 'LBY', '218'),
(138, 'Liechtenstein', 'Liechtenstein', 'Liechtenstein', 'LI', 'LIE', '423'),
(139, 'Lituania', 'Lithuania', 'La Lituanie', 'LT', 'LTU', '370'),
(140, 'Luxemburgo', 'Luxembourg', 'Luxembourg', 'LU', 'LUX', '352'),
(141, 'México', 'Mexico', 'Mexique', 'MX', 'MEX', '52'),
(142, 'Mónaco', 'Monaco', 'Monaco', 'MC', 'MCO', '377'),
(143, 'Macao', 'Macao', 'Macao', 'MO', 'MAC', '853'),
(144, 'Macedônia', 'Macedonia', 'Macédoine', 'MK', 'MKD', '389'),
(145, 'Madagascar', 'Madagascar', 'Madagascar', 'MG', 'MDG', '261'),
(146, 'Malasia', 'Malaysia', 'Malaisie', 'MY', 'MYS', '60'),
(147, 'Malawi', 'Malawi', 'Malawi', 'MW', 'MWI', '265'),
(148, 'Mali', 'Mali', 'Mali', 'ML', 'MLI', '223'),
(149, 'Malta', 'Malta', 'Malte', 'MT', 'MLT', '356'),
(150, 'Marruecos', 'Morocco', 'Maroc', 'MA', 'MAR', '212'),
(151, 'Martinica', 'Martinique', 'Martinique', 'MQ', 'MTQ', '596'),
(152, 'Mauricio', 'Mauritius', 'Iles Maurice', 'MU', 'MUS', '230'),
(153, 'Mauritania', 'Mauritania', 'Mauritanie', 'MR', 'MRT', '222'),
(154, 'Mayotte', 'Mayotte', 'Mayotte', 'YT', 'MYT', '262'),
(155, 'Micronesia', 'Estados Federados de', 'Federados Estados de', 'FM', 'FSM', '691'),
(156, 'Moldavia', 'Moldova', 'Moldavie', 'MD', 'MDA', '373'),
(157, 'Mongolia', 'Mongolia', 'Mongolie', 'MN', 'MNG', '976'),
(158, 'Montenegro', 'Montenegro', 'Monténégro', 'ME', 'MNE', '382'),
(159, 'Montserrat', 'Montserrat', 'Montserrat', 'MS', 'MSR', '1 664'),
(160, 'Mozambique', 'Mozambique', 'Mozambique', 'MZ', 'MOZ', '258'),
(161, 'Namibia', 'Namibia', 'Namibie', 'NA', 'NAM', '264'),
(162, 'Nauru', 'Nauru', 'Nauru', 'NR', 'NRU', '674'),
(163, 'Nepal', 'Nepal', 'Népal', 'NP', 'NPL', '977'),
(164, 'Nicaragua', 'Nicaragua', 'Nicaragua', 'NI', 'NIC', '505'),
(165, 'Niger', 'Niger', 'Niger', 'NE', 'NER', '227'),
(166, 'Nigeria', 'Nigeria', 'Nigeria', 'NG', 'NGA', '234'),
(167, 'Niue', 'Niue', 'Niou', 'NU', 'NIU', '683'),
(168, 'Noruega', 'Norway', 'Norvège', 'NO', 'NOR', '47'),
(169, 'Nueva Caledonia', 'New Caledonia', 'Nouvelle-Calédonie', 'NC', 'NCL', '687'),
(170, 'Nueva Zelanda', 'New Zealand', 'Nouvelle-Zélande', 'NZ', 'NZL', '64'),
(171, 'Omán', 'Oman', 'Oman', 'OM', 'OMN', '968'),
(172, 'Países Bajos', 'Netherlands', 'Pays-Bas', 'NL', 'NLD', '31'),
(173, 'Pakistán', 'Pakistan', 'Pakistan', 'PK', 'PAK', '92'),
(174, 'Palau', 'Palau', 'Palau', 'PW', 'PLW', '680'),
(175, 'Palestina', 'Palestine', 'La Palestine', 'PS', 'PSE', '970'),
(176, 'Panamá', 'Panama', 'Panama', 'PA', 'PAN', '507'),
(177, 'Papúa Nueva Guinea', 'Papua New Guinea', 'Papouasie-Nouvelle-Guinée', 'PG', 'PNG', '675'),
(178, 'Paraguay', 'Paraguay', 'Paraguay', 'PY', 'PRY', '595'),
(179, 'Perú', 'Peru', 'Pérou', 'PE', 'PER', '51'),
(180, 'Polinesia Francesa', 'French Polynesia', 'Polynésie française', 'PF', 'PYF', '689'),
(181, 'Polonia', 'Poland', 'Pologne', 'PL', 'POL', '48'),
(182, 'Portugal', 'Portugal', 'Portugal', 'PT', 'PRT', '351'),
(183, 'Puerto Rico', 'Puerto Rico', 'Porto Rico', 'PR', 'PRI', '1'),
(184, 'Qatar', 'Qatar', 'Qatar', 'QA', 'QAT', '974'),
(185, 'Reino Unido', 'United Kingdom', 'Royaume-Uni', 'GB', 'GBR', '44'),
(186, 'República Centroafricana', 'Central African Republic', 'République Centrafricaine', 'CF', 'CAF', '236'),
(187, 'República Checa', 'Czech Republic', 'République Tchèque', 'CZ', 'CZE', '420'),
(188, 'República Dominicana', 'Dominican Republic', 'République Dominicaine', 'DO', 'DOM', '1 809'),
(189, 'República de Sudán del Sur', 'South Sudan', 'Soudan du Sud', 'SS', 'SSD', '211'),
(190, 'Reunión', 'Réunion', 'Réunion', 'RE', 'REU', '262'),
(191, 'Ruanda', 'Rwanda', 'Rwanda', 'RW', 'RWA', '250'),
(192, 'Rumanía', 'Romania', 'Roumanie', 'RO', 'ROU', '40'),
(193, 'Rusia', 'Russia', 'La Russie', 'RU', 'RUS', '7'),
(194, 'Sahara Occidental', 'Western Sahara', 'Sahara Occidental', 'EH', 'ESH', '212'),
(195, 'Samoa', 'Samoa', 'Samoa', 'WS', 'WSM', '685'),
(196, 'Samoa Americana', 'American Samoa', 'Les Samoa américaines', 'AS', 'ASM', '1 684'),
(197, 'San Bartolomé', 'Saint Barthélemy', 'Saint-Barthélemy', 'BL', 'BLM', '590'),
(198, 'San Cristóbal y Nieves', 'Saint Kitts and Nevis', 'Saint Kitts et Nevis', 'KN', 'KNA', '1 869'),
(199, 'San Marino', 'San Marino', 'San Marino', 'SM', 'SMR', '378'),
(200, 'San Martín (Francia)', 'Saint Martin (French part)', 'Saint-Martin (partie française)', 'MF', 'MAF', '1 599'),
(201, 'San Pedro y Miquelón', 'Saint Pierre and Miquelon', 'Saint-Pierre-et-Miquelon', 'PM', 'SPM', '508'),
(202, 'San Vicente y las Granadinas', 'Saint Vincent and the Grenadines', 'Saint-Vincent et Grenadines', 'VC', 'VCT', '1 784'),
(203, 'Santa Elena', 'Ascensión y Tristán de Acuña', 'Ascensión y Tristan de Acuña', 'SH', 'SHN', '290'),
(204, 'Santa Lucía', 'Saint Lucia', 'Sainte-Lucie', 'LC', 'LCA', '1 758'),
(205, 'Santo Tomé y Príncipe', 'Sao Tome and Principe', 'Sao Tomé et Principe', 'ST', 'STP', '239'),
(206, 'Senegal', 'Senegal', 'Sénégal', 'SN', 'SEN', '221'),
(207, 'Serbia', 'Serbia', 'Serbie', 'RS', 'SRB', '381'),
(208, 'Seychelles', 'Seychelles', 'Les Seychelles', 'SC', 'SYC', '248'),
(209, 'Sierra Leona', 'Sierra Leone', 'Sierra Leone', 'SL', 'SLE', '232'),
(210, 'Singapur', 'Singapore', 'Singapour', 'SG', 'SGP', '65'),
(211, 'Sint Maarten', 'Sint Maarten', 'Saint-Martin', 'SX', 'SMX', '1 721'),
(212, 'Siria', 'Syria', 'Syrie', 'SY', 'SYR', '963'),
(213, 'Somalia', 'Somalia', 'Somalie', 'SO', 'SOM', '252'),
(214, 'Sri lanka', 'Sri Lanka', 'Sri Lanka', 'LK', 'LKA', '94'),
(215, 'Sudáfrica', 'South Africa', 'Afrique du Sud', 'ZA', 'ZAF', '27'),
(216, 'Sudán', 'Sudan', 'Soudan', 'SD', 'SDN', '249'),
(217, 'Suecia', 'Sweden', 'Suède', 'SE', 'SWE', '46'),
(218, 'Suiza', 'Switzerland', 'Suisse', 'CH', 'CHE', '41'),
(219, 'Surinám', 'Suriname', 'Surinam', 'SR', 'SUR', '597'),
(220, 'Svalbard y Jan Mayen', 'Svalbard and Jan Mayen', 'Svalbard et Jan Mayen', 'SJ', 'SJM', '47'),
(221, 'Swazilandia', 'Swaziland', 'Swaziland', 'SZ', 'SWZ', '268'),
(222, 'Tayikistán', 'Tajikistan', 'Le Tadjikistan', 'TJ', 'TJK', '992'),
(223, 'Tailandia', 'Thailand', 'Thaïlande', 'TH', 'THA', '66'),
(224, 'Taiwán', 'Taiwan', 'Taiwan', 'TW', 'TWN', '886'),
(225, 'Tanzania', 'Tanzania', 'Tanzanie', 'TZ', 'TZA', '255'),
(226, 'Territorio Británico del Océano Índico', 'British Indian Ocean Territory', 'Territoire britannique de l\'océan Indien', 'IO', 'IOT', '246'),
(227, 'Territorios Australes y Antárticas Franceses', 'French Southern Territories', 'Terres australes françaises', 'TF', 'ATF', NULL),
(228, 'Timor Oriental', 'East Timor', 'Timor-Oriental', 'TL', 'TLS', '670'),
(229, 'Togo', 'Togo', 'Togo', 'TG', 'TGO', '228'),
(230, 'Tokelau', 'Tokelau', 'Tokélaou', 'TK', 'TKL', '690'),
(231, 'Tonga', 'Tonga', 'Tonga', 'TO', 'TON', '676'),
(232, 'Trinidad y Tobago', 'Trinidad and Tobago', 'Trinidad et Tobago', 'TT', 'TTO', '1 868'),
(233, 'Tunez', 'Tunisia', 'Tunisie', 'TN', 'TUN', '216'),
(234, 'Turkmenistán', 'Turkmenistan', 'Le Turkménistan', 'TM', 'TKM', '993'),
(235, 'Turquía', 'Turkey', 'Turquie', 'TR', 'TUR', '90'),
(236, 'Tuvalu', 'Tuvalu', 'Tuvalu', 'TV', 'TUV', '688'),
(237, 'Ucrania', 'Ukraine', 'L\'Ukraine', 'UA', 'UKR', '380'),
(238, 'Uganda', 'Uganda', 'Ouganda', 'UG', 'UGA', '256'),
(239, 'Uruguay', 'Uruguay', 'Uruguay', 'UY', 'URY', '598'),
(240, 'Uzbekistán', 'Uzbekistan', 'L\'Ouzbékistan', 'UZ', 'UZB', '998'),
(241, 'Vanuatu', 'Vanuatu', 'Vanuatu', 'VU', 'VUT', '678'),
(242, 'Venezuela', 'Venezuela', 'Venezuela', 'VE', 'VEN', '58'),
(243, 'Vietnam', 'Vietnam', 'Vietnam', 'VN', 'VNM', '84'),
(244, 'Wallis y Futuna', 'Wallis and Futuna', 'Wallis et Futuna', 'WF', 'WLF', '681'),
(245, 'Yemen', 'Yemen', 'Yémen', 'YE', 'YEM', '967'),
(246, 'Yibuti', 'Djibouti', 'Djibouti', 'DJ', 'DJI', '253'),
(247, 'Zambia', 'Zambia', 'Zambie', 'ZM', 'ZMB', '260'),
(248, 'Zimbabue', 'Zimbabwe', 'Zimbabwe', 'ZW', 'ZWE', '263');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto`
--

CREATE TABLE `proyecto` (
  `proyecto_id` int(11) NOT NULL,
  `proyecto_nombre` varchar(100) NOT NULL,
  `proyecto_objetivo` tinytext DEFAULT NULL,
  `proyecto_alcance` tinytext DEFAULT NULL,
  `proyecto_descripcion` tinytext DEFAULT NULL,
  `proyecto_presupuesto` float DEFAULT NULL,
  `proyecto_fecha_inicio` date DEFAULT current_timestamp(),
  `proyecto_fecha_finl` date DEFAULT NULL,
  `proyecto_evaluacion_general` tinytext DEFAULT NULL,
  `proyecto_evaluacion` int(11) DEFAULT NULL,
  `proyecto_rbs_status` tinyint(4) NOT NULL DEFAULT 0,
  `gerente_id` int(11) NOT NULL,
  `sector_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proyecto`
--

INSERT INTO `proyecto` (`proyecto_id`, `proyecto_nombre`, `proyecto_objetivo`, `proyecto_alcance`, `proyecto_descripcion`, `proyecto_presupuesto`, `proyecto_fecha_inicio`, `proyecto_fecha_finl`, `proyecto_evaluacion_general`, `proyecto_evaluacion`, `proyecto_rbs_status`, `gerente_id`, `sector_id`) VALUES
(2, 'kilo', '', '', '', 8787, '2020-08-20', NULL, NULL, NULL, 0, 28, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto_has riesgo_respuesta`
--

CREATE TABLE `proyecto_has riesgo_respuesta` (
  `proyecto_has_id` int(11) NOT NULL,
  `respuesta_has_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto_has_riesgo`
--

CREATE TABLE `proyecto_has_riesgo` (
  `proyecto_has_riesgo_id` int(11) NOT NULL,
  `proyecto_id` int(11) NOT NULL,
  `riesgo_id` int(11) NOT NULL,
  `responsable_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proyecto_has_riesgo`
--

INSERT INTO `proyecto_has_riesgo` (`proyecto_has_riesgo_id`, `proyecto_id`, `riesgo_id`, `responsable_id`) VALUES
(6, 2, 22, NULL),
(7, 2, 23, NULL),
(8, 2, 24, NULL),
(15, 2, 3, NULL),
(16, 2, 4, NULL),
(17, 2, 6, NULL),
(18, 2, 7, NULL),
(19, 2, 5, NULL),
(20, 2, 25, NULL),
(21, 2, 26, NULL),
(22, 2, 27, NULL),
(23, 2, 28, NULL),
(24, 2, 29, NULL),
(25, 2, 30, NULL),
(26, 2, 15, NULL),
(27, 2, 16, NULL),
(28, 2, 31, NULL),
(29, 2, 32, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto_has_riesgo_actividad`
--

CREATE TABLE `proyecto_has_riesgo_actividad` (
  `proyecto_has_riesgo_actividad_id` int(11) NOT NULL,
  `proyecto_has_riesgo_id` int(11) NOT NULL,
  `actividad_id` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rbs`
--

CREATE TABLE `rbs` (
  `rbs_id` int(11) NOT NULL,
  `rbs_default` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Permite saber si se eligio la rbs por defecto del pmbok o se decidio por otra opcion.',
  `gerente_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `rbs`
--

INSERT INTO `rbs` (`rbs_id`, `rbs_default`, `gerente_id`) VALUES
(6, 0, 24),
(8, 0, 28),
(9, 0, 29);

--
-- Disparadores `rbs`
--
DELIMITER $$
CREATE TRIGGER `Agregar categorías por defecto` AFTER INSERT ON `rbs` FOR EACH ROW IF (new.rbs_default = 0) THEN
	INSERT INTO `categoria`(`categoria_nombre`, `categoria_descripcion`, `categoria_default`, `rbs_id`) 
	VALUES 
	('Riesgo técnico', '', 0, new.rbs_id),
	('Riesgo de gestión', '',0, new.rbs_id),
	('Riesgo comercial', '', 0,new.rbs_id),
	('Riesgo externo', '', 0, new.rbs_id);
END IF
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recurso`
--

CREATE TABLE `recurso` (
  `recurso_id` int(11) NOT NULL,
  `recurso_nombre` varchar(45) DEFAULT NULL,
  `recurso_costo` float DEFAULT 0,
  `proyecto_id` int(11) NOT NULL,
  `tipo_recurso_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `responsble`
--

CREATE TABLE `responsble` (
  `responsable_id` int(11) NOT NULL,
  `responsble_nombre` varchar(100) NOT NULL,
  `responsble_descripcion` tinytext DEFAULT NULL,
  `proyecto_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuesta`
--

CREATE TABLE `respuesta` (
  `respuesta_id` int(11) NOT NULL,
  `respuesta_nombre` varchar(45) DEFAULT NULL,
  `respuesta_descripcion` tinytext DEFAULT NULL,
  `respuesta_costo` float DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `respuesta`
--

INSERT INTO `respuesta` (`respuesta_id`, `respuesta_nombre`, `respuesta_descripcion`, `respuesta_costo`) VALUES
(1, 'respuesta a', 'sd', NULL),
(2, 'respuesta b', 'as', NULL),
(3, 'respuesta a', 'as', NULL),
(4, 'respuesta b', 'sd', NULL),
(5, 'ss', 'sdsd', NULL),
(6, 'asda', 'sda', NULL),
(7, 'sdfd', 'sdfsd', NULL),
(8, 'sad', 'dsda', NULL),
(9, 'sdfsdf', 'dsfsd', NULL),
(10, 'jljl', 'jkljl', NULL),
(11, 'dsada', 'asda', NULL),
(12, 'sdfsd', 'sdfs', NULL),
(13, 'asdasd', 'sada', NULL),
(14, 'asdasd', 'sada', NULL),
(15, 'hjkjhk', 'jhkhjk', NULL),
(16, 'fsdfds', 'dsfsdf', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `riesgo`
--

CREATE TABLE `riesgo` (
  `riesgo_id` int(11) NOT NULL,
  `riesgo_nombre` varchar(45) DEFAULT NULL,
  `riesgo_causa` tinytext DEFAULT NULL,
  `riesgo_evento` tinytext DEFAULT NULL,
  `riesgo_efecto` tinytext DEFAULT NULL,
  `riesgo_tipo` tinyint(4) DEFAULT NULL COMMENT '0 si es un riesgo, 1 si es oportunidad',
  `riesgo_prom_evaluacion` float DEFAULT 0 COMMENT 'La evaluacion del riesgo de acuerdo a todos los proyectos.',
  `riesgo_privacidad` tinyint(4) NOT NULL DEFAULT 0,
  `riesgo_uid` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_categoria_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `riesgo`
--

INSERT INTO `riesgo` (`riesgo_id`, `riesgo_nombre`, `riesgo_causa`, `riesgo_evento`, `riesgo_efecto`, `riesgo_tipo`, `riesgo_prom_evaluacion`, `riesgo_privacidad`, `riesgo_uid`, `sub_categoria_id`) VALUES
(2, '', '', '', '', 0, NULL, 0, 98875189428748316, 77),
(3, 'Nuevo riesgo', 'razones desconicidas', 'acciones catastroficas', 'destruccion de la ciudad', 0, NULL, 0, 98875189428748317, 74),
(4, 'Nuevo riesgo', 'razones desconicidas', 'acciones catastroficas', 'destruccion de la ciudad', 0, NULL, 0, 98875189428748318, 74),
(5, 'Nuevo riesgo', 'razones desconicidas', 'acciones catastroficas', 'destruccion de la ciudad', 0, NULL, 0, 98875189428748319, 74),
(6, 'dsf', 'dsf', 'dsfds', 'dsfsdf', 0, NULL, 0, 98875189428748320, 74),
(7, 'dsf', 'dsf', 'dsfds', 'dsfsdf', 0, NULL, 0, 98875189428748321, 74),
(8, 'dsf', 'dsf', 'dsfds', 'dsfsdf', 0, NULL, 0, 98875189428748322, 74),
(9, 'sdfds', 'sdcsd', 'ddscd', 'dcsd', 0, NULL, 0, 98875189428748323, 74),
(10, 'dgf', 'fdgdf', 'fdgdf', 'gfd', 0, NULL, 0, 98875189428748324, 74),
(11, 'dgf', 'fdgdf', 'fdgdf', 'gfd', 0, NULL, 0, 98875189428748325, 74),
(12, 'dgf', 'fdgdf', 'fdgdf', 'gfd', 0, NULL, 0, 98875189428748326, 74),
(13, 'dgf', 'fdgdf', 'fdgdf', 'gfd', 0, NULL, 0, 98875189428748327, 74),
(14, 'dgf', 'fdgdf', 'fdgdf', 'gfd', 0, NULL, 0, 98875189428748328, 74),
(15, 'sdfsdf', 'sdfsdf', 'dsfsdf', 'sdfsf', 0, NULL, 0, 98875189428748329, 76),
(16, 'sdfsdf', 'sdfsdf', 'dsfsdf', 'sdfsf', 0, NULL, 0, 98875189428748330, 76),
(17, 'sdfsdf', 'sdfsdf', 'dsfsdf', 'sdfsf', 0, NULL, 0, 98875189428748331, 76),
(18, 'asdad', 'sadas', 'asdasd', 'adasd', 0, NULL, 0, 98875189428748332, 74),
(19, 'sfsdf', 'sdfsf', 'sdfsdf', '', 0, NULL, 0, 98875189428748333, 74),
(20, 'sfsdf', 'sdfsf', 'sdfsdf', '', 0, NULL, 0, 98875189428748334, 74),
(21, 'dsfsdf', 'sdfs', 'sdf', 'dsf', 0, NULL, 0, 98876683959926784, 75),
(22, 'dsfsdf', 'sdfs', 'sdf', 'dsf', 0, NULL, 0, 98876683959926785, 75),
(23, 'fdgdfg', 'dfgdf', 'dfgdfg', 'dfgdfg', 0, NULL, 0, 98876683959926786, 74),
(24, 'dsfd', 'dfdf', 'dfgd', 'dfgdfg', 0, NULL, 0, 98877097719627776, 74),
(25, '¡ por favor, que funcione ! :(', 'sdfds', 'dsfdsf', 'sdfds', 0, NULL, 0, 98879902534598656, 74),
(26, '¡ por favor, que funcione ! :(', 'sdfds', 'dsfdsf', 'sdfds', 0, NULL, 0, 98879902534598657, 74),
(27, 'hhhhh', 'hhh', 'hh', '', 0, NULL, 0, 98879902534598658, 76),
(28, 'dfdfv', 'dfdf', '', '', 0, NULL, 0, 98879902534598659, 75),
(29, 'SUPER RIESGO', 'dfdf', '', '', 0, NULL, 0, 98879902534598660, 74),
(30, 'Super RIesgo 2', '', '', '', 0, NULL, 0, 98879902534598661, 74),
(31, 'riesgottttt', 'sdfsdf', 'dsfsdf', 'dsf', 0, NULL, 0, 98881319102054400, 74),
(32, 'fsdf', 'sdfs', 'dsfsdf', 'sdf', 0, NULL, 0, 98881319102054401, 74);

--
-- Disparadores `riesgo`
--
DELIMITER $$
CREATE TRIGGER `agregar uuid` BEFORE INSERT ON `riesgo` FOR EACH ROW SET NEW.riesgo_uid = (SELECT uuid_short())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `riesgo_has_respuesta`
--

CREATE TABLE `riesgo_has_respuesta` (
  `riesgo_has_respuesta_id` int(11) NOT NULL,
  `riesgo_id` int(11) NOT NULL,
  `respuesta_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `riesgo_has_respuesta`
--

INSERT INTO `riesgo_has_respuesta` (`riesgo_has_respuesta_id`, `riesgo_id`, `respuesta_id`) VALUES
(1, 3, 4),
(2, 3, 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sector`
--

CREATE TABLE `sector` (
  `sector_id` int(11) NOT NULL,
  `sector_nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sector`
--

INSERT INTO `sector` (`sector_id`, `sector_nombre`) VALUES
(9, 'agropecuario'),
(10, 'servicios'),
(11, 'transporte'),
(12, 'comercio'),
(13, 'financiero'),
(14, 'construcción'),
(15, 'minero'),
(16, 'comunicaciones');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sub_categoria`
--

CREATE TABLE `sub_categoria` (
  `sub_categoria_id` int(11) NOT NULL,
  `sub_categoria_nombre` varchar(45) DEFAULT NULL,
  `sub_categoria_descripcion` tinytext DEFAULT NULL,
  `sub_categoria_default` tinyint(4) NOT NULL DEFAULT 1,
  `sub_categoria_uid` bigint(20) UNSIGNED DEFAULT NULL,
  `categoria_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sub_categoria`
--

INSERT INTO `sub_categoria` (`sub_categoria_id`, `sub_categoria_nombre`, `sub_categoria_descripcion`, `sub_categoria_default`, `sub_categoria_uid`, `categoria_id`) VALUES
(49, 'Definición del alcance', '', 0, 98872370386698269, 9),
(50, 'Definición de los requisitos', '', 0, 98872370386698270, 9),
(51, 'Estimaciones, supuestos y restricciones', '', 0, 98872370386698271, 9),
(52, 'Procesos técnicos', '', 0, 98872370386698272, 9),
(53, 'Tecnología', '', 0, 98872370386698273, 9),
(54, 'Interfaces técnicas', '', 0, 98872370386698274, 9),
(55, 'Dirección de proyectos', '', 0, 98872370386698276, 10),
(56, 'Dirección del programa/portafolio', '', 0, 98872370386698277, 10),
(57, 'Gestión de las operaciones', '', 0, 98872370386698278, 10),
(58, 'Organización', '', 0, 98872370386698279, 10),
(59, 'Dotación de recursos', '', 0, 98872370386698280, 10),
(60, 'Comunicación', '', 0, 98872370386698281, 10),
(61, 'Términos y condiciones contractuales', '', 0, 98872370386698283, 11),
(62, 'Contratación interna', '', 0, 98872370386698284, 11),
(63, 'Proveedores y vendedores', '', 0, 98872370386698285, 11),
(64, 'Subcontratos', '', 0, 98872370386698286, 11),
(65, 'Estabilidad de los clientes', '', 0, 98872370386698287, 11),
(66, 'Asociaciones y empresas conjuntas', '', 0, 98872370386698288, 11),
(67, 'Legislación', '', 0, 98872370386698290, 12),
(68, 'Tasas de cambio', '', 0, 98872370386698291, 12),
(69, 'Sitios/Instalaciones', '', 0, 98872370386698292, 12),
(70, 'Ambiental/clima', '', 0, 98872370386698293, 12),
(71, 'Competencia', '', 0, 98872370386698294, 12),
(72, 'Normativo', '', 0, 98872370386698295, 12),
(74, 'Definición del alcance', '', 0, 98873742091878403, 15),
(75, 'Definición de los requisitos', '', 0, 98873742091878404, 15),
(76, 'Estimaciones, supuestos y restricciones', '', 0, 98873742091878405, 15),
(77, 'Procesos técnicos', '', 0, 98873742091878406, 15),
(78, 'Tecnología', '', 0, 98873742091878407, 15),
(79, 'Interfaces técnicas', '', 0, 98873742091878408, 15),
(80, 'Dirección de proyectos', '', 0, 98873742091878410, 16),
(81, 'Dirección del programa/portafolio', '', 0, 98873742091878411, 16),
(82, 'Gestión de las operaciones', '', 0, 98873742091878412, 16),
(83, 'Organización', '', 0, 98873742091878413, 16),
(84, 'Dotación de recursos', '', 0, 98873742091878414, 16),
(85, 'Comunicación', '', 0, 98873742091878415, 16),
(86, 'Términos y condiciones contractuales', '', 0, 98873742091878417, 17),
(87, 'Contratación interna', '', 0, 98873742091878418, 17),
(88, 'Proveedores y vendedores', '', 0, 98873742091878419, 17),
(89, 'Subcontratos', '', 0, 98873742091878420, 17),
(90, 'Estabilidad de los clientes', '', 0, 98873742091878421, 17),
(91, 'Asociaciones y empresas conjuntas', '', 0, 98873742091878422, 17),
(92, 'Legislación', '', 0, 98873742091878424, 18),
(93, 'Tasas de cambio', '', 0, 98873742091878425, 18),
(94, 'Sitios/Instalaciones', '', 0, 98873742091878426, 18),
(95, 'Ambiental/clima', '', 0, 98873742091878427, 18),
(96, 'Competencia', '', 0, 98873742091878428, 18),
(97, 'Normativo', '', 0, 98873742091878429, 18),
(98, 'Definición del alcance', '', 0, 98875189428748289, 19),
(99, 'Definición de los requisitos', '', 0, 98875189428748290, 19),
(100, 'Estimaciones, supuestos y restricciones', '', 0, 98875189428748291, 19),
(101, 'Procesos técnicos', '', 0, 98875189428748292, 19),
(102, 'Tecnología', '', 0, 98875189428748293, 19),
(103, 'Interfaces técnicas', '', 0, 98875189428748294, 19),
(104, 'Dirección de proyectos', '', 0, 98875189428748296, 20),
(105, 'Dirección del programa/portafolio', '', 0, 98875189428748297, 20),
(106, 'Gestión de las operaciones', '', 0, 98875189428748298, 20),
(107, 'Organización', '', 0, 98875189428748299, 20),
(108, 'Dotación de recursos', '', 0, 98875189428748300, 20),
(109, 'Comunicación', '', 0, 98875189428748301, 20),
(110, 'Términos y condiciones contractuales', '', 0, 98875189428748303, 21),
(111, 'Contratación interna', '', 0, 98875189428748304, 21),
(112, 'Proveedores y vendedores', '', 0, 98875189428748305, 21),
(113, 'Subcontratos', '', 0, 98875189428748306, 21),
(114, 'Estabilidad de los clientes', '', 0, 98875189428748307, 21),
(115, 'Asociaciones y empresas conjuntas', '', 0, 98875189428748308, 21),
(116, 'Legislación', '', 0, 98875189428748310, 22),
(117, 'Tasas de cambio', '', 0, 98875189428748311, 22),
(118, 'Sitios/Instalaciones', '', 0, 98875189428748312, 22),
(119, 'Ambiental/clima', '', 0, 98875189428748313, 22),
(120, 'Competencia', '', 0, 98875189428748314, 22),
(121, 'Normativo', '', 0, 98875189428748315, 22),
(122, 'Definición de los requisitos', '', 2, 98877097719627777, 15),
(123, 'Definición del alcance', '', 2, 98877097719627778, 15);

--
-- Disparadores `sub_categoria`
--
DELIMITER $$
CREATE TRIGGER `Agregar uuid subcategoria` BEFORE INSERT ON `sub_categoria` FOR EACH ROW SET NEW.sub_categoria_uid = (SELECT uuid_short())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_recurso`
--

CREATE TABLE `tipo_recurso` (
  `tipo_recurso_id` int(11) NOT NULL,
  `tipo_recurso_nombre` varchar(45) NOT NULL,
  `tipo_recurso_descripcion` tinytext DEFAULT NULL,
  `gerente_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_recurso`
--

INSERT INTO `tipo_recurso` (`tipo_recurso_id`, `tipo_recurso_nombre`, `tipo_recurso_descripcion`, `gerente_id`) VALUES
(4, 'Material', 'Este tipo de recurso se refiere a los suministros, materiales y cualquier otro consumible necesario para completar las tareas.', 24),
(5, 'Trabajo', 'Se trata de los miembros de tu equipo de trabajo. La dedicación de cada individuo se mide en horas de trabajo.', 24),
(6, 'Costo', 'Este tipo de recurso implica un gasto para el proyecto, pero no dependen del trabajo o la duración de una tarea. Pueden tratarse de gastos de representación (comidas, viajes…).', 24),
(7, 'Material', 'Este tipo de recurso se refiere a los suministros, materiales y cualquier otro consumible necesario para completar las tareas.', 28),
(8, 'Trabajo', 'Se trata de los miembros de tu equipo de trabajo. La dedicación de cada individuo se mide en horas de trabajo.', 28),
(9, 'Costo', 'Este tipo de recurso implica un gasto para el proyecto, pero no dependen del trabajo o la duración de una tarea. Pueden tratarse de gastos de representación (comidas, viajes…).', 28),
(10, 'Material', 'Este tipo de recurso se refiere a los suministros, materiales y cualquier otro consumible necesario para completar las tareas.', 29),
(11, 'Trabajo', 'Se trata de los miembros de tu equipo de trabajo. La dedicación de cada individuo se mide en horas de trabajo.', 29),
(12, 'Costo', 'Este tipo de recurso implica un gasto para el proyecto, pero no dependen del trabajo o la duración de una tarea. Pueden tratarse de gastos de representación (comidas, viajes…).', 29),
(13, 'Material', 'Este tipo de recurso se refiere a los suministros, materiales y cualquier otro consumible necesario para completar las tareas.', 31),
(14, 'Trabajo', 'Se trata de los miembros de tu equipo de trabajo. La dedicación de cada individuo se mide en horas de trabajo.', 31),
(15, 'Costo', 'Este tipo de recurso implica un gasto para el proyecto, pero no dependen del trabajo o la duración de una tarea. Pueden tratarse de gastos de representación (comidas, viajes…).', 31),
(16, 'Material', 'Este tipo de recurso se refiere a los suministros, materiales y cualquier otro consumible necesario para completar las tareas.', 32),
(17, 'Trabajo', 'Se trata de los miembros de tu equipo de trabajo. La dedicación de cada individuo se mide en horas de trabajo.', 32),
(18, 'Costo', 'Este tipo de recurso implica un gasto para el proyecto, pero no dependen del trabajo o la duración de una tarea. Pueden tratarse de gastos de representación (comidas, viajes…).', 32);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividad`
--
ALTER TABLE `actividad`
  ADD PRIMARY KEY (`actividad_id`),
  ADD KEY `fk_actividad_proyecto1_idx` (`proyecto_id`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`categoria_id`),
  ADD UNIQUE KEY `categoria_uid_UNIQUE` (`categoria_uid`),
  ADD KEY `fk_categoria_rbs1_idx` (`rbs_id`);

--
-- Indices de la tabla `gerente`
--
ALTER TABLE `gerente`
  ADD PRIMARY KEY (`gerente_id`),
  ADD UNIQUE KEY `gerente_usuario` (`gerente_usuario`),
  ADD KEY `fk_gerente_sector1_idx` (`sector_id`),
  ADD KEY `fk_gerente_pais1_idx` (`pais_id`);

--
-- Indices de la tabla `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`pais_id`);

--
-- Indices de la tabla `proyecto`
--
ALTER TABLE `proyecto`
  ADD PRIMARY KEY (`proyecto_id`),
  ADD KEY `fk_proyecto_gerente1_idx` (`gerente_id`),
  ADD KEY `fk_proyecto_sector1_idx` (`sector_id`);

--
-- Indices de la tabla `proyecto_has riesgo_respuesta`
--
ALTER TABLE `proyecto_has riesgo_respuesta`
  ADD PRIMARY KEY (`proyecto_has_id`,`respuesta_has_id`),
  ADD KEY `fk_proyecto_has_riesgo_has_riesgo_has_respuesta_riesgo_has__idx` (`respuesta_has_id`),
  ADD KEY `fk_proyecto_has_riesgo_has_riesgo_has_respuesta_proyecto_ha_idx` (`proyecto_has_id`);

--
-- Indices de la tabla `proyecto_has_riesgo`
--
ALTER TABLE `proyecto_has_riesgo`
  ADD PRIMARY KEY (`proyecto_has_riesgo_id`),
  ADD KEY `fk_proyecto_has_riesgo_proyecto1` (`proyecto_id`),
  ADD KEY `fk_proyecto_has_riesgo_riesgo1` (`riesgo_id`),
  ADD KEY `fk_proyecto_has_riesgo_responsble1` (`responsable_id`);

--
-- Indices de la tabla `proyecto_has_riesgo_actividad`
--
ALTER TABLE `proyecto_has_riesgo_actividad`
  ADD PRIMARY KEY (`proyecto_has_riesgo_actividad_id`),
  ADD KEY `fk_proyecto_has_riesgo_actividad_proyecto_has_riesgo1` (`proyecto_has_riesgo_id`),
  ADD KEY `actividad_id` (`actividad_id`);

--
-- Indices de la tabla `rbs`
--
ALTER TABLE `rbs`
  ADD PRIMARY KEY (`rbs_id`),
  ADD UNIQUE KEY `gerente_id` (`gerente_id`),
  ADD KEY `fk_rbs_gerente1_idx` (`gerente_id`);

--
-- Indices de la tabla `recurso`
--
ALTER TABLE `recurso`
  ADD PRIMARY KEY (`recurso_id`),
  ADD KEY `fk_recurso_proyecto1_idx` (`proyecto_id`),
  ADD KEY `fk_recurso_tipo_recurso1_idx` (`tipo_recurso_id`);

--
-- Indices de la tabla `responsble`
--
ALTER TABLE `responsble`
  ADD PRIMARY KEY (`responsable_id`),
  ADD KEY `fk_responsble_proyecto1_idx` (`proyecto_id`);

--
-- Indices de la tabla `respuesta`
--
ALTER TABLE `respuesta`
  ADD PRIMARY KEY (`respuesta_id`);

--
-- Indices de la tabla `riesgo`
--
ALTER TABLE `riesgo`
  ADD PRIMARY KEY (`riesgo_id`),
  ADD UNIQUE KEY `riesgo_uid_UNIQUE` (`riesgo_uid`),
  ADD KEY `fk_riesgo_sub_categoria1_idx` (`sub_categoria_id`);

--
-- Indices de la tabla `riesgo_has_respuesta`
--
ALTER TABLE `riesgo_has_respuesta`
  ADD PRIMARY KEY (`riesgo_has_respuesta_id`),
  ADD UNIQUE KEY `Unico` (`riesgo_id`,`respuesta_id`),
  ADD KEY `fk_riesgo_has_respuesta_respuesta1_idx` (`respuesta_id`),
  ADD KEY `fk_riesgo_has_respuesta_riesgo1_idx` (`riesgo_id`);

--
-- Indices de la tabla `sector`
--
ALTER TABLE `sector`
  ADD PRIMARY KEY (`sector_id`);

--
-- Indices de la tabla `sub_categoria`
--
ALTER TABLE `sub_categoria`
  ADD PRIMARY KEY (`sub_categoria_id`),
  ADD UNIQUE KEY `sub_categoria_uid_UNIQUE` (`sub_categoria_uid`),
  ADD KEY `fk_sub_categoria_categoria1_idx` (`categoria_id`);

--
-- Indices de la tabla `tipo_recurso`
--
ALTER TABLE `tipo_recurso`
  ADD PRIMARY KEY (`tipo_recurso_id`),
  ADD KEY `fk_tipo_recurso_gerente1_idx` (`gerente_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `categoria_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `gerente`
--
ALTER TABLE `gerente`
  MODIFY `gerente_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `pais`
--
ALTER TABLE `pais`
  MODIFY `pais_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=249;

--
-- AUTO_INCREMENT de la tabla `proyecto`
--
ALTER TABLE `proyecto`
  MODIFY `proyecto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `proyecto_has_riesgo`
--
ALTER TABLE `proyecto_has_riesgo`
  MODIFY `proyecto_has_riesgo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `proyecto_has_riesgo_actividad`
--
ALTER TABLE `proyecto_has_riesgo_actividad`
  MODIFY `proyecto_has_riesgo_actividad_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rbs`
--
ALTER TABLE `rbs`
  MODIFY `rbs_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `recurso`
--
ALTER TABLE `recurso`
  MODIFY `recurso_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `responsble`
--
ALTER TABLE `responsble`
  MODIFY `responsable_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `respuesta`
--
ALTER TABLE `respuesta`
  MODIFY `respuesta_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `riesgo`
--
ALTER TABLE `riesgo`
  MODIFY `riesgo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `riesgo_has_respuesta`
--
ALTER TABLE `riesgo_has_respuesta`
  MODIFY `riesgo_has_respuesta_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `sector`
--
ALTER TABLE `sector`
  MODIFY `sector_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `sub_categoria`
--
ALTER TABLE `sub_categoria`
  MODIFY `sub_categoria_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT de la tabla `tipo_recurso`
--
ALTER TABLE `tipo_recurso`
  MODIFY `tipo_recurso_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `actividad`
--
ALTER TABLE `actividad`
  ADD CONSTRAINT `fk_actividad_proyecto1` FOREIGN KEY (`proyecto_id`) REFERENCES `proyecto` (`proyecto_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD CONSTRAINT `fk_categoria_rbs1` FOREIGN KEY (`rbs_id`) REFERENCES `rbs` (`rbs_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `gerente`
--
ALTER TABLE `gerente`
  ADD CONSTRAINT `fk_gerente_pais1` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`pais_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_gerente_sector1` FOREIGN KEY (`sector_id`) REFERENCES `sector` (`sector_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `proyecto`
--
ALTER TABLE `proyecto`
  ADD CONSTRAINT `fk_proyecto_gerente1` FOREIGN KEY (`gerente_id`) REFERENCES `gerente` (`gerente_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_proyecto_sector1` FOREIGN KEY (`sector_id`) REFERENCES `sector` (`sector_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `proyecto_has riesgo_respuesta`
--
ALTER TABLE `proyecto_has riesgo_respuesta`
  ADD CONSTRAINT `fk_proyecto_has_riesgo_has_riesgo_has_respuesta_proyecto_has_1` FOREIGN KEY (`proyecto_has_id`) REFERENCES `proyecto_has_riesgo` (`proyecto_has_riesgo_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_proyecto_has_riesgo_has_riesgo_has_respuesta_riesgo_has_re1` FOREIGN KEY (`respuesta_has_id`) REFERENCES `riesgo_has_respuesta` (`riesgo_has_respuesta_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `proyecto_has_riesgo`
--
ALTER TABLE `proyecto_has_riesgo`
  ADD CONSTRAINT `fk_proyecto_has_riesgo_proyecto1` FOREIGN KEY (`proyecto_id`) REFERENCES `proyecto` (`proyecto_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_proyecto_has_riesgo_responsble1` FOREIGN KEY (`responsable_id`) REFERENCES `responsble` (`responsable_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_proyecto_has_riesgo_riesgo1` FOREIGN KEY (`riesgo_id`) REFERENCES `riesgo` (`riesgo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `proyecto_has_riesgo_actividad`
--
ALTER TABLE `proyecto_has_riesgo_actividad`
  ADD CONSTRAINT `fk_proyecto_has_riesgo_actividad_proyecto_has_riesgo1` FOREIGN KEY (`proyecto_has_riesgo_id`) REFERENCES `proyecto_has_riesgo` (`proyecto_has_riesgo_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `proyecto_has_riesgo_actividad_ibfk_1` FOREIGN KEY (`actividad_id`) REFERENCES `actividad` (`actividad_id`);

--
-- Filtros para la tabla `rbs`
--
ALTER TABLE `rbs`
  ADD CONSTRAINT `fk_rbs_gerente1` FOREIGN KEY (`gerente_id`) REFERENCES `gerente` (`gerente_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `recurso`
--
ALTER TABLE `recurso`
  ADD CONSTRAINT `fk_recurso_proyecto1` FOREIGN KEY (`proyecto_id`) REFERENCES `proyecto` (`proyecto_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_recurso_tipo_recurso1` FOREIGN KEY (`tipo_recurso_id`) REFERENCES `tipo_recurso` (`tipo_recurso_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `responsble`
--
ALTER TABLE `responsble`
  ADD CONSTRAINT `fk_responsble_proyecto1` FOREIGN KEY (`proyecto_id`) REFERENCES `proyecto` (`proyecto_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `riesgo`
--
ALTER TABLE `riesgo`
  ADD CONSTRAINT `fk_riesgo_sub_categoria1` FOREIGN KEY (`sub_categoria_id`) REFERENCES `sub_categoria` (`sub_categoria_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `riesgo_has_respuesta`
--
ALTER TABLE `riesgo_has_respuesta`
  ADD CONSTRAINT `fk_riesgo_has_respuesta_respuesta1` FOREIGN KEY (`respuesta_id`) REFERENCES `respuesta` (`respuesta_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_riesgo_has_respuesta_riesgo1` FOREIGN KEY (`riesgo_id`) REFERENCES `riesgo` (`riesgo_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `sub_categoria`
--
ALTER TABLE `sub_categoria`
  ADD CONSTRAINT `fk_sub_categoria_categoria1` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`categoria_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tipo_recurso`
--
ALTER TABLE `tipo_recurso`
  ADD CONSTRAINT `fk_tipo_recurso_gerente1` FOREIGN KEY (`gerente_id`) REFERENCES `gerente` (`gerente_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
