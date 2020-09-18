from Risk_project_ufps.core_risk.dao.TareaDao import *
from Risk_project_ufps.core_risk.dao.TareaHasRecursoDao import *
from Risk_project_ufps.core_risk.dao.RecursoDao import *
from Risk_project_ufps.core_risk.dto.models import *
from django.forms.models import model_to_dict

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

	def listar_tareas_group_by_riesgo(self, proyecto):
		tarea_dao = TareaDao()
		return self.raw_queryset_of_tareas_as_values_list(tarea_dao.listar_tareas(proyecto), proyecto)

	def listar_tareas_with_recursos(self, proyecto):
		tarea_dao = TareaDao()
		return tarea_dao.listar_tareas(proyecto)

	def raw_queryset_of_tareas_as_values_list(self, raw_qs, proyecto):
		recurso_dao = RecursoDao()
		recursos = recurso_dao.listar_recursos_tareas(proyecto)
		aux = {}

		for row in raw_qs:
			llave = 'riesgo_'+str(row.riesgo_id)
			elemento = aux.get(llave)
			aa = model_to_dict(row)
			aa["riesgo_id"] = row.riesgo_id
			aa["recursos"] = self.filtrar_recursos(row.tarea_id, recursos)
			if elemento:
				elemento.append(aa)
			else:
				aux[llave] = [aa,]
		return aux

	def filtrar_recursos(self, tarea_id, recursos):
		"""
		Este metodo es una verguenza para mí, esto deberia hacerce de otra forma mas elegante,
		el problema es que no tengo tiempo. Al menos les ahorre el consultar tarea por tarea en la bd,
		agradezcan por eso. En lo que a mi respecta, esto sale con alguna otra estructura de datos, pero bueno ya
		son las 9:05 pm del 15/09/2020 no pienso trasnocharme tanto.
		"""
		aux = []
		for recurso in recursos:
			if(recurso.tarea_id == tarea_id):
				aux.append(dict(
					recurso_id=recurso.recurso_id,
					recurso_nombre=recurso.recurso_nombre,
					cantidad=recurso.cantidad
				))
		return aux




	

	
	
