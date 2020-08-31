from Risk_project_ufps.core_risk.dto.models import *

class ProyectoDao():
    
  def registrar_proyecto(self, nombre, objetivo, alcance, descripcion, presupuesto, fecha_inicio, gerente, sector):
  	proyecto = Proyecto(
  		proyecto_nombre = nombre,
        proyecto_objetivo = objetivo,
        proyecto_alcance = alcance,
        proyecto_descripcion = descripcion,
        proyecto_presupuesto = presupuesto,
        proyecto_fecha_inicio = fecha_inicio,
        gerente = gerente,
        sector = sector,
        proyecto_rbs_status = 0)
  	try:
  		proyecto.save()
  	except Error as e:
  		print(e)
  	finally:
  		return "Se registro un proyecto exitosamente."

  def obtener_proyecto(self, id):
    proyecto = None
    try:
      proyecto = Proyecto.objects.get(proyecto_id=id)
    except Error as e:
      print(e)
    finally:      
      return proyecto

  def editar_proyecto(self, proyecto, nombre, objetivo, alcance, descripcion, presupuesto, fecha_inicio, sector):
    proyecto = proyecto
    try:
      proyecto.proyecto_nombre = nombre
      proyecto.proyecto_objetivo = objetivo
      proyecto.proyecto_alcance = alcance
      proyecto.proyecto_descripcion = descripcion
      proyecto.proyecto_presupuesto = presupuesto
      proyecto.proyecto_fecha_inicio = fecha_inicio
      proyecto.sector = sector
      proyecto.save()
    except Error as e:
      print(e)
    finally:      
      return "Se actualizo la información del proyecto de forma exitosamente."



  def listar_proyectos(self, id):
    proyectos = {}
    try:
      proyectos = Proyecto.objects.filter(gerente_id=id)
    except Error as e:
      print(e)
    finally:      
      return proyectos