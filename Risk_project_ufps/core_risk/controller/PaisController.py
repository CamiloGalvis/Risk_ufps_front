from Risk_project_ufps.core_risk.dao.PaisDao import *
from Risk_project_ufps.core_risk.dto.models import *

class PaisController():  

	def listar_paises(self):
		pais_dao = PaisDao()
		return pais_dao.listar_paises()
		
