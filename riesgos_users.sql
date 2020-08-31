-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-08-2020 a las 23:42:51
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
-- Base de datos: `riesgos_users`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add gerentes', 7, 'add_gerentes'),
(26, 'Can change gerentes', 7, 'change_gerentes'),
(27, 'Can delete gerentes', 7, 'delete_gerentes'),
(28, 'Can view gerentes', 7, 'view_gerentes'),
(29, 'Can add proyectos', 8, 'add_proyectos'),
(30, 'Can change proyectos', 8, 'change_proyectos'),
(31, 'Can delete proyectos', 8, 'delete_proyectos'),
(32, 'Can view proyectos', 8, 'view_proyectos'),
(33, 'Can add categorias', 9, 'add_categorias'),
(34, 'Can change categorias', 9, 'change_categorias'),
(35, 'Can delete categorias', 9, 'delete_categorias'),
(36, 'Can view categorias', 9, 'view_categorias'),
(37, 'Can add subcategorias', 10, 'add_subcategorias'),
(38, 'Can change subcategorias', 10, 'change_subcategorias'),
(39, 'Can delete subcategorias', 10, 'delete_subcategorias'),
(40, 'Can view subcategorias', 10, 'view_subcategorias'),
(41, 'Can add riesgos', 11, 'add_riesgos'),
(42, 'Can change riesgos', 11, 'change_riesgos'),
(43, 'Can delete riesgos', 11, 'delete_riesgos'),
(44, 'Can view riesgos', 11, 'view_riesgos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$180000$UJX2MJsp4vET$kmQrl2oo1FuplYS7Vdt2k3JAdIE3g+Je5zloZBNLs+8=', NULL, 0, 'user_diego', 'diego alirio', '', 'diego@correo.com', 0, 1, '2020-08-13 19:48:53.600835'),
(3, 'pbkdf2_sha256$180000$RW9Qxi7qFbci$cvSwM1AMoEis5gVFd2N276LOzQs0yNmP2yjMVtdYQLM=', NULL, 0, 'user_diego_2', 'diego alirio', '', 'diego@correo.com', 0, 1, '2020-08-13 19:54:48.446677'),
(4, 'pbkdf2_sha256$180000$faRjABe2mJc5$NUJWy/gsPgWhMIuz7M5+pz1DfnrMornRd38eg9trCOw=', NULL, 0, 'user_diego_3', 'diego alirio', '', 'diego@correo.com', 0, 1, '2020-08-13 19:55:40.069055'),
(6, 'pbkdf2_sha256$180000$S1eDTgYD6Xqd$GMKj4zLxJs4JgvDb5NfDbhVt1k1JI0p3BglEZ43EUqc=', NULL, 0, 'user_diego_4', 'diego alirio', '', 'diego@correo.com', 0, 1, '2020-08-13 19:59:30.883865'),
(7, 'pbkdf2_sha256$180000$5tH5Ev2noYYw$Lfv9FiBXubqu7XyW6/AGxGoH4ot1awTXEJq+AKpYeOU=', NULL, 0, 'user_diego_5', 'diego alirio', '', 'diego@correo.com', 0, 1, '2020-08-13 19:59:59.496352'),
(8, 'pbkdf2_sha256$180000$mbUafbI9mnhL$KU3xd5NpkBIuzf4GVXuYWs+igv8YGtsUQ04hh2NSTVo=', NULL, 0, 'user_diego_6', 'diego alirio', '', 'diego@correo.com', 0, 1, '2020-08-13 20:00:58.294929'),
(9, 'pbkdf2_sha256$180000$aaBTPAt4jlDt$715h+gD71Q00yiD2OYIMNh/iyBA5D6jTEC4kBWYldOI=', NULL, 0, 'user_diego_7', 'diego alirio', '', 'diego@correo.com', 0, 1, '2020-08-13 20:02:14.615819'),
(11, 'pbkdf2_sha256$180000$zVrilxZL9VL3$e23NZalGWzAMsiOTibpTag59lmhGpTaFuun0FHvDcEo=', NULL, 0, 'user_diego_8', 'diego alirio', '', 'diego@correo.com', 0, 1, '2020-08-13 20:03:56.270690'),
(12, 'pbkdf2_sha256$180000$K6Md8LIaGrUZ$38/kgUcjzoxfJDrMUTO+2MbvGUYzmUXvgLT00+6oePE=', NULL, 0, 'user_diego_9', 'diego alirio', '', 'diego@correo.com', 0, 1, '2020-08-13 20:05:55.880606'),
(13, 'pbkdf2_sha256$180000$oLHBkBHqRvo0$VokhTmSVAHQIU9++TcGCC4LNPu+w4UKzVtsrZkE90I8=', NULL, 0, 'user_diego_10', 'diego alirio', '', 'diego@correo.com', 0, 1, '2020-08-13 20:39:41.606144'),
(14, 'pbkdf2_sha256$180000$64O5aFwlXKwT$+LL26aev0V2aeXwEWsG8mbG2CYaVR5qtxz7bbjCtzSo=', NULL, 0, 'user_diego_11', 'diego alirio', '', 'diego@correo.com', 0, 1, '2020-08-13 20:40:41.610608'),
(15, 'pbkdf2_sha256$180000$hrCgYIJmXstR$KXuECxelgI06bMzdm3cIRMGOnTDfv947Bh5riPCue34=', NULL, 0, 'user_diego_12', 'diego alirio', '', 'diego@correo.com', 0, 1, '2020-08-13 21:00:28.549413'),
(16, 'pbkdf2_sha256$180000$Dq8YJcP0Zbjr$rLb/w9jOeGpRKcEGgc3zL3/ha2Ho9Y9Ha90yNWymsaM=', NULL, 0, 'user_diego_13', 'diego alirio', '', 'diego@correo.com', 0, 1, '2020-08-13 21:01:15.117410'),
(17, 'pbkdf2_sha256$180000$XbkGxgWQjSXu$5s8xP0oV2KKAyWd+Gq6+aKltGsfiyAyr+Evz+/JfiVM=', NULL, 0, 'user_diego_14', 'diego alirio', '', 'diego@correo.com', 0, 1, '2020-08-13 21:04:08.778766'),
(18, 'pbkdf2_sha256$180000$JzTtgtGSlu6a$eagJ6WwvSlbgNktSTAYoICX8eSHkufrpvmIuC0NHTlg=', '2020-08-13 21:22:16.054586', 0, 'user_diego_15', 'diego alirio', '', 'diego@correo.com', 0, 1, '2020-08-13 21:04:44.025690'),
(19, 'pbkdf2_sha256$180000$kdyDnApRiS2J$gjwVUol4uxGapsJ8KcqwA5iJhDPNB8YJN4f+3Gy8xFs=', '2020-08-13 21:36:45.949105', 0, 'user_diego_16', 'diego alirio', '', 'diego@correo.com', 0, 1, '2020-08-13 21:30:51.397452');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(9, 'Risk_project_ufps', 'categorias'),
(7, 'Risk_project_ufps', 'gerentes'),
(8, 'Risk_project_ufps', 'proyectos'),
(11, 'Risk_project_ufps', 'riesgos'),
(10, 'Risk_project_ufps', 'subcategorias'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'Risk_project_ufps', '0001_initial', '2020-08-13 19:07:40.149408'),
(2, 'Risk_project_ufps', '0002_delete_proyectos', '2020-08-13 19:07:40.174411'),
(3, 'Risk_project_ufps', '0003_proyectos', '2020-08-13 19:07:40.204416'),
(4, 'Risk_project_ufps', '0004_auto_20200701_2137', '2020-08-13 19:07:40.264425'),
(5, 'Risk_project_ufps', '0005_auto_20200701_2149', '2020-08-13 19:07:40.269426'),
(6, 'Risk_project_ufps', '0006_categorias_subcategorias', '2020-08-13 19:07:40.339437'),
(7, 'Risk_project_ufps', '0007_riesgos', '2020-08-13 19:07:40.439451'),
(8, 'contenttypes', '0001_initial', '2020-08-13 19:07:40.559470'),
(9, 'auth', '0001_initial', '2020-08-13 19:07:40.809509'),
(10, 'admin', '0001_initial', '2020-08-13 19:07:41.384598'),
(11, 'admin', '0002_logentry_remove_auto_add', '2020-08-13 19:07:41.535607'),
(12, 'admin', '0003_logentry_add_action_flag_choices', '2020-08-13 19:07:41.550612'),
(13, 'contenttypes', '0002_remove_content_type_name', '2020-08-13 19:07:41.645625'),
(14, 'auth', '0002_alter_permission_name_max_length', '2020-08-13 19:07:41.705633'),
(15, 'auth', '0003_alter_user_email_max_length', '2020-08-13 19:07:41.730638'),
(16, 'auth', '0004_alter_user_username_opts', '2020-08-13 19:07:41.740640'),
(17, 'auth', '0005_alter_user_last_login_null', '2020-08-13 19:07:41.820652'),
(18, 'auth', '0006_require_contenttypes_0002', '2020-08-13 19:07:41.825653'),
(19, 'auth', '0007_alter_validators_add_error_messages', '2020-08-13 19:07:41.835654'),
(20, 'auth', '0008_alter_user_username_max_length', '2020-08-13 19:07:41.855657'),
(21, 'auth', '0009_alter_user_last_name_max_length', '2020-08-13 19:07:41.875660'),
(22, 'auth', '0010_alter_group_name_max_length', '2020-08-13 19:07:41.895664'),
(23, 'auth', '0011_update_proxy_permissions', '2020-08-13 19:07:41.905665'),
(24, 'sessions', '0001_initial', '2020-08-13 19:07:41.940671');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `risk_project_ufps_categorias`
--

