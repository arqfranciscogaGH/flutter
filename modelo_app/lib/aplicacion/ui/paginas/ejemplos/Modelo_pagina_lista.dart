//  librerias internas de flutter

import 'package:flutter/material.dart';

//  librerias importadas flutter

 import 'package:provider/provider.dart';
// import 'package:gradient_app_bar/gradient_app_bar.dart';

//  librerias  proyecto


import '../../../../inicializacion/inicializacion.dart';
import '../../../../configuracion/configuracion.dart';
import '../../../../administracion/administracion.dart';

import '../../../../nucleo/nucleo.dart';
import '../../../../aplicacion/aplicacion.dart';


//  librerias externas  flutter

import '../../../../paquetesExternos/paquetesExternos.dart';

// import '../../../contexto/contexto.dart';

import 'ModeloUI.dart';

class Modelo_pagina_lista extends StatefulWidget {
  Modelo_pagina_lista(
      {Key? key,
      this.titulo,
      this.pagina,
      this.paginaSiguiente,
      this.paginaAnterior,
      this.accionPagina,
      this.activarAcciones})
      : super(key: key);

  String? titulo;
  String? pagina= "";
  String? paginaSiguiente = "";
  String? paginaAnterior= "";
  String? accionPagina = ""; // avanzar, regresar
  bool? activarAcciones = false;
  static String ruta = "Modelo_pagina_lista";

  @override
  _Modelo_pagina_lista_state createState() => _Modelo_pagina_lista_state();
}

class _Modelo_pagina_lista_state extends State<Modelo_pagina_lista> {

  //  declaración de variables

  //  modelo  y entidades 

  // Suscripcion entidadCaptura ;
  //List<Suscripcion> listaEntidad;

  // KEYS

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  //  Acciones
  ElementoLista? accionAgregar;
  ElementoLista? accionConsultar;
  ElementoLista? accionFiltrar;

  //    control de estado  con provider

  ModeloCE? provider;
  
    //  Interfaz UI comun

  ModuloUI? ui;

  //  controladores

  //  otros

  //  inicializar  widget
  @override
  void initState() {
    super.initState();
    //  aasignar  ruta  a pagina 
    widget.pagina = Modelo_pagina_lista.ruta;
    //  provider 
    provider= ModeloCE();
    // UI 
    ui = ModuloUI(provider: provider!);

    //  definir  url y sus  parametros para realizar  consulta de informacion
    String url ="FTConsulta/''/";
    String argumentos ="";
    String consulta ="/1/VerTramite";
 
    //  obtener argumentos  de pagina  comun
    // argumentos= ContextoUI.obtenerKey("seguimiento").entidad.identificador;
    argumentos=argumentos==null  || argumentos=="" ?"''":argumentos;
    print (argumentos);
    url+= argumentos ;
    url+= consulta ;
    print (url);

    accionConsultar = ElementoLista(
        id: 2,
        operacion: eOperacion.consultar,        
        icono: "info",
        ruta: widget.paginaSiguiente,
        accion: ui!.seleccionarElemento,
        callBackAccion: ui!.respuestaSeleccionar,

        icono2: "historia",
        ruta2:  "pagina_captura",
        accion2: ui!.seleccionarElemento2,
        callBackAccion2: ui!.respuestaSeleccionar2 ,

        );
    accionFiltrar = ElementoLista(
        id: 3,
        operacion: eOperacion.filtrar,        
        icono: "info",
        ruta: widget.paginaSiguiente,
        accion: ui!.seleccionarElemento,
        callBackAccion: ui!.respuestaSeleccionar,
   
        icono2: "historia",
        ruta2:  "pagina_captura",
        accion2: ui!.seleccionarElemento,
        callBackAccion2: ui!.respuestaSeleccionar ,    
        );
  }  
  //  dispose widget
  @override
  void dispose() {
    super.dispose();
    provider!.dispose();
  }

  //
  //   construir  interfaz de usuario
  //
 //  build widget
   @override
  Widget build(BuildContext context) {

    widget.titulo=Traductor.obtenerEtiquetaSeccion(widget.pagina!,'titulo')??'Tema';
    print (widget.titulo);
    ui!.iniciar(context, scaffoldKey, widget);

    return ChangeNotifierProvider.value(
        value: provider,
        child:Scaffold(
            appBar: AppBar(title: Text(widget.titulo!),
            actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                      Buscador buscador = Buscador();
                      buscador.acccionConstruir = filtrarElementos;
                      showSearch(
                        context: context,
                        delegate: buscador,
                      );
                  },
                ),
              ]
            ),
            drawer: Menulateral.crearMenu(context, OpcionesMenus.obtenerMenuPrincipal(), widget.titulo!),
            body: mostrarContenido(),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: Boton.crearBotonFlotante(context, ElementoLista( icono: "save", accion:  ejecutar   ),
            ),
          )
    );
  }

  //
  //  metodos 
  //
   
   ejecutar(BuildContext context, ElementoLista elemento, [dynamic argumetos])
  {
    print ("ejecuto ");

  }

  //
  //  interface de usuario   comun de la vista
  //

  //
  // mostrar Contenido
  //

  Widget mostrarContenido() {

    print ( provider!.lista );
    return Consumer<ModeloCE>(
        builder: (context, _provider, widgetPadre) {
      // _provider.obtenerRedPorSuscripcion(Configuracion.idSuscriptor);
      return Vista_lista(
          lista: _provider.lista,
          acciones: accionConsultar,
          metodoCrearElemento: ui!.crearElementoEntidad,
          context: context,
          pagina: widget.pagina);
    });
  }

  //
  //  filtar  informacion
  //
  Widget filtrarElementos(String query) {
    List<dynamic> lista = provider!.lista!;
    if (query != "")
      lista = lista
          .where((s) => s.nombre.toLowerCase().contains(query.toLowerCase()))
          .toList();
    return Vista_lista(
        lista: lista,
        acciones: accionFiltrar,
        context: context,
        metodoCrearElemento: ui!.crearElementoEntidad,
        pagina: widget.pagina);
  }

  //
  //   control  de estado y validaciones
  //
  void actualizarEstadoEntidad(dynamic entidad) {
    // entidadCaptura=entidad;
    // provider.entidad=entidad;
  }
  void actualizarEstadoLista(List<dynamic> listaRespuesta) {
      print(listaRespuesta);
    // listaEntidad=listaRespuesta;
  }
  void actualizarEstadoListaEstatus(List<dynamic> listaRespuesta) {
    // listaEntidad=listaRespuesta;
    print(listaRespuesta);
  }
  //
  //   respuestas
  //

}
//
// Termina widget
//
