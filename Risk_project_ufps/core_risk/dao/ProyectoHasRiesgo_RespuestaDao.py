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

	def listar_riesgos_respuesta(self, proyecto_id):
		respuestas = {}
		try:
			#Revisar esta consulta
			respuestas = ProyectoHasRiesgoRespuesta.objects.raw("SELECT * FROM riesgo_has_respuesta re INNER JOIN proyecto_has riesgo_respuesta pr ON re.riesgo_has_respuesta_id=pr.respuesa_has_id INNER JOIN proyecto_has_riesgo tr ON pr.proyecto_has_id=tr.proyecto_has_riesgo_id WHERE tr.proyecto_id = %s", [proyecto_id])
		
		except Error as e:
			print(e)

		finally:
			return respuestas 

