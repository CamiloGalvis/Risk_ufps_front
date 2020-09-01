from Risk_project_ufps.core_risk.dao.ActividadDao import *
from Risk_project_ufps.core_risk.dto.models import *

class ActividadController(): 

	def listar_actividades_proyecto(self, proyecto_id):
		actividad_dao = ActividadDao()
		return actividad_dao.listar_actividades_proyecto(proyecto_id)
