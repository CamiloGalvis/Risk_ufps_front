-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-10-2020 a las 19:43:00
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
(50, 'pbkdf2_sha256$180000$lYkuN8Z6dD4z$1V1TN35DokotH5FrYiB3OXCm0wRul/lKVJ9Qiuor9X4=', '2020-10-02 22:56:40.252480', 0, 'DiegoCV', 'Diego Alirio Carrascal', '', 'skdiegomxtr@gmail.com', 0, 1, '2020-10-02 02:38:01.237365'),
(51, 'pbkdf2_sha256$180000$ixo1N2NxlYxI$lHKOAgiu6wjbPnJ4hu63F+z9rfojfF5QxnwrQZSBgio=', '2020-10-03 12:48:17.888904', 0, 'a', 'a', '', 'a@a', 0, 1, '2020-10-02 16:28:10.329946');

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

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('09l8xv2k60a75p0pnptx1fy7tf6ztqkp', 'MjMxZWM3YzZiYWYzNWUyOTJhZWZiZTk5NDk4YTBmNGMwYjU5ZDcwMTp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmUwMmMzZmFiMWNiYTkzYmM5MGZhMzUyNzgxMDVmZWIxMWJlZWVhNCJ9', '2020-09-24 00:09:21.161824'),
('0d0cw0bnven3ul2p0wbqk8c6a1h5birh', '.eJxVjDkOwjAUBe_iGllxYmN_SnrOYP0tOIAcKUuFuDuJlALaNzPvbTKuS8nrrFMexFxM25nT70jIT607kQfW-2h5rMs0kN0Ve9DZ3kbR1_Vw_w4KzmWro-fADLElAfVEii4Ehei0Ue_O0MWQNk7Uc0RHvUCEhoFVGpewS-bzBSSgONs:1k9zU2:-IjuVzWqARcIbsFZc4dVlAb8AShXdeZFcyxcErzVUpw', '2020-09-06 23:33:06.289438'),
('0kb2zqagyh8wrwvsvn5tluhs4nkifse8', 'MjMxZWM3YzZiYWYzNWUyOTJhZWZiZTk5NDk4YTBmNGMwYjU5ZDcwMTp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmUwMmMzZmFiMWNiYTkzYmM5MGZhMzUyNzgxMDVmZWIxMWJlZWVhNCJ9', '2020-09-12 20:54:46.166862'),
('1roks1dsvv0fu4fuea2e0dtlbnw1m6ou', 'MjMxZWM3YzZiYWYzNWUyOTJhZWZiZTk5NDk4YTBmNGMwYjU5ZDcwMTp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmUwMmMzZmFiMWNiYTkzYmM5MGZhMzUyNzgxMDVmZWIxMWJlZWVhNCJ9', '2020-09-29 20:07:44.365062'),
('28utvcx2kc9stffrebo9vrenrp7up7mw', 'MjMxZWM3YzZiYWYzNWUyOTJhZWZiZTk5NDk4YTBmNGMwYjU5ZDcwMTp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmUwMmMzZmFiMWNiYTkzYmM5MGZhMzUyNzgxMDVmZWIxMWJlZWVhNCJ9', '2020-09-14 22:13:40.663233'),
('37yj4k9kzz53tiude6p5wj3v87qcoano', '.eJxVjEEOwiAQRe_C2hAGplBcuvcMhM4MUjVtUtqV8e7apAvd_vfef6mUt7WmrcmSRlZnBVGdfsch00OmnfA9T7dZ0zytyzjoXdEHbfo6szwvh_t3UHOr39o6bwYXWWwkY4EQivcloKMuxM4bEQSUQkjE2IP1AaAHKuwMZras3h_vKjef:1k7p0c:67Wh552JFMUKcPSkJslusK-HTHZb11GbFJVWf4FUUfw', '2020-08-31 23:57:46.788874'),
('39cdb8dhupnl4y9q3nmyo45nfydu9r5n', 'N2Y0YThiYWIyMmI2OGQwYjNkNWY5ZjAwNTY4Zjg5MzExMjM2ZGQ1Mjp7Il9hdXRoX3VzZXJfaWQiOiI1MCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMmM1ZTM5NzAxMGZkZjliZTdhN2IzNDg3YWE4OGUyMDZhMDZjZGU0OSJ9', '2020-10-16 02:39:08.654486'),
('3urbpemtz51cqzdtbq0574uwcre5rub5', 'MjMxZWM3YzZiYWYzNWUyOTJhZWZiZTk5NDk4YTBmNGMwYjU5ZDcwMTp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmUwMmMzZmFiMWNiYTkzYmM5MGZhMzUyNzgxMDVmZWIxMWJlZWVhNCJ9', '2020-10-03 00:09:17.028429'),
('3wrfj338giz56ucgfl00zzie5l70rj09', '.eJxVjDkOwjAUBe_iGllxYmN_SnrOYP0tOIAcKUuFuDuJlALaNzPvbTKuS8nrrFMexFxM25nT70jIT607kQfW-2h5rMs0kN0Ve9DZ3kbR1_Vw_w4KzmWro-fADLElAfVEii4Ehei0Ue_O0MWQNk7Uc0RHvUCEhoFVGpewS-bzBSSgONs:1k9Uqw:FGWKvNVCaS5vB3ZagjmbeOv3LWZyaDDFUgPQfoJspSc', '2020-09-05 14:50:42.647141'),
('3ydy6e3kyo8kdjp1oxcx0f8rptwl05gx', 'MjMxZWM3YzZiYWYzNWUyOTJhZWZiZTk5NDk4YTBmNGMwYjU5ZDcwMTp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmUwMmMzZmFiMWNiYTkzYmM5MGZhMzUyNzgxMDVmZWIxMWJlZWVhNCJ9', '2020-09-23 19:28:22.176931'),
('3z9kg422rcvxkmh2mv68xsgxptpaec35', '.eJxVjEEOwiAQRe_C2hAGplBcuvcMhM4MUjVtUtqV8e7apAvd_vfef6mUt7WmrcmSRlZnBVGdfsch00OmnfA9T7dZ0zytyzjoXdEHbfo6szwvh_t3UHOr39o6bwYXWWwkY4EQivcloKMuxM4bEQSUQkjE2IP1AaAHKuwMZras3h_vKjef:1k7iqJ:UrWzLM1hYgqzdXhy4jGaSVcu13feyYllIMM0MVOnUFg', '2020-08-31 17:22:43.324627'),
('4732eaexzm9ruora09znwz45j476l76n', 'MWZhY2FiMDBlMzM5YTAzNGIzNGQwYzg2MGVkZDA1M2FjNDc0MjJmMjp7Il9hdXRoX3VzZXJfaWQiOiIzNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNDYwODJjNDcwMWIzN2JhYzZjMDg3ZTFlODQzMjQ4MjMyYzhmMzIzZiJ9', '2020-09-23 13:36:02.635125'),
('4byrl8ye26tjfzszxkngvqexd7qfyp41', 'MjMxZWM3YzZiYWYzNWUyOTJhZWZiZTk5NDk4YTBmNGMwYjU5ZDcwMTp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmUwMmMzZmFiMWNiYTkzYmM5MGZhMzUyNzgxMDVmZWIxMWJlZWVhNCJ9', '2020-10-13 14:05:25.139751'),
('4x2mbs9rrnga4wb96hsu6cq6b4lr6aci', 'MjMxZWM3YzZiYWYzNWUyOTJhZWZiZTk5NDk4YTBmNGMwYjU5ZDcwMTp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmUwMmMzZmFiMWNiYTkzYmM5MGZhMzUyNzgxMDVmZWIxMWJlZWVhNCJ9', '2020-10-14 20:18:09.634258'),
('4x40cr9dwkkilh0fnddrm2np7hrctwka', 'MmQyZjA1MWUwYjU0YWQwMWY0MDUxN2NkOTcwMDhjNjkxYmY0YzFkZjp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzBiNzgxN2E4MmMyNzcwY2ZiNWU5ZmNjYTYzYjg4ODBmOGNiMTNiYyJ9', '2020-10-05 20:35:23.553439'),
('56i3vp1sfhzfgneadl4g2dgmtof7ybvw', 'MjMxZWM3YzZiYWYzNWUyOTJhZWZiZTk5NDk4YTBmNGMwYjU5ZDcwMTp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmUwMmMzZmFiMWNiYTkzYmM5MGZhMzUyNzgxMDVmZWIxMWJlZWVhNCJ9', '2020-09-27 16:12:45.794149'),
('58kddayfcwzrumos3vwaz1s82z0seh6n', 'MjMxZWM3YzZiYWYzNWUyOTJhZWZiZTk5NDk4YTBmNGMwYjU5ZDcwMTp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmUwMmMzZmFiMWNiYTkzYmM5MGZhMzUyNzgxMDVmZWIxMWJlZWVhNCJ9', '2020-10-08 20:22:35.086008'),
('6104ozoqf5e2ymtznmhkb0gaftsjce88', 'MjMxZWM3YzZiYWYzNWUyOTJhZWZiZTk5NDk4YTBmNGMwYjU5ZDcwMTp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmUwMmMzZmFiMWNiYTkzYmM5MGZhMzUyNzgxMDVmZWIxMWJlZWVhNCJ9', '2020-09-13 16:36:35.418406'),
('64kc4ctn1v7vqbm1nr89ais4fy4g8z9v', 'MjMxZWM3YzZiYWYzNWUyOTJhZWZiZTk5NDk4YTBmNGMwYjU5ZDcwMTp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmUwMmMzZmFiMWNiYTkzYmM5MGZhMzUyNzgxMDVmZWIxMWJlZWVhNCJ9', '2020-10-02 15:25:18.993445'),
('6cpu6oz4oxwta4alrz7l4kdzw3wpeg3f', 'MjMxZWM3YzZiYWYzNWUyOTJhZWZiZTk5NDk4YTBmNGMwYjU5ZDcwMTp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmUwMmMzZmFiMWNiYTkzYmM5MGZhMzUyNzgxMDVmZWIxMWJlZWVhNCJ9', '2020-09-12 01:14:37.917671'),
('6ovv7nyup3u7r0tru0utf1cy0vii6nl7', 'MjMxZWM3YzZiYWYzNWUyOTJhZWZiZTk5NDk4YTBmNGMwYjU5ZDcwMTp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmUwMmMzZmFiMWNiYTkzYmM5MGZhMzUyNzgxMDVmZWIxMWJlZWVhNCJ9', '2020-09-22 00:01:29.992665'),
('81vztv136sw2j38ktjmdjmdklwggbcfo', 'MjMxZWM3YzZiYWYzNWUyOTJhZWZiZTk5NDk4YTBmNGMwYjU5ZDcwMTp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmUwMmMzZmFiMWNiYTkzYmM5MGZhMzUyNzgxMDVmZWIxMWJlZWVhNCJ9', '2020-09-26 21:36:23.707783'),
('8cc35zesel8rcfv7xxtzmmw6g78mkoyp', '.eJxVjEEOwiAQRe_C2hCgwoBL9z0DmYFBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXERJojT70iYHtx2ku_YbrNMc1uXieSuyIN2Oc6Zn9fD_Tuo2Ou3BgBrPZAaklYGHeiCFricA_nBW4ZECdAHhWQ0W3RFs3baG1LBKWXE-wPwzzdJ:1kAfSp:XWSKyyoRTKI5j8256kD-cFTzV3pFWZhjWU8uMtGMX4Q', '2020-09-08 20:22:39.209741'),
('8jqkovxv3jx5s8fmgf8sciwb2ucuebuy', 'OGM4OWFmN2IwMTdiMDM0N2EyMjUzZmRjZmYyNzEzYTQyM2NhZjgxZjp7Il9hdXRoX3VzZXJfaWQiOiIxOSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDEwNmRlY2YzYmU1Nzc5NjMwOTU1MGMzMmI2NTk5MWRiZWE2ZWJjNiJ9', '2020-09-01 18:06:05.226395'),
('8psdgbfaw00im27qyit3119jodn858vr', 'YTM4MjkyNjdlNmZlZDQwZTRlZWJmN2VjZWUxMzY2MjhlNWRlMWRjNDp7Il9hdXRoX3VzZXJfaWQiOiI1MSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDQ5YzdjNjA5MmU0ZjA2MGM1MDI4ZjI1ODI1ODU2MGQ2MzU4NjY5NSJ9', '2020-10-16 22:57:12.141325'),
('9lc1pix0pkmyx0flyk7o8wmjej325nq9', '.eJxVjEEOgjAQRe_StWnoSDvFpXvOQGY6g6CmTSisjHdXEha6_e-9_zIDbes0bFWXYRZzMa4zp9-RKT0070TulG_FppLXZWa7K_ag1fZF9Hk93L-Dier0rUcvTUOq4LQ9a9KEDpvE5EWoZYfMEBAwBgUO0JGnyDFEGL0ThDia9wcvQjiU:1k8tAe:ysK5YQLXrjOMGbJPBK3xETMhkZ11UKvRyC6SVXaWDZQ', '2020-09-03 22:36:32.275581'),
('9usbywdz06s4uuw4ns9geqa2ro4grt7f', 'ODFhZWEzMjMyYTBhY2I3NWE3OWIzYjZlYzAzZDhlZmFmZjhmZmFmNDp7Il9hdXRoX3VzZXJfaWQiOiIzMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOWRjOTViYTZlYWFhZDg0NDM1YmJlMDY3ZDg4MWEzNTM1NzNmZDgxMSJ9', '2020-09-14 16:43:55.442391'),
('9z772h0ykpwjvgdvmi7mhpnxj0htqhj9', 'MjMxZWM3YzZiYWYzNWUyOTJhZWZiZTk5NDk4YTBmNGMwYjU5ZDcwMTp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmUwMmMzZmFiMWNiYTkzYmM5MGZhMzUyNzgxMDVmZWIxMWJlZWVhNCJ9', '2020-09-18 16:28:37.563309'),
('9ztgltpcr1rkvwlw33t2b7vrqlzwbhvs', 'MjMxZWM3YzZiYWYzNWUyOTJhZWZiZTk5NDk4YTBmNGMwYjU5ZDcwMTp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmUwMmMzZmFiMWNiYTkzYmM5MGZhMzUyNzgxMDVmZWIxMWJlZWVhNCJ9', '2020-10-03 00:10:14.563094'),
('a1dy6m2535bwl8vfn1lfaq69squdab3p', 'MWZhY2FiMDBlMzM5YTAzNGIzNGQwYzg2MGVkZDA1M2FjNDc0MjJmMjp7Il9hdXRoX3VzZXJfaWQiOiIzNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNDYwODJjNDcwMWIzN2JhYzZjMDg3ZTFlODQzMjQ4MjMyYzhmMzIzZiJ9', '2020-10-15 14:51:22.443881'),
('ag3mlduxgj1tx39cup4hrlilfum1qd9x', 'MjMxZWM3YzZiYWYzNWUyOTJhZWZiZTk5NDk4YTBmNGMwYjU5ZDcwMTp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmUwMmMzZmFiMWNiYTkzYmM5MGZhMzUyNzgxMDVmZWIxMWJlZWVhNCJ9', '2020-09-10 15:43:00.924346'),
('aiurh9iv65bwevbqf5uli53kf5e3vj28', 'MjMxZWM3YzZiYWYzNWUyOTJhZWZiZTk5NDk4YTBmNGMwYjU5ZDcwMTp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmUwMmMzZmFiMWNiYTkzYmM5MGZhMzUyNzgxMDVmZWIxMWJlZWVhNCJ9', '2020-09-18 15:34:58.753292'),
('as6dvk9vpkl10hs8vxi0mlrcso6tum8q', 'MjMxZWM3YzZiYWYzNWUyOTJhZWZiZTk5NDk4YTBmNGMwYjU5ZDcwMTp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmUwMmMzZmFiMWNiYTkzYmM5MGZhMzUyNzgxMDVmZWIxMWJlZWVhNCJ9', '2020-09-30 22:20:37.772009'),
('c37fv4pwxis3r1nov8fodvuotvt5bfn0', '.eJxVjDkOwjAUBe_iGllxYmN_SnrOYP0tOIAcKUuFuDuJlALaNzPvbTKuS8nrrFMexFxM25nT70jIT607kQfW-2h5rMs0kN0Ve9DZ3kbR1_Vw_w4KzmWro-fADLElAfVEii4Ehei0Ue_O0MWQNk7Uc0RHvUCEhoFVGpewS-bzBSSgONs:1k9zGZ:PrjYo3dq9cCdik5HCgudzws_uK0Tt_L_MxH83CPg1nQ', '2020-09-06 23:19:11.032244'),
('cgts1xlhwumjpn8z79pkixdo1dtvx4x1', 'MjMxZWM3YzZiYWYzNWUyOTJhZWZiZTk5NDk4YTBmNGMwYjU5ZDcwMTp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmUwMmMzZmFiMWNiYTkzYmM5MGZhMzUyNzgxMDVmZWIxMWJlZWVhNCJ9', '2020-09-21 14:27:18.735119'),
('cvdqjg9mwhj3uy439rvn9yhoqhthie5r', 'MjMxZWM3YzZiYWYzNWUyOTJhZWZiZTk5NDk4YTBmNGMwYjU5ZDcwMTp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmUwMmMzZmFiMWNiYTkzYmM5MGZhMzUyNzgxMDVmZWIxMWJlZWVhNCJ9', '2020-10-06 14:30:36.891104'),
('cy1cub6mowgfv7yfereg0ab1tu0ycnvm', '.eJxVjDkOwjAUBe_iGllxYmN_SnrOYP0tOIAcKUuFuDuJlALaNzPvbTKuS8nrrFMexFxM25nT70jIT607kQfW-2h5rMs0kN0Ve9DZ3kbR1_Vw_w4KzmWro-fADLElAfVEii4Ehei0Ue_O0MWQNk7Uc0RHvUCEhoFVGpewS-bzBSSgONs:1k9XDF:nVkGac4SzOixWYED-ssRkDWT9_iDX_h5REdKg39j5d4', '2020-09-05 17:21:53.493469'),
('cy3uigcaax2zjg1lpi22cvf4kmai2jba', '.eJxVjDkOwjAUBe_iGllxYmN_SnrOYP0tOIAcKUuFuDuJlALaNzPvbTKuS8nrrFMexFxM25nT70jIT607kQfW-2h5rMs0kN0Ve9DZ3kbR1_Vw_w4KzmWro-fADLElAfVEii4Ehei0Ue_O0MWQNk7Uc0RHvUCEhoFVGpewS-bzBSSgONs:1k99Rz:_3LByZ5uH6oRDZ8JRVI_k0uAbDRcwS6MwmY4s9fRNCA', '2020-09-04 15:59:31.387200'),
('dbjcryepzolkdhwhnxbezhdbsfsw1onu', 'OGM4OWFmN2IwMTdiMDM0N2EyMjUzZmRjZmYyNzEzYTQyM2NhZjgxZjp7Il9hdXRoX3VzZXJfaWQiOiIxOSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDEwNmRlY2YzYmU1Nzc5NjMwOTU1MGMzMmI2NTk5MWRiZWE2ZWJjNiJ9', '2020-09-01 21:02:47.262874'),
('dc1oy417x7mtwxdfed7xhnbvh7iajanl', 'MjMxZWM3YzZiYWYzNWUyOTJhZWZiZTk5NDk4YTBmNGMwYjU5ZDcwMTp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmUwMmMzZmFiMWNiYTkzYmM5MGZhMzUyNzgxMDVmZWIxMWJlZWVhNCJ9', '2020-10-12 15:29:33.152868'),
('dia8pmw1ok2umkuqu4khtshgrq3vbf4w', 'MjMxZWM3YzZiYWYzNWUyOTJhZWZiZTk5NDk4YTBmNGMwYjU5ZDcwMTp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmUwMmMzZmFiMWNiYTkzYmM5MGZhMzUyNzgxMDVmZWIxMWJlZWVhNCJ9', '2020-09-24 23:36:07.936847'),
('dobr5xbdtmly6ow2q1522js6o437lh6k', 'YTM4MjkyNjdlNmZlZDQwZTRlZWJmN2VjZWUxMzY2MjhlNWRlMWRjNDp7Il9hdXRoX3VzZXJfaWQiOiI1MSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDQ5YzdjNjA5MmU0ZjA2MGM1MDI4ZjI1ODI1ODU2MGQ2MzU4NjY5NSJ9', '2020-10-16 17:26:07.295602'),
('ecj2l96ss162tcovcx550pturmr7edh9', 'MjMxZWM3YzZiYWYzNWUyOTJhZWZiZTk5NDk4YTBmNGMwYjU5ZDcwMTp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmUwMmMzZmFiMWNiYTkzYmM5MGZhMzUyNzgxMDVmZWIxMWJlZWVhNCJ9', '2020-10-15 01:17:08.028285'),
('eexr4o8ju89yqb65zjxfhalnyfv8qto3', 'MjMxZWM3YzZiYWYzNWUyOTJhZWZiZTk5NDk4YTBmNGMwYjU5ZDcwMTp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmUwMmMzZmFiMWNiYTkzYmM5MGZhMzUyNzgxMDVmZWIxMWJlZWVhNCJ9', '2020-10-09 14:25:17.802297'),
('egmahzw843mdslppr9ingt5uuhn3beio', '.eJxVjEEOwiAQRe_C2hAGplBcuvcMhM4MUjVtUtqV8e7apAvd_vfef6mUt7WmrcmSRlZnBVGdfsch00OmnfA9T7dZ0zytyzjoXdEHbfo6szwvh_t3UHOr39o6bwYXWWwkY4EQivcloKMuxM4bEQSUQkjE2IP1AaAHKuwMZras3h_vKjef:1k7lAo:hD_G2e6OD8mdMAILVLP2s3-T2Vb9NkCEH9K7_xE95lc', '2020-08-31 19:52:02.344801'),
('g2kan2wwkzrrmqk7vfquqbgmumiux89w', 'N2Y0YThiYWIyMmI2OGQwYjNkNWY5ZjAwNTY4Zjg5MzExMjM2ZGQ1Mjp7Il9hdXRoX3VzZXJfaWQiOiI1MCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMmM1ZTM5NzAxMGZkZjliZTdhN2IzNDg3YWE4OGUyMDZhMDZjZGU0OSJ9', '2020-10-16 16:37:13.353819'),
('go1tky6pj7fc1ul1cvar54oz85rci5le', 'MjMxZWM3YzZiYWYzNWUyOTJhZWZiZTk5NDk4YTBmNGMwYjU5ZDcwMTp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmUwMmMzZmFiMWNiYTkzYmM5MGZhMzUyNzgxMDVmZWIxMWJlZWVhNCJ9', '2020-09-19 21:30:08.401322'),
('gppnygbw4y85g0ra46b6bo6r8fbj5j5o', 'MjMxZWM3YzZiYWYzNWUyOTJhZWZiZTk5NDk4YTBmNGMwYjU5ZDcwMTp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmUwMmMzZmFiMWNiYTkzYmM5MGZhMzUyNzgxMDVmZWIxMWJlZWVhNCJ9', '2020-09-13 20:17:44.745294'),
('gprz96kcd2b4bzpbuw5rwvrrbyu6kj90', 'MjMxZWM3YzZiYWYzNWUyOTJhZWZiZTk5NDk4YTBmNGMwYjU5ZDcwMTp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmUwMmMzZmFiMWNiYTkzYmM5MGZhMzUyNzgxMDVmZWIxMWJlZWVhNCJ9', '2020-10-05 19:37:30.029832'),
('hkfvotsn10z538kx827enw84dkvoc2qe', 'MjMxZWM3YzZiYWYzNWUyOTJhZWZiZTk5NDk4YTBmNGMwYjU5ZDcwMTp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmUwMmMzZmFiMWNiYTkzYmM5MGZhMzUyNzgxMDVmZWIxMWJlZWVhNCJ9', '2020-09-16 23:40:28.058244'),
('i40bd4zqk6r0x2xdb995jepoiil88dxt', 'MjMxZWM3YzZiYWYzNWUyOTJhZWZiZTk5NDk4YTBmNGMwYjU5ZDcwMTp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmUwMmMzZmFiMWNiYTkzYmM5MGZhMzUyNzgxMDVmZWIxMWJlZWVhNCJ9', '2020-09-11 19:54:07.932081'),
('ir5nip9n1zbfummvkda6sc33yk7fxx4i', 'MjMxZWM3YzZiYWYzNWUyOTJhZWZiZTk5NDk4YTBmNGMwYjU5ZDcwMTp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmUwMmMzZmFiMWNiYTkzYmM5MGZhMzUyNzgxMDVmZWIxMWJlZWVhNCJ9', '2020-09-14 16:14:31.874628'),
('ixwg7a7grge3dbdvlxahi3si34ztpoyr', 'MjMxZWM3YzZiYWYzNWUyOTJhZWZiZTk5NDk4YTBmNGMwYjU5ZDcwMTp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmUwMmMzZmFiMWNiYTkzYmM5MGZhMzUyNzgxMDVmZWIxMWJlZWVhNCJ9', '2020-09-25 20:10:10.305643'),
('iynlycsmvn5s99nc1jyvo9yumstx6q6q', '.eJxVjMsOwiAQRf-FtSEDDI-6dO83kBkgUjWQlHZl_Hdt0oVu7znnvkSkba1xG2WJcxZnoYM4_Y5M6VHaTvKd2q3L1Nu6zCx3RR50yGvP5Xk53L-DSqN-awBiG4i8Dg65EDIUYDt5l0gRgA8mkbUGLKGbvM5ee42IKqNTBpN4fwD6Pzb6:1kAGud:hCwdsAuHmKcdzoG7XMuPungfB5OnEfeKuCWSsRUPv24', '2020-09-07 18:09:43.936509'),
('jmycl4av8hn48f5fz7fiv362nay8y7tc', 'MjMxZWM3YzZiYWYzNWUyOTJhZWZiZTk5NDk4YTBmNGMwYjU5ZDcwMTp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmUwMmMzZmFiMWNiYTkzYmM5MGZhMzUyNzgxMDVmZWIxMWJlZWVhNCJ9', '2020-09-28 15:07:44.895738'),
('kv8e2qoznr0bh9j8rrl7z33s09ni8276', '.eJxVjMsOwiAQRf-FtSEDDI-6dO83kBkgUjWQlHZl_Hdt0oVu7znnvkSkba1xG2WJcxZnoYM4_Y5M6VHaTvKd2q3L1Nu6zCx3RR50yGvP5Xk53L-DSqN-awBiG4i8Dg65EDIUYDt5l0gRgA8mkbUGLKGbvM5ee42IKqNTBpN4fwD6Pzb6:1kB3Qa:DQLNAmkw0dHov_OKpop41PPGjm6VPv-4DCenKZ2TmrM', '2020-09-09 21:57:56.489292'),
('l1xarj2oumtoqfo0yj9bapv0evc0xrqq', 'MjMxZWM3YzZiYWYzNWUyOTJhZWZiZTk5NDk4YTBmNGMwYjU5ZDcwMTp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmUwMmMzZmFiMWNiYTkzYmM5MGZhMzUyNzgxMDVmZWIxMWJlZWVhNCJ9', '2020-10-10 14:31:41.037537'),
('lpaxhk4ukm5q9w8a638y63lh2fppujxo', 'MjMxZWM3YzZiYWYzNWUyOTJhZWZiZTk5NDk4YTBmNGMwYjU5ZDcwMTp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmUwMmMzZmFiMWNiYTkzYmM5MGZhMzUyNzgxMDVmZWIxMWJlZWVhNCJ9', '2020-10-02 22:34:11.141889'),
('lu7umpcykgozlnzvaybysu31uicyimvi', '.eJxVjMsOwiAQRf-FtSEDDI-6dO83kBkgUjWQlHZl_Hdt0oVu7znnvkSkba1xG2WJcxZnoYM4_Y5M6VHaTvKd2q3L1Nu6zCx3RR50yGvP5Xk53L-DSqN-awBiG4i8Dg65EDIUYDt5l0gRgA8mkbUGLKGbvM5ee42IKqNTBpN4fwD6Pzb6:1kAi9v:aTZRGeuJ86bswyVi1JYPcf2efQOQz8G-8ryLZkKMSC4', '2020-09-08 23:15:19.362828'),
('m6dmlo5kzbq1wytsytwe0x4cavjdqc6p', '.eJxVjMsOwiAQRf-FtSGADA-X7vsNhIFBqgaS0q6M_65NutDtPefcFwtxW2vYBi1hzuzClGCn3xFjelDbSb7Hdus89bYuM_Jd4QcdfOqZntfD_TuocdRvjR6U1GB0VA4TFZuEJQtZEmmjcylOOiigSHibCBNEMCiL1N6d0ROx9wcL-Dh7:1k8tBi:x0zcnEtrvqa85st9LvhuDIhJBjwnNPT2o5k_x4_LAOY', '2020-09-03 22:37:38.397245'),
('mcz9iwp9hupmdeiyhyejf5nf8sjxoqxx', 'MjMxZWM3YzZiYWYzNWUyOTJhZWZiZTk5NDk4YTBmNGMwYjU5ZDcwMTp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmUwMmMzZmFiMWNiYTkzYmM5MGZhMzUyNzgxMDVmZWIxMWJlZWVhNCJ9', '2020-09-25 15:18:34.128665'),
('n6o85g7jpy4iv2l0d9be5fpbro5b4q95', 'MjMxZWM3YzZiYWYzNWUyOTJhZWZiZTk5NDk4YTBmNGMwYjU5ZDcwMTp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmUwMmMzZmFiMWNiYTkzYmM5MGZhMzUyNzgxMDVmZWIxMWJlZWVhNCJ9', '2020-10-03 19:05:07.138482'),
('nwg8pjgbfs828ax2qcynyjkeelhoh3gp', 'OGM4OWFmN2IwMTdiMDM0N2EyMjUzZmRjZmYyNzEzYTQyM2NhZjgxZjp7Il9hdXRoX3VzZXJfaWQiOiIxOSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDEwNmRlY2YzYmU1Nzc5NjMwOTU1MGMzMmI2NTk5MWRiZWE2ZWJjNiJ9', '2020-09-01 21:06:48.349385'),
('o1fz816xlmlnmr8x30zait7vpiuv2j0x', 'MjMxZWM3YzZiYWYzNWUyOTJhZWZiZTk5NDk4YTBmNGMwYjU5ZDcwMTp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmUwMmMzZmFiMWNiYTkzYmM5MGZhMzUyNzgxMDVmZWIxMWJlZWVhNCJ9', '2020-09-25 23:18:28.120322'),
('ofx3jnuc445t5wdil6e0kcp431p21fr3', 'MjMxZWM3YzZiYWYzNWUyOTJhZWZiZTk5NDk4YTBmNGMwYjU5ZDcwMTp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmUwMmMzZmFiMWNiYTkzYmM5MGZhMzUyNzgxMDVmZWIxMWJlZWVhNCJ9', '2020-09-16 00:37:35.254482'),
('pgoa1ixu4tgjai2m0s385hg3id7p6y7d', 'MjMxZWM3YzZiYWYzNWUyOTJhZWZiZTk5NDk4YTBmNGMwYjU5ZDcwMTp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmUwMmMzZmFiMWNiYTkzYmM5MGZhMzUyNzgxMDVmZWIxMWJlZWVhNCJ9', '2020-09-19 00:39:59.093268'),
('q0b1camr7mqlasfddkhb2daxsd1efs79', 'OGM4OWFmN2IwMTdiMDM0N2EyMjUzZmRjZmYyNzEzYTQyM2NhZjgxZjp7Il9hdXRoX3VzZXJfaWQiOiIxOSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDEwNmRlY2YzYmU1Nzc5NjMwOTU1MGMzMmI2NTk5MWRiZWE2ZWJjNiJ9', '2020-09-01 19:32:43.941054'),
('qami3sojtxwmnq9zxla97ye3husdaxqf', 'MjMxZWM3YzZiYWYzNWUyOTJhZWZiZTk5NDk4YTBmNGMwYjU5ZDcwMTp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmUwMmMzZmFiMWNiYTkzYmM5MGZhMzUyNzgxMDVmZWIxMWJlZWVhNCJ9', '2020-10-01 22:14:10.569095'),
('qrvdz753o8jr1js7h9sy0gngmkxsoazo', 'MjMxZWM3YzZiYWYzNWUyOTJhZWZiZTk5NDk4YTBmNGMwYjU5ZDcwMTp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmUwMmMzZmFiMWNiYTkzYmM5MGZhMzUyNzgxMDVmZWIxMWJlZWVhNCJ9', '2020-09-21 20:26:13.022480'),
('qtzvwb595ktq7u5ihjqxxt81kik3z5ja', 'MjMxZWM3YzZiYWYzNWUyOTJhZWZiZTk5NDk4YTBmNGMwYjU5ZDcwMTp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmUwMmMzZmFiMWNiYTkzYmM5MGZhMzUyNzgxMDVmZWIxMWJlZWVhNCJ9', '2020-10-10 14:38:34.823982'),
('qzewo6x8bd1p1qo120dgmow14ol6cier', 'MjMxZWM3YzZiYWYzNWUyOTJhZWZiZTk5NDk4YTBmNGMwYjU5ZDcwMTp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmUwMmMzZmFiMWNiYTkzYmM5MGZhMzUyNzgxMDVmZWIxMWJlZWVhNCJ9', '2020-09-16 16:00:11.804646'),
('r361k8q4sqrqs0mtbtmdpz5h1txg5o2j', 'MjMxZWM3YzZiYWYzNWUyOTJhZWZiZTk5NDk4YTBmNGMwYjU5ZDcwMTp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmUwMmMzZmFiMWNiYTkzYmM5MGZhMzUyNzgxMDVmZWIxMWJlZWVhNCJ9', '2020-10-14 21:50:00.163168'),
('r9wgyydij0qysvwj0q491yutho6z9sb5', 'MmQyZjA1MWUwYjU0YWQwMWY0MDUxN2NkOTcwMDhjNjkxYmY0YzFkZjp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzBiNzgxN2E4MmMyNzcwY2ZiNWU5ZmNjYTYzYjg4ODBmOGNiMTNiYyJ9', '2020-10-05 19:40:25.229127'),
('rbjjj515qm70um9whq2ow14xv3dbztoh', 'OGM4OWFmN2IwMTdiMDM0N2EyMjUzZmRjZmYyNzEzYTQyM2NhZjgxZjp7Il9hdXRoX3VzZXJfaWQiOiIxOSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDEwNmRlY2YzYmU1Nzc5NjMwOTU1MGMzMmI2NTk5MWRiZWE2ZWJjNiJ9', '2020-09-01 20:42:59.355823'),
('rfr0aismttrgug9z2nq3oi9dfi1bh23w', '.eJxVjEEOwiAQRe_C2hBmSim4dN8zkAGmUjWQlHZlvLtt0oVu_3vvv4Wnbc1-a7z4OYmrQBCX3zFQfHI5SHpQuVcZa1mXOchDkSdtcqyJX7fT_TvI1PJeD9YSgEoQXNRm0D10kwm2Y4o4JVSdQUTQmsAFq3dEGDkp1g7Qxp7E5wvphzeO:1k8uTe:HygBE6QHNGPtjUibCfyIfnzmCSWAFV_Lxq4GmGyFc-o', '2020-09-04 00:00:14.310228'),
('rhxy10wo2lmrrsklvijstgo0mbtaa51r', '.eJxVjEEOwiAQRe_C2hAGplBcuvcMhM4MUjVtUtqV8e7apAvd_vfef6mUt7WmrcmSRlZnBVGdfsch00OmnfA9T7dZ0zytyzjoXdEHbfo6szwvh_t3UHOr39o6bwYXWWwkY4EQivcloKMuxM4bEQSUQkjE2IP1AaAHKuwMZras3h_vKjef:1k7oap:-fmYKC9hmtY9UCor1O3YJIt6TIcgEj3DxnkPlBpMhTs', '2020-08-31 23:31:07.964896'),
('s42ss9uw10hrcw3of1ngls6hpvke3toq', 'NTc4ZjgxNGEwY2YwYjdkNGRkNWJiODc3NzY4Y2I0ZGE2MDJkNjdhNjp7Il9hdXRoX3VzZXJfaWQiOiI0MSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNjNjYWU3ZjhjNmMyODVjMzA4ZTMzMDJkYjBmYzNmM2RjMTE4NzBiMiJ9', '2020-10-12 14:55:40.697271'),
('s980zx3qs1zpdi2kj8bket2a3uwnpw2g', 'MjMxZWM3YzZiYWYzNWUyOTJhZWZiZTk5NDk4YTBmNGMwYjU5ZDcwMTp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmUwMmMzZmFiMWNiYTkzYmM5MGZhMzUyNzgxMDVmZWIxMWJlZWVhNCJ9', '2020-09-24 14:14:20.184726'),
('s9xpp9qyd9q9qvsdowz6sged4phdgqu7', 'MjMxZWM3YzZiYWYzNWUyOTJhZWZiZTk5NDk4YTBmNGMwYjU5ZDcwMTp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmUwMmMzZmFiMWNiYTkzYmM5MGZhMzUyNzgxMDVmZWIxMWJlZWVhNCJ9', '2020-10-08 19:09:32.759801'),
('sojituq2ibr8pq60nzqss1cfjz81l3uz', 'OWExYWE2NWZjYTk2NGJmMGYwYTE1ZTk4YjY1OGJhZDAyNWIzZDMxNTp7Il9hdXRoX3VzZXJfaWQiOiIzNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmI3NzRlYWI5Y2U0ZTU5YzI2MzNmYjFmMmFjYzI5ZDU3ZjEwZjcxOSJ9', '2020-10-09 19:20:17.012106'),
('swvmebm3x9mbymqkpr5she93zkwm5jbm', '.eJxVjEEOwiAQRe_C2hAGplBcuvcMhM4MUjVtUtqV8e7apAvd_vfef6mUt7WmrcmSRlZnBVGdfsch00OmnfA9T7dZ0zytyzjoXdEHbfo6szwvh_t3UHOr39o6bwYXWWwkY4EQivcloKMuxM4bEQSUQkjE2IP1AaAHKuwMZras3h_vKjef:1k6hQL:kHP6ITFhWilJieiZvHD2f1XVgyLrIzy05OWsmF8txxs', '2020-08-28 21:39:41.573360'),
('t0fdqj7pq60q08iw909da6zj4wmd6595', '.eJxVjEEOwiAQRe_C2hCgwoBL9z0DmYFBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXERJojT70iYHtx2ku_YbrNMc1uXieSuyIN2Oc6Zn9fD_Tuo2Ou3BgBrPZAaklYGHeiCFricA_nBW4ZECdAHhWQ0W3RFs3baG1LBKWXE-wPwzzdJ:1kAblm:sc6gLRjRXrOU5xe_t-6XtJ-xZbPhXzEoZhBsqnbDqdE', '2020-09-08 16:25:58.568938'),
('t3v68ssgxsby6850sk2xmzi86xq6oq1u', 'OGM4OWFmN2IwMTdiMDM0N2EyMjUzZmRjZmYyNzEzYTQyM2NhZjgxZjp7Il9hdXRoX3VzZXJfaWQiOiIxOSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDEwNmRlY2YzYmU1Nzc5NjMwOTU1MGMzMmI2NTk5MWRiZWE2ZWJjNiJ9', '2020-09-01 18:08:30.869502'),
('tbkuaxzrujt95gpisz08rez1e75tpqfl', 'NTc4ZjgxNGEwY2YwYjdkNGRkNWJiODc3NzY4Y2I0ZGE2MDJkNjdhNjp7Il9hdXRoX3VzZXJfaWQiOiI0MSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNjNjYWU3ZjhjNmMyODVjMzA4ZTMzMDJkYjBmYzNmM2RjMTE4NzBiMiJ9', '2020-10-11 14:56:51.448050'),
('tfsouagj8t9qv5yfzmmxf7w9mjke5u2h', 'MjMxZWM3YzZiYWYzNWUyOTJhZWZiZTk5NDk4YTBmNGMwYjU5ZDcwMTp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmUwMmMzZmFiMWNiYTkzYmM5MGZhMzUyNzgxMDVmZWIxMWJlZWVhNCJ9', '2020-09-13 23:18:10.392752'),
('tsqshymov0htd4y12s2u7xrobb8rt4ns', 'MjMxZWM3YzZiYWYzNWUyOTJhZWZiZTk5NDk4YTBmNGMwYjU5ZDcwMTp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmUwMmMzZmFiMWNiYTkzYmM5MGZhMzUyNzgxMDVmZWIxMWJlZWVhNCJ9', '2020-09-10 14:30:46.851539'),
('tvuj7ifpkttp6754yj01visxn1t53jhu', '.eJxVjEEOwiAQRe_C2hAGplBcuvcMhM4MUjVtUtqV8e7apAvd_vfef6mUt7WmrcmSRlZnBVGdfsch00OmnfA9T7dZ0zytyzjoXdEHbfo6szwvh_t3UHOr39o6bwYXWWwkY4EQivcloKMuxM4bEQSUQkjE2IP1AaAHKuwMZras3h_vKjef:1k77CW:R5O2WodGAoQ0naWPN6DQIXc3FI69TiL5Qf1ynQyvhKg', '2020-08-30 01:11:08.415943'),
('u0x7xzwpm4jcotow5agc3q063hp9mhy9', 'MjMxZWM3YzZiYWYzNWUyOTJhZWZiZTk5NDk4YTBmNGMwYjU5ZDcwMTp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmUwMmMzZmFiMWNiYTkzYmM5MGZhMzUyNzgxMDVmZWIxMWJlZWVhNCJ9', '2020-09-29 00:08:03.568094'),
('u37u9z2p8iinacdw6lt9ovaum7tmfwap', 'MjMxZWM3YzZiYWYzNWUyOTJhZWZiZTk5NDk4YTBmNGMwYjU5ZDcwMTp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmUwMmMzZmFiMWNiYTkzYmM5MGZhMzUyNzgxMDVmZWIxMWJlZWVhNCJ9', '2020-10-05 16:07:25.178673'),
('uw7myn2v28konw567sfz600kv9dbmcz4', '.eJxVjMsOwiAQRf-FtSEDDI-6dO83kBkgUjWQlHZl_Hdt0oVu7znnvkSkba1xG2WJcxZnoYM4_Y5M6VHaTvKd2q3L1Nu6zCx3RR50yGvP5Xk53L-DSqN-awBiG4i8Dg65EDIUYDt5l0gRgA8mkbUGLKGbvM5ee42IKqNTBpN4fwD6Pzb6:1kAaLH:dWsEGJad5QPwkyvHVRgJzKFnYIRMXPksf1SNJxKHP-s', '2020-09-08 14:54:31.496545'),
('uyld5c9vq4bhvxulp6j2uor4ij27qzzh', 'OGM4OWFmN2IwMTdiMDM0N2EyMjUzZmRjZmYyNzEzYTQyM2NhZjgxZjp7Il9hdXRoX3VzZXJfaWQiOiIxOSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDEwNmRlY2YzYmU1Nzc5NjMwOTU1MGMzMmI2NTk5MWRiZWE2ZWJjNiJ9', '2020-09-01 20:38:58.104774'),
('v0kn1it3lp4n8oel6pqnt0lv7ewq89wt', 'N2Y0YThiYWIyMmI2OGQwYjNkNWY5ZjAwNTY4Zjg5MzExMjM2ZGQ1Mjp7Il9hdXRoX3VzZXJfaWQiOiI1MCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMmM1ZTM5NzAxMGZkZjliZTdhN2IzNDg3YWE4OGUyMDZhMDZjZGU0OSJ9', '2020-10-16 12:47:55.500169'),
('vhjqdpl8ib0lk5ojybmqc2ead8kcs2hc', 'ZDNhYjZlZjQ3M2ZjY2U0Nzg4NzQxMDFkMjlkNDc3Y2Y5N2NiM2VhYjp7Il9hdXRoX3VzZXJfaWQiOiIzMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZWUzMmQxMWIzNzQ0MWQ0MTU2MWEwZTQ3ZTJmNWZmYTVkNDY0ZGRjNyJ9', '2020-09-11 03:14:16.133649'),
('vmwnxgqd52zl93wsfik819jeo3ohvsiu', 'MWZhY2FiMDBlMzM5YTAzNGIzNGQwYzg2MGVkZDA1M2FjNDc0MjJmMjp7Il9hdXRoX3VzZXJfaWQiOiIzNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNDYwODJjNDcwMWIzN2JhYzZjMDg3ZTFlODQzMjQ4MjMyYzhmMzIzZiJ9', '2020-09-15 14:58:10.676176'),
('vsiqm0aim0ldzzse0aifzf7ovs0q63uq', 'MjMxZWM3YzZiYWYzNWUyOTJhZWZiZTk5NDk4YTBmNGMwYjU5ZDcwMTp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmUwMmMzZmFiMWNiYTkzYmM5MGZhMzUyNzgxMDVmZWIxMWJlZWVhNCJ9', '2020-10-10 17:05:19.235245'),
('wdmxrt490iv8vh8dw4tmitxhn2kb6qng', 'MjMxZWM3YzZiYWYzNWUyOTJhZWZiZTk5NDk4YTBmNGMwYjU5ZDcwMTp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmUwMmMzZmFiMWNiYTkzYmM5MGZhMzUyNzgxMDVmZWIxMWJlZWVhNCJ9', '2020-10-14 16:28:58.326730'),
('wxnj7kokne0lzjuz6g5ejmrwk2to4cl1', 'MjMxZWM3YzZiYWYzNWUyOTJhZWZiZTk5NDk4YTBmNGMwYjU5ZDcwMTp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmUwMmMzZmFiMWNiYTkzYmM5MGZhMzUyNzgxMDVmZWIxMWJlZWVhNCJ9', '2020-09-22 21:18:44.809400'),
('xmn2mpws924smkecoa6q520do0wukfrw', 'MjMxZWM3YzZiYWYzNWUyOTJhZWZiZTk5NDk4YTBmNGMwYjU5ZDcwMTp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmUwMmMzZmFiMWNiYTkzYmM5MGZhMzUyNzgxMDVmZWIxMWJlZWVhNCJ9', '2020-10-01 13:49:07.044323'),
('xs0ye5bojh6pefk7onjz7pirimjve4g0', 'MjMxZWM3YzZiYWYzNWUyOTJhZWZiZTk5NDk4YTBmNGMwYjU5ZDcwMTp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmUwMmMzZmFiMWNiYTkzYmM5MGZhMzUyNzgxMDVmZWIxMWJlZWVhNCJ9', '2020-10-05 20:29:51.118165'),
('yk9gugr1hmn89s2xvxp3vl17l4e7t9p0', 'MjMxZWM3YzZiYWYzNWUyOTJhZWZiZTk5NDk4YTBmNGMwYjU5ZDcwMTp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmUwMmMzZmFiMWNiYTkzYmM5MGZhMzUyNzgxMDVmZWIxMWJlZWVhNCJ9', '2020-09-20 23:04:57.732727'),
('yznd4fsbryvlr1wzuykqu4op4my7i3d4', 'N2Y0YThiYWIyMmI2OGQwYjNkNWY5ZjAwNTY4Zjg5MzExMjM2ZGQ1Mjp7Il9hdXRoX3VzZXJfaWQiOiI1MCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMmM1ZTM5NzAxMGZkZjliZTdhN2IzNDg3YWE4OGUyMDZhMDZjZGU0OSJ9', '2020-10-16 22:56:40.269471'),
('z7asrmjy3dzvvtrilxmw27p7h2jca1wj', 'MjMxZWM3YzZiYWYzNWUyOTJhZWZiZTk5NDk4YTBmNGMwYjU5ZDcwMTp7Il9hdXRoX3VzZXJfaWQiOiIyOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmUwMmMzZmFiMWNiYTkzYmM5MGZhMzUyNzgxMDVmZWIxMWJlZWVhNCJ9', '2020-10-13 00:24:13.405487'),
('zf8rc9tvidpx98rg6fvgi3r3tfkvrdwd', '.eJxVjMsOwiAQRf-FtSGADA-X7vsNhIFBqgaS0q6M_65NutDtPefcFwtxW2vYBi1hzuzClGCn3xFjelDbSb7Hdus89bYuM_Jd4QcdfOqZntfD_TuocdRvjR6U1GB0VA4TFZuEJQtZEmmjcylOOiigSHibCBNEMCiL1N6d0ROx9wcL-Dh7:1k8taL:ZFGHwWqGEgtx_WAW_7jPy3puY3-9Dzrq2JqOk_CYyvU', '2020-09-03 23:03:05.924435'),
('zn0mk0ia6b571euk031sy4of6zg7v28r', '.eJxVjEEOwiAQRe_C2hAGplBcuvcMhM4MUjVtUtqV8e7apAvd_vfef6mUt7WmrcmSRlZnBVGdfsch00OmnfA9T7dZ0zytyzjoXdEHbfo6szwvh_t3UHOr39o6bwYXWWwkY4EQivcloKMuxM4bEQSUQkjE2IP1AaAHKuwMZras3h_vKjef:1k6fjV:BhuElRBRUbU0hAwUK50PQePEYmYupZrUZtmBYmc81EM', '2020-08-28 19:51:21.135654'),
('zt7tquq3bkndfbtudajw7nqcb3wsv8yh', '.eJxVjEEOgjAQRe_StWnoSDvFpXvOQGY6g6CmTSisjHdXEha6_e-9_zIDbes0bFWXYRZzMa4zp9-RKT0070TulG_FppLXZWa7K_ag1fZF9Hk93L-Dier0rUcvTUOq4LQ9a9KEDpvE5EWoZYfMEBAwBgUO0JGnyDFEGL0ThDia9wcvQjiU:1k8U1Z:3f1FDZnsL9-h7HRKvTqG1QsPbR5b-_UEcHiib54xgww', '2020-09-02 19:45:29.342553');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

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
