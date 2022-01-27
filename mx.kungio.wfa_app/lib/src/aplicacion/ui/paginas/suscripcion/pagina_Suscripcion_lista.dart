//  librerias internas de flutter

import 'package:flutter/material.dart';

//  librerias importadas flutter

import 'package:provider/provider.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

//  librerias  proyecto

import '../../../configuracion/configuracionAplicacion.dart';
import '../../../../nucleo/ui/ui.dart';
import '../../../contexto/contexto.dart';

import 'SuscripcionUI.dart';

class pagina_Suscripcion_lista extends StatefulWidget {
  pagina_Suscripcion_lista(
      {Key key,
      this.titulo,
      this.pagina,
      this.paginaSiguiente,
      this.paginaAnterior,
      this.accionPagina,
      this.activarAcciones})
      : super(key: key);
  String titulo;
  String pagina = "Suscripcion_lista";
  String paginaSiguiente = "";
  String paginaAnterior = "";
  String accionPagina = ""; // avanzar, regresar
  bool activarAcciones = false;
  static String ruta = "pagina_Suscripcion_lista";

  @override
  _pagina_Suscripcion_lista createState() => _pagina_Suscripcion_lista();
}

class _pagina_Suscripcion_lista extends State<pagina_Suscripcion_lista> {
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
  SuscripcionControlador provider;

  //  Interfaz  comun
  SuscripcionUI ui;

  //  controladores

  //  otros

  //  inicializar  variables
  @override
  void initState() {
    super.initState();
    widget.pagina = pagina_Suscripcion_lista.ruta;
    provider = SuscripcionControlador();
    ui = SuscripcionUI(provider: provider);
    // cuando es captura  parcial ,la ruta debe ser null    para qe  ejecute  la pagina siguiente
    accionAgregar = ElementoLista(
        id: 1,
        icono: "add_circle",
        ruta: widget.paginaSiguiente,
        accion: ui.agregarElemento,
        callBackAccion: ui.respuestaAgregar);
    accionConsultar = ElementoLista(
        id: 2,
        operacion: eOperacion.Consultar,        
        icono: "edit",
        ruta: widget.paginaSiguiente,
        accion: ui.seleccionarElemento,
        callBackAccion: ui.respuestaSeleccionar,

        accion2: ui.eliminarElemento,
        callBackAccion2: ui.respuestaEliminar,

        icono3: "usuario",
        ruta3: "pagina_Usuario_lista",     
        accion3: ui.seleccionarElemento,
        callBackAccion3: ui.respuestaSeleccionar        
        );
    accionFiltrar = ElementoLista(
        id: 3,
        operacion: eOperacion.Filtrar,        
        icono: "list",
        ruta: widget.paginaSiguiente,
        accion: ui.seleccionarElemento,
        callBackAccion: ui.respuestaSeleccionar,
        
        icono3: "usuarios",
        ruta3: "pagina_Usuario_lista",     
        accion3: ui.seleccionarElemento,
        callBackAccion3: ui.respuestaSeleccionar  

        );

    provider.limpiar();
    provider.asignarParametros(null, "prueba");
    provider.consultarEntidad(Suscripcion().iniciar(), actualizarEstadoLista);
    
    // provider.addListener(() {
    //      print("  actualizo, numero ${provider.entidad.id} ");
    // }) ;   
  }

  @override
  void dispose() {
    super.dispose();
    provider.dispose();
  }

  //
  //   construir  interfaz de usuario
  //
  @override
  Widget build(BuildContext context) {
    // contextoAplicacion=ContextoAplicacion.obtener(ModalRoute.of(context).settings.arguments);

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
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton:
              Boton.crearBotonFlotante(context, accionAgregar),
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
    return Consumer<SuscripcionControlador>(
        builder: (context, _provider, widgetPadre) {
      // _provider.obtenerRedPorSuscripcion(Configuracion.idSuscriptor);
      return Vista_lista(
          lista:
              provider.obtenerListaPorSuscripcion(Sesion.idSuscriptor),
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
    List<Suscripcion> lista = provider.obtenerListaPorSuscripcion(Sesion.idSuscriptor);
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
    // listaEntidad=listaRespuesta;
    provider.obtenerRedPorSuscripcion(Sesion.idSuscriptor);
  }

  //
  //   respuestas
  //

}
//
// Termina widget
//
