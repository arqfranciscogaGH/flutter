//  librerias internas de flutter

import 'package:flutter/material.dart';

//  librerias importadas flutter

import 'package:provider/provider.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

//  librerias  proyecto

import '../../../configuracion/configuracionAplicacion.dart';
import '../../../../nucleo/ui/ui.dart';
import '../../../contexto/contexto.dart';

import 'FlujoTrabajoDocumentoUI.dart';

class FlujoTrabajoDocumento_pagina_lista extends StatefulWidget {
  FlujoTrabajoDocumento_pagina_lista(
      {Key key,
      this.titulo,
      this.pagina,
      this.paginaSiguiente,
      this.paginaAnterior,
      this.accionPagina,
      this.activarAcciones})
      : super(key: key);
  String titulo;
  String pagina;
  String paginaSiguiente = "";
  String paginaAnterior = "";
  String accionPagina = ""; // avanzar, regresar
  bool activarAcciones = false;
  static String ruta = "FlujoTrabajoDocumento_pagina_lista";

  @override
  _FlujoTrabajoDocumento_pagina_lista createState() =>
      _FlujoTrabajoDocumento_pagina_lista();
}

class _FlujoTrabajoDocumento_pagina_lista
    extends State<FlujoTrabajoDocumento_pagina_lista> {
  //  declaración de variables

  IdiomaAplicacion idioma;

  // KEYS

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  //  Acciones
  ElementoLista accionAgregar;
  ElementoLista accionConsultar;
  ElementoLista accionFiltrar;

  //  provider
  FlujoTrabajoDocumentoControlador provider;

  //  Interfaz  comun
  FlujoTrabajoDocumentoUI ui;

  //  controladores

  //  otros

  dynamic entidadCaptura;
  List<dynamic> listaEntidad;
  //  inicializar  variables
  @override
  void initState() {
    super.initState();
    widget.pagina = FlujoTrabajoDocumento_pagina_lista.ruta;
    provider = FlujoTrabajoDocumentoControlador();
    provider.limpiar();
    ui = FlujoTrabajoDocumentoUI(provider: provider);
    // cuando es captura  parcial ,la ruta debe ser null    para qe  ejecute  la pagina siguiente
    accionAgregar = ElementoLista(
        id: 1,
        icono: "actualizar",
        ruta: widget.pagina,
        accion: ui.agregarElemento,
        callBackAccion: ui.respuestaAgregar);
    accionConsultar = ElementoLista(
        id: 2,
        icono: "documentos",
        ruta: widget.paginaSiguiente,
        operacion: eOperacion.Consultar,
        accion: ui.seleccionarElemento,
        callBackAccion: ui.respuestaSeleccionar,
        accion2: ui.eliminarElemento,
        callBackAccion2: ui.respuestaEliminar);
    accionFiltrar = ElementoLista(
        id: 3,
        icono: "documentos",
        ruta: widget.paginaSiguiente,
        operacion: eOperacion.Filtrar,
        accion: ui.seleccionarElemento,
        callBackAccion: ui.respuestaSeleccionar);

    // provider.addListener(() {
    //      print("  actualizo, numero ${provider.entidad.id} ");
    // }) ;

    listaEntidad = ui.consultarDocumentos(actualizarEstadoListaDocumentos);
    //se requiere  limpiar los  parametros  por  usan la misma  configuracion los 2  controladores
    provider.asignarParametros(null, "prueba");
  }

  @override
  void dispose() {
    super.dispose();
    provider.dispose();
  }

  //
  //   construir  interfaz de Documento
  //
  @override
  Widget build(BuildContext context) {
    // contextoAplicacion=ContextoAplicacion.obtener(ModalRoute.of(context).settings.arguments);

    idioma = IdiomaAplicacion.obtener(context, idioma);
    widget.titulo = idioma.obtenerElemento(widget.pagina, "titulo");
    ui.iniciar(context, scaffoldKey, idioma, widget);

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
              // IconButton(
              //   icon: Icon(Icons.search),
              //   onPressed: () {
              //     Buscador buscador = Buscador();
              //     buscador.acccionConstruir = filtrarElementos;
              //     showSearch(
              //       context: context,
              //       delegate: buscador,
              //     );
              //   },
              // ),
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Accion.regresar(context);
                },
              ),
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
  //  interface de Documento   comun de la vista
  //

  //
  // mostrar Contenido
  //

  Widget mostrarContenido() {
    return Consumer<FlujoTrabajoDocumentoControlador>(
        builder: (context, _provider, widgetPadre) {
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
  // Widget filtrarElementos(String query) {
  //   List<FlujoTrabajoDocumento> lista = listaEntidad;
  //   if (query != "")
  //     lista = lista
  //         .where((s) => s.nombre.toLowerCase().contains(query.toLowerCase()))
  //         .toList();
  //   return Vista_lista(
  //       lista: lista,
  //       acciones: accionFiltrar,
  //       metodoCrearElemento: ui.crearElementoEntidad,
  //       context: context,
  //       pagina: widget.pagina);
  // }

  void actualizarEstadoListaDocumentos(List<dynamic> listaRespuesta) {
    setState(() {
      // listaEntidad = listaRespuesta;
      provider.lista = listaRespuesta;
    });
  }
}

//
// Termina widget
//
