from Risk_project_ufps.core_risk.dao.TareaDao import *
from Risk_project_ufps.core_risk.dao.TareaHasRecursoDao import *
from Risk_project_ufps.core_risk.dto.models import *

class TareaController():

	def registrar_tarea(self, proyecto_riesgo_respuesta, nombre, descripcion):
		tarea_dao = TareaDao()
		return tarea_dao.registrar_tarea(proyecto_riesgo_respuesta, nombre, descripcion)

	def get_tarea_by_id(self, id):
		tarea_dao = TareaDao()
		return tarea_dao.get_tarea_by_id(id)

	def agregar_recurso_tarea(self, tarea, recurso, cantidad):
		tarea_dao = TareaHasRecursoDao()
		return tarea_dao.agregar_recurso_tarea(tarea, recurso, cantidad)

	def get_recurso_tarea_by_id(self, tarea, recurso):
		tarea_dao = TareaHasRecursoDao()
		return tarea_dao.get_recurso_tarea_by_id(tarea, recurso)

	def eliminar_recurso_tarea(self, tarea_recurso):
		tarea_dao = TareaHasRecursoDao()
		return tarea_dao.eliminar_recurso_tarea(tarea_recurso)

	def listar_tareas(self, proyecto):
		tarea_dao = TareaDao()
		return tarea_dao.listar_tareas(proyecto)

	def eliminar_tarea(self, tarea):
		tarea_dao = TareaDao()
		return tarea_dao.eliminar_tarea(tarea)

	def editar_tarea(self, tarea, nombre, descripcion):
		tarea_dao = TareaDao()
		return tarea_dao.editar_tarea(tarea, nombre, descripcion)

	


	

	
	
