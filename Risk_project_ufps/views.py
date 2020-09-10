from django.shortcuts import render, HttpResponse, redirect
from django.contrib.auth import logout as do_logout
from django.contrib.auth.models import User
from django.http import JsonResponse
from django.core import serializers
from django.forms.models import model_to_dict
from json import dumps 
import json
import MySQLdb
import os
from Risk_project_ufps.core_risk.controller.SectorController import *
from Risk_project_ufps.core_risk.controller.PaisController import *
from Risk_project_ufps.core_risk.controller.RbsController import *
from Risk_project_ufps.core_risk.controller.ProyectoController import *
from Risk_project_ufps.core_risk.controller.GerenteController import *
from Risk_project_ufps.core_risk.controller.SubcategoriaController import *
from Risk_project_ufps.core_risk.controller.RiesgoController import *
from Risk_project_ufps.core_risk.controller.RespuestaController import *
from Risk_project_ufps.core_risk.controller.TipoRecursoController import *
from Risk_project_ufps.core_risk.controller.RecursoController import *
from Risk_project_ufps.core_risk.controller.ResponsableController import *
from Risk_project_ufps.core_risk.controller.ActividadController import *
from Risk_project_ufps.core_risk.controller.ReporteController import *
"""
////////////////////////////////////////////////////////////////////////////
    Metodos generales de usuario
/////////////////////////////////////////////////////////////////////////////
"""

#Autentica usuario y carga la vista de inicio
def autenticar(request):
    if request.user.is_authenticated:
        
        proyecto_controller = ProyectoController()
        lista_proyectos = proyecto_controller.listar_proyectos(request.user.id) 
        return render(request, "inicio.html" , {"lista_proyectos": lista_proyectos})

    return render("login.html")



#Cierra sesión de un usuario y carga la vista de login
def cerrar_sesion(request):
    do_logout(request)
    return render(request, "login.html")



#Carga la vista de registrar gerente
def registrar_gerente(request):
    sector_controller = SectorController()
    lista_sectores = sector_controller.listar_sectores()
    pais_controller = PaisController()
    lista_paises = pais_controller.listar_paises()
    return render(request, "registration/registrar_gerente.html", {"lista_sectores": lista_sectores, "lista_paises":lista_paises})



#Duplica el usuario para accerder a los metodos de autenticación de django
def registrar_usuario(usuario, correo, password, nombre):
    user = User.objects.create_user(username=usuario, email=correo, password = password, first_name = nombre)
    user.save()
    return User.objects.get(username=usuario)



#Registra un nuevo gerente en la bd riesgos
def nuevo_gerente(request):

    sector_controller = SectorController()
    sector = sector_controller.obtener_sector(request.POST["gerente_sector"]) 
    user = registrar_usuario(request.POST["gerente_usuario"], request.POST["gerente_correo" ], request.POST["gerente_password"], request.POST["gerente_nombre"])
    gerente_controller = GerenteController()
    print(user)
    print(sector)
    mensaje = gerente_controller.registrar_gerente(user.id, request.POST["gerente_usuario"], request.POST["gerente_correo" ], request.POST["gerente_nombre"], sector, request.POST["gerente_profesion"], request.POST["gerente_empresa"], request.POST["gerente_pais"])
    return render(request, "registration/login.html", {"mensaje": mensaje})
    


#Muestra el perfil del gerente y actualiza su información
def mi_perfil(request):
    sector_controller = SectorController()
    lista_sectores = sector_controller.listar_sectores()
    gerente_controller = GerenteController() 
    gerente = gerente_controller.obtener_gerente(request.user.id)  
    if request.method=="POST":
        sector = sector_controller.obtener_sector(request.POST["gerente_sector"])           
        mensaje = gerente_controller.actualizar_gerente(gerente, request.POST["gerente_nombre"], request.POST["gerente_correo"], request.POST["gerente_profesion"], request.POST["gerente_empresa"], sector)
        return render(request, "mi_perfil.html", {"gerente": gerente, "lista_sectores": lista_sectores, "mensaje":mensaje})

    return render(request, "mi_perfil.html", {"gerente": gerente, "lista_sectores": lista_sectores})



#Carga la vista de inicio
def inicio(request):

    proyecto_controller = ProyectoController()
    lista_proyectos = proyecto_controller.listar_proyectos(request.user.id) 

    return render(request, "inicio.html", {"lista_proyectos": lista_proyectos})


"""
////////////////////////////////////////////////
    Metodos y views relacionados con proyecto 
////////////////////////////////////////////////
"""

#Carga la vista de registrar proyecto y lo registra
def nuevo_proyecto(request):
    sector_controller = SectorController()
    lista_sectores = sector_controller.listar_sectores()
    if(request.method == "POST"):
        try:
            gerente_controller = GerenteController()
            sector = sector_controller.obtener_sector(request.POST["proyecto_sector"])
            gerente = gerente_controller.obtener_gerente(request.user.id)
            print(gerente)
            proyecto_controller = ProyectoController()
            proyecto = ProyectoController.registrar_proyecto(request.POST["proyecto_nombre"], request.POST["proyecto_objetivo"], request.POST["proyecto_alcance"], request.POST["proyecto_descripcion"], request.POST["proyecto_presupuesto"], request.POST["proyecto_fecha_inicio"], gerente, sector)             
            if(proyecto):
                mensaje = "Se registro un proyecto exitosamente."
            else:
                mensaje = "No se pudo registrar exitosamente."
            if(request.POST["actividades"] == '1'):
                actividades = json.loads(request.POST["actividades_data"])["tasks"]
                orden = 0
                for actividad in actividades:
                    act = Actividad(
                        actividad_id = "p_"+str(proyecto.proyecto_id)+"_a_"+str(actividad["uid"]),
                        actividad_orden = orden, 
                        actividad_uuid = actividad["uid"],
                        actividad_nombre = actividad["name"],
                        actividad_level = actividad["level"],
                        actividad_wbs = actividad["WBS"],
                        proyecto = proyecto)
                    act.save()
                    orden = orden + 1
            return HttpResponse(status=200)
        except Exception as inst:
            print(inst)
            return HttpResponse(status=400)

    data = {"lista_sectores": lista_sectores}  

    rbs_controller = RbsController()
    rbs = rbs_controller.get_rbs_gerente_id(request.user.id)

    if rbs:
        data["rbs"] = rbs

    return render(request, "nuevo_proyecto.html", data)

"""
/////////////////////////////////////
    Metodos de la EDR
////////////////////////////////////
"""

