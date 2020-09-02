from contextlib import closing

from django.db import connection

from Risk_project_ufps.core_risk.dto.models import *

class ProyectoHasRiesgoDao():

    """def registrar_proyecto_riesgo(self, proyecto, riesgo):
        proyecto_riesgo = None
        try:
            proyecto_riesgo = ProyectoHasRiesgo(
                proyecto = proyecto,
                riesgo = riesgo             
            )
            proyecto_riesgo.save()      
        except Error as e:
            print(e)
        finally:
            return proyecto_riesgo"""

    def registrar_proyecto_riesgo(self, proyecto, riesgo):
        with closing(connection.cursor()) as cursor:        
            cursor.execute(
                'INSERT INTO riesgos_bd.`proyecto_has_riesgo`(`proyecto_id`, `riesgo_id`)'
                'VALUES (%s, %s)',
                (proyecto.proyecto_id, riesgo.riesgo_id),
            )


    def registrar_proyecto_riesgo_editado(self, proyecto, riesgo):
        with closing(connection.cursor()) as cursor:        
            cursor.execute(
                'INSERT INTO riesgos_bd.`proyecto_has_riesgo`(`proyecto_id`, `riesgo_id`, `is_editado`)'
                'VALUES (%s, %s, 1)',
                (proyecto.proyecto_id, riesgo.riesgo_id),
            )

    def agregar_responsable_riesgo(self, proyecto_riesgo, responsable):         
        proyecto_riesgo = proyecto_riesgo
        try:        
            proyecto_riesgo.responsable = responsable
            proyecto_riesgo.save()         
        except ProyectoHasRiesgo.DoesNotExist:
            proyecto_riesgo = None
        finally:
            return "Se actualizo responsable al riesgo exitosamente."

    def listar_responsables_riesgo(self, proyecto_id):
        responsables_riesgo = {}
        try:
            #Revisar esta consulta
            responsables_riesgo = Responsble.objects.raw("SELECT * FROM responsble re INNER JOIN proyecto_has_riesgo pr ON re.responsable_id=pr.responsable_id WHERE pr.proyecto_id = %s", [proyecto_id])
        
        except Error as e:
            print(e)

        finally:
            return responsables_riesgo 

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















