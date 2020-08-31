from contextlib import closing

from django.db import connection

from Risk_project_ufps.core_risk.dto.models import *

class ProyectoHasRiesgoDao():

    def registrar_proyecto_riesgo(self, proyecto, riesgo):
        with closing(connection.cursor()) as cursor:        
            cursor.execute(
                'INSERT INTO riesgos_bd.`proyecto_has_riesgo`(`proyecto_id`, `riesgo_id`)'
                'VALUES (%s, %s)',
                (proyecto.proyecto_id, riesgo.riesgo_id),
            )

    def get_by_riesgo_and_proyecto(self, proyecto, riesgo):        
        proyecto_riesgo = None
        try:        
            proyecto_riesgo = ProyectoHasRiesgo.objects.get(riesgo_id = riesgo, proyecto_id = proyecto)            
        except ProyectoHasRiesgo.DoesNotExist:
            proyecto_riesgo = None
        finally:
            return proyecto_riesgo

    def eliminar_by_riesgo_and_proyecto(self, proyecto_riesgo):        
        proyecto_riesgo = proyecto_riesgo
        try:        
            proyecto_riesgo.delete()            
        except ProyectoHasRiesgo.DoesNotExist:
            proyecto_riesgo = None
        finally:
            return "Se eliminó riesgo del proyecto de forma exitosa."

















