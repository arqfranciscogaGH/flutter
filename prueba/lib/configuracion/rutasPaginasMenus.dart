//  librerias internas de flutter

import 'package:flutter/material.dart';

//  librerias importadas flutter

//  librerias  proyecto

// import '../../nucleo/ui/ui.dart';
import '../../nucleo/negocio/modelo/ModeloBase.dart';
import '../aplicacion/ui/paginas/paginas.dart';



//  Variables

//  Propiedades

//  Métodos
generarRuta(BuildContext context, dynamic settings) {
  final arguments = settings.arguments;
  // switch (settings.name) {
  //   case 'inicio':
  //       Accion.hacer(context,  ElementoLista( pagina:  pagina_inicio() ) ,settings );
  //       break;
  //   case 'pagina_acceso':
  //       return pagina_acceso();
  //   case 'pagina_menu_principal':
  //       Accion.hacer(context,  ElementoLista( pagina:  pagina_menu_principal() ) ,settings );
  //       break;
  //   case 'pagina_preferencias':
  //       return pagina_preferencias();
  //   case 'pagina_tema':
  //       return pagina_tema();
  //   default:
  //     return null;
  // }
}

Map<String, WidgetBuilder> ObtenerRutas() {
  return <String, WidgetBuilder>{
    // '/': (BuildContext context) => pagina_inicio(),
    // 'pagina_inicio': (BuildContext context) => pagina_inicio(),
    // 'pagina_acceso': (BuildContext context) => pagina_acceso(),
    'pagina_menu_principal': (BuildContext context) => pagina_menu_principal(),
    'pagina_prueba': (BuildContext context) => pagina_prueba(),
    // 'pagina_tema': (BuildContext context) => pagina_tema(),
    // 'pagina_Seguimiento_lista': (BuildContext context) => pagina_Seguimiento_lista(),

    // 'pagina_Suscripcion_lista': (BuildContext context) =>
    //     pagina_Suscripcion_lista(
    //         paginaSiguiente: 'pagina_Suscripcion_captura',
    //         accionPagina: "avanzar"),
    // 'pagina_Suscripcion_captura': (BuildContext context) =>
    //     pagina_Suscripcion_captura(
    //         paginaSiguiente: 'pagina_Suscripcion_lista',
    //         accionPagina: "avanzar"),
    // 'pagina_Usuario_lista': (BuildContext context) => pagina_Usuario_lista(
    //     paginaSiguiente: 'pagina_Usuario_captura', accionPagina: "avanzar"),
    // 'pagina_Usuario_captura': (BuildContext context) => pagina_Usuario_captura(
    //     paginaSiguiente: 'pagina_Usuario_lista', accionPagina: 'avanzar'),

  };
}

class OpcionesMenus {
  static List<ElementoLista> elementos=[];
  static ElementoLista obtener(String ruta) {
    if (elementos.length==0) obtenerMenuPrincipal();
    return OpcionesMenus.elementos.firstWhere((s) => s.ruta == ruta);
  }

  static List<ElementoLista> obtenerMenuPrincipal() {
  
    if ( elementos.length==0)
    {
      ElementoLista elemento = ElementoLista();

      // elemento = ElementoLista();
      // elemento.titulo = "Inicio";
      // elemento.ruta = "pagina_inicio";
      // elemento.subitulo = "";
      // elemento.icono = "house";
      // elemento.iconoLateral = "arrow_right";
      // elemento.pagina = pagina_inicio();
      // elemento.animacionPagina = eAnimacionPagina.ScaleRotateRoute;
      // elemento.activo = 0;
      // elementos.add(elemento);

      // elemento = ElementoLista();
      // elemento.titulo = "Acceso";
      // elemento.ruta = "pagina_acceso";
      // elemento.subitulo = "";
      // elemento.icono = "login";
      // elemento.iconoLateral = "arrow_right";
      // elemento.pagina = pagina_acceso();
      // elemento.animacionPagina = eAnimacionPagina.ScaleRotateRoute;
      // elemento.activo = 0;
      // elementos.add(elemento);

      elemento = ElementoLista();
      elemento.titulo = "Menú principal";
      elemento.ruta = "pagina_menu_principal";
      elemento.subitulo = "";
      elemento.icono = "menu";
      elemento.iconoLateral = "arrow_right";
      elemento.pagina = pagina_menu_principal();
      elemento.animacionPagina = eAnimacionPagina.rotationRoute;
      elemento.activo = 1;
      elementos.add(elemento);

      elemento = ElementoLista();
      elemento.titulo = "Pruebas";
      elemento.ruta = "pagina_prueba";
      elemento.subitulo = "";
      elemento.icono = "menu";
      elemento.iconoLateral = "arrow_right";
      elemento.pagina = pagina_prueba(titulo: "prueba  fga",);
      elemento.animacionPagina = eAnimacionPagina.rotationRoute;
      elemento.activo = 1;
      elementos.add(elemento);

    }


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
