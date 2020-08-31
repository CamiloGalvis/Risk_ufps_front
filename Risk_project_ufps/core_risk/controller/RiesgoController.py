from Risk_project_ufps.core_risk.dao.RiesgoDao import *
from Risk_project_ufps.core_risk.dao.SubcategoriaDao import *
from Risk_project_ufps.core_risk.dao.ProyectoDao import *
from Risk_project_ufps.core_risk.dao.ProyectoHasRiesgoDao import *
from Risk_project_ufps.core_risk.dto.models import *

class RiesgoController():

	def registrar_riesgo(self, nombre, causa, evento, efecto, privacidad, tipo, subcategoria):
		riesgo_dao = RiesgoDao()
		return riesgo_dao.registrar_riesgo(nombre, causa, evento, efecto, privacidad, tipo, subcategoria)


	def listar_riesgos(self, id):
		riesgo_dao = RiesgoDao()
		return riesgo_dao.listar_riesgos(id)

	def editar_riesgo(self, riesgo, nombre, causa, evento, efecto, privacidad, tipo, subcategoria):
		riesgo_dao = RiesgoDao()
		return riesgo_dao.editar_riesgo(riesgo, nombre, causa, evento, efecto, privacidad, tipo, subcategoria)

	def obtener_riesgo(self, id):
		riesgo_dao = RiesgoDao()
		return riesgo_dao.obtener_riesgo(id)

	def eliminar_riesgo(self, riesgo):
		riesgo_dao = RiesgoDao()
		return riesgo_dao.eliminar_riesgo(riesgo)

	def registrar_riesgo_proyecto(self, nombre, causa, evento, efecto, privacidad, tipo, subcategoria_id, proyecto_id):
		riesgo_dao = RiesgoDao()
		subcategoria_dao = SubcategoriaDao()
		proyecto_dao = ProyectoDao()
		return riesgo_dao.registrar_riesgo_proyecto(nombre, causa, evento, efecto, privacidad, tipo, subcategoria_dao.obtener_subcategoria(subcategoria_id), proyecto_dao.obtener_proyecto(proyecto_id))

	def asosiar_riesgos_proyecto(self, riesgos, proyecto):
		p_h_r = ProyectoHasRiesgoDao()
		for riesgo in riesgos:		
			p_h_r.registrar_proyecto_riesgo(proyecto, Riesgo(riesgo_id = riesgo))
		return True

	def get_riesgos_by_proyecto(self, proyecto):
		riesgo_dao = RiesgoDao()
		return riesgo_dao.get_riesgos_by_proyecto(proyecto)


	def get_riesgo_by_proyecto(self, proyecto, riesgo):
		p_h_r = ProyectoHasRiesgoDao()
		return p_h_r.get_by_riesgo_and_proyecto(proyecto, riesgo)

	def eliminar_riesgo_by_proyecto(self, riesgo_proyecto):
		p_h_r = ProyectoHasRiesgoDao()
		return p_h_r.eliminar_by_riesgo_and_proyecto(riesgo_proyecto)