CREATE TABLE `risk_project_ufps_categorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `risk_project_ufps_gerentes`
--

CREATE TABLE `risk_project_ufps_gerentes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(40) NOT NULL,
  `usuario` varchar(254) NOT NULL,
  `clave` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `risk_project_ufps_proyectos`
--

CREATE TABLE `risk_project_ufps_proyectos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `risk_project_ufps_riesgos`
--

CREATE TABLE `risk_project_ufps_riesgos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `causa` varchar(100) DEFAULT NULL,
  `efecto` varchar(100) DEFAULT NULL,
  `evento` varchar(100) DEFAULT NULL,
  `tipo` varchar(12) DEFAULT NULL,
  `subcategoria_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `risk_project_ufps_subcategorias`
--

CREATE TABLE `risk_project_ufps_subcategorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `categoria_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indices de la tabla `risk_project_ufps_categorias`
--
ALTER TABLE `risk_project_ufps_categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `risk_project_ufps_gerentes`
--
ALTER TABLE `risk_project_ufps_gerentes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `risk_project_ufps_proyectos`
--
ALTER TABLE `risk_project_ufps_proyectos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `risk_project_ufps_riesgos`
--
ALTER TABLE `risk_project_ufps_riesgos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Risk_project_ufps_ri_subcategoria_id_f7344e91_fk_Risk_proj` (`subcategoria_id`);