#Carga la vista de la RBS
def mi_rbs(request):
    rbs_controller = RbsController()
    if(rbs_controller.get_rbs_gerente_id(request.user.id)):
        return render(request, "mi_rbs.html")
    else:
        return render(request, "mi_rbs_inicial.html")

def rbs_configurar(request):
    rbs_controller = RbsController()
    if request.method == 'POST':
        rbs_option = request.POST.get('rbs_option', "")
        try:
            if rbs_option == "1":
                rbs_controller.crear_rbs_pmbok(request.user.id)
            elif rbs_option == "2":
                rbs_controller.crear_rbs_sugerida(request.user.id)
            elif rbs_option == "3":
                rbs_controller.crear_rbs_blanco(request.user.id)
                print("En blanco")
            return HttpResponse({"msg":"rbs_creada"}, status=202)
        except Exception as inst:
            print(inst)
            return HttpResponse({"msg":"error"},status=404)    
    else:
        return HttpResponse({"msg":"error"},status=404) 


"""
////////////////////////////////////////////////
    Metodos relacionados con la rbs general
////////////////////////////////////////////////
"""

def profile(request):
    if request.method == 'GET':
        rbs_controller = RbsController()               
        rbs = rbs_controller.obtener_rbs_general(request.user.id)        
        return JsonResponse(rbs, safe=False)
    else:
        return HttpResponse(status=404)


def confirmar_cambios_rbs(request):
    if request.user.is_authenticated:
        if request.method == 'POST':
            acciones = json.loads(request.POST.get('acciones', None))
            rbs = Rbs.objects.get(gerente_id = request.user.id)
            elementos_nuevos = {}
            for accion in acciones:
                if accion['accion'] == 'agregar_c':
                    categoria = Categoria(
                        categoria_nombre = accion['categoria_nombre'],
                        categoria_descripcion = accion['categoria_descripcion'],
                        rbs = rbs
                    )
                    categoria.save()
                    elementos_nuevos[accion['categoria_id']] = categoria
                elif accion['accion'] == 'agregar_sc':
                    if('new' in accion['categoria_id']):
                        categoria = elementos_nuevos[accion['categoria_id']]
                    else:
                        categoria = Categoria(categoria_id = accion['categoria_id'])
                    subCategoria = SubCategoria(
                        sub_categoria_nombre = accion['sub_categoria_nombre'],
                        sub_categoria_descripcion = accion['sub_categoria_descripcion'],
                        categoria = categoria
                    )
                    subCategoria.save()
                    elementos_nuevos[accion['sub_categoria_id']] = subCategoria
                elif accion['accion'] == 'eliminar_c':
                    if('new' in accion['categoria_id']):
                        categoria = elementos_nuevos[accion['categoria_id']]
                        del elementos_nuevos[accion['categoria_id']]
                    else:
                        categoria = Categoria(categoria_id = accion['categoria_id'])
                    categoria.delete()
                elif accion['accion'] == 'eliminar_sc':
                    if('new' in accion['sub_categoria_id']):
                        sub_categoria = elementos_nuevos[accion['sub_categoria_id']]
                        del elementos_nuevos[accion['sub_categoria_id']]
                    else:
                        sub_categoria = SubCategoria(sub_categoria_id = accion['sub_categoria_id'])
                    sub_categoria.delete()
                elif accion['accion'] == 'editar_c':
                    if('new' in accion['categoria_id']):
                        categoria = elementos_nuevos[accion['categoria_id']]
                    else:
                        categoria = Categoria(categoria_id = accion['categoria_id'])
                    Categoria.objects.filter(categoria_id = categoria.categoria_id).update(categoria_nombre = accion['categoria_nombre'], categoria_descripcion = accion['categoria_descripcion'])
                elif accion['accion'] == 'editar_sc':
                    if('new' in accion['sub_categoria_id']):
                        sub_categoria = elementos_nuevos[accion['sub_categoria_id']]
                    else:
                        sub_categoria = SubCategoria(sub_categoria_id = accion['sub_categoria_id'])
                    SubCategoria.objects.filter(sub_categoria_id = sub_categoria.sub_categoria_id).update(sub_categoria_nombre=accion['sub_categoria_nombre'], sub_categoria_descripcion=accion['sub_categoria_descripcion'])
            return JsonResponse({"hola":request.user.username, "e":acciones}, safe=False)
        else:
            return HttpResponse({"Error":"error"},status=404)



#Carga la vista de nuevo riesgo y registra un riesgo asociado a una subcategoria
def nuevo_riesgo(request):
    subcategoria_controller = SubcategoriaController()
    lista_subcategorias = subcategoria_controller.listar_subcategorias(request.user.id)
    rbs_controller = RbsController()               
    rbs = rbs_controller.obtener_rbs_completa(request.user.id)     
    rbsJSON = dumps(rbs)
    if request.method == 'POST':
        subcategoria = subcategoria_controller.obtener_subcategoria(request.POST["sub_categoria_id"])        
        riesgo_controller = RiesgoController()        
        mensaje = riesgo_controller.registrar_riesgo(request.POST["riesgo_nombre"], request.POST["riesgo_causa"], request.POST["riesgo_evento"], request.POST["riesgo_efecto"], request.POST["riesgo_tipo"], subcategoria)
        return render(request, "nuevo_riesgo.html", {"lista_subcategorias": lista_subcategorias, "rbs":rbsJSON, "mensaje": mensaje} )

    return render(request, "nuevo_riesgo.html" , {"lista_subcategorias": lista_subcategorias,"rbs":rbsJSON})



#Carga la tabla dinamica con el listado de riesgos
def mis_riesgos(request):
    subcategoria_controller = SubcategoriaController()
    lista_subcategorias = subcategoria_controller.listar_subcategorias(request.user.id)
    rbs_controller = RbsController()               
    rbs = rbs_controller.obtener_rbs_completa(request.user.id)     
    rbsJSON = dumps(rbs)
    return render(request, "mis_riesgos.html", {'rbs':rbsJSON, "lista_subcategorias": lista_subcategorias})



