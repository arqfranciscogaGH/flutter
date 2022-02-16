//  librerias internas de flutter

import 'package:flutter/material.dart';

//  librerias importadas flutter

import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

//  librerias  proyecto

import '../../../configuracion/configuracionAplicacion.dart';
import '../../../../nucleo/ui/ui.dart';
import '../../../contexto/contexto.dart';

//  controladores  de interfaz de usuario  y negocio
import 'SuscripcionUI.dart';

class Suscripcion_captura extends StatefulWidget {
  Suscripcion_captura(
      {Key key,
      this.titulo,
      this.pagina,
      this.paginaSiguiente,
      this.paginaAnterior,
      this.acccionPagina,
      this.activarAcciones,
      this.keyFormulario})
      : super(key: key);
  String titulo;
  String pagina;
  String paginaSiguiente = "";
  String paginaAnterior = "";
  String acccionPagina = "";
  bool activarAcciones = false;
  GlobalKey<FormState> keyFormulario;

  @override
  _Suscripcion_captura_state createState() => new _Suscripcion_captura_state();
}

class _Suscripcion_captura_state extends State<Suscripcion_captura> {
  //  declaración de variables

  IdiomaAplicacion idioma;
  Suscripcion entidadCaptura;
  List<Suscripcion> listaEntidad;

  // captura

  GlobalKey<FormState> keyFormulario;

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  //  Acciones
  ElementoLista accionGuardar;

  //  provider
  SuscripcionControlador provider;

  //  Interfaz  comun
  SuscripcionUI ui;

  //  controladores

  TextEditingController _controllerLista =
      new TextEditingController();
  TextEditingController _controllerFechaInicial = new TextEditingController();
  TextEditingController _controllerFechaFinal = new TextEditingController();
  TextEditingController _controllerCosto = new TextEditingController();

