//  librerias internas de flutter

import 'package:flutter/material.dart';
import 'dart:math';

//  librerias importadas flutter

import 'package:provider/provider.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';



//  librerias  proyecto

import '../../../configuracion/configuracionAplicacion.dart';
import '../../../../nucleo/ui/ui.dart';
import '../../../contexto/contexto.dart';

import '../../vistas/vista_tarjeta.dart';

import 'ClienteUI.dart';

class pagina_Seleccion_FLujo extends StatefulWidget {
  pagina_Seleccion_FLujo(
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
  String pagina = "pagina_Seleccion_FLujo";
  String paginaSiguiente = "";
  String paginaAnterior = "";
  String accionPagina = ""; // avanzar, regresar
  bool activarAcciones = false;
  String tipo = ""; 
  static String ruta = "pagina_Seleccion_FLujo";

  @override
  _pagina_Seleccion_FLujo createState() => _pagina_Seleccion_FLujo();
}

class _pagina_Seleccion_FLujo extends State<pagina_Seleccion_FLujo> {
  //  declaración de variables

  IdiomaAplicacion idioma;
  Cliente entidadCaptura ;
  //List<Suscripcion> listaEntidad;

  // KEYS

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  GlobalKey _bottomNavigationKey = GlobalKey();

  //  Acciones
  ElementoLista accionAgregar;
  ElementoLista accionConsultar;
  ElementoLista accionFiltrar;

  //  provider
  ClienteControlador provider;

  //  Interfaz  comun
  ClienteUI ui;
  
  //  Interfaz  comun

  PageController paginaControlador;
  //  controladores

  //  otros


  //  inicializar  variables
  @override
  void initState() {
    super.initState();
 
                 

  

  }  

  @override
  void dispose() {
   
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
    widget.titulo ="Selección Servicio";
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
              vista_tarjeta(  id:'LINEAIV' , titulo:'LINEAIV REMODELAVIT', color: Colors.greenAccent,rutaIcono:'assets/img/remodelavit.jpg' , accion:opcionSeleccionada , rutaPagina:''), 
              vista_tarjeta( id:'MEJORAVIT' , titulo:'MEJORAVIT', color:Colors.blueAccent  ,rutaIcono:'assets/img/mejoravit.jpg'  , accion:opcionSeleccionada , rutaPagina:''), 
              vista_tarjeta( id:'CP' , titulo:'Crédito Pensionados ', color:Colors.blueAccent  ,rutaIcono:'assets/img/CP.jpg'  , accion:opcionSeleccionada , rutaPagina:''), 
              vista_tarjeta( id:'RCA' , titulo:'Recupetación Capital Afore', color:Colors.blueAccent  ,rutaIcono:'assets/img/RCA.jpg'  , accion:opcionSeleccionada , rutaPagina:''),   
              //vista_tarjeta(titulo:'Socio', color:Colors.redAccent   ,rutaIcono:'assets/img/socio2.png'  , accion:opcionSeleccionada , rutaPagina:''),              
            ])
       ) );
  }





  //
  //   control  de estado y validaciones
  //

   void opcionSeleccionada(String id) {
     ElementoLista elemento = ElementoLista();

     provider = ClienteControlador();
     entidadCaptura=provider.entidad;
     ui = ClienteUI(provider: provider);
     print(id);
     //ui.avanzarflujoTrabajo(context, elemento, entidadCaptura, "LINEAIV", "MODIFICAR");
     if  (id!=""  && entidadCaptura.referencia!=null && entidadCaptura.referencia!=""  )
     {
        String mensaje = this
        .idioma
        .obtenerAtributo("pagina_Comun", "operacionExitosa", "mensaje");
         this.scaffoldKey.currentState.showSnackBar(
         SnackBar(content: Text(mensaje + " : " + entidadCaptura.nombre)));
        respuestaSeleccion(context, null,entidadCaptura);
        ui.avanzarflujoTrabajo(context, elemento, entidadCaptura, id, "INICIAR");

     }
  }

 void respuestaSeleccion(
      BuildContext context, ElementoLista elemento, dynamic entidad) {
    // avanzarflujoTrabajo(context, elemento, entidad, "LINEAIV", "INICIAR");
    String titulo =
        idioma.obtenerAtributo("pagina_Comun", "operacionExitosa", "titulo");
    String mensaje =
        idioma.obtenerAtributo("pagina_Comun", "operacionExitosa", "mensaje");
    String icono =
        idioma.obtenerAtributo("pagina_Comun", "operacionExitosa", "icono");
    String opciones =
        idioma.obtenerAtributo("pagina_Comun", "operacionExitosa", "opciones");
    if (elemento != null && elemento.callBackAccion3 != null)
      elemento.callBackAccion3(context, elemento, entidad);
    Dialogo.mostrarAlerta(context, icono, titulo, mensaje, opciones);
  }
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

