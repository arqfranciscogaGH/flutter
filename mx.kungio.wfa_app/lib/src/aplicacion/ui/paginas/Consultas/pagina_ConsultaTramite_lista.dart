//  librerias internas de flutter

import 'package:flutter/material.dart';

//  librerias importadas flutter

import 'package:provider/provider.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

//  librerias  proyecto

import '../../../configuracion/configuracionAplicacion.dart';
import '../../../../nucleo/ui/ui.dart';
import '../../../contexto/contexto.dart';
import 'ConsultaTramiteUI.dart';

class pagina_ConsultaTramite_lista extends StatefulWidget {
  pagina_ConsultaTramite_lista(
      {Key key,
      this.titulo,
      this.pagina,
      this.paginaSiguiente,
      this.paginaAnterior,
      this.accionPagina,
      this.activarAcciones})
      : super(key: key);
  String titulo;
  String pagina = "pagina_ConsultaTramite_lista";
  String paginaSiguiente = "";
  String paginaAnterior = "";
  String accionPagina = ""; // avanzar, regresar
  bool activarAcciones = false;
  static String ruta = "pagina_ConsultaTramite_lista";

  @override
  _pagina_ConsultaTramite_lista createState() => _pagina_ConsultaTramite_lista();
}

class _pagina_ConsultaTramite_lista extends State<pagina_ConsultaTramite_lista> {
  //  declaración de variables

  IdiomaAplicacion idioma;
  // Suscripcion entidadCaptura ;
  //List<Suscripcion> listaEntidad;

  // KEYS

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  //  Acciones
  ElementoLista accionAgregar;
  ElementoLista accionConsultar;
  ElementoLista accionFiltrar;

  //  provider
  // FTConsultaControlador provider;
 ConsultaTramiteControlador provider;
  
  //  Interfaz  comun
 ConsultaTramiteUI ui;

  //  controladores

  //  otros

  //  inicializar  variables
  @override
  void initState() {
    super.initState();
    widget.pagina = pagina_ConsultaTramite_lista.ruta;

    //  definir  url y sus  parametros 
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


    provider = ConsultaTramiteControlador();
   // String url ="FTConsulta/LINEAIV/''/1/VerTramite/";
    provider.limpiar();
    provider.asignarParametros(url, "prueba");
    provider.consultarEntidad(ConsultaTramite().iniciar(), null);

    ui = ConsultaTramiteUI(provider: provider);


    // cuando es captura  parcial ,la ruta debe ser null    para qe  ejecute  la pagina siguiente
    // ui.obtenerEstatusTarea(null) ;

    accionConsultar = ElementoLista(
        id: 2,
        operacion: eOperacion.Consultar,        
        icono: "info",
        ruta: widget.paginaSiguiente,
        accion: ui.seleccionarElemento,
        callBackAccion: ui.respuestaSeleccionar,

        icono2: "historia",
        ruta2:  "pagina_Seguimiento_lista",
        accion2: ui.seleccionarElemento2,
        callBackAccion2: ui.respuestaSeleccionar2 ,

        );
    accionFiltrar = ElementoLista(
        id: 3,
        operacion: eOperacion.Filtrar,        
        icono: "info",
        ruta: widget.paginaSiguiente,
        accion: ui.seleccionarElemento,
        callBackAccion: ui.respuestaSeleccionar,
   
        icono2: "historia",
        ruta2:  "pagina_Seguimiento_lista",
        accion2: ui.seleccionarElemento,
        callBackAccion2: ui.respuestaSeleccionar ,    
        );

 

    // provider.addListener(() {
    //      print("  actualizo, numero ${provider.entidad.id} ");
    // }) ;


  }  

  @override
  void dispose() {
    super.dispose();
    // provider.dispose();
  }

  //
  //   construir  interfaz de usuario
  //
  @override
  Widget build(BuildContext context) {
    // contextoAplicacion=ContextoAplicacion.obtener(ModalRoute.of(context).settings.arguments);
    // provider = Provider.of<FTConsultaControlador>(context,listen: false);
    // if (provider.lista==null)
    //     provider.consultarEntidad(FTConsulta().iniciar(), null);
   

    idioma = IdiomaAplicacion.obtener(context, idioma);
    ui.iniciar(context, scaffoldKey, idioma, widget);
    widget.titulo = idioma.obtenerElemento(widget.pagina, "titulo");
    return ChangeNotifierProvider.value(
        value: provider,
        child: Scaffold(
          key: scaffoldKey,
          appBar: GradientAppBar(
            title: Text(widget.titulo),
            gradient: LinearGradient(colors: [
              Theme.of(context).primaryColor,
              Colores.obtenerColor(Configuracion.colorSecundario)
            ]),
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
              //  IconButton(
              //       icon: Icon( Icons.arrow_back  ),  onPressed: ()
              //       {
              //               Accion.regresar(context);
              //       },
              // ),
            ],
          ),
          body: mostrarContenido(),
          // floatingActionButtonLocation:
          //     FloatingActionButtonLocation.centerDocked,
          // floatingActionButton:
          //     Boton.crearBotonFlotante(context, accionAgregar),
          drawer: Menu.crearListaMenuLateral(
              context, OpcionesMenus.obtenerMenuPrincipal(), ""),
        ));
  }

  //
  //  interface de usuario   comun de la vista
  //

  //
  // mostrar Contenido
  //

  Widget mostrarContenido() {
    print ( provider.lista  );
    return Consumer<ConsultaTramiteControlador>(
        builder: (context, _provider, widgetPadre) {
      // _provider.obtenerRedPorSuscripcion(Configuracion.idSuscriptor);
      return Vista_lista(
          lista: _provider.lista,
          acciones: accionConsultar,
          metodoCrearElemento: ui.crearElementoEntidad,
          context: context,
          pagina: widget.pagina);
    });
  }

  //
  //  filtar  informacion
  //
  Widget filtrarElementos(String query) {
    List<dynamic> lista = provider.lista;
    if (query != "")
      lista = lista
          .where((s) => s.nombre.toLowerCase().contains(query.toLowerCase()))
          .toList();
    return Vista_lista(
        lista: lista,
        acciones: accionFiltrar,
        metodoCrearElemento: ui.crearElementoEntidad,
        context: context,
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
