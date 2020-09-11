from Risk_project_ufps.core_risk.dao.ProyectoDao import *
from Risk_project_ufps.core_risk.dao.ImpactoDao import *
from Risk_project_ufps.core_risk.dao.ProbabilidadDao import *
from Risk_project_ufps.core_risk.dao.ClasificacionRiesgoDao import *
from Risk_project_ufps.core_risk.dto.models import *

class ProyectoController():  

	def registrar_proyecto(nombre, objetivo, alcance, descripcion, presupuesto, fecha_inicio, gerente, sector):
		proyecto_dao = ProyectoDao()
		return proyecto_dao.registrar_proyecto(nombre, objetivo, alcance, descripcion, presupuesto, fecha_inicio, gerente, sector)

	def listar_proyectos(self, id):
		proyecto_dao = ProyectoDao()
		return proyecto_dao.listar_proyectos(id)

	def obtener_proyecto(self, id):
		proyecto_dao = ProyectoDao()
		return proyecto_dao.obtener_proyecto(id)

	def editar_proyecto(self, proyecto, nombre, objetivo, alcance, descripcion, presupuesto, fecha_inicio, sector):
		proyecto_dao = ProyectoDao()
		return proyecto_dao.editar_proyecto(proyecto, nombre, objetivo, alcance, descripcion, presupuesto, fecha_inicio, sector)

	def has_actividades(self, proyecto_id):
		proyecto_dao = ProyectoDao()
		proyecto = Proyecto(proyecto_id = proyecto_id)
		return proyecto_dao.has_actividades(proyecto)

	def obtener_impactos_by_proyecto_id(self, proyecto_id):
		impacto_dao = ImpactoDao()
		proyecto = Proyecto(proyecto_id = proyecto_id)
		return impacto_dao.listar_impactos_by_proyecto(proyecto)

	def obtener_probabilidades_by_proyecto_id(self, proyecto_id):
		probabilidad_dao = ProbabilidadDao()
		proyecto = Proyecto(proyecto_id = proyecto_id)
		r = probabilidad_dao.listar_probabilidades_by_proyecto(proyecto)
		#print("pc",proyecto)
		#print("pc",r)
		return r

	def obtener_clasificaciones_riesgo_by_proyecto_id(self, proyecto_id):
		clasificacion_riesgo_dao = ClasificacionRiesgoDao()
		proyecto = Proyecto(proyecto_id = proyecto_id)
		return clasificacion_riesgo_dao.listar_clasificaciones_by_proyecto(proyecto)


	def actualizar_impactos_by_proyecto_id(self, impactos, proyecto_id):
		impacto_dao = ImpactoDao()
		proyecto = Proyecto(proyecto_id = proyecto_id)
		impactos_old = impacto_dao.listar_impactos_by_proyecto(proyecto)
		aux = []
		for impacto in impactos:
			impacto_aux = impacto_dao.get_by_name_and_proyecto(impacto["nombre"], proyecto)
			if(impacto_aux):
				impacto_aux = impacto_dao.actualizar_impacto(impacto, impacto["nombre"], impacto["valor"])
			else:
				impacto_aux = impacto_dao.crear_impacto(impacto["nombre"], impacto["valor"])
			aux.append(impacto_aux.impacto_id)
		for impacto_old in impactos_old:
			if impacto_old.impacto_id not in aux:
				impacto_old.delete()


	def actualizar_probabilidades_by_proyecto_id(self, probabilidades, proyecto_id):
		probabilidad_dao = ProbabilidadDao()
		proyecto = Proyecto(proyecto_id = proyecto_id)
		#probabilidades_old = probabilidad_dao.listar_probabilidades_by_proyecto(proyecto)
		aux = []
		for probabilidad in probabilidades:
			probabilidad_aux = probabilidad_dao.get_by_name_and_proyecto(probabilidad["nombre"], proyecto)
			if(impacto_aux):
				probabilidad_aux = probabilidad_dao.actualizar_probabilidad(probabilidad, probabilidad["nombre"], probabilidad["valor"])
			else:
				probabilidad_aux = probabilidad_dao.crear_probabilidad(probabilidad["nombre"], probabilidad["valor"])
			aux.append(impacto_aux.impacto_id)
		for probabilidad_old in probabilidades_old:
			if probabilidad_old.impacto_id not in aux:
				probabilidad_old.delete()









