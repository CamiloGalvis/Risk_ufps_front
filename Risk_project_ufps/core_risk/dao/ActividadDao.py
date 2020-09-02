from Risk_project_ufps.core_risk.dto.models import *

class ActividadDao():

  def listar_actividades_proyecto(self, proyecto_id):
    actividades = {}
    try:
    	actividades= Actividad.objects.filter(proyecto_id=proyecto_id)
    except Error as e:
      print(e)
    finally:      
      return actividades

  def obtener_actividad(self, actividad_id):
    actividad = None
    try:
    	actividad = Actividad.objects.get(actividad_id=actividad_id)
    except Error as e:
      print(e)
    finally:      
      return actividad