#Edita un riesgo de un gerente y carga el listado de riesgos
def editar_riesgo(request):

    subcategoria_controller = SubcategoriaController()
    lista_subcategorias = subcategoria_controller.listar_subcategorias(request.user.id)

    riesgo_controller = RiesgoController()
    lista_riesgos = riesgo_controller.listar_riesgos(request.user.id)

    rbs_controller = RbsController()               
    rbs = rbs_controller.obtener_rbs_completa(request.user.id) 
    rbsJSON = dumps(rbs)
    if request.method == 'POST':
        riesgo = riesgo_controller.obtener_riesgo(request.POST["riesgo_id"])
        
        subcategoria = subcategoria_controller.obtener_subcategoria(request.POST["sub_categoria_id"])
        
        mensaje_editar = riesgo_controller.editar_riesgo(riesgo, request.POST["riesgo_nombre"], request.POST["riesgo_evento"], request.POST["riesgo_efecto"], request.POST["riesgo_causa"], request.POST["riesgo_tipo"], subcategoria)

        return render(request, "mis_riesgos.html", {'rbs':rbsJSON, "lista_riesgos": lista_riesgos, "mensaje_editar": mensaje_editar, "lista_subcategorias": lista_subcategorias})

    return render(request, "mis_riesgos.html", {'rbs':rbsJSON, "lista_riesgos": lista_riesgos, "lista_subcategorias": lista_subcategorias})



#Elimina un riesgo de un gerente y carga el listado de riesgos
def eliminar_riesgo(request):

    subcategoria_controller = SubcategoriaController()
    lista_subcategorias = subcategoria_controller.listar_subcategorias(request.user.id)
    riesgo_controller = RiesgoController()
    lista_riesgos = riesgo_controller.listar_riesgos(request.user.id)
    riesgo = riesgo_controller.obtener_riesgo(request.POST["riesgo_id"])
    mensaje_eliminar = riesgo_controller.eliminar_riesgo(riesgo)
    rbs_controller = RbsController()               
    rbs = rbs_controller.obtener_rbs_completa(request.user.id) 
    rbsJSON = dumps(rbs)

    if request.method == 'POST':
        

        return render(request, "mis_riesgos.html", {'rbs':rbsJSON, "lista_riesgos": lista_riesgos, "mensaje_eliminar": mensaje_eliminar, "lista_subcategorias": lista_subcategorias})

    return render(request, "mis_riesgos.html", {'rbs':rbsJSON, "lista_riesgos": lista_riesgos, "lista_subcategorias": lista_subcategorias})
           

def asociar_riesgo(request, proyecto_id):
    proyecto_controller = ProyectoController()
    proyecto = proyecto_controller.obtener_proyecto(proyecto_id)
    riesgo_controller = RiesgoController()
    if request.method == 'POST':
        try:
            riesgos_seleccionados = json.loads(request.POST.get('riesgos_seleccionados', None)) 
            riesgos_sugeridos = json.loads(request.POST.get('riesgos_sugeridos', None)) 
            aux = riesgo_controller.asosiar_riesgos_proyecto(riesgos_seleccionados, proyecto )
            aux = riesgo_controller.asosiar_riesgos_sugeridos_proyecto(riesgos_sugeridos, proyecto )
            print(riesgos_seleccionados)
            print(riesgos_sugeridos)
            return HttpResponse(status=200)
        except Exception as e:
            raise e
            return HttpResponse(status=400)        
               

#Carga la vista de nueva respuesta y registra una respuesta asociada a un riesgo
def nueva_respuesta(request):

    riesgo_controller = RiesgoController()
    lista_riesgos = riesgo_controller.listar_riesgos(request.user.id)

    if request.method == 'POST':
        respuesta_controller = RespuestaController()

        respuesta = respuesta_controller.registrar_respuesta(request.POST["respuesta_nombre"], request.POST["respuesta_descripcion"]) 
        
        
        riesgo = riesgo_controller.obtener_riesgo(request.POST["riesgo_id"])        
        

        mensaje = respuesta_controller.registrar_respuesta_riesgo(respuesta, riesgo)    

        return render(request, "nueva_respuesta.html", {"lista_riesgos": lista_riesgos, "mensaje": mensaje} )

    return render(request, "nueva_respuesta.html", {"lista_riesgos": lista_riesgos} )



#Carga el listado de respuestas de un gerente
def mis_respuestas(request):
    respuesta_controller = RespuestaController()

    lista_riesgos_respuesta = respuesta_controller.listar_respuesta_riesgo(request.user.id)
    
    return render(request, "mis_respuestas.html", {"lista_riesgos_respuesta": lista_riesgos_respuesta})



#Elimina una respuesta y carga el listado de respuestas de un gerente
def eliminar_respuesta(request):
    respuesta_controller = RespuestaController()

    lista_riesgos_respuesta = respuesta_controller.listar_respuesta_riesgo(request.user.id)
    

    if request.method == 'POST':
        respuesta = respuesta_controller.obtener_respuesta(request.POST["respuesta_id_e"])
        
            
        mensaje_eliminar = respuesta_controller.eliminar_respuesta(respuesta)
        return render(request, "mis_respuestas.html", {"lista_riesgos_respuesta": lista_riesgos_respuesta, "mensaje_eliminar":mensaje_eliminar})


    return render(request, "mis_respuestas.html", {"lista_riesgos_respuesta": lista_riesgos_respuesta})



#Actualiza la información de una respuesta y carga el listado de respuestas de un gerente
def editar_respuesta(request):

    respuesta_controller = RespuestaController()
    lista_riesgos_respuesta = respuesta_controller.listar_respuesta_riesgo(request.user.id)
    
    if request.method == 'POST':
        respuesta = respuesta_controller.obtener_respuesta(request.POST["respuesta_id"])
        
        mensaje_editar = respuesta_controller.editar_respuesta(respuesta, request.POST["respuesta_nombre"], request.POST["respuesta_descripcion"])
        return render(request, "mis_respuestas.html", {"lista_riesgos_respuesta": lista_riesgos_respuesta, "mensaje_editar":mensaje_editar})


    return render(request, "mis_respuestas.html", {"lista_riesgos_respuesta": lista_riesgos_respuesta})

#Registra un tipo de recurso para un gerente y carga los recursos de un gerente
def tipo_recurso(request):
    tipo_recurso_controller = TipoRecursoController()
    tipos_recursos = tipo_recurso_controller.listar_tipos_recursos(request.user.id)
    if request.method == 'POST':
        gerente_controller = GerenteController()
        gerente = gerente_controller.obtener_gerente(request.user.id)       
        
        mensaje = tipo_recurso_controller.registrar_tipo_recurso(request.POST['tipo_recurso_nombre'], request.POST['tipo_recurso_descripcion'], gerente )

        return render(request, "nuevo_recurso.html", {"mensaje":mensaje, "tipos_recursos":tipos_recursos})
    return render(request, "nuevo_recurso.html", {"tipos_recursos":tipos_recursos})



