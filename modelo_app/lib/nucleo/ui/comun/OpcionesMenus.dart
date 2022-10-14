//  librerias internas de flutter

import 'package:flutter/material.dart';

//  librerias  proyecto

import '../../../configuracion/rutasPaginasMenus.dart';
import '../../nucleo.dart';
import '../../../aplicacion/aplicacion.dart';

//  librerias externas  flutter

// Descripcion de funcionalidad 
//  obtener rutas para opciones de menus 
//

class OpcionesMenus {
  static List<ElementoLista> elementosPrincipal=[];
  static List<ElementoLista> paginas=[];
  static limpiar ()
  {
      elementosPrincipal=[];
  }

  static asignarPaginas ()
  {
      if ( OpcionesMenus.paginas.length==0)
          OpcionesMenus.paginas=definirPaginas ();
  }
  static ElementoLista  obtenerPagina (String ruta)
  {
    asignarPaginas();
    return OpcionesMenus.paginas.firstWhere((s) => s.ruta == ruta);
  }

  static ElementoLista obtener(String ruta) {
    asignarPaginas();
    return OpcionesMenus.paginas.firstWhere((s) => s.ruta == ruta);
  }
  static List<ElementoLista> actualizarMenu(String nombrMenu) {
     List<ElementoLista> elementos=[];
     dynamic menu =Traductor.obtenerSeccion(nombrMenu);
     for (MapEntry e in menu.entries) {
        print("Key ${e.key}, Value ${e.value}");
        print( menu[e.key]['ruta']);
        print( menu[e.key]['titulo']);
   
        String ruta =menu[e.key]['ruta']; 
        ElementoLista elemento = OpcionesMenus.obtenerPagina(ruta);
        elemento.ruta=ruta;
        elemento.animacionPagina=convertirAninacionPagina(menu[e.key]['animacionPagina']);
 
        elemento.titulo=menu[e.key]['titulo'];
        elemento.subtitulo=menu[e.key]['subtitulo']; 
  
        elemento.icono=menu[e.key]['icono'];
        elemento.iconoLateral=menu[e.key]['iconoLateral']; 
        elemento.activo=menu[e.key]['activo']; 
        elementos.add(elemento);
    } 
    //    for (var v in menu.keys) {
    //     print(v);
    //   } 
    //    for (var v in menu.values) {
    //     print(v);
    //   }

    //    menu.entries.forEach((e) => print("Key ${e.key}, Value ${e.value}"));
    return elementos;
  }

static List<ElementoLista> obtenerMenuAlterno(String nombrMenu) {
    List<ElementoLista> elementos=[];
    elementos= actualizarMenu(nombrMenu);
    return elementos;
}
static List<ElementoLista> obtenerMenuPrincipal() {
    if ( OpcionesMenus.elementosPrincipal==null ||  OpcionesMenus.elementosPrincipal.length==0 )
         OpcionesMenus.elementosPrincipal= actualizarMenu('menu_principal');
    return OpcionesMenus.elementosPrincipal;
}

static List<ElementoLista> obtenerMenuPrincipalA() {
     List<ElementoLista> elementos=[]; 
     elementos=actualizarMenu('menu_principal');


    // if ( elementos.length==0)
    // {
    //   ElementoLista elemento = ElementoLista();

    //   // elemento = ElementoLista();
    //   // elemento.titulo = "Inicio";
    //   // elemento.ruta = "pagina_inicio";
    //   // elemento.subitulo = "";
    //   // elemento.icono = "house";
    //   // elemento.iconoLateral = "arrow_right";
    //   // elemento.pagina = pagina_inicio();
    //   // elemento.animacionPagina = eAnimacionPagina.ScaleRotateRoute;
    //   // elemento.activo = 0;
    //   // elementos.add(elemento);

    //   // elemento = ElementoLista();
    //   // elemento.titulo = "Acceso";
    //   // elemento.ruta = "pagina_acceso";
    //   // elemento.subitulo = "";
    //   // elemento.icono = "login";
    //   // elemento.iconoLateral = "arrow_right";
    //   // elemento.pagina = pagina_acceso();
    //   // elemento.animacionPagina = eAnimacionPagina.ScaleRotateRoute;
    //   // elemento.activo = 0;
    //   // elementos.add(elemento);

    //   elemento = ElementoLista();
    //   elemento.titulo = "Menú principal";
    //   elemento.ruta = "pagina_menu_principal";
    //   elemento.subtitulo = "";
    //   elemento.icono = "menu";
    //   elemento.iconoLateral = "arrow_right";
    //   elemento.pagina = pagina_menu_principal();
    //   elemento.animacionPagina = eAnimacionPagina.rotationRoute;
    //   elemento.activo = 1;
    //   elementos.add(elemento);

    //   elemento = ElementoLista();
    //   elemento.titulo = "Pruebas";
    //   elemento.ruta = "pagina_prueba";
    //   elemento.subtitulo = "";
    //   elemento.icono = "menu";
    //   elemento.iconoLateral = "arrow_right";
    //   elemento.pagina = pagina_prueba(titulo: "prueba  fga",);
    //   elemento.animacionPagina = eAnimacionPagina.rotationRoute;
    //   elemento.activo = 1;
    //   elementos.add(elemento);

    //   elemento = ElementoLista();
    //   elemento.titulo = "Tema";
    //   elemento.ruta = "pagina_tema";
    //   elemento.subtitulo = "";
    //   elemento.icono = "menu";
    //   elemento.iconoLateral = "arrow_right";
    //   elemento.pagina = pagina_tema(titulo: "prueba  fga",);
    //   elemento.animacionPagina = eAnimacionPagina.rotationRoute;
    //   elemento.activo = 1;
    //   elementos.add(elemento);

    //   elemento = ElementoLista();
    //   elemento.titulo = "Home Page";
    //   elemento.ruta = "MyHomePage";
    //   elemento.subtitulo = "";
    //   elemento.icono = "menu";
    //   elemento.iconoLateral = "arrow_right";
    //   elemento.pagina = MyHomePage (titulo: "Definir Tema ",);
    //   elemento.animacionPagina = eAnimacionPagina.rotationRoute;
    //   elemento.activo = 1;
    //   elementos.add(elemento);



    // }


/*     // elemento = ElementoLista();
    // elemento.titulo = "Franquicias";
    // elemento.ruta = "pagina_Suscripcion_lista";
    // elemento.subitulo = "";
    // elemento.icono = "card_membership";
    // elemento.iconoLateral = "arrow_right";
    // elemento.activo = 1;
    // elemento.pagina = pagina_Suscripcion_lista(
    //     paginaSiguiente: "pagina_Suscripcion_captura", accionPagina: "avanzar");
    // elemento.animacionPagina = eAnimacionPagina.ScaleRotateRoute;
    // elementos.add(elemento);

    // elemento = ElementoLista();
    // elemento.titulo = "Socio  ";
    // elemento.ruta = "pagina_Suscripcion_captura";
    // elemento.subitulo = "";
    // elemento.icono = "accessibility";
    // elemento.iconoLateral = "arrow_right";
    // elemento.activo = 0;
    // elemento.pagina = pagina_Suscripcion_captura(
    //     paginaSiguiente: "pagina_Suscripcion_lista", accionPagina: "avanzar");
    // elemento.animacionPagina = eAnimacionPagina.ScaleRotateRoute;
    // elementos.add(elemento);

    // elemento = ElementoLista();
    // elemento.titulo = "Usuarios";
    // elemento.ruta = "pagina_Usuario_lista";
    // elemento.subitulo = "";
    // elemento.icono = "usuarios";
    // elemento.iconoLateral = "arrow_right";
    // //  elemento.animacionPagina = eAnimacionPagina.FadeRoute;
    // elemento.pagina = pagina_Usuario_lista(
    //     paginaSiguiente: "pagina_Usuario_captura", accionPagina: "avanzar");
    // elemento.animacionPagina = eAnimacionPagina.ScaleRotateRoute;
    // elemento.activo = 1;
    // elementos.add(elemento);

    // elemento = ElementoLista();
    // elemento.titulo = "Usuario";
    // elemento.ruta = "pagina_Usuario_captura";
    // elemento.subitulo = "";
    // elemento.icono = "usuarios";
    // elemento.iconoLateral = "arrow_right";
    // // elemento.animacionPagina = eAnimacionPagina.FadeRoute;
    // elemento.pagina = pagina_Usuario_captura(
    //     paginaSiguiente: "pagina_Usuario_lista", accionPagina: "avanzar");
    // elemento.animacionPagina = eAnimacionPagina.ScaleRotateRoute;
    // elemento.activo = 0;
    // elementos.add(elemento);

    elemento = ElementoLista();
    elemento.titulo = "Clientes";
    elemento.ruta = "pagina_Cliente_lista";
    elemento.subitulo = "";
    elemento.icono = "account_box";
    elemento.iconoLateral = "arrow_right";
    //  elemento.animacionPagina = eAnimacionPagina.FadeRoute;
    elemento.pagina = pagina_Cliente_lista(
        paginaSiguiente: "pagina_Cliente_captura", accionPagina: "avanzar");
    elemento.animacionPagina = eAnimacionPagina.ScaleRotateRoute;
    elemento.activo = 1;
    elementos.add(elemento);

    elemento = ElementoLista();
    elemento.titulo = "Cliente";
    elemento.ruta = "pagina_Cliente_captura";
    elemento.subitulo = "";
    elemento.icono = "account_box";
    elemento.iconoLateral = "arrow_right";
    // elemento.animacionPagina = eAnimacionPagina.FadeRoute;
    elemento.pagina = pagina_Cliente_captura(
        paginaSiguiente: "pagina_Cliente_lista", accionPagina: "avanzar");
    elemento.animacionPagina = eAnimacionPagina.ScaleRotateRoute;
    elemento.activo = 0;
    elementos.add(elemento);

    if (Sesion.perfiles.contains("1") || Sesion.perfiles.contains("7")) {
      elemento = ElementoLista();
      elemento.titulo = "Mis Pendientes  ";
      elemento.ruta = "pagina_misPendientes_lista";
      elemento.subitulo = "";
      elemento.icono = "estaus";
      elemento.iconoLateral = "arrow_right";
      elemento.activo = 1;
      elemento.pagina = pagina_MisPendientes_lista(
          paginaSiguiente: "pagina_AvanzarTarea", accionPagina: "avanzar");
      elemento.animacionPagina = eAnimacionPagina.ScaleRotateRoute;
      elementos.add(elemento);


      elemento = ElementoLista();
      elemento.titulo = "Realizar Tarea  ";
      elemento.ruta = "pagina_AvanzarTarea";
      elemento.subitulo = "";
      elemento.icono = "activity";
      elemento.iconoLateral = "arrow_right";
      elemento.activo = 0;
      elemento.pagina = pagina_AvanzarTarea(
          paginaSiguiente: "pagina_misPendientes_lista",
          accionPagina: "avanzar");
      elemento.animacionPagina = eAnimacionPagina.ScaleRotateRoute;
      elementos.add(elemento);
    }

    elemento = ElementoLista();
    elemento.titulo = "Red socios";
    elemento.ruta = "pagina_red";
    elemento.subitulo = "";
    elemento.icono = "redGrupo";
    elemento.iconoLateral = "arrow_right";
    elemento.pagina = pagina_red();
    elemento.animacionPagina = eAnimacionPagina.ScaleRotateRoute;
    elemento.activo = 1;
    elementos.add(elemento);

    // if (Sesion.perfiles.contains("1")) {
    //   elemento = ElementoLista();
    //   elemento.titulo = "Estadísticas general";
    //   elemento.ruta = "pagina_EstadisticasFlujo_lista";
    //   elemento.subitulo = "";
    //   elemento.icono = "analytics";
    //   elemento.iconoLateral = "arrow_right";
    //   elemento.pagina = pagina_EstadisticasFlujo_lista(
    //       paginaSiguiente: "pagina_ActivdadInfo_listaGeneral",
    //       tipo: "general",
    //       accionPagina: "avanzar");
    //   elemento.animacionPagina = eAnimacionPagina.ScaleRotateRoute;
    //   elemento.activo = 1;
    //   elementos.add(elemento);
    // }

    // elemento = ElementoLista();
    // elemento.titulo = "Estadísticas por socio";
    // elemento.ruta = "pagina_EstadisticasFlujo_lista";
    // elemento.subitulo = "";
    // elemento.icono = "analytics";
    // elemento.iconoLateral = "arrow_right";
    // elemento.pagina = pagina_EstadisticasFlujo_lista(
    //     paginaSiguiente: "pagina_ActivdadInfo_listaSocio",
    //     tipo: "socio",
    //     accionPagina: "avanzar");
    // elemento.animacionPagina = eAnimacionPagina.ScaleRotateRoute;
    // elemento.activo = 1;
    // elementos.add(elemento);

    // elemento = ElementoLista();
    // elemento.titulo = "Estadísticas por grupo";
    // elemento.ruta = "pagina_EstadisticasFlujo_lista";
    // elemento.subitulo = "";
    // elemento.icono = "analytics";
    // elemento.iconoLateral = "arrow_right";
    // elemento.pagina = pagina_EstadisticasFlujo_lista(
    //     paginaSiguiente: "pagina_ActivdadInfo_listaGrupo",
    //     tipo: "grupo",
    //     accionPagina: "avanzar");
    // elemento.animacionPagina = eAnimacionPagina.ScaleRotateRoute;
    // elemento.activo = 1;
    // elementos.add(elemento);

    // elemento = ElementoLista();
    // elemento.titulo = "Actividad";
    // elemento.ruta = "pagina_ActivdadInfo_listaGeneral";
    // elemento.subitulo = "";
    // elemento.icono = "analytics";
    // elemento.iconoLateral = "arrow_right";
    // elemento.pagina = pagina_ActivdadInfo_lista(tipo: "general");
    // elemento.animacionPagina = eAnimacionPagina.ScaleRotateRoute;
    // elemento.activo = 0;
    // elementos.add(elemento);

    // elemento = ElementoLista();
    // elemento.titulo = "Actividad";
    // elemento.ruta = "pagina_ActivdadInfo_listaSocio";
    // elemento.subitulo = "";
    // elemento.icono = "analytics";
    // elemento.iconoLateral = "arrow_right";
    // elemento.pagina = pagina_ActivdadInfo_lista(tipo: "socio");
    // elemento.animacionPagina = eAnimacionPagina.ScaleRotateRoute;
    // elemento.activo = 0;
    // elementos.add(elemento);

    // elemento = ElementoLista();
    // elemento.titulo = "Actividad";
    // elemento.ruta = "pagina_ActivdadInfo_listaGrupo";
    // elemento.subitulo = "";
    // elemento.icono = "analytics";
    // elemento.iconoLateral = "arrow_right";
    // elemento.pagina = pagina_ActivdadInfo_lista(tipo: "grupo");
    // elemento.animacionPagina = eAnimacionPagina.ScaleRotateRoute;
    // elemento.activo = 0;
    // elementos.add(elemento);


    //  pagina_EstadisticasDashBoard

    elemento = ElementoLista();
    elemento.titulo = " FLujo de trabajo";
    elemento.ruta = "pagina_Seleccion_Flujo";
    elemento.subitulo = "";
    elemento.icono = "analytics";
    elemento.iconoLateral = "arrow_right";
    elemento.pagina = pagina_Seleccion_FLujo();

    elemento.animacionPagina = eAnimacionPagina.ScaleRotateRoute;
    elemento.activo = 0;
    elementos.add(elemento);

    elemento = ElementoLista();
    elemento.titulo = "Estadísticas";
    elemento.ruta = "pagina_Seleccion_Estadistica";
    elemento.subitulo = "";
    elemento.icono = "analytics";
    elemento.iconoLateral = "arrow_right";
    elemento.pagina = pagina_Seleccion_Estadistica(
        paginaSiguiente: "",
        tipo: "tarea",
        accionPagina: "avanzar");
    elemento.animacionPagina = eAnimacionPagina.ScaleRotateRoute;
    elemento.activo = 1;
    elementos.add(elemento);




    elemento = ElementoLista();
    elemento.titulo = "DashBoard Tarea";
    elemento.ruta = "pagina_Estadisticas_tarea";
    elemento.subitulo = "";
    elemento.icono = "analytics";
    elemento.iconoLateral = "arrow_right";
    elemento.pagina = pagina_Estadisticas(
        paginaSiguiente: "pagina_EstadisticasInformacion_tarea",
        tipo: "tarea",
        accionPagina: "avanzar");
    elemento.animacionPagina = eAnimacionPagina.ScaleRotateRoute;
    elemento.activo = 0;
    elementos.add(elemento);

    elemento = ElementoLista();
    elemento.titulo = "DashBoard Grupo";
    elemento.ruta = "pagina_Estadisticas_grupo";
    elemento.subitulo = "";
    elemento.icono = "analytics";
    elemento.iconoLateral = "arrow_right";
    elemento.pagina = pagina_Estadisticas(
        paginaSiguiente: "pagina_EstadisticasInformacion_grupo",
        tipo: "grupo",
        accionPagina: "avanzar");
    elemento.animacionPagina = eAnimacionPagina.ScaleRotateRoute;
    elemento.activo = 0;
    elementos.add(elemento);

    elemento = ElementoLista();
    elemento.titulo = "DashBoard socio";
    elemento.ruta = "pagina_Estadisticas_socio";
    elemento.subitulo = "";
    elemento.icono = "analytics";
    elemento.iconoLateral = "arrow_right";
    elemento.pagina = pagina_Estadisticas(
        paginaSiguiente: "pagina_EstadisticasInformacion_socio",
        tipo: "socio",
        accionPagina: "avanzar");
    elemento.animacionPagina = eAnimacionPagina.ScaleRotateRoute;
    elemento.activo = 0;
    elementos.add(elemento);

    elemento = ElementoLista();
    elemento.titulo = "Información tarea";
    elemento.ruta = "pagina_EstadisticasInformacion_tarea";
    elemento.subitulo = "";
    elemento.icono = "analytics";
    elemento.iconoLateral = "arrow_right";
    elemento.pagina = pagina_EstadisticasInformacion(tipo: "tarea");
    elemento.animacionPagina = eAnimacionPagina.ScaleRotateRoute;
    elemento.activo = 0;
    elementos.add(elemento);

    elemento = ElementoLista();
    elemento.titulo = "Información grupo";
    elemento.ruta = "pagina_EstadisticasInformacion_grupo";
    elemento.subitulo = "";
    elemento.icono = "analytics";
    elemento.iconoLateral = "arrow_right";
    elemento.pagina = pagina_EstadisticasInformacion(tipo: "grupo");
    elemento.animacionPagina = eAnimacionPagina.ScaleRotateRoute;
    elemento.activo = 0;
    elementos.add(elemento);

  elemento = ElementoLista();
    elemento.titulo = "Información Socio ";
    elemento.ruta = "pagina_EstadisticasInformacion_socio";
    elemento.subitulo = "";
    elemento.icono = "analytics";
    elemento.iconoLateral = "arrow_right";
    elemento.pagina = pagina_EstadisticasInformacion(tipo: "socio");
    elemento.animacionPagina = eAnimacionPagina.ScaleRotateRoute;
    elemento.activo = 0;
    elementos.add(elemento);

    // if  (Sesion.perfiles.contains("1"))
    // {
    // elemento = ElementoLista();
    // elemento.titulo = "Grafica";
    // elemento.ruta = "pagina_grafica";
    // elemento.subitulo = "";
    // elemento.icono = "graficaPie";
    // elemento.iconoLateral = "arrow_right";
    // elemento.pagina = pagina_grafica();
    // elemento.animacionPagina = eAnimacionPagina.SlideRightRoute;
    // elemento.activo = 1;
    // elementos.add(elemento);
    // }

    // elemento = ElementoLista();
    // elemento.titulo = "DashBoard";
    // elemento.ruta = "Pagina_DashBoard";
    // elemento.subitulo = "";
    // elemento.icono = "graficaPie";
    // elemento.iconoLateral = "arrow_right";
    // elemento.pagina = Pagina_DashBoard();
    // elemento.animacionPagina = eAnimacionPagina.SlideRightRoute;
    // elemento.activo = 1;
    // elementos.add(elemento);

    elemento = ElementoLista();
    elemento.titulo = "Tema";
    elemento.ruta = "pagina_tema";
    elemento.subitulo = "";
    elemento.icono = "tema";
    elemento.iconoLateral = "arrow_right";
    elemento.pagina = pagina_tema();
    elemento.animacionPagina = eAnimacionPagina.ScaleRotateRoute;
    elemento.activo = 1;
    elementos.add(elemento);

    elemento = ElementoLista();
    elemento.titulo = "Seguimiento";
    elemento.ruta = "pagina_Seguimiento_lista";
    elemento.subitulo = "";
    elemento.icono = "activity";
    elemento.iconoLateral = "arrow_right";
    elemento.pagina = pagina_Seguimiento_lista();
    elemento.animacionPagina = eAnimacionPagina.ScaleRotateRoute;
    elemento.activo = 0;
    elementos.add(elemento);

    elemento = ElementoLista();
    elemento.titulo = "Documentos";
    elemento.ruta = "FlujoTrabajoDocumento_pagina_lista";
    elemento.subitulo = "";
    elemento.icono = "documentos";
    elemento.iconoLateral = "arrow_right";
    elemento.pagina = FlujoTrabajoDocumento_pagina_lista(
        paginaSiguiente: "FlujoTrabajoDocumento_pagina_captura",
        accionPagina: "avanzar");
    elemento.animacionPagina = eAnimacionPagina.ScaleRotateRoute;
    elemento.activo = 0;
    elementos.add(elemento);

    elemento = ElementoLista();
    elemento.titulo = "Documento";
    elemento.ruta = "FlujoTrabajoDocumento_pagina_captura";
    elemento.subitulo = "";
    elemento.icono = "documentos";
    elemento.iconoLateral = "arrow_right";
    elemento.pagina = FlujoTrabajoDocumento_pagina_captura(
        paginaSiguiente: "FlujoTrabajoDocumento_pagina_lista",
        accionPagina: "avanzar");
    elemento.animacionPagina = eAnimacionPagina.ScaleRotateRoute;
    elemento.activo = 0;
    elementos.add(elemento);


    elemento = ElementoLista();
    elemento.titulo = "Productividad  ";
    elemento.ruta = "pagina_Productividad_lista";
    elemento.subitulo = "";
    elemento.icono = "trabajo";
    elemento.iconoLateral = "arrow_right";
    elemento.activo = 1;
    elemento.pagina = pagina_Productividad_lista(
        paginaSiguiente: "pagina_ProductividadDetalle_lista", accionPagina: "avanzar");
    elemento.animacionPagina = eAnimacionPagina.ScaleRotateRoute;
    elementos.add(elemento);

    elemento = ElementoLista();
    elemento.titulo = "Productividad  actividad ";
    elemento.ruta = "pagina_ProductividadDetalle_lista";
    elemento.subitulo = "";
    elemento.icono = "estaus";
    elemento.iconoLateral = "arrow_right";
    elemento.activo = 0;
    elemento.pagina = pagina_ProductividadDetalle_lista(
        paginaSiguiente: "pagina_Productividad_lista", accionPagina: "avanzar");
    elemento.animacionPagina = eAnimacionPagina.ScaleRotateRoute;
    elementos.add(elemento);



    elemento = ElementoLista();
    elemento.titulo = "Consulta Tramites  ";
    elemento.ruta = "pagina_ConsultaTramite_lista.";
    elemento.subitulo = "";
    elemento.icono = "menu_book";
    elemento.iconoLateral = "arrow_right";
    elemento.activo = 1;
    elemento.pagina = pagina_ConsultaTramite_lista(
         paginaSiguiente: "pagina_ConsultaTramite_captura", accionPagina: "avanzar");
    elemento.animacionPagina = eAnimacionPagina.ScaleRotateRoute;
    elementos.add(elemento);

    elemento = ElementoLista();
    elemento.titulo = "Información  Tramite ";
    elemento.ruta = "pagina_ConsultaTramite_captura";
    elemento.subitulo = "";
    elemento.icono = "estaus";
    elemento.iconoLateral = "arrow_right";
    elemento.activo = 0;
    elemento.pagina = pagina_ConsultaTramite_captura(
        paginaSiguiente: "pagina_ConsultaTramite_lista", accionPagina: "avanzar");
    elemento.animacionPagina = eAnimacionPagina.ScaleRotateRoute;
    elementos.add(elemento);

    // elemento = ElementoLista();
    // elemento.titulo = "Prueba Lista  ";
    // elemento.ruta = "pagina_Prueba_lista";
    // elemento.subitulo = "";
    // elemento.icono = "estaus";
    // elemento.iconoLateral = "arrow_right";
    // elemento.activo = 1;
    // elemento.pagina = pagina_Prueba_lista(
    //     paginaSiguiente: "pagina_ConsultaTramite_lista", accionPagina: "avanzar");
    // elemento.animacionPagina = eAnimacionPagina.ScaleRotateRoute;
    // elementos.add(elemento);

    // elemento = ElementoLista();
    // elemento.titulo = "Prueba ";
    // elemento.ruta = "Prueba";
    // elemento.subitulo = "";
    // elemento.icono = "estaus";
    // elemento.iconoLateral = "arrow_right";
    // elemento.activo = 1;
    // elemento.pagina = Prueba(
    //     paginaSiguiente: "pagina_ConsultaTramite_lista", accionPagina: "avanzar");
    // elemento.animacionPagina = eAnimacionPagina.ScaleRotateRoute;
    // elementos.add(elemento);

 */

    return elementos;
  }
}
