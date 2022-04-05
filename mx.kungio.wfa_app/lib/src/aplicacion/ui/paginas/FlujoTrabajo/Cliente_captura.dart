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

//  controladores  de interfaz de Cliente  y negocio

import 'ClienteUI.dart';

class Cliente_captura extends StatefulWidget {
  Cliente_captura(
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
  _Cliente_captura_state createState() => new _Cliente_captura_state();
}

class _Cliente_captura_state extends State<Cliente_captura> {
  //  declaración de variables

  IdiomaAplicacion idioma;
  Cliente entidadCaptura;
  List<Cliente> listaEntidad;

  // captura

  GlobalKey<FormState> keyFormulario;
  
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  //  Acciones
  ElementoLista accionGuardar;

  //  provider
 ClienteControlador provider;

  //  Interfaz  comun
  ClienteUI ui;

  //  controladores

  TextEditingController _controllerLista = new TextEditingController();
  TextEditingController _controllerFecha = new TextEditingController();

  //  otros
  //  inicializar  variables
  @override
  void initState() {
    super.initState();
    provider = ClienteControlador();
    ui = ClienteUI(provider: provider);
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
    provider = Provider.of<ClienteControlador>(context);
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
  //   creación de interfaz de Cliente
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
    controles
        .add(Control(idControl: "txtrfc", valor: entidadCaptura.rfc));
    controles.add(
        Control(idControl: "txtcurp", valor: entidadCaptura.curp));
    controles.add(
        Control(idControl: "txtimss", valor: entidadCaptura.referencia));
    controles.add(
        Control(idControl: "txtfechaNacimiento", valor: entidadCaptura.fechaNacimiento , controlEdicion: _controllerFecha));
    controles.add(
        Control(idControl: "txtsaldo", valor: entidadCaptura.saldo.toString()));
    controles.add(
       Control(idControl: "txtimporte", valor: entidadCaptura.importe.toString()));
      controles.add(
        Control(idControl: "txttelefono", valor: entidadCaptura.telefono));  
    controles.add(
        Control(idControl: "txttelefonoMovil", valor: entidadCaptura.telefonoMovil));
    controles.add(
        Control(idControl: "txtcorreo", valor: entidadCaptura.correo));
    // controles
    //     .add(Control(idControl: "txtnombre", valor: entidadCaptura.nombre));

/*     List<ElementoLista> _lista = List<ElementoLista>();
    _lista.add(ElementoLista(valor: "F", titulo: "Femenino"));
    _lista.add(ElementoLista(valor: "M", titulo: "Masculino"));

    Control controlLista = new Control(
      idControl: "txtgenero",
    ); */
/*     entidadCaptura.genero = "F";
    controlLista = controlLista.asignar(
        idioma, pagina, entidadCaptura.genero, cambiarValor, validar);
    controlLista.controlEdicion = _controllerLista;
    controlLista.lista = _lista;
    controles.add(controlLista);
 */
/*     controles.add(Control(
        idControl: "txtfechaNacimiento",
        valor: entidadCaptura.fechaNacimiento,
        controlEdicion: _controllerFecha));
    controles
        .add(Control(idControl: "txttelefono", valor: entidadCaptura.telefono));
    controles
        .add(Control(idControl: "txtcorreo", valor: entidadCaptura.correo));
    controles
        .add(Control(idControl: "txtruta", valor: entidadCaptura.rutaFoto)); */
    controles.add(Control(
        idControl: "apaestatus",
        valor: entidadCaptura.estatus == 1 ? true : false));

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
        return 'Ingrese el cuenta del Cliente';
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
      case "txtrfc":
        entidadCaptura.rfc = valor;
        break;
      case "txtcurp":
        entidadCaptura.curp = valor;
        break;      
      case "txtimss":
        entidadCaptura.referencia = valor;
        break; 
      case "txtfechaNacimiento":
        entidadCaptura.fechaNacimiento = valor;
        break;     
      case "txtsaldo":
        entidadCaptura.saldo = int.parse(valor);
        break;  
       case "txtimporte":
        entidadCaptura.importe = int.parse(valor);
        break;  
      case "txttelefono":
        entidadCaptura.telefono = valor;
        break;         
      case "txttelefonoMovil":
        entidadCaptura.telefonoMovil = valor;
        break;       
      case "txtcorreo":
        entidadCaptura.correo = valor;
        break;               
      case "apaestatus":
        entidadCaptura.estatus = valor == true ? 1 : 0;
        break;
    }
    entidadCaptura.fechaEstatus =DateFormat('MM-dd-yyyy').format(DateTime.now());
 

    print(control.idControl + "  , valor  : $valor");
    imprimir(entidadCaptura);
    return entidadCaptura;
  }
}

// Termina   widget de captura de información
