from contextlib import closing

from django.db import connection

from Risk_project_ufps.core_risk.dto.models import *


class ProyectoHasRiesgo_RespuestaDao():

	def registrar_respuesta_proyecto(self, proyecto_riesgo, riesgo_respuesta, fecha_inicio):
		with closing(connection.cursor()) as cursor:
			cursor.execute(
                'INSERT INTO riesgos_bd.`proyecto_has_riesgo_respuesta`(`proyecto_has_id`, `respuesta_has_id`, `fecha_inicio_respuesta` )'
                'VALUES (%s, %s, %s)',
                (proyecto_riesgo.proyecto_has_riesgo_id, riesgo_respuesta.riesgo_has_respuesta_id, fecha_inicio),
            )

			return "Se registro respuesta exitosamente."

	def listar_riesgos_respuesta(self, proyecto_id):
		respuestas = {}
		try:
			
			respuestas = Respuesta.objects.raw("SELECT * FROM respuesta re INNER JOIN riesgo_has_respuesta ri ON re.respuesta_id=ri.respuesta_id INNER JOIN proyecto_has_riesgo_respuesta tr ON ri.riesgo_has_respuesta_id=tr.respuesta_has_id INNER JOIN proyecto_has_riesgo qr ON tr.proyecto_has_id=qr.proyecto_has_riesgo_id WHERE qr.proyecto_id = %s", [proyecto_id])
		
		except Error as e:
			print(e)

		finally:
			return respuestas

	def get_riesgo_respuesta_by_id(self, proyecto_riesgo, riesgo_respuesta):
		respuesta = None
		try:
			
			respuesta = ProyectoHasRiesgoRespuesta.objects.get(respuesta_has_id=riesgo_respuesta.riesgo_has_respuesta_id, proyecto_has_id=proyecto_riesgo.proyecto_has_riesgo_id)

		except Error as e:
			print(e)

		finally:
			return respuesta

	
