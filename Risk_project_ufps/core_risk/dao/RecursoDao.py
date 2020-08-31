from Risk_project_ufps.core_risk.dto.models import *

class RecursoDao():
    
  def registrar_recurso(self, proyecto, nombre, costo, tipo_recurso):
  	recurso = Recurso(
  		  recurso_nombre = nombre,
        recurso_costo = costo,
        tipo_recurso_id = tipo_recurso,
        proyecto = proyecto)
  	try:
  		recurso.save()
  	except Error as e:
  		print(e)
  	finally:
  		return "Se registro un recurso exitosamente."

  def listar_recursos(self, id):
    recrusos = {}
    try:
      recursos = Recurso.objects.filter(proyecto_id=id) 
    except Error as e:
      print(e)
    finally:
      return recursos

  def obtener_recurso(self, id):
    recruso = {}
    try:
      recurso = Recurso.objects.get(recurso_id=id)
    except Error as e:
      print(e)
    finally:
      return recurso

  def eliminar_recurso(self, recurso):
    recruso = recurso
    try:
      recurso.delete()
    except Error as e:
      print(e)
    finally:
      return "Se eliminó recurso exitosamente."

  def editar_recurso(self, recurso, nombre, costo):
    recurso = recurso
    try:
      recurso.recurso_nombre = nombre
      recurso.recurso_costo = costo
      recurso.save()
    except Error as e:
      print(e)
    finally:
      return "Se actualizó la información del recurso exitosamente."