#Elimina un tipo de recurso y carga el listado de tipos de recursos
def eliminar_tipo_recurso(request):
    tipo_recurso_controller = TipoRecursoController()
    tipos_recursos = tipo_recurso_controller.listar_tipos_recursos(request.user.id)
    if request.method == 'POST':
        tipo_recurso = tipo_recurso_controller.obtener_tipo_recurso(request.POST['tipo_recurso_id']) 
        
        mensaje_eliminar = tipo_recurso_controller.eliminar_tipo_recurso(tipo_recurso)
        return render(request, "nuevo_recurso.html", {"tipos_recursos":tipos_recursos, "mensaje_eliminar":mensaje_eliminar})

    return render(request, "nuevo_recurso.html", {"tipos_recursos":tipos_recursos})



#Actualiza la información de un tipo de recurso y carga el listado de tipos de recursos
def editar_tipo_recurso(request):
    tipo_recurso_controller = TipoRecursoController()
    tipos_recursos = tipo_recurso_controller.listar_tipos_recursos(request.user.id)
    
    if request.method == 'POST':
        tipo_recurso = tipo_recurso_controller.obtener_tipo_recurso(request.POST['tipo_recurso_id'])
        
        
        mensaje_editar = tipo_recurso_controller.editar_tipo_recurso(tipo_recurso, request.POST['tipo_recurso_nombre'], request.POST['tipo_recurso_descripcion'])

        return render(request, "nuevo_recurso.html", {"tipos_recursos":tipos_recursos, "mensaje_editar":mensaje_editar})

    return render(request, "nuevo_recurso.html", {"tipos_recursos":tipos_recursos})



#Carga la vista de un proyecto y permite editarlo
def mi_proyecto(request, id):
    proyecto_controller = ProyectoController()
    proyecto = proyecto_controller.obtener_proyecto(id)    
    sector_controller = SectorController()
    lista_sectores = sector_controller.listar_sectores()
    data = {"proyecto":proyecto, "lista_sectores": lista_sectores} 

    if(proyecto_controller.has_actividades(id)):
        data["actividades"] = True

    if request.method == 'POST':
        sector = sector_controller.obtener_sector(request.POST["proyecto_sector"])
        mensaje = proyecto_controller.editar_proyecto(proyecto, request.POST["proyecto_nombre"], request.POST["proyecto_objetivo"], request.POST["proyecto_alcance"], request.POST["proyecto_descripcion"], request.POST["proyecto_presupuesto"], request.POST["proyecto_fecha_inicio"], sector)        
        data["mensaje"] = mensaje
        if(request.POST["actividades"] == '1'):
            actividades = json.loads(request.POST["actividades_data"])["tasks"]
            orden = 0
            for actividad in actividades:
                act = Actividad(
                    actividad_id = "p_"+str(proyecto.proyecto_id)+"_a_"+str(actividad["uid"]),
                    actividad_orden = orden, 
                    actividad_uuid = actividad["uid"],
                    actividad_nombre = actividad["name"],
                    actividad_level = actividad["level"],
                    actividad_wbs = actividad["WBS"],
                    proyecto = proyecto)
                act.save()
                orden = orden + 1
        return render(request, "procesos/proyecto.html", data)

    return render(request, "procesos/proyecto.html", data)



def eliminar_riesgo_proyecto(request, proyecto_id):
    if request.method == 'POST':
        riesgo_controller = RiesgoController()        
        riesgo_proyecto = riesgo_controller.get_riesgo_by_proyecto(proyecto_id, request.POST["riesgo_id"])
        print("PHRIESGO", riesgo_proyecto, proyecto_id, request.POST["riesgo_id"])
        mensaje_eliminar= riesgo_controller.eliminar_riesgo_by_proyecto(riesgo_proyecto) 
        proyecto = Proyecto.objects.get(proyecto_id=proyecto_id)
        rbs_controller = RbsController()               
        rbs = rbs_controller.obtener_rbs_completa_by_proyecto(request.user.id, proyecto_id)     
        rbsJSON = dumps(rbs)
        riesgo_controller = RiesgoController()    
        lista_riesgos = riesgo_controller.get_riesgos_by_proyecto(proyecto)
        responsable_controller = ResponsableController()
        lista_responsables = responsable_controller.listar_responsables(proyecto.proyecto_id)
        actividad_controller = ActividadController()
        lista_actividades = actividad_controller.listar_actividades_proyecto(proyecto_id)
        responsables_riesgo = riesgo_controller.listar_responsables_riesgo(proyecto_id)
        actividades_riesgo = actividad_controller.listar_actividades_riesgo(proyecto_id)          
        return render(request, "procesos/identificar_riesgos.html", {'proyecto':proyecto, 'rbs':rbsJSON, 'lista_riesgos':lista_riesgos, 'mensaje_eliminar':mensaje_eliminar, 'lista_responsables':lista_responsables, 'lista_actividades':lista_actividades, "responsables_riesgo":responsables_riesgo, 'actividades_riesgo':actividades_riesgo})



def editar_riesgo_proyecto(request, proyecto_id): 
    if request.method == 'POST':        
        riesgo_controller = RiesgoController()        

        riesgo_editado = riesgo_controller.editar_riesgo_proyecto(
            proyecto_id, 
            request.POST["riesgo_id_editar"],
            request.POST["riesgo_nombre"],
            request.POST["riesgo_causa"], 
            request.POST["riesgo_evento"], 
            request.POST["riesgo_efecto"],             
            request.POST["riesgo_tipo"],
            )

        data = get_data_render_identificar_riesgo(request.user.id, proyecto_id)
        
        return render(request, "procesos/identificar_riesgos.html", data)


################################################################
### Metodo util que permite centralizar los datos necesarios
### para renderizar identificar riesgos
################################################################

