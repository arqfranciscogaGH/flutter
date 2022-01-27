//  librerias internas de flutter

import 'package:flutter/material.dart';
import 'dart:math';

//  librerias importadas flutter

import 'package:provider/provider.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:charts_flutter/flutter.dart' as charts;

//  librerias  proyecto

import '../../../configuracion/configuracionAplicacion.dart';
import '../../../../nucleo/ui/ui.dart';
import '../../../contexto/contexto.dart';

import '../../vistas/vista_tarjeta.dart';
import 'EstadisticasUI.dart';

import 'DefininicionEstadisticas.dart';

class pagina_Seleccion_Estadistica extends StatefulWidget {
  pagina_Seleccion_Estadistica(
      {Key key,
      this.titulo,
      this.pagina,
      this.paginaSiguiente,
      this.paginaAnterior,
      this.accionPagina,
      this.activarAcciones,
      this.tipo
      })
      : super(key: key);
  String titulo;
  String pagina = "pagina_Seleccion_Estadistica";
  String paginaSiguiente = "";
  String paginaAnterior = "";
  String accionPagina = ""; // avanzar, regresar
  bool activarAcciones = false;
  String tipo = ""; 
  static String ruta = "pagina_Seleccion_Estadistica";

  @override
  _pagina_Seleccion_Estadistica createState() => _pagina_Seleccion_Estadistica();
}

class _pagina_Seleccion_Estadistica extends State<pagina_Seleccion_Estadistica> {
  //  declaración de variables

  IdiomaAplicacion idioma;
  // Suscripcion entidadCaptura ;
  //List<Suscripcion> listaEntidad;

  // KEYS

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  GlobalKey _bottomNavigationKey = GlobalKey();

  //  Acciones
  ElementoLista accionAgregar;
  ElementoLista accionConsultar;
  ElementoLista accionFiltrar;

  //  provider
 EstadisticasVistaControlador provider;
  
  //  Interfaz  comun

  PageController paginaControlador;
  //  controladores

  //  otros

   double paginaActual=0.0;
  void seleccionPagina() {
    setState(() {
      paginaActual =paginaControlador.page;
      print(paginaActual);
    });
    
  }
  //  inicializar  variables
  @override
  void initState() {
    super.initState();
    paginaControlador= PageController (initialPage: 1 , viewportFraction: 0.3);
    widget.pagina = pagina_Seleccion_Estadistica.ruta;
    paginaControlador..addListener(seleccionPagina);
                 

  

  }  

  @override
  void dispose() {
    paginaControlador.removeListener(seleccionPagina);
    paginaControlador.dispose();
    super.dispose();

    // provider.dispose();
  }


  //
  //   construir  interfaz de usuario
  //
  @override
  Widget build(BuildContext context) {

     
    idioma = IdiomaAplicacion.obtener(context, idioma);
    widget.titulo = idioma.obtenerElemento(widget.pagina, "titulo");

/*     return ChangeNotifierProvider.value(
        value: provider,
        child:  */ return Scaffold(
         key: scaffoldKey,
          appBar: GradientAppBar(
            title: Text(widget.titulo),
            gradient: LinearGradient(colors: [
              Theme.of(context).primaryColor,
              Colores.obtenerColor(Configuracion.colorSecundario)
            ]),
            actions: <Widget>[

                      
                  IconButton(
                        icon: Icon( Icons.arrow_back  ),  onPressed: ()
                        {
                                Accion.regresar(context);
                        },
                  ),
            ],
          ),
          body: mostrarPagina(),
          //body: /* SafeArea( */
            // child: vistaInformacionS()
          // SafeArea(  child: vista_GraficaDinamica(
          //     datos: datos,
          //     titulo: "Grafica  Prueba",
          //     tipoGrafica: tipoGrafica,
          //     context: context)
          //     ),
          // floatingActionButtonLocation:
          //     FloatingActionButtonLocation.centerDocked,
          // floatingActionButton:
          //     Boton.crearBotonFlotante(context, accionAgregar),
          drawer: Menu.crearListaMenuLateral(
              context, OpcionesMenus.obtenerMenuPrincipal(), ""),
        // )
        );
  }

  //
  //  interface de usuario   comun de la vista
  //

  //
  // mostrar Contenido
  //
  Widget mostrarPagina() {

      return SingleChildScrollView(
           controller: paginaControlador,
           scrollDirection: Axis.vertical,
           child:Center (
             child:Column(
              children: <Widget>[
              vista_tarjeta( titulo:'Tarea', color: Colors.greenAccent,rutaIcono:'assets/img/tarea4.png' , rutaPagina:'pagina_Estadisticas_tarea'), 
              vista_tarjeta(titulo:'Grupo', color:Colors.blueAccent  ,rutaIcono:'assets/img/grupo2.png' ,rutaPagina:'pagina_Estadisticas_grupo'), 
              vista_tarjeta(titulo:'Socio', color:Colors.redAccent   ,rutaIcono:'assets/img/socio2.png' ,rutaPagina:'pagina_Estadisticas_socio'),              
            ])
       ) );
  }
   Widget mostrarPagina2() {

      return PageView(
           controller: paginaControlador,
           scrollDirection: Axis.vertical,
           children: <Widget>[
              vista_tarjeta(titulo:'Tarea', color: Colors.greenAccent,rutaIcono:'assets/img/tarea4.png' , rutaPagina:'pagina_Estadisticas_tarea'), 
              vista_tarjeta(titulo:'Grupo', color:Colors.blueAccent  ,rutaIcono:'assets/img/grupo2.png' ,rutaPagina:'pagina_Estadisticas_grupo'), 
              vista_tarjeta(titulo:'Socio', color:Colors.redAccent   ,rutaIcono:'assets/img/socio2.png' ,rutaPagina:'pagina_Estadisticas_socio'),             
        ] );
  }
 




  //
  //   control  de estado y validaciones
  //
  void actualizarEstadoEntidad(dynamic entidad) {
    // entidadCaptura=entidad;
    // provider.entidad=entidad;
  }
  void actualizarEstadoLista(List<dynamic> listaRespuesta) {

  
   }

  void actualizarGrafica(String tipo) {

    
 
  }

  //
  //   respuestas
  //

}
//
// Termina widget
//

