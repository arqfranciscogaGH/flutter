//  librerias internas de flutter
import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';


//  librerias importadas flutter

import 'package:provider/provider.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

//  librerias  proyecto

import '../../../configuracion/configuracionAplicacion.dart';
import '../../../../nucleo/ui/ui.dart';
import '../../../contexto/contexto.dart';

import 'MisPendientesUI.dart';
import 'AvanzarTarea_captura.dart';

class pagina_AvanzarTarea extends StatefulWidget {
  pagina_AvanzarTarea(
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
  String accionPagina = "";
  bool activarAcciones = false;
  static String ruta = "pagina_AvanzarTarea";

  @override
  _pagina_AvanzarTarea_state createState() =>
      _pagina_AvanzarTarea_state();
}

class _pagina_AvanzarTarea_state
    extends State<pagina_AvanzarTarea> {
  //  declaración de variables

  IdiomaAplicacion idioma;
  dynamic entidadCaptura;
  List<dynamic> listaEntidad;

  // KEYS

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  // captura

  GlobalKey<FormState> keyFormulario;

  //  Acciones

  ElementoLista accionGuardar;

  //  provider
  MisPendientesControlador provider;

  //  Interfaz  comun
  MisPendientesUI ui;

  //  controladores

  //  otros

  //  inicializar  variables
  @override
  void initState() {
    super.initState();
    widget.pagina = pagina_AvanzarTarea.ruta;
    
    provider = MisPendientesControlador();
    ui = MisPendientesUI(provider: provider);
    accionGuardar = ElementoLista(
        id: 4,
        icono: "save",
        ruta: widget.paginaSiguiente,
         accion: ui.guardarEntidad,
        // callBackAccion: ui.respuestaInsertar,
        callBackAccion2: ui.respuestaModificar,
        callBackAccion3: ui.respuestaGuardar,
        argumento: widget.pagina);
    keyFormulario = GlobalKey<FormState>();
    ContextoUI.guadarKey(widget.pagina, keyFormulario);
    //  iniciar y consultar lista para obtener elemento y obtener el elemento que insertará
    entidadCaptura = provider.entidad;
    listaEntidad = provider.lista;
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
            actions: <Widget>[],
          ),
          body: AvanzarTarea_captura(
              titulo: widget.titulo,
              pagina: widget.pagina,
              keyFormulario: keyFormulario,
              paginaSiguiente: widget.paginaSiguiente,
              paginaAnterior: widget.paginaAnterior,
              activarAcciones: !(widget.activarAcciones ?? true),
              acccionPagina: widget.accionPagina),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: ui.crearBotonesAcciones(
              context, widget.activarAcciones ?? true, accionGuardar),
        ));
  }

  //
  //   control  de estado y validaciones
  //

}
