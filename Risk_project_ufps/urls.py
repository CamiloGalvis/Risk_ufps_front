from django.urls import path, include
from Risk_project_ufps.views import *


urlpatterns = [

    # urls metodos generales de usuario 

    # urls para el manejo de sesiones
    path('accounts/', include('django.contrib.auth.urls')),
    
    # urls de gerentes
    path('registrargerente/', registrar_gerente, name='registrargerente'),
    path('gerente/registrar/', nuevo_gerente, name='nuevo_gerente'),
    path('mi_perfil/', mi_perfil, name='mi_perfil'),

    # urls de proyectos
    path('inicio/', inicio,  name='inicio'),
    path('nuevoproyecto/', nuevo_proyecto, name='nuevo_proyecto'),

    # urls de RBS
    path('mi_rbs/', mi_rbs,  name='mi_rbs'),
    path('rbs/configurar/', rbs_configurar,  name='rbs_configurar'),
    path('nuevoriesgo/', nuevo_riesgo, name='nuevoriesgo'),
    path('mis_riesgos/', mis_riesgos, name='mis_riesgos'),
    path('editar_riesgo/', editar_riesgo, name='editar_riesgo'),
    path('eliminar_riesgo/', eliminar_riesgo, name='eliminar_riesgo'),     

    # urls de respuestas    
    path('nueva_respuesta/', nueva_respuesta, name='nueva_respuesta'),
    path('mis_respuestas/', mis_respuestas, name='mis_respuestas'),
    path('eliminar_respuesta/', eliminar_respuesta, name='eliminar_respuesta'),    
    path('editar_respuesta/', editar_respuesta, name='editar_respuesta'),

    # urls tipo de recurso
    path('tipo_recurso/', tipo_recurso, name='tipo_recurso'),
    path('eliminar_tipo_recurso/', eliminar_tipo_recurso, name='eliminar_tipo_recurso'),
    path('editar_tipo_recurso/', editar_tipo_recurso, name='editar_tipo_recurso'),

    # urls roles equipo de trabajo
    path('roles_equipo/', roles_equipo, name='roles_equipo'),
    path('nuevo_rol/', nuevo_rol, name='nuevo_rol'),
    path('editar_rol/', editar_rol, name='editar_rol'),
    path('eliminar_rol/', eliminar_rol, name='eliminar_rol'),

    #urls mi proyecto
    path('mi_proyecto/<int:id>/', mi_proyecto, name='mi_proyecto'),     
    path('mi_proyecto/<int:proyecto_id>/planificar/', planificar_proyecto, name='mi_proyecto'),
    path('mi_proyecto/registrar_responsable/', registrar_responsable, name='registrar_responsable'),    
    path('mi_proyecto/editar_responsable/', editar_responsable, name='editar_responsable'),
    path('mi_proyecto/eliminar_responsable/', eliminar_responsable, name='eliminar_responsable'),
    
    path('mi_proyecto/<int:proyecto_id>/identificar/', identificar_proyecto, name='mi_proyecto'),
    path('proyecto/riesgo/insertar/', registrar_riesgo_proyecto, name='mi_proyecto'),
    path('proyecto/<int:proyecto_id>/eliminar_riesgo/', eliminar_riesgo_proyecto, name='eliminar_riesgo_proyecto'),
    path('proyecto/<int:proyecto_id>/nueva_respuesta/', proyecto_nueva_respuesta, name='proyecto_nueva_respuesta'),
    path('proyecto/<int:proyecto_id>/responsable_riesgo/', nuevo_responsable_riesgo, name='nuevo_responsable_riesgo'),
    path('proyecto/<int:proyecto_id>/actividad_riesgo/', nueva_actividad_riesgo, name='nueva_actividad_riesgo'),
    path('proyecto/<int:proyecto_id>/eliminar_actividad_proyecto/', eliminar_actividad_proyecto, name='eliminar_actividad_proyecto'),
    path('proyecto/<int:proyecto_id>/editar_riesgo/', editar_riesgo_proyecto, name='editar_riesgo_proyecto'),
    

    path('mi_proyecto/<int:proyecto_id>/identificar/asociar_riesgo/', asociar_riesgo, name='asociar_riesgo'),
    path('mi_proyecto/<int:proyecto_id>/generar_informe/', generar_informe_identificar, name='generar_informe_identificar'),





    #url de recursos
    path('recursos/<int:id>/', recursos, name='recursos'),
    path('eliminar_recurso/<int:id>/', eliminar_recurso, name='eliminar_recurso'),
    path('editar_recurso/<int:id>/', editar_recurso, name='editar_recurso'),

    # Metodos que hacen funcionar el grafico de la rbs
    path('rbs/listar/', profile, name='listarrbs'),
    path('rbs/confirmar_cambios/', confirmar_cambios_rbs, name='confirmar_cambios_rbs'),
    #HAY QUE EMPEZAR A ORGANIZAR ESTO


    #####################################################
    # Planificar proyecto
    #####################################################
    path('mi_proyecto/<int:proyecto_id>/planificar_proyecto/actualizar_definiciones/', actualizar_definiciones_riesgo, name='actualizar_definiciones_riesgo'),
    path('mi_proyecto/<int:proyecto_id>/planificar_proyecto/actualizar_clasificacion_riesgo/', actualizar_clasificacion_riesgo, name='actualizar_clasificacion_riesgo'),
    path('mi_proyecto/<int:proyecto_id>/generar_informe_planificar/', generar_informe_planificar, name='generar_informe_planificar'),

    #####################################################
    # Evaluar proyecto
    #####################################################
    path('mi_proyecto/<int:proyecto_id>/evaluar/', evaluar_proyecto, name='evaluar_proyecto'),
    path('mi_proyecto/<int:proyecto_id>/evaluar/actualizar_valores/', actualizar_valores, name='actualizar_valores'),
    path('mi_proyecto/<int:proyecto_id>/generar_informe_evaluar/', generar_informe_evaluar, name='generar_informe_evaluar'),

    #####################################################
    # Planificar respuestas
    #####################################################
    path('mi_proyecto/<int:proyecto_id>/planificar_respuestas/', planificar_respuestas, name='planificar_respuestas'),
    path('mi_proyecto/<int:proyecto_id>/nueva_respuesta_planificar/', nueva_respuesta_planificar, name='nueva_respuesta_planificar'),
    path('mi_proyecto/<int:proyecto_id>/asociar_respuesta_sugeridas/', asociar_respuesta_sugeridas, name='asociar_respuesta_sugeridas'),
    path('mi_proyecto/<int:proyecto_id>/desasociar_respuesta_riesgo/', desasociar_respuesta_riesgo, name='desasociar_respuesta_riesgo'),
    path('mi_proyecto/<int:proyecto_id>/nueva_tarea/', nueva_tarea, name='nueva_tarea'),
    path('mi_proyecto/<int:proyecto_id>/eliminar_tarea/', eliminar_tarea, name='eliminar_tarea'),
    path('mi_proyecto/<int:proyecto_id>/editar_tarea/', editar_tarea, name='editar_tarea'),
    path('mi_proyecto/<int:proyecto_id>/nuevo_recurso_tarea/', nuevo_recurso_tarea, name='nuevo_recurso_tarea'),
    path('mi_proyecto/<int:proyecto_id>/desvincular_recurso_tarea/', desvincular_recurso_tarea, name='desvincular_recurso_tarea'),
    path('mi_proyecto/<int:proyecto_id>/planificar_respuestas/informe/', generar_informe_planificar_respuesta, name='generar_informe_planificar_respuesta'),



]