  //  otros
  //  inicializar  variables
  @override
  void initState() {
    super.initState();
    provider = SuscripcionControlador();
    ui = SuscripcionUI(provider: provider);
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

    // Provider.of<SuscripcionControlador>(context, listen: false).actualizarControles=true;
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
    provider = Provider.of<SuscripcionControlador>(context);
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
    keyFormulario = GlobalKey<FormState>();
    ContextoUI.guadarKey(widget.pagina, keyFormulario);

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
  //   creación de interfaz de usuario
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
        .add(Control(idControl: "txtnombre", valor: entidadCaptura.nombre));

    List<ElementoLista> _listaTipo = List<ElementoLista>();

    /*    _listaTIpoMenbresia
        .add(ElementoLista(valor: "G", titulo: "Gratuita", subitulo: "0"));
    _listaTIpoMenbresia
        .add(ElementoLista(valor: "M", titulo: "Mensual", subitulo: "50"));
    _listaTIpoMenbresia
        .add(ElementoLista(valor: "T", titulo: "Trimestral", subitulo: "100"));
    _listaTIpoMenbresia
        .add(ElementoLista(valor: "A", titulo: "Anual", subitulo: "200"));
    //  Gratuita, Mensual, Trimestral, Anual
    Control listaTipoMembresia = new Control(
      idControl: "txttipo",
    );
 */
    // if (entidadCaptura.tipo=='')
    //     entidadCaptura.tipo="B";
    // _listaTipo
    //     .add(ElementoLista(valor: "B", titulo: "Bronze", subitulo: "100"));
    // _listaTipo
    //     .add(ElementoLista(valor: "S", titulo: "Silver", subitulo: "200"));
    // _listaTipo
    //     .add(ElementoLista(valor: "G", titulo: "Gold", subitulo: "300"));
    // _listaTipo
    //     .add(ElementoLista(valor: "GoldX", titulo: "GoldX", subitulo: "300"));
    // _listaTipo
    //     .add(ElementoLista(valor: "P", titulo: "pureGold", subitulo: "300"));
    // _listaTipo
    //     .add(ElementoLista(valor: "Zafiro", titulo: "Zafiro", subitulo: "300"));  
    // _listaTipo
    //     .add(ElementoLista(valor: "Kungio", titulo: "Grand Loyalty", subitulo: "300"));  

    // //  Gratuita, Mensual, Trimestral, Anual
    // Control controlListaTipo = new Control(
    //   idControl: "txttipo",
    // );
    // controlListaTipo = controlListaTipo.asignar(
    //     idioma, pagina, entidadCaptura.tipo, cambiarValor, validar);
    // controlListaTipo.controlEdicion = _controllerLista;
    // controlListaTipo.lista = _listaTipo;
    // controles.add(controlListaTipo);


    controles.add(Control(
        idControl: "apaestatus",
        valor: entidadCaptura.estatus == 1 ? true : false));
    // controles.add(Control(
    //     idControl: "txtfechaInicio",
    //     valor: entidadCaptura.fechaInicio,
    //     controlEdicion: _controllerFechaInicial));

    // controles.add(Control(
    //     idControl: "txtusuarios", valor: entidadCaptura.usuarios.toString()));
    // controles.add(Control(
    //   idControl: "txtequipos",
    //   valor: entidadCaptura.equipos.toString(),
    // ));
    // controles.add(Control(
    //   idControl: "txtnegocios",
    //   valor: entidadCaptura.negocios.toString(),
    // ));
    //   
    // controles.add(Control(
    //     idControl: "txtcosto",
    //     valor: entidadCaptura.costo.toString(),
    //     controlEdicion: _controllerCosto));
  
    // controles.add(Control(
    //     idControl: "txtfechaVencimiento",
    //     valor: entidadCaptura.fechaVencimiento,
    //     controlEdicion: _controllerFechaFinal));
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
        return 'Ingrese el nombre del Suscripcion';
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
      case "txttipo":
        entidadCaptura.tipo = valor;
        break;

      // case "txtusuarios":
      //   entidadCaptura.usuarios = int.parse(valor);
      //   break;
      // case "txtequipos":
      //   entidadCaptura.equipos = int.parse(valor);
      //   break;
      // case "txtnegocios":
      //   entidadCaptura.negocios = int.parse(valor);
      //   break;

      case "apaestatus":
        entidadCaptura.estatus = valor == true ? 1 : 0;
        break;
    }
    entidadCaptura.fechaEstatus =
        DateFormat('MM-dd-yyyy').format(DateTime.now());
    entidadCaptura.fechaInicio =
        DateFormat('MM/dd/yyyy').format(DateTime.now());

    // DateTime result = DateTime.parse('04-18-2019 06:05');
    // DateTime dateTime = DateTime.parse(cadenafecha);

    //  Gratuita, Mensual, Trimestral, Anual
    if (entidadCaptura.tipo.toString().contains('G')) {
      entidadCaptura.costo = 0;
      entidadCaptura.fechaVencimiento = DateFormat('MM-dd-yyyy')
          .format(DateTime.now().add(new Duration(days: 365)));
    } else if (entidadCaptura.tipo.toString().contains('M')) {
      entidadCaptura.costo = 50;
      entidadCaptura.fechaVencimiento = DateFormat('MM-dd-yyyy')
          .format(DateTime.now().add(new Duration(days: 30)));
    } else if (entidadCaptura.tipo.toString().contains('T')) {
      entidadCaptura.costo = 100;
      entidadCaptura.fechaVencimiento = DateFormat('MM-dd-yyyy')
          .format(DateTime.now().add(new Duration(days: 90)));
    } else if (entidadCaptura.tipo.toString().contains('A')) {
      entidadCaptura.costo = 200;
      entidadCaptura.fechaVencimiento = DateFormat('MM-dd-yyyy')
          .format(DateTime.now().add(new Duration(days: 365)));
    }

    print(control.idControl + "  , valor  : $valor");
    imprimir(entidadCaptura);
    return entidadCaptura;
  }
}

// Termina   widget de captura de información