--
-- Indices de la tabla `risk_project_ufps_subcategorias`
--
ALTER TABLE `risk_project_ufps_subcategorias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Risk_project_ufps_su_categoria_id_8e0d38b3_fk_Risk_proj` (`categoria_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `risk_project_ufps_categorias`
--
ALTER TABLE `risk_project_ufps_categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `risk_project_ufps_gerentes`
--
ALTER TABLE `risk_project_ufps_gerentes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `risk_project_ufps_proyectos`
--
ALTER TABLE `risk_project_ufps_proyectos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `risk_project_ufps_riesgos`
--
ALTER TABLE `risk_project_ufps_riesgos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `risk_project_ufps_subcategorias`
--
ALTER TABLE `risk_project_ufps_subcategorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `risk_project_ufps_riesgos`
--
ALTER TABLE `risk_project_ufps_riesgos`
  ADD CONSTRAINT `Risk_project_ufps_ri_subcategoria_id_f7344e91_fk_Risk_proj` FOREIGN KEY (`subcategoria_id`) REFERENCES `risk_project_ufps_subcategorias` (`id`);

--
-- Filtros para la tabla `risk_project_ufps_subcategorias`
--
ALTER TABLE `risk_project_ufps_subcategorias`
  ADD CONSTRAINT `Risk_project_ufps_su_categoria_id_8e0d38b3_fk_Risk_proj` FOREIGN KEY (`categoria_id`) REFERENCES `risk_project_ufps_categorias` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
