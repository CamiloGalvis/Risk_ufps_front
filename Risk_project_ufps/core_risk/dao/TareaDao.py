from Risk_project_ufps.core_risk.dto.models import *
from datetime import date
from datetime import datetime

class TareaDao():

	def registrar_tarea(self, proyecto_riesgo_respuesta, nombre, descripcion, fecha_inicio, fecha_fin):

		tarea = Tarea(    	
				proyecto_has_riesgo_id = proyecto_riesgo_respuesta.proyecto_has_id,
				riesgo_has_respuesta_id = proyecto_riesgo_respuesta.respuesta_has_id,
				tarea_nombre = nombre,
				tarea_descripcion = descripcion,
				fecha_inicio = fecha_inicio,
				fecha_fin = fecha_fin,              
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
			sql = "SELECT t.tarea_id, t.tarea_nombre, t.tarea_descripcion, rp.riesgo_id FROM tarea t " \
						"INNER JOIN proyecto_has_riesgo_respuesta pr " \
						"ON t.proyecto_has_riesgo_id=pr.proyecto_has_id " \
						"AND t.riesgo_has_respuesta_id=pr.respuesta_has_id " \
						"INNER JOIN proyecto_has_riesgo rp ON pr.proyecto_has_id = rp.proyecto_has_riesgo_id " \
						"WHERE rp.proyecto_id = %s"
			tareas = Tarea.objects.raw(sql, [proyecto.proyecto_id])
		except Exception as e:
			print(e)
		finally:
			return tareas

	def listar_tareas_linea(self, proyecto, linea_base):
		tareas = {}
		try:
			sql = "SELECT t.tarea_id, t.tarea_nombre, t.tarea_descripcion, rp.riesgo_id FROM tarea t " \
						"INNER JOIN proyecto_has_riesgo_respuesta pr " \
						"ON t.proyecto_has_riesgo_id=pr.proyecto_has_id " \
						"AND t.riesgo_has_respuesta_id=pr.respuesta_has_id " \
						"INNER JOIN proyecto_has_riesgo rp ON pr.proyecto_has_id = rp.proyecto_has_riesgo_id " \
						"WHERE rp.proyecto_id = %s AND t.proyecto_linea_base = %s AND pr.proyecto_linea_base = %s AND rp.proyecto_linea_base = %s"
			tareas = Tarea.objects.using('base').raw(sql, [proyecto.proyecto_id, linea_base, linea_base, linea_base])
		except Exception as e:
			print(e)
		finally:
			return tareas

	def listar_tareas_with_recursos(self, proyecto):
		tareas = {}
		try:
			sql = "SELECT t.tarea_id, t.tarea_nombre, t.tarea_descripcion, rp.riesgo_id FROM tarea t " \
						"INNER JOIN proyecto_has_riesgo_respuesta pr " \
						"ON t.proyecto_has_riesgo_id=pr.proyecto_has_id " \
						"AND t.riesgo_has_respuesta_id=pr.respuesta_has_id " \
						"INNER JOIN proyecto_has_riesgo rp ON pr.proyecto_has_id = rp.proyecto_has_riesgo_id " \
						"WHERE rp.proyecto_id = %s"
			tareas = Tarea.objects.raw(sql, [proyecto.proyecto_id])
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

	def editar_tarea(self, tarea, nombre, descripcion, fecha_inicio, fecha_fin):
		tarea_editar = tarea
		tarea_editar.tarea_nombre = nombre
		tarea_editar.tarea_descripcion = descripcion
		tarea_editar.fecha_inicio = fecha_inicio
		tarea_editar.fecha_fin = fecha_fin
		try:
			tarea_editar.save()
		except Exception as e:
			print(e)
		finally:
			return tarea_editar




