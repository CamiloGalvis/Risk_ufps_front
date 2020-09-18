from Risk_project_ufps.core_risk.dto.models import *


class RespuestaDao():

    def registrar_respuesta(self, nombre, descripcion):

        try:
            respuesta = Respuesta(
                respuesta_nombre=nombre,
                respuesta_descripcion=descripcion)
            respuesta.save()
        except Error as e:
            print(e)

        finally:
            return respuesta

    def obtener_respuesta(self, id):
        """
		Permite consultar una respuesta por su id
		
		:rtype: Respuesta
		:type id: int
		"""
        try:
            return Respuesta.objects.get(respuesta_id=id)
        except Exception as e:
            print(e)
            return None

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

    def obtener_all_respuestas_from_riesgo_by_proyecto(self, riesgo_id, proyecto_id):
        """
        Consulta todas las respuestas que se hayan asosiado a este riesgo en todos los proyectos
        en que se utilizo execto al que entro
        :param proyecto_id:Proyecto"""
        try:
            sql = "SELECT r.respuesta_id, r.respuesta_nombre, r.respuesta_descripcion, r.respuesta_costo, rhr.riesgo_id " \
                  "FROM respuesta r " \
                  "INNER JOIN riesgo_has_respuesta rhr " \
                  "ON r.respuesta_id = rhr.respuesta_id " \
                  "INNER JOIN proyecto_has_riesgo_respuesta phrr " \
                  "ON rhr.riesgo_has_respuesta_id = phrr.respuesta_has_id " \
                  "INNER JOIN proyecto_has_riesgo phr " \
                  "ON phrr.proyecto_has_id = phr.proyecto_has_riesgo_id " \
                  "WHERE rhr.riesgo_id = %s" \
                  "AND phr.proyecto_id <> %s"
            recursos = Recurso.objects.raw(sql, [riesgo_id, proyecto_id])
        except Exception as e:
            print(e)
        finally:
            return recursos