def get_data_render_identificar_riesgo(gerente_id, proyecto_id):
    proyecto = Proyecto.objects.get(proyecto_id=proyecto_id)
    rbs_controller = RbsController()               
    rbs = rbs_controller.obtener_rbs_completa_by_proyecto(gerente_id, proyecto_id)     
    rbsJSON = dumps(rbs)
    riesgo_controller = RiesgoController()    
    lista_riesgos = riesgo_controller.get_riesgos_by_proyecto(proyecto)
    #Falta agregar de aqui para abajo
    responsable_controller = ResponsableController()
    lista_responsables = responsable_controller.listar_responsables(proyecto.proyecto_id)
    actividad_controller = ActividadController()
    lista_actividades = actividad_controller.listar_actividades_proyecto(proyecto_id)
    
    #Retorna responsables por riesgo de un proyecto
    responsables_riesgo = riesgo_controller.listar_responsables_riesgo(proyecto_id)
    #Retorna actividades por riesgo de un proyecto
    actividades_riesgo = actividad_controller.listar_actividades_riesgo(proyecto_id)
    
    #(Funcion que retorna respuestas por riesgo de un proyecto (Revisar)!!!)
    respuesta_controller = RespuestaController()
    respuestas_riesgo = dumps(respuesta_controller.listar_riesgos_respuesta(proyecto_id)) 
    
   
    lista_riesgos_sugeridos = riesgo_controller.get_riesgos_sugeridos(proyecto.sector, gerente_id);
    

    if(len(lista_riesgos_sugeridos) > 0):
        return {'proyecto':proyecto, 'rbs':rbsJSON, 'lista_riesgos':lista_riesgos, 'lista_responsables':lista_responsables, 'lista_actividades':lista_actividades, "responsables_riesgo":responsables_riesgo, 'actividades_riesgo':actividades_riesgo, 'lista_riesgos_sugeridos':lista_riesgos_sugeridos, 'respuestas_riesgo':respuestas_riesgo}

    return {'proyecto':proyecto, 'rbs':rbsJSON, 'lista_riesgos':lista_riesgos, 'lista_responsables':lista_responsables, 'lista_actividades':lista_actividades, "responsables_riesgo":responsables_riesgo, 'actividades_riesgo':actividades_riesgo, 'respuestas_riesgo':respuestas_riesgo}



def proyecto_nueva_respuesta(request, proyecto_id):

    riesgo_controller = RiesgoController()
    respuesta_controller = RespuestaController()
    if request.method == 'POST':
        respuesta = respuesta_controller.registrar_respuesta(request.POST["respuesta_nombre"], request.POST["respuesta_descripcion"]) 
        riesgo = riesgo_controller.obtener_riesgo(request.POST["riesgo_id"])        
        mensaje_no = respuesta_controller.registrar_respuesta_riesgo(respuesta, riesgo)
        proyecto_riesgo = riesgo_controller.get_riesgo_by_proyecto(proyecto_id, request.POST["riesgo_id"])
        riesgo_respuesta = respuesta_controller.obtener_respuesta_riesgo(riesgo.riesgo_id, respuesta.respuesta_id)
        mensaje = respuesta_controller.registrar_respuesta_proyecto(proyecto_riesgo, riesgo_respuesta)
        proyecto = Proyecto.objects.get(proyecto_id=proyecto_id)
        rbs_controller = RbsController()               
        rbs = rbs_controller.obtener_rbs_completa_by_proyecto(request.user.id, proyecto_id)     
        rbsJSON = dumps(rbs)
        riesgo_controller = RiesgoController()    
        lista_riesgos = riesgo_controller.get_riesgos_by_proyecto(proyecto)
        responsable_controller = ResponsableController()
        lista_responsables = responsable_controller.listar_responsables(proyecto.proyecto_id)
        actividad_controller = ActividadController()
        lista_actividades = actividad_controller.listar_actividades_proyecto(proyecto_id)
        responsables_riesgo = riesgo_controller.listar_responsables_riesgo(proyecto_id)
        actividades_riesgo = actividad_controller.listar_actividades_riesgo(proyecto_id)
          
        data = get_data_render_identificar_riesgo(request.user.id, proyecto_id)
        
        data['mensaje'] = mensaje

        return render(request, "procesos/identificar_riesgos.html", data)







def registrar_riesgo_proyecto(request):
    if request.method == 'POST':
        riesgo_controller = RiesgoController()
        rbs_controller = RbsController()               
        proyecto_controller = ProyectoController()

        mensaje = riesgo_controller.registrar_riesgo_proyecto(
            request.POST["riesgo_nombre"], 
            request.POST["riesgo_causa"], 
            request.POST["riesgo_evento"], 
            request.POST["riesgo_efecto"], 
            request.POST["riesgo_tipo"], 
            request.POST["sub_categoria_id"], 
            request.POST["proyecto_id"])        
        
        proyecto = proyecto_controller.obtener_proyecto(request.POST["proyecto_id"])            
        rbs = rbs_controller.obtener_rbs_completa_by_proyecto(request.user.id, proyecto.proyecto_id)     
        rbsJSON = dumps(rbs)
        riesgo_controller = RiesgoController()    
        lista_riesgos = riesgo_controller.get_riesgos_by_proyecto(proyecto)
        responsable_controller = ResponsableController()
        lista_responsables = responsable_controller.listar_responsables(proyecto.proyecto_id)
        actividad_controller = ActividadController()
        lista_actividades = actividad_controller.listar_actividades_proyecto(proyecto.proyecto_id)
        responsables_riesgo = riesgo_controller.listar_responsables_riesgo(proyecto.proyecto_id)
        actividades_riesgo = actividad_controller.listar_actividades_riesgo(proyecto.proyecto_id)
            
        return render(request, "procesos/identificar_riesgos.html", {'proyecto':proyecto, 'rbs':rbsJSON, 'lista_riesgos':lista_riesgos, 'mensaje':mensaje, 'lista_responsables':lista_responsables, 'lista_actividades':lista_actividades, "responsables_riesgo":responsables_riesgo, 'actividades_riesgo':actividades_riesgo})



# Carga la vista de los recursos de un proyecto y registra nuevos recursos
def recursos(request, id):
    recurso_controller = RecursoController()
    lista_recursos = recurso_controller.listar_recursos(id)
    tipo_recurso_controller = TipoRecursoController()
    tipos_recursos = tipo_recurso_controller.listar_tipos_recursos(request.user.id)
    proyecto_controller = ProyectoController()
    proyecto = proyecto_controller.obtener_proyecto(id)
    if request.method == 'POST':

        mensaje = recurso_controller.registrar_recurso(proyecto, request.POST['recurso_nombre'], request.POST['recurso_costo'], request.POST['tipo_recurso_id'],)
        
        return render(request, "procesos/mis_recursos.html", {"proyecto":proyecto, "lista_recursos":lista_recursos, "mensaje":mensaje, "tipos_recursos":tipos_recursos})
    
    return render(request, "procesos/mis_recursos.html", {"proyecto":proyecto, "lista_recursos":lista_recursos, "tipos_recursos":tipos_recursos})



