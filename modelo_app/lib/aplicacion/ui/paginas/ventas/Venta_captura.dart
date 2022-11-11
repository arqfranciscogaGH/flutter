//  librerias internas de flutter

import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui';

//  librerias importadas flutter

import 'package:provider/provider.dart';
// import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

//  librerias  proyecto

import '../../../../inicializacion/inicializacion.dart';
import '../../../../configuracion/configuracion.dart';
import '../../../../administracion/administracion.dart';

import '../../../../nucleo/nucleo.dart';
import '../../../../aplicacion/aplicacion.dart';
import '../../../contexto/contexto.dart';
import '../../../negocio/negocio.dart';

import 'VentaUI.dart';

//  librerias externas  flutter

import '../../../../paquetesExternos/paquetesExternos.dart';

class Venta_captura extends StatefulWidget {
  Venta_captura(
      {Key? key,
      this.titulo,
      this.pagina,
      this.paginaSiguiente,
      this.paginaAnterior,
      this.accionPagina,
      this.activarAcciones})
      : super(key: key);

  String? titulo;
  String? pagina = "";
  String? paginaSiguiente = "";
  String? paginaAnterior = "";
  String? accionPagina = ""; // avanzar, regresar
  bool? activarAcciones = false;
  static String ruta = "Venta_captura";

  @override
  _Venta_captura_state createState() => _Venta_captura_state();
}

class _Venta_captura_state extends State<Venta_captura> {
  //  propiedades  widget

  //    control de estado  con provider

  ControlEstadoUI? controlEstadoUI;

  //  Interfaz  comun
  VentaUI ui = VentaUI();

  // entidad
  Venta entidadCaptura = Venta();

  // KEYS

  //  KEY Scaffold
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  //  KEY captura

  final keyFormulario = GlobalKey<FormState>();

  //  controladores

  TextEditingController _controllerListaColor = new TextEditingController();
  TextEditingController _controllerColorSecundario = TextEditingController();
  TextEditingController _controller_txtHoraCU = TextEditingController();
  TextEditingController _controller_txtfechaCU = TextEditingController();
  TextEditingController _controller_txtfechaCalendario =
      TextEditingController();
  TextEditingController _controller_txtfechaSelector = TextEditingController();

  //  otros

  //  inicializar  widget
  @override
  void initState() {
    super.initState();
    widget.pagina = Venta_captura.ruta;
    controlEstadoUI = ControlEstadoUI();
    entidadCaptura = ContextoAplicacion.db.tablaVenta!.entidad.iniciar();
    print("initState");
    print(ContextoAplicacion.db.tablaVenta!.entidad.id);
    print(entidadCaptura.id);
    ui = VentaUI(
        tabla: ContextoAplicacion.db.tablaVenta!,
        controlEstadoUI: controlEstadoUI);
    ContextoUI.guadarKey(widget.pagina!, keyFormulario);
  }

  //  dispose widget
  @override
  void dispose() {
    super.dispose();
    controlEstadoUI!.dispose();
  }

  //
  //   construir  interfaz widget
  //
  @override
  Widget build(BuildContext context) {
    widget.titulo = Traductor.obtenerEtiquetaSeccion(widget.pagina!, 'titulo');

    print("build");
    print(ContextoAplicacion.db.tablaVenta!.entidad.id);
    print(entidadCaptura.id);
    print(widget.titulo);

    // provider = Provider.of<ControlEstadoUI>(context, listen: false);

    return Scaffold(
      key: scaffoldKey,
      appBar: NewGradientAppBar(
          title: Text(widget.titulo!),
          gradient: LinearGradient(colors: [
            //Theme.of(context).primaryColor,
            Colores.obtener(ParametrosSistema.colorTema),
            Colores.obtener(ParametrosSistema.colorSecundario)
          ])),
      drawer: Menulateral.crearMenu(
          context, OpcionesMenus.obtenerMenuPrincipal(), widget.titulo!),
      body: mostrarCaptura(context, keyFormulario, cambiarValor, validar,
          definicionControles, entidadCaptura),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Boton.crearBotonFlotante(
        context,
        ElementoLista(
            icono: "save",
            accion: guardar,
            callBackAccion: ui.respuestaGuardar),
      ),
    );
  }

  //    metodos

