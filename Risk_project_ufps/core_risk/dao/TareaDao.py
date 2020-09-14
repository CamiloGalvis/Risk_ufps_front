from Risk_project_ufps.core_risk.dto.models import *

class TareaDao():

  def registrar_tarea(self, proyecto_riesgo_respuesta, nombre, descripcion):

    tarea = Tarea(    	
        proyecto_has_riesgo_id = proyecto_riesgo_respuesta.proyecto_has_id,
        riesgo_has_respuesta_id = proyecto_riesgo_respuesta.respuesta_has_id,
        tarea_nombre = nombre,
        tarea_descripcion = descripcion        
    )	
    try:
    	tarea.save()      
    except Error as e:
      print(e)
    finally:      
      return tarea

  def get_tarea_by_id(self, id):
    tarea = None
    try:
      tarea = Tarea.objects.get(tarea_id=id)     
    except Exception as e:
      print(e)
    finally:
      return tarea

  def listar_tareas(self, proyecto):
    tareas = {}
    try:
      tareas = Tarea.objects.raw("SELECT * FROM tarea t INNER JOIN proyecto_has_riesgo_respuesta pr ON t.proyecto_has_riesgo_id=pr.proyecto_has_id AND t.riesgo_has_respuesta_id=pr.respuesta_has_id INNER JOIN proyecto_has_riesgo rp ON pr.proyecto_has_id = rp.proyecto_has_riesgo_id WHERE rp.proyecto_id = %s", [proyecto.proyecto_id])
    except Exception as e:
      print(e)
    finally:
      return tareas

  def eliminar_tarea(self, tarea):
    tarea_eliminar = tarea
    try:
      tarea_eliminar.delete()
    except Exception as e:
      print(e)
    finally:
      return "Tarea eliminada de forma exitosa."

  def editar_tarea(self, tarea, nombre, descripcion):
    tarea_editar = tarea
    tarea_editar.tarea_nombre = nombre
    tarea_editar.tarea_descripcion = descripcion
    try:
      tarea_editar.save()
    except Exception as e:
      print(e)
    finally:
      return tarea_editar