#Elimina un recurso de un proyecto y carga la vista de recursos del proyecto
def eliminar_recurso(request, id):
    recurso_controller = RecursoController()
    lista_recursos = recurso_controller.listar_recursos(id)
    tipo_recurso_controller = TipoRecursoController()
    tipos_recursos = tipo_recurso_controller.listar_tipos_recursos(request.user.id)
    proyecto_controller = ProyectoController()
    proyecto = proyecto_controller.obtener_proyecto(id)
    if request.method == 'POST':
        recurso = recurso_controller.obtener_recurso(request.POST['recurso_id'])    

        mensaje_eliminar = recurso_controller.eliminar_recurso(recurso)
        return render(request, "procesos/mis_recursos.html", {"proyecto":proyecto, "lista_recursos":lista_recursos, "mensaje_eliminar":mensaje_eliminar, "tipos_recursos":tipos_recursos})
    
    return render(request, "procesos/mis_recursos.html", {"proyecto":proyecto, "lista_recursos":lista_recursos, "tipos_recursos":tipos_recursos})



#Actualiza la información de un recurso para un proyecto y carga la vista de recursos del proyecto
def editar_recurso(request, id):
    recurso_controller = RecursoController()
    lista_recursos = recurso_controller.listar_recursos(id)
    tipo_recurso_controller = TipoRecursoController()
    tipos_recursos = tipo_recurso_controller.listar_tipos_recursos(request.user.id)
    proyecto_controller = ProyectoController()
    proyecto = proyecto_controller.obtener_proyecto(id)
    if request.method == 'POST':
        recurso = recurso_controller.obtener_recurso(request.POST['recurso_id'])        
        mensaje_editar = recurso_controller.editar_recurso(recurso, request.POST['recurso_nombre'], request.POST['recurso_costo'])
        return render(request, "procesos/mis_recursos.html", {"proyecto":proyecto, "lista_recursos":lista_recursos, "mensaje_editar":mensaje_editar, "tipos_recursos":tipos_recursos})
    
    return render(request, "procesos/mis_recursos.html", {"proyecto":proyecto, "lista_recursos":lista_recursos, "tipos_recursos":tipos_recursos})

#Carga la vista de planificar proyecto y regista responsables para el proyecto
"""def planificar_proyecto(request, proyecto_id):
    proyecto_controller = ProyectoController()
    proyecto = proyecto_controller.obtener_proyecto(proyecto_id)
    responsable_controller = ResponsableController()
    lista_responsables = responsable_controller.listar_responsables(proyecto_id)
    if request.method == 'POST':
        
        mensaje = responsable_controller.registrar_responsable(request.POST['nombre_responsable'], request.POST['descripcion_responsable'], proyecto_id)

        return render(request, "procesos/planificar.html", {'proyecto':proyecto, "mensaje":mensaje, "lista_responsables":lista_responsables})
    


    return render(request, "procesos/planificar.html", {'proyecto':proyecto, "lista_responsables":lista_responsables})
"""

def planificar_proyecto(request, proyecto_id):
    proyecto_controller = ProyectoController()
    proyecto = proyecto_controller.obtener_proyecto(proyecto_id)    
    rbs_controller = RbsController()               
    rbs_sugerida = rbs_controller.obtener_rbs_sugerida(proyecto.sector.sector_id)  
    rbs_proyecto = rbs_controller.obtener_rbs_proyecto(proyecto_id)   
    rp = dumps(rbs_proyecto)
    rs = dumps(rbs_sugerida)
    responsable_controller = ResponsableController()
    lista_responsables = responsable_controller.listar_responsables(proyecto_id)    
    if rbs_proyecto:
      # No vacía
      return render(request, "procesos/planificar.html", {'proyecto':proyecto, 'rbs':True,'rbs_proyecto': rp,'rbs_sugerida':rs, "lista_responsables":lista_responsables})
    else:
      # Vacía
      return render(request, "procesos/planificar.html", {'proyecto':proyecto, 'rbs_proyecto': rp,'rbs_sugerida':rs, "lista_responsables": lista_responsables})
   



def registrar_responsable(request):
    proyecto_controller = ProyectoController()
    proyecto = proyecto_controller.obtener_proyecto(request.POST['proyecto_id'])    
    rbs_controller = RbsController()               
    rbs_sugerida = rbs_controller.obtener_rbs_sugerida(proyecto.sector.sector_id)  
    rbs_proyecto = rbs_controller.obtener_rbs_proyecto(request.POST['proyecto_id'])   
    rp = dumps(rbs_proyecto)
    rs = dumps(rbs_sugerida)
    responsable_controller = ResponsableController()
    lista_responsables = responsable_controller.listar_responsables(request.POST['proyecto_id'])   

    if request.method == 'POST':
        
        mensaje = responsable_controller.registrar_responsable(request.POST['nombre_responsable'], request.POST['descripcion_responsable'], proyecto.proyecto_id)

        return render(request, "procesos/planificar.html", {'proyecto':proyecto, 'rbs':True,'rbs_proyecto': rp,'rbs_sugerida':rs, "lista_responsables":lista_responsables, "mensaje":mensaje})
   


    return render(request, "procesos/planificar.html", {'proyecto':proyecto, 'rbs':True,'rbs_proyecto': rp,'rbs_sugerida':rs, "lista_responsables":lista_responsables})
   



def editar_responsable(request):
    responsable_controller = ResponsableController()        
    responsable = responsable_controller.obtener_responsable(request.POST['responsable_id'])
    lista_responsables = responsable_controller.listar_responsables(responsable.proyecto_id)    
    proyecto_controller = ProyectoController()
    proyecto = proyecto_controller.obtener_proyecto(responsable.proyecto_id)
    rbs_controller = RbsController()               
    rbs_sugerida = rbs_controller.obtener_rbs_sugerida(proyecto.sector.sector_id)  
    rbs_proyecto = rbs_controller.obtener_rbs_proyecto(proyecto.proyecto_id)   
    rp = dumps(rbs_proyecto)
    rs = dumps(rbs_sugerida)
    lista_responsables = responsable_controller.listar_responsables(proyecto.proyecto_id)   

    if request.method == 'POST':
        
        mensaje_editar = responsable_controller.editar_responsable(responsable, request.POST['responsable_nombre'], request.POST['responsable_descripcion']) 
        
        
        return render(request, "procesos/planificar.html", {'proyecto':proyecto, 'rbs':True,'rbs_proyecto': rp,'rbs_sugerida':rs, "lista_responsables":lista_responsables, "mensaje_editar":mensaje_editar})
   

    return render(request, "procesos/planificar.html", {'proyecto':proyecto, 'rbs':True,'rbs_proyecto': rp,'rbs_sugerida':rs, "lista_responsables":lista_responsables})
   




