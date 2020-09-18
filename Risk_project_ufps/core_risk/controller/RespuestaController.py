from Risk_project_ufps.core_risk.dao.RespuestaDao import *
from Risk_project_ufps.core_risk.dao.RiesgoHasRespuestaDao import *
from Risk_project_ufps.core_risk.dao.ProyectoHasRiesgo_RespuestaDao import *
from Risk_project_ufps.core_risk.dao.RiesgoDao import *

from Risk_project_ufps.core_risk.dto.models import *
from datetime import datetime

class RespuestaController():

    def registrar_respuesta(self, nombre, descripcion):
        respuesta_dao = RespuestaDao()
        return respuesta_dao.registrar_respuesta(nombre, descripcion)

    def obtener_respuesta(self, id):
        respuesta_dao = RespuestaDao()
        return respuesta_dao.obtener_respuesta(id)

    def eliminar_respuesta(self, respuesta):
        respuesta_dao = RespuestaDao()
        return respuesta_dao.eliminar_respuesta(respuesta)

    def editar_respuesta(self, respuesta, nombre, descripcion):
        respuesta_dao = RespuestaDao()
        return respuesta_dao.editar_respuesta(respuesta, nombre, descripcion)


    def registrar_respuesta_riesgo(self, respuesta, riesgo):
        respuesta_riesgo_dao = RiesgoHasRespuestaDao()
        return respuesta_riesgo_dao.registrar_respuesta_riesgo(respuesta, riesgo)

    def listar_respuesta_riesgo(self, id):
        respuesta_riesgo_dao = RiesgoHasRespuestaDao()
        return respuesta_riesgo_dao.listar_respuesta_riesgo(id)

    
    def obtener_respuesta_riesgo(self, riesgo, respuesta):
        respuesta_riesgo_dao = RiesgoHasRespuestaDao()
        return respuesta_riesgo_dao.obtener_respuesta_riesgo(riesgo, respuesta)

    def registrar_respuesta_proyecto(self, proyecto_riesgo, riesgo_respuesta, fecha_inicio):
        p_r_r= ProyectoHasRiesgo_RespuestaDao()
        return p_r_r.registrar_respuesta_proyecto(proyecto_riesgo, riesgo_respuesta, fecha_inicio)

    def get_riesgo_respuesta_by_id(self, proyecto_riesgo, riesgo_respuesta):
        p_r_r= ProyectoHasRiesgo_RespuestaDao()
        return p_r_r.get_riesgo_respuesta_by_id(proyecto_riesgo, riesgo_respuesta)

    def actualizar_fecha_respuesta(self, proyecto_respuesta, fecha):
        p_r_r= ProyectoHasRiesgo_RespuestaDao()
        return p_r_r.actualizar_fecha_respuesta(proyecto_respuesta, fecha)

    def desasociar_respuesta_riesgo_by_proyecto(self, respuesta_id, riesgo_id, proyecto_id):

        proyecto_has_riesgo_dao = ProyectoHasRiesgoDao()
        riesgo_has_respuesta_dao = RiesgoHasRespuestaDao()
        proyecto_has_riesgo_respuesta_dao = ProyectoHasRiesgo_RespuestaDao()

        proyecto_has_riesgo = proyecto_has_riesgo_dao.get_by_riesgo_and_proyecto(proyecto_id, riesgo_id)
        riesgo_has_respuesta = riesgo_has_respuesta_dao.obtener_respuesta_riesgo(riesgo_id, respuesta_id)

        proyecto_has_riesgo_respuesta_dao.eliminar(proyecto_has_riesgo, riesgo_has_respuesta)


    def listar_riesgos_respuesta(self, proyecto_id):
        p_r_r= ProyectoHasRiesgo_RespuestaDao()
        respuestas = p_r_r.listar_riesgos_respuesta(proyecto_id)
        aux = {}
        for respuesta in respuestas:
            key = "riesgo_"+str(respuesta.riesgo_id)
            riesgo_aux = aux.get(key)
            if(riesgo_aux):
                riesgo_aux.append(
                    dict(
                        respuesta_id=respuesta.respuesta_id,
                        respuesta_nombre=respuesta.respuesta_nombre,
                        respuesta_descripcion=respuesta.respuesta_descripcion,
                        fecha_inicio_respuesta=self.get_datetime(respuesta.fecha_inicio_respuesta)
                    )
                )
            else:
                aux[key] = []
                aux[key].append(
                    dict(
                        respuesta_id=respuesta.respuesta_id,
                        respuesta_nombre=respuesta.respuesta_nombre,
                        respuesta_descripcion=respuesta.respuesta_descripcion,
                        fecha_inicio_respuesta=self.get_datetime(respuesta.fecha_inicio_respuesta)
                    )
                )
        return aux

    def get_datetime(self, now):
        try:

            date_time = now.strftime("%d/%m/%Y")
            
        except Exception as e:
            return None
        
        return date_time



    def obtener_respuestas_sugeridas(self, proyecto_id: int):
        """
        Consulta todas las respuestas asociadas a los riesgos
        del proyecto que no se hayan utilizado dentro del mismo proyecto
        :param proyecto_id:
        :return: dict
        """
        respuesta_dao = RespuestaDao()
        riesgo_dao = RiesgoDao()
        proyecto = Proyecto(proyecto_id=proyecto_id)
        riesgos = riesgo_dao.get_riesgos_by_proyecto(proyecto)
        aux = {}
        for riesgo in riesgos:
            key = "riesgo_" + str(riesgo.riesgo_id)
            aux[key] = []
            respuestas = respuesta_dao.obtener_respuestas_sugeridas_from_riesgo_by_proyecto(riesgo, proyecto)
            for respuesta in respuestas:
                aux[key].append(
                    dict(
                        respuesta_id=respuesta.respuesta_id,
                        respuesta_nombre=respuesta.respuesta_nombre,
                        respuesta_descripcion=respuesta.respuesta_descripcion,
                    )
                )

        return aux

    def registrar_respuesta_sugeridas_riesgo(self, respuestas_id, riesgo_id, proyecto_id):
        """
        Permite registrar las respuestas sugeridas de un riesgo
        :param respuestas_id:
        :param riesgo_id:
        :param proyecto_id:
        :return:
        """
        respuesta_dao = RespuestaDao()
        p_h_r = ProyectoHasRiesgoDao()
        respuesta_riesgo_dao = RiesgoHasRespuestaDao()

        riesgo = Riesgo(riesgo_id=riesgo_id)
        proyecto = Proyecto(proyecto_id=proyecto_id)
        for respuesta_id in respuestas_id:
            # Consulto la respuesta
            respuesta_aux = respuesta_dao.obtener_respuesta(respuesta_id)
            # Duplico la respuesta
            respuesta = respuesta_dao.registrar_respuesta(respuesta_aux.respuesta_nombre, respuesta_aux.respuesta_descripcion)
            # Inserto el muchos a muchos entre respuesta y riesgos
            self.registrar_respuesta_riesgo(respuesta, riesgo) #LineaA
            # Consulto el muchos a muchos entre riesgo y proyecto
            proyecto_riesgo = p_h_r.get_by_riesgo_and_proyecto(proyecto, riesgo) #LineaB
            # Consulto el muchos a muchos entre riesgo y respuesta, el que se acabo de agregar en la linea A
            riesgo_respuesta = respuesta_riesgo_dao.obtener_respuesta_riesgo(riesgo, respuesta) #LineaC
            # Insertar el muchos a muchos entre linea B y linea C
            self.registrar_respuesta_proyecto(proyecto_riesgo, riesgo_respuesta, None)







