from Risk_project_ufps.core_risk.dto.models import Propabilidad

class ProbabilidadDao():

  def listar_probabilidades_by_proyecto(self, proyecto):
    probabilidades = {}
    try:      
      probabilidades = Propabilidad.objects.filter(proyecto = proyecto).order_by("propabilidad_valor")
    except Exception as e:
      raise e
    finally:      
      return probabilidades


