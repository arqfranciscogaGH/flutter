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

//  controladores  de interfaz de usuario  y negocio

import 'ConsultaTramiteUI.dart';

class ConsultaTramite_captura extends StatefulWidget {
  ConsultaTramite_captura(
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
  _ConsultaTramite_captura_state createState() => new _ConsultaTramite_captura_state();
}

class _ConsultaTramite_captura_state extends State<ConsultaTramite_captura> {
  //  declaración de variables

  IdiomaAplicacion idioma;
  ConsultaTramite entidadCaptura;
  List<ConsultaTramite> listaEntidad;

  // captura

  GlobalKey<FormState> keyFormulario;
  
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  //  Acciones
  ElementoLista accionGuardar;

  //  provider
  ConsultaTramiteControlador provider;

  //  Interfaz  comun
  ConsultaTramiteUI ui;

  //  controladores

  TextEditingController _controllerListaPerfiles = new TextEditingController();
  TextEditingController _controllerListaGrupos = new TextEditingController();

  //  otros
  //  inicializar  variables
  @override
  void initState() {
    super.initState();
    
    print (ContextoUI.obtenerKey("seguimiento").entidad.identificador);
    provider = ConsultaTramiteControlador();
    ui = ConsultaTramiteUI(provider: provider);

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
    provider = Provider.of<ConsultaTramiteControlador>(context);
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
  //   creación de interfaz de ConsultaTramite
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
    //  controladores
    controles
        .add(Control(idControl: "lblnombre", valor: entidadCaptura.nombre));
    controles
        .add(Control(idControl: "lblfechaNacimiento", valor: entidadCaptura.fechaNacimiento));
    controles
        .add(Control(idControl: "lblidentificador", valor: entidadCaptura.identificador));
    // // controles
    // //     .add(Control(idControl: "lblgenero", valor: entidadCaptura.genero));
    controles
        .add(Control(idControl: "lblrfc", valor: entidadCaptura.rfc));
    controles
        .add(Control(idControl: "lblcurp", valor: entidadCaptura.curp));
    controles
        .add(Control(idControl: "lblimporte", valor: entidadCaptura.importe.toString()));

      controles
        .add(Control(idControl: "lbltelefonoMovil", valor: entidadCaptura.telefonoMovil));
    controles
        .add(Control(idControl: "lblcorreo", valor: entidadCaptura.correo));   
    controles
        .add(Control(idControl: "lblsocio", valor: entidadCaptura.socio));   
    controles
        .add(Control(idControl: "lblgrupo", valor: entidadCaptura.grupo));

    // controles.add(Control(
    //     idControl: "apaestatus",
    //     valor: entidadCaptura.estatus == 1 ? true : false));

    List<Widget> widgets = cargarControlesCaptura(context, controles, idioma,
        pagina, metodoActualizarValor, metodoValidar);
    return widgets;
  }

  //
  //   control  de estado y validaciones en widget
  //

  dynamic validar(Control control, dynamic valor) {
    if (control.idControl == "txtcuenta") {
      if (valor != null && valor.length < 3) {
        return 'Ingrese el cuenta del Usuario';
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
    // switch (control.idControl) {
    //   case "txtcuenta":
    //     entidadCaptura.cuenta = valor;
    //     break;

    // }

    print(control.idControl + "  , valor  : $valor");
    imprimir(entidadCaptura);
    return entidadCaptura;
  }
}

// Termina   widget de captura de información