def eliminar_responsable(request):
    responsable_controller = ResponsableController()        
    responsable = responsable_controller.obtener_responsable(request.POST['responsable_id'])
    lista_responsables = responsable_controller.listar_responsables(responsable.proyecto_id)    
    proyecto_controller = ProyectoController()
    proyecto = proyecto_controller.obtener_proyecto(responsable.proyecto_id)
    rbs_controller = RbsController()               
    rbs_sugerida = rbs_controller.obtener_rbs_sugerida(proyecto.sector.sector_id)  
    rbs_proyecto = rbs_controller.obtener_rbs_proyecto(proyecto.proyecto_id)   
    rp = dumps(rbs_proyecto)
    rs = dumps(rbs_sugerida)
    lista_responsables = responsable_controller.listar_responsables(proyecto.proyecto_id)
    if request.method == 'POST':
         
        mensaje_eliminar = responsable_controller.eliminar_responsable(responsable) 
        
        return render(request, "procesos/planificar.html", {'proyecto':proyecto, 'rbs':True,'rbs_proyecto': rp,'rbs_sugerida':rs, "lista_responsables":lista_responsables, "mensaje_eliminar":mensaje_eliminar})
   
    return render(request, "procesos/planificar.html", {'proyecto':proyecto, 'rbs':True,'rbs_proyecto': rp,'rbs_sugerida':rs, "lista_responsables":lista_responsables})
   

def nuevo_responsable_riesgo(request, proyecto_id):
    proyecto = Proyecto.objects.get(proyecto_id=proyecto_id)
    rbs_controller = RbsController()               
    rbs = rbs_controller.obtener_rbs_completa_by_proyecto(request.user.id, proyecto_id)     
    rbsJSON = dumps(rbs)
    riesgo_controller = RiesgoController()    
    lista_riesgos = riesgo_controller.get_riesgos_by_proyecto(proyecto)
    #Falta agregar de aqui para abajo
    responsable_controller = ResponsableController()
    lista_responsables = responsable_controller.listar_responsables(proyecto.proyecto_id)
    actividad_controller = ActividadController()
    lista_actividades = actividad_controller.listar_actividades_proyecto(proyecto_id)
    responsables_riesgo = riesgo_controller.listar_responsables_riesgo(proyecto_id)
    actividades_riesgo = actividad_controller.listar_actividades_riesgo(proyecto_id)
  
    if request.method == 'POST':
        responsable = responsable_controller.obtener_responsable(request.POST['responsable_id']) 
        riesgo = riesgo_controller.obtener_riesgo(request.POST["riesgo_id"]) 
        proyecto_riesgo = riesgo_controller.get_riesgo_by_proyecto(proyecto.proyecto_id, riesgo.riesgo_id)
        
        mensaje = riesgo_controller.agregar_responsable_riesgo(proyecto_riesgo, responsable)
        return render(request, "procesos/identificar_riesgos.html", {'proyecto':proyecto, 'rbs':rbsJSON, 'lista_riesgos':lista_riesgos, 'lista_responsables':lista_responsables, 'lista_actividades':lista_actividades, "responsables_riesgo":responsables_riesgo, 'actividades_riesgo':actividades_riesgo, "mensaje":mensaje})
    return render(request, "procesos/identificar_riesgos.html", {'proyecto':proyecto, 'rbs':rbsJSON, 'lista_riesgos':lista_riesgos, 'lista_responsables':lista_responsables, 'lista_actividades':lista_actividades, "responsables_riesgo":responsables_riesgo, 'actividades_riesgo':actividades_riesgo})

def nueva_actividad_riesgo(request, proyecto_id):
    proyecto = Proyecto.objects.get(proyecto_id=proyecto_id)
    rbs_controller = RbsController()               
    rbs = rbs_controller.obtener_rbs_completa_by_proyecto(request.user.id, proyecto_id)     
    rbsJSON = dumps(rbs)
    riesgo_controller = RiesgoController()    
    lista_riesgos = riesgo_controller.get_riesgos_by_proyecto(proyecto)    
    responsable_controller = ResponsableController()
    lista_responsables = responsable_controller.listar_responsables(proyecto.proyecto_id)
    actividad_controller = ActividadController()
    lista_actividades = actividad_controller.listar_actividades_proyecto(proyecto_id)
    responsables_riesgo = riesgo_controller.listar_responsables_riesgo(proyecto_id)
    actividades_riesgo = actividad_controller.listar_actividades_riesgo(proyecto_id)  
    if request.method == 'POST':        
        riesgo = riesgo_controller.obtener_riesgo(request.POST["riesgo_id"])        
        proyecto_riesgo = riesgo_controller.get_riesgo_by_proyecto(proyecto.proyecto_id, riesgo.riesgo_id)
        aux = actividad_controller.validar_actividad(proyecto_riesgo.proyecto_has_riesgo_id, request.POST["actividad_id"])
        if aux == None:
            actividad = actividad_controller.obtener_actividad(request.POST["actividad_id"])
            mensaje =  actividad_controller.registrar_actividad_riesgo(proyecto_riesgo, actividad)
            return render(request, "procesos/identificar_riesgos.html", {'proyecto':proyecto, 'rbs':rbsJSON, 'lista_riesgos':lista_riesgos, 'lista_responsables':lista_responsables, 'lista_actividades':lista_actividades, "responsables_riesgo":responsables_riesgo, 'actividades_riesgo':actividades_riesgo, "mensaje":mensaje})
        mensaje_editar = "Ya cuentas con esta actividad asignada al riesgo."  
        return render(request, "procesos/identificar_riesgos.html", {'proyecto':proyecto, 'rbs':rbsJSON, 'lista_riesgos':lista_riesgos, 'lista_responsables':lista_responsables, 'lista_actividades':lista_actividades, "responsables_riesgo":responsables_riesgo, 'actividades_riesgo':actividades_riesgo, "mensaje_editar":mensaje_editar})
        
    return render(request, "procesos/identificar_riesgos.html", {'proyecto':proyecto, 'rbs':rbsJSON, 'lista_riesgos':lista_riesgos, 'lista_responsables':lista_responsables, 'lista_actividades':lista_actividades, "responsables_riesgo":responsables_riesgo, 'actividades_riesgo':actividades_riesgo})

  

