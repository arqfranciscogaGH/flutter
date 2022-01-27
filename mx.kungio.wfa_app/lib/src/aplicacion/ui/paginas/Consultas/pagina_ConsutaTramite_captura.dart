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
import 'ConsultaTramite_captura.dart';

class pagina_ConsultaTramite_captura extends StatefulWidget {
  pagina_ConsultaTramite_captura(
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
  static String ruta = "pagina_ConsultaTramite_captura";

  @override
  _pagina_ConsultaTramite_captura_state createState() =>
      _pagina_ConsultaTramite_captura_state();
}

class _pagina_ConsultaTramite_captura_state extends State<pagina_ConsultaTramite_captura> {
  //  declaración de variables

  IdiomaAplicacion idioma;
  ConsultaTramite entidadCaptura;
  List<ConsultaTramite> listaEntidad;
  // KEYS

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  // captura

  GlobalKey<FormState> keyFormulario;

  //  Acciones

  ElementoLista accionGuardar;

  //  provider
  ConsultaTramiteControlador provider;

  //  Interfaz  comun
  ConsultaTramiteUI ui;

  //  controladores

  //  otros

  //  inicializar  variables
  @override
  void initState() {
    super.initState();
    widget.pagina = pagina_ConsultaTramite_captura.ruta;

    print (ContextoUI.obtenerKey("seguimiento").entidad.identificador);
    provider = ConsultaTramiteControlador();

    ui = ConsultaTramiteUI(provider: provider);

    keyFormulario = GlobalKey<FormState>();
    ContextoUI.guadarKey(widget.pagina, keyFormulario);
    //  iniciar y consultar lista para obtener elemento y obtener el elemento que insertará
    entidadCaptura = provider.entidad;
    listaEntidad = provider.lista;
  }

  @override
  void dispose() {
    super.dispose();
    provider.dispose();
  }

  //
  //   construir  interfaz de ConsultaTramite
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
              // IconButton(
              //   icon: Icon(Icons.photo_size_select_actual),
              //   onPressed: () {
                
              //   },
              // ),

            ],
          ),
          body: ConsultaTramite_captura(
              pagina: widget.pagina,
              keyFormulario: keyFormulario,
              paginaSiguiente: widget.paginaSiguiente,
              paginaAnterior: widget.paginaAnterior,
              activarAcciones: !(widget.activarAcciones ?? true),
              accionPagina: widget.accionPagina),
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
