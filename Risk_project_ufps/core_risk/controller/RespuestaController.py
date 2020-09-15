from Risk_project_ufps.core_risk.dao.RespuestaDao import *
from Risk_project_ufps.core_risk.dao.RiesgoHasRespuestaDao import *
from Risk_project_ufps.core_risk.dao.ProyectoHasRiesgo_RespuestaDao import *
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
                        repuesta_id=respuesta.respuesta_id,
                        respuesta_nombre=respuesta.respuesta_nombre,
                        respuesta_descripcion=respuesta.respuesta_descripcion,
                        fecha_inicio_respuesta=self.get_datetime(respuesta.fecha_inicio_respuesta)
                    )
                )
            else:
                aux[key] = []
                aux[key].append(
                    dict(
                        repuesta_id=respuesta.respuesta_id,
                        respuesta_nombre=respuesta.respuesta_nombre,
                        respuesta_descripcion=respuesta.respuesta_descripcion,
                        fecha_inicio_respuesta=self.get_datetime(respuesta.fecha_inicio_respuesta)
                    )
                )
        return aux

    def get_datetime(self, now):
        date_time = now.strftime("%d/%m/%Y")
        return date_time