def identificar_proyecto(request, proyecto_id):
    proyecto = Proyecto.objects.get(proyecto_id=proyecto_id)
    rbs_controller = RbsController()               
    rbs = rbs_controller.obtener_rbs_completa_by_proyecto(request.user.id, proyecto_id)     
    rbsJSON = dumps(rbs)
    riesgo_controller = RiesgoController()    
    lista_riesgos = riesgo_controller.get_riesgos_by_proyecto(proyecto)
    #Falta agregar de aqui para abajo
    responsable_controller = ResponsableController()
    lista_responsables = responsable_controller.listar_responsables(proyecto.proyecto_id)
    actividad_controller = ActividadController()
    lista_actividades = dumps(actividad_controller.listar_actividades_proyecto(proyecto_id))
    
    #Retorna responsables por riesgo de un proyecto
    responsables_riesgo = riesgo_controller.listar_responsables_riesgo(proyecto_id)
    #Retorna actividades por riesgo de un proyecto
    actividades_riesgo = dumps(actividad_controller.listar_actividades_riesgo(proyecto_id))
    
    #(Funcion que retorna respuestas por riesgo de un proyecto (Revisar)!!!)
    respuesta_controller = RespuestaController()
    respuestas_riesgo = dumps(respuesta_controller.listar_riesgos_respuesta(proyecto_id))

    lista_riesgos_sugeridos = riesgo_controller.get_riesgos_sugeridos(proyecto.sector, request.user.id);

    if(len(lista_riesgos_sugeridos) > 0):
        return render(request, "procesos/identificar_riesgos.html", {'proyecto':proyecto, 'rbs':rbsJSON, 'lista_riesgos':lista_riesgos, 'lista_responsables':lista_responsables, 'lista_actividades':lista_actividades, "responsables_riesgo":responsables_riesgo, 'actividades_riesgo':actividades_riesgo, 'lista_riesgos_sugeridos':lista_riesgos_sugeridos, 'respuestas_riesgo':respuestas_riesgo})

    return render(request, "procesos/identificar_riesgos.html", {'proyecto':proyecto, 'rbs':rbsJSON, 'lista_riesgos':lista_riesgos, 'lista_responsables':lista_responsables, 'lista_actividades':lista_actividades, "responsables_riesgo":responsables_riesgo, 'actividades_riesgo':actividades_riesgo, 'respuestas_riesgo':respuestas_riesgo})


def eliminar_actividad_proyecto(request, proyecto_id):
    if request.method == 'POST':                  
        actividad_controller = ActividadController()
        actividad = actividad_controller.desasociar_actividad_riesgo(proyecto_id, request.POST['riesgo_id_actividad'], request.POST['actividad_id_riesgo'])         
        data = get_data_render_identificar_riesgo(request.user.id, proyecto_id)        
        if (actividad):
            data["mensaje_eliminar"] = "Eliminado"
        return render(request, "procesos/identificar_riesgos.html", data)
    return render(request, "procesos/identificar_riesgos.html", data)



"""
////////////////////////////////////////////////////////////////////////////
    METODOS DE EVALUAR RIESGOS
/////////////////////////////////////////////////////////////////////////////
"""
def evaluar_proyecto(request, proyecto_id):
    proyecto_controller = ProyectoController()
    riesgo_controller = RiesgoController()

    proyecto = proyecto_controller.obtener_proyecto(proyecto_id)
    lista_riesgos = dumps(riesgo_controller.get_riesgos_by_proyecto_2(proyecto))
    return render(request, "procesos/evaluar.html", {'proyecto':proyecto, 'lista_riesgos':lista_riesgos})


"""
////////////////////////////////////////////////////////////////////////////
    METODOS DE PLANIFICAR RESPUESTAS
/////////////////////////////////////////////////////////////////////////////
"""
def planificar_respuestas(request, proyecto_id):
    proyecto_controller = ProyectoController()
    riesgo_controller = RiesgoController()

    proyecto = proyecto_controller.obtener_proyecto(proyecto_id)
    lista_riesgos = riesgo_controller.get_riesgos_by_proyecto(proyecto)
    
    return render(request, "procesos/planificar_respuestas.html", {'proyecto':proyecto, 'lista_riesgos':lista_riesgos})

"""
////////////////////////////////////////////////////////////////////////////
    METODOS DE INFORMES
/////////////////////////////////////////////////////////////////////////////
"""

def generar_informe_identificar(request, proyecto_id):

    proyecto_controller = ProyectoController()
    proyecto = proyecto_controller.obtener_proyecto(proyecto_id)

    reporte_controller = ReporteController()
    reporte = reporte_controller.generar_reporte_identificar(proyecto)
    
    print(reporte)

    zip_file = open(reporte, 'rb')
    t = 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
    response = HttpResponse(zip_file, content_type=t)
    response['Content-Disposition'] = 'attachment; filename="%s"' % reporte
    if os.path.exists("demofile.txt"):
      os.remove("demofile.txt")
    else:
      print("The file does not exist")
    return response


def generar_informe_planificar(request, proyecto_id):

    proyecto_controller = ProyectoController()
    proyecto = proyecto_controller.obtener_proyecto(proyecto_id)

    reporte_controller = ReporteController()
    reporte = reporte_controller.generar_reporte_planificar(proyecto)
    
    print(reporte)

    zip_file = open(reporte, 'rb')
    t = 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
    response = HttpResponse(zip_file, content_type=t)
    response['Content-Disposition'] = 'attachment; filename="%s"' % reporte
    if os.path.exists("demofile.txt"):
      os.remove("demofile.txt")
    else:
      print("The file does not exist")
    return response


"""
////////////////////////////////////////////////////////////////////////////
    METODO PARA GENERAR REPORTES EN EXCEL
/////////////////////////////////////////////////////////////////////////////
"""

"""class ExampleViewSet(APIView):

    def get(self, request, format=None):
        ur = 'C:\\Users\\DiegoCV\\Documents\\tesis\\tesis\\codigo\\ufps_risk_api\\app_risk_api\\modulos\\servicios_generales\\test.xlsx'
        zip_file = open(ur, 'rb')
        print(zip_file)
        t = 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
        response = HttpResponse(zip_file, content_type=t)
        response['Content-Disposition'] = 'attachment; filename="%s"' % 'CDX_COMPOSITES_20140626.xlsx'

        return response"""

































