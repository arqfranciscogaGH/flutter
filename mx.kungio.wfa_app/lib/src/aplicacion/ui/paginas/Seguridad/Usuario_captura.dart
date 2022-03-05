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

import 'UsuarioUI.dart';

class Usuario_captura extends StatefulWidget {
  Usuario_captura(
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
  _Usuario_captura_state createState() => new _Usuario_captura_state();
}

class _Usuario_captura_state extends State<Usuario_captura> {
  //  declaración de variables

  IdiomaAplicacion idioma;
  CuentaUsuario entidadCaptura;
  List<CuentaUsuario> listaEntidad;

  // captura

  GlobalKey<FormState> keyFormulario;
  
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  //  Acciones
  ElementoLista accionGuardar;

  //  provider
  CuentaUsuarioControlador provider;

  //  Interfaz  comun
  UsuarioUI ui;

  //  controladores

  TextEditingController _controllerListaPerfiles = new TextEditingController();
  TextEditingController _controllerListaGrupos = new TextEditingController();

  //  otros
  //  inicializar  variables
  @override
  void initState() {
    super.initState();
    provider = CuentaUsuarioControlador();
    ui = UsuarioUI(provider: provider);
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
    provider = Provider.of<CuentaUsuarioControlador>(context);
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
        .add(Control(idControl: "txtcuenta", valor: entidadCaptura.cuenta));
    controles
        .add(Control(idControl: "txtnombre", valor: entidadCaptura.nombre));
    controles.add(
        Control(idControl: "txtcontrasena", valor: entidadCaptura.contrasena));



    List<ElementoLista> _listaPerfil = List<ElementoLista>();

    if (entidadCaptura.perfiles=='')
        entidadCaptura.perfiles="2";
     if (Sesion.perfiles!=null  && Sesion.perfiles=='1')     
      _listaPerfil
      .add(ElementoLista(valor: "1", titulo: "Adminsitrador", subitulo: "100"));


    _listaPerfil
        .add(ElementoLista(valor: "2", titulo: "Socio", subitulo: "100"));
    _listaPerfil
        .add(ElementoLista(valor: "3", titulo: "Arquitecto", subitulo: "200"));
    _listaPerfil
        .add(ElementoLista(valor: "4", titulo: "Impresor", subitulo: "300"));
    _listaPerfil
        .add(ElementoLista(valor: "5", titulo: "Fideicomiso", subitulo: "300"));
    _listaPerfil
        .add(ElementoLista(valor: "6", titulo: "Gestor", subitulo: "300"));
    _listaPerfil
        .add(ElementoLista(valor: "7", titulo: "Operador", subitulo: "300"));

    //  Gratuita, Mensual, Trimestral, Anual
    Control controlListaPerfiles = new Control(
      idControl: "lisPefil",
    );
    controlListaPerfiles = controlListaPerfiles.asignar(
        idioma, pagina, entidadCaptura.perfiles, cambiarValor, validar);
    controlListaPerfiles.controlEdicion = _controllerListaPerfiles;
    controlListaPerfiles.lista = _listaPerfil;
    controles.add(controlListaPerfiles);


    List<ElementoLista> _listaGrupos = List<ElementoLista>();
    if (entidadCaptura.grupos=='')
        entidadCaptura.grupos="2";
    _listaGrupos
        .add(ElementoLista(valor: "2", titulo: "giorgio", subitulo: "100"));
    _listaGrupos
        .add(ElementoLista(valor: "3", titulo: "D & B", subitulo: "200"));
    _listaGrupos
        .add(ElementoLista(valor: "4", titulo: "Cuauh", subitulo: "300"));
    _listaGrupos
        .add(ElementoLista(valor: "5", titulo: "Soccer", subitulo: "100"));
    _listaGrupos
        .add(ElementoLista(valor: "6", titulo: "Jc&Mar", subitulo: "200"));
    _listaGrupos
        .add(ElementoLista(valor: "7", titulo: "Redes", subitulo: "300"));
    _listaGrupos
        .add(ElementoLista(valor: "8", titulo: "L&R", subitulo: "300"));


    //  Gratuita, Mensual, Trimestral, Anual
    Control controlListaGrupos = new Control(
      idControl: "lisGrupo",
    );
    controlListaGrupos = controlListaGrupos.asignar(
        idioma, pagina, entidadCaptura.grupos, cambiarValor, validar);
    controlListaGrupos.controlEdicion = _controllerListaGrupos;
    controlListaGrupos.lista = _listaGrupos;
    controles.add(controlListaGrupos);


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
    switch (control.idControl) {
      case "txtcuenta":
        entidadCaptura.cuenta = valor;
        break;
      case "txtnombre":
        entidadCaptura.nombre = valor;
        break;        
      case "txtcontrasena":
        entidadCaptura.contrasena = valor;
        break;
       case "lisPefil":
        entidadCaptura.perfiles = valor;
        break;        
      case "lisGrupo":
        entidadCaptura.grupos = valor;
        break;       
      case "apaestatus":
        entidadCaptura.activo = valor == true ? 1 : 0;
        break;
    }
    entidadCaptura.fechaRegistro =
        DateFormat('MM-dd-yyyy').format(DateTime.now());
    entidadCaptura.fechaCambioEstatus = DateFormat('MM-dd-yyyy').format(DateTime.now());

    print(control.idControl + "  , valor  : $valor");
    imprimir(entidadCaptura);
    return entidadCaptura;
  }
}

// Termina   widget de captura de información
