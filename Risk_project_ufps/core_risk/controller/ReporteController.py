from Risk_project_ufps.core_risk.dao.RiesgoDao import *

from Risk_project_ufps.core_risk.dto.models import *



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
        nombreEXCEL = "reporte_"+self.get_datetime()
        reporte = reporteEXCEL(titulo, cabecera, registros, nombreEXCEL, propietario).Exportar()
        return nombreEXCEL+".xlsx"
        

    def get_datetime(self):
        now = datetime.now()
        date_time = now.strftime("%m_%d_%Y")
        #print("date and time:",date_time)
        return date_time

    def raw_queryset_as_values_list(self, raw_qs):
        aux = []
        for row in raw_qs:
            riesgo = model_to_dict(row)
            aux.append([
                "R_"+str(riesgo['riesgo_id']),
                riesgo['riesgo_nombre'],
                riesgo['riesgo_causa'],
                riesgo['riesgo_evento'],
                riesgo['riesgo_efecto']
            ])
        return aux