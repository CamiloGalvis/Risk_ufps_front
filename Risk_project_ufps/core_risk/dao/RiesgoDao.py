from Risk_project_ufps.core_risk.dao.ProyectoHasRiesgoDao import *

from Risk_project_ufps.core_risk.dto.models import *

class RiesgoDao():

    def registrar_riesgo(self, nombre, causa, evento, efecto, privacidad, tipo, subcategoria):
        """ Yo no se porque devuelve una cadena, lo mejor que se me ocurrio fue hacer otro metodo"""
        try:
            riesgo = Riesgo(
                riesgo_nombre = nombre,
                riesgo_causa = causa,
                riesgo_evento = evento,
                riesgo_efecto = efecto,
                riesgo_privacidad = privacidad,
                riesgo_tipo = tipo,             
                sub_categoria = subcategoria)
            riesgo.save()       
        except Error as e:
            print(e)
        finally:
            return "Se registró un riesgo exitosamente."

    def listar_riesgos(self, id):
        riesgos = {}
        try:
            riesgos = Riesgo.objects.raw("SELECT * FROM riesgo ri INNER JOIN sub_categoria s ON ri.sub_categoria_id=s.sub_categoria_id INNER JOIN categoria c ON s.categoria_id=c.categoria_id INNER JOIN rbs r ON c.rbs_id = r.rbs_id WHERE r.gerente_id = %s", [id])
                        
        except Error as e:
            print(e)

        finally:
            return riesgos


    def editar_riesgo(self, riesgo, nombre, causa, evento, efecto, privacidad, tipo, subcategoria):
        riesgo = riesgo
        try:

            riesgo.riesgo_nombre = nombre
            riesgo.riesgo_causa = causa
            riesgo.riesgo_evento = evento
            riesgo.riesgo_efecto = efecto
            riesgo.riesgo_privacidad = privacidad
            riesgo.riesgo_tipo = tipo               
            riesgo.sub_categoria = subcategoria
            riesgo.save()       
        except Error as e:
            print(e)

        finally:
            return "Se de actualizo información del riesgo exitosamente."

    def obtener_riesgo(self, id):
        riesgo = {}
        try:
            riesgo = Riesgo.objects.get(riesgo_id=id)

        except Error as e:
            print(e)

        finally:
            return riesgo

    def eliminar_riesgo(self, riesgo):
        riesgo = riesgo
        try:
            riesgo.delete()

        except Error as e:
            print(e)

        finally:
            return "Se elimino riesgo exitosamente."

    def get_riesgo_by_subcategoria(self, subcategoria):
        riesgos = None
        try:
            riesgos = Riesgo.objects.filter(sub_categoria=subcategoria)
        except Error as e:
            print(e)
        finally:
            return riesgos

    def registrar_riesgo_proyecto(self, nombre, causa, evento, efecto, privacidad, tipo, subcategoria, proyecto):
        riesgo = Riesgo(riesgo_nombre = nombre, riesgo_causa = causa, riesgo_evento = evento, riesgo_efecto = efecto, riesgo_privacidad = privacidad,   riesgo_tipo = tipo, sub_categoria = subcategoria)
        riesgo.save()   
        p_h_r_dao = ProyectoHasRiesgoDao()
        return p_h_r_dao.registrar_proyecto_riesgo(proyecto, riesgo)


    def riesgo_is_proyecto(self, riesgo, proyecto): 
        p_h_r_dao = ProyectoHasRiesgoDao()
        return p_h_r_dao.get_by_riesgo_and_proyecto(riesgo, proyecto)


    def get_riesgos_by_proyecto(self, proyecto):
        riesgos = []
        try:
            sql = "SELECT r.`riesgo_id`, r.`riesgo_nombre`, r.`riesgo_causa`, r.`riesgo_evento`, r.`riesgo_efecto`,r.`riesgo_tipo`,r.`riesgo_prom_evaluacion`,r.`riesgo_privacidad`,r.`riesgo_uid`,r.`sub_categoria_id` FROM `riesgo` r INNER JOIN proyecto_has_riesgo p_h_r ON r.`riesgo_id` = p_h_r.riesgo_id WHERE p_h_r.proyecto_id = %s"
            riesgos = Riesgo.objects.raw(sql, [proyecto.proyecto_id,])
        except Exception as e:
            print(e)
        finally:
            return riesgos

    def get_riesgos_by_sector_distinct_gerente(self, sector, gerente):
        """Consulta todos los riesgos de la base de datos los cuales
        esten asignados a proyectos de determinado sector, diferentes al proyecto actual.

        Son riesgos obtenidos 
        
        Parámetros:
        sector -- Model Sector de la base de datos
        
        Excepciones:
        ValueError -- Si sector no existe      
        """
        riesgos = []
        try:
            sql = "SELECT DISTINCT r.`riesgo_id`, r.`riesgo_nombre`, r.`riesgo_causa`, r.`riesgo_evento`, r.`riesgo_efecto`,r.`riesgo_tipo`,r.`riesgo_prom_evaluacion`,r.`riesgo_privacidad`,r.`riesgo_uid`,r.`sub_categoria_id` FROM `riesgo` r INNER JOIN proyecto_has_riesgo p_h_r ON r.`riesgo_id` = p_h_r.riesgo_id INNER JOIN proyecto p ON p_h_r.proyecto_id = p.proyecto_id WHERE p.sector_id = %s AND p.gerente_id <> %s GROUP BY r.`riesgo_nombre`"
            riesgos = Riesgo.objects.raw(sql, [sector.sector_id, gerente.gerente_id,])
        except Exception as e:
            print(e)
        finally:
            return riesgos


    def clonar_riesgo(self, nombre, riesgo_uid, subcategoria):
        riesgo = None
        try:
            riesgo = Riesgo.objects.create(
                riesgo_nombre = nombre,
                riesgo_causa = "",
                riesgo_evento = "",
                riesgo_efecto = "",
                riesgo_privacidad = 0,
                riesgo_tipo = 0,    
                riesgo_uid = riesgo_uid,         
                sub_categoria = subcategoria)           
        except Exception as e:
            raise e
        finally:
            return riesgo
            