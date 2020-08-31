from Risk_project_ufps.core_risk.dao.GerenteDao import *
from Risk_project_ufps.core_risk.dto.models import *

class GerenteController(): 

	def registrar_gerente(self, id, usuario, correo, nombre, sector, profesion, empresa, pais):
		gerente_dao = GerenteDao()
		return gerente_dao.registrar_gerente(id, usuario, correo, nombre, sector, profesion, empresa, pais)

	def obtener_gerente(self, id):
		gerente_dao = GerenteDao()
		return gerente_dao.obtener_gerente(id)

	def actualizar_gerente(self, gerente, nombre, correo, profesion, empresa, sector):
		gerente_dao = GerenteDao()
		return gerente_dao.actualizar_gerente(gerente, nombre, correo, profesion, empresa, sector)