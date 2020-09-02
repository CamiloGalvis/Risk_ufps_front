from Risk_project_ufps.core_risk.dao.RiesgoDao import *
from Risk_project_ufps.core_risk.dao.CategoriaDao import *
from Risk_project_ufps.core_risk.dao.SubcategoriaDao import *
from Risk_project_ufps.core_risk.dao.ProyectoDao import *
from Risk_project_ufps.core_risk.dao.ProyectoHasRiesgoDao import *
from Risk_project_ufps.core_risk.dao.RbsDao import *

from Risk_project_ufps.core_risk.dto.models import *

class RiesgoController():

    def registrar_riesgo(self, nombre, causa, evento, efecto, privacidad, tipo, subcategoria):
        riesgo_dao = RiesgoDao()
        return riesgo_dao.registrar_riesgo(nombre, causa, evento, efecto, privacidad, tipo, subcategoria)


    def listar_riesgos(self, id):
        riesgo_dao = RiesgoDao()
        return riesgo_dao.listar_riesgos(id)

    def editar_riesgo(self, riesgo, nombre, causa, evento, efecto, privacidad, tipo, subcategoria):
        riesgo_dao = RiesgoDao()
        return riesgo_dao.editar_riesgo(riesgo, nombre, causa, evento, efecto, privacidad, tipo, subcategoria)

    def obtener_riesgo(self, id):
        riesgo_dao = RiesgoDao()
        return riesgo_dao.obtener_riesgo(id)

    def eliminar_riesgo(self, riesgo):
        riesgo_dao = RiesgoDao()
        return riesgo_dao.eliminar_riesgo(riesgo)

    def registrar_riesgo_proyecto(self, nombre, causa, evento, efecto, privacidad, tipo, subcategoria_id, proyecto_id):
        riesgo_dao = RiesgoDao()
        subcategoria_dao = SubcategoriaDao()
        proyecto_dao = ProyectoDao()
        return riesgo_dao.registrar_riesgo_proyecto(nombre, causa, evento, efecto, privacidad, tipo, subcategoria_dao.obtener_subcategoria(subcategoria_id), proyecto_dao.obtener_proyecto(proyecto_id))

    def asosiar_riesgos_proyecto(self, riesgos, proyecto):
        p_h_r = ProyectoHasRiesgoDao()
        for riesgo in riesgos:      
            p_h_r.registrar_proyecto_riesgo(proyecto, Riesgo(riesgo_id = riesgo))
        return True

    def asosiar_riesgos_sugeridos_proyecto(self, riesgos, proyecto):
        p_h_r = ProyectoHasRiesgoDao()
        riesgo_dao = RiesgoDao()

        rbs = {}

        subcategoria_dao = SubcategoriaDao()

        categoria_dao =CategoriaDao()

        rbs_dao = RbsDao()

        for riesgo in riesgos:  
            
            aux = riesgo_dao.obtener_riesgo(riesgo)
            sub_categoria_aux = aux.sub_categoria            
            try:
                key = 'sub_'+str(sub_categoria_aux.sub_categoria_id)
                sub_aux = rbs.get(key)
                if (sub_aux):       
                    riesgo_nuevo = riesgo_dao.registrar_riesgo(aux.riesgo_nombre, "", "", "", 0, 0, rbs[key])
                else:
                    print("gerene", proyecto.gerente)
                    rbs_model = rbs_dao.get_rbs_gerente_id(proyecto.gerente)
                    print("rbs_model", rbs_model)                
                    categoria_aux = categoria_dao.duplicar_categoria_2(sub_categoria_aux.categoria, rbs_model)
                    print("categoria_aux", categoria_aux)
                    sub_categoria_aux = subcategoria_dao.duplicar_sub_categoria_2(categoria_aux, sub_categoria_aux)                
                    print("sub_categoria_aux", sub_categoria_aux)
                    rbs[key] = sub_categoria_aux
                    riesgo_nuevo = riesgo_dao.clonar_riesgo(aux.riesgo_nombre, aux.riesgo_uid, sub_categoria_aux)  
                    print("riesgo_nuevo", riesgo_nuevo)
                p_h_r.registrar_proyecto_riesgo(proyecto, riesgo_nuevo)
            except Exception as e:
                raise e
            finally:
                pass
            
        return True 

    def get_riesgo_by_proyecto(self, proyecto, riesgo): 
        p_h_r = ProyectoHasRiesgoDao()
        return p_h_r.get_by_riesgo_and_proyecto(proyecto, riesgo)

    def get_riesgos_by_proyecto(self, proyecto):
        riesgo_dao = RiesgoDao()
        return riesgo_dao.get_riesgos_by_proyecto(proyecto)

    def eliminar_riesgo_by_proyecto(self, riesgo_proyecto):
        p_h_r = ProyectoHasRiesgoDao()
        return p_h_r.eliminar_by_riesgo_and_proyecto(riesgo_proyecto)

    def agregar_responsable_riesgo(self, riesgo_proyecto, responsable):
        p_h_r = ProyectoHasRiesgoDao()
        return p_h_r.agregar_responsable_riesgo(riesgo_proyecto,  responsable)

    def listar_responsables_riesgo(self, proyecto_id):
        p_h_r = ProyectoHasRiesgoDao()
        return p_h_r.listar_responsables_riesgo(proyecto_id)

    def get_riesgos_sugeridos(self, sector, gerente_id):
        """ Busca todos los riesgos dentro de todos los proyectos
        de un sector especifico, excluyendo a los riesgos propios del gerente"""

        riesgo_dao = RiesgoDao()
        gerente = Gerente(gerente_id = gerente_id)

        r = riesgo_dao.listar_riesgos(gerente_id)
        
        riesgos_propios = self.raw_queryset_as_dictionary(r)

        riesgos_sugeridos = riesgo_dao.get_riesgos_by_sector_distinct_gerente(sector, gerente)

        print(riesgos_propios)

        for riesgo_s in riesgos_sugeridos:
            aux = riesgos_propios.get(riesgo_s.riesgo_nombre)
            if (aux):
                del riesgo_s

        return riesgos_sugeridos
 

    def raw_queryset_as_dictionary(self, raw_qs):
        aux = {}
        for row in raw_qs:           
            aux[row.riesgo_nombre] = row
        return aux






