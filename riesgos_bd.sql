-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-09-2020 a las 21:39:05
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

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `crear_linea_base` (IN `var_gerente_id` INT, IN `var_proyecto_id` INT, IN `var_linea_base` INT)  NO SQL
BEGIN
####################################################################
## PRIMERO ACTUALIZO EL CAMPO DE LINEA BASE EN LA TABLA 'riesgos_bd'
####################################################################
##########################
UPDATE 
	`riesgos_bd`.`gerente` g
SET 
	g.`proyecto_linea_base` = var_linea_base
WHERE 
	g.`gerente_id` = var_gerente_id;
##########################
UPDATE 
	`riesgos_bd`.`proyecto` p 
SET 
	p.`proyecto_linea_base`= var_linea_base
WHERE 
	p.`proyecto_id` = var_proyecto_id;
##########################
UPDATE 
	`riesgos_bd`.`actividad` a 
SET 
	a.`proyecto_linea_base` = var_linea_base
WHERE
	a.`proyecto_id` = var_proyecto_id;
##########################
UPDATE 
	`riesgos_bd`.`rbs` r 
SET 
	r.`proyecto_linea_base` = var_linea_base 
WHERE 
	r.`gerente_id` = var_gerente_id;
##########################
UPDATE 
	`riesgos_bd`.`categoria` c 
INNER JOIN 
	`riesgos_bd`.`sub_categoria` sc 
ON 
	c.`categoria_id` = sc.`categoria_id` 
INNER JOIN 
	`riesgos_bd`.`riesgo` r 
ON 
	sc.`sub_categoria_id` = r.`sub_categoria_id` 
INNER JOIN 
	`riesgos_bd`.`proyecto_has_riesgo` phr 
ON 
	r.`riesgo_id` = phr.`riesgo_id` 
SET 
	c.`proyecto_linea_base` = var_linea_base 
WHERE 
	phr.`proyecto_id` = var_proyecto_id;
##################################
UPDATE 
	`riesgos_bd`.`sub_categoria` sc
INNER JOIN 
	`riesgos_bd`.`riesgo` r
ON 
	sc.`sub_categoria_id` = r.`sub_categoria_id`
INNER JOIN 
	`riesgos_bd`.`proyecto_has_riesgo` phr
ON
	r.`riesgo_id` = phr.`riesgo_id`
SET 
	sc.`proyecto_linea_base` = var_linea_base
WHERE
    phr.`proyecto_id` = var_proyecto_id;
###################################
UPDATE 
	`riesgos_bd`.`clasificacion_riesgo` cr
SET 
	cr.`proyecto_linea_base` = var_linea_base
WHERE
	cr.`proyecto_id` = var_proyecto_id;
##################################
UPDATE 
	`riesgos_bd`.`impacto` i
SET 
	i.`proyecto_linea_base` = var_linea_base 
WHERE
	i.`proyecto_id` = var_proyecto_id;
##################################
UPDATE 
	`riesgos_bd`.`propabilidad` p
SET 
	p.`proyecto_linea_base` = var_linea_base
WHERE 
	p.`proyecto_id` = var_proyecto_id;
##################################
UPDATE 
	`riesgos_bd`.`proyecto_has_riesgo` phr
SET 
	phr.`proyecto_linea_base` = var_linea_base 
WHERE 
	phr.`proyecto_id` = var_proyecto_id;
##################################
UPDATE 
	`riesgos_bd`.`proyecto_has_riesgo_actividad` phra 
INNER JOIN
	`riesgos_bd`.`proyecto_has_riesgo` phr
ON
	phra.`proyecto_has_riesgo_id` = phr.`proyecto_has_riesgo_id`
SET 
	phra.`proyecto_linea_base` = var_linea_base 
WHERE
    phr.`proyecto_id` = var_proyecto_id;
###################################
UPDATE 
	`riesgos_bd`.`tipo_recurso` tr
SET 
	tr.`proyecto_linea_base` = var_linea_base	
WHERE 
	tr.`gerente_id` = var_gerente_id;
###################################
UPDATE 
	`riesgos_bd`.`recurso` r 
SET 
	r.`proyecto_linea_base` = var_linea_base
WHERE
	r.`proyecto_id` = var_proyecto_id;
###################################
UPDATE 
	`riesgos_bd`.`riesgo` r
INNER JOIN 
	`riesgos_bd`.`proyecto_has_riesgo` phr
ON
	r.`riesgo_id` = phr.`riesgo_id`
SET 
	r.`proyecto_linea_base` = var_linea_base 
WHERE
    phr.`proyecto_id` = var_proyecto_id;
###################################
UPDATE 
	`riesgos_bd`.`respuesta` rta 
INNER JOIN 
	`riesgos_bd`.`riesgo_has_respuesta` rhr
ON
	rta.`respuesta_id` = rhr.`respuesta_id`
INNER JOIN
	`riesgos_bd`.`riesgo` r
ON 
	rhr.`riesgo_id` = r.`riesgo_id`
INNER JOIN 
	`riesgos_bd`.`proyecto_has_riesgo` phr
ON
	r.`riesgo_id` = phr.`riesgo_id`
SET 
	rta.`proyecto_linea_base` = var_linea_base
WHERE
    phr.`proyecto_id` = var_proyecto_id;
###################################
UPDATE 
	`riesgos_bd`.`riesgo_has_respuesta` rhr
INNER JOIN 
	`riesgos_bd`.`proyecto_has_riesgo_respuesta` phrr
ON
	rhr.`riesgo_has_respuesta_id` = phrr.`respuesta_has_id`
INNER JOIN 
	`riesgos_bd`.`proyecto_has_riesgo` phr
ON
	phrr.`proyecto_has_id` = phr.`proyecto_has_riesgo_id`
SET 
	rhr.`proyecto_linea_base` = var_linea_base
WHERE
    phr.`proyecto_id` = var_proyecto_id;
#####################################
UPDATE 
	`riesgos_bd`.`proyecto_has_riesgo_respuesta` phrr
INNER JOIN 
	`riesgos_bd`.`proyecto_has_riesgo` phr
ON
	phrr.`proyecto_has_id` = phr.`proyecto_has_riesgo_id`
SET 
	phrr.`proyecto_linea_base` = var_linea_base
WHERE
    phr.`proyecto_id` = var_proyecto_id;
#######################################
UPDATE 
	`riesgos_bd`.`responsble`r
SET 
	r.`proyecto_linea_base` = var_linea_base
WHERE
    r.`proyecto_id` = var_proyecto_id;
#######################################
UPDATE 
	`riesgos_bd`.`rol` r
SET
	r.`proyecto_linea_base` = var_linea_base
WHERE
    r.`gerente_id` = var_gerente_id;
#######################################
UPDATE 
	`riesgos_bd`.`tarea` t
INNER JOIN 
	`riesgos_bd`.`tarea_has_recurso` thr
ON 
	t.`tarea_id` = thr.`tarea_id`
INNER JOIN 
	`riesgos_bd`.`recurso` r
ON 
	thr.`recurso_id` = r.`recurso_id`
SET
	r.`proyecto_linea_base` = var_linea_base
WHERE
    r.`proyecto_id` = var_proyecto_id;
#######################################
UPDATE 
	`riesgos_bd`.`tarea_has_recurso` thr
INNER JOIN 
	`riesgos_bd`.`recurso` r
ON 
	thr.`recurso_id` = r.`recurso_id`
SET
	r.`proyecto_linea_base` = var_linea_base
WHERE
    r.`proyecto_id` = var_proyecto_id;
#######################################


####################################################################
## LUEGO COPIO TODO DE LA TABLA 'riesgos_bd' A 'riesgos_base'
####################################################################
############################################
INSERT INTO `riesgos_base`.`gerente`(
    `gerente_id`,
    `proyecto_linea_base`,
    `gerente_nombre`,
    `gerente_usuario`,
    `gerente_correo`,
    `gerente_fecha_creacion`,
    `gerente_correo_institucional`,
    `gerente_profesion`,
    `gerente_empresa`,
    `gerente_metodologias`,
    `gerente_certificaciones`,
    `sector_id`,
    `pais_id`
)
SELECT
    `gerente_id`,
    `proyecto_linea_base`,
    `gerente_nombre`,
    `gerente_usuario`,
    `gerente_correo`,
    `gerente_fecha_creacion`,
    `gerente_correo_institucional`,
    `gerente_profesion`,
    `gerente_empresa`,
    `gerente_metodologias`,
    `gerente_certificaciones`,
    `sector_id`,
    `pais_id` 
FROM 
	`riesgos_bd`.`gerente`
WHERE 
	`riesgos_bd`.`gerente`.`gerente_id` = var_gerente_id;
#############################################
INSERT INTO `riesgos_base`.`proyecto`(
    `proyecto_id`,
    `proyecto_nombre`,
    `proyecto_objetivo`,
    `proyecto_alcance`,
    `proyecto_descripcion`,
    `proyecto_presupuesto`,
    `proyecto_fecha_inicio`,
    `proyecto_fecha_finl`,
    `proyecto_evaluacion_general`,
    `proyecto_evaluacion`,
    `proyecto_rbs_status`,
    `proyecto_fin_status`,
    `gerente_id`,
    `sector_id`,
    `proyecto_linea_base`
)
SELECT
    `proyecto_id`,
    `proyecto_nombre`,
    `proyecto_objetivo`,
    `proyecto_alcance`,
    `proyecto_descripcion`,
    `proyecto_presupuesto`,
    `proyecto_fecha_inicio`,
    `proyecto_fecha_finl`,
    `proyecto_evaluacion_general`,
    `proyecto_evaluacion`,
    `proyecto_rbs_status`,
    `proyecto_fin_status`,
    `gerente_id`,
    `sector_id`,
    `proyecto_linea_base`
FROM
    `riesgos_bd`.`proyecto`
WHERE
    `riesgos_bd`.`proyecto`.`proyecto_id` = var_proyecto_id;
############################################
INSERT INTO `riesgos_base`.`actividad`(
    `actividad_id`,
    `actividad_orden`,
    `actividad_uuid`,
    `actividad_nombre`,
    `actividad_level`,
    `actividad_wbs`,
    `proyecto_id`,
    `proyecto_linea_base`
)
SELECT
    `actividad_id`,
    `actividad_orden`,
    `actividad_uuid`,
    `actividad_nombre`,
    `actividad_level`,
    `actividad_wbs`,
    `proyecto_id`,
    `proyecto_linea_base`
FROM
    `riesgos_bd`.`actividad`
WHERE
    `riesgos_bd`.`actividad`.`proyecto_id` = var_proyecto_id;
##############################################
INSERT INTO `riesgos_base`.`rbs`(
    `rbs_id`,
    `rbs_default`,
    `gerente_id`,
    `proyecto_linea_base`
)
SELECT
    `rbs_id`,
    `rbs_default`,
    `gerente_id`,
    `proyecto_linea_base`
FROM
    `riesgos_bd`.`rbs`
WHERE
    `riesgos_bd`.`rbs`.`gerente_id` = var_gerente_id;
############################################
INSERT INTO `riesgos_base`.`categoria`(
    `categoria_id`,
    `categoria_nombre`,
    `categoria_descripcion`,
    `categoria_default`,
    `categoria_uid`,
    `rbs_id`,
    `proyecto_linea_base`
)
SELECT DISTINCT
    c.`categoria_id`,
    c.`categoria_nombre`,
    c.`categoria_descripcion`,
    c.`categoria_default`,
    c.`categoria_uid`,
    c.`rbs_id`,
    c.`proyecto_linea_base`
FROM
    `riesgos_bd`.`categoria` c
INNER JOIN
	`riesgos_bd`.`sub_categoria` sc
ON
	c.`categoria_id` = sc.`categoria_id`
INNER JOIN 
	`riesgos_bd`.`riesgo` r
ON 
	sc.`sub_categoria_id` = r.`sub_categoria_id`
INNER JOIN 
	`riesgos_bd`.`proyecto_has_riesgo` phr
ON
	r.`riesgo_id` = phr.`riesgo_id`
WHERE
    phr.`proyecto_id` = var_proyecto_id;
#######################################
INSERT INTO `riesgos_base`.`sub_categoria`(
    `sub_categoria_id`,
    `sub_categoria_nombre`,
    `sub_categoria_descripcion`,
    `sub_categoria_default`,
    `sub_categoria_uid`,    
    `categoria_id`,
    `proyecto_linea_base`
)
SELECT DISTINCT
    sc.`sub_categoria_id`,
    sc.`sub_categoria_nombre`,
    sc.`sub_categoria_descripcion`,
    sc.`sub_categoria_default`,
    sc.`sub_categoria_uid`,    
    sc.`categoria_id`,
    sc.`proyecto_linea_base`
FROM
    `riesgos_bd`.`sub_categoria` sc
INNER JOIN 
	`riesgos_bd`.`riesgo` r
ON 
	sc.`sub_categoria_id` = r.`sub_categoria_id`
INNER JOIN 
	`riesgos_bd`.`proyecto_has_riesgo` phr
ON
	r.`riesgo_id` = phr.`riesgo_id`
WHERE
    phr.`proyecto_id` = var_proyecto_id;
##############################################
INSERT INTO `riesgos_base`.`clasificacion_riesgo`(
    `clasificacion_riesgo_id`,
    `clasificacion_riesgo_nombre`,
    `clasificacion_riesgo_min`,
    `clasificacion_riesgo_max`,
    `clasificacion_color`,
    `proyecto_id`,
    `proyecto_linea_base`
)
SELECT
    `clasificacion_riesgo_id`,
    `clasificacion_riesgo_nombre`,
    `clasificacion_riesgo_min`,
    `clasificacion_riesgo_max`,
    `clasificacion_color`,
    `proyecto_id`,
    `proyecto_linea_base`
FROM
    `riesgos_bd`.`clasificacion_riesgo`
WHERE
    `riesgos_bd`.`clasificacion_riesgo`.`proyecto_id` = var_proyecto_id;
######################################
INSERT INTO `riesgos_base`.`impacto`(
    `impacto_id`,
    `impacto_categoria`,
    `impacto_valor`,
    `proyecto_id`,
    `proyecto_linea_base`
)
SELECT
    `impacto_id`,
    `impacto_categoria`,
    `impacto_valor`,
    `proyecto_id`,
    `proyecto_linea_base`
FROM
    `riesgos_bd`.`impacto`
WHERE
    `riesgos_bd`.`impacto`.`proyecto_id` = var_proyecto_id;
##########################################
INSERT INTO `riesgos_base`.`propabilidad`(
    `propabilidad_id`,
    `propabilidad_categoria`,
    `propabilidad_valor`,
    `proyecto_id`,
    `proyecto_linea_base`
)
SELECT
    `propabilidad_id`,
    `propabilidad_categoria`,
    `propabilidad_valor`,
    `proyecto_id`,
    `proyecto_linea_base`
FROM
    `riesgos_bd`.`propabilidad`
WHERE
    `riesgos_bd`.`propabilidad`.`proyecto_id` = var_proyecto_id;
#####################################
INSERT INTO `riesgos_base`.`rol`(
    `rol_id`,
    `rol_nombre`,
    `rol_descripcion`,
    `gerente_id`,
    `proyecto_linea_base`
)
SELECT
    `rol_id`,
    `rol_nombre`,
    `rol_descripcion`,
    `gerente_id`,
    `proyecto_linea_base`
FROM
    `riesgos_bd`.`rol`
WHERE
    `riesgos_bd`.`rol`.`gerente_id` = var_gerente_id;
##########################################
INSERT INTO `riesgos_base`.`responsble`(
    `responsable_id`,
    `responsble_nombre`,
    `responsble_descripcion`,
    `rol_id`,
    `proyecto_id`,
    `proyecto_linea_base`
)
SELECT
    `responsable_id`,
    `responsble_nombre`,
    `responsble_descripcion`,
    `rol_id`,
    `proyecto_id`,
    `proyecto_linea_base`
FROM
    `riesgos_bd`.`responsble`
WHERE
    `riesgos_bd`.`responsble`.`proyecto_id` = var_proyecto_id; 
#########################################
INSERT INTO `riesgos_base`.`riesgo`(
    `riesgo_id`,
    `proyecto_linea_base`,
    `riesgo_nombre`,
    `riesgo_causa`,
    `riesgo_evento`,
    `riesgo_efecto`,
    `riesgo_tipo`,
    `riesgo_prom_evaluacion`,
    `riesgo_uid`,
    `sub_categoria_id`
)
SELECT
    r.`riesgo_id`,
    r.`proyecto_linea_base`,
    r.`riesgo_nombre`,
    r.`riesgo_causa`,
    r.`riesgo_evento`,
    r.`riesgo_efecto`,
    r.`riesgo_tipo`,
    r.`riesgo_prom_evaluacion`,
    r.`riesgo_uid`,
    r.`sub_categoria_id`
FROM
    `riesgos_bd`.`riesgo` r
INNER JOIN 
	`riesgos_bd`.`proyecto_has_riesgo` phr
ON
	r.`riesgo_id` = phr.`riesgo_id`
WHERE
    phr.`proyecto_id` = var_proyecto_id;       
##########################################
INSERT INTO `riesgos_base`.`proyecto_has_riesgo`(
    `proyecto_has_riesgo_id`,
    `riesgo_id`,
    `is_editado`,
    `impacto_id`,
    `propabilidad_id`,
    `fecha_manifestacion`,
    `proyecto_id`,
    `responsable_id`,
    `proyecto_linea_base`
)
SELECT
    `proyecto_has_riesgo_id`,
    `riesgo_id`,
    `is_editado`,
    `impacto_id`,
    `propabilidad_id`,
    `fecha_manifestacion`,
    `proyecto_id`,
    `responsable_id`,
    `proyecto_linea_base`
FROM
    `riesgos_bd`.`proyecto_has_riesgo`
WHERE
    `riesgos_bd`.`proyecto_has_riesgo`.`proyecto_id` = var_proyecto_id;
###############################################
INSERT INTO `riesgos_base`.`proyecto_has_riesgo_actividad`(
    `proyecto_has_riesgo_actividad_id`,
    `actividad_id`,
    `proyecto_has_riesgo_id`,
    `proyecto_linea_base`
)
SELECT
    phra.`proyecto_has_riesgo_actividad_id`,
    phra.`actividad_id`,
    phra.`proyecto_has_riesgo_id`,
    phra.`proyecto_linea_base`
FROM
    `riesgos_bd`.`proyecto_has_riesgo_actividad` phra
INNER JOIN
	`riesgos_bd`.`proyecto_has_riesgo` phr
ON
	phra.`proyecto_has_riesgo_id` = phr.`proyecto_has_riesgo_id`
WHERE
    phr.`proyecto_id` = var_proyecto_id;
######################################################
INSERT INTO `riesgos_base`.`tipo_recurso`(
    `tipo_recurso_id`,
    `tipo_recurso_nombre`,
    `tipo_recurso_descripcion`,
    `gerente_id`,
    `proyecto_linea_base`
)
SELECT
    `tipo_recurso_id`,
    `tipo_recurso_nombre`,
    `tipo_recurso_descripcion`,
    `gerente_id`,
    `proyecto_linea_base`
FROM
    `riesgos_bd`.`tipo_recurso`
WHERE
    `riesgos_bd`.`tipo_recurso`.`gerente_id` = var_gerente_id;
#############################################################    
INSERT INTO `riesgos_base`.`recurso`(
    `recurso_id`,
    `recurso_nombre`,
    `recurso_costo`,
    `proyecto_id`,
    `tipo_recurso_id`,
    `proyecto_linea_base`
)
SELECT
    `recurso_id`,
    `recurso_nombre`,
    `recurso_costo`,
    `proyecto_id`,
    `tipo_recurso_id`,
    `proyecto_linea_base`
FROM
    `riesgos_bd`.`recurso`
WHERE
    `riesgos_bd`.`recurso`.`proyecto_id` = var_proyecto_id;

#################################################  
INSERT INTO `riesgos_base`.`respuesta`(
    `respuesta_id`,
    `respuesta_nombre`,
    `respuesta_descripcion`,
    `respuesta_costo`,
    `proyecto_linea_base`
)
SELECT DISTINCT
    rta.`respuesta_id`,
    rta.`respuesta_nombre`,
    rta.`respuesta_descripcion`,
    rta.`respuesta_costo`,
    rta.`proyecto_linea_base`
FROM
    `riesgos_bd`.`respuesta` rta
INNER JOIN 
	`riesgos_bd`.`riesgo_has_respuesta` rhr
ON
	rta.`respuesta_id` = rhr.`respuesta_id`
INNER JOIN
	`riesgos_bd`.`riesgo` r
ON 
	rhr.`riesgo_id` = r.`riesgo_id`
INNER JOIN 
	`riesgos_bd`.`proyecto_has_riesgo` phr
ON
	r.`riesgo_id` = phr.`riesgo_id`
WHERE
    phr.`proyecto_id` = var_proyecto_id;
####################################################  
INSERT INTO `riesgos_base`.`riesgo_has_respuesta`(
    `riesgo_has_respuesta_id`,
    `riesgo_id`,
    `respuesta_id`,
    `proyecto_linea_base`
)
SELECT
    rhr.`riesgo_has_respuesta_id`,
    rhr.`riesgo_id`,
    rhr.`respuesta_id`,
    rhr.`proyecto_linea_base`
FROM
    `riesgos_bd`.`riesgo_has_respuesta` rhr
INNER JOIN 
	`riesgos_bd`.`proyecto_has_riesgo_respuesta` phrr
ON
	rhr.`riesgo_has_respuesta_id` = phrr.`respuesta_has_id`
INNER JOIN 
	`riesgos_bd`.`proyecto_has_riesgo` phr
ON
	phrr.`proyecto_has_id` = phr.`proyecto_has_riesgo_id`
WHERE
    phr.`proyecto_id` = var_proyecto_id;
###########################################
INSERT INTO `riesgos_base`.`proyecto_has_riesgo_respuesta`(
    `proyecto_has_id`,
    `respuesta_has_id`,
    `tipo_respuesta`,
    `proyecto_linea_base`
)
SELECT
    phrr.`proyecto_has_id`,
    phrr.`respuesta_has_id`,
    phrr.`tipo_respuesta`,
    phrr.`proyecto_linea_base`
FROM
    `riesgos_bd`.`proyecto_has_riesgo_respuesta` phrr
INNER JOIN 
	`riesgos_bd`.`proyecto_has_riesgo` phr
ON
	phrr.`proyecto_has_id` = phr.`proyecto_has_riesgo_id`
WHERE
    phr.`proyecto_id` = var_proyecto_id;
######################################
INSERT INTO `riesgos_base`.`tarea`(
    `tarea_id`,
    `proyecto_linea_base`,
    `tarea_nombre`,
    `tarea_descripcion`,
    `proyecto_has_riesgo_id`,
    `riesgo_has_respuesta_id`,
    `fecha_inicio`,
    `duracion`,
    `fecha_fin`
)
SELECT DISTINCT
    t.`tarea_id`,
    t.`proyecto_linea_base`,
    t.`tarea_nombre`,
    t.`tarea_descripcion`,
    t.`proyecto_has_riesgo_id`,
    t.`riesgo_has_respuesta_id`,
    t.`fecha_inicio`,
    t.`duracion`,
    t.`fecha_fin`
FROM
    `riesgos_bd`.`tarea` t
INNER JOIN 
	`riesgos_bd`.`tarea_has_recurso` thr
ON 
	t.`tarea_id` = thr.`tarea_id`
INNER JOIN 
	`riesgos_bd`.`recurso` r
ON 
	thr.`recurso_id` = r.`recurso_id`
WHERE
    r.`proyecto_id` = var_proyecto_id;
############################################
INSERT INTO `riesgos_base`.`tarea_has_recurso`(
    `tarea_id`,
    `recurso_id`,
    `proyecto_linea_base`,
    `cantidad`
)
SELECT
    thr.`tarea_id`,
    thr.`recurso_id`,
    thr.`proyecto_linea_base`,
    thr.`cantidad`
FROM
    `riesgos_bd`.`tarea_has_recurso` thr
INNER JOIN 
	`riesgos_bd`.`recurso` r
ON 
	thr.`recurso_id` = r.`recurso_id`
WHERE
    r.`proyecto_id` = var_proyecto_id;
###############################################
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividad`
--

CREATE TABLE `actividad` (
  `actividad_id` varchar(45) CHARACTER SET utf8 NOT NULL,
  `actividad_orden` int(11) NOT NULL,
  `actividad_uuid` int(11) NOT NULL,
  `actividad_nombre` varchar(100) NOT NULL,
  `actividad_level` int(11) DEFAULT NULL,
  `actividad_wbs` varchar(100) DEFAULT NULL,
  `proyecto_id` int(11) NOT NULL,
  `proyecto_linea_base` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `actividad`
--

INSERT INTO `actividad` (`actividad_id`, `actividad_orden`, `actividad_uuid`, `actividad_nombre`, `actividad_level`, `actividad_wbs`, `proyecto_id`, `proyecto_linea_base`) VALUES
('p_13_a_0', 0, 0, 'Proyecto1', 0, '0', 13, 0),
('p_13_a_10', 52, 10, 'SE 1.2: Modulo de trabajos, tareas y refuerzos ', 3, '1.1.2', 13, 0),
('p_13_a_101', 43, 101, 'Identificar los casos de pruebas unitarias ', 5, '1.1.1.4.2', 13, 0),
('p_13_a_107', 24, 107, 'Realizar el modelo conceptual de los datos ', 5, '1.1.1.2.9', 13, 0),
('p_13_a_108', 29, 108, 'Aceptar el glosario de términos ', 5, '1.1.1.2.14', 13, 0),
('p_13_a_1175', 332, 1175, 'SE 3.1: Capacitación a 650 docentes ', 3, '1.3.1', 13, 0),
('p_13_a_1176', 333, 1176, 'PAQ 1.1: Planificación ', 4, '1.3.1.1', 13, 0),
('p_13_a_1177', 334, 1177, 'Desarrollar el material multimedia para la capacitación ', 5, '1.3.1.1.1', 13, 0),
('p_13_a_1178', 335, 1178, 'Definir logística de la capacitación ', 5, '1.3.1.1.2', 13, 0),
('p_13_a_1184', 343, 1184, 'PAQ 1.2: Desarrollo ', 4, '1.3.1.2', 13, 0),
('p_13_a_1185', 344, 1185, 'Realizar las capacitaciones ', 5, '1.3.1.2.1', 13, 0),
('p_13_a_1186', 346, 1186, 'Registrar asistencia ', 5, '1.3.1.2.3', 13, 0),
('p_13_a_1187', 345, 1187, 'Aplicar cuestionario ', 5, '1.3.1.2.2', 13, 0),
('p_13_a_1188', 347, 1188, 'Capturar evidencias ', 5, '1.3.1.2.4', 13, 0),
('p_13_a_1189', 348, 1189, 'Capturar correcciones y mejoras ', 5, '1.3.1.2.5', 13, 0),
('p_13_a_1190', 349, 1190, 'Finalizar capacitación ', 5, '1.3.1.2.6', 13, 0),
('p_13_a_1191', 350, 1191, 'PAQ 1.3: Evaluación ', 4, '1.3.1.3', 13, 0),
('p_13_a_1192', 351, 1192, 'Analizar resultados de los cuestionarios ', 5, '1.3.1.3.1', 13, 0),
('p_13_a_1193', 352, 1193, 'Documentar la capacitación ', 5, '1.3.1.3.2', 13, 0),
('p_13_a_1194', 353, 1194, 'Documentar las correcciones y mejoras ', 5, '1.3.1.3.3', 13, 0),
('p_13_a_1195', 354, 1195, 'Publicar resultados de las capacitaciones ', 5, '1.3.1.3.4', 13, 0),
('p_13_a_1196', 355, 1196, 'Publicar las evidencias ', 5, '1.3.1.3.5', 13, 0),
('p_13_a_1197', 356, 1197, 'Publicar contenido de las capacitaciones ', 5, '1.3.1.3.6', 13, 0),
('p_13_a_1198', 357, 1198, 'Entregar resultados ', 5, '1.3.1.3.7', 13, 0),
('p_13_a_120', 31, 120, 'PAQ 1.3: Codificación ', 4, '1.1.1.3', 13, 0),
('p_13_a_123', 32, 123, 'Desarrollar las interfaces de usuario ', 5, '1.1.1.3.1', 13, 0),
('p_13_a_1271', 385, 1271, 'SE 3.3: Correcciones y mejoras ', 3, '1.3.3', 13, 0),
('p_13_a_1272', 386, 1272, 'PAQ 5.1: Planificación ', 4, '1.3.3.1', 13, 0),
('p_13_a_1273', 387, 1273, 'Identificar las historias de usuario defectuosas ', 5, '1.3.3.1.1', 13, 0),
('p_13_a_1274', 388, 1274, 'Corregir las historias de usuario defectuosas ', 5, '1.3.3.1.2', 13, 0),
('p_13_a_1275', 389, 1275, 'Formalizar las historias de usuario ', 5, '1.3.3.1.3', 13, 0),
('p_13_a_1276', 390, 1276, 'relacionar las historias de usuario ', 5, '1.3.3.1.4', 13, 0),
('p_13_a_1277', 391, 1277, 'Formalizar el mapa de historias de usuario ', 5, '1.3.3.1.5', 13, 0),
('p_13_a_1278', 392, 1278, 'PAQ 5.2: Implementación ', 4, '1.3.3.2', 13, 0),
('p_13_a_1279', 393, 1279, 'Corregir las interfaces de usuario ', 5, '1.3.3.2.1', 13, 0),
('p_13_a_128', 30, 128, 'Aceptar los mockups de las interfaces de usuario ', 5, '1.1.1.2.15', 13, 0),
('p_13_a_1280', 394, 1280, 'Aplicar reingeniería al código fuente ', 5, '1.3.3.2.2', 13, 0),
('p_13_a_1281', 395, 1281, 'Unir las características del modulo ', 5, '1.3.3.2.3', 13, 0),
('p_13_a_1282', 396, 1282, 'Integrar el módulo al repositorio central ', 5, '1.3.3.2.4', 13, 0),
('p_13_a_1283', 397, 1283, 'Actualizar el documento de lecciones aprendidas ', 5, '1.3.3.2.5', 13, 0),
('p_13_a_1285', 25, 1285, 'Realizar el modelo entidad relación ', 5, '1.1.1.2.10', 13, 0),
('p_13_a_1286', 26, 1286, 'Aceptar el modelo de datos ', 5, '1.1.1.2.11', 13, 0),
('p_13_a_1289', 34, 1289, 'Desarrollar requerimientos funcionales del rol estudiante ', 5, '1.1.1.3.3', 13, 0),
('p_13_a_129', 27, 129, 'Modelar los mockups de las interfaces de usuario ', 5, '1.1.1.2.12', 13, 0),
('p_13_a_1291', 35, 1291, 'Desarrollar requerimientos funcionales del rol docente ', 5, '1.1.1.3.4', 13, 0),
('p_13_a_1322', 36, 1322, 'Desarrollar requerimientos funcionales del rol padre de familia ', 5, '1.1.1.3.5', 13, 0),
('p_13_a_1323', 38, 1323, 'Desarrollar requerimientos funcionales del rol administrador ', 5, '1.1.1.3.7', 13, 0),
('p_13_a_1324', 37, 1324, 'Desarrollar requerimientos funcionales del rol coordinador ', 5, '1.1.1.3.6', 13, 0),
('p_13_a_1325', 207, 1325, 'Crear plan de pruebas ', 5, '1.1.5.2.4', 13, 0),
('p_13_a_1327', 219, 1327, 'Definir encuesta de satisfacción, registro de asistencia y registro de correcciones y mejoras ', 5, '1.2.1.1.3', 13, 0),
('p_13_a_1328', 222, 1328, 'Adquirir encuestas de satisfacción, registro de asistencia y registro de correcciones y mejoras ', 5, '1.2.1.1.6', 13, 0),
('p_13_a_1329', 223, 1329, 'Adquirir kit de capacitación, pendones y volantes de publicidad ', 5, '1.2.1.1.7', 13, 0),
('p_13_a_1331', 230, 1331, 'Capturar correcciones y mejoras ', 5, '1.2.1.2.5', 13, 0),
('p_13_a_1334', 227, 1334, 'Aplicar cuestionario ', 5, '1.2.1.2.2', 13, 0),
('p_13_a_1340', 224, 1340, 'Aceptar el material trabajo  ', 5, '1.2.1.1.8', 13, 0),
('p_13_a_1341', 336, 1341, 'Definir encuesta de satisfacción, registro de asistencia y registro de correcciones y mejoras ', 5, '1.3.1.1.3', 13, 0),
('p_13_a_1342', 337, 1342, 'Publicar la convocatoria ', 5, '1.3.1.1.4', 13, 0),
('p_13_a_1343', 338, 1343, 'Aceptar la documentación por parte de la secretaria de educación ', 5, '1.3.1.1.5', 13, 0),
('p_13_a_1344', 339, 1344, 'Adquirir encuestas de satisfacción, registro de asistencia y registro de correcciones y mejoras ', 5, '1.3.1.1.6', 13, 0),
('p_13_a_1345', 340, 1345, 'Adquirir kit de capacitación, pendones y volantes de publicidad ', 5, '1.3.1.1.7', 13, 0),
('p_13_a_1346', 341, 1346, 'Adquirir refrigerio docentes ', 5, '1.3.1.1.8', 13, 0),
('p_13_a_1347', 342, 1347, 'Aceptar el material trabajo ', 5, '1.3.1.1.9', 13, 0),
('p_13_a_136', 41, 136, 'PAQ 1.4: Pruebas ', 4, '1.1.1.4', 13, 0),
('p_13_a_137', 8, 137, 'Realizar entrega formal de historias de usuario ', 5, '1.1.1.1.4', 13, 0),
('p_13_a_138', 9, 138, 'relacionar las historias de usuario ', 5, '1.1.1.1.5', 13, 0),
('p_13_a_139', 10, 139, 'Mapear el Big Picture ', 5, '1.1.1.1.6', 13, 0),
('p_13_a_140', 11, 140, 'Definir el backbone ', 5, '1.1.1.1.7', 13, 0),
('p_13_a_141', 12, 141, 'Definir el walking skeleton ', 5, '1.1.1.1.8', 13, 0),
('p_13_a_1410', 45, 1410, 'Realizar pruebas de aplicación ', 5, '1.1.1.4.4', 13, 0),
('p_13_a_1411', 46, 1411, 'Realizar pruebas de integración ', 5, '1.1.1.4.5', 13, 0),
('p_13_a_142', 7, 142, 'Formalizar las historias de usuario ', 5, '1.1.1.1.3', 13, 0),
('p_13_a_143', 6, 143, 'Efectuar reunión con un grupo de usuarios finales ', 5, '1.1.1.1.2', 13, 0),
('p_13_a_144', 18, 144, 'Aceptar las tarjetas crc ', 5, '1.1.1.2.3', 13, 0),
('p_13_a_145', 19, 145, 'Describir las capas del sistema ', 5, '1.1.1.2.4', 13, 0),
('p_13_a_146', 20, 146, 'Definir la vista estructural ', 5, '1.1.1.2.5', 13, 0),
('p_13_a_1467', 100, 1467, 'PAQ 3.1: Planificación ', 4, '1.1.3.1', 13, 0),
('p_13_a_1468', 101, 1468, 'Efectuar reunión con el patrocinador ', 5, '1.1.3.1.1', 13, 0),
('p_13_a_1469', 102, 1469, 'Efectuar reunión con un grupo de usuarios finales ', 5, '1.1.3.1.2', 13, 0),
('p_13_a_1470', 103, 1470, 'Formalizar las historias de usuario ', 5, '1.1.3.1.3', 13, 0),
('p_13_a_1471', 104, 1471, 'Realizar entrega formal de historias de usuario ', 5, '1.1.3.1.4', 13, 0),
('p_13_a_1472', 105, 1472, 'relacionar las historias de usuario ', 5, '1.1.3.1.5', 13, 0),
('p_13_a_1473', 106, 1473, 'Mapear el Big Picture ', 5, '1.1.3.1.6', 13, 0),
('p_13_a_1474', 107, 1474, 'Definir el backbone ', 5, '1.1.3.1.7', 13, 0),
('p_13_a_1475', 108, 1475, 'Definir el walking skeleton ', 5, '1.1.3.1.8', 13, 0),
('p_13_a_1476', 109, 1476, 'Formalizar el mapa de historias de usuario ', 5, '1.1.3.1.9', 13, 0),
('p_13_a_1477', 110, 1477, 'Formalizar el plan de entrega ', 5, '1.1.3.1.10', 13, 0),
('p_13_a_1478', 111, 1478, 'PAQ 3.2: Diseño ', 4, '1.1.3.2', 13, 0),
('p_13_a_1479', 112, 1479, 'Definir las tarjetas CRC ', 5, '1.1.3.2.1', 13, 0),
('p_13_a_148', 22, 148, 'Desarrollar la vista de implementación ', 5, '1.1.1.2.7', 13, 0),
('p_13_a_1480', 113, 1480, 'Relacionar tarjetas ', 5, '1.1.3.2.2', 13, 0),
('p_13_a_1481', 114, 1481, 'Aceptar las tarjetas crc ', 5, '1.1.3.2.3', 13, 0),
('p_13_a_1482', 115, 1482, 'Describir las capas del sistema ', 5, '1.1.3.2.4', 13, 0),
('p_13_a_1483', 116, 1483, 'Definir la vista estructural ', 5, '1.1.3.2.5', 13, 0),
('p_13_a_1484', 117, 1484, 'Diseñar el modelo de despliegue ', 5, '1.1.3.2.6', 13, 0),
('p_13_a_1485', 118, 1485, 'Desarrollar la vista de implementación ', 5, '1.1.3.2.7', 13, 0),
('p_13_a_1486', 119, 1486, 'Definir la arquitectura ', 5, '1.1.3.2.8', 13, 0),
('p_13_a_1487', 120, 1487, 'Realizar el modelo conceptual de los datos ', 5, '1.1.3.2.9', 13, 0),
('p_13_a_1488', 121, 1488, 'Realizar el modelo entidad relación ', 5, '1.1.3.2.10', 13, 0),
('p_13_a_1489', 122, 1489, 'Aceptar el modelo de datos ', 5, '1.1.3.2.11', 13, 0),
('p_13_a_149', 17, 149, 'Relacionar tarjetas ', 5, '1.1.1.2.2', 13, 0),
('p_13_a_1490', 123, 1490, 'Modelar los mockups de las interfaces de usuario ', 5, '1.1.3.2.12', 13, 0),
('p_13_a_1491', 124, 1491, 'Construir el glosario de términos ', 5, '1.1.3.2.13', 13, 0),
('p_13_a_1492', 125, 1492, 'Aceptar el glosario de términos ', 5, '1.1.3.2.14', 13, 0),
('p_13_a_1493', 126, 1493, 'Aceptar los mockups de las interfaces de usuario ', 5, '1.1.3.2.15', 13, 0),
('p_13_a_1494', 127, 1494, 'PAQ 3.3: Codificación ', 4, '1.1.3.3', 13, 0),
('p_13_a_1495', 128, 1495, 'Desarrollar las interfaces de usuario ', 5, '1.1.3.3.1', 13, 0),
('p_13_a_1496', 129, 1496, 'Aceptar las interfaces de usuario ', 5, '1.1.3.3.2', 13, 0),
('p_13_a_1497', 130, 1497, 'Desarrollar requerimientos funcionales del rol estudiante ', 5, '1.1.3.3.3', 13, 0),
('p_13_a_1498', 131, 1498, 'Desarrollar requerimientos funcionales del rol docente ', 5, '1.1.3.3.4', 13, 0),
('p_13_a_1499', 132, 1499, 'Desarrollar requerimientos funcionales del rol padre de familia ', 5, '1.1.3.3.5', 13, 0),
('p_13_a_150', 16, 150, 'Definir las tarjetas CRC ', 5, '1.1.1.2.1', 13, 0),
('p_13_a_1500', 133, 1500, 'Desarrollar requerimientos funcionales del rol coordinador ', 5, '1.1.3.3.6', 13, 0),
('p_13_a_1502', 134, 1502, 'Aceptar los requerimientos funcionales ', 5, '1.1.3.3.7', 13, 0),
('p_13_a_1503', 135, 1503, 'Integrar el módulo al repositorio central ', 5, '1.1.3.3.8', 13, 0),
('p_13_a_1504', 136, 1504, 'PAQ 3.4: Pruebas ', 4, '1.1.3.4', 13, 0),
('p_13_a_155', 28, 155, 'Construir el glosario de términos ', 5, '1.1.1.2.13', 13, 0),
('p_13_a_1555', 53, 1555, 'PAQ 2.1: Planificación ', 4, '1.1.2.1', 13, 0),
('p_13_a_1556', 54, 1556, 'Efectuar reunión con el patrocinador ', 5, '1.1.2.1.1', 13, 0),
('p_13_a_1557', 55, 1557, 'Efectuar reunión con un grupo de usuarios finales ', 5, '1.1.2.1.2', 13, 0),
('p_13_a_1558', 56, 1558, 'Formalizar las historias de usuario ', 5, '1.1.2.1.3', 13, 0),
('p_13_a_1559', 57, 1559, 'Realizar entrega formal de historias de usuario ', 5, '1.1.2.1.4', 13, 0),
('p_13_a_1560', 58, 1560, 'relacionar las historias de usuario ', 5, '1.1.2.1.5', 13, 0),
('p_13_a_1561', 59, 1561, 'Mapear el Big Picture ', 5, '1.1.2.1.6', 13, 0),
('p_13_a_1562', 60, 1562, 'Definir el backbone ', 5, '1.1.2.1.7', 13, 0),
('p_13_a_1563', 61, 1563, 'Definir el walking skeleton ', 5, '1.1.2.1.8', 13, 0),
('p_13_a_1564', 62, 1564, 'Formalizar el mapa de historias de usuario ', 5, '1.1.2.1.9', 13, 0),
('p_13_a_1565', 63, 1565, 'Formalizar el plan de entrega ', 5, '1.1.2.1.10', 13, 0),
('p_13_a_1566', 64, 1566, 'PAQ 2.2: Diseño ', 4, '1.1.2.2', 13, 0),
('p_13_a_1567', 65, 1567, 'Definir las tarjetas CRC ', 5, '1.1.2.2.1', 13, 0),
('p_13_a_1568', 66, 1568, 'Relacionar tarjetas ', 5, '1.1.2.2.2', 13, 0),
('p_13_a_1569', 67, 1569, 'Aceptar las tarjetas crc ', 5, '1.1.2.2.3', 13, 0),
('p_13_a_157', 39, 157, 'Aceptar los requerimientos funcionales ', 5, '1.1.1.3.8', 13, 0),
('p_13_a_1570', 68, 1570, 'Describir las capas del sistema ', 5, '1.1.2.2.4', 13, 0),
('p_13_a_1571', 69, 1571, 'Definir la vista estructural ', 5, '1.1.2.2.5', 13, 0),
('p_13_a_1572', 70, 1572, 'Diseñar el modelo de despliegue ', 5, '1.1.2.2.6', 13, 0),
('p_13_a_1573', 71, 1573, 'Desarrollar la vista de implementación ', 5, '1.1.2.2.7', 13, 0),
('p_13_a_1574', 72, 1574, 'Definir la arquitectura ', 5, '1.1.2.2.8', 13, 0),
('p_13_a_1575', 73, 1575, 'Realizar el modelo conceptual de los datos ', 5, '1.1.2.2.9', 13, 0),
('p_13_a_1576', 74, 1576, 'Realizar el modelo entidad relación ', 5, '1.1.2.2.10', 13, 0),
('p_13_a_1577', 75, 1577, 'Aceptar el modelo de datos ', 5, '1.1.2.2.11', 13, 0),
('p_13_a_1578', 76, 1578, 'Modelar los mockups de las interfaces de usuario ', 5, '1.1.2.2.12', 13, 0),
('p_13_a_1579', 77, 1579, 'Construir el glosario de términos ', 5, '1.1.2.2.13', 13, 0),
('p_13_a_1580', 78, 1580, 'Aceptar el glosario de términos ', 5, '1.1.2.2.14', 13, 0),
('p_13_a_1581', 79, 1581, 'Aceptar los mockups de las interfaces de usuario ', 5, '1.1.2.2.15', 13, 0),
('p_13_a_1582', 80, 1582, 'PAQ 2.3: Codificación ', 4, '1.1.2.3', 13, 0),
('p_13_a_1583', 81, 1583, 'Desarrollar las interfaces de usuario ', 5, '1.1.2.3.1', 13, 0),
('p_13_a_1584', 82, 1584, 'Aceptar las interfaces de usuario ', 5, '1.1.2.3.2', 13, 0),
('p_13_a_1585', 83, 1585, 'Desarrollar requerimientos funcionales del rol estudiante ', 5, '1.1.2.3.3', 13, 0),
('p_13_a_1586', 84, 1586, 'Desarrollar requerimientos funcionales del rol docente ', 5, '1.1.2.3.4', 13, 0),
('p_13_a_1587', 85, 1587, 'Desarrollar requerimientos funcionales del rol padre de familia ', 5, '1.1.2.3.5', 13, 0),
('p_13_a_159', 33, 159, 'Aceptar las interfaces de usuario ', 5, '1.1.1.3.2', 13, 0),
('p_13_a_1590', 86, 1590, 'Aceptar los requerimientos funcionales ', 5, '1.1.2.3.6', 13, 0),
('p_13_a_1591', 87, 1591, 'Integrar el módulo al repositorio central ', 5, '1.1.2.3.7', 13, 0),
('p_13_a_1592', 88, 1592, 'PAQ 2.4: Pruebas ', 4, '1.1.2.4', 13, 0),
('p_13_a_1599', 148, 1599, 'PAQ 4.1: Planificación ', 4, '1.1.4.1', 13, 0),
('p_13_a_1600', 149, 1600, 'Efectuar reunión con el patrocinador ', 5, '1.1.4.1.1', 13, 0),
('p_13_a_1601', 150, 1601, 'Efectuar reunión con un grupo de usuarios finales ', 5, '1.1.4.1.2', 13, 0),
('p_13_a_1602', 151, 1602, 'Formalizar las historias de usuario ', 5, '1.1.4.1.3', 13, 0),
('p_13_a_1603', 152, 1603, 'Realizar entrega formal de historias de usuario ', 5, '1.1.4.1.4', 13, 0),
('p_13_a_1604', 153, 1604, 'relacionar las historias de usuario ', 5, '1.1.4.1.5', 13, 0),
('p_13_a_1605', 154, 1605, 'Mapear el Big Picture ', 5, '1.1.4.1.6', 13, 0),
('p_13_a_1606', 155, 1606, 'Definir el backbone ', 5, '1.1.4.1.7', 13, 0),
('p_13_a_1607', 156, 1607, 'Definir el walking skeleton ', 5, '1.1.4.1.8', 13, 0),
('p_13_a_1608', 157, 1608, 'Formalizar el mapa de historias de usuario ', 5, '1.1.4.1.9', 13, 0),
('p_13_a_1609', 158, 1609, 'Formalizar el plan de entrega ', 5, '1.1.4.1.10', 13, 0),
('p_13_a_1610', 159, 1610, 'PAQ 4.2: Diseño ', 4, '1.1.4.2', 13, 0),
('p_13_a_1611', 160, 1611, 'Definir las tarjetas CRC ', 5, '1.1.4.2.1', 13, 0),
('p_13_a_1612', 161, 1612, 'Relacionar tarjetas ', 5, '1.1.4.2.2', 13, 0),
('p_13_a_1613', 162, 1613, 'Aceptar las tarjetas crc ', 5, '1.1.4.2.3', 13, 0),
('p_13_a_1614', 163, 1614, 'Describir las capas del sistema ', 5, '1.1.4.2.4', 13, 0),
('p_13_a_1615', 164, 1615, 'Definir la vista estructural ', 5, '1.1.4.2.5', 13, 0),
('p_13_a_1616', 165, 1616, 'Diseñar el modelo de despliegue ', 5, '1.1.4.2.6', 13, 0),
('p_13_a_1617', 166, 1617, 'Desarrollar la vista de implementación ', 5, '1.1.4.2.7', 13, 0),
('p_13_a_1618', 167, 1618, 'Definir la arquitectura ', 5, '1.1.4.2.8', 13, 0),
('p_13_a_1619', 168, 1619, 'Realizar el modelo conceptual de los datos ', 5, '1.1.4.2.9', 13, 0),
('p_13_a_1620', 169, 1620, 'Realizar el modelo entidad relación ', 5, '1.1.4.2.10', 13, 0),
('p_13_a_1621', 170, 1621, 'Aceptar el modelo de datos ', 5, '1.1.4.2.11', 13, 0),
('p_13_a_1622', 171, 1622, 'Modelar los mockups de las interfaces de usuario ', 5, '1.1.4.2.12', 13, 0),
('p_13_a_1623', 172, 1623, 'Construir el glosario de términos ', 5, '1.1.4.2.13', 13, 0),
('p_13_a_1624', 173, 1624, 'Aceptar el glosario de términos ', 5, '1.1.4.2.14', 13, 0),
('p_13_a_1625', 174, 1625, 'Aceptar los mockups de las interfaces de usuario ', 5, '1.1.4.2.15', 13, 0),
('p_13_a_1626', 175, 1626, 'PAQ 4.3: Codificación ', 4, '1.1.4.3', 13, 0),
('p_13_a_1627', 176, 1627, 'Desarrollar las interfaces de usuario ', 5, '1.1.4.3.1', 13, 0),
('p_13_a_1628', 177, 1628, 'Aceptar las interfaces de usuario ', 5, '1.1.4.3.2', 13, 0),
('p_13_a_1629', 178, 1629, 'Desarrollar requerimientos funcionales del rol estudiante ', 5, '1.1.4.3.3', 13, 0),
('p_13_a_1630', 179, 1630, 'Desarrollar requerimientos funcionales del rol docente ', 5, '1.1.4.3.4', 13, 0),
('p_13_a_1631', 180, 1631, 'Desarrollar requerimientos funcionales del rol padre de familia ', 5, '1.1.4.3.5', 13, 0),
('p_13_a_1632', 181, 1632, 'Desarrollar requerimientos funcionales del rol coordinador ', 5, '1.1.4.3.6', 13, 0),
('p_13_a_1633', 182, 1633, 'Desarrollar requerimientos funcionales del rol administrador ', 5, '1.1.4.3.7', 13, 0),
('p_13_a_1634', 183, 1634, 'Aceptar los requerimientos funcionales ', 5, '1.1.4.3.8', 13, 0),
('p_13_a_1635', 184, 1635, 'Integrar el módulo al repositorio central ', 5, '1.1.4.3.9', 13, 0),
('p_13_a_1636', 185, 1636, 'PAQ 4.4: Pruebas ', 4, '1.1.4.4', 13, 0),
('p_13_a_1643', 242, 1643, 'PAQ 2.1: Planificación ', 4, '1.2.2.1', 13, 0),
('p_13_a_1644', 243, 1644, 'Desarrollar el material multimedia para la capacitación ', 5, '1.2.2.1.1', 13, 0),
('p_13_a_1645', 244, 1645, 'Definir logística de la capacitación ', 5, '1.2.2.1.2', 13, 0),
('p_13_a_1647', 245, 1647, 'Publicar la convocatoria ', 5, '1.2.2.1.3', 13, 0),
('p_13_a_1648', 246, 1648, 'Aceptar la documentación por parte de la secretaria de educación ', 5, '1.2.2.1.4', 13, 0),
('p_13_a_1649', 247, 1649, 'Adquirir encuestas de satisfacción, registro de asistencia y registro de correcciones y mejoras ', 5, '1.2.2.1.5', 13, 0),
('p_13_a_1650', 248, 1650, 'Adquirir kit de capacitación, y volantes de publicidad ', 5, '1.2.2.1.6', 13, 0),
('p_13_a_1651', 249, 1651, 'Aceptar el material trabajo  ', 5, '1.2.2.1.7', 13, 0),
('p_13_a_1652', 250, 1652, 'PAQ 2.2: Desarrollo ', 4, '1.2.2.2', 13, 0),
('p_13_a_1653', 251, 1653, 'Realizar las capacitaciones ', 5, '1.2.2.2.1', 13, 0),
('p_13_a_1654', 252, 1654, 'Aplicar cuestionario ', 5, '1.2.2.2.2', 13, 0),
('p_13_a_1655', 253, 1655, 'Registrar asistencia ', 5, '1.2.2.2.3', 13, 0),
('p_13_a_1656', 254, 1656, 'Capturar evidencias ', 5, '1.2.2.2.4', 13, 0),
('p_13_a_1657', 255, 1657, 'Capturar correcciones y mejoras ', 5, '1.2.2.2.5', 13, 0),
('p_13_a_1658', 256, 1658, 'Finalizar capacitación ', 5, '1.2.2.2.6', 13, 0),
('p_13_a_1659', 257, 1659, 'PAQ 2.3: Evaluación ', 4, '1.2.2.3', 13, 0),
('p_13_a_1660', 258, 1660, 'Analizar resultados de los cuestionarios ', 5, '1.2.2.3.1', 13, 0),
('p_13_a_1661', 259, 1661, 'Documentar la capacitación ', 5, '1.2.2.3.2', 13, 0),
('p_13_a_1662', 260, 1662, 'Documentar las correcciones y mejoras ', 5, '1.2.2.3.3', 13, 0),
('p_13_a_1663', 261, 1663, 'Publicar resultados de las capacitaciones ', 5, '1.2.2.3.4', 13, 0),
('p_13_a_1664', 262, 1664, 'Publicar las evidencias ', 5, '1.2.2.3.5', 13, 0),
('p_13_a_1665', 263, 1665, 'Publicar contenido de las capacitaciones ', 5, '1.2.2.3.6', 13, 0),
('p_13_a_1666', 264, 1666, 'Entregar resultados ', 5, '1.2.2.3.7', 13, 0),
('p_13_a_1667', 267, 1667, 'PAQ 3.1: Planificación ', 4, '1.2.3.1', 13, 0),
('p_13_a_1668', 268, 1668, 'Desarrollar el material multimedia para la capacitación ', 5, '1.2.3.1.1', 13, 0),
('p_13_a_1669', 269, 1669, 'Definir logística de la capacitación ', 5, '1.2.3.1.2', 13, 0),
('p_13_a_1670', 270, 1670, 'Publicar la convocatoria ', 5, '1.2.3.1.3', 13, 0),
('p_13_a_1671', 271, 1671, 'Aceptar la documentación por parte de la secretaria de educación ', 5, '1.2.3.1.4', 13, 0),
('p_13_a_1672', 272, 1672, 'Adquirir encuestas de satisfacción, registro de asistencia y registro de correcciones y mejoras ', 5, '1.2.3.1.5', 13, 0),
('p_13_a_1673', 273, 1673, 'Adquirir kit de capacitación, y volantes de publicidad ', 5, '1.2.3.1.6', 13, 0),
('p_13_a_1674', 274, 1674, 'Aceptar el material trabajo  ', 5, '1.2.3.1.7', 13, 0),
('p_13_a_1675', 275, 1675, 'PAQ 3.2: Desarrollo ', 4, '1.2.3.2', 13, 0),
('p_13_a_1676', 276, 1676, 'Realizar las capacitaciones ', 5, '1.2.3.2.1', 13, 0),
('p_13_a_1677', 277, 1677, 'Aplicar cuestionario ', 5, '1.2.3.2.2', 13, 0),
('p_13_a_1678', 278, 1678, 'Registrar asistencia ', 5, '1.2.3.2.3', 13, 0),
('p_13_a_1679', 279, 1679, 'Capturar evidencias ', 5, '1.2.3.2.4', 13, 0),
('p_13_a_1680', 280, 1680, 'Capturar correcciones y mejoras ', 5, '1.2.3.2.5', 13, 0),
('p_13_a_1681', 281, 1681, 'Finalizar capacitación ', 5, '1.2.3.2.6', 13, 0),
('p_13_a_1682', 282, 1682, 'PAQ 3.3: Evaluación ', 4, '1.2.3.3', 13, 0),
('p_13_a_1683', 283, 1683, 'Analizar resultados de los cuestionarios ', 5, '1.2.3.3.1', 13, 0),
('p_13_a_1684', 284, 1684, 'Documentar la capacitación ', 5, '1.2.3.3.2', 13, 0),
('p_13_a_1685', 285, 1685, 'Documentar las correcciones y mejoras ', 5, '1.2.3.3.3', 13, 0),
('p_13_a_1686', 286, 1686, 'Publicar resultados de las capacitaciones ', 5, '1.2.3.3.4', 13, 0),
('p_13_a_1687', 287, 1687, 'Publicar las evidencias ', 5, '1.2.3.3.5', 13, 0),
('p_13_a_1688', 288, 1688, 'Publicar contenido de las capacitaciones ', 5, '1.2.3.3.6', 13, 0),
('p_13_a_1689', 289, 1689, 'Entregar resultados ', 5, '1.2.3.3.7', 13, 0),
('p_13_a_1690', 292, 1690, 'PAQ 4.1: Planificación ', 4, '1.2.4.1', 13, 0),
('p_13_a_1691', 293, 1691, 'Desarrollar el material multimedia para la capacitación ', 5, '1.2.4.1.1', 13, 0),
('p_13_a_1692', 294, 1692, 'Definir logística de la capacitación ', 5, '1.2.4.1.2', 13, 0),
('p_13_a_1693', 295, 1693, 'Publicar la convocatoria ', 5, '1.2.4.1.3', 13, 0),
('p_13_a_1694', 296, 1694, 'Aceptar la documentación por parte de la secretaria de educación ', 5, '1.2.4.1.4', 13, 0),
('p_13_a_1695', 297, 1695, 'Adquirir encuestas de satisfacción, registro de asistencia y registro de correcciones y mejoras ', 5, '1.2.4.1.5', 13, 0),
('p_13_a_1696', 298, 1696, 'Adquirir kit de capacitación, y volantes de publicidad ', 5, '1.2.4.1.6', 13, 0),
('p_13_a_1697', 299, 1697, 'Aceptar el material trabajo ', 5, '1.2.4.1.7', 13, 0),
('p_13_a_1698', 300, 1698, 'PAQ 4.2: Desarrollo ', 4, '1.2.4.2', 13, 0),
('p_13_a_1699', 301, 1699, 'Realizar las capacitaciones ', 5, '1.2.4.2.1', 13, 0),
('p_13_a_1700', 302, 1700, 'Aplicar cuestionario ', 5, '1.2.4.2.2', 13, 0),
('p_13_a_1701', 303, 1701, 'Registrar asistencia ', 5, '1.2.4.2.3', 13, 0),
('p_13_a_1702', 304, 1702, 'Capturar evidencias ', 5, '1.2.4.2.4', 13, 0),
('p_13_a_1703', 305, 1703, 'Capturar correcciones y mejoras ', 5, '1.2.4.2.5', 13, 0),
('p_13_a_1704', 306, 1704, 'Finalizar capacitación ', 5, '1.2.4.2.6', 13, 0),
('p_13_a_1705', 307, 1705, 'PAQ 4.3: Evaluación ', 4, '1.2.4.3', 13, 0),
('p_13_a_1706', 308, 1706, 'Analizar resultados de los cuestionarios ', 5, '1.2.4.3.1', 13, 0),
('p_13_a_1707', 309, 1707, 'Documentar la capacitación ', 5, '1.2.4.3.2', 13, 0),
('p_13_a_1708', 310, 1708, 'Documentar las correcciones y mejoras ', 5, '1.2.4.3.3', 13, 0),
('p_13_a_1709', 311, 1709, 'Publicar resultados de las capacitaciones ', 5, '1.2.4.3.4', 13, 0),
('p_13_a_1710', 312, 1710, 'Publicar las evidencias ', 5, '1.2.4.3.5', 13, 0),
('p_13_a_1711', 313, 1711, 'Publicar contenido de las capacitaciones ', 5, '1.2.4.3.6', 13, 0),
('p_13_a_1712', 314, 1712, 'Entregar resultados ', 5, '1.2.4.3.7', 13, 0),
('p_13_a_1713', 400, 1713, 'E4: Capacitación a 4300 estudiantes ', 2, '1.4', 13, 0),
('p_13_a_1714', 401, 1714, 'SE 4.1: Capacitación a 1075 estudiantes ', 3, '1.4.1', 13, 0),
('p_13_a_1715', 402, 1715, 'PAQ 1.1: Planificación ', 4, '1.4.1.1', 13, 0),
('p_13_a_1716', 403, 1716, 'Desarrollar el material multimedia para la capacitación ', 5, '1.4.1.1.1', 13, 0),
('p_13_a_1717', 404, 1717, 'Definir logística de la capacitación ', 5, '1.4.1.1.2', 13, 0),
('p_13_a_1718', 405, 1718, 'Definir encuesta de satisfacción, registro de asistencia y registro de correcciones y mejoras ', 5, '1.4.1.1.3', 13, 0),
('p_13_a_1719', 406, 1719, 'Publicar la convocatoria ', 5, '1.4.1.1.4', 13, 0),
('p_13_a_1720', 407, 1720, 'Aceptar la documentación por parte de la secretaria de educación ', 5, '1.4.1.1.5', 13, 0),
('p_13_a_1721', 408, 1721, 'Adquirir encuestas de satisfacción, registro de asistencia y registro de correcciones y mejoras ', 5, '1.4.1.1.6', 13, 0),
('p_13_a_1722', 409, 1722, 'Adquirir kit de capacitación, pendones y volantes de publicidad ', 5, '1.4.1.1.7', 13, 0),
('p_13_a_1723', 410, 1723, 'Aceptar el material trabajo  ', 5, '1.4.1.1.8', 13, 0),
('p_13_a_1724', 411, 1724, 'PAQ 1.2: Desarrollo ', 4, '1.4.1.2', 13, 0),
('p_13_a_1725', 412, 1725, 'Realizar las capacitaciones ', 5, '1.4.1.2.1', 13, 0),
('p_13_a_1726', 413, 1726, 'Aplicar cuestionario ', 5, '1.4.1.2.2', 13, 0),
('p_13_a_1727', 414, 1727, 'Registrar asistencia ', 5, '1.4.1.2.3', 13, 0),
('p_13_a_1728', 415, 1728, 'Capturar evidencias ', 5, '1.4.1.2.4', 13, 0),
('p_13_a_1729', 416, 1729, 'Capturar correcciones y mejoras ', 5, '1.4.1.2.5', 13, 0),
('p_13_a_1730', 417, 1730, 'Finalizar capacitación ', 5, '1.4.1.2.6', 13, 0),
('p_13_a_1731', 418, 1731, 'PAQ 1.3: Evaluación ', 4, '1.4.1.3', 13, 0),
('p_13_a_1732', 419, 1732, 'Analizar resultados de los cuestionarios ', 5, '1.4.1.3.1', 13, 0),
('p_13_a_1733', 420, 1733, 'Documentar la capacitación ', 5, '1.4.1.3.2', 13, 0),
('p_13_a_1734', 421, 1734, 'Documentar las correcciones y mejoras ', 5, '1.4.1.3.3', 13, 0),
('p_13_a_1735', 422, 1735, 'Publicar resultados de las capacitaciones ', 5, '1.4.1.3.4', 13, 0),
('p_13_a_1736', 423, 1736, 'Publicar las evidencias ', 5, '1.4.1.3.5', 13, 0),
('p_13_a_1737', 424, 1737, 'Publicar contenido de las capacitaciones ', 5, '1.4.1.3.6', 13, 0),
('p_13_a_1738', 425, 1738, 'Entregar resultados ', 5, '1.4.1.3.7', 13, 0),
('p_13_a_1739', 427, 1739, 'SE 4.2: Capacitación a 1075 estudiantes ', 3, '1.4.2', 13, 0),
('p_13_a_1740', 428, 1740, 'PAQ 2.1: Planificación ', 4, '1.4.2.1', 13, 0),
('p_13_a_1741', 429, 1741, 'Desarrollar el material multimedia para la capacitación ', 5, '1.4.2.1.1', 13, 0),
('p_13_a_1742', 430, 1742, 'Definir logística de la capacitación ', 5, '1.4.2.1.2', 13, 0),
('p_13_a_1743', 431, 1743, 'Publicar la convocatoria ', 5, '1.4.2.1.3', 13, 0),
('p_13_a_1744', 432, 1744, 'Aceptar la documentación por parte de la secretaria de educación ', 5, '1.4.2.1.4', 13, 0),
('p_13_a_1745', 433, 1745, 'Adquirir encuestas de satisfacción, registro de asistencia y registro de correcciones y mejoras ', 5, '1.4.2.1.5', 13, 0),
('p_13_a_1746', 434, 1746, 'Adquirir kit de capacitación, y volantes de publicidad ', 5, '1.4.2.1.6', 13, 0),
('p_13_a_1747', 435, 1747, 'Aceptar el material trabajo ', 5, '1.4.2.1.7', 13, 0),
('p_13_a_1748', 436, 1748, 'PAQ 2.2: Desarrollo ', 4, '1.4.2.2', 13, 0),
('p_13_a_1749', 437, 1749, 'Realizar las capacitaciones ', 5, '1.4.2.2.1', 13, 0),
('p_13_a_1750', 438, 1750, 'Aplicar cuestionario ', 5, '1.4.2.2.2', 13, 0),
('p_13_a_1751', 439, 1751, 'Registrar asistencia ', 5, '1.4.2.2.3', 13, 0),
('p_13_a_1752', 440, 1752, 'Capturar evidencias ', 5, '1.4.2.2.4', 13, 0),
('p_13_a_1753', 441, 1753, 'Capturar correcciones y mejoras ', 5, '1.4.2.2.5', 13, 0),
('p_13_a_1754', 442, 1754, 'Finalizar capacitación ', 5, '1.4.2.2.6', 13, 0),
('p_13_a_1755', 443, 1755, 'PAQ 2.3: Evaluación ', 4, '1.4.2.3', 13, 0),
('p_13_a_1756', 444, 1756, 'Analizar resultados de los cuestionarios ', 5, '1.4.2.3.1', 13, 0),
('p_13_a_1757', 445, 1757, 'Documentar la capacitación ', 5, '1.4.2.3.2', 13, 0),
('p_13_a_1758', 446, 1758, 'Documentar las correcciones y mejoras ', 5, '1.4.2.3.3', 13, 0),
('p_13_a_1759', 447, 1759, 'Publicar resultados de las capacitaciones ', 5, '1.4.2.3.4', 13, 0),
('p_13_a_1760', 448, 1760, 'Publicar las evidencias ', 5, '1.4.2.3.5', 13, 0),
('p_13_a_1761', 449, 1761, 'Publicar contenido de las capacitaciones ', 5, '1.4.2.3.6', 13, 0),
('p_13_a_1762', 450, 1762, 'Entregar resultados ', 5, '1.4.2.3.7', 13, 0),
('p_13_a_1763', 452, 1763, 'SE 4.3: Capacitación a 1075 estudiantes ', 3, '1.4.3', 13, 0),
('p_13_a_1764', 453, 1764, 'PAQ 3.1: Planificación ', 4, '1.4.3.1', 13, 0),
('p_13_a_1765', 454, 1765, 'Desarrollar el material multimedia para la capacitación ', 5, '1.4.3.1.1', 13, 0),
('p_13_a_1766', 455, 1766, 'Definir logística de la capacitación ', 5, '1.4.3.1.2', 13, 0),
('p_13_a_1767', 456, 1767, 'Publicar la convocatoria ', 5, '1.4.3.1.3', 13, 0),
('p_13_a_1768', 457, 1768, 'Aceptar la documentación por parte de la secretaria de educación ', 5, '1.4.3.1.4', 13, 0),
('p_13_a_1769', 458, 1769, 'Adquirir encuestas de satisfacción, registro de asistencia y registro de correcciones y mejoras ', 5, '1.4.3.1.5', 13, 0),
('p_13_a_1770', 459, 1770, 'Adquirir kit de capacitación, y volantes de publicidad ', 5, '1.4.3.1.6', 13, 0),
('p_13_a_1771', 460, 1771, 'Aceptar el material trabajo  ', 5, '1.4.3.1.7', 13, 0),
('p_13_a_1772', 461, 1772, 'PAQ 3.2: Desarrollo ', 4, '1.4.3.2', 13, 0),
('p_13_a_1773', 462, 1773, 'Realizar las capacitaciones ', 5, '1.4.3.2.1', 13, 0),
('p_13_a_1774', 463, 1774, 'Aplicar cuestionario ', 5, '1.4.3.2.2', 13, 0),
('p_13_a_1775', 464, 1775, 'Registrar asistencia ', 5, '1.4.3.2.3', 13, 0),
('p_13_a_1776', 465, 1776, 'Capturar evidencias ', 5, '1.4.3.2.4', 13, 0),
('p_13_a_1777', 466, 1777, 'Capturar correcciones y mejoras ', 5, '1.4.3.2.5', 13, 0),
('p_13_a_1778', 467, 1778, 'Finalizar capacitación ', 5, '1.4.3.2.6', 13, 0),
('p_13_a_1779', 468, 1779, 'PAQ 3.3: Evaluación ', 4, '1.4.3.3', 13, 0),
('p_13_a_1780', 469, 1780, 'Analizar resultados de los cuestionarios ', 5, '1.4.3.3.1', 13, 0),
('p_13_a_1781', 470, 1781, 'Documentar la capacitación ', 5, '1.4.3.3.2', 13, 0),
('p_13_a_1782', 471, 1782, 'Documentar las correcciones y mejoras ', 5, '1.4.3.3.3', 13, 0),
('p_13_a_1783', 472, 1783, 'Publicar resultados de las capacitaciones ', 5, '1.4.3.3.4', 13, 0),
('p_13_a_1784', 473, 1784, 'Publicar las evidencias ', 5, '1.4.3.3.5', 13, 0),
('p_13_a_1785', 474, 1785, 'Publicar contenido de las capacitaciones ', 5, '1.4.3.3.6', 13, 0),
('p_13_a_1786', 475, 1786, 'Entregar resultados ', 5, '1.4.3.3.7', 13, 0),
('p_13_a_1787', 477, 1787, 'SE 4.4: Capacitación a 1075 estudiantes ', 3, '1.4.4', 13, 0),
('p_13_a_1788', 478, 1788, 'PAQ 4.1: Planificación ', 4, '1.4.4.1', 13, 0),
('p_13_a_1789', 479, 1789, 'Desarrollar el material multimedia para la capacitación ', 5, '1.4.4.1.1', 13, 0),
('p_13_a_1790', 480, 1790, 'Definir logística de la capacitación ', 5, '1.4.4.1.2', 13, 0),
('p_13_a_1791', 481, 1791, 'Publicar la convocatoria ', 5, '1.4.4.1.3', 13, 0),
('p_13_a_1792', 482, 1792, 'Aceptar la documentación por parte de la secretaria de educación ', 5, '1.4.4.1.4', 13, 0),
('p_13_a_1793', 483, 1793, 'Adquirir encuestas de satisfacción, registro de asistencia y registro de correcciones y mejoras ', 5, '1.4.4.1.5', 13, 0),
('p_13_a_1794', 484, 1794, 'Adquirir kit de capacitación, y volantes de publicidad ', 5, '1.4.4.1.6', 13, 0),
('p_13_a_1795', 485, 1795, 'Aceptar el material trabajo  ', 5, '1.4.4.1.7', 13, 0),
('p_13_a_1796', 486, 1796, 'PAQ 4.2: Desarrollo ', 4, '1.4.4.2', 13, 0),
('p_13_a_1797', 487, 1797, 'Realizar las capacitaciones ', 5, '1.4.4.2.1', 13, 0),
('p_13_a_1798', 488, 1798, 'Aplicar cuestionario ', 5, '1.4.4.2.2', 13, 0),
('p_13_a_1799', 489, 1799, 'Registrar asistencia ', 5, '1.4.4.2.3', 13, 0),
('p_13_a_1800', 490, 1800, 'Capturar evidencias ', 5, '1.4.4.2.4', 13, 0),
('p_13_a_1801', 491, 1801, 'Capturar correcciones y mejoras ', 5, '1.4.4.2.5', 13, 0),
('p_13_a_1802', 492, 1802, 'Finalizar capacitación ', 5, '1.4.4.2.6', 13, 0),
('p_13_a_1803', 493, 1803, 'PAQ 4.3: Evaluación ', 4, '1.4.4.3', 13, 0),
('p_13_a_1804', 494, 1804, 'Analizar resultados de los cuestionarios ', 5, '1.4.4.3.1', 13, 0),
('p_13_a_1805', 495, 1805, 'Documentar la capacitación ', 5, '1.4.4.3.2', 13, 0),
('p_13_a_1806', 496, 1806, 'Documentar las correcciones y mejoras ', 5, '1.4.4.3.3', 13, 0),
('p_13_a_1807', 497, 1807, 'Publicar resultados de las capacitaciones ', 5, '1.4.4.3.4', 13, 0),
('p_13_a_1808', 498, 1808, 'Publicar las evidencias ', 5, '1.4.4.3.5', 13, 0),
('p_13_a_1809', 499, 1809, 'Publicar contenido de las capacitaciones ', 5, '1.4.4.3.6', 13, 0),
('p_13_a_1810', 500, 1810, 'Entregar resultados ', 5, '1.4.4.3.7', 13, 0),
('p_13_a_1811', 502, 1811, 'SE 4.5: Correcciones y mejoras ', 3, '1.4.5', 13, 0),
('p_13_a_1812', 503, 1812, 'PAQ 5.1: Planificación ', 4, '1.4.5.1', 13, 0),
('p_13_a_1813', 504, 1813, 'Identificar las historias de usuario defectuosas ', 5, '1.4.5.1.1', 13, 0),
('p_13_a_1814', 505, 1814, 'Corregir las historias de usuario defectuosas ', 5, '1.4.5.1.2', 13, 0),
('p_13_a_1815', 506, 1815, 'Formalizar las historias de usuario ', 5, '1.4.5.1.3', 13, 0),
('p_13_a_1816', 507, 1816, 'relacionar las historias de usuario ', 5, '1.4.5.1.4', 13, 0),
('p_13_a_1817', 508, 1817, 'Formalizar el mapa de historias de usuario ', 5, '1.4.5.1.5', 13, 0),
('p_13_a_1818', 509, 1818, 'PAQ 5.2: Implementación ', 4, '1.4.5.2', 13, 0),
('p_13_a_1819', 510, 1819, 'Corregir las interfaces de usuario ', 5, '1.4.5.2.1', 13, 0),
('p_13_a_1820', 511, 1820, 'Aplicar reingeniería al código fuente ', 5, '1.4.5.2.2', 13, 0),
('p_13_a_1821', 512, 1821, 'Unir las características del modulo ', 5, '1.4.5.2.3', 13, 0),
('p_13_a_1822', 513, 1822, 'Integrar el módulo al repositorio central ', 5, '1.4.5.2.4', 13, 0),
('p_13_a_1823', 514, 1823, 'Actualizar el documento de lecciones aprendidas ', 5, '1.4.5.2.5', 13, 0),
('p_13_a_1824', 359, 1824, 'SE 3.2: Capacitación a 650 docentes ', 3, '1.3.2', 13, 0),
('p_13_a_1825', 360, 1825, 'PAQ 1.1: Planificación ', 4, '1.3.2.1', 13, 0),
('p_13_a_1826', 361, 1826, 'Desarrollar el material multimedia para la capacitación ', 5, '1.3.2.1.1', 13, 0),
('p_13_a_1827', 362, 1827, 'Definir logística de la capacitación ', 5, '1.3.2.1.2', 13, 0),
('p_13_a_1829', 363, 1829, 'Publicar la convocatoria ', 5, '1.3.2.1.3', 13, 0),
('p_13_a_1830', 364, 1830, 'Aceptar la documentación por parte de la secretaria de educación ', 5, '1.3.2.1.4', 13, 0),
('p_13_a_1831', 365, 1831, 'Adquirir encuestas de satisfacción, registro de asistencia y registro de correcciones y mejoras ', 5, '1.3.2.1.5', 13, 0),
('p_13_a_1832', 366, 1832, 'Adquirir kit de capacitación, y volantes de publicidad ', 5, '1.3.2.1.6', 13, 0),
('p_13_a_1833', 367, 1833, 'Adquirir refrigerio docentes ', 5, '1.3.2.1.7', 13, 0),
('p_13_a_1834', 368, 1834, 'Aceptar el material trabajo  ', 5, '1.3.2.1.8', 13, 0),
('p_13_a_1835', 369, 1835, 'PAQ 1.2: Desarrollo ', 4, '1.3.2.2', 13, 0),
('p_13_a_1836', 370, 1836, 'Realizar las capacitaciones ', 5, '1.3.2.2.1', 13, 0),
('p_13_a_1837', 371, 1837, 'Aplicar cuestionario ', 5, '1.3.2.2.2', 13, 0),
('p_13_a_1838', 372, 1838, 'Registrar asistencia ', 5, '1.3.2.2.3', 13, 0),
('p_13_a_1839', 373, 1839, 'Capturar evidencias ', 5, '1.3.2.2.4', 13, 0),
('p_13_a_1840', 374, 1840, 'Capturar correcciones y mejoras ', 5, '1.3.2.2.5', 13, 0),
('p_13_a_1841', 375, 1841, 'Finalizar capacitación ', 5, '1.3.2.2.6', 13, 0),
('p_13_a_1842', 376, 1842, 'PAQ 1.3: Evaluación ', 4, '1.3.2.3', 13, 0),
('p_13_a_1843', 377, 1843, 'Analizar resultados de los cuestionarios ', 5, '1.3.2.3.1', 13, 0),
('p_13_a_1844', 378, 1844, 'Documentar la capacitación ', 5, '1.3.2.3.2', 13, 0),
('p_13_a_1845', 379, 1845, 'Documentar las correcciones y mejoras ', 5, '1.3.2.3.3', 13, 0),
('p_13_a_1846', 380, 1846, 'Publicar resultados de las capacitaciones ', 5, '1.3.2.3.4', 13, 0),
('p_13_a_1847', 381, 1847, 'Publicar las evidencias ', 5, '1.3.2.3.5', 13, 0),
('p_13_a_1848', 382, 1848, 'Publicar contenido de las capacitaciones ', 5, '1.3.2.3.6', 13, 0),
('p_13_a_1849', 383, 1849, 'Entregar resultados ', 5, '1.3.2.3.7', 13, 0),
('p_13_a_1854', 47, 1854, 'Realizar reunión para la planeación de pruebas beta ', 5, '1.1.1.4.6', 13, 0),
('p_13_a_1855', 48, 1855, 'Realizar convocatoria de usuario finales para las pruebas beta ', 5, '1.1.1.4.7', 13, 0),
('p_13_a_1856', 49, 1856, 'Llevar a cabo las pruebas beta ', 5, '1.1.1.4.8', 13, 0),
('p_13_a_1858', 50, 1858, 'Aceptar pruebas de software ', 5, '1.1.1.4.9', 13, 0),
('p_13_a_1868', 89, 1868, 'Verificar historias de usuario ', 5, '1.1.2.4.1', 13, 0),
('p_13_a_1869', 90, 1869, 'Identificar los casos de pruebas unitarias ', 5, '1.1.2.4.2', 13, 0),
('p_13_a_1870', 91, 1870, 'Realizar las pruebas unitarias ', 5, '1.1.2.4.3', 13, 0),
('p_13_a_1871', 92, 1871, 'Realizar pruebas de aplicación ', 5, '1.1.2.4.4', 13, 0),
('p_13_a_1872', 93, 1872, 'Realizar pruebas de integración ', 5, '1.1.2.4.5', 13, 0),
('p_13_a_1873', 94, 1873, 'Realizar reunión para la planeación de pruebas beta ', 5, '1.1.2.4.6', 13, 0),
('p_13_a_1874', 95, 1874, 'Realizar convocatoria de usuario finales para las pruebas beta ', 5, '1.1.2.4.7', 13, 0),
('p_13_a_1875', 96, 1875, 'Llevar a cabo las pruebas beta ', 5, '1.1.2.4.8', 13, 0),
('p_13_a_1876', 97, 1876, 'Aceptar pruebas de software ', 5, '1.1.2.4.9', 13, 0),
('p_13_a_1896', 137, 1896, 'Verificar historias de usuario ', 5, '1.1.3.4.1', 13, 0),
('p_13_a_1897', 138, 1897, 'Identificar los casos de pruebas unitarias ', 5, '1.1.1.2', 13, 0),
('p_13_a_1898', 139, 1898, 'Realizar las pruebas unitarias ', 5, '1.1.3.4.3', 13, 0),
('p_13_a_1899', 140, 1899, 'Realizar pruebas de aplicación ', 5, '1.1.3.4.4', 13, 0),
('p_13_a_1900', 141, 1900, 'Realizar pruebas de integración ', 5, '1.1.3.4.5', 13, 0),
('p_13_a_1901', 142, 1901, 'Realizar reunión para la planeación de pruebas beta ', 5, '1.1.3.4.6', 13, 0),
('p_13_a_1902', 143, 1902, 'Realizar convocatoria de usuario finales para las pruebas beta ', 5, '1.1.3.4.7', 13, 0),
('p_13_a_1903', 144, 1903, 'Llevar a cabo las pruebas beta ', 5, '1.1.3.4.8', 13, 0),
('p_13_a_1904', 145, 1904, 'Aceptar pruebas de software ', 5, '1.1.3.4.9', 13, 0),
('p_13_a_1905', 186, 1905, 'Verificar historias de usuario ', 5, '1.1.4.4.1', 13, 0),
('p_13_a_1906', 187, 1906, 'Identificar los casos de pruebas unitarias ', 5, '1.1.4.4.2', 13, 0),
('p_13_a_1907', 188, 1907, 'Realizar las pruebas unitarias ', 5, '1.1.4.4.3', 13, 0),
('p_13_a_1908', 189, 1908, 'Realizar pruebas de aplicación ', 5, '1.1.4.4.4', 13, 0),
('p_13_a_1909', 190, 1909, 'Realizar pruebas de integración ', 5, '1.1.4.4.5', 13, 0),
('p_13_a_1910', 191, 1910, 'Realizar reunión para la planeación de pruebas beta ', 5, '1.1.4.4.6', 13, 0),
('p_13_a_1911', 192, 1911, 'Realizar convocatoria de usuario finales para las pruebas beta ', 5, '1.1.4.4.7', 13, 0),
('p_13_a_1912', 193, 1912, 'Llevar a cabo las pruebas beta ', 5, '1.1.4.4.8', 13, 0),
('p_13_a_1913', 194, 1913, 'Aceptar pruebas de software ', 5, '1.1.4.4.9', 13, 0),
('p_13_a_1915', 98, 1915, 'Aceptar módulo de trabajo, tareas y refuerzos ', 4, '1.1.2.5', 13, 0),
('p_13_a_1916', 51, 1916, 'Aceptar módulo de administración ', 4, '1.1.1.5', 13, 0),
('p_13_a_1917', 146, 1917, 'Aceptar módulo de trabajo, tareas y refuerzos ', 4, '1.1.3.5', 13, 0),
('p_13_a_1918', 195, 1918, 'Aceptar módulo de eventos y citas  ', 4, '1.1.4.5', 13, 0),
('p_13_a_1921', 212, 1921, 'Instalar aplicación  ', 4, '1.1.5.3', 13, 0),
('p_13_a_1922', 330, 1922, 'Capacitar a todos los padres de familia ', 3, '1.2.6', 13, 0),
('p_13_a_1923', 399, 1923, 'Capacitar a docentes ', 3, '1.3.4', 13, 0),
('p_13_a_1924', 516, 1924, 'Capacitar a estudiantes ', 3, '1.1.1.4', 13, 0),
('p_13_a_1925', 213, 1925, 'Entregar aplicación web ', 3, '1.1.6', 13, 0),
('p_13_a_1926', 240, 1926, 'Capacitar primer grupo de padres ', 4, '1.2.1.4', 13, 0),
('p_13_a_1927', 265, 1927, 'Capacitar segundo grupo de padres ', 4, '1.2.2.4', 13, 0),
('p_13_a_1928', 290, 1928, 'Capacitar tercer grupo de padres ', 4, '1.2.3.4', 13, 0),
('p_13_a_1929', 315, 1929, 'Capacitar cuarto grupo de padres ', 4, '1.2.4.4', 13, 0),
('p_13_a_1930', 329, 1930, 'Aplicar correcciones y mejoras de las capacitaciones de padres ', 4, '1.2.5.3', 13, 0),
('p_13_a_1931', 358, 1931, 'Capacitar primer grupo de docentes ', 4, '1.3.1.4', 13, 0),
('p_13_a_1932', 384, 1932, 'Capacitar segundo grupo de docentes ', 4, '1.3.2.4', 13, 0),
('p_13_a_1933', 398, 1933, 'Aplicar correcciones y mejoras de las capacitaciones docente ', 4, '1.3.3.3', 13, 0),
('p_13_a_1934', 426, 1934, 'Capacitar primer grupo de estudiantes ', 4, '1.4.1.4', 13, 0),
('p_13_a_1935', 451, 1935, 'Capacitar segundo grupo de estudiantes ', 4, '1.4.2.4', 13, 0),
('p_13_a_1936', 476, 1936, 'Capacitar tercer grupo de estudiantes ', 4, '1.1.1.2', 13, 0),
('p_13_a_1937', 501, 1937, 'Capacitar cuarto grupo de estudiantes ', 4, '1.4.4.4', 13, 0),
('p_13_a_1938', 515, 1938, 'Aplicar correcciones y mejoras de las capacitaciones estudiantes ', 4, '1.4.5.3', 13, 0),
('p_13_a_1942', 44, 1942, 'Realizar las pruebas unitarias ', 5, '1.1.1.4.3', 13, 0),
('p_13_a_253', 196, 253, 'SE 1.5: Transferencia tecnológica ', 3, '1.1.5', 13, 0),
('p_13_a_254', 197, 254, 'PAQ 5.1: Integración ', 4, '1.1.5.1', 13, 0),
('p_13_a_255', 203, 255, 'PAQ 5.2: Pruebas ', 4, '1.1.5.2', 13, 0),
('p_13_a_257', 208, 257, 'Realizar prueba de seguridad ', 5, '1.1.5.2.5', 13, 0),
('p_13_a_258', 209, 258, 'Realizar prueba de carga ', 5, '1.1.5.2.6', 13, 0),
('p_13_a_259', 214, 259, 'E2: Capacitación a 4300 padres de familia ', 2, '1.2', 13, 0),
('p_13_a_26', 99, 26, 'SE 1.3: Modulo de observaciones académicas y comportamentales ', 3, '1.1.3', 13, 0),
('p_13_a_260', 215, 260, 'SE 2.1: Capacitación a 1075 padres de familia ', 3, '1.2.1', 13, 0),
('p_13_a_261', 216, 261, 'PAQ 1.1: Planificación ', 4, '1.2.1.1', 13, 0),
('p_13_a_262', 217, 262, 'Desarrollar el material multimedia para la capacitación ', 5, '1.2.1.1.1', 13, 0),
('p_13_a_263', 225, 263, 'PAQ 1.2: Desarrollo ', 4, '1.2.1.2', 13, 0),
('p_13_a_264', 228, 264, 'Registrar asistencia ', 5, '1.2.1.2.3', 13, 0),
('p_13_a_265', 232, 265, 'PAQ 1.3: Evaluación ', 4, '1.2.1.3', 13, 0),
('p_13_a_266', 236, 266, 'Publicar resultados de las capacitaciones ', 5, '1.2.1.3.4', 13, 0),
('p_13_a_3', 1, 3, 'EduVirtual ', 1, '1', 13, 0),
('p_13_a_314', 198, 314, 'Desarrollar reunión para solicitar credenciales y requerimientos de conexión ', 5, '1.1.5.1.1', 13, 0),
('p_13_a_315', 199, 315, 'Cargar el software en el servidor ', 5, '1.1.5.1.2', 13, 0),
('p_13_a_316', 200, 316, 'Migrar datos del SIMAT ', 5, '1.1.5.1.3', 13, 0),
('p_13_a_317', 201, 317, 'Hacer entrega de los backups ', 5, '1.1.5.1.4', 13, 0),
('p_13_a_318', 210, 318, 'Realizar prueba de rendimiento ', 5, '1.1.5.2.7', 13, 0),
('p_13_a_319', 202, 319, 'Aceptar entrega de la aplicación ', 5, '1.1.5.1.5', 13, 0),
('p_13_a_320', 211, 320, 'Entregar resultados de pruebas  ', 5, '1.1.5.2.8', 13, 0),
('p_13_a_323', 218, 323, 'Definir logística de la capacitación ', 5, '1.2.1.1.2', 13, 0),
('p_13_a_324', 220, 324, 'Publicar la convocatoria ', 5, '1.2.1.1.4', 13, 0),
('p_13_a_326', 233, 326, 'Analizar resultados de los cuestionarios ', 5, '1.2.1.3.1', 13, 0),
('p_13_a_327', 226, 327, 'Realizar las capacitaciones ', 5, '1.2.1.2.1', 13, 0),
('p_13_a_330', 221, 330, 'Aceptar la documentación por parte de la secretaria de educación ', 5, '1.2.1.1.5', 13, 0),
('p_13_a_333', 229, 333, 'Capturar evidencias ', 5, '1.2.1.2.4', 13, 0),
('p_13_a_335', 231, 335, 'Finalizar capacitación ', 5, '1.2.1.2.6', 13, 0),
('p_13_a_336', 234, 336, 'Documentar la capacitación ', 5, '1.2.1.3.2', 13, 0),
('p_13_a_337', 237, 337, 'Publicar las evidencias ', 5, '1.2.1.3.5', 13, 0),
('p_13_a_338', 238, 338, 'Publicar contenido de las capacitaciones ', 5, '1.2.1.3.6', 13, 0),
('p_13_a_339', 239, 339, 'Entregar resultados ', 5, '1.2.1.3.7', 13, 0),
('p_13_a_342', 235, 342, 'Documentar las correcciones y mejoras ', 5, '1.2.1.3.3', 13, 0),
('p_13_a_366', 241, 366, 'SE 2.2: Capacitación a 1075 padres de familia ', 3, '1.2.2', 13, 0),
('p_13_a_394', 266, 394, 'SE 2.3: Capacitación a 1075 padres de familia ', 3, '1.2.3', 13, 0),
('p_13_a_4', 2, 4, 'E1: Aplicación web ', 2, '1.1', 13, 0),
('p_13_a_418', 291, 418, 'SE 2.4: Capacitación a 1075 padres de familia ', 3, '1.2.4', 13, 0),
('p_13_a_442', 316, 442, 'SE 2.5: Correcciones y mejoras ', 3, '1.2.5', 13, 0),
('p_13_a_443', 317, 443, 'PAQ 5.1: Planificación ', 4, '1.2.5.1', 13, 0),
('p_13_a_444', 318, 444, 'Identificar las historias de usuario defectuosas ', 5, '1.2.5.1.1', 13, 0),
('p_13_a_445', 319, 445, 'Corregir las historias de usuario defectuosas ', 5, '1.2.5.1.2', 13, 0),
('p_13_a_446', 320, 446, 'Formalizar las historias de usuario ', 5, '1.2.5.1.3', 13, 0),
('p_13_a_447', 321, 447, 'relacionar las historias de usuario ', 5, '1.2.5.1.4', 13, 0),
('p_13_a_448', 322, 448, 'Formalizar el mapa de historias de usuario ', 5, '1.2.5.1.5', 13, 0),
('p_13_a_449', 323, 449, 'PAQ 5.2: Implementación ', 4, '1.2.5.2', 13, 0),
('p_13_a_450', 324, 450, 'Corregir las interfaces de usuario ', 5, '1.2.5.2.1', 13, 0),
('p_13_a_451', 325, 451, 'Aplicar reingeniería al código fuente ', 5, '1.2.5.2.2', 13, 0),
('p_13_a_452', 326, 452, 'Unir las características del modulo ', 5, '1.2.5.2.3', 13, 0),
('p_13_a_453', 327, 453, 'Integrar el módulo al repositorio central ', 5, '1.2.5.2.4', 13, 0),
('p_13_a_454', 328, 454, 'Actualizar el documento de lecciones aprendidas ', 5, '1.2.5.2.5', 13, 0),
('p_13_a_461', 331, 461, 'E3: Capacitación a 1300 docentes ', 2, '1.3', 13, 0),
('p_13_a_5', 3, 5, 'SE 1.1: Modulo de Administración ', 3, '1.1.1', 13, 0),
('p_13_a_6', 14, 6, 'Formalizar el plan de entrega ', 5, '1.1.1.1.10', 13, 0),
('p_13_a_682', 206, 682, 'Identificar prueba de rendimiento ', 5, '1.1.5.2.3', 13, 0),
('p_13_a_683', 205, 683, 'Identificar prueba de carga ', 5, '1.1.5.2.2', 13, 0),
('p_13_a_684', 204, 684, 'Identificar pruebas de seguridad ', 5, '1.1.5.2.1', 13, 0),
('p_13_a_74', 147, 74, 'SE 1.4 : Modulo de información de reuniones, eventos y citas con los docentes ', 3, '1.1.4', 13, 0),
('p_13_a_8', 40, 8, 'Integrar el módulo al repositorio central ', 5, '1.1.1.3.9', 13, 0),
('p_13_a_84', 5, 84, 'Efectuar reunión con el patrocinador ', 5, '1.1.1.1.1', 13, 0),
('p_13_a_85', 4, 85, 'PAQ 1.1: Planificación ', 4, '1.1.1.1', 13, 0),
('p_13_a_86', 13, 86, 'Formalizar el mapa de historias de usuario ', 5, '1.1.1.1.9', 13, 0),
('p_13_a_90', 21, 90, 'Diseñar el modelo de despliegue ', 5, '1.1.1.2.6', 13, 0),
('p_13_a_91', 23, 91, 'Definir la arquitectura ', 5, '1.1.1.2.8', 13, 0),
('p_13_a_93', 15, 93, 'PAQ 1.2: Diseño ', 4, '1.1.1.2', 13, 0),
('p_13_a_99', 42, 99, 'Verificar historias de usuario ', 5, '1.1.1.4.1', 13, 0),
('p_14_a_0', 0, 0, 'Proyecto1', 0, '0', 14, 0),
('p_14_a_10', 52, 10, 'SE 1.2: Modulo de trabajos, tareas y refuerzos ', 3, '1.1.2', 14, 0),
('p_14_a_101', 43, 101, 'Identificar los casos de pruebas unitarias ', 5, '1.1.1.4.2', 14, 0),
('p_14_a_107', 24, 107, 'Realizar el modelo conceptual de los datos ', 5, '1.1.1.2.9', 14, 0),
('p_14_a_108', 29, 108, 'Aceptar el glosario de términos ', 5, '1.1.1.2.14', 14, 0),
('p_14_a_1175', 332, 1175, 'SE 3.1: Capacitación a 650 docentes ', 3, '1.3.1', 14, 0),
('p_14_a_1176', 333, 1176, 'PAQ 1.1: Planificación ', 4, '1.3.1.1', 14, 0),
('p_14_a_1177', 334, 1177, 'Desarrollar el material multimedia para la capacitación ', 5, '1.3.1.1.1', 14, 0),
('p_14_a_1178', 335, 1178, 'Definir logística de la capacitación ', 5, '1.3.1.1.2', 14, 0),
('p_14_a_1184', 343, 1184, 'PAQ 1.2: Desarrollo ', 4, '1.3.1.2', 14, 0),
('p_14_a_1185', 344, 1185, 'Realizar las capacitaciones ', 5, '1.3.1.2.1', 14, 0),
('p_14_a_1186', 346, 1186, 'Registrar asistencia ', 5, '1.3.1.2.3', 14, 0),
('p_14_a_1187', 345, 1187, 'Aplicar cuestionario ', 5, '1.3.1.2.2', 14, 0),
('p_14_a_1188', 347, 1188, 'Capturar evidencias ', 5, '1.3.1.2.4', 14, 0),
('p_14_a_1189', 348, 1189, 'Capturar correcciones y mejoras ', 5, '1.3.1.2.5', 14, 0),
('p_14_a_1190', 349, 1190, 'Finalizar capacitación ', 5, '1.3.1.2.6', 14, 0),
('p_14_a_1191', 350, 1191, 'PAQ 1.3: Evaluación ', 4, '1.3.1.3', 14, 0),
('p_14_a_1192', 351, 1192, 'Analizar resultados de los cuestionarios ', 5, '1.3.1.3.1', 14, 0),
('p_14_a_1193', 352, 1193, 'Documentar la capacitación ', 5, '1.3.1.3.2', 14, 0),
('p_14_a_1194', 353, 1194, 'Documentar las correcciones y mejoras ', 5, '1.3.1.3.3', 14, 0),
('p_14_a_1195', 354, 1195, 'Publicar resultados de las capacitaciones ', 5, '1.3.1.3.4', 14, 0),
('p_14_a_1196', 355, 1196, 'Publicar las evidencias ', 5, '1.3.1.3.5', 14, 0),
('p_14_a_1197', 356, 1197, 'Publicar contenido de las capacitaciones ', 5, '1.3.1.3.6', 14, 0),
('p_14_a_1198', 357, 1198, 'Entregar resultados ', 5, '1.3.1.3.7', 14, 0),
('p_14_a_120', 31, 120, 'PAQ 1.3: Codificación ', 4, '1.1.1.3', 14, 0),
('p_14_a_123', 32, 123, 'Desarrollar las interfaces de usuario ', 5, '1.1.1.3.1', 14, 0),
('p_14_a_1271', 385, 1271, 'SE 3.3: Correcciones y mejoras ', 3, '1.3.3', 14, 0),
('p_14_a_1272', 386, 1272, 'PAQ 5.1: Planificación ', 4, '1.3.3.1', 14, 0),
('p_14_a_1273', 387, 1273, 'Identificar las historias de usuario defectuosas ', 5, '1.3.3.1.1', 14, 0),
('p_14_a_1274', 388, 1274, 'Corregir las historias de usuario defectuosas ', 5, '1.3.3.1.2', 14, 0),
('p_14_a_1275', 389, 1275, 'Formalizar las historias de usuario ', 5, '1.3.3.1.3', 14, 0),
('p_14_a_1276', 390, 1276, 'relacionar las historias de usuario ', 5, '1.3.3.1.4', 14, 0),
('p_14_a_1277', 391, 1277, 'Formalizar el mapa de historias de usuario ', 5, '1.3.3.1.5', 14, 0),
('p_14_a_1278', 392, 1278, 'PAQ 5.2: Implementación ', 4, '1.3.3.2', 14, 0),
('p_14_a_1279', 393, 1279, 'Corregir las interfaces de usuario ', 5, '1.3.3.2.1', 14, 0),
('p_14_a_128', 30, 128, 'Aceptar los mockups de las interfaces de usuario ', 5, '1.1.1.2.15', 14, 0),
('p_14_a_1280', 394, 1280, 'Aplicar reingeniería al código fuente ', 5, '1.3.3.2.2', 14, 0),
('p_14_a_1281', 395, 1281, 'Unir las características del modulo ', 5, '1.3.3.2.3', 14, 0),
('p_14_a_1282', 396, 1282, 'Integrar el módulo al repositorio central ', 5, '1.3.3.2.4', 14, 0),
('p_14_a_1283', 397, 1283, 'Actualizar el documento de lecciones aprendidas ', 5, '1.3.3.2.5', 14, 0),
('p_14_a_1285', 25, 1285, 'Realizar el modelo entidad relación ', 5, '1.1.1.2.10', 14, 0),
('p_14_a_1286', 26, 1286, 'Aceptar el modelo de datos ', 5, '1.1.1.2.11', 14, 0),
('p_14_a_1289', 34, 1289, 'Desarrollar requerimientos funcionales del rol estudiante ', 5, '1.1.1.3.3', 14, 0),
('p_14_a_129', 27, 129, 'Modelar los mockups de las interfaces de usuario ', 5, '1.1.1.2.12', 14, 0),
('p_14_a_1291', 35, 1291, 'Desarrollar requerimientos funcionales del rol docente ', 5, '1.1.1.3.4', 14, 0),
('p_14_a_1322', 36, 1322, 'Desarrollar requerimientos funcionales del rol padre de familia ', 5, '1.1.1.3.5', 14, 0),
('p_14_a_1323', 38, 1323, 'Desarrollar requerimientos funcionales del rol administrador ', 5, '1.1.1.3.7', 14, 0),
('p_14_a_1324', 37, 1324, 'Desarrollar requerimientos funcionales del rol coordinador ', 5, '1.1.1.3.6', 14, 0),
('p_14_a_1325', 207, 1325, 'Crear plan de pruebas ', 5, '1.1.5.2.4', 14, 0);
INSERT INTO `actividad` (`actividad_id`, `actividad_orden`, `actividad_uuid`, `actividad_nombre`, `actividad_level`, `actividad_wbs`, `proyecto_id`, `proyecto_linea_base`) VALUES
('p_14_a_1327', 219, 1327, 'Definir encuesta de satisfacción, registro de asistencia y registro de correcciones y mejoras ', 5, '1.2.1.1.3', 14, 0),
('p_14_a_1328', 222, 1328, 'Adquirir encuestas de satisfacción, registro de asistencia y registro de correcciones y mejoras ', 5, '1.2.1.1.6', 14, 0),
('p_14_a_1329', 223, 1329, 'Adquirir kit de capacitación, pendones y volantes de publicidad ', 5, '1.2.1.1.7', 14, 0),
('p_14_a_1331', 230, 1331, 'Capturar correcciones y mejoras ', 5, '1.2.1.2.5', 14, 0),
('p_14_a_1334', 227, 1334, 'Aplicar cuestionario ', 5, '1.2.1.2.2', 14, 0),
('p_14_a_1340', 224, 1340, 'Aceptar el material trabajo  ', 5, '1.2.1.1.8', 14, 0),
('p_14_a_1341', 336, 1341, 'Definir encuesta de satisfacción, registro de asistencia y registro de correcciones y mejoras ', 5, '1.3.1.1.3', 14, 0),
('p_14_a_1342', 337, 1342, 'Publicar la convocatoria ', 5, '1.3.1.1.4', 14, 0),
('p_14_a_1343', 338, 1343, 'Aceptar la documentación por parte de la secretaria de educación ', 5, '1.3.1.1.5', 14, 0),
('p_14_a_1344', 339, 1344, 'Adquirir encuestas de satisfacción, registro de asistencia y registro de correcciones y mejoras ', 5, '1.3.1.1.6', 14, 0),
('p_14_a_1345', 340, 1345, 'Adquirir kit de capacitación, pendones y volantes de publicidad ', 5, '1.3.1.1.7', 14, 0),
('p_14_a_1346', 341, 1346, 'Adquirir refrigerio docentes ', 5, '1.3.1.1.8', 14, 0),
('p_14_a_1347', 342, 1347, 'Aceptar el material trabajo ', 5, '1.3.1.1.9', 14, 0),
('p_14_a_136', 41, 136, 'PAQ 1.4: Pruebas ', 4, '1.1.1.4', 14, 0),
('p_14_a_137', 8, 137, 'Realizar entrega formal de historias de usuario ', 5, '1.1.1.1.4', 14, 0),
('p_14_a_138', 9, 138, 'relacionar las historias de usuario ', 5, '1.1.1.1.5', 14, 0),
('p_14_a_139', 10, 139, 'Mapear el Big Picture ', 5, '1.1.1.1.6', 14, 0),
('p_14_a_140', 11, 140, 'Definir el backbone ', 5, '1.1.1.1.7', 14, 0),
('p_14_a_141', 12, 141, 'Definir el walking skeleton ', 5, '1.1.1.1.8', 14, 0),
('p_14_a_1410', 45, 1410, 'Realizar pruebas de aplicación ', 5, '1.1.1.4.4', 14, 0),
('p_14_a_1411', 46, 1411, 'Realizar pruebas de integración ', 5, '1.1.1.4.5', 14, 0),
('p_14_a_142', 7, 142, 'Formalizar las historias de usuario ', 5, '1.1.1.1.3', 14, 0),
('p_14_a_143', 6, 143, 'Efectuar reunión con un grupo de usuarios finales ', 5, '1.1.1.1.2', 14, 0),
('p_14_a_144', 18, 144, 'Aceptar las tarjetas crc ', 5, '1.1.1.2.3', 14, 0),
('p_14_a_145', 19, 145, 'Describir las capas del sistema ', 5, '1.1.1.2.4', 14, 0),
('p_14_a_146', 20, 146, 'Definir la vista estructural ', 5, '1.1.1.2.5', 14, 0),
('p_14_a_1467', 100, 1467, 'PAQ 3.1: Planificación ', 4, '1.1.3.1', 14, 0),
('p_14_a_1468', 101, 1468, 'Efectuar reunión con el patrocinador ', 5, '1.1.3.1.1', 14, 0),
('p_14_a_1469', 102, 1469, 'Efectuar reunión con un grupo de usuarios finales ', 5, '1.1.3.1.2', 14, 0),
('p_14_a_1470', 103, 1470, 'Formalizar las historias de usuario ', 5, '1.1.3.1.3', 14, 0),
('p_14_a_1471', 104, 1471, 'Realizar entrega formal de historias de usuario ', 5, '1.1.3.1.4', 14, 0),
('p_14_a_1472', 105, 1472, 'relacionar las historias de usuario ', 5, '1.1.3.1.5', 14, 0),
('p_14_a_1473', 106, 1473, 'Mapear el Big Picture ', 5, '1.1.3.1.6', 14, 0),
('p_14_a_1474', 107, 1474, 'Definir el backbone ', 5, '1.1.3.1.7', 14, 0),
('p_14_a_1475', 108, 1475, 'Definir el walking skeleton ', 5, '1.1.3.1.8', 14, 0),
('p_14_a_1476', 109, 1476, 'Formalizar el mapa de historias de usuario ', 5, '1.1.3.1.9', 14, 0),
('p_14_a_1477', 110, 1477, 'Formalizar el plan de entrega ', 5, '1.1.3.1.10', 14, 0),
('p_14_a_1478', 111, 1478, 'PAQ 3.2: Diseño ', 4, '1.1.3.2', 14, 0),
('p_14_a_1479', 112, 1479, 'Definir las tarjetas CRC ', 5, '1.1.3.2.1', 14, 0),
('p_14_a_148', 22, 148, 'Desarrollar la vista de implementación ', 5, '1.1.1.2.7', 14, 0),
('p_14_a_1480', 113, 1480, 'Relacionar tarjetas ', 5, '1.1.3.2.2', 14, 0),
('p_14_a_1481', 114, 1481, 'Aceptar las tarjetas crc ', 5, '1.1.3.2.3', 14, 0),
('p_14_a_1482', 115, 1482, 'Describir las capas del sistema ', 5, '1.1.3.2.4', 14, 0),
('p_14_a_1483', 116, 1483, 'Definir la vista estructural ', 5, '1.1.3.2.5', 14, 0),
('p_14_a_1484', 117, 1484, 'Diseñar el modelo de despliegue ', 5, '1.1.3.2.6', 14, 0),
('p_14_a_1485', 118, 1485, 'Desarrollar la vista de implementación ', 5, '1.1.3.2.7', 14, 0),
('p_14_a_1486', 119, 1486, 'Definir la arquitectura ', 5, '1.1.3.2.8', 14, 0),
('p_14_a_1487', 120, 1487, 'Realizar el modelo conceptual de los datos ', 5, '1.1.3.2.9', 14, 0),
('p_14_a_1488', 121, 1488, 'Realizar el modelo entidad relación ', 5, '1.1.3.2.10', 14, 0),
('p_14_a_1489', 122, 1489, 'Aceptar el modelo de datos ', 5, '1.1.3.2.11', 14, 0),
('p_14_a_149', 17, 149, 'Relacionar tarjetas ', 5, '1.1.1.2.2', 14, 0),
('p_14_a_1490', 123, 1490, 'Modelar los mockups de las interfaces de usuario ', 5, '1.1.3.2.12', 14, 0),
('p_14_a_1491', 124, 1491, 'Construir el glosario de términos ', 5, '1.1.3.2.13', 14, 0),
('p_14_a_1492', 125, 1492, 'Aceptar el glosario de términos ', 5, '1.1.3.2.14', 14, 0),
('p_14_a_1493', 126, 1493, 'Aceptar los mockups de las interfaces de usuario ', 5, '1.1.3.2.15', 14, 0),
('p_14_a_1494', 127, 1494, 'PAQ 3.3: Codificación ', 4, '1.1.3.3', 14, 0),
('p_14_a_1495', 128, 1495, 'Desarrollar las interfaces de usuario ', 5, '1.1.3.3.1', 14, 0),
('p_14_a_1496', 129, 1496, 'Aceptar las interfaces de usuario ', 5, '1.1.3.3.2', 14, 0),
('p_14_a_1497', 130, 1497, 'Desarrollar requerimientos funcionales del rol estudiante ', 5, '1.1.3.3.3', 14, 0),
('p_14_a_1498', 131, 1498, 'Desarrollar requerimientos funcionales del rol docente ', 5, '1.1.3.3.4', 14, 0),
('p_14_a_1499', 132, 1499, 'Desarrollar requerimientos funcionales del rol padre de familia ', 5, '1.1.3.3.5', 14, 0),
('p_14_a_150', 16, 150, 'Definir las tarjetas CRC ', 5, '1.1.1.2.1', 14, 0),
('p_14_a_1500', 133, 1500, 'Desarrollar requerimientos funcionales del rol coordinador ', 5, '1.1.3.3.6', 14, 0),
('p_14_a_1502', 134, 1502, 'Aceptar los requerimientos funcionales ', 5, '1.1.3.3.7', 14, 0),
('p_14_a_1503', 135, 1503, 'Integrar el módulo al repositorio central ', 5, '1.1.3.3.8', 14, 0),
('p_14_a_1504', 136, 1504, 'PAQ 3.4: Pruebas ', 4, '1.1.3.4', 14, 0),
('p_14_a_155', 28, 155, 'Construir el glosario de términos ', 5, '1.1.1.2.13', 14, 0),
('p_14_a_1555', 53, 1555, 'PAQ 2.1: Planificación ', 4, '1.1.2.1', 14, 0),
('p_14_a_1556', 54, 1556, 'Efectuar reunión con el patrocinador ', 5, '1.1.2.1.1', 14, 0),
('p_14_a_1557', 55, 1557, 'Efectuar reunión con un grupo de usuarios finales ', 5, '1.1.2.1.2', 14, 0),
('p_14_a_1558', 56, 1558, 'Formalizar las historias de usuario ', 5, '1.1.2.1.3', 14, 0),
('p_14_a_1559', 57, 1559, 'Realizar entrega formal de historias de usuario ', 5, '1.1.2.1.4', 14, 0),
('p_14_a_1560', 58, 1560, 'relacionar las historias de usuario ', 5, '1.1.2.1.5', 14, 0),
('p_14_a_1561', 59, 1561, 'Mapear el Big Picture ', 5, '1.1.2.1.6', 14, 0),
('p_14_a_1562', 60, 1562, 'Definir el backbone ', 5, '1.1.2.1.7', 14, 0),
('p_14_a_1563', 61, 1563, 'Definir el walking skeleton ', 5, '1.1.2.1.8', 14, 0),
('p_14_a_1564', 62, 1564, 'Formalizar el mapa de historias de usuario ', 5, '1.1.2.1.9', 14, 0),
('p_14_a_1565', 63, 1565, 'Formalizar el plan de entrega ', 5, '1.1.2.1.10', 14, 0),
('p_14_a_1566', 64, 1566, 'PAQ 2.2: Diseño ', 4, '1.1.2.2', 14, 0),
('p_14_a_1567', 65, 1567, 'Definir las tarjetas CRC ', 5, '1.1.2.2.1', 14, 0),
('p_14_a_1568', 66, 1568, 'Relacionar tarjetas ', 5, '1.1.2.2.2', 14, 0),
('p_14_a_1569', 67, 1569, 'Aceptar las tarjetas crc ', 5, '1.1.2.2.3', 14, 0),
('p_14_a_157', 39, 157, 'Aceptar los requerimientos funcionales ', 5, '1.1.1.3.8', 14, 0),
('p_14_a_1570', 68, 1570, 'Describir las capas del sistema ', 5, '1.1.2.2.4', 14, 0),
('p_14_a_1571', 69, 1571, 'Definir la vista estructural ', 5, '1.1.2.2.5', 14, 0),
('p_14_a_1572', 70, 1572, 'Diseñar el modelo de despliegue ', 5, '1.1.2.2.6', 14, 0),
('p_14_a_1573', 71, 1573, 'Desarrollar la vista de implementación ', 5, '1.1.2.2.7', 14, 0),
('p_14_a_1574', 72, 1574, 'Definir la arquitectura ', 5, '1.1.2.2.8', 14, 0),
('p_14_a_1575', 73, 1575, 'Realizar el modelo conceptual de los datos ', 5, '1.1.2.2.9', 14, 0),
('p_14_a_1576', 74, 1576, 'Realizar el modelo entidad relación ', 5, '1.1.2.2.10', 14, 0),
('p_14_a_1577', 75, 1577, 'Aceptar el modelo de datos ', 5, '1.1.2.2.11', 14, 0),
('p_14_a_1578', 76, 1578, 'Modelar los mockups de las interfaces de usuario ', 5, '1.1.2.2.12', 14, 0),
('p_14_a_1579', 77, 1579, 'Construir el glosario de términos ', 5, '1.1.2.2.13', 14, 0),
('p_14_a_1580', 78, 1580, 'Aceptar el glosario de términos ', 5, '1.1.2.2.14', 14, 0),
('p_14_a_1581', 79, 1581, 'Aceptar los mockups de las interfaces de usuario ', 5, '1.1.2.2.15', 14, 0),
('p_14_a_1582', 80, 1582, 'PAQ 2.3: Codificación ', 4, '1.1.2.3', 14, 0),
('p_14_a_1583', 81, 1583, 'Desarrollar las interfaces de usuario ', 5, '1.1.2.3.1', 14, 0),
('p_14_a_1584', 82, 1584, 'Aceptar las interfaces de usuario ', 5, '1.1.2.3.2', 14, 0),
('p_14_a_1585', 83, 1585, 'Desarrollar requerimientos funcionales del rol estudiante ', 5, '1.1.2.3.3', 14, 0),
('p_14_a_1586', 84, 1586, 'Desarrollar requerimientos funcionales del rol docente ', 5, '1.1.2.3.4', 14, 0),
('p_14_a_1587', 85, 1587, 'Desarrollar requerimientos funcionales del rol padre de familia ', 5, '1.1.2.3.5', 14, 0),
('p_14_a_159', 33, 159, 'Aceptar las interfaces de usuario ', 5, '1.1.1.3.2', 14, 0),
('p_14_a_1590', 86, 1590, 'Aceptar los requerimientos funcionales ', 5, '1.1.2.3.6', 14, 0),
('p_14_a_1591', 87, 1591, 'Integrar el módulo al repositorio central ', 5, '1.1.2.3.7', 14, 0),
('p_14_a_1592', 88, 1592, 'PAQ 2.4: Pruebas ', 4, '1.1.2.4', 14, 0),
('p_14_a_1599', 148, 1599, 'PAQ 4.1: Planificación ', 4, '1.1.4.1', 14, 0),
('p_14_a_1600', 149, 1600, 'Efectuar reunión con el patrocinador ', 5, '1.1.4.1.1', 14, 0),
('p_14_a_1601', 150, 1601, 'Efectuar reunión con un grupo de usuarios finales ', 5, '1.1.4.1.2', 14, 0),
('p_14_a_1602', 151, 1602, 'Formalizar las historias de usuario ', 5, '1.1.4.1.3', 14, 0),
('p_14_a_1603', 152, 1603, 'Realizar entrega formal de historias de usuario ', 5, '1.1.4.1.4', 14, 0),
('p_14_a_1604', 153, 1604, 'relacionar las historias de usuario ', 5, '1.1.4.1.5', 14, 0),
('p_14_a_1605', 154, 1605, 'Mapear el Big Picture ', 5, '1.1.4.1.6', 14, 0),
('p_14_a_1606', 155, 1606, 'Definir el backbone ', 5, '1.1.4.1.7', 14, 0),
('p_14_a_1607', 156, 1607, 'Definir el walking skeleton ', 5, '1.1.4.1.8', 14, 0),
('p_14_a_1608', 157, 1608, 'Formalizar el mapa de historias de usuario ', 5, '1.1.4.1.9', 14, 0),
('p_14_a_1609', 158, 1609, 'Formalizar el plan de entrega ', 5, '1.1.4.1.10', 14, 0),
('p_14_a_1610', 159, 1610, 'PAQ 4.2: Diseño ', 4, '1.1.4.2', 14, 0),
('p_14_a_1611', 160, 1611, 'Definir las tarjetas CRC ', 5, '1.1.4.2.1', 14, 0),
('p_14_a_1612', 161, 1612, 'Relacionar tarjetas ', 5, '1.1.4.2.2', 14, 0),
('p_14_a_1613', 162, 1613, 'Aceptar las tarjetas crc ', 5, '1.1.4.2.3', 14, 0),
('p_14_a_1614', 163, 1614, 'Describir las capas del sistema ', 5, '1.1.4.2.4', 14, 0),
('p_14_a_1615', 164, 1615, 'Definir la vista estructural ', 5, '1.1.4.2.5', 14, 0),
('p_14_a_1616', 165, 1616, 'Diseñar el modelo de despliegue ', 5, '1.1.4.2.6', 14, 0),
('p_14_a_1617', 166, 1617, 'Desarrollar la vista de implementación ', 5, '1.1.4.2.7', 14, 0),
('p_14_a_1618', 167, 1618, 'Definir la arquitectura ', 5, '1.1.4.2.8', 14, 0),
('p_14_a_1619', 168, 1619, 'Realizar el modelo conceptual de los datos ', 5, '1.1.4.2.9', 14, 0),
('p_14_a_1620', 169, 1620, 'Realizar el modelo entidad relación ', 5, '1.1.4.2.10', 14, 0),
('p_14_a_1621', 170, 1621, 'Aceptar el modelo de datos ', 5, '1.1.4.2.11', 14, 0),
('p_14_a_1622', 171, 1622, 'Modelar los mockups de las interfaces de usuario ', 5, '1.1.4.2.12', 14, 0),
('p_14_a_1623', 172, 1623, 'Construir el glosario de términos ', 5, '1.1.4.2.13', 14, 0),
('p_14_a_1624', 173, 1624, 'Aceptar el glosario de términos ', 5, '1.1.4.2.14', 14, 0),
('p_14_a_1625', 174, 1625, 'Aceptar los mockups de las interfaces de usuario ', 5, '1.1.4.2.15', 14, 0),
('p_14_a_1626', 175, 1626, 'PAQ 4.3: Codificación ', 4, '1.1.4.3', 14, 0),
('p_14_a_1627', 176, 1627, 'Desarrollar las interfaces de usuario ', 5, '1.1.4.3.1', 14, 0),
('p_14_a_1628', 177, 1628, 'Aceptar las interfaces de usuario ', 5, '1.1.4.3.2', 14, 0),
('p_14_a_1629', 178, 1629, 'Desarrollar requerimientos funcionales del rol estudiante ', 5, '1.1.4.3.3', 14, 0),
('p_14_a_1630', 179, 1630, 'Desarrollar requerimientos funcionales del rol docente ', 5, '1.1.4.3.4', 14, 0),
('p_14_a_1631', 180, 1631, 'Desarrollar requerimientos funcionales del rol padre de familia ', 5, '1.1.4.3.5', 14, 0),
('p_14_a_1632', 181, 1632, 'Desarrollar requerimientos funcionales del rol coordinador ', 5, '1.1.4.3.6', 14, 0),
('p_14_a_1633', 182, 1633, 'Desarrollar requerimientos funcionales del rol administrador ', 5, '1.1.4.3.7', 14, 0),
('p_14_a_1634', 183, 1634, 'Aceptar los requerimientos funcionales ', 5, '1.1.4.3.8', 14, 0),
('p_14_a_1635', 184, 1635, 'Integrar el módulo al repositorio central ', 5, '1.1.4.3.9', 14, 0),
('p_14_a_1636', 185, 1636, 'PAQ 4.4: Pruebas ', 4, '1.1.4.4', 14, 0),
('p_14_a_1643', 242, 1643, 'PAQ 2.1: Planificación ', 4, '1.2.2.1', 14, 0),
('p_14_a_1644', 243, 1644, 'Desarrollar el material multimedia para la capacitación ', 5, '1.2.2.1.1', 14, 0),
('p_14_a_1645', 244, 1645, 'Definir logística de la capacitación ', 5, '1.2.2.1.2', 14, 0),
('p_14_a_1647', 245, 1647, 'Publicar la convocatoria ', 5, '1.2.2.1.3', 14, 0),
('p_14_a_1648', 246, 1648, 'Aceptar la documentación por parte de la secretaria de educación ', 5, '1.2.2.1.4', 14, 0),
('p_14_a_1649', 247, 1649, 'Adquirir encuestas de satisfacción, registro de asistencia y registro de correcciones y mejoras ', 5, '1.2.2.1.5', 14, 0),
('p_14_a_1650', 248, 1650, 'Adquirir kit de capacitación, y volantes de publicidad ', 5, '1.2.2.1.6', 14, 0),
('p_14_a_1651', 249, 1651, 'Aceptar el material trabajo  ', 5, '1.2.2.1.7', 14, 0),
('p_14_a_1652', 250, 1652, 'PAQ 2.2: Desarrollo ', 4, '1.2.2.2', 14, 0),
('p_14_a_1653', 251, 1653, 'Realizar las capacitaciones ', 5, '1.2.2.2.1', 14, 0),
('p_14_a_1654', 252, 1654, 'Aplicar cuestionario ', 5, '1.2.2.2.2', 14, 0),
('p_14_a_1655', 253, 1655, 'Registrar asistencia ', 5, '1.2.2.2.3', 14, 0),
('p_14_a_1656', 254, 1656, 'Capturar evidencias ', 5, '1.2.2.2.4', 14, 0),
('p_14_a_1657', 255, 1657, 'Capturar correcciones y mejoras ', 5, '1.2.2.2.5', 14, 0),
('p_14_a_1658', 256, 1658, 'Finalizar capacitación ', 5, '1.2.2.2.6', 14, 0),
('p_14_a_1659', 257, 1659, 'PAQ 2.3: Evaluación ', 4, '1.2.2.3', 14, 0),
('p_14_a_1660', 258, 1660, 'Analizar resultados de los cuestionarios ', 5, '1.2.2.3.1', 14, 0),
('p_14_a_1661', 259, 1661, 'Documentar la capacitación ', 5, '1.2.2.3.2', 14, 0),
('p_14_a_1662', 260, 1662, 'Documentar las correcciones y mejoras ', 5, '1.2.2.3.3', 14, 0),
('p_14_a_1663', 261, 1663, 'Publicar resultados de las capacitaciones ', 5, '1.2.2.3.4', 14, 0),
('p_14_a_1664', 262, 1664, 'Publicar las evidencias ', 5, '1.2.2.3.5', 14, 0),
('p_14_a_1665', 263, 1665, 'Publicar contenido de las capacitaciones ', 5, '1.2.2.3.6', 14, 0),
('p_14_a_1666', 264, 1666, 'Entregar resultados ', 5, '1.2.2.3.7', 14, 0),
('p_14_a_1667', 267, 1667, 'PAQ 3.1: Planificación ', 4, '1.2.3.1', 14, 0),
('p_14_a_1668', 268, 1668, 'Desarrollar el material multimedia para la capacitación ', 5, '1.2.3.1.1', 14, 0),
('p_14_a_1669', 269, 1669, 'Definir logística de la capacitación ', 5, '1.2.3.1.2', 14, 0),
('p_14_a_1670', 270, 1670, 'Publicar la convocatoria ', 5, '1.2.3.1.3', 14, 0),
('p_14_a_1671', 271, 1671, 'Aceptar la documentación por parte de la secretaria de educación ', 5, '1.2.3.1.4', 14, 0),
('p_14_a_1672', 272, 1672, 'Adquirir encuestas de satisfacción, registro de asistencia y registro de correcciones y mejoras ', 5, '1.2.3.1.5', 14, 0),
('p_14_a_1673', 273, 1673, 'Adquirir kit de capacitación, y volantes de publicidad ', 5, '1.2.3.1.6', 14, 0),
('p_14_a_1674', 274, 1674, 'Aceptar el material trabajo  ', 5, '1.2.3.1.7', 14, 0),
('p_14_a_1675', 275, 1675, 'PAQ 3.2: Desarrollo ', 4, '1.2.3.2', 14, 0),
('p_14_a_1676', 276, 1676, 'Realizar las capacitaciones ', 5, '1.2.3.2.1', 14, 0),
('p_14_a_1677', 277, 1677, 'Aplicar cuestionario ', 5, '1.2.3.2.2', 14, 0),
('p_14_a_1678', 278, 1678, 'Registrar asistencia ', 5, '1.2.3.2.3', 14, 0),
('p_14_a_1679', 279, 1679, 'Capturar evidencias ', 5, '1.2.3.2.4', 14, 0),
('p_14_a_1680', 280, 1680, 'Capturar correcciones y mejoras ', 5, '1.2.3.2.5', 14, 0),
('p_14_a_1681', 281, 1681, 'Finalizar capacitación ', 5, '1.2.3.2.6', 14, 0),
('p_14_a_1682', 282, 1682, 'PAQ 3.3: Evaluación ', 4, '1.2.3.3', 14, 0),
('p_14_a_1683', 283, 1683, 'Analizar resultados de los cuestionarios ', 5, '1.2.3.3.1', 14, 0),
('p_14_a_1684', 284, 1684, 'Documentar la capacitación ', 5, '1.2.3.3.2', 14, 0),
('p_14_a_1685', 285, 1685, 'Documentar las correcciones y mejoras ', 5, '1.2.3.3.3', 14, 0),
('p_14_a_1686', 286, 1686, 'Publicar resultados de las capacitaciones ', 5, '1.2.3.3.4', 14, 0),
('p_14_a_1687', 287, 1687, 'Publicar las evidencias ', 5, '1.2.3.3.5', 14, 0),
('p_14_a_1688', 288, 1688, 'Publicar contenido de las capacitaciones ', 5, '1.2.3.3.6', 14, 0),
('p_14_a_1689', 289, 1689, 'Entregar resultados ', 5, '1.2.3.3.7', 14, 0),
('p_14_a_1690', 292, 1690, 'PAQ 4.1: Planificación ', 4, '1.2.4.1', 14, 0),
('p_14_a_1691', 293, 1691, 'Desarrollar el material multimedia para la capacitación ', 5, '1.2.4.1.1', 14, 0),
('p_14_a_1692', 294, 1692, 'Definir logística de la capacitación ', 5, '1.2.4.1.2', 14, 0),
('p_14_a_1693', 295, 1693, 'Publicar la convocatoria ', 5, '1.2.4.1.3', 14, 0),
('p_14_a_1694', 296, 1694, 'Aceptar la documentación por parte de la secretaria de educación ', 5, '1.2.4.1.4', 14, 0),
('p_14_a_1695', 297, 1695, 'Adquirir encuestas de satisfacción, registro de asistencia y registro de correcciones y mejoras ', 5, '1.2.4.1.5', 14, 0),
('p_14_a_1696', 298, 1696, 'Adquirir kit de capacitación, y volantes de publicidad ', 5, '1.2.4.1.6', 14, 0),
('p_14_a_1697', 299, 1697, 'Aceptar el material trabajo ', 5, '1.2.4.1.7', 14, 0),
('p_14_a_1698', 300, 1698, 'PAQ 4.2: Desarrollo ', 4, '1.2.4.2', 14, 0),
('p_14_a_1699', 301, 1699, 'Realizar las capacitaciones ', 5, '1.2.4.2.1', 14, 0),
('p_14_a_1700', 302, 1700, 'Aplicar cuestionario ', 5, '1.2.4.2.2', 14, 0),
('p_14_a_1701', 303, 1701, 'Registrar asistencia ', 5, '1.2.4.2.3', 14, 0),
('p_14_a_1702', 304, 1702, 'Capturar evidencias ', 5, '1.2.4.2.4', 14, 0),
('p_14_a_1703', 305, 1703, 'Capturar correcciones y mejoras ', 5, '1.2.4.2.5', 14, 0),
('p_14_a_1704', 306, 1704, 'Finalizar capacitación ', 5, '1.2.4.2.6', 14, 0),
('p_14_a_1705', 307, 1705, 'PAQ 4.3: Evaluación ', 4, '1.2.4.3', 14, 0),
('p_14_a_1706', 308, 1706, 'Analizar resultados de los cuestionarios ', 5, '1.2.4.3.1', 14, 0),
('p_14_a_1707', 309, 1707, 'Documentar la capacitación ', 5, '1.2.4.3.2', 14, 0),
('p_14_a_1708', 310, 1708, 'Documentar las correcciones y mejoras ', 5, '1.2.4.3.3', 14, 0),
('p_14_a_1709', 311, 1709, 'Publicar resultados de las capacitaciones ', 5, '1.2.4.3.4', 14, 0),
('p_14_a_1710', 312, 1710, 'Publicar las evidencias ', 5, '1.2.4.3.5', 14, 0),
('p_14_a_1711', 313, 1711, 'Publicar contenido de las capacitaciones ', 5, '1.2.4.3.6', 14, 0),
('p_14_a_1712', 314, 1712, 'Entregar resultados ', 5, '1.2.4.3.7', 14, 0),
('p_14_a_1713', 400, 1713, 'E4: Capacitación a 4300 estudiantes ', 2, '1.4', 14, 0),
('p_14_a_1714', 401, 1714, 'SE 4.1: Capacitación a 1075 estudiantes ', 3, '1.4.1', 14, 0),
('p_14_a_1715', 402, 1715, 'PAQ 1.1: Planificación ', 4, '1.4.1.1', 14, 0),
('p_14_a_1716', 403, 1716, 'Desarrollar el material multimedia para la capacitación ', 5, '1.4.1.1.1', 14, 0),
('p_14_a_1717', 404, 1717, 'Definir logística de la capacitación ', 5, '1.4.1.1.2', 14, 0),
('p_14_a_1718', 405, 1718, 'Definir encuesta de satisfacción, registro de asistencia y registro de correcciones y mejoras ', 5, '1.4.1.1.3', 14, 0),
('p_14_a_1719', 406, 1719, 'Publicar la convocatoria ', 5, '1.4.1.1.4', 14, 0),
('p_14_a_1720', 407, 1720, 'Aceptar la documentación por parte de la secretaria de educación ', 5, '1.4.1.1.5', 14, 0),
('p_14_a_1721', 408, 1721, 'Adquirir encuestas de satisfacción, registro de asistencia y registro de correcciones y mejoras ', 5, '1.4.1.1.6', 14, 0),
('p_14_a_1722', 409, 1722, 'Adquirir kit de capacitación, pendones y volantes de publicidad ', 5, '1.4.1.1.7', 14, 0),
('p_14_a_1723', 410, 1723, 'Aceptar el material trabajo  ', 5, '1.4.1.1.8', 14, 0),
('p_14_a_1724', 411, 1724, 'PAQ 1.2: Desarrollo ', 4, '1.4.1.2', 14, 0),
('p_14_a_1725', 412, 1725, 'Realizar las capacitaciones ', 5, '1.4.1.2.1', 14, 0),
('p_14_a_1726', 413, 1726, 'Aplicar cuestionario ', 5, '1.4.1.2.2', 14, 0),
('p_14_a_1727', 414, 1727, 'Registrar asistencia ', 5, '1.4.1.2.3', 14, 0),
('p_14_a_1728', 415, 1728, 'Capturar evidencias ', 5, '1.4.1.2.4', 14, 0),
('p_14_a_1729', 416, 1729, 'Capturar correcciones y mejoras ', 5, '1.4.1.2.5', 14, 0),
('p_14_a_1730', 417, 1730, 'Finalizar capacitación ', 5, '1.4.1.2.6', 14, 0),
('p_14_a_1731', 418, 1731, 'PAQ 1.3: Evaluación ', 4, '1.4.1.3', 14, 0),
('p_14_a_1732', 419, 1732, 'Analizar resultados de los cuestionarios ', 5, '1.4.1.3.1', 14, 0),
('p_14_a_1733', 420, 1733, 'Documentar la capacitación ', 5, '1.4.1.3.2', 14, 0),
('p_14_a_1734', 421, 1734, 'Documentar las correcciones y mejoras ', 5, '1.4.1.3.3', 14, 0),
('p_14_a_1735', 422, 1735, 'Publicar resultados de las capacitaciones ', 5, '1.4.1.3.4', 14, 0),
('p_14_a_1736', 423, 1736, 'Publicar las evidencias ', 5, '1.4.1.3.5', 14, 0),
('p_14_a_1737', 424, 1737, 'Publicar contenido de las capacitaciones ', 5, '1.4.1.3.6', 14, 0),
('p_14_a_1738', 425, 1738, 'Entregar resultados ', 5, '1.4.1.3.7', 14, 0),
('p_14_a_1739', 427, 1739, 'SE 4.2: Capacitación a 1075 estudiantes ', 3, '1.4.2', 14, 0),
('p_14_a_1740', 428, 1740, 'PAQ 2.1: Planificación ', 4, '1.4.2.1', 14, 0),
('p_14_a_1741', 429, 1741, 'Desarrollar el material multimedia para la capacitación ', 5, '1.4.2.1.1', 14, 0),
('p_14_a_1742', 430, 1742, 'Definir logística de la capacitación ', 5, '1.4.2.1.2', 14, 0),
('p_14_a_1743', 431, 1743, 'Publicar la convocatoria ', 5, '1.4.2.1.3', 14, 0),
('p_14_a_1744', 432, 1744, 'Aceptar la documentación por parte de la secretaria de educación ', 5, '1.4.2.1.4', 14, 0),
('p_14_a_1745', 433, 1745, 'Adquirir encuestas de satisfacción, registro de asistencia y registro de correcciones y mejoras ', 5, '1.4.2.1.5', 14, 0),
('p_14_a_1746', 434, 1746, 'Adquirir kit de capacitación, y volantes de publicidad ', 5, '1.4.2.1.6', 14, 0),
('p_14_a_1747', 435, 1747, 'Aceptar el material trabajo ', 5, '1.4.2.1.7', 14, 0),
('p_14_a_1748', 436, 1748, 'PAQ 2.2: Desarrollo ', 4, '1.4.2.2', 14, 0),
('p_14_a_1749', 437, 1749, 'Realizar las capacitaciones ', 5, '1.4.2.2.1', 14, 0),
('p_14_a_1750', 438, 1750, 'Aplicar cuestionario ', 5, '1.4.2.2.2', 14, 0),
('p_14_a_1751', 439, 1751, 'Registrar asistencia ', 5, '1.4.2.2.3', 14, 0),
('p_14_a_1752', 440, 1752, 'Capturar evidencias ', 5, '1.4.2.2.4', 14, 0),
('p_14_a_1753', 441, 1753, 'Capturar correcciones y mejoras ', 5, '1.4.2.2.5', 14, 0),
('p_14_a_1754', 442, 1754, 'Finalizar capacitación ', 5, '1.4.2.2.6', 14, 0),
('p_14_a_1755', 443, 1755, 'PAQ 2.3: Evaluación ', 4, '1.4.2.3', 14, 0),
('p_14_a_1756', 444, 1756, 'Analizar resultados de los cuestionarios ', 5, '1.4.2.3.1', 14, 0),
('p_14_a_1757', 445, 1757, 'Documentar la capacitación ', 5, '1.4.2.3.2', 14, 0),
('p_14_a_1758', 446, 1758, 'Documentar las correcciones y mejoras ', 5, '1.4.2.3.3', 14, 0),
('p_14_a_1759', 447, 1759, 'Publicar resultados de las capacitaciones ', 5, '1.4.2.3.4', 14, 0),
('p_14_a_1760', 448, 1760, 'Publicar las evidencias ', 5, '1.4.2.3.5', 14, 0),
('p_14_a_1761', 449, 1761, 'Publicar contenido de las capacitaciones ', 5, '1.4.2.3.6', 14, 0),
('p_14_a_1762', 450, 1762, 'Entregar resultados ', 5, '1.4.2.3.7', 14, 0),
('p_14_a_1763', 452, 1763, 'SE 4.3: Capacitación a 1075 estudiantes ', 3, '1.4.3', 14, 0),
('p_14_a_1764', 453, 1764, 'PAQ 3.1: Planificación ', 4, '1.4.3.1', 14, 0),
('p_14_a_1765', 454, 1765, 'Desarrollar el material multimedia para la capacitación ', 5, '1.4.3.1.1', 14, 0),
('p_14_a_1766', 455, 1766, 'Definir logística de la capacitación ', 5, '1.4.3.1.2', 14, 0),
('p_14_a_1767', 456, 1767, 'Publicar la convocatoria ', 5, '1.4.3.1.3', 14, 0),
('p_14_a_1768', 457, 1768, 'Aceptar la documentación por parte de la secretaria de educación ', 5, '1.4.3.1.4', 14, 0),
('p_14_a_1769', 458, 1769, 'Adquirir encuestas de satisfacción, registro de asistencia y registro de correcciones y mejoras ', 5, '1.4.3.1.5', 14, 0),
('p_14_a_1770', 459, 1770, 'Adquirir kit de capacitación, y volantes de publicidad ', 5, '1.4.3.1.6', 14, 0),
('p_14_a_1771', 460, 1771, 'Aceptar el material trabajo  ', 5, '1.4.3.1.7', 14, 0),
('p_14_a_1772', 461, 1772, 'PAQ 3.2: Desarrollo ', 4, '1.4.3.2', 14, 0),
('p_14_a_1773', 462, 1773, 'Realizar las capacitaciones ', 5, '1.4.3.2.1', 14, 0),
('p_14_a_1774', 463, 1774, 'Aplicar cuestionario ', 5, '1.4.3.2.2', 14, 0),
('p_14_a_1775', 464, 1775, 'Registrar asistencia ', 5, '1.4.3.2.3', 14, 0),
('p_14_a_1776', 465, 1776, 'Capturar evidencias ', 5, '1.4.3.2.4', 14, 0),
('p_14_a_1777', 466, 1777, 'Capturar correcciones y mejoras ', 5, '1.4.3.2.5', 14, 0),
('p_14_a_1778', 467, 1778, 'Finalizar capacitación ', 5, '1.4.3.2.6', 14, 0),
('p_14_a_1779', 468, 1779, 'PAQ 3.3: Evaluación ', 4, '1.4.3.3', 14, 0),
('p_14_a_1780', 469, 1780, 'Analizar resultados de los cuestionarios ', 5, '1.4.3.3.1', 14, 0),
('p_14_a_1781', 470, 1781, 'Documentar la capacitación ', 5, '1.4.3.3.2', 14, 0),
('p_14_a_1782', 471, 1782, 'Documentar las correcciones y mejoras ', 5, '1.4.3.3.3', 14, 0),
('p_14_a_1783', 472, 1783, 'Publicar resultados de las capacitaciones ', 5, '1.4.3.3.4', 14, 0),
('p_14_a_1784', 473, 1784, 'Publicar las evidencias ', 5, '1.4.3.3.5', 14, 0),
('p_14_a_1785', 474, 1785, 'Publicar contenido de las capacitaciones ', 5, '1.4.3.3.6', 14, 0),
('p_14_a_1786', 475, 1786, 'Entregar resultados ', 5, '1.4.3.3.7', 14, 0),
('p_14_a_1787', 477, 1787, 'SE 4.4: Capacitación a 1075 estudiantes ', 3, '1.4.4', 14, 0),
('p_14_a_1788', 478, 1788, 'PAQ 4.1: Planificación ', 4, '1.4.4.1', 14, 0),
('p_14_a_1789', 479, 1789, 'Desarrollar el material multimedia para la capacitación ', 5, '1.4.4.1.1', 14, 0),
('p_14_a_1790', 480, 1790, 'Definir logística de la capacitación ', 5, '1.4.4.1.2', 14, 0),
('p_14_a_1791', 481, 1791, 'Publicar la convocatoria ', 5, '1.4.4.1.3', 14, 0),
('p_14_a_1792', 482, 1792, 'Aceptar la documentación por parte de la secretaria de educación ', 5, '1.4.4.1.4', 14, 0),
('p_14_a_1793', 483, 1793, 'Adquirir encuestas de satisfacción, registro de asistencia y registro de correcciones y mejoras ', 5, '1.4.4.1.5', 14, 0),
('p_14_a_1794', 484, 1794, 'Adquirir kit de capacitación, y volantes de publicidad ', 5, '1.4.4.1.6', 14, 0),
('p_14_a_1795', 485, 1795, 'Aceptar el material trabajo  ', 5, '1.4.4.1.7', 14, 0),
('p_14_a_1796', 486, 1796, 'PAQ 4.2: Desarrollo ', 4, '1.4.4.2', 14, 0),
('p_14_a_1797', 487, 1797, 'Realizar las capacitaciones ', 5, '1.4.4.2.1', 14, 0),
('p_14_a_1798', 488, 1798, 'Aplicar cuestionario ', 5, '1.4.4.2.2', 14, 0),
('p_14_a_1799', 489, 1799, 'Registrar asistencia ', 5, '1.4.4.2.3', 14, 0),
('p_14_a_1800', 490, 1800, 'Capturar evidencias ', 5, '1.4.4.2.4', 14, 0),
('p_14_a_1801', 491, 1801, 'Capturar correcciones y mejoras ', 5, '1.4.4.2.5', 14, 0),
('p_14_a_1802', 492, 1802, 'Finalizar capacitación ', 5, '1.4.4.2.6', 14, 0),
('p_14_a_1803', 493, 1803, 'PAQ 4.3: Evaluación ', 4, '1.4.4.3', 14, 0),
('p_14_a_1804', 494, 1804, 'Analizar resultados de los cuestionarios ', 5, '1.4.4.3.1', 14, 0),
('p_14_a_1805', 495, 1805, 'Documentar la capacitación ', 5, '1.4.4.3.2', 14, 0),
('p_14_a_1806', 496, 1806, 'Documentar las correcciones y mejoras ', 5, '1.4.4.3.3', 14, 0),
('p_14_a_1807', 497, 1807, 'Publicar resultados de las capacitaciones ', 5, '1.4.4.3.4', 14, 0),
('p_14_a_1808', 498, 1808, 'Publicar las evidencias ', 5, '1.4.4.3.5', 14, 0),
('p_14_a_1809', 499, 1809, 'Publicar contenido de las capacitaciones ', 5, '1.4.4.3.6', 14, 0),
('p_14_a_1810', 500, 1810, 'Entregar resultados ', 5, '1.4.4.3.7', 14, 0),
('p_14_a_1811', 502, 1811, 'SE 4.5: Correcciones y mejoras ', 3, '1.4.5', 14, 0),
('p_14_a_1812', 503, 1812, 'PAQ 5.1: Planificación ', 4, '1.4.5.1', 14, 0),
('p_14_a_1813', 504, 1813, 'Identificar las historias de usuario defectuosas ', 5, '1.4.5.1.1', 14, 0),
('p_14_a_1814', 505, 1814, 'Corregir las historias de usuario defectuosas ', 5, '1.4.5.1.2', 14, 0),
('p_14_a_1815', 506, 1815, 'Formalizar las historias de usuario ', 5, '1.4.5.1.3', 14, 0),
('p_14_a_1816', 507, 1816, 'relacionar las historias de usuario ', 5, '1.4.5.1.4', 14, 0),
('p_14_a_1817', 508, 1817, 'Formalizar el mapa de historias de usuario ', 5, '1.4.5.1.5', 14, 0),
('p_14_a_1818', 509, 1818, 'PAQ 5.2: Implementación ', 4, '1.4.5.2', 14, 0),
('p_14_a_1819', 510, 1819, 'Corregir las interfaces de usuario ', 5, '1.4.5.2.1', 14, 0),
('p_14_a_1820', 511, 1820, 'Aplicar reingeniería al código fuente ', 5, '1.4.5.2.2', 14, 0),
('p_14_a_1821', 512, 1821, 'Unir las características del modulo ', 5, '1.4.5.2.3', 14, 0),
('p_14_a_1822', 513, 1822, 'Integrar el módulo al repositorio central ', 5, '1.4.5.2.4', 14, 0),
('p_14_a_1823', 514, 1823, 'Actualizar el documento de lecciones aprendidas ', 5, '1.4.5.2.5', 14, 0),
('p_14_a_1824', 359, 1824, 'SE 3.2: Capacitación a 650 docentes ', 3, '1.3.2', 14, 0),
('p_14_a_1825', 360, 1825, 'PAQ 1.1: Planificación ', 4, '1.3.2.1', 14, 0),
('p_14_a_1826', 361, 1826, 'Desarrollar el material multimedia para la capacitación ', 5, '1.3.2.1.1', 14, 0),
('p_14_a_1827', 362, 1827, 'Definir logística de la capacitación ', 5, '1.3.2.1.2', 14, 0),
('p_14_a_1829', 363, 1829, 'Publicar la convocatoria ', 5, '1.3.2.1.3', 14, 0),
('p_14_a_1830', 364, 1830, 'Aceptar la documentación por parte de la secretaria de educación ', 5, '1.3.2.1.4', 14, 0),
('p_14_a_1831', 365, 1831, 'Adquirir encuestas de satisfacción, registro de asistencia y registro de correcciones y mejoras ', 5, '1.3.2.1.5', 14, 0),
('p_14_a_1832', 366, 1832, 'Adquirir kit de capacitación, y volantes de publicidad ', 5, '1.3.2.1.6', 14, 0),
('p_14_a_1833', 367, 1833, 'Adquirir refrigerio docentes ', 5, '1.3.2.1.7', 14, 0),
('p_14_a_1834', 368, 1834, 'Aceptar el material trabajo  ', 5, '1.3.2.1.8', 14, 0),
('p_14_a_1835', 369, 1835, 'PAQ 1.2: Desarrollo ', 4, '1.3.2.2', 14, 0),
('p_14_a_1836', 370, 1836, 'Realizar las capacitaciones ', 5, '1.3.2.2.1', 14, 0),
('p_14_a_1837', 371, 1837, 'Aplicar cuestionario ', 5, '1.3.2.2.2', 14, 0),
('p_14_a_1838', 372, 1838, 'Registrar asistencia ', 5, '1.3.2.2.3', 14, 0),
('p_14_a_1839', 373, 1839, 'Capturar evidencias ', 5, '1.3.2.2.4', 14, 0),
('p_14_a_1840', 374, 1840, 'Capturar correcciones y mejoras ', 5, '1.3.2.2.5', 14, 0),
('p_14_a_1841', 375, 1841, 'Finalizar capacitación ', 5, '1.3.2.2.6', 14, 0),
('p_14_a_1842', 376, 1842, 'PAQ 1.3: Evaluación ', 4, '1.3.2.3', 14, 0),
('p_14_a_1843', 377, 1843, 'Analizar resultados de los cuestionarios ', 5, '1.3.2.3.1', 14, 0),
('p_14_a_1844', 378, 1844, 'Documentar la capacitación ', 5, '1.3.2.3.2', 14, 0),
('p_14_a_1845', 379, 1845, 'Documentar las correcciones y mejoras ', 5, '1.3.2.3.3', 14, 0),
('p_14_a_1846', 380, 1846, 'Publicar resultados de las capacitaciones ', 5, '1.3.2.3.4', 14, 0),
('p_14_a_1847', 381, 1847, 'Publicar las evidencias ', 5, '1.3.2.3.5', 14, 0),
('p_14_a_1848', 382, 1848, 'Publicar contenido de las capacitaciones ', 5, '1.3.2.3.6', 14, 0),
('p_14_a_1849', 383, 1849, 'Entregar resultados ', 5, '1.3.2.3.7', 14, 0),
('p_14_a_1854', 47, 1854, 'Realizar reunión para la planeación de pruebas beta ', 5, '1.1.1.4.6', 14, 0),
('p_14_a_1855', 48, 1855, 'Realizar convocatoria de usuario finales para las pruebas beta ', 5, '1.1.1.4.7', 14, 0),
('p_14_a_1856', 49, 1856, 'Llevar a cabo las pruebas beta ', 5, '1.1.1.4.8', 14, 0),
('p_14_a_1858', 50, 1858, 'Aceptar pruebas de software ', 5, '1.1.1.4.9', 14, 0),
('p_14_a_1868', 89, 1868, 'Verificar historias de usuario ', 5, '1.1.2.4.1', 14, 0),
('p_14_a_1869', 90, 1869, 'Identificar los casos de pruebas unitarias ', 5, '1.1.2.4.2', 14, 0),
('p_14_a_1870', 91, 1870, 'Realizar las pruebas unitarias ', 5, '1.1.2.4.3', 14, 0),
('p_14_a_1871', 92, 1871, 'Realizar pruebas de aplicación ', 5, '1.1.2.4.4', 14, 0),
('p_14_a_1872', 93, 1872, 'Realizar pruebas de integración ', 5, '1.1.2.4.5', 14, 0),
('p_14_a_1873', 94, 1873, 'Realizar reunión para la planeación de pruebas beta ', 5, '1.1.2.4.6', 14, 0),
('p_14_a_1874', 95, 1874, 'Realizar convocatoria de usuario finales para las pruebas beta ', 5, '1.1.2.4.7', 14, 0),
('p_14_a_1875', 96, 1875, 'Llevar a cabo las pruebas beta ', 5, '1.1.2.4.8', 14, 0),
('p_14_a_1876', 97, 1876, 'Aceptar pruebas de software ', 5, '1.1.2.4.9', 14, 0),
('p_14_a_1896', 137, 1896, 'Verificar historias de usuario ', 5, '1.1.3.4.1', 14, 0),
('p_14_a_1897', 138, 1897, 'Identificar los casos de pruebas unitarias ', 5, '1.1.1.2', 14, 0),
('p_14_a_1898', 139, 1898, 'Realizar las pruebas unitarias ', 5, '1.1.3.4.3', 14, 0),
('p_14_a_1899', 140, 1899, 'Realizar pruebas de aplicación ', 5, '1.1.3.4.4', 14, 0),
('p_14_a_1900', 141, 1900, 'Realizar pruebas de integración ', 5, '1.1.3.4.5', 14, 0),
('p_14_a_1901', 142, 1901, 'Realizar reunión para la planeación de pruebas beta ', 5, '1.1.3.4.6', 14, 0),
('p_14_a_1902', 143, 1902, 'Realizar convocatoria de usuario finales para las pruebas beta ', 5, '1.1.3.4.7', 14, 0),
('p_14_a_1903', 144, 1903, 'Llevar a cabo las pruebas beta ', 5, '1.1.3.4.8', 14, 0),
('p_14_a_1904', 145, 1904, 'Aceptar pruebas de software ', 5, '1.1.3.4.9', 14, 0),
('p_14_a_1905', 186, 1905, 'Verificar historias de usuario ', 5, '1.1.4.4.1', 14, 0),
('p_14_a_1906', 187, 1906, 'Identificar los casos de pruebas unitarias ', 5, '1.1.4.4.2', 14, 0),
('p_14_a_1907', 188, 1907, 'Realizar las pruebas unitarias ', 5, '1.1.4.4.3', 14, 0),
('p_14_a_1908', 189, 1908, 'Realizar pruebas de aplicación ', 5, '1.1.4.4.4', 14, 0),
('p_14_a_1909', 190, 1909, 'Realizar pruebas de integración ', 5, '1.1.4.4.5', 14, 0),
('p_14_a_1910', 191, 1910, 'Realizar reunión para la planeación de pruebas beta ', 5, '1.1.4.4.6', 14, 0),
('p_14_a_1911', 192, 1911, 'Realizar convocatoria de usuario finales para las pruebas beta ', 5, '1.1.4.4.7', 14, 0),
('p_14_a_1912', 193, 1912, 'Llevar a cabo las pruebas beta ', 5, '1.1.4.4.8', 14, 0),
('p_14_a_1913', 194, 1913, 'Aceptar pruebas de software ', 5, '1.1.4.4.9', 14, 0),
('p_14_a_1915', 98, 1915, 'Aceptar módulo de trabajo, tareas y refuerzos ', 4, '1.1.2.5', 14, 0),
('p_14_a_1916', 51, 1916, 'Aceptar módulo de administración ', 4, '1.1.1.5', 14, 0),
('p_14_a_1917', 146, 1917, 'Aceptar módulo de trabajo, tareas y refuerzos ', 4, '1.1.3.5', 14, 0),
('p_14_a_1918', 195, 1918, 'Aceptar módulo de eventos y citas  ', 4, '1.1.4.5', 14, 0),
('p_14_a_1921', 212, 1921, 'Instalar aplicación  ', 4, '1.1.5.3', 14, 0),
('p_14_a_1922', 330, 1922, 'Capacitar a todos los padres de familia ', 3, '1.2.6', 14, 0),
('p_14_a_1923', 399, 1923, 'Capacitar a docentes ', 3, '1.3.4', 14, 0),
('p_14_a_1924', 516, 1924, 'Capacitar a estudiantes ', 3, '1.1.1.4', 14, 0),
('p_14_a_1925', 213, 1925, 'Entregar aplicación web ', 3, '1.1.6', 14, 0),
('p_14_a_1926', 240, 1926, 'Capacitar primer grupo de padres ', 4, '1.2.1.4', 14, 0),
('p_14_a_1927', 265, 1927, 'Capacitar segundo grupo de padres ', 4, '1.2.2.4', 14, 0),
('p_14_a_1928', 290, 1928, 'Capacitar tercer grupo de padres ', 4, '1.2.3.4', 14, 0),
('p_14_a_1929', 315, 1929, 'Capacitar cuarto grupo de padres ', 4, '1.2.4.4', 14, 0),
('p_14_a_1930', 329, 1930, 'Aplicar correcciones y mejoras de las capacitaciones de padres ', 4, '1.2.5.3', 14, 0),
('p_14_a_1931', 358, 1931, 'Capacitar primer grupo de docentes ', 4, '1.3.1.4', 14, 0),
('p_14_a_1932', 384, 1932, 'Capacitar segundo grupo de docentes ', 4, '1.3.2.4', 14, 0),
('p_14_a_1933', 398, 1933, 'Aplicar correcciones y mejoras de las capacitaciones docente ', 4, '1.3.3.3', 14, 0),
('p_14_a_1934', 426, 1934, 'Capacitar primer grupo de estudiantes ', 4, '1.4.1.4', 14, 0),
('p_14_a_1935', 451, 1935, 'Capacitar segundo grupo de estudiantes ', 4, '1.4.2.4', 14, 0),
('p_14_a_1936', 476, 1936, 'Capacitar tercer grupo de estudiantes ', 4, '1.1.1.2', 14, 0),
('p_14_a_1937', 501, 1937, 'Capacitar cuarto grupo de estudiantes ', 4, '1.4.4.4', 14, 0),
('p_14_a_1938', 515, 1938, 'Aplicar correcciones y mejoras de las capacitaciones estudiantes ', 4, '1.4.5.3', 14, 0),
('p_14_a_1942', 44, 1942, 'Realizar las pruebas unitarias ', 5, '1.1.1.4.3', 14, 0),
('p_14_a_253', 196, 253, 'SE 1.5: Transferencia tecnológica ', 3, '1.1.5', 14, 0),
('p_14_a_254', 197, 254, 'PAQ 5.1: Integración ', 4, '1.1.5.1', 14, 0),
('p_14_a_255', 203, 255, 'PAQ 5.2: Pruebas ', 4, '1.1.5.2', 14, 0),
('p_14_a_257', 208, 257, 'Realizar prueba de seguridad ', 5, '1.1.5.2.5', 14, 0),
('p_14_a_258', 209, 258, 'Realizar prueba de carga ', 5, '1.1.5.2.6', 14, 0),
('p_14_a_259', 214, 259, 'E2: Capacitación a 4300 padres de familia ', 2, '1.2', 14, 0),
('p_14_a_26', 99, 26, 'SE 1.3: Modulo de observaciones académicas y comportamentales ', 3, '1.1.3', 14, 0),
('p_14_a_260', 215, 260, 'SE 2.1: Capacitación a 1075 padres de familia ', 3, '1.2.1', 14, 0),
('p_14_a_261', 216, 261, 'PAQ 1.1: Planificación ', 4, '1.2.1.1', 14, 0),
('p_14_a_262', 217, 262, 'Desarrollar el material multimedia para la capacitación ', 5, '1.2.1.1.1', 14, 0),
('p_14_a_263', 225, 263, 'PAQ 1.2: Desarrollo ', 4, '1.2.1.2', 14, 0),
('p_14_a_264', 228, 264, 'Registrar asistencia ', 5, '1.2.1.2.3', 14, 0),
('p_14_a_265', 232, 265, 'PAQ 1.3: Evaluación ', 4, '1.2.1.3', 14, 0),
('p_14_a_266', 236, 266, 'Publicar resultados de las capacitaciones ', 5, '1.2.1.3.4', 14, 0),
('p_14_a_3', 1, 3, 'EduVirtual ', 1, '1', 14, 0),
('p_14_a_314', 198, 314, 'Desarrollar reunión para solicitar credenciales y requerimientos de conexión ', 5, '1.1.5.1.1', 14, 0),
('p_14_a_315', 199, 315, 'Cargar el software en el servidor ', 5, '1.1.5.1.2', 14, 0),
('p_14_a_316', 200, 316, 'Migrar datos del SIMAT ', 5, '1.1.5.1.3', 14, 0),
('p_14_a_317', 201, 317, 'Hacer entrega de los backups ', 5, '1.1.5.1.4', 14, 0),
('p_14_a_318', 210, 318, 'Realizar prueba de rendimiento ', 5, '1.1.5.2.7', 14, 0),
('p_14_a_319', 202, 319, 'Aceptar entrega de la aplicación ', 5, '1.1.5.1.5', 14, 0),
('p_14_a_320', 211, 320, 'Entregar resultados de pruebas  ', 5, '1.1.5.2.8', 14, 0),
('p_14_a_323', 218, 323, 'Definir logística de la capacitación ', 5, '1.2.1.1.2', 14, 0),
('p_14_a_324', 220, 324, 'Publicar la convocatoria ', 5, '1.2.1.1.4', 14, 0),
('p_14_a_326', 233, 326, 'Analizar resultados de los cuestionarios ', 5, '1.2.1.3.1', 14, 0),
('p_14_a_327', 226, 327, 'Realizar las capacitaciones ', 5, '1.2.1.2.1', 14, 0),
('p_14_a_330', 221, 330, 'Aceptar la documentación por parte de la secretaria de educación ', 5, '1.2.1.1.5', 14, 0),
('p_14_a_333', 229, 333, 'Capturar evidencias ', 5, '1.2.1.2.4', 14, 0),
('p_14_a_335', 231, 335, 'Finalizar capacitación ', 5, '1.2.1.2.6', 14, 0),
('p_14_a_336', 234, 336, 'Documentar la capacitación ', 5, '1.2.1.3.2', 14, 0),
('p_14_a_337', 237, 337, 'Publicar las evidencias ', 5, '1.2.1.3.5', 14, 0),
('p_14_a_338', 238, 338, 'Publicar contenido de las capacitaciones ', 5, '1.2.1.3.6', 14, 0),
('p_14_a_339', 239, 339, 'Entregar resultados ', 5, '1.2.1.3.7', 14, 0),
('p_14_a_342', 235, 342, 'Documentar las correcciones y mejoras ', 5, '1.2.1.3.3', 14, 0),
('p_14_a_366', 241, 366, 'SE 2.2: Capacitación a 1075 padres de familia ', 3, '1.2.2', 14, 0),
('p_14_a_394', 266, 394, 'SE 2.3: Capacitación a 1075 padres de familia ', 3, '1.2.3', 14, 0),
('p_14_a_4', 2, 4, 'E1: Aplicación web ', 2, '1.1', 14, 0),
('p_14_a_418', 291, 418, 'SE 2.4: Capacitación a 1075 padres de familia ', 3, '1.2.4', 14, 0),
('p_14_a_442', 316, 442, 'SE 2.5: Correcciones y mejoras ', 3, '1.2.5', 14, 0),
('p_14_a_443', 317, 443, 'PAQ 5.1: Planificación ', 4, '1.2.5.1', 14, 0),
('p_14_a_444', 318, 444, 'Identificar las historias de usuario defectuosas ', 5, '1.2.5.1.1', 14, 0),
('p_14_a_445', 319, 445, 'Corregir las historias de usuario defectuosas ', 5, '1.2.5.1.2', 14, 0),
('p_14_a_446', 320, 446, 'Formalizar las historias de usuario ', 5, '1.2.5.1.3', 14, 0),
('p_14_a_447', 321, 447, 'relacionar las historias de usuario ', 5, '1.2.5.1.4', 14, 0),
('p_14_a_448', 322, 448, 'Formalizar el mapa de historias de usuario ', 5, '1.2.5.1.5', 14, 0),
('p_14_a_449', 323, 449, 'PAQ 5.2: Implementación ', 4, '1.2.5.2', 14, 0),
('p_14_a_450', 324, 450, 'Corregir las interfaces de usuario ', 5, '1.2.5.2.1', 14, 0),
('p_14_a_451', 325, 451, 'Aplicar reingeniería al código fuente ', 5, '1.2.5.2.2', 14, 0),
('p_14_a_452', 326, 452, 'Unir las características del modulo ', 5, '1.2.5.2.3', 14, 0),
('p_14_a_453', 327, 453, 'Integrar el módulo al repositorio central ', 5, '1.2.5.2.4', 14, 0),
('p_14_a_454', 328, 454, 'Actualizar el documento de lecciones aprendidas ', 5, '1.2.5.2.5', 14, 0),
('p_14_a_461', 331, 461, 'E3: Capacitación a 1300 docentes ', 2, '1.3', 14, 0),
('p_14_a_5', 3, 5, 'SE 1.1: Modulo de Administración ', 3, '1.1.1', 14, 0),
('p_14_a_6', 14, 6, 'Formalizar el plan de entrega ', 5, '1.1.1.1.10', 14, 0),
('p_14_a_682', 206, 682, 'Identificar prueba de rendimiento ', 5, '1.1.5.2.3', 14, 0),
('p_14_a_683', 205, 683, 'Identificar prueba de carga ', 5, '1.1.5.2.2', 14, 0),
('p_14_a_684', 204, 684, 'Identificar pruebas de seguridad ', 5, '1.1.5.2.1', 14, 0),
('p_14_a_74', 147, 74, 'SE 1.4 : Modulo de información de reuniones, eventos y citas con los docentes ', 3, '1.1.4', 14, 0),
('p_14_a_8', 40, 8, 'Integrar el módulo al repositorio central ', 5, '1.1.1.3.9', 14, 0),
('p_14_a_84', 5, 84, 'Efectuar reunión con el patrocinador ', 5, '1.1.1.1.1', 14, 0),
('p_14_a_85', 4, 85, 'PAQ 1.1: Planificación ', 4, '1.1.1.1', 14, 0),
('p_14_a_86', 13, 86, 'Formalizar el mapa de historias de usuario ', 5, '1.1.1.1.9', 14, 0),
('p_14_a_90', 21, 90, 'Diseñar el modelo de despliegue ', 5, '1.1.1.2.6', 14, 0),
('p_14_a_91', 23, 91, 'Definir la arquitectura ', 5, '1.1.1.2.8', 14, 0),
('p_14_a_93', 15, 93, 'PAQ 1.2: Diseño ', 4, '1.1.1.2', 14, 0),
('p_14_a_99', 42, 99, 'Verificar historias de usuario ', 5, '1.1.1.4.1', 14, 0),
('p_15_a_0', 0, 0, 'Proyecto1', 0, '0', 15, 0),
('p_15_a_10', 52, 10, 'SE 1.2: Modulo de trabajos, tareas y refuerzos ', 3, '1.1.2', 15, 0),
('p_15_a_101', 43, 101, 'Identificar los casos de pruebas unitarias ', 5, '1.1.1.4.2', 15, 0),
('p_15_a_107', 24, 107, 'Realizar el modelo conceptual de los datos ', 5, '1.1.1.2.9', 15, 0),
('p_15_a_108', 29, 108, 'Aceptar el glosario de términos ', 5, '1.1.1.2.14', 15, 0),
('p_15_a_1175', 332, 1175, 'SE 3.1: Capacitación a 650 docentes ', 3, '1.3.1', 15, 0),
('p_15_a_1176', 333, 1176, 'PAQ 1.1: Planificación ', 4, '1.3.1.1', 15, 0),
('p_15_a_1177', 334, 1177, 'Desarrollar el material multimedia para la capacitación ', 5, '1.3.1.1.1', 15, 0),
('p_15_a_1178', 335, 1178, 'Definir logística de la capacitación ', 5, '1.3.1.1.2', 15, 0),
('p_15_a_1184', 343, 1184, 'PAQ 1.2: Desarrollo ', 4, '1.3.1.2', 15, 0),
('p_15_a_1185', 344, 1185, 'Realizar las capacitaciones ', 5, '1.3.1.2.1', 15, 0),
('p_15_a_1186', 346, 1186, 'Registrar asistencia ', 5, '1.3.1.2.3', 15, 0),
('p_15_a_1187', 345, 1187, 'Aplicar cuestionario ', 5, '1.3.1.2.2', 15, 0),
('p_15_a_1188', 347, 1188, 'Capturar evidencias ', 5, '1.3.1.2.4', 15, 0),
('p_15_a_1189', 348, 1189, 'Capturar correcciones y mejoras ', 5, '1.3.1.2.5', 15, 0),
('p_15_a_1190', 349, 1190, 'Finalizar capacitación ', 5, '1.3.1.2.6', 15, 0),
('p_15_a_1191', 350, 1191, 'PAQ 1.3: Evaluación ', 4, '1.3.1.3', 15, 0),
('p_15_a_1192', 351, 1192, 'Analizar resultados de los cuestionarios ', 5, '1.3.1.3.1', 15, 0),
('p_15_a_1193', 352, 1193, 'Documentar la capacitación ', 5, '1.3.1.3.2', 15, 0),
('p_15_a_1194', 353, 1194, 'Documentar las correcciones y mejoras ', 5, '1.3.1.3.3', 15, 0),
('p_15_a_1195', 354, 1195, 'Publicar resultados de las capacitaciones ', 5, '1.3.1.3.4', 15, 0),
('p_15_a_1196', 355, 1196, 'Publicar las evidencias ', 5, '1.3.1.3.5', 15, 0),
('p_15_a_1197', 356, 1197, 'Publicar contenido de las capacitaciones ', 5, '1.3.1.3.6', 15, 0),
('p_15_a_1198', 357, 1198, 'Entregar resultados ', 5, '1.3.1.3.7', 15, 0),
('p_15_a_120', 31, 120, 'PAQ 1.3: Codificación ', 4, '1.1.1.3', 15, 0),
('p_15_a_123', 32, 123, 'Desarrollar las interfaces de usuario ', 5, '1.1.1.3.1', 15, 0),
('p_15_a_1271', 385, 1271, 'SE 3.3: Correcciones y mejoras ', 3, '1.3.3', 15, 0),
('p_15_a_1272', 386, 1272, 'PAQ 5.1: Planificación ', 4, '1.3.3.1', 15, 0),
('p_15_a_1273', 387, 1273, 'Identificar las historias de usuario defectuosas ', 5, '1.3.3.1.1', 15, 0),
('p_15_a_1274', 388, 1274, 'Corregir las historias de usuario defectuosas ', 5, '1.3.3.1.2', 15, 0),
('p_15_a_1275', 389, 1275, 'Formalizar las historias de usuario ', 5, '1.3.3.1.3', 15, 0),
('p_15_a_1276', 390, 1276, 'relacionar las historias de usuario ', 5, '1.3.3.1.4', 15, 0),
('p_15_a_1277', 391, 1277, 'Formalizar el mapa de historias de usuario ', 5, '1.3.3.1.5', 15, 0),
('p_15_a_1278', 392, 1278, 'PAQ 5.2: Implementación ', 4, '1.3.3.2', 15, 0),
('p_15_a_1279', 393, 1279, 'Corregir las interfaces de usuario ', 5, '1.3.3.2.1', 15, 0),
('p_15_a_128', 30, 128, 'Aceptar los mockups de las interfaces de usuario ', 5, '1.1.1.2.15', 15, 0),
('p_15_a_1280', 394, 1280, 'Aplicar reingeniería al código fuente ', 5, '1.3.3.2.2', 15, 0),
('p_15_a_1281', 395, 1281, 'Unir las características del modulo ', 5, '1.3.3.2.3', 15, 0),
('p_15_a_1282', 396, 1282, 'Integrar el módulo al repositorio central ', 5, '1.3.3.2.4', 15, 0),
('p_15_a_1283', 397, 1283, 'Actualizar el documento de lecciones aprendidas ', 5, '1.3.3.2.5', 15, 0),
('p_15_a_1285', 25, 1285, 'Realizar el modelo entidad relación ', 5, '1.1.1.2.10', 15, 0),
('p_15_a_1286', 26, 1286, 'Aceptar el modelo de datos ', 5, '1.1.1.2.11', 15, 0),
('p_15_a_1289', 34, 1289, 'Desarrollar requerimientos funcionales del rol estudiante ', 5, '1.1.1.3.3', 15, 0),
('p_15_a_129', 27, 129, 'Modelar los mockups de las interfaces de usuario ', 5, '1.1.1.2.12', 15, 0),
('p_15_a_1291', 35, 1291, 'Desarrollar requerimientos funcionales del rol docente ', 5, '1.1.1.3.4', 15, 0),
('p_15_a_1322', 36, 1322, 'Desarrollar requerimientos funcionales del rol padre de familia ', 5, '1.1.1.3.5', 15, 0),
('p_15_a_1323', 38, 1323, 'Desarrollar requerimientos funcionales del rol administrador ', 5, '1.1.1.3.7', 15, 0),
('p_15_a_1324', 37, 1324, 'Desarrollar requerimientos funcionales del rol coordinador ', 5, '1.1.1.3.6', 15, 0),
('p_15_a_1325', 207, 1325, 'Crear plan de pruebas ', 5, '1.1.5.2.4', 15, 0),
('p_15_a_1327', 219, 1327, 'Definir encuesta de satisfacción, registro de asistencia y registro de correcciones y mejoras ', 5, '1.2.1.1.3', 15, 0),
('p_15_a_1328', 222, 1328, 'Adquirir encuestas de satisfacción, registro de asistencia y registro de correcciones y mejoras ', 5, '1.2.1.1.6', 15, 0),
('p_15_a_1329', 223, 1329, 'Adquirir kit de capacitación, pendones y volantes de publicidad ', 5, '1.2.1.1.7', 15, 0),
('p_15_a_1331', 230, 1331, 'Capturar correcciones y mejoras ', 5, '1.2.1.2.5', 15, 0),
('p_15_a_1334', 227, 1334, 'Aplicar cuestionario ', 5, '1.2.1.2.2', 15, 0),
('p_15_a_1340', 224, 1340, 'Aceptar el material trabajo  ', 5, '1.2.1.1.8', 15, 0),
('p_15_a_1341', 336, 1341, 'Definir encuesta de satisfacción, registro de asistencia y registro de correcciones y mejoras ', 5, '1.3.1.1.3', 15, 0),
('p_15_a_1342', 337, 1342, 'Publicar la convocatoria ', 5, '1.3.1.1.4', 15, 0),
('p_15_a_1343', 338, 1343, 'Aceptar la documentación por parte de la secretaria de educación ', 5, '1.3.1.1.5', 15, 0),
('p_15_a_1344', 339, 1344, 'Adquirir encuestas de satisfacción, registro de asistencia y registro de correcciones y mejoras ', 5, '1.3.1.1.6', 15, 0),
('p_15_a_1345', 340, 1345, 'Adquirir kit de capacitación, pendones y volantes de publicidad ', 5, '1.3.1.1.7', 15, 0),
('p_15_a_1346', 341, 1346, 'Adquirir refrigerio docentes ', 5, '1.3.1.1.8', 15, 0),
('p_15_a_1347', 342, 1347, 'Aceptar el material trabajo ', 5, '1.3.1.1.9', 15, 0),
('p_15_a_136', 41, 136, 'PAQ 1.4: Pruebas ', 4, '1.1.1.4', 15, 0),
('p_15_a_137', 8, 137, 'Realizar entrega formal de historias de usuario ', 5, '1.1.1.1.4', 15, 0),
('p_15_a_138', 9, 138, 'relacionar las historias de usuario ', 5, '1.1.1.1.5', 15, 0),
('p_15_a_139', 10, 139, 'Mapear el Big Picture ', 5, '1.1.1.1.6', 15, 0),
('p_15_a_140', 11, 140, 'Definir el backbone ', 5, '1.1.1.1.7', 15, 0),
('p_15_a_141', 12, 141, 'Definir el walking skeleton ', 5, '1.1.1.1.8', 15, 0),
('p_15_a_1410', 45, 1410, 'Realizar pruebas de aplicación ', 5, '1.1.1.4.4', 15, 0),
('p_15_a_1411', 46, 1411, 'Realizar pruebas de integración ', 5, '1.1.1.4.5', 15, 0),
('p_15_a_142', 7, 142, 'Formalizar las historias de usuario ', 5, '1.1.1.1.3', 15, 0),
('p_15_a_143', 6, 143, 'Efectuar reunión con un grupo de usuarios finales ', 5, '1.1.1.1.2', 15, 0),
('p_15_a_144', 18, 144, 'Aceptar las tarjetas crc ', 5, '1.1.1.2.3', 15, 0),
('p_15_a_145', 19, 145, 'Describir las capas del sistema ', 5, '1.1.1.2.4', 15, 0),
('p_15_a_146', 20, 146, 'Definir la vista estructural ', 5, '1.1.1.2.5', 15, 0),
('p_15_a_1467', 100, 1467, 'PAQ 3.1: Planificación ', 4, '1.1.3.1', 15, 0),
('p_15_a_1468', 101, 1468, 'Efectuar reunión con el patrocinador ', 5, '1.1.3.1.1', 15, 0),
('p_15_a_1469', 102, 1469, 'Efectuar reunión con un grupo de usuarios finales ', 5, '1.1.3.1.2', 15, 0),
('p_15_a_1470', 103, 1470, 'Formalizar las historias de usuario ', 5, '1.1.3.1.3', 15, 0),
('p_15_a_1471', 104, 1471, 'Realizar entrega formal de historias de usuario ', 5, '1.1.3.1.4', 15, 0),
('p_15_a_1472', 105, 1472, 'relacionar las historias de usuario ', 5, '1.1.3.1.5', 15, 0),
('p_15_a_1473', 106, 1473, 'Mapear el Big Picture ', 5, '1.1.3.1.6', 15, 0),
('p_15_a_1474', 107, 1474, 'Definir el backbone ', 5, '1.1.3.1.7', 15, 0),
('p_15_a_1475', 108, 1475, 'Definir el walking skeleton ', 5, '1.1.3.1.8', 15, 0),
('p_15_a_1476', 109, 1476, 'Formalizar el mapa de historias de usuario ', 5, '1.1.3.1.9', 15, 0),
('p_15_a_1477', 110, 1477, 'Formalizar el plan de entrega ', 5, '1.1.3.1.10', 15, 0),
('p_15_a_1478', 111, 1478, 'PAQ 3.2: Diseño ', 4, '1.1.3.2', 15, 0),
('p_15_a_1479', 112, 1479, 'Definir las tarjetas CRC ', 5, '1.1.3.2.1', 15, 0),
('p_15_a_148', 22, 148, 'Desarrollar la vista de implementación ', 5, '1.1.1.2.7', 15, 0),
('p_15_a_1480', 113, 1480, 'Relacionar tarjetas ', 5, '1.1.3.2.2', 15, 0),
('p_15_a_1481', 114, 1481, 'Aceptar las tarjetas crc ', 5, '1.1.3.2.3', 15, 0),
('p_15_a_1482', 115, 1482, 'Describir las capas del sistema ', 5, '1.1.3.2.4', 15, 0),
('p_15_a_1483', 116, 1483, 'Definir la vista estructural ', 5, '1.1.3.2.5', 15, 0),
('p_15_a_1484', 117, 1484, 'Diseñar el modelo de despliegue ', 5, '1.1.3.2.6', 15, 0),
('p_15_a_1485', 118, 1485, 'Desarrollar la vista de implementación ', 5, '1.1.3.2.7', 15, 0),
('p_15_a_1486', 119, 1486, 'Definir la arquitectura ', 5, '1.1.3.2.8', 15, 0);
INSERT INTO `actividad` (`actividad_id`, `actividad_orden`, `actividad_uuid`, `actividad_nombre`, `actividad_level`, `actividad_wbs`, `proyecto_id`, `proyecto_linea_base`) VALUES
('p_15_a_1487', 120, 1487, 'Realizar el modelo conceptual de los datos ', 5, '1.1.3.2.9', 15, 0),
('p_15_a_1488', 121, 1488, 'Realizar el modelo entidad relación ', 5, '1.1.3.2.10', 15, 0),
('p_15_a_1489', 122, 1489, 'Aceptar el modelo de datos ', 5, '1.1.3.2.11', 15, 0),
('p_15_a_149', 17, 149, 'Relacionar tarjetas ', 5, '1.1.1.2.2', 15, 0),
('p_15_a_1490', 123, 1490, 'Modelar los mockups de las interfaces de usuario ', 5, '1.1.3.2.12', 15, 0),
('p_15_a_1491', 124, 1491, 'Construir el glosario de términos ', 5, '1.1.3.2.13', 15, 0),
('p_15_a_1492', 125, 1492, 'Aceptar el glosario de términos ', 5, '1.1.3.2.14', 15, 0),
('p_15_a_1493', 126, 1493, 'Aceptar los mockups de las interfaces de usuario ', 5, '1.1.3.2.15', 15, 0),
('p_15_a_1494', 127, 1494, 'PAQ 3.3: Codificación ', 4, '1.1.3.3', 15, 0),
('p_15_a_1495', 128, 1495, 'Desarrollar las interfaces de usuario ', 5, '1.1.3.3.1', 15, 0),
('p_15_a_1496', 129, 1496, 'Aceptar las interfaces de usuario ', 5, '1.1.3.3.2', 15, 0),
('p_15_a_1497', 130, 1497, 'Desarrollar requerimientos funcionales del rol estudiante ', 5, '1.1.3.3.3', 15, 0),
('p_15_a_1498', 131, 1498, 'Desarrollar requerimientos funcionales del rol docente ', 5, '1.1.3.3.4', 15, 0),
('p_15_a_1499', 132, 1499, 'Desarrollar requerimientos funcionales del rol padre de familia ', 5, '1.1.3.3.5', 15, 0),
('p_15_a_150', 16, 150, 'Definir las tarjetas CRC ', 5, '1.1.1.2.1', 15, 0),
('p_15_a_1500', 133, 1500, 'Desarrollar requerimientos funcionales del rol coordinador ', 5, '1.1.3.3.6', 15, 0),
('p_15_a_1502', 134, 1502, 'Aceptar los requerimientos funcionales ', 5, '1.1.3.3.7', 15, 0),
('p_15_a_1503', 135, 1503, 'Integrar el módulo al repositorio central ', 5, '1.1.3.3.8', 15, 0),
('p_15_a_1504', 136, 1504, 'PAQ 3.4: Pruebas ', 4, '1.1.3.4', 15, 0),
('p_15_a_155', 28, 155, 'Construir el glosario de términos ', 5, '1.1.1.2.13', 15, 0),
('p_15_a_1555', 53, 1555, 'PAQ 2.1: Planificación ', 4, '1.1.2.1', 15, 0),
('p_15_a_1556', 54, 1556, 'Efectuar reunión con el patrocinador ', 5, '1.1.2.1.1', 15, 0),
('p_15_a_1557', 55, 1557, 'Efectuar reunión con un grupo de usuarios finales ', 5, '1.1.2.1.2', 15, 0),
('p_15_a_1558', 56, 1558, 'Formalizar las historias de usuario ', 5, '1.1.2.1.3', 15, 0),
('p_15_a_1559', 57, 1559, 'Realizar entrega formal de historias de usuario ', 5, '1.1.2.1.4', 15, 0),
('p_15_a_1560', 58, 1560, 'relacionar las historias de usuario ', 5, '1.1.2.1.5', 15, 0),
('p_15_a_1561', 59, 1561, 'Mapear el Big Picture ', 5, '1.1.2.1.6', 15, 0),
('p_15_a_1562', 60, 1562, 'Definir el backbone ', 5, '1.1.2.1.7', 15, 0),
('p_15_a_1563', 61, 1563, 'Definir el walking skeleton ', 5, '1.1.2.1.8', 15, 0),
('p_15_a_1564', 62, 1564, 'Formalizar el mapa de historias de usuario ', 5, '1.1.2.1.9', 15, 0),
('p_15_a_1565', 63, 1565, 'Formalizar el plan de entrega ', 5, '1.1.2.1.10', 15, 0),
('p_15_a_1566', 64, 1566, 'PAQ 2.2: Diseño ', 4, '1.1.2.2', 15, 0),
('p_15_a_1567', 65, 1567, 'Definir las tarjetas CRC ', 5, '1.1.2.2.1', 15, 0),
('p_15_a_1568', 66, 1568, 'Relacionar tarjetas ', 5, '1.1.2.2.2', 15, 0),
('p_15_a_1569', 67, 1569, 'Aceptar las tarjetas crc ', 5, '1.1.2.2.3', 15, 0),
('p_15_a_157', 39, 157, 'Aceptar los requerimientos funcionales ', 5, '1.1.1.3.8', 15, 0),
('p_15_a_1570', 68, 1570, 'Describir las capas del sistema ', 5, '1.1.2.2.4', 15, 0),
('p_15_a_1571', 69, 1571, 'Definir la vista estructural ', 5, '1.1.2.2.5', 15, 0),
('p_15_a_1572', 70, 1572, 'Diseñar el modelo de despliegue ', 5, '1.1.2.2.6', 15, 0),
('p_15_a_1573', 71, 1573, 'Desarrollar la vista de implementación ', 5, '1.1.2.2.7', 15, 0),
('p_15_a_1574', 72, 1574, 'Definir la arquitectura ', 5, '1.1.2.2.8', 15, 0),
('p_15_a_1575', 73, 1575, 'Realizar el modelo conceptual de los datos ', 5, '1.1.2.2.9', 15, 0),
('p_15_a_1576', 74, 1576, 'Realizar el modelo entidad relación ', 5, '1.1.2.2.10', 15, 0),
('p_15_a_1577', 75, 1577, 'Aceptar el modelo de datos ', 5, '1.1.2.2.11', 15, 0),
('p_15_a_1578', 76, 1578, 'Modelar los mockups de las interfaces de usuario ', 5, '1.1.2.2.12', 15, 0),
('p_15_a_1579', 77, 1579, 'Construir el glosario de términos ', 5, '1.1.2.2.13', 15, 0),
('p_15_a_1580', 78, 1580, 'Aceptar el glosario de términos ', 5, '1.1.2.2.14', 15, 0),
('p_15_a_1581', 79, 1581, 'Aceptar los mockups de las interfaces de usuario ', 5, '1.1.2.2.15', 15, 0),
('p_15_a_1582', 80, 1582, 'PAQ 2.3: Codificación ', 4, '1.1.2.3', 15, 0),
('p_15_a_1583', 81, 1583, 'Desarrollar las interfaces de usuario ', 5, '1.1.2.3.1', 15, 0),
('p_15_a_1584', 82, 1584, 'Aceptar las interfaces de usuario ', 5, '1.1.2.3.2', 15, 0),
('p_15_a_1585', 83, 1585, 'Desarrollar requerimientos funcionales del rol estudiante ', 5, '1.1.2.3.3', 15, 0),
('p_15_a_1586', 84, 1586, 'Desarrollar requerimientos funcionales del rol docente ', 5, '1.1.2.3.4', 15, 0),
('p_15_a_1587', 85, 1587, 'Desarrollar requerimientos funcionales del rol padre de familia ', 5, '1.1.2.3.5', 15, 0),
('p_15_a_159', 33, 159, 'Aceptar las interfaces de usuario ', 5, '1.1.1.3.2', 15, 0),
('p_15_a_1590', 86, 1590, 'Aceptar los requerimientos funcionales ', 5, '1.1.2.3.6', 15, 0),
('p_15_a_1591', 87, 1591, 'Integrar el módulo al repositorio central ', 5, '1.1.2.3.7', 15, 0),
('p_15_a_1592', 88, 1592, 'PAQ 2.4: Pruebas ', 4, '1.1.2.4', 15, 0),
('p_15_a_1599', 148, 1599, 'PAQ 4.1: Planificación ', 4, '1.1.4.1', 15, 0),
('p_15_a_1600', 149, 1600, 'Efectuar reunión con el patrocinador ', 5, '1.1.4.1.1', 15, 0),
('p_15_a_1601', 150, 1601, 'Efectuar reunión con un grupo de usuarios finales ', 5, '1.1.4.1.2', 15, 0),
('p_15_a_1602', 151, 1602, 'Formalizar las historias de usuario ', 5, '1.1.4.1.3', 15, 0),
('p_15_a_1603', 152, 1603, 'Realizar entrega formal de historias de usuario ', 5, '1.1.4.1.4', 15, 0),
('p_15_a_1604', 153, 1604, 'relacionar las historias de usuario ', 5, '1.1.4.1.5', 15, 0),
('p_15_a_1605', 154, 1605, 'Mapear el Big Picture ', 5, '1.1.4.1.6', 15, 0),
('p_15_a_1606', 155, 1606, 'Definir el backbone ', 5, '1.1.4.1.7', 15, 0),
('p_15_a_1607', 156, 1607, 'Definir el walking skeleton ', 5, '1.1.4.1.8', 15, 0),
('p_15_a_1608', 157, 1608, 'Formalizar el mapa de historias de usuario ', 5, '1.1.4.1.9', 15, 0),
('p_15_a_1609', 158, 1609, 'Formalizar el plan de entrega ', 5, '1.1.4.1.10', 15, 0),
('p_15_a_1610', 159, 1610, 'PAQ 4.2: Diseño ', 4, '1.1.4.2', 15, 0),
('p_15_a_1611', 160, 1611, 'Definir las tarjetas CRC ', 5, '1.1.4.2.1', 15, 0),
('p_15_a_1612', 161, 1612, 'Relacionar tarjetas ', 5, '1.1.4.2.2', 15, 0),
('p_15_a_1613', 162, 1613, 'Aceptar las tarjetas crc ', 5, '1.1.4.2.3', 15, 0),
('p_15_a_1614', 163, 1614, 'Describir las capas del sistema ', 5, '1.1.4.2.4', 15, 0),
('p_15_a_1615', 164, 1615, 'Definir la vista estructural ', 5, '1.1.4.2.5', 15, 0),
('p_15_a_1616', 165, 1616, 'Diseñar el modelo de despliegue ', 5, '1.1.4.2.6', 15, 0),
('p_15_a_1617', 166, 1617, 'Desarrollar la vista de implementación ', 5, '1.1.4.2.7', 15, 0),
('p_15_a_1618', 167, 1618, 'Definir la arquitectura ', 5, '1.1.4.2.8', 15, 0),
('p_15_a_1619', 168, 1619, 'Realizar el modelo conceptual de los datos ', 5, '1.1.4.2.9', 15, 0),
('p_15_a_1620', 169, 1620, 'Realizar el modelo entidad relación ', 5, '1.1.4.2.10', 15, 0),
('p_15_a_1621', 170, 1621, 'Aceptar el modelo de datos ', 5, '1.1.4.2.11', 15, 0),
('p_15_a_1622', 171, 1622, 'Modelar los mockups de las interfaces de usuario ', 5, '1.1.4.2.12', 15, 0),
('p_15_a_1623', 172, 1623, 'Construir el glosario de términos ', 5, '1.1.4.2.13', 15, 0),
('p_15_a_1624', 173, 1624, 'Aceptar el glosario de términos ', 5, '1.1.4.2.14', 15, 0),
('p_15_a_1625', 174, 1625, 'Aceptar los mockups de las interfaces de usuario ', 5, '1.1.4.2.15', 15, 0),
('p_15_a_1626', 175, 1626, 'PAQ 4.3: Codificación ', 4, '1.1.4.3', 15, 0),
('p_15_a_1627', 176, 1627, 'Desarrollar las interfaces de usuario ', 5, '1.1.4.3.1', 15, 0),
('p_15_a_1628', 177, 1628, 'Aceptar las interfaces de usuario ', 5, '1.1.4.3.2', 15, 0),
('p_15_a_1629', 178, 1629, 'Desarrollar requerimientos funcionales del rol estudiante ', 5, '1.1.4.3.3', 15, 0),
('p_15_a_1630', 179, 1630, 'Desarrollar requerimientos funcionales del rol docente ', 5, '1.1.4.3.4', 15, 0),
('p_15_a_1631', 180, 1631, 'Desarrollar requerimientos funcionales del rol padre de familia ', 5, '1.1.4.3.5', 15, 0),
('p_15_a_1632', 181, 1632, 'Desarrollar requerimientos funcionales del rol coordinador ', 5, '1.1.4.3.6', 15, 0),
('p_15_a_1633', 182, 1633, 'Desarrollar requerimientos funcionales del rol administrador ', 5, '1.1.4.3.7', 15, 0),
('p_15_a_1634', 183, 1634, 'Aceptar los requerimientos funcionales ', 5, '1.1.4.3.8', 15, 0),
('p_15_a_1635', 184, 1635, 'Integrar el módulo al repositorio central ', 5, '1.1.4.3.9', 15, 0),
('p_15_a_1636', 185, 1636, 'PAQ 4.4: Pruebas ', 4, '1.1.4.4', 15, 0),
('p_15_a_1643', 242, 1643, 'PAQ 2.1: Planificación ', 4, '1.2.2.1', 15, 0),
('p_15_a_1644', 243, 1644, 'Desarrollar el material multimedia para la capacitación ', 5, '1.2.2.1.1', 15, 0),
('p_15_a_1645', 244, 1645, 'Definir logística de la capacitación ', 5, '1.2.2.1.2', 15, 0),
('p_15_a_1647', 245, 1647, 'Publicar la convocatoria ', 5, '1.2.2.1.3', 15, 0),
('p_15_a_1648', 246, 1648, 'Aceptar la documentación por parte de la secretaria de educación ', 5, '1.2.2.1.4', 15, 0),
('p_15_a_1649', 247, 1649, 'Adquirir encuestas de satisfacción, registro de asistencia y registro de correcciones y mejoras ', 5, '1.2.2.1.5', 15, 0),
('p_15_a_1650', 248, 1650, 'Adquirir kit de capacitación, y volantes de publicidad ', 5, '1.2.2.1.6', 15, 0),
('p_15_a_1651', 249, 1651, 'Aceptar el material trabajo  ', 5, '1.2.2.1.7', 15, 0),
('p_15_a_1652', 250, 1652, 'PAQ 2.2: Desarrollo ', 4, '1.2.2.2', 15, 0),
('p_15_a_1653', 251, 1653, 'Realizar las capacitaciones ', 5, '1.2.2.2.1', 15, 0),
('p_15_a_1654', 252, 1654, 'Aplicar cuestionario ', 5, '1.2.2.2.2', 15, 0),
('p_15_a_1655', 253, 1655, 'Registrar asistencia ', 5, '1.2.2.2.3', 15, 0),
('p_15_a_1656', 254, 1656, 'Capturar evidencias ', 5, '1.2.2.2.4', 15, 0),
('p_15_a_1657', 255, 1657, 'Capturar correcciones y mejoras ', 5, '1.2.2.2.5', 15, 0),
('p_15_a_1658', 256, 1658, 'Finalizar capacitación ', 5, '1.2.2.2.6', 15, 0),
('p_15_a_1659', 257, 1659, 'PAQ 2.3: Evaluación ', 4, '1.2.2.3', 15, 0),
('p_15_a_1660', 258, 1660, 'Analizar resultados de los cuestionarios ', 5, '1.2.2.3.1', 15, 0),
('p_15_a_1661', 259, 1661, 'Documentar la capacitación ', 5, '1.2.2.3.2', 15, 0),
('p_15_a_1662', 260, 1662, 'Documentar las correcciones y mejoras ', 5, '1.2.2.3.3', 15, 0),
('p_15_a_1663', 261, 1663, 'Publicar resultados de las capacitaciones ', 5, '1.2.2.3.4', 15, 0),
('p_15_a_1664', 262, 1664, 'Publicar las evidencias ', 5, '1.2.2.3.5', 15, 0),
('p_15_a_1665', 263, 1665, 'Publicar contenido de las capacitaciones ', 5, '1.2.2.3.6', 15, 0),
('p_15_a_1666', 264, 1666, 'Entregar resultados ', 5, '1.2.2.3.7', 15, 0),
('p_15_a_1667', 267, 1667, 'PAQ 3.1: Planificación ', 4, '1.2.3.1', 15, 0),
('p_15_a_1668', 268, 1668, 'Desarrollar el material multimedia para la capacitación ', 5, '1.2.3.1.1', 15, 0),
('p_15_a_1669', 269, 1669, 'Definir logística de la capacitación ', 5, '1.2.3.1.2', 15, 0),
('p_15_a_1670', 270, 1670, 'Publicar la convocatoria ', 5, '1.2.3.1.3', 15, 0),
('p_15_a_1671', 271, 1671, 'Aceptar la documentación por parte de la secretaria de educación ', 5, '1.2.3.1.4', 15, 0),
('p_15_a_1672', 272, 1672, 'Adquirir encuestas de satisfacción, registro de asistencia y registro de correcciones y mejoras ', 5, '1.2.3.1.5', 15, 0),
('p_15_a_1673', 273, 1673, 'Adquirir kit de capacitación, y volantes de publicidad ', 5, '1.2.3.1.6', 15, 0),
('p_15_a_1674', 274, 1674, 'Aceptar el material trabajo  ', 5, '1.2.3.1.7', 15, 0),
('p_15_a_1675', 275, 1675, 'PAQ 3.2: Desarrollo ', 4, '1.2.3.2', 15, 0),
('p_15_a_1676', 276, 1676, 'Realizar las capacitaciones ', 5, '1.2.3.2.1', 15, 0),
('p_15_a_1677', 277, 1677, 'Aplicar cuestionario ', 5, '1.2.3.2.2', 15, 0),
('p_15_a_1678', 278, 1678, 'Registrar asistencia ', 5, '1.2.3.2.3', 15, 0),
('p_15_a_1679', 279, 1679, 'Capturar evidencias ', 5, '1.2.3.2.4', 15, 0),
('p_15_a_1680', 280, 1680, 'Capturar correcciones y mejoras ', 5, '1.2.3.2.5', 15, 0),
('p_15_a_1681', 281, 1681, 'Finalizar capacitación ', 5, '1.2.3.2.6', 15, 0),
('p_15_a_1682', 282, 1682, 'PAQ 3.3: Evaluación ', 4, '1.2.3.3', 15, 0),
('p_15_a_1683', 283, 1683, 'Analizar resultados de los cuestionarios ', 5, '1.2.3.3.1', 15, 0),
('p_15_a_1684', 284, 1684, 'Documentar la capacitación ', 5, '1.2.3.3.2', 15, 0),
('p_15_a_1685', 285, 1685, 'Documentar las correcciones y mejoras ', 5, '1.2.3.3.3', 15, 0),
('p_15_a_1686', 286, 1686, 'Publicar resultados de las capacitaciones ', 5, '1.2.3.3.4', 15, 0),
('p_15_a_1687', 287, 1687, 'Publicar las evidencias ', 5, '1.2.3.3.5', 15, 0),
('p_15_a_1688', 288, 1688, 'Publicar contenido de las capacitaciones ', 5, '1.2.3.3.6', 15, 0),
('p_15_a_1689', 289, 1689, 'Entregar resultados ', 5, '1.2.3.3.7', 15, 0),
('p_15_a_1690', 292, 1690, 'PAQ 4.1: Planificación ', 4, '1.2.4.1', 15, 0),
('p_15_a_1691', 293, 1691, 'Desarrollar el material multimedia para la capacitación ', 5, '1.2.4.1.1', 15, 0),
('p_15_a_1692', 294, 1692, 'Definir logística de la capacitación ', 5, '1.2.4.1.2', 15, 0),
('p_15_a_1693', 295, 1693, 'Publicar la convocatoria ', 5, '1.2.4.1.3', 15, 0),
('p_15_a_1694', 296, 1694, 'Aceptar la documentación por parte de la secretaria de educación ', 5, '1.2.4.1.4', 15, 0),
('p_15_a_1695', 297, 1695, 'Adquirir encuestas de satisfacción, registro de asistencia y registro de correcciones y mejoras ', 5, '1.2.4.1.5', 15, 0),
('p_15_a_1696', 298, 1696, 'Adquirir kit de capacitación, y volantes de publicidad ', 5, '1.2.4.1.6', 15, 0),
('p_15_a_1697', 299, 1697, 'Aceptar el material trabajo ', 5, '1.2.4.1.7', 15, 0),
('p_15_a_1698', 300, 1698, 'PAQ 4.2: Desarrollo ', 4, '1.2.4.2', 15, 0),
('p_15_a_1699', 301, 1699, 'Realizar las capacitaciones ', 5, '1.2.4.2.1', 15, 0),
('p_15_a_1700', 302, 1700, 'Aplicar cuestionario ', 5, '1.2.4.2.2', 15, 0),
('p_15_a_1701', 303, 1701, 'Registrar asistencia ', 5, '1.2.4.2.3', 15, 0),
('p_15_a_1702', 304, 1702, 'Capturar evidencias ', 5, '1.2.4.2.4', 15, 0),
('p_15_a_1703', 305, 1703, 'Capturar correcciones y mejoras ', 5, '1.2.4.2.5', 15, 0),
('p_15_a_1704', 306, 1704, 'Finalizar capacitación ', 5, '1.2.4.2.6', 15, 0),
('p_15_a_1705', 307, 1705, 'PAQ 4.3: Evaluación ', 4, '1.2.4.3', 15, 0),
('p_15_a_1706', 308, 1706, 'Analizar resultados de los cuestionarios ', 5, '1.2.4.3.1', 15, 0),
('p_15_a_1707', 309, 1707, 'Documentar la capacitación ', 5, '1.2.4.3.2', 15, 0),
('p_15_a_1708', 310, 1708, 'Documentar las correcciones y mejoras ', 5, '1.2.4.3.3', 15, 0),
('p_15_a_1709', 311, 1709, 'Publicar resultados de las capacitaciones ', 5, '1.2.4.3.4', 15, 0),
('p_15_a_1710', 312, 1710, 'Publicar las evidencias ', 5, '1.2.4.3.5', 15, 0),
('p_15_a_1711', 313, 1711, 'Publicar contenido de las capacitaciones ', 5, '1.2.4.3.6', 15, 0),
('p_15_a_1712', 314, 1712, 'Entregar resultados ', 5, '1.2.4.3.7', 15, 0),
('p_15_a_1713', 400, 1713, 'E4: Capacitación a 4300 estudiantes ', 2, '1.4', 15, 0),
('p_15_a_1714', 401, 1714, 'SE 4.1: Capacitación a 1075 estudiantes ', 3, '1.4.1', 15, 0),
('p_15_a_1715', 402, 1715, 'PAQ 1.1: Planificación ', 4, '1.4.1.1', 15, 0),
('p_15_a_1716', 403, 1716, 'Desarrollar el material multimedia para la capacitación ', 5, '1.4.1.1.1', 15, 0),
('p_15_a_1717', 404, 1717, 'Definir logística de la capacitación ', 5, '1.4.1.1.2', 15, 0),
('p_15_a_1718', 405, 1718, 'Definir encuesta de satisfacción, registro de asistencia y registro de correcciones y mejoras ', 5, '1.4.1.1.3', 15, 0),
('p_15_a_1719', 406, 1719, 'Publicar la convocatoria ', 5, '1.4.1.1.4', 15, 0),
('p_15_a_1720', 407, 1720, 'Aceptar la documentación por parte de la secretaria de educación ', 5, '1.4.1.1.5', 15, 0),
('p_15_a_1721', 408, 1721, 'Adquirir encuestas de satisfacción, registro de asistencia y registro de correcciones y mejoras ', 5, '1.4.1.1.6', 15, 0),
('p_15_a_1722', 409, 1722, 'Adquirir kit de capacitación, pendones y volantes de publicidad ', 5, '1.4.1.1.7', 15, 0),
('p_15_a_1723', 410, 1723, 'Aceptar el material trabajo  ', 5, '1.4.1.1.8', 15, 0),
('p_15_a_1724', 411, 1724, 'PAQ 1.2: Desarrollo ', 4, '1.4.1.2', 15, 0),
('p_15_a_1725', 412, 1725, 'Realizar las capacitaciones ', 5, '1.4.1.2.1', 15, 0),
('p_15_a_1726', 413, 1726, 'Aplicar cuestionario ', 5, '1.4.1.2.2', 15, 0),
('p_15_a_1727', 414, 1727, 'Registrar asistencia ', 5, '1.4.1.2.3', 15, 0),
('p_15_a_1728', 415, 1728, 'Capturar evidencias ', 5, '1.4.1.2.4', 15, 0),
('p_15_a_1729', 416, 1729, 'Capturar correcciones y mejoras ', 5, '1.4.1.2.5', 15, 0),
('p_15_a_1730', 417, 1730, 'Finalizar capacitación ', 5, '1.4.1.2.6', 15, 0),
('p_15_a_1731', 418, 1731, 'PAQ 1.3: Evaluación ', 4, '1.4.1.3', 15, 0),
('p_15_a_1732', 419, 1732, 'Analizar resultados de los cuestionarios ', 5, '1.4.1.3.1', 15, 0),
('p_15_a_1733', 420, 1733, 'Documentar la capacitación ', 5, '1.4.1.3.2', 15, 0),
('p_15_a_1734', 421, 1734, 'Documentar las correcciones y mejoras ', 5, '1.4.1.3.3', 15, 0),
('p_15_a_1735', 422, 1735, 'Publicar resultados de las capacitaciones ', 5, '1.4.1.3.4', 15, 0),
('p_15_a_1736', 423, 1736, 'Publicar las evidencias ', 5, '1.4.1.3.5', 15, 0),
('p_15_a_1737', 424, 1737, 'Publicar contenido de las capacitaciones ', 5, '1.4.1.3.6', 15, 0),
('p_15_a_1738', 425, 1738, 'Entregar resultados ', 5, '1.4.1.3.7', 15, 0),
('p_15_a_1739', 427, 1739, 'SE 4.2: Capacitación a 1075 estudiantes ', 3, '1.4.2', 15, 0),
('p_15_a_1740', 428, 1740, 'PAQ 2.1: Planificación ', 4, '1.4.2.1', 15, 0),
('p_15_a_1741', 429, 1741, 'Desarrollar el material multimedia para la capacitación ', 5, '1.4.2.1.1', 15, 0),
('p_15_a_1742', 430, 1742, 'Definir logística de la capacitación ', 5, '1.4.2.1.2', 15, 0),
('p_15_a_1743', 431, 1743, 'Publicar la convocatoria ', 5, '1.4.2.1.3', 15, 0),
('p_15_a_1744', 432, 1744, 'Aceptar la documentación por parte de la secretaria de educación ', 5, '1.4.2.1.4', 15, 0),
('p_15_a_1745', 433, 1745, 'Adquirir encuestas de satisfacción, registro de asistencia y registro de correcciones y mejoras ', 5, '1.4.2.1.5', 15, 0),
('p_15_a_1746', 434, 1746, 'Adquirir kit de capacitación, y volantes de publicidad ', 5, '1.4.2.1.6', 15, 0),
('p_15_a_1747', 435, 1747, 'Aceptar el material trabajo ', 5, '1.4.2.1.7', 15, 0),
('p_15_a_1748', 436, 1748, 'PAQ 2.2: Desarrollo ', 4, '1.4.2.2', 15, 0),
('p_15_a_1749', 437, 1749, 'Realizar las capacitaciones ', 5, '1.4.2.2.1', 15, 0),
('p_15_a_1750', 438, 1750, 'Aplicar cuestionario ', 5, '1.4.2.2.2', 15, 0),
('p_15_a_1751', 439, 1751, 'Registrar asistencia ', 5, '1.4.2.2.3', 15, 0),
('p_15_a_1752', 440, 1752, 'Capturar evidencias ', 5, '1.4.2.2.4', 15, 0),
('p_15_a_1753', 441, 1753, 'Capturar correcciones y mejoras ', 5, '1.4.2.2.5', 15, 0),
('p_15_a_1754', 442, 1754, 'Finalizar capacitación ', 5, '1.4.2.2.6', 15, 0),
('p_15_a_1755', 443, 1755, 'PAQ 2.3: Evaluación ', 4, '1.4.2.3', 15, 0),
('p_15_a_1756', 444, 1756, 'Analizar resultados de los cuestionarios ', 5, '1.4.2.3.1', 15, 0),
('p_15_a_1757', 445, 1757, 'Documentar la capacitación ', 5, '1.4.2.3.2', 15, 0),
('p_15_a_1758', 446, 1758, 'Documentar las correcciones y mejoras ', 5, '1.4.2.3.3', 15, 0),
('p_15_a_1759', 447, 1759, 'Publicar resultados de las capacitaciones ', 5, '1.4.2.3.4', 15, 0),
('p_15_a_1760', 448, 1760, 'Publicar las evidencias ', 5, '1.4.2.3.5', 15, 0),
('p_15_a_1761', 449, 1761, 'Publicar contenido de las capacitaciones ', 5, '1.4.2.3.6', 15, 0),
('p_15_a_1762', 450, 1762, 'Entregar resultados ', 5, '1.4.2.3.7', 15, 0),
('p_15_a_1763', 452, 1763, 'SE 4.3: Capacitación a 1075 estudiantes ', 3, '1.4.3', 15, 0),
('p_15_a_1764', 453, 1764, 'PAQ 3.1: Planificación ', 4, '1.4.3.1', 15, 0),
('p_15_a_1765', 454, 1765, 'Desarrollar el material multimedia para la capacitación ', 5, '1.4.3.1.1', 15, 0),
('p_15_a_1766', 455, 1766, 'Definir logística de la capacitación ', 5, '1.4.3.1.2', 15, 0),
('p_15_a_1767', 456, 1767, 'Publicar la convocatoria ', 5, '1.4.3.1.3', 15, 0),
('p_15_a_1768', 457, 1768, 'Aceptar la documentación por parte de la secretaria de educación ', 5, '1.4.3.1.4', 15, 0),
('p_15_a_1769', 458, 1769, 'Adquirir encuestas de satisfacción, registro de asistencia y registro de correcciones y mejoras ', 5, '1.4.3.1.5', 15, 0),
('p_15_a_1770', 459, 1770, 'Adquirir kit de capacitación, y volantes de publicidad ', 5, '1.4.3.1.6', 15, 0),
('p_15_a_1771', 460, 1771, 'Aceptar el material trabajo  ', 5, '1.4.3.1.7', 15, 0),
('p_15_a_1772', 461, 1772, 'PAQ 3.2: Desarrollo ', 4, '1.4.3.2', 15, 0),
('p_15_a_1773', 462, 1773, 'Realizar las capacitaciones ', 5, '1.4.3.2.1', 15, 0),
('p_15_a_1774', 463, 1774, 'Aplicar cuestionario ', 5, '1.4.3.2.2', 15, 0),
('p_15_a_1775', 464, 1775, 'Registrar asistencia ', 5, '1.4.3.2.3', 15, 0),
('p_15_a_1776', 465, 1776, 'Capturar evidencias ', 5, '1.4.3.2.4', 15, 0),
('p_15_a_1777', 466, 1777, 'Capturar correcciones y mejoras ', 5, '1.4.3.2.5', 15, 0),
('p_15_a_1778', 467, 1778, 'Finalizar capacitación ', 5, '1.4.3.2.6', 15, 0),
('p_15_a_1779', 468, 1779, 'PAQ 3.3: Evaluación ', 4, '1.4.3.3', 15, 0),
('p_15_a_1780', 469, 1780, 'Analizar resultados de los cuestionarios ', 5, '1.4.3.3.1', 15, 0),
('p_15_a_1781', 470, 1781, 'Documentar la capacitación ', 5, '1.4.3.3.2', 15, 0),
('p_15_a_1782', 471, 1782, 'Documentar las correcciones y mejoras ', 5, '1.4.3.3.3', 15, 0),
('p_15_a_1783', 472, 1783, 'Publicar resultados de las capacitaciones ', 5, '1.4.3.3.4', 15, 0),
('p_15_a_1784', 473, 1784, 'Publicar las evidencias ', 5, '1.4.3.3.5', 15, 0),
('p_15_a_1785', 474, 1785, 'Publicar contenido de las capacitaciones ', 5, '1.4.3.3.6', 15, 0),
('p_15_a_1786', 475, 1786, 'Entregar resultados ', 5, '1.4.3.3.7', 15, 0),
('p_15_a_1787', 477, 1787, 'SE 4.4: Capacitación a 1075 estudiantes ', 3, '1.4.4', 15, 0),
('p_15_a_1788', 478, 1788, 'PAQ 4.1: Planificación ', 4, '1.4.4.1', 15, 0),
('p_15_a_1789', 479, 1789, 'Desarrollar el material multimedia para la capacitación ', 5, '1.4.4.1.1', 15, 0),
('p_15_a_1790', 480, 1790, 'Definir logística de la capacitación ', 5, '1.4.4.1.2', 15, 0),
('p_15_a_1791', 481, 1791, 'Publicar la convocatoria ', 5, '1.4.4.1.3', 15, 0),
('p_15_a_1792', 482, 1792, 'Aceptar la documentación por parte de la secretaria de educación ', 5, '1.4.4.1.4', 15, 0),
('p_15_a_1793', 483, 1793, 'Adquirir encuestas de satisfacción, registro de asistencia y registro de correcciones y mejoras ', 5, '1.4.4.1.5', 15, 0),
('p_15_a_1794', 484, 1794, 'Adquirir kit de capacitación, y volantes de publicidad ', 5, '1.4.4.1.6', 15, 0),
('p_15_a_1795', 485, 1795, 'Aceptar el material trabajo  ', 5, '1.4.4.1.7', 15, 0),
('p_15_a_1796', 486, 1796, 'PAQ 4.2: Desarrollo ', 4, '1.4.4.2', 15, 0),
('p_15_a_1797', 487, 1797, 'Realizar las capacitaciones ', 5, '1.4.4.2.1', 15, 0),
('p_15_a_1798', 488, 1798, 'Aplicar cuestionario ', 5, '1.4.4.2.2', 15, 0),
('p_15_a_1799', 489, 1799, 'Registrar asistencia ', 5, '1.4.4.2.3', 15, 0),
('p_15_a_1800', 490, 1800, 'Capturar evidencias ', 5, '1.4.4.2.4', 15, 0),
('p_15_a_1801', 491, 1801, 'Capturar correcciones y mejoras ', 5, '1.4.4.2.5', 15, 0),
('p_15_a_1802', 492, 1802, 'Finalizar capacitación ', 5, '1.4.4.2.6', 15, 0),
('p_15_a_1803', 493, 1803, 'PAQ 4.3: Evaluación ', 4, '1.4.4.3', 15, 0),
('p_15_a_1804', 494, 1804, 'Analizar resultados de los cuestionarios ', 5, '1.4.4.3.1', 15, 0),
('p_15_a_1805', 495, 1805, 'Documentar la capacitación ', 5, '1.4.4.3.2', 15, 0),
('p_15_a_1806', 496, 1806, 'Documentar las correcciones y mejoras ', 5, '1.4.4.3.3', 15, 0),
('p_15_a_1807', 497, 1807, 'Publicar resultados de las capacitaciones ', 5, '1.4.4.3.4', 15, 0),
('p_15_a_1808', 498, 1808, 'Publicar las evidencias ', 5, '1.4.4.3.5', 15, 0),
('p_15_a_1809', 499, 1809, 'Publicar contenido de las capacitaciones ', 5, '1.4.4.3.6', 15, 0),
('p_15_a_1810', 500, 1810, 'Entregar resultados ', 5, '1.4.4.3.7', 15, 0),
('p_15_a_1811', 502, 1811, 'SE 4.5: Correcciones y mejoras ', 3, '1.4.5', 15, 0),
('p_15_a_1812', 503, 1812, 'PAQ 5.1: Planificación ', 4, '1.4.5.1', 15, 0),
('p_15_a_1813', 504, 1813, 'Identificar las historias de usuario defectuosas ', 5, '1.4.5.1.1', 15, 0),
('p_15_a_1814', 505, 1814, 'Corregir las historias de usuario defectuosas ', 5, '1.4.5.1.2', 15, 0),
('p_15_a_1815', 506, 1815, 'Formalizar las historias de usuario ', 5, '1.4.5.1.3', 15, 0),
('p_15_a_1816', 507, 1816, 'relacionar las historias de usuario ', 5, '1.4.5.1.4', 15, 0),
('p_15_a_1817', 508, 1817, 'Formalizar el mapa de historias de usuario ', 5, '1.4.5.1.5', 15, 0),
('p_15_a_1818', 509, 1818, 'PAQ 5.2: Implementación ', 4, '1.4.5.2', 15, 0),
('p_15_a_1819', 510, 1819, 'Corregir las interfaces de usuario ', 5, '1.4.5.2.1', 15, 0),
('p_15_a_1820', 511, 1820, 'Aplicar reingeniería al código fuente ', 5, '1.4.5.2.2', 15, 0),
('p_15_a_1821', 512, 1821, 'Unir las características del modulo ', 5, '1.4.5.2.3', 15, 0),
('p_15_a_1822', 513, 1822, 'Integrar el módulo al repositorio central ', 5, '1.4.5.2.4', 15, 0),
('p_15_a_1823', 514, 1823, 'Actualizar el documento de lecciones aprendidas ', 5, '1.4.5.2.5', 15, 0),
('p_15_a_1824', 359, 1824, 'SE 3.2: Capacitación a 650 docentes ', 3, '1.3.2', 15, 0),
('p_15_a_1825', 360, 1825, 'PAQ 1.1: Planificación ', 4, '1.3.2.1', 15, 0),
('p_15_a_1826', 361, 1826, 'Desarrollar el material multimedia para la capacitación ', 5, '1.3.2.1.1', 15, 0),
('p_15_a_1827', 362, 1827, 'Definir logística de la capacitación ', 5, '1.3.2.1.2', 15, 0),
('p_15_a_1829', 363, 1829, 'Publicar la convocatoria ', 5, '1.3.2.1.3', 15, 0),
('p_15_a_1830', 364, 1830, 'Aceptar la documentación por parte de la secretaria de educación ', 5, '1.3.2.1.4', 15, 0),
('p_15_a_1831', 365, 1831, 'Adquirir encuestas de satisfacción, registro de asistencia y registro de correcciones y mejoras ', 5, '1.3.2.1.5', 15, 0),
('p_15_a_1832', 366, 1832, 'Adquirir kit de capacitación, y volantes de publicidad ', 5, '1.3.2.1.6', 15, 0),
('p_15_a_1833', 367, 1833, 'Adquirir refrigerio docentes ', 5, '1.3.2.1.7', 15, 0),
('p_15_a_1834', 368, 1834, 'Aceptar el material trabajo  ', 5, '1.3.2.1.8', 15, 0),
('p_15_a_1835', 369, 1835, 'PAQ 1.2: Desarrollo ', 4, '1.3.2.2', 15, 0),
('p_15_a_1836', 370, 1836, 'Realizar las capacitaciones ', 5, '1.3.2.2.1', 15, 0),
('p_15_a_1837', 371, 1837, 'Aplicar cuestionario ', 5, '1.3.2.2.2', 15, 0),
('p_15_a_1838', 372, 1838, 'Registrar asistencia ', 5, '1.3.2.2.3', 15, 0),
('p_15_a_1839', 373, 1839, 'Capturar evidencias ', 5, '1.3.2.2.4', 15, 0),
('p_15_a_1840', 374, 1840, 'Capturar correcciones y mejoras ', 5, '1.3.2.2.5', 15, 0),
('p_15_a_1841', 375, 1841, 'Finalizar capacitación ', 5, '1.3.2.2.6', 15, 0),
('p_15_a_1842', 376, 1842, 'PAQ 1.3: Evaluación ', 4, '1.3.2.3', 15, 0),
('p_15_a_1843', 377, 1843, 'Analizar resultados de los cuestionarios ', 5, '1.3.2.3.1', 15, 0),
('p_15_a_1844', 378, 1844, 'Documentar la capacitación ', 5, '1.3.2.3.2', 15, 0),
('p_15_a_1845', 379, 1845, 'Documentar las correcciones y mejoras ', 5, '1.3.2.3.3', 15, 0),
('p_15_a_1846', 380, 1846, 'Publicar resultados de las capacitaciones ', 5, '1.3.2.3.4', 15, 0),
('p_15_a_1847', 381, 1847, 'Publicar las evidencias ', 5, '1.3.2.3.5', 15, 0),
('p_15_a_1848', 382, 1848, 'Publicar contenido de las capacitaciones ', 5, '1.3.2.3.6', 15, 0),
('p_15_a_1849', 383, 1849, 'Entregar resultados ', 5, '1.3.2.3.7', 15, 0),
('p_15_a_1854', 47, 1854, 'Realizar reunión para la planeación de pruebas beta ', 5, '1.1.1.4.6', 15, 0),
('p_15_a_1855', 48, 1855, 'Realizar convocatoria de usuario finales para las pruebas beta ', 5, '1.1.1.4.7', 15, 0),
('p_15_a_1856', 49, 1856, 'Llevar a cabo las pruebas beta ', 5, '1.1.1.4.8', 15, 0),
('p_15_a_1858', 50, 1858, 'Aceptar pruebas de software ', 5, '1.1.1.4.9', 15, 0),
('p_15_a_1868', 89, 1868, 'Verificar historias de usuario ', 5, '1.1.2.4.1', 15, 0),
('p_15_a_1869', 90, 1869, 'Identificar los casos de pruebas unitarias ', 5, '1.1.2.4.2', 15, 0),
('p_15_a_1870', 91, 1870, 'Realizar las pruebas unitarias ', 5, '1.1.2.4.3', 15, 0),
('p_15_a_1871', 92, 1871, 'Realizar pruebas de aplicación ', 5, '1.1.2.4.4', 15, 0),
('p_15_a_1872', 93, 1872, 'Realizar pruebas de integración ', 5, '1.1.2.4.5', 15, 0),
('p_15_a_1873', 94, 1873, 'Realizar reunión para la planeación de pruebas beta ', 5, '1.1.2.4.6', 15, 0),
('p_15_a_1874', 95, 1874, 'Realizar convocatoria de usuario finales para las pruebas beta ', 5, '1.1.2.4.7', 15, 0),
('p_15_a_1875', 96, 1875, 'Llevar a cabo las pruebas beta ', 5, '1.1.2.4.8', 15, 0),
('p_15_a_1876', 97, 1876, 'Aceptar pruebas de software ', 5, '1.1.2.4.9', 15, 0),
('p_15_a_1896', 137, 1896, 'Verificar historias de usuario ', 5, '1.1.3.4.1', 15, 0),
('p_15_a_1897', 138, 1897, 'Identificar los casos de pruebas unitarias ', 5, '1.1.1.2', 15, 0),
('p_15_a_1898', 139, 1898, 'Realizar las pruebas unitarias ', 5, '1.1.3.4.3', 15, 0),
('p_15_a_1899', 140, 1899, 'Realizar pruebas de aplicación ', 5, '1.1.3.4.4', 15, 0),
('p_15_a_1900', 141, 1900, 'Realizar pruebas de integración ', 5, '1.1.3.4.5', 15, 0),
('p_15_a_1901', 142, 1901, 'Realizar reunión para la planeación de pruebas beta ', 5, '1.1.3.4.6', 15, 0),
('p_15_a_1902', 143, 1902, 'Realizar convocatoria de usuario finales para las pruebas beta ', 5, '1.1.3.4.7', 15, 0),
('p_15_a_1903', 144, 1903, 'Llevar a cabo las pruebas beta ', 5, '1.1.3.4.8', 15, 0),
('p_15_a_1904', 145, 1904, 'Aceptar pruebas de software ', 5, '1.1.3.4.9', 15, 0),
('p_15_a_1905', 186, 1905, 'Verificar historias de usuario ', 5, '1.1.4.4.1', 15, 0),
('p_15_a_1906', 187, 1906, 'Identificar los casos de pruebas unitarias ', 5, '1.1.4.4.2', 15, 0),
('p_15_a_1907', 188, 1907, 'Realizar las pruebas unitarias ', 5, '1.1.4.4.3', 15, 0),
('p_15_a_1908', 189, 1908, 'Realizar pruebas de aplicación ', 5, '1.1.4.4.4', 15, 0),
('p_15_a_1909', 190, 1909, 'Realizar pruebas de integración ', 5, '1.1.4.4.5', 15, 0),
('p_15_a_1910', 191, 1910, 'Realizar reunión para la planeación de pruebas beta ', 5, '1.1.4.4.6', 15, 0),
('p_15_a_1911', 192, 1911, 'Realizar convocatoria de usuario finales para las pruebas beta ', 5, '1.1.4.4.7', 15, 0),
('p_15_a_1912', 193, 1912, 'Llevar a cabo las pruebas beta ', 5, '1.1.4.4.8', 15, 0),
('p_15_a_1913', 194, 1913, 'Aceptar pruebas de software ', 5, '1.1.4.4.9', 15, 0),
('p_15_a_1915', 98, 1915, 'Aceptar módulo de trabajo, tareas y refuerzos ', 4, '1.1.2.5', 15, 0),
('p_15_a_1916', 51, 1916, 'Aceptar módulo de administración ', 4, '1.1.1.5', 15, 0),
('p_15_a_1917', 146, 1917, 'Aceptar módulo de trabajo, tareas y refuerzos ', 4, '1.1.3.5', 15, 0),
('p_15_a_1918', 195, 1918, 'Aceptar módulo de eventos y citas  ', 4, '1.1.4.5', 15, 0),
('p_15_a_1921', 212, 1921, 'Instalar aplicación  ', 4, '1.1.5.3', 15, 0),
('p_15_a_1922', 330, 1922, 'Capacitar a todos los padres de familia ', 3, '1.2.6', 15, 0),
('p_15_a_1923', 399, 1923, 'Capacitar a docentes ', 3, '1.3.4', 15, 0),
('p_15_a_1924', 516, 1924, 'Capacitar a estudiantes ', 3, '1.1.1.4', 15, 0),
('p_15_a_1925', 213, 1925, 'Entregar aplicación web ', 3, '1.1.6', 15, 0),
('p_15_a_1926', 240, 1926, 'Capacitar primer grupo de padres ', 4, '1.2.1.4', 15, 0),
('p_15_a_1927', 265, 1927, 'Capacitar segundo grupo de padres ', 4, '1.2.2.4', 15, 0),
('p_15_a_1928', 290, 1928, 'Capacitar tercer grupo de padres ', 4, '1.2.3.4', 15, 0),
('p_15_a_1929', 315, 1929, 'Capacitar cuarto grupo de padres ', 4, '1.2.4.4', 15, 0),
('p_15_a_1930', 329, 1930, 'Aplicar correcciones y mejoras de las capacitaciones de padres ', 4, '1.2.5.3', 15, 0),
('p_15_a_1931', 358, 1931, 'Capacitar primer grupo de docentes ', 4, '1.3.1.4', 15, 0),
('p_15_a_1932', 384, 1932, 'Capacitar segundo grupo de docentes ', 4, '1.3.2.4', 15, 0),
('p_15_a_1933', 398, 1933, 'Aplicar correcciones y mejoras de las capacitaciones docente ', 4, '1.3.3.3', 15, 0),
('p_15_a_1934', 426, 1934, 'Capacitar primer grupo de estudiantes ', 4, '1.4.1.4', 15, 0),
('p_15_a_1935', 451, 1935, 'Capacitar segundo grupo de estudiantes ', 4, '1.4.2.4', 15, 0),
('p_15_a_1936', 476, 1936, 'Capacitar tercer grupo de estudiantes ', 4, '1.1.1.2', 15, 0),
('p_15_a_1937', 501, 1937, 'Capacitar cuarto grupo de estudiantes ', 4, '1.4.4.4', 15, 0),
('p_15_a_1938', 515, 1938, 'Aplicar correcciones y mejoras de las capacitaciones estudiantes ', 4, '1.4.5.3', 15, 0),
('p_15_a_1942', 44, 1942, 'Realizar las pruebas unitarias ', 5, '1.1.1.4.3', 15, 0),
('p_15_a_253', 196, 253, 'SE 1.5: Transferencia tecnológica ', 3, '1.1.5', 15, 0),
('p_15_a_254', 197, 254, 'PAQ 5.1: Integración ', 4, '1.1.5.1', 15, 0),
('p_15_a_255', 203, 255, 'PAQ 5.2: Pruebas ', 4, '1.1.5.2', 15, 0),
('p_15_a_257', 208, 257, 'Realizar prueba de seguridad ', 5, '1.1.5.2.5', 15, 0),
('p_15_a_258', 209, 258, 'Realizar prueba de carga ', 5, '1.1.5.2.6', 15, 0),
('p_15_a_259', 214, 259, 'E2: Capacitación a 4300 padres de familia ', 2, '1.2', 15, 0),
('p_15_a_26', 99, 26, 'SE 1.3: Modulo de observaciones académicas y comportamentales ', 3, '1.1.3', 15, 0),
('p_15_a_260', 215, 260, 'SE 2.1: Capacitación a 1075 padres de familia ', 3, '1.2.1', 15, 0),
('p_15_a_261', 216, 261, 'PAQ 1.1: Planificación ', 4, '1.2.1.1', 15, 0),
('p_15_a_262', 217, 262, 'Desarrollar el material multimedia para la capacitación ', 5, '1.2.1.1.1', 15, 0),
('p_15_a_263', 225, 263, 'PAQ 1.2: Desarrollo ', 4, '1.2.1.2', 15, 0),
('p_15_a_264', 228, 264, 'Registrar asistencia ', 5, '1.2.1.2.3', 15, 0),
('p_15_a_265', 232, 265, 'PAQ 1.3: Evaluación ', 4, '1.2.1.3', 15, 0),
('p_15_a_266', 236, 266, 'Publicar resultados de las capacitaciones ', 5, '1.2.1.3.4', 15, 0),
('p_15_a_3', 1, 3, 'EduVirtual ', 1, '1', 15, 0),
('p_15_a_314', 198, 314, 'Desarrollar reunión para solicitar credenciales y requerimientos de conexión ', 5, '1.1.5.1.1', 15, 0),
('p_15_a_315', 199, 315, 'Cargar el software en el servidor ', 5, '1.1.5.1.2', 15, 0),
('p_15_a_316', 200, 316, 'Migrar datos del SIMAT ', 5, '1.1.5.1.3', 15, 0),
('p_15_a_317', 201, 317, 'Hacer entrega de los backups ', 5, '1.1.5.1.4', 15, 0),
('p_15_a_318', 210, 318, 'Realizar prueba de rendimiento ', 5, '1.1.5.2.7', 15, 0),
('p_15_a_319', 202, 319, 'Aceptar entrega de la aplicación ', 5, '1.1.5.1.5', 15, 0),
('p_15_a_320', 211, 320, 'Entregar resultados de pruebas  ', 5, '1.1.5.2.8', 15, 0),
('p_15_a_323', 218, 323, 'Definir logística de la capacitación ', 5, '1.2.1.1.2', 15, 0),
('p_15_a_324', 220, 324, 'Publicar la convocatoria ', 5, '1.2.1.1.4', 15, 0),
('p_15_a_326', 233, 326, 'Analizar resultados de los cuestionarios ', 5, '1.2.1.3.1', 15, 0),
('p_15_a_327', 226, 327, 'Realizar las capacitaciones ', 5, '1.2.1.2.1', 15, 0),
('p_15_a_330', 221, 330, 'Aceptar la documentación por parte de la secretaria de educación ', 5, '1.2.1.1.5', 15, 0),
('p_15_a_333', 229, 333, 'Capturar evidencias ', 5, '1.2.1.2.4', 15, 0),
('p_15_a_335', 231, 335, 'Finalizar capacitación ', 5, '1.2.1.2.6', 15, 0),
('p_15_a_336', 234, 336, 'Documentar la capacitación ', 5, '1.2.1.3.2', 15, 0),
('p_15_a_337', 237, 337, 'Publicar las evidencias ', 5, '1.2.1.3.5', 15, 0),
('p_15_a_338', 238, 338, 'Publicar contenido de las capacitaciones ', 5, '1.2.1.3.6', 15, 0),
('p_15_a_339', 239, 339, 'Entregar resultados ', 5, '1.2.1.3.7', 15, 0),
('p_15_a_342', 235, 342, 'Documentar las correcciones y mejoras ', 5, '1.2.1.3.3', 15, 0),
('p_15_a_366', 241, 366, 'SE 2.2: Capacitación a 1075 padres de familia ', 3, '1.2.2', 15, 0),
('p_15_a_394', 266, 394, 'SE 2.3: Capacitación a 1075 padres de familia ', 3, '1.2.3', 15, 0),
('p_15_a_4', 2, 4, 'E1: Aplicación web ', 2, '1.1', 15, 0),
('p_15_a_418', 291, 418, 'SE 2.4: Capacitación a 1075 padres de familia ', 3, '1.2.4', 15, 0),
('p_15_a_442', 316, 442, 'SE 2.5: Correcciones y mejoras ', 3, '1.2.5', 15, 0),
('p_15_a_443', 317, 443, 'PAQ 5.1: Planificación ', 4, '1.2.5.1', 15, 0),
('p_15_a_444', 318, 444, 'Identificar las historias de usuario defectuosas ', 5, '1.2.5.1.1', 15, 0),
('p_15_a_445', 319, 445, 'Corregir las historias de usuario defectuosas ', 5, '1.2.5.1.2', 15, 0),
('p_15_a_446', 320, 446, 'Formalizar las historias de usuario ', 5, '1.2.5.1.3', 15, 0),
('p_15_a_447', 321, 447, 'relacionar las historias de usuario ', 5, '1.2.5.1.4', 15, 0),
('p_15_a_448', 322, 448, 'Formalizar el mapa de historias de usuario ', 5, '1.2.5.1.5', 15, 0),
('p_15_a_449', 323, 449, 'PAQ 5.2: Implementación ', 4, '1.2.5.2', 15, 0),
('p_15_a_450', 324, 450, 'Corregir las interfaces de usuario ', 5, '1.2.5.2.1', 15, 0),
('p_15_a_451', 325, 451, 'Aplicar reingeniería al código fuente ', 5, '1.2.5.2.2', 15, 0),
('p_15_a_452', 326, 452, 'Unir las características del modulo ', 5, '1.2.5.2.3', 15, 0),
('p_15_a_453', 327, 453, 'Integrar el módulo al repositorio central ', 5, '1.2.5.2.4', 15, 0),
('p_15_a_454', 328, 454, 'Actualizar el documento de lecciones aprendidas ', 5, '1.2.5.2.5', 15, 0),
('p_15_a_461', 331, 461, 'E3: Capacitación a 1300 docentes ', 2, '1.3', 15, 0),
('p_15_a_5', 3, 5, 'SE 1.1: Modulo de Administración ', 3, '1.1.1', 15, 0),
('p_15_a_6', 14, 6, 'Formalizar el plan de entrega ', 5, '1.1.1.1.10', 15, 0),
('p_15_a_682', 206, 682, 'Identificar prueba de rendimiento ', 5, '1.1.5.2.3', 15, 0),
('p_15_a_683', 205, 683, 'Identificar prueba de carga ', 5, '1.1.5.2.2', 15, 0),
('p_15_a_684', 204, 684, 'Identificar pruebas de seguridad ', 5, '1.1.5.2.1', 15, 0),
('p_15_a_74', 147, 74, 'SE 1.4 : Modulo de información de reuniones, eventos y citas con los docentes ', 3, '1.1.4', 15, 0),
('p_15_a_8', 40, 8, 'Integrar el módulo al repositorio central ', 5, '1.1.1.3.9', 15, 0),
('p_15_a_84', 5, 84, 'Efectuar reunión con el patrocinador ', 5, '1.1.1.1.1', 15, 0),
('p_15_a_85', 4, 85, 'PAQ 1.1: Planificación ', 4, '1.1.1.1', 15, 0),
('p_15_a_86', 13, 86, 'Formalizar el mapa de historias de usuario ', 5, '1.1.1.1.9', 15, 0),
('p_15_a_90', 21, 90, 'Diseñar el modelo de despliegue ', 5, '1.1.1.2.6', 15, 0),
('p_15_a_91', 23, 91, 'Definir la arquitectura ', 5, '1.1.1.2.8', 15, 0),
('p_15_a_93', 15, 93, 'PAQ 1.2: Diseño ', 4, '1.1.1.2', 15, 0),
('p_15_a_99', 42, 99, 'Verificar historias de usuario ', 5, '1.1.1.4.1', 15, 0),
('p_2_a_0', 0, 0, 'Proyecto1', 0, '0', 2, 4),
('p_2_a_10', 52, 10, 'SE 1.2: Modulo de trabajos, tareas y refuerzos ', 3, '1.1.2', 2, 4),
('p_2_a_101', 43, 101, 'Identificar los casos de pruebas unitarias ', 5, '1.1.1.4.2', 2, 4),
('p_2_a_107', 24, 107, 'Realizar el modelo conceptual de los datos ', 5, '1.1.1.2.9', 2, 4),
('p_2_a_108', 29, 108, 'Aceptar el glosario de términos ', 5, '1.1.1.2.14', 2, 4),
('p_2_a_1175', 332, 1175, 'SE 3.1: Capacitación a 650 docentes ', 3, '1.3.1', 2, 4),
('p_2_a_1176', 333, 1176, 'PAQ 1.1: Planificación ', 4, '1.3.1.1', 2, 4),
('p_2_a_1177', 334, 1177, 'Desarrollar el material multimedia para la capacitación ', 5, '1.3.1.1.1', 2, 4),
('p_2_a_1178', 335, 1178, 'Definir logística de la capacitación ', 5, '1.3.1.1.2', 2, 4),
('p_2_a_1184', 343, 1184, 'PAQ 1.2: Desarrollo ', 4, '1.3.1.2', 2, 4),
('p_2_a_1185', 344, 1185, 'Realizar las capacitaciones ', 5, '1.3.1.2.1', 2, 4),
('p_2_a_1186', 346, 1186, 'Registrar asistencia ', 5, '1.3.1.2.3', 2, 4),
('p_2_a_1187', 345, 1187, 'Aplicar cuestionario ', 5, '1.3.1.2.2', 2, 4),
('p_2_a_1188', 347, 1188, 'Capturar evidencias ', 5, '1.3.1.2.4', 2, 4),
('p_2_a_1189', 348, 1189, 'Capturar correcciones y mejoras ', 5, '1.3.1.2.5', 2, 4),
('p_2_a_1190', 349, 1190, 'Finalizar capacitación ', 5, '1.3.1.2.6', 2, 4),
('p_2_a_1191', 350, 1191, 'PAQ 1.3: Evaluación ', 4, '1.3.1.3', 2, 4),
('p_2_a_1192', 351, 1192, 'Analizar resultados de los cuestionarios ', 5, '1.3.1.3.1', 2, 4),
('p_2_a_1193', 352, 1193, 'Documentar la capacitación ', 5, '1.3.1.3.2', 2, 4),
('p_2_a_1194', 353, 1194, 'Documentar las correcciones y mejoras ', 5, '1.3.1.3.3', 2, 4),
('p_2_a_1195', 354, 1195, 'Publicar resultados de las capacitaciones ', 5, '1.3.1.3.4', 2, 4),
('p_2_a_1196', 355, 1196, 'Publicar las evidencias ', 5, '1.3.1.3.5', 2, 4),
('p_2_a_1197', 356, 1197, 'Publicar contenido de las capacitaciones ', 5, '1.3.1.3.6', 2, 4),
('p_2_a_1198', 357, 1198, 'Entregar resultados ', 5, '1.3.1.3.7', 2, 4),
('p_2_a_120', 31, 120, 'PAQ 1.3: Codificación ', 4, '1.1.1.3', 2, 4),
('p_2_a_123', 32, 123, 'Desarrollar las interfaces de usuario ', 5, '1.1.1.3.1', 2, 4),
('p_2_a_1271', 385, 1271, 'SE 3.3: Correcciones y mejoras ', 3, '1.3.3', 2, 4),
('p_2_a_1272', 386, 1272, 'PAQ 5.1: Planificación ', 4, '1.3.3.1', 2, 4),
('p_2_a_1273', 387, 1273, 'Identificar las historias de usuario defectuosas ', 5, '1.3.3.1.1', 2, 4),
('p_2_a_1274', 388, 1274, 'Corregir las historias de usuario defectuosas ', 5, '1.3.3.1.2', 2, 4),
('p_2_a_1275', 389, 1275, 'Formalizar las historias de usuario ', 5, '1.3.3.1.3', 2, 4),
('p_2_a_1276', 390, 1276, 'relacionar las historias de usuario ', 5, '1.3.3.1.4', 2, 4),
('p_2_a_1277', 391, 1277, 'Formalizar el mapa de historias de usuario ', 5, '1.3.3.1.5', 2, 4),
('p_2_a_1278', 392, 1278, 'PAQ 5.2: Implementación ', 4, '1.3.3.2', 2, 4),
('p_2_a_1279', 393, 1279, 'Corregir las interfaces de usuario ', 5, '1.3.3.2.1', 2, 4),
('p_2_a_128', 30, 128, 'Aceptar los mockups de las interfaces de usuario ', 5, '1.1.1.2.15', 2, 4),
('p_2_a_1280', 394, 1280, 'Aplicar reingeniería al código fuente ', 5, '1.3.3.2.2', 2, 4),
('p_2_a_1281', 395, 1281, 'Unir las características del modulo ', 5, '1.3.3.2.3', 2, 4),
('p_2_a_1282', 396, 1282, 'Integrar el módulo al repositorio central ', 5, '1.3.3.2.4', 2, 4),
('p_2_a_1283', 397, 1283, 'Actualizar el documento de lecciones aprendidas ', 5, '1.3.3.2.5', 2, 4),
('p_2_a_1285', 25, 1285, 'Realizar el modelo entidad relación ', 5, '1.1.1.2.10', 2, 4),
('p_2_a_1286', 26, 1286, 'Aceptar el modelo de datos ', 5, '1.1.1.2.11', 2, 4),
('p_2_a_1289', 34, 1289, 'Desarrollar requerimientos funcionales del rol estudiante ', 5, '1.1.1.3.3', 2, 4),
('p_2_a_129', 27, 129, 'Modelar los mockups de las interfaces de usuario ', 5, '1.1.1.2.12', 2, 4),
('p_2_a_1291', 35, 1291, 'Desarrollar requerimientos funcionales del rol docente ', 5, '1.1.1.3.4', 2, 4),
('p_2_a_1322', 36, 1322, 'Desarrollar requerimientos funcionales del rol padre de familia ', 5, '1.1.1.3.5', 2, 4),
('p_2_a_1323', 38, 1323, 'Desarrollar requerimientos funcionales del rol administrador ', 5, '1.1.1.3.7', 2, 4),
('p_2_a_1324', 37, 1324, 'Desarrollar requerimientos funcionales del rol coordinador ', 5, '1.1.1.3.6', 2, 4),
('p_2_a_1325', 207, 1325, 'Crear plan de pruebas ', 5, '1.1.5.2.4', 2, 4),
('p_2_a_1327', 219, 1327, 'Definir encuesta de satisfacción, registro de asistencia y registro de correcciones y mejoras ', 5, '1.2.1.1.3', 2, 4),
('p_2_a_1328', 222, 1328, 'Adquirir encuestas de satisfacción, registro de asistencia y registro de correcciones y mejoras ', 5, '1.2.1.1.6', 2, 4),
('p_2_a_1329', 223, 1329, 'Adquirir kit de capacitación, pendones y volantes de publicidad ', 5, '1.2.1.1.7', 2, 4),
('p_2_a_1331', 230, 1331, 'Capturar correcciones y mejoras ', 5, '1.2.1.2.5', 2, 4),
('p_2_a_1334', 227, 1334, 'Aplicar cuestionario ', 5, '1.2.1.2.2', 2, 4),
('p_2_a_1340', 224, 1340, 'Aceptar el material trabajo  ', 5, '1.2.1.1.8', 2, 4),
('p_2_a_1341', 336, 1341, 'Definir encuesta de satisfacción, registro de asistencia y registro de correcciones y mejoras ', 5, '1.3.1.1.3', 2, 4),
('p_2_a_1342', 337, 1342, 'Publicar la convocatoria ', 5, '1.3.1.1.4', 2, 4),
('p_2_a_1343', 338, 1343, 'Aceptar la documentación por parte de la secretaria de educación ', 5, '1.3.1.1.5', 2, 4),
('p_2_a_1344', 339, 1344, 'Adquirir encuestas de satisfacción, registro de asistencia y registro de correcciones y mejoras ', 5, '1.3.1.1.6', 2, 4),
('p_2_a_1345', 340, 1345, 'Adquirir kit de capacitación, pendones y volantes de publicidad ', 5, '1.3.1.1.7', 2, 4),
('p_2_a_1346', 341, 1346, 'Adquirir refrigerio docentes ', 5, '1.3.1.1.8', 2, 4),
('p_2_a_1347', 342, 1347, 'Aceptar el material trabajo ', 5, '1.3.1.1.9', 2, 4),
('p_2_a_136', 41, 136, 'PAQ 1.4: Pruebas ', 4, '1.1.1.4', 2, 4),
('p_2_a_137', 8, 137, 'Realizar entrega formal de historias de usuario ', 5, '1.1.1.1.4', 2, 4),
('p_2_a_138', 9, 138, 'relacionar las historias de usuario ', 5, '1.1.1.1.5', 2, 4),
('p_2_a_139', 10, 139, 'Mapear el Big Picture ', 5, '1.1.1.1.6', 2, 4),
('p_2_a_140', 11, 140, 'Definir el backbone ', 5, '1.1.1.1.7', 2, 4),
('p_2_a_141', 12, 141, 'Definir el walking skeleton ', 5, '1.1.1.1.8', 2, 4),
('p_2_a_1410', 45, 1410, 'Realizar pruebas de aplicación ', 5, '1.1.1.4.4', 2, 4),
('p_2_a_1411', 46, 1411, 'Realizar pruebas de integración ', 5, '1.1.1.4.5', 2, 4),
('p_2_a_142', 7, 142, 'Formalizar las historias de usuario ', 5, '1.1.1.1.3', 2, 4),
('p_2_a_143', 6, 143, 'Efectuar reunión con un grupo de usuarios finales ', 5, '1.1.1.1.2', 2, 4),
('p_2_a_144', 18, 144, 'Aceptar las tarjetas crc ', 5, '1.1.1.2.3', 2, 4),
('p_2_a_145', 19, 145, 'Describir las capas del sistema ', 5, '1.1.1.2.4', 2, 4),
('p_2_a_146', 20, 146, 'Definir la vista estructural ', 5, '1.1.1.2.5', 2, 4),
('p_2_a_1467', 100, 1467, 'PAQ 3.1: Planificación ', 4, '1.1.3.1', 2, 4),
('p_2_a_1468', 101, 1468, 'Efectuar reunión con el patrocinador ', 5, '1.1.3.1.1', 2, 4),
('p_2_a_1469', 102, 1469, 'Efectuar reunión con un grupo de usuarios finales ', 5, '1.1.3.1.2', 2, 4),
('p_2_a_1470', 103, 1470, 'Formalizar las historias de usuario ', 5, '1.1.3.1.3', 2, 4),
('p_2_a_1471', 104, 1471, 'Realizar entrega formal de historias de usuario ', 5, '1.1.3.1.4', 2, 4),
('p_2_a_1472', 105, 1472, 'relacionar las historias de usuario ', 5, '1.1.3.1.5', 2, 4),
('p_2_a_1473', 106, 1473, 'Mapear el Big Picture ', 5, '1.1.3.1.6', 2, 4),
('p_2_a_1474', 107, 1474, 'Definir el backbone ', 5, '1.1.3.1.7', 2, 4),
('p_2_a_1475', 108, 1475, 'Definir el walking skeleton ', 5, '1.1.3.1.8', 2, 4),
('p_2_a_1476', 109, 1476, 'Formalizar el mapa de historias de usuario ', 5, '1.1.3.1.9', 2, 4),
('p_2_a_1477', 110, 1477, 'Formalizar el plan de entrega ', 5, '1.1.3.1.10', 2, 4),
('p_2_a_1478', 111, 1478, 'PAQ 3.2: Diseño ', 4, '1.1.3.2', 2, 4),
('p_2_a_1479', 112, 1479, 'Definir las tarjetas CRC ', 5, '1.1.3.2.1', 2, 4),
('p_2_a_148', 22, 148, 'Desarrollar la vista de implementación ', 5, '1.1.1.2.7', 2, 4),
('p_2_a_1480', 113, 1480, 'Relacionar tarjetas ', 5, '1.1.3.2.2', 2, 4),
('p_2_a_1481', 114, 1481, 'Aceptar las tarjetas crc ', 5, '1.1.3.2.3', 2, 4),
('p_2_a_1482', 115, 1482, 'Describir las capas del sistema ', 5, '1.1.3.2.4', 2, 4),
('p_2_a_1483', 116, 1483, 'Definir la vista estructural ', 5, '1.1.3.2.5', 2, 4),
('p_2_a_1484', 117, 1484, 'Diseñar el modelo de despliegue ', 5, '1.1.3.2.6', 2, 4),
('p_2_a_1485', 118, 1485, 'Desarrollar la vista de implementación ', 5, '1.1.3.2.7', 2, 4),
('p_2_a_1486', 119, 1486, 'Definir la arquitectura ', 5, '1.1.3.2.8', 2, 4),
('p_2_a_1487', 120, 1487, 'Realizar el modelo conceptual de los datos ', 5, '1.1.3.2.9', 2, 4),
('p_2_a_1488', 121, 1488, 'Realizar el modelo entidad relación ', 5, '1.1.3.2.10', 2, 4),
('p_2_a_1489', 122, 1489, 'Aceptar el modelo de datos ', 5, '1.1.3.2.11', 2, 4),
('p_2_a_149', 17, 149, 'Relacionar tarjetas ', 5, '1.1.1.2.2', 2, 4),
('p_2_a_1490', 123, 1490, 'Modelar los mockups de las interfaces de usuario ', 5, '1.1.3.2.12', 2, 4),
('p_2_a_1491', 124, 1491, 'Construir el glosario de términos ', 5, '1.1.3.2.13', 2, 4),
('p_2_a_1492', 125, 1492, 'Aceptar el glosario de términos ', 5, '1.1.3.2.14', 2, 4),
('p_2_a_1493', 126, 1493, 'Aceptar los mockups de las interfaces de usuario ', 5, '1.1.3.2.15', 2, 4),
('p_2_a_1494', 127, 1494, 'PAQ 3.3: Codificación ', 4, '1.1.3.3', 2, 4),
('p_2_a_1495', 128, 1495, 'Desarrollar las interfaces de usuario ', 5, '1.1.3.3.1', 2, 4),
('p_2_a_1496', 129, 1496, 'Aceptar las interfaces de usuario ', 5, '1.1.3.3.2', 2, 4),
('p_2_a_1497', 130, 1497, 'Desarrollar requerimientos funcionales del rol estudiante ', 5, '1.1.3.3.3', 2, 4),
('p_2_a_1498', 131, 1498, 'Desarrollar requerimientos funcionales del rol docente ', 5, '1.1.3.3.4', 2, 4),
('p_2_a_1499', 132, 1499, 'Desarrollar requerimientos funcionales del rol padre de familia ', 5, '1.1.3.3.5', 2, 4),
('p_2_a_150', 16, 150, 'Definir las tarjetas CRC ', 5, '1.1.1.2.1', 2, 4),
('p_2_a_1500', 133, 1500, 'Desarrollar requerimientos funcionales del rol coordinador ', 5, '1.1.3.3.6', 2, 4),
('p_2_a_1502', 134, 1502, 'Aceptar los requerimientos funcionales ', 5, '1.1.3.3.7', 2, 4),
('p_2_a_1503', 135, 1503, 'Integrar el módulo al repositorio central ', 5, '1.1.3.3.8', 2, 4),
('p_2_a_1504', 136, 1504, 'PAQ 3.4: Pruebas ', 4, '1.1.3.4', 2, 4),
('p_2_a_155', 28, 155, 'Construir el glosario de términos ', 5, '1.1.1.2.13', 2, 4),
('p_2_a_1555', 53, 1555, 'PAQ 2.1: Planificación ', 4, '1.1.2.1', 2, 4),
('p_2_a_1556', 54, 1556, 'Efectuar reunión con el patrocinador ', 5, '1.1.2.1.1', 2, 4),
('p_2_a_1557', 55, 1557, 'Efectuar reunión con un grupo de usuarios finales ', 5, '1.1.2.1.2', 2, 4),
('p_2_a_1558', 56, 1558, 'Formalizar las historias de usuario ', 5, '1.1.2.1.3', 2, 4),
('p_2_a_1559', 57, 1559, 'Realizar entrega formal de historias de usuario ', 5, '1.1.2.1.4', 2, 4),
('p_2_a_1560', 58, 1560, 'relacionar las historias de usuario ', 5, '1.1.2.1.5', 2, 4),
('p_2_a_1561', 59, 1561, 'Mapear el Big Picture ', 5, '1.1.2.1.6', 2, 4),
('p_2_a_1562', 60, 1562, 'Definir el backbone ', 5, '1.1.2.1.7', 2, 4),
('p_2_a_1563', 61, 1563, 'Definir el walking skeleton ', 5, '1.1.2.1.8', 2, 4),
('p_2_a_1564', 62, 1564, 'Formalizar el mapa de historias de usuario ', 5, '1.1.2.1.9', 2, 4),
('p_2_a_1565', 63, 1565, 'Formalizar el plan de entrega ', 5, '1.1.2.1.10', 2, 4),
('p_2_a_1566', 64, 1566, 'PAQ 2.2: Diseño ', 4, '1.1.2.2', 2, 4),
('p_2_a_1567', 65, 1567, 'Definir las tarjetas CRC ', 5, '1.1.2.2.1', 2, 4),
('p_2_a_1568', 66, 1568, 'Relacionar tarjetas ', 5, '1.1.2.2.2', 2, 4),
('p_2_a_1569', 67, 1569, 'Aceptar las tarjetas crc ', 5, '1.1.2.2.3', 2, 4),
('p_2_a_157', 39, 157, 'Aceptar los requerimientos funcionales ', 5, '1.1.1.3.8', 2, 4),
('p_2_a_1570', 68, 1570, 'Describir las capas del sistema ', 5, '1.1.2.2.4', 2, 4),
('p_2_a_1571', 69, 1571, 'Definir la vista estructural ', 5, '1.1.2.2.5', 2, 4),
('p_2_a_1572', 70, 1572, 'Diseñar el modelo de despliegue ', 5, '1.1.2.2.6', 2, 4),
('p_2_a_1573', 71, 1573, 'Desarrollar la vista de implementación ', 5, '1.1.2.2.7', 2, 4),
('p_2_a_1574', 72, 1574, 'Definir la arquitectura ', 5, '1.1.2.2.8', 2, 4),
('p_2_a_1575', 73, 1575, 'Realizar el modelo conceptual de los datos ', 5, '1.1.2.2.9', 2, 4),
('p_2_a_1576', 74, 1576, 'Realizar el modelo entidad relación ', 5, '1.1.2.2.10', 2, 4),
('p_2_a_1577', 75, 1577, 'Aceptar el modelo de datos ', 5, '1.1.2.2.11', 2, 4),
('p_2_a_1578', 76, 1578, 'Modelar los mockups de las interfaces de usuario ', 5, '1.1.2.2.12', 2, 4),
('p_2_a_1579', 77, 1579, 'Construir el glosario de términos ', 5, '1.1.2.2.13', 2, 4),
('p_2_a_1580', 78, 1580, 'Aceptar el glosario de términos ', 5, '1.1.2.2.14', 2, 4),
('p_2_a_1581', 79, 1581, 'Aceptar los mockups de las interfaces de usuario ', 5, '1.1.2.2.15', 2, 4),
('p_2_a_1582', 80, 1582, 'PAQ 2.3: Codificación ', 4, '1.1.2.3', 2, 4),
('p_2_a_1583', 81, 1583, 'Desarrollar las interfaces de usuario ', 5, '1.1.2.3.1', 2, 4),
('p_2_a_1584', 82, 1584, 'Aceptar las interfaces de usuario ', 5, '1.1.2.3.2', 2, 4),
('p_2_a_1585', 83, 1585, 'Desarrollar requerimientos funcionales del rol estudiante ', 5, '1.1.2.3.3', 2, 4);
INSERT INTO `actividad` (`actividad_id`, `actividad_orden`, `actividad_uuid`, `actividad_nombre`, `actividad_level`, `actividad_wbs`, `proyecto_id`, `proyecto_linea_base`) VALUES
('p_2_a_1586', 84, 1586, 'Desarrollar requerimientos funcionales del rol docente ', 5, '1.1.2.3.4', 2, 4),
('p_2_a_1587', 85, 1587, 'Desarrollar requerimientos funcionales del rol padre de familia ', 5, '1.1.2.3.5', 2, 4),
('p_2_a_159', 33, 159, 'Aceptar las interfaces de usuario ', 5, '1.1.1.3.2', 2, 4),
('p_2_a_1590', 86, 1590, 'Aceptar los requerimientos funcionales ', 5, '1.1.2.3.6', 2, 4),
('p_2_a_1591', 87, 1591, 'Integrar el módulo al repositorio central ', 5, '1.1.2.3.7', 2, 4),
('p_2_a_1592', 88, 1592, 'PAQ 2.4: Pruebas ', 4, '1.1.2.4', 2, 4),
('p_2_a_1599', 148, 1599, 'PAQ 4.1: Planificación ', 4, '1.1.4.1', 2, 4),
('p_2_a_1600', 149, 1600, 'Efectuar reunión con el patrocinador ', 5, '1.1.4.1.1', 2, 4),
('p_2_a_1601', 150, 1601, 'Efectuar reunión con un grupo de usuarios finales ', 5, '1.1.4.1.2', 2, 4),
('p_2_a_1602', 151, 1602, 'Formalizar las historias de usuario ', 5, '1.1.4.1.3', 2, 4),
('p_2_a_1603', 152, 1603, 'Realizar entrega formal de historias de usuario ', 5, '1.1.4.1.4', 2, 4),
('p_2_a_1604', 153, 1604, 'relacionar las historias de usuario ', 5, '1.1.4.1.5', 2, 4),
('p_2_a_1605', 154, 1605, 'Mapear el Big Picture ', 5, '1.1.4.1.6', 2, 4),
('p_2_a_1606', 155, 1606, 'Definir el backbone ', 5, '1.1.4.1.7', 2, 4),
('p_2_a_1607', 156, 1607, 'Definir el walking skeleton ', 5, '1.1.4.1.8', 2, 4),
('p_2_a_1608', 157, 1608, 'Formalizar el mapa de historias de usuario ', 5, '1.1.4.1.9', 2, 4),
('p_2_a_1609', 158, 1609, 'Formalizar el plan de entrega ', 5, '1.1.4.1.10', 2, 4),
('p_2_a_1610', 159, 1610, 'PAQ 4.2: Diseño ', 4, '1.1.4.2', 2, 4),
('p_2_a_1611', 160, 1611, 'Definir las tarjetas CRC ', 5, '1.1.4.2.1', 2, 4),
('p_2_a_1612', 161, 1612, 'Relacionar tarjetas ', 5, '1.1.4.2.2', 2, 4),
('p_2_a_1613', 162, 1613, 'Aceptar las tarjetas crc ', 5, '1.1.4.2.3', 2, 4),
('p_2_a_1614', 163, 1614, 'Describir las capas del sistema ', 5, '1.1.4.2.4', 2, 4),
('p_2_a_1615', 164, 1615, 'Definir la vista estructural ', 5, '1.1.4.2.5', 2, 4),
('p_2_a_1616', 165, 1616, 'Diseñar el modelo de despliegue ', 5, '1.1.4.2.6', 2, 4),
('p_2_a_1617', 166, 1617, 'Desarrollar la vista de implementación ', 5, '1.1.4.2.7', 2, 4),
('p_2_a_1618', 167, 1618, 'Definir la arquitectura ', 5, '1.1.4.2.8', 2, 4),
('p_2_a_1619', 168, 1619, 'Realizar el modelo conceptual de los datos ', 5, '1.1.4.2.9', 2, 4),
('p_2_a_1620', 169, 1620, 'Realizar el modelo entidad relación ', 5, '1.1.4.2.10', 2, 4),
('p_2_a_1621', 170, 1621, 'Aceptar el modelo de datos ', 5, '1.1.4.2.11', 2, 4),
('p_2_a_1622', 171, 1622, 'Modelar los mockups de las interfaces de usuario ', 5, '1.1.4.2.12', 2, 4),
('p_2_a_1623', 172, 1623, 'Construir el glosario de términos ', 5, '1.1.4.2.13', 2, 4),
('p_2_a_1624', 173, 1624, 'Aceptar el glosario de términos ', 5, '1.1.4.2.14', 2, 4),
('p_2_a_1625', 174, 1625, 'Aceptar los mockups de las interfaces de usuario ', 5, '1.1.4.2.15', 2, 4),
('p_2_a_1626', 175, 1626, 'PAQ 4.3: Codificación ', 4, '1.1.4.3', 2, 4),
('p_2_a_1627', 176, 1627, 'Desarrollar las interfaces de usuario ', 5, '1.1.4.3.1', 2, 4),
('p_2_a_1628', 177, 1628, 'Aceptar las interfaces de usuario ', 5, '1.1.4.3.2', 2, 4),
('p_2_a_1629', 178, 1629, 'Desarrollar requerimientos funcionales del rol estudiante ', 5, '1.1.4.3.3', 2, 4),
('p_2_a_1630', 179, 1630, 'Desarrollar requerimientos funcionales del rol docente ', 5, '1.1.4.3.4', 2, 4),
('p_2_a_1631', 180, 1631, 'Desarrollar requerimientos funcionales del rol padre de familia ', 5, '1.1.4.3.5', 2, 4),
('p_2_a_1632', 181, 1632, 'Desarrollar requerimientos funcionales del rol coordinador ', 5, '1.1.4.3.6', 2, 4),
('p_2_a_1633', 182, 1633, 'Desarrollar requerimientos funcionales del rol administrador ', 5, '1.1.4.3.7', 2, 4),
('p_2_a_1634', 183, 1634, 'Aceptar los requerimientos funcionales ', 5, '1.1.4.3.8', 2, 4),
('p_2_a_1635', 184, 1635, 'Integrar el módulo al repositorio central ', 5, '1.1.4.3.9', 2, 4),
('p_2_a_1636', 185, 1636, 'PAQ 4.4: Pruebas ', 4, '1.1.4.4', 2, 4),
('p_2_a_1643', 242, 1643, 'PAQ 2.1: Planificación ', 4, '1.2.2.1', 2, 4),
('p_2_a_1644', 243, 1644, 'Desarrollar el material multimedia para la capacitación ', 5, '1.2.2.1.1', 2, 4),
('p_2_a_1645', 244, 1645, 'Definir logística de la capacitación ', 5, '1.2.2.1.2', 2, 4),
('p_2_a_1647', 245, 1647, 'Publicar la convocatoria ', 5, '1.2.2.1.3', 2, 4),
('p_2_a_1648', 246, 1648, 'Aceptar la documentación por parte de la secretaria de educación ', 5, '1.2.2.1.4', 2, 4),
('p_2_a_1649', 247, 1649, 'Adquirir encuestas de satisfacción, registro de asistencia y registro de correcciones y mejoras ', 5, '1.2.2.1.5', 2, 4),
('p_2_a_1650', 248, 1650, 'Adquirir kit de capacitación, y volantes de publicidad ', 5, '1.2.2.1.6', 2, 4),
('p_2_a_1651', 249, 1651, 'Aceptar el material trabajo  ', 5, '1.2.2.1.7', 2, 4),
('p_2_a_1652', 250, 1652, 'PAQ 2.2: Desarrollo ', 4, '1.2.2.2', 2, 4),
('p_2_a_1653', 251, 1653, 'Realizar las capacitaciones ', 5, '1.2.2.2.1', 2, 4),
('p_2_a_1654', 252, 1654, 'Aplicar cuestionario ', 5, '1.2.2.2.2', 2, 4),
('p_2_a_1655', 253, 1655, 'Registrar asistencia ', 5, '1.2.2.2.3', 2, 4),
('p_2_a_1656', 254, 1656, 'Capturar evidencias ', 5, '1.2.2.2.4', 2, 4),
('p_2_a_1657', 255, 1657, 'Capturar correcciones y mejoras ', 5, '1.2.2.2.5', 2, 4),
('p_2_a_1658', 256, 1658, 'Finalizar capacitación ', 5, '1.2.2.2.6', 2, 4),
('p_2_a_1659', 257, 1659, 'PAQ 2.3: Evaluación ', 4, '1.2.2.3', 2, 4),
('p_2_a_1660', 258, 1660, 'Analizar resultados de los cuestionarios ', 5, '1.2.2.3.1', 2, 4),
('p_2_a_1661', 259, 1661, 'Documentar la capacitación ', 5, '1.2.2.3.2', 2, 4),
('p_2_a_1662', 260, 1662, 'Documentar las correcciones y mejoras ', 5, '1.2.2.3.3', 2, 4),
('p_2_a_1663', 261, 1663, 'Publicar resultados de las capacitaciones ', 5, '1.2.2.3.4', 2, 4),
('p_2_a_1664', 262, 1664, 'Publicar las evidencias ', 5, '1.2.2.3.5', 2, 4),
('p_2_a_1665', 263, 1665, 'Publicar contenido de las capacitaciones ', 5, '1.2.2.3.6', 2, 4),
('p_2_a_1666', 264, 1666, 'Entregar resultados ', 5, '1.2.2.3.7', 2, 4),
('p_2_a_1667', 267, 1667, 'PAQ 3.1: Planificación ', 4, '1.2.3.1', 2, 4),
('p_2_a_1668', 268, 1668, 'Desarrollar el material multimedia para la capacitación ', 5, '1.2.3.1.1', 2, 4),
('p_2_a_1669', 269, 1669, 'Definir logística de la capacitación ', 5, '1.2.3.1.2', 2, 4),
('p_2_a_1670', 270, 1670, 'Publicar la convocatoria ', 5, '1.2.3.1.3', 2, 4),
('p_2_a_1671', 271, 1671, 'Aceptar la documentación por parte de la secretaria de educación ', 5, '1.2.3.1.4', 2, 4),
('p_2_a_1672', 272, 1672, 'Adquirir encuestas de satisfacción, registro de asistencia y registro de correcciones y mejoras ', 5, '1.2.3.1.5', 2, 4),
('p_2_a_1673', 273, 1673, 'Adquirir kit de capacitación, y volantes de publicidad ', 5, '1.2.3.1.6', 2, 4),
('p_2_a_1674', 274, 1674, 'Aceptar el material trabajo  ', 5, '1.2.3.1.7', 2, 4),
('p_2_a_1675', 275, 1675, 'PAQ 3.2: Desarrollo ', 4, '1.2.3.2', 2, 4),
('p_2_a_1676', 276, 1676, 'Realizar las capacitaciones ', 5, '1.2.3.2.1', 2, 4),
('p_2_a_1677', 277, 1677, 'Aplicar cuestionario ', 5, '1.2.3.2.2', 2, 4),
('p_2_a_1678', 278, 1678, 'Registrar asistencia ', 5, '1.2.3.2.3', 2, 4),
('p_2_a_1679', 279, 1679, 'Capturar evidencias ', 5, '1.2.3.2.4', 2, 4),
('p_2_a_1680', 280, 1680, 'Capturar correcciones y mejoras ', 5, '1.2.3.2.5', 2, 4),
('p_2_a_1681', 281, 1681, 'Finalizar capacitación ', 5, '1.2.3.2.6', 2, 4),
('p_2_a_1682', 282, 1682, 'PAQ 3.3: Evaluación ', 4, '1.2.3.3', 2, 4),
('p_2_a_1683', 283, 1683, 'Analizar resultados de los cuestionarios ', 5, '1.2.3.3.1', 2, 4),
('p_2_a_1684', 284, 1684, 'Documentar la capacitación ', 5, '1.2.3.3.2', 2, 4),
('p_2_a_1685', 285, 1685, 'Documentar las correcciones y mejoras ', 5, '1.2.3.3.3', 2, 4),
('p_2_a_1686', 286, 1686, 'Publicar resultados de las capacitaciones ', 5, '1.2.3.3.4', 2, 4),
('p_2_a_1687', 287, 1687, 'Publicar las evidencias ', 5, '1.2.3.3.5', 2, 4),
('p_2_a_1688', 288, 1688, 'Publicar contenido de las capacitaciones ', 5, '1.2.3.3.6', 2, 4),
('p_2_a_1689', 289, 1689, 'Entregar resultados ', 5, '1.2.3.3.7', 2, 4),
('p_2_a_1690', 292, 1690, 'PAQ 4.1: Planificación ', 4, '1.2.4.1', 2, 4),
('p_2_a_1691', 293, 1691, 'Desarrollar el material multimedia para la capacitación ', 5, '1.2.4.1.1', 2, 4),
('p_2_a_1692', 294, 1692, 'Definir logística de la capacitación ', 5, '1.2.4.1.2', 2, 4),
('p_2_a_1693', 295, 1693, 'Publicar la convocatoria ', 5, '1.2.4.1.3', 2, 4),
('p_2_a_1694', 296, 1694, 'Aceptar la documentación por parte de la secretaria de educación ', 5, '1.2.4.1.4', 2, 4),
('p_2_a_1695', 297, 1695, 'Adquirir encuestas de satisfacción, registro de asistencia y registro de correcciones y mejoras ', 5, '1.2.4.1.5', 2, 4),
('p_2_a_1696', 298, 1696, 'Adquirir kit de capacitación, y volantes de publicidad ', 5, '1.2.4.1.6', 2, 4),
('p_2_a_1697', 299, 1697, 'Aceptar el material trabajo ', 5, '1.2.4.1.7', 2, 4),
('p_2_a_1698', 300, 1698, 'PAQ 4.2: Desarrollo ', 4, '1.2.4.2', 2, 4),
('p_2_a_1699', 301, 1699, 'Realizar las capacitaciones ', 5, '1.2.4.2.1', 2, 4),
('p_2_a_1700', 302, 1700, 'Aplicar cuestionario ', 5, '1.2.4.2.2', 2, 4),
('p_2_a_1701', 303, 1701, 'Registrar asistencia ', 5, '1.2.4.2.3', 2, 4),
('p_2_a_1702', 304, 1702, 'Capturar evidencias ', 5, '1.2.4.2.4', 2, 4),
('p_2_a_1703', 305, 1703, 'Capturar correcciones y mejoras ', 5, '1.2.4.2.5', 2, 4),
('p_2_a_1704', 306, 1704, 'Finalizar capacitación ', 5, '1.2.4.2.6', 2, 4),
('p_2_a_1705', 307, 1705, 'PAQ 4.3: Evaluación ', 4, '1.2.4.3', 2, 4),
('p_2_a_1706', 308, 1706, 'Analizar resultados de los cuestionarios ', 5, '1.2.4.3.1', 2, 4),
('p_2_a_1707', 309, 1707, 'Documentar la capacitación ', 5, '1.2.4.3.2', 2, 4),
('p_2_a_1708', 310, 1708, 'Documentar las correcciones y mejoras ', 5, '1.2.4.3.3', 2, 4),
('p_2_a_1709', 311, 1709, 'Publicar resultados de las capacitaciones ', 5, '1.2.4.3.4', 2, 4),
('p_2_a_1710', 312, 1710, 'Publicar las evidencias ', 5, '1.2.4.3.5', 2, 4),
('p_2_a_1711', 313, 1711, 'Publicar contenido de las capacitaciones ', 5, '1.2.4.3.6', 2, 4),
('p_2_a_1712', 314, 1712, 'Entregar resultados ', 5, '1.2.4.3.7', 2, 4),
('p_2_a_1713', 400, 1713, 'E4: Capacitación a 4300 estudiantes ', 2, '1.4', 2, 4),
('p_2_a_1714', 401, 1714, 'SE 4.1: Capacitación a 1075 estudiantes ', 3, '1.4.1', 2, 4),
('p_2_a_1715', 402, 1715, 'PAQ 1.1: Planificación ', 4, '1.4.1.1', 2, 4),
('p_2_a_1716', 403, 1716, 'Desarrollar el material multimedia para la capacitación ', 5, '1.4.1.1.1', 2, 4),
('p_2_a_1717', 404, 1717, 'Definir logística de la capacitación ', 5, '1.4.1.1.2', 2, 4),
('p_2_a_1718', 405, 1718, 'Definir encuesta de satisfacción, registro de asistencia y registro de correcciones y mejoras ', 5, '1.4.1.1.3', 2, 4),
('p_2_a_1719', 406, 1719, 'Publicar la convocatoria ', 5, '1.4.1.1.4', 2, 4),
('p_2_a_1720', 407, 1720, 'Aceptar la documentación por parte de la secretaria de educación ', 5, '1.4.1.1.5', 2, 4),
('p_2_a_1721', 408, 1721, 'Adquirir encuestas de satisfacción, registro de asistencia y registro de correcciones y mejoras ', 5, '1.4.1.1.6', 2, 4),
('p_2_a_1722', 409, 1722, 'Adquirir kit de capacitación, pendones y volantes de publicidad ', 5, '1.4.1.1.7', 2, 4),
('p_2_a_1723', 410, 1723, 'Aceptar el material trabajo  ', 5, '1.4.1.1.8', 2, 4),
('p_2_a_1724', 411, 1724, 'PAQ 1.2: Desarrollo ', 4, '1.4.1.2', 2, 4),
('p_2_a_1725', 412, 1725, 'Realizar las capacitaciones ', 5, '1.4.1.2.1', 2, 4),
('p_2_a_1726', 413, 1726, 'Aplicar cuestionario ', 5, '1.4.1.2.2', 2, 4),
('p_2_a_1727', 414, 1727, 'Registrar asistencia ', 5, '1.4.1.2.3', 2, 4),
('p_2_a_1728', 415, 1728, 'Capturar evidencias ', 5, '1.4.1.2.4', 2, 4),
('p_2_a_1729', 416, 1729, 'Capturar correcciones y mejoras ', 5, '1.4.1.2.5', 2, 4),
('p_2_a_1730', 417, 1730, 'Finalizar capacitación ', 5, '1.4.1.2.6', 2, 4),
('p_2_a_1731', 418, 1731, 'PAQ 1.3: Evaluación ', 4, '1.4.1.3', 2, 4),
('p_2_a_1732', 419, 1732, 'Analizar resultados de los cuestionarios ', 5, '1.4.1.3.1', 2, 4),
('p_2_a_1733', 420, 1733, 'Documentar la capacitación ', 5, '1.4.1.3.2', 2, 4),
('p_2_a_1734', 421, 1734, 'Documentar las correcciones y mejoras ', 5, '1.4.1.3.3', 2, 4),
('p_2_a_1735', 422, 1735, 'Publicar resultados de las capacitaciones ', 5, '1.4.1.3.4', 2, 4),
('p_2_a_1736', 423, 1736, 'Publicar las evidencias ', 5, '1.4.1.3.5', 2, 4),
('p_2_a_1737', 424, 1737, 'Publicar contenido de las capacitaciones ', 5, '1.4.1.3.6', 2, 4),
('p_2_a_1738', 425, 1738, 'Entregar resultados ', 5, '1.4.1.3.7', 2, 4),
('p_2_a_1739', 427, 1739, 'SE 4.2: Capacitación a 1075 estudiantes ', 3, '1.4.2', 2, 4),
('p_2_a_1740', 428, 1740, 'PAQ 2.1: Planificación ', 4, '1.4.2.1', 2, 4),
('p_2_a_1741', 429, 1741, 'Desarrollar el material multimedia para la capacitación ', 5, '1.4.2.1.1', 2, 4),
('p_2_a_1742', 430, 1742, 'Definir logística de la capacitación ', 5, '1.4.2.1.2', 2, 4),
('p_2_a_1743', 431, 1743, 'Publicar la convocatoria ', 5, '1.4.2.1.3', 2, 4),
('p_2_a_1744', 432, 1744, 'Aceptar la documentación por parte de la secretaria de educación ', 5, '1.4.2.1.4', 2, 4),
('p_2_a_1745', 433, 1745, 'Adquirir encuestas de satisfacción, registro de asistencia y registro de correcciones y mejoras ', 5, '1.4.2.1.5', 2, 4),
('p_2_a_1746', 434, 1746, 'Adquirir kit de capacitación, y volantes de publicidad ', 5, '1.4.2.1.6', 2, 4),
('p_2_a_1747', 435, 1747, 'Aceptar el material trabajo ', 5, '1.4.2.1.7', 2, 4),
('p_2_a_1748', 436, 1748, 'PAQ 2.2: Desarrollo ', 4, '1.4.2.2', 2, 4),
('p_2_a_1749', 437, 1749, 'Realizar las capacitaciones ', 5, '1.4.2.2.1', 2, 4),
('p_2_a_1750', 438, 1750, 'Aplicar cuestionario ', 5, '1.4.2.2.2', 2, 4),
('p_2_a_1751', 439, 1751, 'Registrar asistencia ', 5, '1.4.2.2.3', 2, 4),
('p_2_a_1752', 440, 1752, 'Capturar evidencias ', 5, '1.4.2.2.4', 2, 4),
('p_2_a_1753', 441, 1753, 'Capturar correcciones y mejoras ', 5, '1.4.2.2.5', 2, 4),
('p_2_a_1754', 442, 1754, 'Finalizar capacitación ', 5, '1.4.2.2.6', 2, 4),
('p_2_a_1755', 443, 1755, 'PAQ 2.3: Evaluación ', 4, '1.4.2.3', 2, 4),
('p_2_a_1756', 444, 1756, 'Analizar resultados de los cuestionarios ', 5, '1.4.2.3.1', 2, 4),
('p_2_a_1757', 445, 1757, 'Documentar la capacitación ', 5, '1.4.2.3.2', 2, 4),
('p_2_a_1758', 446, 1758, 'Documentar las correcciones y mejoras ', 5, '1.4.2.3.3', 2, 4),
('p_2_a_1759', 447, 1759, 'Publicar resultados de las capacitaciones ', 5, '1.4.2.3.4', 2, 4),
('p_2_a_1760', 448, 1760, 'Publicar las evidencias ', 5, '1.4.2.3.5', 2, 4),
('p_2_a_1761', 449, 1761, 'Publicar contenido de las capacitaciones ', 5, '1.4.2.3.6', 2, 4),
('p_2_a_1762', 450, 1762, 'Entregar resultados ', 5, '1.4.2.3.7', 2, 4),
('p_2_a_1763', 452, 1763, 'SE 4.3: Capacitación a 1075 estudiantes ', 3, '1.4.3', 2, 4),
('p_2_a_1764', 453, 1764, 'PAQ 3.1: Planificación ', 4, '1.4.3.1', 2, 4),
('p_2_a_1765', 454, 1765, 'Desarrollar el material multimedia para la capacitación ', 5, '1.4.3.1.1', 2, 4),
('p_2_a_1766', 455, 1766, 'Definir logística de la capacitación ', 5, '1.4.3.1.2', 2, 4),
('p_2_a_1767', 456, 1767, 'Publicar la convocatoria ', 5, '1.4.3.1.3', 2, 4),
('p_2_a_1768', 457, 1768, 'Aceptar la documentación por parte de la secretaria de educación ', 5, '1.4.3.1.4', 2, 4),
('p_2_a_1769', 458, 1769, 'Adquirir encuestas de satisfacción, registro de asistencia y registro de correcciones y mejoras ', 5, '1.4.3.1.5', 2, 4),
('p_2_a_1770', 459, 1770, 'Adquirir kit de capacitación, y volantes de publicidad ', 5, '1.4.3.1.6', 2, 4),
('p_2_a_1771', 460, 1771, 'Aceptar el material trabajo  ', 5, '1.4.3.1.7', 2, 4),
('p_2_a_1772', 461, 1772, 'PAQ 3.2: Desarrollo ', 4, '1.4.3.2', 2, 4),
('p_2_a_1773', 462, 1773, 'Realizar las capacitaciones ', 5, '1.4.3.2.1', 2, 4),
('p_2_a_1774', 463, 1774, 'Aplicar cuestionario ', 5, '1.4.3.2.2', 2, 4),
('p_2_a_1775', 464, 1775, 'Registrar asistencia ', 5, '1.4.3.2.3', 2, 4),
('p_2_a_1776', 465, 1776, 'Capturar evidencias ', 5, '1.4.3.2.4', 2, 4),
('p_2_a_1777', 466, 1777, 'Capturar correcciones y mejoras ', 5, '1.4.3.2.5', 2, 4),
('p_2_a_1778', 467, 1778, 'Finalizar capacitación ', 5, '1.4.3.2.6', 2, 4),
('p_2_a_1779', 468, 1779, 'PAQ 3.3: Evaluación ', 4, '1.4.3.3', 2, 4),
('p_2_a_1780', 469, 1780, 'Analizar resultados de los cuestionarios ', 5, '1.4.3.3.1', 2, 4),
('p_2_a_1781', 470, 1781, 'Documentar la capacitación ', 5, '1.4.3.3.2', 2, 4),
('p_2_a_1782', 471, 1782, 'Documentar las correcciones y mejoras ', 5, '1.4.3.3.3', 2, 4),
('p_2_a_1783', 472, 1783, 'Publicar resultados de las capacitaciones ', 5, '1.4.3.3.4', 2, 4),
('p_2_a_1784', 473, 1784, 'Publicar las evidencias ', 5, '1.4.3.3.5', 2, 4),
('p_2_a_1785', 474, 1785, 'Publicar contenido de las capacitaciones ', 5, '1.4.3.3.6', 2, 4),
('p_2_a_1786', 475, 1786, 'Entregar resultados ', 5, '1.4.3.3.7', 2, 4),
('p_2_a_1787', 477, 1787, 'SE 4.4: Capacitación a 1075 estudiantes ', 3, '1.4.4', 2, 4),
('p_2_a_1788', 478, 1788, 'PAQ 4.1: Planificación ', 4, '1.4.4.1', 2, 4),
('p_2_a_1789', 479, 1789, 'Desarrollar el material multimedia para la capacitación ', 5, '1.4.4.1.1', 2, 4),
('p_2_a_1790', 480, 1790, 'Definir logística de la capacitación ', 5, '1.4.4.1.2', 2, 4),
('p_2_a_1791', 481, 1791, 'Publicar la convocatoria ', 5, '1.4.4.1.3', 2, 4),
('p_2_a_1792', 482, 1792, 'Aceptar la documentación por parte de la secretaria de educación ', 5, '1.4.4.1.4', 2, 4),
('p_2_a_1793', 483, 1793, 'Adquirir encuestas de satisfacción, registro de asistencia y registro de correcciones y mejoras ', 5, '1.4.4.1.5', 2, 4),
('p_2_a_1794', 484, 1794, 'Adquirir kit de capacitación, y volantes de publicidad ', 5, '1.4.4.1.6', 2, 4),
('p_2_a_1795', 485, 1795, 'Aceptar el material trabajo  ', 5, '1.4.4.1.7', 2, 4),
('p_2_a_1796', 486, 1796, 'PAQ 4.2: Desarrollo ', 4, '1.4.4.2', 2, 4),
('p_2_a_1797', 487, 1797, 'Realizar las capacitaciones ', 5, '1.4.4.2.1', 2, 4),
('p_2_a_1798', 488, 1798, 'Aplicar cuestionario ', 5, '1.4.4.2.2', 2, 4),
('p_2_a_1799', 489, 1799, 'Registrar asistencia ', 5, '1.4.4.2.3', 2, 4),
('p_2_a_1800', 490, 1800, 'Capturar evidencias ', 5, '1.4.4.2.4', 2, 4),
('p_2_a_1801', 491, 1801, 'Capturar correcciones y mejoras ', 5, '1.4.4.2.5', 2, 4),
('p_2_a_1802', 492, 1802, 'Finalizar capacitación ', 5, '1.4.4.2.6', 2, 4),
('p_2_a_1803', 493, 1803, 'PAQ 4.3: Evaluación ', 4, '1.4.4.3', 2, 4),
('p_2_a_1804', 494, 1804, 'Analizar resultados de los cuestionarios ', 5, '1.4.4.3.1', 2, 4),
('p_2_a_1805', 495, 1805, 'Documentar la capacitación ', 5, '1.4.4.3.2', 2, 4),
('p_2_a_1806', 496, 1806, 'Documentar las correcciones y mejoras ', 5, '1.4.4.3.3', 2, 4),
('p_2_a_1807', 497, 1807, 'Publicar resultados de las capacitaciones ', 5, '1.4.4.3.4', 2, 4),
('p_2_a_1808', 498, 1808, 'Publicar las evidencias ', 5, '1.4.4.3.5', 2, 4),
('p_2_a_1809', 499, 1809, 'Publicar contenido de las capacitaciones ', 5, '1.4.4.3.6', 2, 4),
('p_2_a_1810', 500, 1810, 'Entregar resultados ', 5, '1.4.4.3.7', 2, 4),
('p_2_a_1811', 502, 1811, 'SE 4.5: Correcciones y mejoras ', 3, '1.4.5', 2, 4),
('p_2_a_1812', 503, 1812, 'PAQ 5.1: Planificación ', 4, '1.4.5.1', 2, 4),
('p_2_a_1813', 504, 1813, 'Identificar las historias de usuario defectuosas ', 5, '1.4.5.1.1', 2, 4),
('p_2_a_1814', 505, 1814, 'Corregir las historias de usuario defectuosas ', 5, '1.4.5.1.2', 2, 4),
('p_2_a_1815', 506, 1815, 'Formalizar las historias de usuario ', 5, '1.4.5.1.3', 2, 4),
('p_2_a_1816', 507, 1816, 'relacionar las historias de usuario ', 5, '1.4.5.1.4', 2, 4),
('p_2_a_1817', 508, 1817, 'Formalizar el mapa de historias de usuario ', 5, '1.4.5.1.5', 2, 4),
('p_2_a_1818', 509, 1818, 'PAQ 5.2: Implementación ', 4, '1.4.5.2', 2, 4),
('p_2_a_1819', 510, 1819, 'Corregir las interfaces de usuario ', 5, '1.4.5.2.1', 2, 4),
('p_2_a_1820', 511, 1820, 'Aplicar reingeniería al código fuente ', 5, '1.4.5.2.2', 2, 4),
('p_2_a_1821', 512, 1821, 'Unir las características del modulo ', 5, '1.4.5.2.3', 2, 4),
('p_2_a_1822', 513, 1822, 'Integrar el módulo al repositorio central ', 5, '1.4.5.2.4', 2, 4),
('p_2_a_1823', 514, 1823, 'Actualizar el documento de lecciones aprendidas ', 5, '1.4.5.2.5', 2, 4),
('p_2_a_1824', 359, 1824, 'SE 3.2: Capacitación a 650 docentes ', 3, '1.3.2', 2, 4),
('p_2_a_1825', 360, 1825, 'PAQ 1.1: Planificación ', 4, '1.3.2.1', 2, 4),
('p_2_a_1826', 361, 1826, 'Desarrollar el material multimedia para la capacitación ', 5, '1.3.2.1.1', 2, 4),
('p_2_a_1827', 362, 1827, 'Definir logística de la capacitación ', 5, '1.3.2.1.2', 2, 4),
('p_2_a_1829', 363, 1829, 'Publicar la convocatoria ', 5, '1.3.2.1.3', 2, 4),
('p_2_a_1830', 364, 1830, 'Aceptar la documentación por parte de la secretaria de educación ', 5, '1.3.2.1.4', 2, 4),
('p_2_a_1831', 365, 1831, 'Adquirir encuestas de satisfacción, registro de asistencia y registro de correcciones y mejoras ', 5, '1.3.2.1.5', 2, 4),
('p_2_a_1832', 366, 1832, 'Adquirir kit de capacitación, y volantes de publicidad ', 5, '1.3.2.1.6', 2, 4),
('p_2_a_1833', 367, 1833, 'Adquirir refrigerio docentes ', 5, '1.3.2.1.7', 2, 4),
('p_2_a_1834', 368, 1834, 'Aceptar el material trabajo  ', 5, '1.3.2.1.8', 2, 4),
('p_2_a_1835', 369, 1835, 'PAQ 1.2: Desarrollo ', 4, '1.3.2.2', 2, 4),
('p_2_a_1836', 370, 1836, 'Realizar las capacitaciones ', 5, '1.3.2.2.1', 2, 4),
('p_2_a_1837', 371, 1837, 'Aplicar cuestionario ', 5, '1.3.2.2.2', 2, 4),
('p_2_a_1838', 372, 1838, 'Registrar asistencia ', 5, '1.3.2.2.3', 2, 4),
('p_2_a_1839', 373, 1839, 'Capturar evidencias ', 5, '1.3.2.2.4', 2, 4),
('p_2_a_1840', 374, 1840, 'Capturar correcciones y mejoras ', 5, '1.3.2.2.5', 2, 4),
('p_2_a_1841', 375, 1841, 'Finalizar capacitación ', 5, '1.3.2.2.6', 2, 4),
('p_2_a_1842', 376, 1842, 'PAQ 1.3: Evaluación ', 4, '1.3.2.3', 2, 4),
('p_2_a_1843', 377, 1843, 'Analizar resultados de los cuestionarios ', 5, '1.3.2.3.1', 2, 4),
('p_2_a_1844', 378, 1844, 'Documentar la capacitación ', 5, '1.3.2.3.2', 2, 4),
('p_2_a_1845', 379, 1845, 'Documentar las correcciones y mejoras ', 5, '1.3.2.3.3', 2, 4),
('p_2_a_1846', 380, 1846, 'Publicar resultados de las capacitaciones ', 5, '1.3.2.3.4', 2, 4),
('p_2_a_1847', 381, 1847, 'Publicar las evidencias ', 5, '1.3.2.3.5', 2, 4),
('p_2_a_1848', 382, 1848, 'Publicar contenido de las capacitaciones ', 5, '1.3.2.3.6', 2, 4),
('p_2_a_1849', 383, 1849, 'Entregar resultados ', 5, '1.3.2.3.7', 2, 4),
('p_2_a_1854', 47, 1854, 'Realizar reunión para la planeación de pruebas beta ', 5, '1.1.1.4.6', 2, 4),
('p_2_a_1855', 48, 1855, 'Realizar convocatoria de usuario finales para las pruebas beta ', 5, '1.1.1.4.7', 2, 4),
('p_2_a_1856', 49, 1856, 'Llevar a cabo las pruebas beta ', 5, '1.1.1.4.8', 2, 4),
('p_2_a_1858', 50, 1858, 'Aceptar pruebas de software ', 5, '1.1.1.4.9', 2, 4),
('p_2_a_1868', 89, 1868, 'Verificar historias de usuario ', 5, '1.1.2.4.1', 2, 4),
('p_2_a_1869', 90, 1869, 'Identificar los casos de pruebas unitarias ', 5, '1.1.2.4.2', 2, 4),
('p_2_a_1870', 91, 1870, 'Realizar las pruebas unitarias ', 5, '1.1.2.4.3', 2, 4),
('p_2_a_1871', 92, 1871, 'Realizar pruebas de aplicación ', 5, '1.1.2.4.4', 2, 4),
('p_2_a_1872', 93, 1872, 'Realizar pruebas de integración ', 5, '1.1.2.4.5', 2, 4),
('p_2_a_1873', 94, 1873, 'Realizar reunión para la planeación de pruebas beta ', 5, '1.1.2.4.6', 2, 4),
('p_2_a_1874', 95, 1874, 'Realizar convocatoria de usuario finales para las pruebas beta ', 5, '1.1.2.4.7', 2, 4),
('p_2_a_1875', 96, 1875, 'Llevar a cabo las pruebas beta ', 5, '1.1.2.4.8', 2, 4),
('p_2_a_1876', 97, 1876, 'Aceptar pruebas de software ', 5, '1.1.2.4.9', 2, 4),
('p_2_a_1896', 137, 1896, 'Verificar historias de usuario ', 5, '1.1.3.4.1', 2, 4),
('p_2_a_1897', 138, 1897, 'Identificar los casos de pruebas unitarias ', 5, '1.1.1.2', 2, 4),
('p_2_a_1898', 139, 1898, 'Realizar las pruebas unitarias ', 5, '1.1.3.4.3', 2, 4),
('p_2_a_1899', 140, 1899, 'Realizar pruebas de aplicación ', 5, '1.1.3.4.4', 2, 4),
('p_2_a_1900', 141, 1900, 'Realizar pruebas de integración ', 5, '1.1.3.4.5', 2, 4),
('p_2_a_1901', 142, 1901, 'Realizar reunión para la planeación de pruebas beta ', 5, '1.1.3.4.6', 2, 4),
('p_2_a_1902', 143, 1902, 'Realizar convocatoria de usuario finales para las pruebas beta ', 5, '1.1.3.4.7', 2, 4),
('p_2_a_1903', 144, 1903, 'Llevar a cabo las pruebas beta ', 5, '1.1.3.4.8', 2, 4),
('p_2_a_1904', 145, 1904, 'Aceptar pruebas de software ', 5, '1.1.3.4.9', 2, 4),
('p_2_a_1905', 186, 1905, 'Verificar historias de usuario ', 5, '1.1.4.4.1', 2, 4),
('p_2_a_1906', 187, 1906, 'Identificar los casos de pruebas unitarias ', 5, '1.1.4.4.2', 2, 4),
('p_2_a_1907', 188, 1907, 'Realizar las pruebas unitarias ', 5, '1.1.4.4.3', 2, 4),
('p_2_a_1908', 189, 1908, 'Realizar pruebas de aplicación ', 5, '1.1.4.4.4', 2, 4),
('p_2_a_1909', 190, 1909, 'Realizar pruebas de integración ', 5, '1.1.4.4.5', 2, 4),
('p_2_a_1910', 191, 1910, 'Realizar reunión para la planeación de pruebas beta ', 5, '1.1.4.4.6', 2, 4),
('p_2_a_1911', 192, 1911, 'Realizar convocatoria de usuario finales para las pruebas beta ', 5, '1.1.4.4.7', 2, 4),
('p_2_a_1912', 193, 1912, 'Llevar a cabo las pruebas beta ', 5, '1.1.4.4.8', 2, 4),
('p_2_a_1913', 194, 1913, 'Aceptar pruebas de software ', 5, '1.1.4.4.9', 2, 4),
('p_2_a_1915', 98, 1915, 'Aceptar módulo de trabajo, tareas y refuerzos ', 4, '1.1.2.5', 2, 4),
('p_2_a_1916', 51, 1916, 'Aceptar módulo de administración ', 4, '1.1.1.5', 2, 4),
('p_2_a_1917', 146, 1917, 'Aceptar módulo de trabajo, tareas y refuerzos ', 4, '1.1.3.5', 2, 4),
('p_2_a_1918', 195, 1918, 'Aceptar módulo de eventos y citas  ', 4, '1.1.4.5', 2, 4),
('p_2_a_1921', 212, 1921, 'Instalar aplicación  ', 4, '1.1.5.3', 2, 4),
('p_2_a_1922', 330, 1922, 'Capacitar a todos los padres de familia ', 3, '1.2.6', 2, 4),
('p_2_a_1923', 399, 1923, 'Capacitar a docentes ', 3, '1.3.4', 2, 4),
('p_2_a_1924', 516, 1924, 'Capacitar a estudiantes ', 3, '1.1.1.4', 2, 4),
('p_2_a_1925', 213, 1925, 'Entregar aplicación web ', 3, '1.1.6', 2, 4),
('p_2_a_1926', 240, 1926, 'Capacitar primer grupo de padres ', 4, '1.2.1.4', 2, 4),
('p_2_a_1927', 265, 1927, 'Capacitar segundo grupo de padres ', 4, '1.2.2.4', 2, 4),
('p_2_a_1928', 290, 1928, 'Capacitar tercer grupo de padres ', 4, '1.2.3.4', 2, 4),
('p_2_a_1929', 315, 1929, 'Capacitar cuarto grupo de padres ', 4, '1.2.4.4', 2, 4),
('p_2_a_1930', 329, 1930, 'Aplicar correcciones y mejoras de las capacitaciones de padres ', 4, '1.2.5.3', 2, 4),
('p_2_a_1931', 358, 1931, 'Capacitar primer grupo de docentes ', 4, '1.3.1.4', 2, 4),
('p_2_a_1932', 384, 1932, 'Capacitar segundo grupo de docentes ', 4, '1.3.2.4', 2, 4),
('p_2_a_1933', 398, 1933, 'Aplicar correcciones y mejoras de las capacitaciones docente ', 4, '1.3.3.3', 2, 4),
('p_2_a_1934', 426, 1934, 'Capacitar primer grupo de estudiantes ', 4, '1.4.1.4', 2, 4),
('p_2_a_1935', 451, 1935, 'Capacitar segundo grupo de estudiantes ', 4, '1.4.2.4', 2, 4),
('p_2_a_1936', 476, 1936, 'Capacitar tercer grupo de estudiantes ', 4, '1.1.1.2', 2, 4),
('p_2_a_1937', 501, 1937, 'Capacitar cuarto grupo de estudiantes ', 4, '1.4.4.4', 2, 4),
('p_2_a_1938', 515, 1938, 'Aplicar correcciones y mejoras de las capacitaciones estudiantes ', 4, '1.4.5.3', 2, 4),
('p_2_a_1942', 44, 1942, 'Realizar las pruebas unitarias ', 5, '1.1.1.4.3', 2, 4),
('p_2_a_253', 196, 253, 'SE 1.5: Transferencia tecnológica ', 3, '1.1.5', 2, 4),
('p_2_a_254', 197, 254, 'PAQ 5.1: Integración ', 4, '1.1.5.1', 2, 4),
('p_2_a_255', 203, 255, 'PAQ 5.2: Pruebas ', 4, '1.1.5.2', 2, 4),
('p_2_a_257', 208, 257, 'Realizar prueba de seguridad ', 5, '1.1.5.2.5', 2, 4),
('p_2_a_258', 209, 258, 'Realizar prueba de carga ', 5, '1.1.5.2.6', 2, 4),
('p_2_a_259', 214, 259, 'E2: Capacitación a 4300 padres de familia ', 2, '1.2', 2, 4),
('p_2_a_26', 99, 26, 'SE 1.3: Modulo de observaciones académicas y comportamentales ', 3, '1.1.3', 2, 4),
('p_2_a_260', 215, 260, 'SE 2.1: Capacitación a 1075 padres de familia ', 3, '1.2.1', 2, 4),
('p_2_a_261', 216, 261, 'PAQ 1.1: Planificación ', 4, '1.2.1.1', 2, 4),
('p_2_a_262', 217, 262, 'Desarrollar el material multimedia para la capacitación ', 5, '1.2.1.1.1', 2, 4),
('p_2_a_263', 225, 263, 'PAQ 1.2: Desarrollo ', 4, '1.2.1.2', 2, 4),
('p_2_a_264', 228, 264, 'Registrar asistencia ', 5, '1.2.1.2.3', 2, 4),
('p_2_a_265', 232, 265, 'PAQ 1.3: Evaluación ', 4, '1.2.1.3', 2, 4),
('p_2_a_266', 236, 266, 'Publicar resultados de las capacitaciones ', 5, '1.2.1.3.4', 2, 4),
('p_2_a_3', 1, 3, 'EduVirtual ', 1, '1', 2, 4),
('p_2_a_314', 198, 314, 'Desarrollar reunión para solicitar credenciales y requerimientos de conexión ', 5, '1.1.5.1.1', 2, 4),
('p_2_a_315', 199, 315, 'Cargar el software en el servidor ', 5, '1.1.5.1.2', 2, 4),
('p_2_a_316', 200, 316, 'Migrar datos del SIMAT ', 5, '1.1.5.1.3', 2, 4),
('p_2_a_317', 201, 317, 'Hacer entrega de los backups ', 5, '1.1.5.1.4', 2, 4),
('p_2_a_318', 210, 318, 'Realizar prueba de rendimiento ', 5, '1.1.5.2.7', 2, 4),
('p_2_a_319', 202, 319, 'Aceptar entrega de la aplicación ', 5, '1.1.5.1.5', 2, 4),
('p_2_a_320', 211, 320, 'Entregar resultados de pruebas  ', 5, '1.1.5.2.8', 2, 4),
('p_2_a_323', 218, 323, 'Definir logística de la capacitación ', 5, '1.2.1.1.2', 2, 4),
('p_2_a_324', 220, 324, 'Publicar la convocatoria ', 5, '1.2.1.1.4', 2, 4),
('p_2_a_326', 233, 326, 'Analizar resultados de los cuestionarios ', 5, '1.2.1.3.1', 2, 4),
('p_2_a_327', 226, 327, 'Realizar las capacitaciones ', 5, '1.2.1.2.1', 2, 4),
('p_2_a_330', 221, 330, 'Aceptar la documentación por parte de la secretaria de educación ', 5, '1.2.1.1.5', 2, 4),
('p_2_a_333', 229, 333, 'Capturar evidencias ', 5, '1.2.1.2.4', 2, 4),
('p_2_a_335', 231, 335, 'Finalizar capacitación ', 5, '1.2.1.2.6', 2, 4),
('p_2_a_336', 234, 336, 'Documentar la capacitación ', 5, '1.2.1.3.2', 2, 4),
('p_2_a_337', 237, 337, 'Publicar las evidencias ', 5, '1.2.1.3.5', 2, 4),
('p_2_a_338', 238, 338, 'Publicar contenido de las capacitaciones ', 5, '1.2.1.3.6', 2, 4),
('p_2_a_339', 239, 339, 'Entregar resultados ', 5, '1.2.1.3.7', 2, 4),
('p_2_a_342', 235, 342, 'Documentar las correcciones y mejoras ', 5, '1.2.1.3.3', 2, 4),
('p_2_a_366', 241, 366, 'SE 2.2: Capacitación a 1075 padres de familia ', 3, '1.2.2', 2, 4),
('p_2_a_394', 266, 394, 'SE 2.3: Capacitación a 1075 padres de familia ', 3, '1.2.3', 2, 4),
('p_2_a_4', 2, 4, 'E1: Aplicación web ', 2, '1.1', 2, 4),
('p_2_a_418', 291, 418, 'SE 2.4: Capacitación a 1075 padres de familia ', 3, '1.2.4', 2, 4),
('p_2_a_442', 316, 442, 'SE 2.5: Correcciones y mejoras ', 3, '1.2.5', 2, 4),
('p_2_a_443', 317, 443, 'PAQ 5.1: Planificación ', 4, '1.2.5.1', 2, 4),
('p_2_a_444', 318, 444, 'Identificar las historias de usuario defectuosas ', 5, '1.2.5.1.1', 2, 4),
('p_2_a_445', 319, 445, 'Corregir las historias de usuario defectuosas ', 5, '1.2.5.1.2', 2, 4),
('p_2_a_446', 320, 446, 'Formalizar las historias de usuario ', 5, '1.2.5.1.3', 2, 4),
('p_2_a_447', 321, 447, 'relacionar las historias de usuario ', 5, '1.2.5.1.4', 2, 4),
('p_2_a_448', 322, 448, 'Formalizar el mapa de historias de usuario ', 5, '1.2.5.1.5', 2, 4),
('p_2_a_449', 323, 449, 'PAQ 5.2: Implementación ', 4, '1.2.5.2', 2, 4),
('p_2_a_450', 324, 450, 'Corregir las interfaces de usuario ', 5, '1.2.5.2.1', 2, 4),
('p_2_a_451', 325, 451, 'Aplicar reingeniería al código fuente ', 5, '1.2.5.2.2', 2, 4),
('p_2_a_452', 326, 452, 'Unir las características del modulo ', 5, '1.2.5.2.3', 2, 4),
('p_2_a_453', 327, 453, 'Integrar el módulo al repositorio central ', 5, '1.2.5.2.4', 2, 4),
('p_2_a_454', 328, 454, 'Actualizar el documento de lecciones aprendidas ', 5, '1.2.5.2.5', 2, 4),
('p_2_a_461', 331, 461, 'E3: Capacitación a 1300 docentes ', 2, '1.3', 2, 4),
('p_2_a_5', 3, 5, 'SE 1.1: Modulo de Administración ', 3, '1.1.1', 2, 4),
('p_2_a_6', 14, 6, 'Formalizar el plan de entrega ', 5, '1.1.1.1.10', 2, 4),
('p_2_a_682', 206, 682, 'Identificar prueba de rendimiento ', 5, '1.1.5.2.3', 2, 4),
('p_2_a_683', 205, 683, 'Identificar prueba de carga ', 5, '1.1.5.2.2', 2, 4),
('p_2_a_684', 204, 684, 'Identificar pruebas de seguridad ', 5, '1.1.5.2.1', 2, 4),
('p_2_a_74', 147, 74, 'SE 1.4 : Modulo de información de reuniones, eventos y citas con los docentes ', 3, '1.1.4', 2, 4),
('p_2_a_8', 40, 8, 'Integrar el módulo al repositorio central ', 5, '1.1.1.3.9', 2, 4),
('p_2_a_84', 5, 84, 'Efectuar reunión con el patrocinador ', 5, '1.1.1.1.1', 2, 4),
('p_2_a_85', 4, 85, 'PAQ 1.1: Planificación ', 4, '1.1.1.1', 2, 4),
('p_2_a_86', 13, 86, 'Formalizar el mapa de historias de usuario ', 5, '1.1.1.1.9', 2, 4),
('p_2_a_90', 21, 90, 'Diseñar el modelo de despliegue ', 5, '1.1.1.2.6', 2, 4),
('p_2_a_91', 23, 91, 'Definir la arquitectura ', 5, '1.1.1.2.8', 2, 4),
('p_2_a_93', 15, 93, 'PAQ 1.2: Diseño ', 4, '1.1.1.2', 2, 4),
('p_2_a_99', 42, 99, 'Verificar historias de usuario ', 5, '1.1.1.4.1', 2, 4);

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
  `rbs_id` int(11) NOT NULL,
  `proyecto_linea_base` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`categoria_id`, `categoria_nombre`, `categoria_descripcion`, `categoria_default`, `categoria_uid`, `rbs_id`, `proyecto_linea_base`) VALUES
(9, 'Riesgo técnico', '', 0, 98872370386698268, 6, 0),
(10, 'Riesgo de gestión', '', 0, 98872370386698275, 6, 0),
(11, 'Riesgo comercial', '', 0, 98872370386698282, 6, 0),
(12, 'Riesgo externo', '', 0, 98872370386698289, 6, 0),
(13, 'Riesgo comercial', NULL, 1, 98872370386698296, 6, 0),
(15, 'Riesgo técnico', '', 0, 98873742091878402, 8, 4),
(16, 'Riesgo de gestión', '', 0, 98873742091878409, 8, 0),
(17, 'Riesgo comercial', '', 0, 98873742091878416, 8, 0),
(18, 'Riesgo externo', '', 0, 98873742091878423, 8, 0),
(19, 'Riesgo técnico', '', 0, 98875189428748288, 9, 0),
(20, 'Riesgo de gestión', '', 0, 98875189428748295, 9, 0),
(21, 'Riesgo comercial', '', 0, 98875189428748302, 9, 0),
(22, 'Riesgo externo', '', 0, 98875189428748309, 9, 0),
(25, 'Super categoria', 'super descripcion', 1, 98883849273999361, 30, 0),
(26, 'dsfds', 'dsfsdf', 1, 98883849273999363, 30, 0),
(27, 'Riesgo técnico', '', 2, 98883849273999366, 30, 0),
(28, 'Riesgo técnico', '', 0, 98883849273999369, 31, 0),
(29, 'Riesgo de gestión', '', 0, 98883849273999376, 31, 0),
(30, 'Riesgo comercial', '', 0, 98883849273999383, 31, 0),
(31, 'Riesgo externo', '', 0, 98883849273999390, 31, 0),
(34, 'Riesgo técnico', '', 0, 98889951147458560, 32, 0),
(35, 'Riesgo de gestión', '', 0, 98889951147458567, 32, 0),
(36, 'Riesgo comercial', '', 0, 98889951147458574, 32, 0),
(37, 'Riesgo externo', '', 0, 98889951147458581, 32, 0),
(38, 'Riesgo técnico', '', 0, 98895409027481601, 33, 0),
(39, 'Riesgo de gestión', '', 0, 98895409027481608, 33, 0),
(40, 'Riesgo comercial', '', 0, 98895409027481615, 33, 0),
(41, 'Riesgo externo', '', 0, 98895409027481622, 33, 0),
(42, 'Riesgo técnico', '', 2, 98913166502658048, 34, 0),
(43, 'Riesgo comercial', '', 2, 98913166502658053, 34, 0);

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
-- Estructura de tabla para la tabla `clasificacion_riesgo`
--

CREATE TABLE `clasificacion_riesgo` (
  `clasificacion_riesgo_id` int(11) NOT NULL,
  `clasificacion_riesgo_nombre` varchar(70) NOT NULL,
  `clasificacion_riesgo_min` int(11) NOT NULL,
  `clasificacion_riesgo_max` int(11) NOT NULL,
  `clasificacion_color` varchar(45) NOT NULL,
  `proyecto_id` int(11) NOT NULL,
  `proyecto_linea_base` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `clasificacion_riesgo`
--

INSERT INTO `clasificacion_riesgo` (`clasificacion_riesgo_id`, `clasificacion_riesgo_nombre`, `clasificacion_riesgo_min`, `clasificacion_riesgo_max`, `clasificacion_color`, `proyecto_id`, `proyecto_linea_base`) VALUES
(9, 'Bajo', 1, 4, '#138d75', 15, 0),
(10, 'sdsd', 5, 7, '#bf04da', 15, 0),
(11, 'Alto', 12, 25, '#cd5c5c', 15, 0),
(12, 'sdfsd', 4, 5, '#c73327', 15, 0),
(13, 'sdfsd', 5, 2, '#294764', 15, 0),
(14, 'dsfdsf', 2, 4, '#6e8ebc', 15, 0),
(33, 'Bajo', 1, 4, '#8d1364', 17, 0),
(34, 'Moderado', 5, 11, '#10cad6', 17, 0),
(35, 'Alto', 12, 25, '#cdc85c', 17, 0),
(36, 'ss', 26, 34, '#f144a6', 17, 0),
(37, 'gg', 35, 36, '#80e36c', 17, 0),
(38, 'hh', 38, 40, '#e7c096', 17, 0),
(42, 'Bajo', 1, 4, '#138d75', 18, 0),
(43, 'Moderado', 5, 11, '#d68910', 18, 0),
(44, 'Alto', 12, 25, '#cd5c5c', 18, 0),
(45, 'guilo', 26, 28, '#88ecee', 18, 0),
(46, 'Bajo', 1, 4, '#138D75', 19, 0),
(47, 'Moderado', 5, 11, '#D68910', 19, 0),
(48, 'Alto', 12, 25, '#CD5C5C', 19, 0),
(49, 'Bajo', 1, 4, '#138D75', 20, 0),
(50, 'Moderado', 5, 11, '#D68910', 20, 0),
(51, 'Alto', 12, 25, '#CD5C5C', 20, 0);

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
  `pais_id` int(11) NOT NULL,
  `proyecto_linea_base` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `gerente`
--

INSERT INTO `gerente` (`gerente_id`, `gerente_nombre`, `gerente_usuario`, `gerente_correo`, `gerente_fecha_creacion`, `gerente_correo_institucional`, `gerente_profesion`, `gerente_empresa`, `gerente_metodologias`, `gerente_certificaciones`, `sector_id`, `pais_id`, `proyecto_linea_base`) VALUES
(24, NULL, 'user', NULL, '2020-08-24 12:10:16', NULL, NULL, NULL, NULL, NULL, 12, 44, 0),
(28, 'Diego Villa', 'ppp', 'pppq@fdf.com', NULL, NULL, 'ppp', 'ppp', NULL, NULL, 10, 17, 4),
(29, 'nnn', 'nnn', 'nnn@nnn.com', NULL, NULL, 'nnnn', 'nnn', NULL, NULL, 9, 15, 0),
(31, 'rrr', 'rrr', 'rr@rr.com', NULL, NULL, 'rr', 'rr', NULL, NULL, 9, 9, 0),
(32, 'www', 'www', 'ww@ww.com', NULL, NULL, 'ww', 'ww', NULL, NULL, 9, 16, 0),
(33, 'user_civil', 'user_civil', 'user_civil@correo.com', NULL, NULL, 'user_civil', 'user_civil', NULL, NULL, 14, 18, 0),
(34, 'qqq', 'qqq', 'qqq@correo.com', NULL, NULL, 'qqq', 'qqq', NULL, NULL, 9, 5, 0),
(35, 'ewe', 'ewe', 'ewe@gmail.com', NULL, NULL, 'ewe', 'ewe', NULL, NULL, 15, 10, 0),
(36, 'Diego', 'diegok', 'skdiegomxtr@gmail.com', NULL, NULL, 'ingen', 'ufos', NULL, NULL, 9, 18, 0),
(37, 'Alirio Villa', 'userw', 'user@correo.w', NULL, NULL, 'cantante', 'userw', NULL, NULL, 9, 14, 0);

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
-- Estructura de tabla para la tabla `impacto`
--

CREATE TABLE `impacto` (
  `impacto_id` int(11) NOT NULL,
  `impacto_categoria` varchar(70) NOT NULL,
  `impacto_valor` int(11) NOT NULL,
  `proyecto_id` int(11) NOT NULL,
  `proyecto_linea_base` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `impacto`
--

INSERT INTO `impacto` (`impacto_id`, `impacto_categoria`, `impacto_valor`, `proyecto_id`, `proyecto_linea_base`) VALUES
(1, 'Catastrófico', 5, 2, 4),
(2, 'Mayor', 6, 2, 4),
(3, 'Moderado', 3, 2, 4),
(4, 'Menor', 2, 2, 4),
(5, 'Insignificante', 1, 2, 4),
(40, 'a', 1, 15, 0),
(41, 'b', 2, 15, 0),
(42, 'c', 3, 15, 0),
(43, 'd', 4, 15, 0),
(49, 'Insignificante', 1, 17, 0),
(50, 'Menor', 2, 17, 0),
(51, 'Moderado', 3, 17, 0),
(52, 'Mayor', 6, 17, 0),
(53, 'ss', 6, 17, 0),
(54, 'ssyh', 8, 17, 0),
(82, 'Insignificante', 1, 18, 0),
(83, 'Menor', 2, 18, 0),
(84, 'Moderado', 3, 18, 0),
(85, 'Mayor', 4, 18, 0),
(86, 'Catastrófico', 5, 19, 0),
(87, 'Mayor', 4, 19, 0),
(88, 'Moderado', 3, 19, 0),
(89, 'Menor', 2, 19, 0),
(90, 'Insignificante', 1, 19, 0),
(91, 'Catastrófico', 5, 20, 0),
(92, 'Mayor', 4, 20, 0),
(93, 'Moderado', 3, 20, 0),
(94, 'Menor', 2, 20, 0),
(95, 'Insignificante', 1, 20, 0);

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
-- Estructura de tabla para la tabla `propabilidad`
--

CREATE TABLE `propabilidad` (
  `propabilidad_id` int(11) NOT NULL,
  `propabilidad_categoria` varchar(70) NOT NULL,
  `propabilidad_valor` int(11) NOT NULL,
  `proyecto_id` int(11) NOT NULL,
  `proyecto_linea_base` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `propabilidad`
--

INSERT INTO `propabilidad` (`propabilidad_id`, `propabilidad_categoria`, `propabilidad_valor`, `proyecto_id`, `proyecto_linea_base`) VALUES
(1, 'Certeza', 5, 2, 4),
(2, 'Probable', 4, 2, 4),
(3, 'Moderada', 3, 2, 4),
(4, 'improbable', 2, 2, 4),
(5, 'raro', 1, 2, 4),
(19, 'bb', 2, 15, 0),
(20, 'cc', 2, 15, 0),
(21, 'dd', 2, 15, 0),
(27, 'raro', 1, 17, 0),
(28, 'improbable', 2, 17, 0),
(29, 'Moderada', 3, 17, 0),
(30, 'Probable', 4, 17, 0),
(31, 'Certeza', 5, 17, 0),
(32, 'Kilometro', 6, 17, 0),
(56, 'jj', 1, 18, 0),
(57, 'improbable', 2, 18, 0),
(58, 'kilo', 4, 18, 0),
(59, 'rte', 7, 18, 0),
(60, 'Certeza', 5, 19, 0),
(61, 'Probable', 4, 19, 0),
(62, 'Moderada', 3, 19, 0),
(63, 'improbable', 2, 19, 0),
(64, 'raro', 1, 19, 0),
(65, 'Certeza', 5, 20, 0),
(66, 'Probable', 4, 20, 0),
(67, 'Moderada', 3, 20, 0),
(68, 'improbable', 2, 20, 0),
(69, 'raro', 1, 20, 0);

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
  `proyecto_fin_status` tinyint(4) NOT NULL DEFAULT 0,
  `gerente_id` int(11) NOT NULL,
  `sector_id` int(11) NOT NULL,
  `proyecto_linea_base` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proyecto`
--

INSERT INTO `proyecto` (`proyecto_id`, `proyecto_nombre`, `proyecto_objetivo`, `proyecto_alcance`, `proyecto_descripcion`, `proyecto_presupuesto`, `proyecto_fecha_inicio`, `proyecto_fecha_finl`, `proyecto_evaluacion_general`, `proyecto_evaluacion`, `proyecto_rbs_status`, `proyecto_fin_status`, `gerente_id`, `sector_id`, `proyecto_linea_base`) VALUES
(2, 'Proyecto test', 'Modificar las pesos de venta', 'adsfsd', 'Subieron los maslo', 333334, '2020-08-27', NULL, NULL, NULL, 0, 0, 28, 9, 4),
(4, 'nuevopp', 'dsgdg', NULL, NULL, NULL, '0000-00-00', NULL, NULL, NULL, 0, 0, 28, 9, 0),
(6, 'Proyecto nuevo', 'dfgdg', 'dfgdfg', 'fdgdfg', 566666, '2020-09-25', NULL, NULL, NULL, 0, 0, 33, 9, 0),
(7, 'qqq', 'qqq', 'qqq', 'qqq', 2222, '2020-09-30', NULL, NULL, NULL, 0, 0, 34, 9, 0),
(8, 'dsfsdf', 'fgdfg', 'fdgdfg', 'fdgdf', 435435, '2020-09-25', NULL, NULL, NULL, 0, 0, 28, 9, 0),
(9, 'qqq', 'erfdsf', 'sdfsdf', 'dsfsdf', 24324, '2020-09-16', NULL, NULL, NULL, 0, 0, 28, 9, 0),
(10, 'test_activi', 'dsfdf', 'dsfdsf', 'dsfsdf', 32434, '2020-09-09', NULL, NULL, NULL, 0, 0, 28, 9, 0),
(11, 'test_fin', 'dfsd', 'fsdfsdf', 'fsdfsd', 343443, '2020-09-17', NULL, NULL, NULL, 0, 1, 28, 9, 0),
(12, 'FIN', 'dsf', 'dfsdf', 'dsfds', 444, '2020-09-25', NULL, NULL, NULL, 0, 1, 28, 9, 0),
(13, 'FIN_2', 'sdfsdf', 'dsfsdf', 'sdfsdf', 333, '2020-09-15', NULL, NULL, NULL, 0, 0, 28, 9, 0),
(14, 'FIN_3', 'dsfds', 'sdfsfd', 'sdfds', 324234, '2020-09-16', NULL, NULL, NULL, 0, 0, 28, 9, 0),
(15, 'FIN_4', 'dsfsd', 'sdfsd', 'dsfsdf', 32423, '2020-09-30', NULL, NULL, NULL, 0, 0, 28, 9, 0),
(16, 'Proyecto test', 'probar', 'probar', 'probar', 50000, '2020-09-14', NULL, NULL, NULL, 0, 0, 31, 9, 0),
(17, 'Atributos', 'sddsd', 'sdsd', 'sdsd', 2323, '2020-09-24', NULL, NULL, NULL, 0, 0, 28, 9, 0),
(18, 'defin', 'edsfds', 'dsfsdf', 'dsfsd', 3333, '2020-09-25', NULL, NULL, NULL, 0, 0, 28, 9, 0),
(19, 'prueba', 'hhh', 'hhh', 'hhh', 50000, '2020-09-24', NULL, NULL, NULL, 0, 0, 28, 9, 0),
(20, 'proyecto_test', 'operativo', 'francia', 'der', 50000, '2020-09-16', NULL, NULL, NULL, 0, 0, 37, 9, 0);

--
-- Disparadores `proyecto`
--
DELIMITER $$
CREATE TRIGGER `Agregar categorías del riesgo a proyecto` AFTER INSERT ON `proyecto` FOR EACH ROW INSERT INTO `clasificacion_riesgo`(`clasificacion_riesgo_nombre`, `clasificacion_riesgo_min`, `clasificacion_riesgo_max`, `clasificacion_color`, `proyecto_id`) VALUES ("Bajo", 1 , 4,'#138D75',NEW.proyecto_id),
("Moderado", 5, 11,'#D68910',NEW.proyecto_id),("Alto", 12, 25,'#CD5C5C',NEW.proyecto_id)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Agregar impactos por defecto` AFTER INSERT ON `proyecto` FOR EACH ROW INSERT INTO `impacto`(`impacto_categoria`, `impacto_valor`, `proyecto_id`) 
VALUES ('Catastrófico',5,NEW.proyecto_id),('Mayor',4,NEW.proyecto_id),('Moderado',3,NEW.proyecto_id),('Menor',2,NEW.proyecto_id),('Insignificante',1,NEW.proyecto_id)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Agregar probabilidad por defecto` AFTER INSERT ON `proyecto` FOR EACH ROW INSERT INTO `propabilidad`(`propabilidad_categoria`, `propabilidad_valor`, `proyecto_id`) VALUES ('Certeza',5,NEW.proyecto_id),('Probable',4,NEW.proyecto_id),('Moderada',3,NEW.proyecto_id),('improbable',2,NEW.proyecto_id),('raro',1,NEW.proyecto_id)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto_has_riesgo`
--

CREATE TABLE `proyecto_has_riesgo` (
  `proyecto_has_riesgo_id` int(11) NOT NULL,
  `proyecto_id` int(11) NOT NULL,
  `riesgo_id` int(11) NOT NULL,
  `is_editado` int(11) NOT NULL DEFAULT 0,
  `responsable_id` int(11) DEFAULT NULL,
  `impacto_id` int(11) DEFAULT NULL,
  `propabilidad_id` int(11) DEFAULT NULL,
  `fecha_manifestacion` datetime DEFAULT NULL,
  `proyecto_linea_base` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proyecto_has_riesgo`
--

INSERT INTO `proyecto_has_riesgo` (`proyecto_has_riesgo_id`, `proyecto_id`, `riesgo_id`, `is_editado`, `responsable_id`, `impacto_id`, `propabilidad_id`, `fecha_manifestacion`, `proyecto_linea_base`) VALUES
(6, 2, 22, 0, 7, NULL, NULL, NULL, 4),
(19, 2, 5, 0, 7, NULL, NULL, NULL, 4),
(20, 2, 25, 0, 7, NULL, NULL, NULL, 4),
(21, 2, 26, 0, 7, NULL, NULL, NULL, 4),
(25, 2, 30, 0, 7, NULL, NULL, NULL, 4),
(28, 2, 31, 0, 7, NULL, NULL, NULL, 4),
(30, 4, 22, 0, NULL, NULL, NULL, NULL, 0),
(31, 6, 33, 0, NULL, NULL, NULL, NULL, 0),
(37, 7, 36, 0, NULL, NULL, NULL, NULL, 0),
(38, 7, 39, 0, NULL, NULL, NULL, NULL, 0),
(40, 2, 4, 1, 7, NULL, NULL, NULL, 4),
(42, 2, 24, 1, 7, NULL, NULL, NULL, 4),
(44, 2, 29, 1, 7, NULL, NULL, NULL, 4),
(45, 2, 32, 1, 7, NULL, NULL, NULL, 4),
(46, 2, 47, 0, 7, NULL, NULL, NULL, 4),
(47, 2, 48, 0, 7, NULL, NULL, NULL, 4),
(48, 2, 49, 0, 7, NULL, NULL, NULL, 4),
(50, 2, 50, 1, 7, NULL, NULL, NULL, 4),
(51, 2, 51, 0, 7, NULL, NULL, NULL, 4),
(52, 2, 53, 1, 7, NULL, NULL, NULL, 4),
(54, 2, 55, 0, 7, NULL, NULL, NULL, 4),
(55, 2, 56, 1, 7, NULL, NULL, NULL, 4),
(56, 2, 3, 0, 7, NULL, NULL, NULL, 4),
(57, 16, 57, 1, NULL, NULL, NULL, NULL, 0),
(58, 16, 58, 1, NULL, NULL, NULL, NULL, 0),
(59, 2, 6, 0, 7, NULL, NULL, NULL, 4),
(60, 2, 7, 0, 7, NULL, NULL, NULL, 4),
(61, 2, 8, 0, 7, NULL, NULL, NULL, 4),
(62, 2, 59, 0, 7, NULL, NULL, NULL, 4),
(63, 2, 21, 0, 7, NULL, NULL, NULL, 4),
(64, 2, 54, 0, 7, NULL, NULL, NULL, 4),
(65, 2, 28, 0, 7, NULL, NULL, NULL, 4),
(66, 2, 63, 0, 7, NULL, NULL, NULL, 4),
(68, 17, 22, 0, NULL, 52, 29, NULL, 0),
(69, 17, 28, 0, 3, 52, 32, NULL, 0),
(72, 17, 4, 0, NULL, 50, 28, NULL, 0),
(73, 17, 64, 0, NULL, 49, 27, NULL, 0),
(76, 13, 65, 1, NULL, NULL, NULL, NULL, 0),
(78, 13, 66, 1, NULL, NULL, NULL, NULL, 0),
(79, 9, 22, 0, NULL, NULL, NULL, NULL, 0),
(80, 18, 10, 0, NULL, 82, 56, NULL, 0),
(81, 19, 3, 0, NULL, 88, 62, NULL, 0),
(82, 19, 5, 0, NULL, 90, 64, NULL, 0),
(83, 19, 6, 0, NULL, 86, 62, NULL, 0),
(86, 20, 67, 0, 4, 93, 67, NULL, 0),
(87, 20, 68, 0, NULL, 92, 67, NULL, 0);

--
-- Disparadores `proyecto_has_riesgo`
--
DELIMITER $$
CREATE TRIGGER `Agregar impacto por defecto al riesgo del proyecto` BEFORE INSERT ON `proyecto_has_riesgo` FOR EACH ROW SET NEW.impacto_id = (SELECT i.impacto_id FROM impacto i WHERE i.proyecto_id = NEW.proyecto_id ORDER BY i.impacto_valor ASC LIMIT 1)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Agregar propabilidad al riesgo del proyecto` BEFORE INSERT ON `proyecto_has_riesgo` FOR EACH ROW SET NEW.propabilidad_id = (SELECT p.propabilidad_id FROM propabilidad p WHERE p.proyecto_id = NEW.proyecto_id ORDER BY p.propabilidad_valor ASC LIMIT 1)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto_has_riesgo_actividad`
--

CREATE TABLE `proyecto_has_riesgo_actividad` (
  `proyecto_has_riesgo_actividad_id` int(11) NOT NULL,
  `proyecto_has_riesgo_id` int(11) NOT NULL,
  `actividad_id` varchar(45) NOT NULL,
  `proyecto_linea_base` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proyecto_has_riesgo_actividad`
--

INSERT INTO `proyecto_has_riesgo_actividad` (`proyecto_has_riesgo_actividad_id`, `proyecto_has_riesgo_id`, `actividad_id`, `proyecto_linea_base`) VALUES
(2, 56, 'p_2_a_140', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto_has_riesgo_respuesta`
--

CREATE TABLE `proyecto_has_riesgo_respuesta` (
  `proyecto_has_id` int(11) NOT NULL,
  `respuesta_has_id` int(11) NOT NULL,
  `tipo_respuesta` varchar(30) NOT NULL,
  `proyecto_linea_base` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proyecto_has_riesgo_respuesta`
--

INSERT INTO `proyecto_has_riesgo_respuesta` (`proyecto_has_id`, `respuesta_has_id`, `tipo_respuesta`, `proyecto_linea_base`) VALUES
(19, 32, '', 4),
(37, 4, '', 0),
(37, 8, '', 0),
(37, 9, '', 0),
(37, 10, '', 0),
(37, 11, '', 0),
(37, 12, '', 0),
(37, 13, '', 0),
(40, 30, '', 4),
(40, 31, '', 4),
(56, 33, '', 4),
(68, 35, '', 0),
(69, 34, '', 0),
(73, 36, '', 0),
(73, 37, '', 0),
(76, 42, '', 0),
(81, 45, '', 0),
(82, 44, '', 0),
(86, 46, '', 0),
(86, 47, '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rbs`
--

CREATE TABLE `rbs` (
  `rbs_id` int(11) NOT NULL,
  `rbs_default` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Permite saber si se eligio la rbs por defecto del pmbok o se decidio por otra opcion.',
  `gerente_id` int(11) NOT NULL,
  `proyecto_linea_base` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `rbs`
--

INSERT INTO `rbs` (`rbs_id`, `rbs_default`, `gerente_id`, `proyecto_linea_base`) VALUES
(6, 0, 24, 0),
(8, 0, 28, 4),
(9, 0, 29, 0),
(30, 1, 33, 0),
(31, 0, 34, 0),
(32, 0, 31, 0),
(33, 0, 35, 0),
(34, 2, 37, 0);

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
  `tipo_recurso_id` int(11) NOT NULL,
  `proyecto_linea_base` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `recurso`
--

INSERT INTO `recurso` (`recurso_id`, `recurso_nombre`, `recurso_costo`, `proyecto_id`, `tipo_recurso_id`, `proyecto_linea_base`) VALUES
(2, 'Ejercito otomano', 9888, 17, 5, 0),
(3, 'Espadas de ideales', 5000, 17, 7, 0),
(4, 'Comptadores', 520000, 13, 7, 0),
(5, 'Ejercito espartano', 34334, 13, 8, 0),
(6, 'mascarillas', 5656, 13, 9, 0),
(7, 'Recurso1', 5000, 19, 7, 0),
(8, 'recurso 2', 5000, 19, 7, 0),
(9, 'Electricista', 65000, 20, 32, 0),
(10, 'Operador', 69000, 20, 33, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `responsble`
--

CREATE TABLE `responsble` (
  `responsable_id` int(11) NOT NULL,
  `responsble_nombre` varchar(100) NOT NULL,
  `responsble_descripcion` tinytext DEFAULT NULL,
  `proyecto_id` int(11) NOT NULL,
  `rol_id` int(11) NOT NULL,
  `proyecto_linea_base` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `responsble`
--

INSERT INTO `responsble` (`responsable_id`, `responsble_nombre`, `responsble_descripcion`, `proyecto_id`, `rol_id`, `proyecto_linea_base`) VALUES
(3, 'Don comedia', 'Viene a matarnos de la risa.', 17, 1, 0),
(4, 'Gerardo Buenavidez', 'Diferenciador', 20, 2, 0),
(5, 'kilometraje', 'huilense', 20, 2, 0),
(6, 'plablo', 'pinguino que trae zapatos', 20, 2, 0),
(7, 'BUG', 'bbbbb', 2, 1, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuesta`
--

CREATE TABLE `respuesta` (
  `respuesta_id` int(11) NOT NULL,
  `respuesta_nombre` varchar(45) DEFAULT NULL,
  `respuesta_descripcion` tinytext DEFAULT NULL,
  `respuesta_costo` float DEFAULT 0,
  `proyecto_linea_base` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `respuesta`
--

INSERT INTO `respuesta` (`respuesta_id`, `respuesta_nombre`, `respuesta_descripcion`, `respuesta_costo`, `proyecto_linea_base`) VALUES
(1, 'respuesta a', 'sd', NULL, 0),
(2, 'respuesta b', 'as', NULL, 0),
(3, 'respuesta a', 'as', NULL, 0),
(4, 'respuesta b', 'sd', NULL, 4),
(5, 'ss', 'sdsd', NULL, 0),
(6, 'asda', 'sda', NULL, 0),
(7, 'sdfd', 'sdfsd', NULL, 0),
(8, 'sad', 'dsda', NULL, 0),
(9, 'sdfsdf', 'dsfsd', NULL, 0),
(10, 'jljl', 'jkljl', NULL, 0),
(11, 'dsada', 'asda', NULL, 4),
(12, 'sdfsd', 'sdfs', NULL, 0),
(13, 'asdasd', 'sada', NULL, 0),
(14, 'asdasd', 'sada', NULL, 0),
(15, 'hjkjhk', 'jhkhjk', NULL, 0),
(16, 'fsdfds', 'dsfsdf', NULL, 0),
(17, '', '', NULL, 0),
(18, 'Aliviar la presion social del regimen libano', 'XD', NULL, 0),
(19, 'Aliviar la presion social del regimen libano', 'XD', NULL, 0),
(20, 'Nuevo ataque al pentagono', 'XD', NULL, 0),
(21, 'Nuevo ataque al pentagono', 'XD', NULL, 0),
(22, 'Nuevo ataque al pentagono', 'XD', NULL, 0),
(23, 'Aliviar la presion social del regimen libano', 'XD', NULL, 0),
(24, 'Aliviar la presion social del regimen libano', 'XD', NULL, 0),
(25, 'Aliviar la presion social del regimen libano', 'XD', NULL, 0),
(26, 'Aliviar la presion social del regimen libano', 'XD', NULL, 0),
(27, 'Aliviar la presion social del regimen libano', 'XD', NULL, 0),
(28, 'Aliviar la presion social del regimen libano', 'XD', NULL, 0),
(29, 'sdfsd', 'sdfd', NULL, 4),
(30, 'sdfsd', 'sdfd', NULL, 4),
(31, 'responder por la bendicion', 'pagar pañales y demás cosas', NULL, 4),
(32, 'gre', 'frr', NULL, 4),
(33, 'gre', 'frr', NULL, 4),
(34, 'gre', 'frr', NULL, 4),
(35, 'gre', 'frr', NULL, 4),
(36, 'gre', 'frr', NULL, 4),
(37, 'gre', 'frr', NULL, 4),
(38, 'gre', 'frr', NULL, 4),
(39, 'gre', 'frr', NULL, 4),
(40, 'gre', 'frr', NULL, 4),
(41, 'repuesta uno', 'varias vidas', NULL, 4),
(42, 'posibles', 'dfsfdsf', NULL, 4),
(43, 'posibles', 'dfsfdsf', NULL, 4),
(44, 'posibles', 'dfsfdsf', NULL, 4),
(45, 'Repuesta franca', 'no sirve para nada, ! OJO Y LA VARIABRE REsPUESTA_PRECIO!\r\n', NULL, 4),
(46, 'Repuesta franca', 'no sirve para nada, ! OJO Y LA VARIABRE REsPUESTA_PRECIO!\r\n', NULL, 4),
(47, 'REspuesat sorpresa', 'sin sorpresa\r\n', NULL, 4),
(48, 'res', 'dddd', NULL, 4),
(49, 'sdfsdf', 'dsfsdfsd', NULL, 4),
(50, 'fghgf', 'fghfh', NULL, 4),
(51, 'Accion prueba _ 2', 'llll', NULL, 0),
(52, 'Accion prueba _ 1', 'llll', NULL, 0),
(53, 'hhh', 'hgghg', NULL, 0),
(54, 'Accion prueba _ 1', 'llll', NULL, 0),
(55, 'Accion prueba _ 2', 'llll', NULL, 0),
(56, 'Accion prueba _ 1', 'llll', NULL, 0),
(57, 'Accion prueba _ 2', 'llll', NULL, 0),
(58, 'Accion prueba _ 1', 'llll', NULL, 0),
(59, 'Respuesta prueba', 'ddd', NULL, 4),
(60, 'lll', 'ss', NULL, 4),
(61, 'Dibujar una sonrisa', '', NULL, 0),
(62, 'Establecer nuevas marcas', 'Crear una moda\r\n', NULL, 0);

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
  `riesgo_uid` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_categoria_id` int(11) NOT NULL,
  `proyecto_linea_base` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `riesgo`
--

INSERT INTO `riesgo` (`riesgo_id`, `riesgo_nombre`, `riesgo_causa`, `riesgo_evento`, `riesgo_efecto`, `riesgo_tipo`, `riesgo_prom_evaluacion`, `riesgo_uid`, `sub_categoria_id`, `proyecto_linea_base`) VALUES
(2, '', '', '', '', 0, NULL, 98875189428748316, 77, 0),
(3, '  Nuevo riesgo extrasss', 'razones desconicidas', '  acciones catastroficas', '  destruccion de la ciudad', 0, NULL, 98875189428748317, 74, 4),
(4, 'wwwww', 'razones desconicidas', ' acciones catastroficas', ' destruccion de la ciudad', 0, NULL, 98875189428748318, 74, 4),
(5, 'Nuevo riesgo', 'razones desconicidas', 'acciones catastroficas', 'destruccion de la ciudad', 0, NULL, 98875189428748319, 74, 4),
(6, 'test', 'dsf', ' dsfds', ' dsfsdf', 0, NULL, 98875189428748320, 74, 4),
(7, 'dsf', 'dsf', 'dsfds', 'dsfsdf', 0, NULL, 98875189428748321, 74, 4),
(8, 'dsf', 'dsf', 'dsfds', 'dsfsdf', 0, NULL, 98875189428748322, 74, 4),
(9, 'sdfds', 'sdcsd', 'ddscd', 'dcsd', 0, NULL, 98875189428748323, 74, 0),
(10, 'dgf', 'fdgdf', 'fdgdf', 'gfd', 0, NULL, 98875189428748324, 74, 0),
(11, 'dgf', 'fdgdf', 'fdgdf', 'gfd', 0, NULL, 98875189428748325, 74, 0),
(12, 'dgf', 'fdgdf', 'fdgdf', 'gfd', 0, NULL, 98875189428748326, 74, 0),
(13, 'dgf', 'fdgdf', 'fdgdf', 'gfd', 0, NULL, 98875189428748327, 74, 0),
(14, 'dgf', 'fdgdf', 'fdgdf', 'gfd', 0, NULL, 98875189428748328, 74, 0),
(15, 'sdfsdf', 'sdfsdf', 'dsfsdf', 'sdfsf', 0, NULL, 98875189428748329, 76, 0),
(16, 'sdfsdf', 'sdfsdf', 'dsfsdf', 'sdfsf', 0, NULL, 98875189428748330, 76, 0),
(17, 'sdfsdf', 'sdfsdf', 'dsfsdf', 'sdfsf', 0, NULL, 98875189428748331, 76, 0),
(18, 'asdad', 'sadas', 'asdasd', 'adasd', 0, NULL, 98875189428748332, 74, 0),
(19, 'sfsdf', 'sdfsf', 'sdfsdf', '', 0, NULL, 98875189428748333, 74, 0),
(20, 'sfsdf', 'sdfsf', 'sdfsdf', '', 0, NULL, 98875189428748334, 74, 0),
(21, 'dsfsdf', 'sdfs', 'sdf', 'dsf', 0, NULL, 98876683959926784, 75, 4),
(22, 'dsfsdf', 'sdfs', 'sdf', 'dsf', 0, NULL, 98876683959926785, 75, 4),
(23, 'fdgdfg', 'dfgdf', 'dfgdfg', 'dfgdfg', 0, NULL, 98876683959926786, 74, 0),
(24, 'dsfd', 'dfdf', 'dfgd', 'dfgdfg', 0, NULL, 98877097719627776, 74, 4),
(25, '¡ por favor, que funcione ! :(', 'sdfds', 'dsfdsf', 'sdfds', 0, NULL, 98879902534598656, 74, 4),
(26, '¡ por favor, que funcione ! :(', 'sdfds', 'dsfdsf', 'sdfds', 0, NULL, 98879902534598657, 74, 4),
(27, 'hhhhh', 'hhh', 'hh', '', 0, NULL, 98879902534598658, 76, 0),
(28, 'dfdfv', 'dfdf', '', '', 0, NULL, 98879902534598659, 75, 4),
(29, 'SIPER', 'dfdf', ' ', ' ', 0, NULL, 98879902534598660, 74, 4),
(30, 'Super RIesgo 2', '', '', '', 0, NULL, 98879902534598661, 74, 4),
(31, 'riesgottttt', 'sdfsdf', 'dsfsdf', 'dsf', 0, NULL, 98881319102054400, 74, 4),
(32, 'fsdf', 'sdfs', 'dsfsdf', 'sdf', 0, NULL, 98881319102054401, 74, 4),
(33, 'Nuevo riesgo', '', '', '', 0, NULL, 98883849273999368, 130, 0),
(36, 'Nuevo riesgo', '', '', '', 0, NULL, 98883849273999406, 131, 0),
(37, 'Nuevo riesgo', '', '', '', 0, NULL, 98883849273999407, 131, 0),
(38, 'Nuevo riesgo', '', '', '', 0, NULL, 98883849273999408, 131, 0),
(39, '¡ por favor, que funcione ! :(', '', '', '', 0, NULL, 98883849273999409, 131, 0),
(40, ' Nuevo riesgo Extra', 'razones desconicidas', ' acciones catastroficas', ' destruccion de la ciudad', 0, NULL, 98885402156335104, 74, 0),
(41, 'wwwww', 'razones desconicidas', ' acciones catastroficas', ' destruccion de la ciudad', 0, NULL, 98885402156335105, 74, 0),
(42, ' dsfsdfsdf', 'dsf', ' dsfds', ' dsfsdf', 0, NULL, 98885402156335106, 74, 0),
(43, 'test', 'dfdf', ' dfgd', ' dfgdfg', 0, NULL, 98885402156335107, 74, 0),
(44, ' soplar botellas', 'sdfsdf', ' dsfsdf', ' sdfsf', 0, NULL, 98885402156335108, 76, 0),
(45, 'SIPER', 'dfdf', ' ', ' ', 0, NULL, 98885402156335109, 74, 0),
(46, 'NUEV 1', 'sdfs', ' dsfsdf', ' sdf', 0, NULL, 98885402156335110, 74, 0),
(47, 'sdfsdf', '', '', '', 0, NULL, 98885402156335111, 75, 4),
(48, 'riesgo 0', '', '', '', 0, NULL, 98885402156335112, 74, 4),
(49, 'riesgo00', '', '', '', 0, NULL, 98885402156335113, 74, 4),
(50, ' RIesgo1', 'desafortunadas', ' catastrofico', ' terrible', 0, NULL, 98885402156335114, 74, 4),
(51, ' RIesgo1', 'desafortunadas', ' catastrofico', ' terrible', 0, NULL, 98885402156335115, 74, 4),
(52, ' FINAL TEST', 'hhh', ' hh', ' PASAR DE NIVEL', 0, NULL, 98885402156335116, 76, 0),
(53, ' TEST FINAL', 'dfdf', ' ', ' ganar', 0, NULL, 98885402156335117, 75, 4),
(54, 'JEFE FINAL', 'UN MALO', 'DESTRUCION', 'CAOS Y MISERIA EN TODO EL MUNDO', 0, NULL, 98885402156335118, 75, 4),
(55, 'JEFE ', 'dsfsd', 'sdfsdf', 'dsfsdf', 0, NULL, 98885402156335119, 75, 4),
(56, ' JEFE FINAL _Caido', 'UN MALO', ' DESTRUCION', ' CAOS Y MISERIA EN TODO EL MUNDO', 0, NULL, 98885402156335120, 75, 4),
(57, '  Nuevo riesgo extrasss', '', '', '', 0, NULL, 98889951147458588, 157, 0),
(58, ' JEFE FINAL _Caido', '', '', '', 0, NULL, 98889951147458589, 158, 0),
(59, 'riesgo 8 septiemve', 'sdf', 'dsfds', 'fsdf', 0, NULL, 98894425144426496, 75, 4),
(60, 'sdfsdf', 'proro', 'dekldls', 'sdfdsf', 0, NULL, 98894425144426497, 95, 0),
(61, 'riesgo novedoso', 'dfds', 'sdfsd', 'fsdf', 0, NULL, 98894425144426498, 74, 0),
(62, 'novedosox3', 'sdf', 'sdfsd', 'dsfsdf', 0, NULL, 98894425144426499, 77, 0),
(63, 'riesgo nuevo ', 'ddd', 'dd', 'dd', 0, NULL, 98895409027481600, 78, 4),
(64, 'probar acciones', 'aaa', 'aa', 'aaa', 0, NULL, 98906083078176768, 86, 0),
(65, 'probar acciones', 'liop', ' aa´sdfsd', ' aaa', 0, NULL, 98906083078176769, 86, 0),
(66, 'novedosox3', 'francia invadio polonia', ' sdfsd', ' dsfsdf', 0, NULL, 98906083078176770, 77, 0),
(67, 'riesgo 8 septiemve', '', '', '', 0, NULL, 98913166502658055, 206, 0),
(68, 'riesgo nuevo ', '', '', '', 0, NULL, 98913166502658056, 207, 0);

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
  `respuesta_id` int(11) NOT NULL,
  `proyecto_linea_base` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `riesgo_has_respuesta`
--

INSERT INTO `riesgo_has_respuesta` (`riesgo_has_respuesta_id`, `riesgo_id`, `respuesta_id`, `proyecto_linea_base`) VALUES
(1, 3, 4, 0),
(2, 3, 11, 0),
(3, 36, 18, 0),
(4, 36, 19, 0),
(5, 37, 20, 0),
(6, 37, 21, 0),
(7, 37, 22, 0),
(8, 36, 23, 0),
(9, 36, 24, 0),
(10, 36, 25, 0),
(11, 36, 26, 0),
(12, 36, 27, 0),
(13, 36, 28, 0),
(14, 3, 29, 0),
(15, 3, 30, 0),
(16, 3, 31, 0),
(17, 3, 32, 0),
(18, 3, 33, 0),
(19, 3, 34, 0),
(20, 3, 35, 0),
(21, 3, 36, 0),
(22, 3, 37, 0),
(23, 3, 38, 0),
(24, 3, 39, 0),
(25, 3, 40, 0),
(26, 3, 41, 0),
(27, 3, 42, 0),
(28, 3, 43, 0),
(29, 3, 44, 0),
(30, 4, 45, 4),
(31, 4, 46, 4),
(32, 5, 47, 4),
(33, 3, 48, 4),
(34, 28, 49, 0),
(35, 22, 50, 0),
(36, 64, 51, 0),
(37, 64, 52, 0),
(38, 65, 53, 0),
(39, 65, 54, 0),
(40, 65, 55, 0),
(41, 65, 56, 0),
(42, 65, 57, 0),
(43, 65, 58, 0),
(44, 5, 59, 0),
(45, 3, 60, 0),
(46, 67, 61, 0),
(47, 67, 62, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `rol_id` int(11) NOT NULL,
  `rol_nombre` varchar(60) NOT NULL,
  `rol_descripcion` tinytext DEFAULT NULL,
  `gerente_id` int(11) NOT NULL,
  `proyecto_linea_base` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`rol_id`, `rol_nombre`, `rol_descripcion`, `gerente_id`, `proyecto_linea_base`) VALUES
(1, 'Comediantes', 'Se encargan de divertirnos.', 28, 4),
(2, 'Comediante', 'Encargado de matarnos de la risa.', 37, 0);

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
  `categoria_id` int(11) NOT NULL,
  `proyecto_linea_base` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sub_categoria`
--

INSERT INTO `sub_categoria` (`sub_categoria_id`, `sub_categoria_nombre`, `sub_categoria_descripcion`, `sub_categoria_default`, `sub_categoria_uid`, `categoria_id`, `proyecto_linea_base`) VALUES
(49, 'Definición del alcance', '', 0, 98872370386698269, 9, 0),
(50, 'Definición de los requisitos', '', 0, 98872370386698270, 9, 0),
(51, 'Estimaciones, supuestos y restricciones', '', 0, 98872370386698271, 9, 0),
(52, 'Procesos técnicos', '', 0, 98872370386698272, 9, 0),
(53, 'Tecnología', '', 0, 98872370386698273, 9, 0),
(54, 'Interfaces técnicas', '', 0, 98872370386698274, 9, 0),
(55, 'Dirección de proyectos', '', 0, 98872370386698276, 10, 0),
(56, 'Dirección del programa/portafolio', '', 0, 98872370386698277, 10, 0),
(57, 'Gestión de las operaciones', '', 0, 98872370386698278, 10, 0),
(58, 'Organización', '', 0, 98872370386698279, 10, 0),
(59, 'Dotación de recursos', '', 0, 98872370386698280, 10, 0),
(60, 'Comunicación', '', 0, 98872370386698281, 10, 0),
(61, 'Términos y condiciones contractuales', '', 0, 98872370386698283, 11, 0),
(62, 'Contratación interna', '', 0, 98872370386698284, 11, 0),
(63, 'Proveedores y vendedores', '', 0, 98872370386698285, 11, 0),
(64, 'Subcontratos', '', 0, 98872370386698286, 11, 0),
(65, 'Estabilidad de los clientes', '', 0, 98872370386698287, 11, 0),
(66, 'Asociaciones y empresas conjuntas', '', 0, 98872370386698288, 11, 0),
(67, 'Legislación', '', 0, 98872370386698290, 12, 0),
(68, 'Tasas de cambio', '', 0, 98872370386698291, 12, 0),
(69, 'Sitios/Instalaciones', '', 0, 98872370386698292, 12, 0),
(70, 'Ambiental/clima', '', 0, 98872370386698293, 12, 0),
(71, 'Competencia', '', 0, 98872370386698294, 12, 0),
(72, 'Normativo', '', 0, 98872370386698295, 12, 0),
(74, 'Definición del alcance', '', 0, 98873742091878403, 15, 4),
(75, 'Definición de los requisitos', '', 0, 98873742091878404, 15, 4),
(76, 'Estimaciones, supuestos y restricciones', '', 0, 98873742091878405, 15, 0),
(77, 'Procesos técnicos', '', 0, 98873742091878406, 15, 0),
(78, 'Tecnología', '', 0, 98873742091878407, 15, 4),
(79, 'Interfaces técnicas', '', 0, 98873742091878408, 15, 0),
(80, 'Dirección de proyectos', '', 0, 98873742091878410, 16, 0),
(81, 'Dirección del programa/portafolio', '', 0, 98873742091878411, 16, 0),
(82, 'Gestión de las operaciones', '', 0, 98873742091878412, 16, 0),
(83, 'Organización', '', 0, 98873742091878413, 16, 0),
(84, 'Dotación de recursos', '', 0, 98873742091878414, 16, 0),
(85, 'Comunicación', '', 0, 98873742091878415, 16, 0),
(86, 'Términos y condiciones contractuales', '', 0, 98873742091878417, 17, 0),
(87, 'Contratación interna', '', 0, 98873742091878418, 17, 0),
(88, 'Proveedores y vendedores', '', 0, 98873742091878419, 17, 0),
(89, 'Subcontratos', '', 0, 98873742091878420, 17, 0),
(90, 'Estabilidad de los clientes', '', 0, 98873742091878421, 17, 0),
(91, 'Asociaciones y empresas conjuntas', '', 0, 98873742091878422, 17, 0),
(92, 'Legislación', '', 0, 98873742091878424, 18, 0),
(93, 'Tasas de cambio', '', 0, 98873742091878425, 18, 0),
(94, 'Sitios/Instalaciones', '', 0, 98873742091878426, 18, 0),
(95, 'Ambiental/clima', '', 0, 98873742091878427, 18, 0),
(96, 'Competencia', '', 0, 98873742091878428, 18, 0),
(97, 'Normativo', '', 0, 98873742091878429, 18, 0),
(98, 'Definición del alcance', '', 0, 98875189428748289, 19, 0),
(99, 'Definición de los requisitos', '', 0, 98875189428748290, 19, 0),
(100, 'Estimaciones, supuestos y restricciones', '', 0, 98875189428748291, 19, 0),
(101, 'Procesos técnicos', '', 0, 98875189428748292, 19, 0),
(102, 'Tecnología', '', 0, 98875189428748293, 19, 0),
(103, 'Interfaces técnicas', '', 0, 98875189428748294, 19, 0),
(104, 'Dirección de proyectos', '', 0, 98875189428748296, 20, 0),
(105, 'Dirección del programa/portafolio', '', 0, 98875189428748297, 20, 0),
(106, 'Gestión de las operaciones', '', 0, 98875189428748298, 20, 0),
(107, 'Organización', '', 0, 98875189428748299, 20, 0),
(108, 'Dotación de recursos', '', 0, 98875189428748300, 20, 0),
(109, 'Comunicación', '', 0, 98875189428748301, 20, 0),
(110, 'Términos y condiciones contractuales', '', 0, 98875189428748303, 21, 0),
(111, 'Contratación interna', '', 0, 98875189428748304, 21, 0),
(112, 'Proveedores y vendedores', '', 0, 98875189428748305, 21, 0),
(113, 'Subcontratos', '', 0, 98875189428748306, 21, 0),
(114, 'Estabilidad de los clientes', '', 0, 98875189428748307, 21, 0),
(115, 'Asociaciones y empresas conjuntas', '', 0, 98875189428748308, 21, 0),
(116, 'Legislación', '', 0, 98875189428748310, 22, 0),
(117, 'Tasas de cambio', '', 0, 98875189428748311, 22, 0),
(118, 'Sitios/Instalaciones', '', 0, 98875189428748312, 22, 0),
(119, 'Ambiental/clima', '', 0, 98875189428748313, 22, 0),
(120, 'Competencia', '', 0, 98875189428748314, 22, 0),
(121, 'Normativo', '', 0, 98875189428748315, 22, 0),
(122, 'Definición de los requisitos', '', 2, 98877097719627777, 15, 0),
(123, 'Definición del alcance', '', 2, 98877097719627778, 15, 0),
(128, 'sdf', 'dsfds', 1, 98883849273999364, 26, 0),
(129, 'eee', 'eee', 1, 98883849273999365, 25, 0),
(130, 'Definición del alcance', '', 2, 98883849273999367, 27, 0),
(131, 'Definición del alcance', '', 0, 98883849273999370, 28, 0),
(132, 'Definición de los requisitos', '', 0, 98883849273999371, 28, 0),
(133, 'Estimaciones, supuestos y restricciones', '', 0, 98883849273999372, 28, 0),
(134, 'Procesos técnicos', '', 0, 98883849273999373, 28, 0),
(135, 'Tecnología', '', 0, 98883849273999374, 28, 0),
(136, 'Interfaces técnicas', '', 0, 98883849273999375, 28, 0),
(137, 'Dirección de proyectos', '', 0, 98883849273999377, 29, 0),
(138, 'Dirección del programa/portafolio', '', 0, 98883849273999378, 29, 0),
(139, 'Gestión de las operaciones', '', 0, 98883849273999379, 29, 0),
(140, 'Organización', '', 0, 98883849273999380, 29, 0),
(141, 'Dotación de recursos', '', 0, 98883849273999381, 29, 0),
(142, 'Comunicación', '', 0, 98883849273999382, 29, 0),
(143, 'Términos y condiciones contractuales', '', 0, 98883849273999384, 30, 0),
(144, 'Contratación interna', '', 0, 98883849273999385, 30, 0),
(145, 'Proveedores y vendedores', '', 0, 98883849273999386, 30, 0),
(146, 'Subcontratos', '', 0, 98883849273999387, 30, 0),
(147, 'Estabilidad de los clientes', '', 0, 98883849273999388, 30, 0),
(148, 'Asociaciones y empresas conjuntas', '', 0, 98883849273999389, 30, 0),
(149, 'Legislación', '', 0, 98883849273999391, 31, 0),
(150, 'Tasas de cambio', '', 0, 98883849273999392, 31, 0),
(151, 'Sitios/Instalaciones', '', 0, 98883849273999393, 31, 0),
(152, 'Ambiental/clima', '', 0, 98883849273999394, 31, 0),
(153, 'Competencia', '', 0, 98883849273999395, 31, 0),
(154, 'Normativo', '', 0, 98883849273999396, 31, 0),
(157, 'Definición del alcance', '', 0, 98889951147458561, 34, 0),
(158, 'Definición de los requisitos', '', 0, 98889951147458562, 34, 0),
(159, 'Estimaciones, supuestos y restricciones', '', 0, 98889951147458563, 34, 0),
(160, 'Procesos técnicos', '', 0, 98889951147458564, 34, 0),
(161, 'Tecnología', '', 0, 98889951147458565, 34, 0),
(162, 'Interfaces técnicas', '', 0, 98889951147458566, 34, 0),
(163, 'Dirección de proyectos', '', 0, 98889951147458568, 35, 0),
(164, 'Dirección del programa/portafolio', '', 0, 98889951147458569, 35, 0),
(165, 'Gestión de las operaciones', '', 0, 98889951147458570, 35, 0),
(166, 'Organización', '', 0, 98889951147458571, 35, 0),
(167, 'Dotación de recursos', '', 0, 98889951147458572, 35, 0),
(168, 'Comunicación', '', 0, 98889951147458573, 35, 0),
(169, 'Términos y condiciones contractuales', '', 0, 98889951147458575, 36, 0),
(170, 'Contratación interna', '', 0, 98889951147458576, 36, 0),
(171, 'Proveedores y vendedores', '', 0, 98889951147458577, 36, 0),
(172, 'Subcontratos', '', 0, 98889951147458578, 36, 0),
(173, 'Estabilidad de los clientes', '', 0, 98889951147458579, 36, 0),
(174, 'Asociaciones y empresas conjuntas', '', 0, 98889951147458580, 36, 0),
(175, 'Legislación', '', 0, 98889951147458582, 37, 0),
(176, 'Tasas de cambio', '', 0, 98889951147458583, 37, 0),
(177, 'Sitios/Instalaciones', '', 0, 98889951147458584, 37, 0),
(178, 'Ambiental/clima', '', 0, 98889951147458585, 37, 0),
(179, 'Competencia', '', 0, 98889951147458586, 37, 0),
(180, 'Normativo', '', 0, 98889951147458587, 37, 0),
(181, 'Definición del alcance', '', 0, 98895409027481602, 38, 0),
(182, 'Definición de los requisitos', '', 0, 98895409027481603, 38, 0),
(183, 'Estimaciones, supuestos y restricciones', '', 0, 98895409027481604, 38, 0),
(184, 'Procesos técnicos', '', 0, 98895409027481605, 38, 0),
(185, 'Tecnología', '', 0, 98895409027481606, 38, 0),
(186, 'Interfaces técnicas', '', 0, 98895409027481607, 38, 0),
(187, 'Dirección de proyectos', '', 0, 98895409027481609, 39, 0),
(188, 'Dirección del programa/portafolio', '', 0, 98895409027481610, 39, 0),
(189, 'Gestión de las operaciones', '', 0, 98895409027481611, 39, 0),
(190, 'Organización', '', 0, 98895409027481612, 39, 0),
(191, 'Dotación de recursos', '', 0, 98895409027481613, 39, 0),
(192, 'Comunicación', '', 0, 98895409027481614, 39, 0),
(193, 'Términos y condiciones contractuales', '', 0, 98895409027481616, 40, 0),
(194, 'Contratación interna', '', 0, 98895409027481617, 40, 0),
(195, 'Proveedores y vendedores', '', 0, 98895409027481618, 40, 0),
(196, 'Subcontratos', '', 0, 98895409027481619, 40, 0),
(197, 'Estabilidad de los clientes', '', 0, 98895409027481620, 40, 0),
(198, 'Asociaciones y empresas conjuntas', '', 0, 98895409027481621, 40, 0),
(199, 'Legislación', '', 0, 98895409027481623, 41, 0),
(200, 'Tasas de cambio', '', 0, 98895409027481624, 41, 0),
(201, 'Sitios/Instalaciones', '', 0, 98895409027481625, 41, 0),
(202, 'Ambiental/clima', '', 0, 98895409027481626, 41, 0),
(203, 'Competencia', '', 0, 98895409027481627, 41, 0),
(204, 'Normativo', '', 0, 98895409027481628, 41, 0),
(205, 'Definición del alcance', '', 2, 98913166502658049, 42, 0),
(206, 'Definición de los requisitos', '', 2, 98913166502658050, 42, 0),
(207, 'Tecnología', '', 2, 98913166502658051, 42, 0),
(208, 'Procesos técnicos', '', 2, 98913166502658052, 42, 0),
(209, 'Términos y condiciones contractuales', '', 2, 98913166502658054, 43, 0);

--
-- Disparadores `sub_categoria`
--
DELIMITER $$
CREATE TRIGGER `Agregar uuid subcategoria` BEFORE INSERT ON `sub_categoria` FOR EACH ROW SET NEW.sub_categoria_uid = (SELECT uuid_short())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarea`
--

CREATE TABLE `tarea` (
  `tarea_id` int(11) NOT NULL,
  `tarea_nombre` varchar(77) NOT NULL,
  `tarea_descripcion` tinytext NOT NULL,
  `proyecto_has_riesgo_id` int(11) NOT NULL,
  `riesgo_has_respuesta_id` int(11) NOT NULL,
  `fecha_inicio` datetime DEFAULT NULL,
  `duracion` int(11) DEFAULT NULL,
  `fecha_fin` datetime DEFAULT NULL,
  `proyecto_linea_base` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tarea`
--

INSERT INTO `tarea` (`tarea_id`, `tarea_nombre`, `tarea_descripcion`, `proyecto_has_riesgo_id`, `riesgo_has_respuesta_id`, `fecha_inicio`, `duracion`, `fecha_fin`, `proyecto_linea_base`) VALUES
(2, 'dfg', 'dgdfg', 37, 8, NULL, NULL, NULL, 0),
(4, 'acabar las dictaduras', 'instaruar un referendo', 69, 34, NULL, NULL, NULL, 0),
(5, 'acabar las dictaduras', 'instaruar un referendo', 69, 34, NULL, NULL, NULL, 0),
(6, 'www', 'sadsad', 69, 34, NULL, NULL, NULL, 0),
(7, 'destruir al capitalismo', 'sss', 76, 42, NULL, NULL, NULL, 0),
(8, 'destruir al capitalismo', 'sss', 76, 42, NULL, NULL, NULL, 0),
(9, 'destruir al capitalismo', 'sss', 76, 42, NULL, NULL, NULL, 0),
(10, 'destruir al capitalismo', 'sss', 76, 42, NULL, NULL, NULL, 0),
(11, 'destruir al capitalismo', 'sss', 76, 42, NULL, NULL, NULL, 0),
(12, 'destruir al capitalismo', 'sss', 76, 42, NULL, NULL, NULL, 0),
(13, 'tarea1', '', 82, 44, NULL, NULL, NULL, 0),
(14, 'planear todo', 'ggg', 86, 46, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarea_has_recurso`
--

CREATE TABLE `tarea_has_recurso` (
  `tarea_id` int(11) NOT NULL,
  `recurso_id` int(11) NOT NULL,
  `cantidad` float NOT NULL,
  `proyecto_linea_base` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tarea_has_recurso`
--

INSERT INTO `tarea_has_recurso` (`tarea_id`, `recurso_id`, `cantidad`, `proyecto_linea_base`) VALUES
(6, 2, 2, 0),
(6, 3, 3, 0),
(7, 6, 33, 0),
(13, 7, 5, 0),
(14, 9, 5, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_recurso`
--

CREATE TABLE `tipo_recurso` (
  `tipo_recurso_id` int(11) NOT NULL,
  `tipo_recurso_nombre` varchar(45) NOT NULL,
  `tipo_recurso_descripcion` tinytext DEFAULT NULL,
  `gerente_id` int(11) NOT NULL,
  `proyecto_linea_base` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_recurso`
--

INSERT INTO `tipo_recurso` (`tipo_recurso_id`, `tipo_recurso_nombre`, `tipo_recurso_descripcion`, `gerente_id`, `proyecto_linea_base`) VALUES
(4, 'Material', 'Este tipo de recurso se refiere a los suministros, materiales y cualquier otro consumible necesario para completar las tareas.', 24, 0),
(5, 'Trabajo', 'Se trata de los miembros de tu equipo de trabajo. La dedicación de cada individuo se mide en horas de trabajo.', 24, 0),
(6, 'Costo', 'Este tipo de recurso implica un gasto para el proyecto, pero no dependen del trabajo o la duración de una tarea. Pueden tratarse de gastos de representación (comidas, viajes…).', 24, 0),
(7, 'Material', 'Este tipo de recurso se refiere a los suministros, materiales y cualquier otro consumible necesario para completar las tareas.', 28, 4),
(8, 'Trabajo', 'Se trata de los miembros de tu equipo de trabajo. La dedicación de cada individuo se mide en horas de trabajo.', 28, 4),
(9, 'Costo', 'Este tipo de recurso implica un gasto para el proyecto, pero no dependen del trabajo o la duración de una tarea. Pueden tratarse de gastos de representación (comidas, viajes…).', 28, 4),
(10, 'Material', 'Este tipo de recurso se refiere a los suministros, materiales y cualquier otro consumible necesario para completar las tareas.', 29, 0),
(11, 'Trabajo', 'Se trata de los miembros de tu equipo de trabajo. La dedicación de cada individuo se mide en horas de trabajo.', 29, 0),
(12, 'Costo', 'Este tipo de recurso implica un gasto para el proyecto, pero no dependen del trabajo o la duración de una tarea. Pueden tratarse de gastos de representación (comidas, viajes…).', 29, 0),
(13, 'Material', 'Este tipo de recurso se refiere a los suministros, materiales y cualquier otro consumible necesario para completar las tareas.', 31, 0),
(14, 'Trabajo', 'Se trata de los miembros de tu equipo de trabajo. La dedicación de cada individuo se mide en horas de trabajo.', 31, 0),
(15, 'Costo', 'Este tipo de recurso implica un gasto para el proyecto, pero no dependen del trabajo o la duración de una tarea. Pueden tratarse de gastos de representación (comidas, viajes…).', 31, 0),
(16, 'Material', 'Este tipo de recurso se refiere a los suministros, materiales y cualquier otro consumible necesario para completar las tareas.', 32, 0),
(17, 'Trabajo', 'Se trata de los miembros de tu equipo de trabajo. La dedicación de cada individuo se mide en horas de trabajo.', 32, 0),
(18, 'Costo', 'Este tipo de recurso implica un gasto para el proyecto, pero no dependen del trabajo o la duración de una tarea. Pueden tratarse de gastos de representación (comidas, viajes…).', 32, 0),
(19, 'Material', 'Este tipo de recurso se refiere a los suministros, materiales y cualquier otro consumible necesario para completar las tareas.', 33, 0),
(20, 'Trabajo', 'Se trata de los miembros de tu equipo de trabajo. La dedicación de cada individuo se mide en horas de trabajo.', 33, 0),
(21, 'Costo', 'Este tipo de recurso implica un gasto para el proyecto, pero no dependen del trabajo o la duración de una tarea. Pueden tratarse de gastos de representación (comidas, viajes…).', 33, 0),
(22, 'Material', 'Este tipo de recurso se refiere a los suministros, materiales y cualquier otro consumible necesario para completar las tareas.', 34, 0),
(23, 'Trabajo', 'Se trata de los miembros de tu equipo de trabajo. La dedicación de cada individuo se mide en horas de trabajo.', 34, 0),
(24, 'Costo', 'Este tipo de recurso implica un gasto para el proyecto, pero no dependen del trabajo o la duración de una tarea. Pueden tratarse de gastos de representación (comidas, viajes…).', 34, 0),
(25, 'Material', 'Este tipo de recurso se refiere a los suministros, materiales y cualquier otro consumible necesario para completar las tareas.', 35, 0),
(26, 'Trabajo', 'Se trata de los miembros de tu equipo de trabajo. La dedicación de cada individuo se mide en horas de trabajo.', 35, 0),
(27, 'Costo', 'Este tipo de recurso implica un gasto para el proyecto, pero no dependen del trabajo o la duración de una tarea. Pueden tratarse de gastos de representación (comidas, viajes…).', 35, 0),
(28, 'Material', 'Este tipo de recurso se refiere a los suministros, materiales y cualquier otro consumible necesario para completar las tareas.', 36, 0),
(29, 'Trabajo', 'Se trata de los miembros de tu equipo de trabajo. La dedicación de cada individuo se mide en horas de trabajo.', 36, 0),
(30, 'Costo', 'Este tipo de recurso implica un gasto para el proyecto, pero no dependen del trabajo o la duración de una tarea. Pueden tratarse de gastos de representación (comidas, viajes…).', 36, 0),
(31, 'Material', 'Este tipo de recurso se refiere a los suministros, materiales y cualquier otro consumible necesario para completar las tareas.', 37, 0),
(32, 'Trabajo', 'Se trata de los miembros de tu equipo de trabajo. La dedicación de cada individuo se mide en horas de trabajo.', 37, 0),
(33, 'Costo', 'Este tipo de recurso implica un gasto para el proyecto, pero no dependen del trabajo o la duración de una tarea. Pueden tratarse de gastos de representación (comidas, viajes…).', 37, 0);

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
-- Indices de la tabla `clasificacion_riesgo`
--
ALTER TABLE `clasificacion_riesgo`
  ADD PRIMARY KEY (`clasificacion_riesgo_id`),
  ADD KEY `fk_clasificacion_riesgo_proyecto1_idx` (`proyecto_id`);

--
-- Indices de la tabla `gerente`
--
ALTER TABLE `gerente`
  ADD PRIMARY KEY (`gerente_id`),
  ADD UNIQUE KEY `gerente_usuario` (`gerente_usuario`),
  ADD KEY `fk_gerente_sector1_idx` (`sector_id`),
  ADD KEY `fk_gerente_pais1_idx` (`pais_id`);

--
-- Indices de la tabla `impacto`
--
ALTER TABLE `impacto`
  ADD PRIMARY KEY (`impacto_id`),
  ADD KEY `fk_impacto_proyecto1_idx` (`proyecto_id`);

--
-- Indices de la tabla `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`pais_id`);

--
-- Indices de la tabla `propabilidad`
--
ALTER TABLE `propabilidad`
  ADD PRIMARY KEY (`propabilidad_id`),
  ADD KEY `fk_propabilidad_proyecto1_idx` (`proyecto_id`);

--
-- Indices de la tabla `proyecto`
--
ALTER TABLE `proyecto`
  ADD PRIMARY KEY (`proyecto_id`),
  ADD KEY `fk_proyecto_gerente1_idx` (`gerente_id`),
  ADD KEY `fk_proyecto_sector1_idx` (`sector_id`);

--
-- Indices de la tabla `proyecto_has_riesgo`
--
ALTER TABLE `proyecto_has_riesgo`
  ADD PRIMARY KEY (`proyecto_has_riesgo_id`),
  ADD UNIQUE KEY `riesgo_unico` (`proyecto_id`,`riesgo_id`),
  ADD KEY `fk_proyecto_has_riesgo_responsble1` (`responsable_id`),
  ADD KEY `fk_proyecto_has_riesgo_riesgo1` (`riesgo_id`),
  ADD KEY `fk_proyecto_has_riesgo_impacto1` (`impacto_id`),
  ADD KEY `fk_proyecto_has_riesgo_propabilidad1` (`propabilidad_id`);

--
-- Indices de la tabla `proyecto_has_riesgo_actividad`
--
ALTER TABLE `proyecto_has_riesgo_actividad`
  ADD PRIMARY KEY (`proyecto_has_riesgo_actividad_id`),
  ADD KEY `fk_proyecto_has_riesgo_actividad_proyecto_has_riesgo1` (`proyecto_has_riesgo_id`),
  ADD KEY `actividad_id` (`actividad_id`);

--
-- Indices de la tabla `proyecto_has_riesgo_respuesta`
--
ALTER TABLE `proyecto_has_riesgo_respuesta`
  ADD PRIMARY KEY (`proyecto_has_id`,`respuesta_has_id`),
  ADD KEY `fk_proyecto_has_riesgo_has_riesgo_has_respuesta_riesgo_has__idx` (`respuesta_has_id`),
  ADD KEY `fk_proyecto_has_riesgo_has_riesgo_has_respuesta_proyecto_ha_idx` (`proyecto_has_id`);

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
  ADD KEY `fk_responsble_proyecto1_idx` (`proyecto_id`),
  ADD KEY `fk_responsble_rol1` (`rol_id`);

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
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`rol_id`),
  ADD KEY `fk_rol_gerente_idx` (`gerente_id`);

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
-- Indices de la tabla `tarea`
--
ALTER TABLE `tarea`
  ADD PRIMARY KEY (`tarea_id`),
  ADD KEY `fk_tarea_proyecto_has_riesgo_respuesta_idx` (`proyecto_has_riesgo_id`,`riesgo_has_respuesta_id`);

--
-- Indices de la tabla `tarea_has_recurso`
--
ALTER TABLE `tarea_has_recurso`
  ADD PRIMARY KEY (`tarea_id`,`recurso_id`),
  ADD KEY `fk_tarea_has_recurso_recurso1_idx` (`recurso_id`),
  ADD KEY `fk_tarea_has_recurso_tarea1_idx` (`tarea_id`);

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
  MODIFY `categoria_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de la tabla `clasificacion_riesgo`
--
ALTER TABLE `clasificacion_riesgo`
  MODIFY `clasificacion_riesgo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de la tabla `gerente`
--
ALTER TABLE `gerente`
  MODIFY `gerente_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `impacto`
--
ALTER TABLE `impacto`
  MODIFY `impacto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT de la tabla `pais`
--
ALTER TABLE `pais`
  MODIFY `pais_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=249;

--
-- AUTO_INCREMENT de la tabla `propabilidad`
--
ALTER TABLE `propabilidad`
  MODIFY `propabilidad_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT de la tabla `proyecto`
--
ALTER TABLE `proyecto`
  MODIFY `proyecto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `proyecto_has_riesgo`
--
ALTER TABLE `proyecto_has_riesgo`
  MODIFY `proyecto_has_riesgo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT de la tabla `proyecto_has_riesgo_actividad`
--
ALTER TABLE `proyecto_has_riesgo_actividad`
  MODIFY `proyecto_has_riesgo_actividad_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `rbs`
--
ALTER TABLE `rbs`
  MODIFY `rbs_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `recurso`
--
ALTER TABLE `recurso`
  MODIFY `recurso_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `responsble`
--
ALTER TABLE `responsble`
  MODIFY `responsable_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `respuesta`
--
ALTER TABLE `respuesta`
  MODIFY `respuesta_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT de la tabla `riesgo`
--
ALTER TABLE `riesgo`
  MODIFY `riesgo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT de la tabla `riesgo_has_respuesta`
--
ALTER TABLE `riesgo_has_respuesta`
  MODIFY `riesgo_has_respuesta_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `rol_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `sector`
--
ALTER TABLE `sector`
  MODIFY `sector_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `sub_categoria`
--
ALTER TABLE `sub_categoria`
  MODIFY `sub_categoria_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=210;

--
-- AUTO_INCREMENT de la tabla `tarea`
--
ALTER TABLE `tarea`
  MODIFY `tarea_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `tipo_recurso`
--
ALTER TABLE `tipo_recurso`
  MODIFY `tipo_recurso_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

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
-- Filtros para la tabla `clasificacion_riesgo`
--
ALTER TABLE `clasificacion_riesgo`
  ADD CONSTRAINT `fk_clasificacion_riesgo_proyecto1` FOREIGN KEY (`proyecto_id`) REFERENCES `proyecto` (`proyecto_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `gerente`
--
ALTER TABLE `gerente`
  ADD CONSTRAINT `fk_gerente_pais1` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`pais_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_gerente_sector1` FOREIGN KEY (`sector_id`) REFERENCES `sector` (`sector_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `impacto`
--
ALTER TABLE `impacto`
  ADD CONSTRAINT `fk_impacto_proyecto1` FOREIGN KEY (`proyecto_id`) REFERENCES `proyecto` (`proyecto_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `propabilidad`
--
ALTER TABLE `propabilidad`
  ADD CONSTRAINT `fk_propabilidad_proyecto1` FOREIGN KEY (`proyecto_id`) REFERENCES `proyecto` (`proyecto_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `proyecto`
--
ALTER TABLE `proyecto`
  ADD CONSTRAINT `fk_proyecto_gerente1` FOREIGN KEY (`gerente_id`) REFERENCES `gerente` (`gerente_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_proyecto_sector1` FOREIGN KEY (`sector_id`) REFERENCES `sector` (`sector_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `proyecto_has_riesgo`
--
ALTER TABLE `proyecto_has_riesgo`
  ADD CONSTRAINT `fk_proyecto_has_riesgo_impacto1` FOREIGN KEY (`impacto_id`) REFERENCES `impacto` (`impacto_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_proyecto_has_riesgo_propabilidad1` FOREIGN KEY (`propabilidad_id`) REFERENCES `propabilidad` (`propabilidad_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_proyecto_has_riesgo_proyecto1` FOREIGN KEY (`proyecto_id`) REFERENCES `proyecto` (`proyecto_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_proyecto_has_riesgo_responsble1` FOREIGN KEY (`responsable_id`) REFERENCES `responsble` (`responsable_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_proyecto_has_riesgo_riesgo1` FOREIGN KEY (`riesgo_id`) REFERENCES `riesgo` (`riesgo_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `proyecto_has_riesgo_actividad`
--
ALTER TABLE `proyecto_has_riesgo_actividad`
  ADD CONSTRAINT `fk_proyecto_has_riesgo_actividad_proyecto_has_riesgo1` FOREIGN KEY (`proyecto_has_riesgo_id`) REFERENCES `proyecto_has_riesgo` (`proyecto_has_riesgo_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `proyecto_has_riesgo_actividad_ibfk_1` FOREIGN KEY (`actividad_id`) REFERENCES `actividad` (`actividad_id`);

--
-- Filtros para la tabla `proyecto_has_riesgo_respuesta`
--
ALTER TABLE `proyecto_has_riesgo_respuesta`
  ADD CONSTRAINT `fk_proyecto_has_riesgo_has_riesgo_has_respuesta_proyecto_has_1` FOREIGN KEY (`proyecto_has_id`) REFERENCES `proyecto_has_riesgo` (`proyecto_has_riesgo_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_proyecto_has_riesgo_has_riesgo_has_respuesta_riesgo_has_re1` FOREIGN KEY (`respuesta_has_id`) REFERENCES `riesgo_has_respuesta` (`riesgo_has_respuesta_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

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
  ADD CONSTRAINT `fk_responsble_proyecto1` FOREIGN KEY (`proyecto_id`) REFERENCES `proyecto` (`proyecto_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_responsble_rol1` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`rol_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

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
-- Filtros para la tabla `rol`
--
ALTER TABLE `rol`
  ADD CONSTRAINT `fk_rol_gerente` FOREIGN KEY (`gerente_id`) REFERENCES `gerente` (`gerente_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `sub_categoria`
--
ALTER TABLE `sub_categoria`
  ADD CONSTRAINT `fk_sub_categoria_categoria1` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`categoria_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tarea`
--
ALTER TABLE `tarea`
  ADD CONSTRAINT `fk_tarea_proyecto_has_riesgo_respuesta` FOREIGN KEY (`proyecto_has_riesgo_id`,`riesgo_has_respuesta_id`) REFERENCES `proyecto_has_riesgo_respuesta` (`proyecto_has_id`, `respuesta_has_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tarea_has_recurso`
--
ALTER TABLE `tarea_has_recurso`
  ADD CONSTRAINT `fk_tarea_has_recurso_recurso1` FOREIGN KEY (`recurso_id`) REFERENCES `recurso` (`recurso_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tarea_has_recurso_tarea1` FOREIGN KEY (`tarea_id`) REFERENCES `tarea` (`tarea_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tipo_recurso`
--
ALTER TABLE `tipo_recurso`
  ADD CONSTRAINT `fk_tipo_recurso_gerente1` FOREIGN KEY (`gerente_id`) REFERENCES `gerente` (`gerente_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
