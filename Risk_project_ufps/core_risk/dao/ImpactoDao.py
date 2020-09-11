from Risk_project_ufps.core_risk.dto.models import *

class ImpactoDao():

  def listar_impactos_by_proyecto(self, proyecto):
    impactos = {}
    try:      
      impactos = Impacto.objects.filter(proyecto = proyecto).order_by('impacto_valor')
    except Exception as e:
      raise e
    finally:      
      return impactos


