from Risk_project_ufps.core_risk.dao.ActividadDao import *
from Risk_project_ufps.core_risk.dao.ProyectoHasRiesgo_ActividadDao import *
from Risk_project_ufps.core_risk.dto.models import *

class ActividadController(): 

	def listar_actividades_proyecto(self, proyecto_id):
		actividad_dao = ActividadDao()
		return actividad_dao.listar_actividades_proyecto(proyecto_id)

	def obtener_actividad(self, actividad_id):
		actividad_dao = ActividadDao()
		return actividad_dao.obtener_actividad(actividad_id)

	def registrar_actividad_riesgo(self, proyecto_riesgo, actividad):
		actividad_dao = ProyectoHasRiesgo_ActividadDao()
		return actividad_dao.registrar_actividad_riesgo( proyecto_riesgo, actividad)

	def listar_actividades_riesgo(self, proyecto_id):
		actividad_dao = ProyectoHasRiesgo_ActividadDao()
		return actividad_dao.listar_actividades_riesgo(proyecto_id)

	def validar_actividad(self, proyecto_riesgo, actividad_id):
		actividad_dao = ProyectoHasRiesgo_ActividadDao()
		return actividad_dao.validar_actividad(proyecto_riesgo, actividad_id)