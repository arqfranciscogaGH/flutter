//  librerias internas de flutter

import 'package:flutter/material.dart';

//  librerias importadas flutter

import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

//  librerias  proyecto

import '../../../configuracion/configuracionAplicacion.dart';
import '../../../../nucleo/ui/ui.dart';
import '../../../contexto/contexto.dart';

//  vistas de  proyecto

//  controladores  de interfaz de FlujoTrabajoDocumento  y negocio

import 'FlujoTrabajoDocumentoUI.dart';

class FlujoTrabajoDocumento_captura extends StatefulWidget {
  FlujoTrabajoDocumento_captura(
      {Key key,
      this.titulo,
      this.pagina,
      this.paginaSiguiente,
      this.paginaAnterior,
      this.accionPagina,
      this.activarAcciones,
      this.keyFormulario})
      : super(key: key);
  String titulo;     
  String pagina;
  String paginaSiguiente = "";
  String paginaAnterior = "";
  String accionPagina = "";
  bool activarAcciones = false;
  GlobalKey<FormState> keyFormulario;

  @override
  _FlujoTrabajoDocumento_captura_state createState() => new _FlujoTrabajoDocumento_captura_state();
}

class _FlujoTrabajoDocumento_captura_state extends State<FlujoTrabajoDocumento_captura> {
  //  declaración de variables

  IdiomaAplicacion idioma;
  FlujoTrabajoDocumento entidadCaptura;
  List<FlujoTrabajoDocumento> listaEntidad;

  // captura

  GlobalKey<FormState> keyFormulario;
  
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  //  Acciones
  ElementoLista accionGuardar;

  //  provider
  FlujoTrabajoDocumentoControlador provider;

  //  Interfaz  comun
  FlujoTrabajoDocumentoUI ui;

  //  controladores

  TextEditingController _controllerListaDocumentos = new TextEditingController();


  //  otros
  //  inicializar  variables
  @override
  void initState() {
    super.initState();
    provider = FlujoTrabajoDocumentoControlador();
    ui = FlujoTrabajoDocumentoUI(provider: provider);
    accionGuardar = ElementoLista(
        id: 4,
        icono: "save",
        ruta: widget.paginaSiguiente,
        accion: ui.guardarEntidad,
        callBackAccion: ui.respuestaInsertar,
        callBackAccion2: ui.respuestaModificar,
        callBackAccion3: ui.respuestaGuardar,
        argumento: widget.pagina);
    //  inicar  otras  variables
    if (widget.keyFormulario != null)
      keyFormulario = widget.keyFormulario;
    else
      keyFormulario = GlobalKey<FormState>();
    ContextoUI.guadarKey(widget.pagina, keyFormulario);

    //  inicar  otras  variables
  }

  @override
  void dispose() {
    super.dispose();
    // provider.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // contextoAplicacion=ContextoAplicacion.obtener(ModalRoute.of(context).settings.arguments);
    idioma = IdiomaAplicacion.obtener(context, idioma);
    ui.idioma = idioma;
    provider = Provider.of<FlujoTrabajoDocumentoControlador>(context);
    entidadCaptura = provider.entidad;

    //  asignacion nuevo  keyFormulario para realizar  nueva  captura parcial,
    //  se muestre  los  nuevos datos  y no se genero error duplicate key
    if (ContextoUI.iniciarCaptura == true ||
        provider.actualizarControles == true) {
      ContextoUI.iniciarCaptura = false;
      provider.actualizarControles = false;
      keyFormulario = GlobalKey<FormState>();
      ContextoUI.guadarKey(widget.pagina, keyFormulario);
    }
    ui.iniciar(context, scaffoldKey, idioma, widget);
    widget.titulo = idioma.obtenerElemento(widget.pagina, "titulo"); 
    return Scaffold(
      body: mostrarCaptura(context, keyFormulario, actualizarValor, validar,
          definicionControles, entidadCaptura),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ui.crearBotonesAcciones(
          context, widget.activarAcciones, accionGuardar),
    );
  }

  //
  //   creación de interfaz de FlujoTrabajoDocumento
  //

  Widget mostrarCaptura(
      BuildContext context,
      GlobalKey<FormState> keyFormulario,
      Function metodoActualizarValor,
      Function metodoValidar,
      Function metodoDefinicionControles,
      dynamic entidadCaptura) {
    return Container(
      child: Captura.mostrarFormulario(
          context,
          keyFormulario,
          metodoActualizarValor,
          metodoValidar,
          metodoDefinicionControles,
          entidadCaptura),
    );
  }

  //
  //   control  de estado y validaciones
  //

  void actualizarEstadoEntidad(BuildContext context, dynamic entidad) {
    // setState(() {
    // entidadCaptura=entidad;
    // actualizarEntidad(entidad);
    // });
  }
  void actualizarEstadoLista(List<dynamic> listaRespuesta) {
    // setState(() {
    // listaEntidad=listaRespuesta;
    // actualizarListaEntidad(listaEntidad);
    // });
  }

  //
  //   definición de controles
  //

  List<Widget> definicionControles(
      BuildContext context,
      GlobalKey<FormState> formKey,
      Function metodoActualizarValor,
      Function metodoValidar,
      dynamic entidadCaptura) {
    List<Control> controles = List<Control>();
    String pagina = widget.pagina;

    // List<ElementoLista> _listaDocumentos = List<ElementoLista>();

    //  _listaDocumentos
    //     .add(ElementoLista(valor: 1, titulo: "CURP", subitulo: "100"));
    // _listaDocumentos
    //     .add(ElementoLista(valor: 2, titulo: "Acta de nacimieno", subitulo: "200"));

    // Control controlListaDocumentos = new Control(
    //   idControl: "lisDocumento",
    // );
    // controlListaDocumentos = controlListaDocumentos.asignar(
    //     idioma, pagina, entidadCaptura.idDcocumento, cambiarValor, validar);
    // controlListaDocumentos.controlEdicion = _controllerListaDocumentos;
    // controlListaDocumentos.lista = _listaDocumentos;
    // controles.add(controlListaDocumentos);
    controles
        .add(Control(idControl: "lblDocumento", valor: entidadCaptura.nombre));

    List<Widget> widgets = cargarControlesCaptura(context, controles, idioma,
        pagina, metodoActualizarValor, metodoValidar);
    return widgets;
  }

  //
  //   control  de estado y validaciones en widget
  //

  dynamic validar(Control control, dynamic valor) {
    if (control.idControl == "txtnombre") {
      if (valor != null && valor.length < 3) {
        return 'Ingrese el documento';
      } else {
        return null;
      }
    }
  }

  void actualizarValor(Control control, dynamic valor) {
    entidadCaptura = cambiarValor(control, valor);
    setState(() {});
  }
  dynamic cambiarValor(Control control, dynamic valor) {
    switch (control.idControl) {
      case "txtnombre":
        entidadCaptura.nombre = valor;
        break;        
 
    }
    entidadCaptura.fechaEstatus =DateFormat('MM-dd-yyyy').format(DateTime.now());
    entidadCaptura.fechaEstatus ="";

    print(control.idControl + "  , valor  : $valor");
    imprimir(entidadCaptura);
    return entidadCaptura;
  }
}

// Termina   widget de captura de información
