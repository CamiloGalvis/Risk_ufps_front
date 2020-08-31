from Risk_project_ufps.core_risk.dao.SubcategoriaDao import *
from Risk_project_ufps.core_risk.dto.models import *

class SubcategoriaController():

	#Lista las subcategorias de un gerente
	def listar_subcategorias(self, id):
		subcategoria_dao = SubcategoriaDao()
		return subcategoria_dao.listar_subcategorias(id)

	#Retorna una subcategoria a partir de un id
	def obtener_subcategoria(self, id):
		subcategoria_dao = SubcategoriaDao()
		return subcategoria_dao.obtener_subcategoria(id)



