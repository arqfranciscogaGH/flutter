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
import 'Suscripcion_captura.dart';

class pagina_Suscripcion_lista_captura extends StatefulWidget {
  pagina_Suscripcion_lista_captura(
      {Key key,
      this.titulo,
      this.pagina,
      this.paginaSiguiente,
      this.paginaAnterior,
      this.activarAcciones,
      this.accionPagina})
      : super(key: key);
  String titulo;
  String pagina;
  String paginaSiguiente = "";
  String paginaAnterior = "";
  String accionPagina = ""; // avanzar, regresar
  bool activarAcciones = false;
  static String ruta = "pagina_Suscripcion_lista_captura";

  @override
  _pagina_Suscripcion_lista_captura_state createState() =>
      _pagina_Suscripcion_lista_captura_state();
}

class _pagina_Suscripcion_lista_captura_state
    extends State<pagina_Suscripcion_lista_captura> {
  //  declaración de variables

  IdiomaAplicacion idioma;
  // Suscripcion entidadCaptura ;
  // List<Suscripcion> listaEntidad;

  // KEYS

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  //  key captura

  GlobalKey<FormState> keyFormulario;
  //  Acciones
  ElementoLista accionAgregar;
  ElementoLista accionConsultar;
  ElementoLista accionFiltrar;
  ElementoLista accionGuardar;

  //  provider
  SuscripcionControlador provider;

  //  Interfaz  comun
  SuscripcionUI ui;

  //  controladores

  //  otros

  //  inicializar  variables
  @override
  void initState() {
    provider = SuscripcionControlador();
    widget.pagina = "pagina_Suscripcion_captura";
    ui = SuscripcionUI(provider: provider);
    // cuando es captura  parcial ,la ruta debe ser null    para qe  ejecute  la pagina siguiente
    accionAgregar = ElementoLista(
        id: 1,
        icono: "add_circle",
        ruta: null,
        accion: ui.agregarElemento,
        callBackAccion: ui.respuestaAgregar);
    accionConsultar = ElementoLista(
        id: 2,
        icono: "edit",
        ruta: null,
        operacion: eOperacion.Consultar,
        accion: ui.seleccionarElemento,
        callBackAccion: ui.respuestaSeleccionar,
        accion2: ui.eliminarElemento,
        callBackAccion2: ui.respuestaEliminar);
    accionFiltrar = ElementoLista(
        id: 3,
        icono: "list",
        ruta: null,
        operacion: eOperacion.Filtrar,
        accion: ui.seleccionarElemento,
        callBackAccion: ui
            .respuestaSeleccionar); // vagina  debe ser vacia si captura parcial
    accionGuardar = ElementoLista(
        id: 4,
        icono: "save",
        ruta: null,
        accion: ui.guardarEntidad,
        callBackAccion: ui.respuestaInsertar,
        callBackAccion2: ui.respuestaModificar,
        callBackAccion3: ui.respuestaGuardar,
        argumento: widget.pagina);
    keyFormulario = GlobalKey<FormState>();
    ContextoUI.guadarKey(widget.pagina, keyFormulario);
    // provider.addListener(() {
    //      print("  actualizo, numero ${provider.entidad.id} ");
    // }) ;

    provider.limpiar();
    provider.asignarParametros(null, "prueba");  
    provider.consultarEntidad(Suscripcion().iniciar(), null);
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
    //  contextoAplicacion=ContextoAplicacion.obtener(ModalRoute.of(context).settings.arguments);
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
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  ui.agregarElemento(context, accionAgregar);
                },
              ),
              IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  ui.guardarEntidad(context, accionGuardar);
                },
              ),
            ],
          ),
          body: mostrarContenido(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: ui.crearBotonesAcciones(
              context, widget.activarAcciones ?? true, accionGuardar),
        ));
  }

  Widget mostrarContenido() {
    return Stack(children: <Widget>[
      _vistaListaParcial(),
      _vistaSeparador(),
      _vistaCapturaParcial(),
    ]);
  }

  Widget _vistaListaParcial() {
    return Consumer<SuscripcionControlador>(
        builder: (context, _provider, widgetPadre) {
      double top = 0;
      double height = 0;
      MediaQueryData media = MediaQuery.of(context);
      Widget contenedor = Container(
        height: media.size.height * .3,
        width: media.size.width,
        child: Vista_lista(
            lista: _provider.lista,
            acciones: accionConsultar,
            metodoCrearElemento: ui.crearElementoEntidad,
            context: context,
            pagina: widget.pagina),
      );
      Widget posicion = Positioned(left: 0, top: 0, child: contenedor);
      return posicion;
    });
  }

  Widget _vistaSeparador() {
    double top = 0;
    double height = 0;
    MediaQueryData media = MediaQuery.of(context);
    if (media.orientation == "")
      top = 0;
    else
      top = 0;
    Widget contenedor = Container(
        height: 90,
        width: media.size.width,
        child: Column(children: [
          Divider(),
          Text(
            "Captura",
            textAlign: TextAlign.center,

            // style:  DefaultTextStyle.of(context).style,
            style: TextStyle(
                color: Colors.grey,
                fontFamily: DefaultTextStyle.of(context)
                    .style
                    .fontFamily, //'Monospace',
                fontSize: 14),
          ),
          Divider(),
        ]));
    Widget posicion = Positioned(left: 0, top: 320, child: contenedor);
    return posicion;
  }

  Widget _vistaCapturaParcial() {
    double top = 0;
    double height = 0;
    MediaQueryData media = MediaQuery.of(context);

    if (media.orientation == "")
      top = 0;
    else
      top = 0;

    // return  Consumer<SuscripcionControlador>( builder: (context,provider,widgetPadre )
    // {
    Widget contenedor = Container(
      height: media.size.height * .5, width: media.size.width,
      //child:control_captura(),
      child: Suscripcion_captura(
        pagina: widget.pagina,
        paginaSiguiente: widget.paginaSiguiente,
        paginaAnterior: widget.paginaAnterior,
        keyFormulario: keyFormulario,
      ),
    );
    Widget posicion = Positioned(left: 0, top: 370, child: contenedor);
    return posicion;
    // });
  }

  //
  //  filtar  informacion
  //

  Widget filtrarElementos(String query) {
    List<Suscripcion> lista = provider.lista;
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
  }
}

//
// Termina widget
//
