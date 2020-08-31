from Risk_project_ufps.core_risk.dao.ProyectoDao import *
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