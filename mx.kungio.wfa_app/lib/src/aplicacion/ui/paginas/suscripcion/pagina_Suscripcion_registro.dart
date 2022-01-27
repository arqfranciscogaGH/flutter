/* 
//  librerias internas de flutter
import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';

//  librerias importadas flutter

import 'package:provider/provider.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

//  librerias  proyecto

import '../../../configuracion/configuracionAplicacion.dart';
import '../../../../nucleo/ui/ui.dart';
import '../../../contexto/contexto.dart';

import 'SuscripcionUI.dart';
import 'Suscripcion_captura.dart';

import '../seguridad/UsuarioUI.dart';
import '../seguridad/Usuario_captura.dart';

import '../persona/PersonaUI.dart';
import '../persona/Persona_captura.dart';

class pagina_Suscripcion_registro extends StatefulWidget {
  pagina_Suscripcion_registro(
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
  GlobalKey<FormState> keyFormulario;

  @override
  _pagina_Suscripcion_registro_state createState() =>
      _pagina_Suscripcion_registro_state();
}

class _pagina_Suscripcion_registro_state
    extends State<pagina_Suscripcion_registro>
    with SingleTickerProviderStateMixin {
  //  declaración de variables

  IdiomaAplicacion idioma;
  Suscripcion entidadCaptura;
  List<Suscripcion> listaEntidad;

  // KEYS

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  // captura

  GlobalKey<FormState> keyFormulario;

  //  Acciones

  ElementoLista accionGuardar;

  //  provider
  SuscripcionControlador provider;

  //  Interfaz  comun
  SuscripcionUI ui;

  //  controladores

  // BottomNavigationBarItem
  int indexPagina;
  List<Widget> paginas;
  List<BottomNavigationBarItem> opciones;
  // tabs
  TabController contraladorTab;
  List<Widget> tabs;

  //  otros

  //  inicializar  variables
  @override
  void initState() {
    super.initState();
    SuscripcionControlador provider = SuscripcionControlador();
    provider.iniciarEntidad();
    widget.pagina = "pagina_Suscripcion_registro";
    indexPagina = 0;
    opciones = [
      new BottomNavigationBarItem(
          icon: new Center(child: new Text("Suscripcion")),
          title: new Text(" ")),
      new BottomNavigationBarItem(
          icon: new Center(child: new Text("Usuario")), title: new Text(" ")),
    ];
    paginas = [
      Suscripcion_captura(
          pagina: "pagina_Suscripcion_captura",
          keyFormulario: null,
          paginaSiguiente: widget.paginaSiguiente,
          paginaAnterior: widget.paginaAnterior,
          activarAcciones: true,
          acccionPagina: widget.accionPagina),
      Usuario_captura(
          pagina: "pagina_Usuario_captura",
          keyFormulario: null,
          paginaSiguiente: widget.paginaSiguiente,
          paginaAnterior: widget.paginaAnterior,
          activarAcciones: true,
          accionPagina: widget.accionPagina),
      Persona_captura(
          pagina: "pagina_InfoSocio_captura",
          keyFormulario: null,
          paginaSiguiente: widget.paginaSiguiente,
          paginaAnterior: widget.paginaAnterior,
          activarAcciones: true,
          accionPagina: widget.accionPagina),
    ];

    // tabs
    contraladorTab = TabController(length: 3, vsync: this);

    tabs = [
      Tab(
        text: "Suscripcion", /*  icon: Icon( Icons.looks_one) , */
      ),
      Tab(
        text: "Usuario", /* icon: Icon( Icons.looks_two) , */
      ),
      Tab(
        text: "Persona", /* icon: Icon( Icons.looks_two) , */
      ),
    ];
  }

  @override
  void dispose() {
    super.dispose();
  }

  //
  //   construir  interfaz de usuario
  //
  @override
  Widget build(BuildContext context) {
    //  contextoAplicacion=ContextoAplicacion.obtener(ModalRoute.of(context).settings.arguments);
    idioma = IdiomaAplicacion.obtener(context, idioma);
    //  ui.idioma=idioma;
    widget.titulo = idioma.obtenerElemento(widget.pagina, "titulo");
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SuscripcionControlador()),
          ChangeNotifierProvider(create: (_) => UsuarioControlador()),
          ChangeNotifierProvider(create: (_) => PersonaControlador()),
          // ChangeNotifierProvider.value(value:SuscripcionControlador()),
          // ChangeNotifierProvider.value(value:UsuarioControlador()),
        ],
        child: Scaffold(
          key: _scaffoldKey,
          appBar: GradientAppBar(
            title: Text(widget.titulo),
            gradient: LinearGradient(colors: [
              Theme.of(context).primaryColor,
              Colores.obtenerColor(Configuracion.colorSecundario)
            ]),
            bottom: Tabs.crearTitulos(contraladorTab, tabs),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.videocam),
                onPressed: () {/* ui.seleccionarVideo(context)  ;  */},
              ),
              IconButton(
                icon: Icon(Icons.photo_size_select_actual),
                onPressed: () {/* ui.seleccionarFoto(context)  ;  */},
              ),
              IconButton(
                icon: Icon(Icons.camera_alt),
                onPressed: () {/*  ui.tomarFoto(context); */},
              ),
            ],
          ),
          body: Tabs.crearVistas(contraladorTab, paginas),
        ));
  }

  Widget mostrarPagina(int indexPaginaSeleccionado) {
    setState(() {
      indexPagina = indexPaginaSeleccionado;
    });
    return paginas[indexPagina];
  }

  //
  //   control  de estado y validaciones
  //

  //
  //   repuesta guardar  informacion
  //
  void respuestaGuardar(BuildContext context, elemento, dynamic entidad) {
    print("respuestaGuardar");
    Configuracion.idSuscriptor = entidad.id;

    print(entidad.idSuscriptor.toString());
    mostrarPagina(1);
  }
}
 */