  //  mostrar  captura
  Widget mostrarCaptura(
      BuildContext context,
      GlobalKey<FormState> keyFormulario,
      Function cambiarValor,
      Function validar,
      Function metodoDefinicionControles,
      dynamic entidadCaptura) {
    return /* SingleChildScrollView(
                    child:  */
        Container(
      padding: EdgeInsets.all(15.0),
      child: Captura.mostrarFormulario(context, keyFormulario, cambiarValor,
          validar, metodoDefinicionControles, entidadCaptura),
      //)
    );
  }

  //  definir  controles
  List<Widget> definicionControles(
      BuildContext context,
      GlobalKey<FormState> keyFormulario,
      Function cambiarValor,
      Function validar,
      dynamic entidadCaptura) {
    List<Control> controles = [];

    List<ElementoLista> _lista = [];
    _lista.add(ElementoLista(valor: "si", titulo: "si"));
    _lista.add(ElementoLista(valor: "no", titulo: "no"));

    print(ParametrosSistema.colorTema);
    Control lisVariables = new Control(
      idControl: "lisVariables",
    );
    lisVariables =
        lisVariables.asignar('', widget.pagina!, "si", cambiarValor, validar);
    lisVariables.controlEdicion = _controllerListaColor;
    lisVariables.lista = _lista;
    controles.add(lisVariables);

    Control txtHoraCU = Control().crear('', widget.pagina!, "txtHoraCU",
        entidadCaptura.clave, cambiarValor, validar);
    txtHoraCU.controlEdicion = _controller_txtHoraCU;
    controles.add(txtHoraCU);

    Control txtfechaCU = Control().crear('', widget.pagina!, "txtfechaCU",
        entidadCaptura.llave, cambiarValor, validar);
    txtfechaCU.controlEdicion = _controller_txtfechaCU;
    controles.add(txtfechaCU);

    Control txtfechaCalendario = Control().crear('', widget.pagina!,
        "txtfechaCalendario", entidadCaptura.llave, cambiarValor, validar);
    txtfechaCalendario.controlEdicion = _controller_txtfechaCalendario;
    controles.add(txtfechaCalendario);

    Control txtfechaSelector = Control().crear('', widget.pagina!,
        "txtfechaSelector", entidadCaptura.llave, cambiarValor, validar);
    txtfechaSelector.controlEdicion = _controller_txtfechaSelector;
    controles.add(txtfechaSelector);

    // controles.add(Control().crear('', widget.pagina!, "txtimporte",
    //     entidadCaptura.id, cambiarValor, validar));

    controles.add(Control().crear('', widget.pagina!, "txttelefono",
        entidadCaptura.clave, cambiarValor, validar));
    controles.add(Control().crear('', widget.pagina!, "txtcorreo",
        entidadCaptura.nombre, cambiarValor, validar));
    controles.add(Control().crear('', widget.pagina!, "txtruta",
        entidadCaptura.descripcion, cambiarValor, validar));

    return cargarControlesCaptura(
        context,
        controles,
        '',
        /* widget.pagina! */ "Modelo_pagina_captura",
        cambiarValor,
        validar, []);
  }

  //
  //   control  de estado y validaciones
  //

  dynamic validar(Control control, dynamic valor) {}
  dynamic cambiarValor(Control control, dynamic valor) {
    // setState(() {
    // entidadCaptura = ContextoAplicacion.db.tablaVenta!.entidad;
    print("cambiarValor");
    print(ContextoAplicacion.db.tablaVenta!.entidad.id);
    print(entidadCaptura.id);

    print(control.idControl);
    print(valor);

    switch (control.idControl) {
      case "lisVariables":
        break;
      case "txtcuenta":
        break;
      case "txtfechaNacimiento":
        break;
      case "txtimporte":
        break;
      case "txttelefono":
        break;
      case "txtcorreo":
        entidadCaptura.nombre = valor;
        break;
      case "txtruta":
        break;
    }

    // });

    return entidadCaptura;
  }

  // guardar  información
  void guardar(BuildContext context, ElementoLista elemento,
      [dynamic argumentos]) {
    if (!keyFormulario.currentState!.validate()) return;
    keyFormulario.currentState!.save();

    print("guardar");
    print(ContextoAplicacion.db.tablaVenta!.entidad.id);
    print(entidadCaptura.id);
    ContextoAplicacion.db.tablaVenta!
        .insertar(entidadCaptura)
        .then((respuesta) {
      print("insertar");
      entidadCaptura = respuesta;
      print(ContextoAplicacion.db.tablaVenta!.entidad);
      print(respuesta);
    });
    //  provider!.guardar()
    if (elemento.callBackAccion != null)
      elemento.callBackAccion!(context, elemento, entidadCaptura);
  }
}
