from Risk_project_ufps.core_risk.dao.RiesgoDao import *
from Risk_project_ufps.core_risk.dao.ResponsableDao import *
from Risk_project_ufps.core_risk.dao.ImpactoDao import *
from Risk_project_ufps.core_risk.dao.ProbabilidadDao import *

from Risk_project_ufps.core_risk.controller.RiesgoController import *
from Risk_project_ufps.core_risk.controller.RespuestaController import *
from Risk_project_ufps.core_risk.controller.ResponsableController import *

from Risk_project_ufps.core_risk.dto.models import Proyecto

from Risk_project_ufps.core_risk.util.reporteEXCEL import *

from datetime import datetime

from django.forms.models import model_to_dict


class ReporteController():

    def generar_reporte_identificar(self, proyecto):
        """Llamar la función Exportar, la cuál esta en la clase reporteEXCEL,
       a esta clase le pasamos el título de la tabla, la cabecera, los
       registros y el nombre del archivo xlsx (EXCEL)."""
        propietario = proyecto.gerente.gerente_nombre
        titulo = "REPORTE PROYECTO " + proyecto.proyecto_nombre
        cabecera = ("CODIGO", "RIESGO", "CAUSAS", "EVENTO", "EFECTOS")
        riesgo_dao = RiesgoDao()
        riesgos = riesgo_dao.get_riesgos_by_proyecto(proyecto)
        registros = self.raw_queryset_as_values_list(riesgos)
        """registros = [(1110800310, "Andres", "Niño", "06/06/2019", "we", 43),
             (1110800311, "Andres", "Niño", "06/06/2019",  "we", 43),
             (1110800312, "Andres", "Niño", "06/06/2019",  "we", 43),
             ]"""
        nombreEXCEL = "reporte_" + self.get_datetime()
        reporte = reporteEXCEL(titulo, cabecera, registros, nombreEXCEL, propietario).Exportar()
        return nombreEXCEL + ".xlsx"

    def generar_reporte_planificar(self, proyecto):
        """Llamar la función Exportar, la cuál esta en la clase reporteEXCEL,
       a esta clase le pasamos el título de la tabla, la cabecera, los
       registros y el nombre del archivo xlsx (EXCEL)."""
        propietario = proyecto.gerente.gerente_nombre
        titulo = "REPORTE PROYECTO " + proyecto.proyecto_nombre
        cabecera = ("RESPONSABLE", "DESCRIPCION")
        responsable_dao = ResponsableDao()
        responsables = responsable_dao.listar_responsables(proyecto.proyecto_id)
        registros = self.tamizar_responsables(responsables)
        """registros = [(1110800310, "Andres", "Niño", "06/06/2019", "we", 43),
             (1110800311, "Andres", "Niño", "06/06/2019",  "we", 43),
             (1110800312, "Andres", "Niño", "06/06/2019",  "we", 43),
             ]"""
        nombreEXCEL = "reporte_" + self.get_datetime()
        reporte = reporteEXCEL(titulo, cabecera, registros, nombreEXCEL, propietario).Exportar_planificar(
            proyecto.proyecto_objetivo, proyecto.proyecto_alcance)
        return nombreEXCEL + ".xlsx"

    def generar_reporte_evaluar(self, proyecto: Proyecto):
        """Llamar la función Exportar, la cuál esta en la clase reporteEXCEL,
       a esta clase le pasamos el título de la tabla, la cabecera, los
       registros y el nombre del archivo xlsx (EXCEL)."""
        propietario = proyecto.gerente.gerente_nombre
        titulo = "REPORTE PROYECTO " + proyecto.proyecto_nombre
        cabecera = ("CÓDIGO", "RIESGO", "IMPACTO", "PROBABILIDAD", "TOTAL")

        riesgo_dao = RiesgoDao()
        riesgos = riesgo_dao.get_riesgos_by_proyecto(proyecto)
        registros = self.raw_queryset_as_values_list_evaluar(riesgos, proyecto)
        nombreEXCEL = "reporte_" + self.get_datetime()
        reporte = reporteEXCEL(titulo, cabecera, registros, nombreEXCEL, propietario).exportar_evaluar(
            proyecto.proyecto_objetivo, proyecto.proyecto_alcance)
        return nombreEXCEL + ".xlsx"

    def generar_reporte_planificar_respuesta(self, proyecto):
        """
        :type proyecto: Proyecto
        """
        propietario = proyecto.gerente.gerente_nombre
        titulo = "REPORTE PROYECTO " + proyecto.proyecto_nombre
        cabecera = ("CÓDIGO", "RIESGO", "TOTAL", "ACCIONES", "RESPONSABLE", "CRONOGRAMA")

        riesgo_controller = RiesgoController()
        respuesta_controller = RespuestaController()
        responsable_controller = ResponsableController()

        #son las respuestas de los riesgos del proyecto
        respuestas = respuesta_controller.listar_riesgos_respuesta(proyecto.proyecto_id)
        #Este es un consulta sql que contienetodo de la tabla proyecto_has_riesgo
        responsables = responsable_controller.obtener_responsables_by_proyecto_group_for_riesgos(proyecto.proyecto_id)
        # A continuacion voy hacer un merge detodo lo de arriba
        registros=[]
        for responsable in responsables:
            print(type(responsable), responsable)
            total = responsable.impacto.impacto_valor * responsable.propabilidad.propabilidad_valor
            print(total)
            aux=(
                'R_'+str(responsable.riesgo_id),
                responsable.riesgo.riesgo_nombre,
                self.filtrar_respuestas_riesgo(respuestas, responsable.riesgo_id),
                total,
                responsable.responsable.responsble_nombre,
                responsable.fecha_manifestacion,
            )
            registros.append(aux);

        nombre_excel = "reporte_" + self.get_datetime()
        reporte = reporteEXCEL(titulo, cabecera, registros, nombre_excel, propietario)
        reporte.exportar_planificar_respuesta(proyecto.proyecto_objetivo, proyecto.proyecto_alcance)
        return nombre_excel + ".xlsx"

    def filtrar_respuestas_riesgo(self, respuestas, riesgo_id):
        key = "riesgo_"+str(riesgo_id)
        aux = respuestas.get(key)
        mensaje = ""
        if aux:
            for respuesta in aux:
                mensaje += mensaje + "- " + respuesta['respuesta_nombre'] + "\n"
        return mensaje

    def get_datetime(self):
        now = datetime.now()
        date_time = now.strftime("%m_%d_%Y")
        # print("date and time:",date_time)
        return date_time

    def raw_queryset_as_values_list(self, raw_qs):
        aux = []
        for row in raw_qs:
            riesgo = model_to_dict(row)
            aux.append([
                "R_" + str(riesgo['riesgo_id']),
                riesgo['riesgo_nombre'],
                riesgo['riesgo_causa'],
                riesgo['riesgo_evento'],
                riesgo['riesgo_efecto']
            ])
        return aux

    def raw_queryset_as_values_list_evaluar(self, raw_qs, proyecto):
        """

        :type proyecto: Proyecto
        """
        impacto_dao = ImpactoDao()
        probabilidad_dao = ProbabilidadDao()
        valores = {}
        aux = []
        for row in raw_qs:

            riesgo = model_to_dict(row)
            impacto = valores.get("i_" + str(row.riesgo_id))
            probabilidad = valores.get("p_" + str(row.riesgo_id))
            if impacto is None:
                impacto = impacto_dao.obtener_impacto_by_id_and_proyecto(row.impacto_id, proyecto)
                valores["i_" + str(row.riesgo_id)] = impacto
            print("row", row)
            print("impacto: ", impacto, " - ", row.impacto_id)
            if probabilidad is None:
                probabilidad = probabilidad_dao.obtener_probabilidad_by_id(row.propabilidad_id)
                valores["p_" + str(row.riesgo_id)] = probabilidad
            aux.append([
                "R_" + str(riesgo['riesgo_id']),
                riesgo['riesgo_nombre'],
                impacto.impacto_categoria,
                probabilidad.propabilidad_categoria,
                (impacto.impacto_valor * probabilidad.propabilidad_valor)
            ])
        return aux

    def tamizar_responsables(self, raw_qs):
        aux = []
        for row in raw_qs:
            responsable = model_to_dict(row)
            aux.append([
                responsable['responsble_nombre'],
                responsable['responsble_descripcion']
            ])
        return aux
