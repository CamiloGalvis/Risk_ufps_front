from Risk_project_ufps.core_risk.dto.models import ClasificacionRiesgo

class ClasificacionRiesgoDao():

  def listar_clasificaciones_by_proyecto(self, proyecto):
    clasificaciones = {}
    try:      
      clasificaciones = ClasificacionRiesgo.objects.filter(proyecto = proyecto).order_by('clasificacion_riesgo_min')
    except Exception as e:
      print(e)      
    finally:      
      return clasificaciones


