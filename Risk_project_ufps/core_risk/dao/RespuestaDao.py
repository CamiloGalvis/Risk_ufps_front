from Risk_project_ufps.core_risk.dto.models import *

class RespuestaDao():

	def registrar_respuesta(self, nombre, descripcion):
		
		try:
			respuesta = Respuesta(
				respuesta_nombre = nombre,
				respuesta_descripcion = descripcion)
			respuesta.save()		
		except Error as e:
			print(e)

		finally:
			return respuesta

	def obtener_respuesta(self, id):
		
		try:
			respuesta = Respuesta.objects.get(respuesta_id=id)		
		except Error as e:
			print(e)

		finally:
			return respuesta

	def editar_respuesta(self, respuesta, nombre, descripcion):
		respuesta = respuesta
		try:
			respuesta.respuesta_descripcion = descripcion
			respuesta.respuesta_nombre = nombre		
			respuesta.save()
		except Error as e:
			print(e)

		finally:
			return "Se actualizo la información de la respuesta."

	def eliminar_respuesta(self, respuesta):
		respuesta = respuesta
		try:
			respuesta.delete()		
		except Error as e:
			print(e)

		finally:
			return "Se elimino respuesta exitosamente."

