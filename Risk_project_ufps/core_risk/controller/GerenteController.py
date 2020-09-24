from Risk_project_ufps.core_risk.dao.GerenteDao import *


class GerenteController:

	def registrar_gerente(self, id, usuario, correo, nombre, sector, profesion, empresa, pais, metodologia, certificacion):
		gerente_dao = GerenteDao()
		return gerente_dao.registrar_gerente(id, usuario, correo, nombre, sector, profesion, empresa, pais, metodologia, certificacion)

	def obtener_gerente(self, id):
		gerente_dao = GerenteDao()
		return gerente_dao.obtener_gerente(id)

	def validar_gerente(self, usuario):
		gerente_dao = GerenteDao()
		return gerente_dao.validar_gerente(usuario)

	def actualizar_gerente(self, gerente, nombre, correo, profesion, empresa, sector):
		gerente_dao = GerenteDao()
		return gerente_dao.actualizar_gerente(gerente, nombre, correo, profesion, empresa, sector)