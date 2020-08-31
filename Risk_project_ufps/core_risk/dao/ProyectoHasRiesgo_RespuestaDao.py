from contextlib import closing

from django.db import connection

from Risk_project_ufps.core_risk.dto.models import *


class ProyectoHasRiesgo_RespuestaDao():

	def registrar_respuesta_proyecto(self, proyecto_riesgo, riesgo_respuesta):
		with closing(connection.cursor()) as cursor:
			cursor.execute(
                'INSERT INTO riesgos_bd.`proyecto_has riesgo_respuesta`(`proyecto_has_id`, `respuesta_has_id`)'
                'VALUES (%s, %s)',
                (proyecto_riesgo.proyecto_has_riesgo_id, riesgo_respuesta.riesgo_has_respuesta_id),
            )

			return "Se registro respuesta exitosamente."

