//  librerias internas de flutter

import 'package:flutter/material.dart';

//  librerias importadas flutter

import 'package:provider/provider.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

//  librerias  proyecto

import '../../../configuracion/configuracionAplicacion.dart';
import '../../../../nucleo/ui/ui.dart';
import '../../../contexto/contexto.dart';

import 'UsuarioUI.dart';

class pagina_Usuario_lista extends StatefulWidget {
  pagina_Usuario_lista(
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
  static String ruta = "pagina_Usuario_lista";

  @override
  _pagina_Usuario_lista createState() => _pagina_Usuario_lista();
}

class _pagina_Usuario_lista extends State<pagina_Usuario_lista> {
  //  declaración de variables

  IdiomaAplicacion idioma;

  // KEYS

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  //  Acciones
  ElementoLista accionAgregar;
  ElementoLista accionConsultar;
  ElementoLista accionFiltrar;

  //  provider
  CuentaUsuarioControlador provider;

  //  Interfaz  comun
  UsuarioUI ui;

  //  controladores

  //  otros

  //  inicializar  variables
  @override
  void initState() {
    super.initState();
    widget.pagina = pagina_Usuario_lista.ruta;
    provider = CuentaUsuarioControlador();
    ui = UsuarioUI(provider: provider);
    // cuando es captura  parcial ,la ruta debe ser null    para qe  ejecute  la pagina siguiente
    accionAgregar = ElementoLista(
        id: 1,
        icono: "add_circle",
        ruta: widget.paginaSiguiente,
        accion: ui.agregarElemento,
        callBackAccion: ui.respuestaAgregar);
    accionConsultar = ElementoLista(
        id: 2,
        icono: "edit",
        ruta: widget.paginaSiguiente,
        operacion: eOperacion.Consultar,
        accion: ui.seleccionarElemento,
        callBackAccion: ui.respuestaSeleccionar,
        accion2: ui.eliminarElemento,
        callBackAccion2: ui.respuestaEliminar);
    accionFiltrar = ElementoLista(
        id: 3,
        icono: "list",
        ruta: widget.paginaSiguiente,
        operacion: eOperacion.Filtrar,
        accion: ui.seleccionarElemento,
        callBackAccion: ui.respuestaSeleccionar);

    // provider.addListener(() {
    //      print("  actualizo, numero ${provider.entidad.id} ");
    // }) ;

    provider.limpiar();
    provider.asignarParametros(null, "prueba");
    provider.consultarEntidad(CuentaUsuario().iniciar(), null);
  }

  @override
  void dispose() {
    super.dispose();
    provider.dispose();
  }

  //
  //   construir  interfaz de usuario
  //
  @override
  Widget build(BuildContext context) {
    // contextoAplicacion=ContextoAplicacion.obtener(ModalRoute.of(context).settings.arguments);

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
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  Buscador buscador = Buscador();
                  buscador.acccionConstruir = filtrarElementos;
                  showSearch(
                    context: context,
                    delegate: buscador,
                  );
                },
              ),
               IconButton(
                    icon: Icon( Icons.arrow_back  ),  onPressed: ()
                    {
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
  //  interface de usuario   comun de la vista
  //

  //
  // mostrar Contenido
  //

  Widget mostrarContenido() {
    return Consumer<CuentaUsuarioControlador>(
        builder: (context, _provider, widgetPadre) {
      return Vista_lista(
          lista:
              provider.obtenerListaPorSuscripcion(ui.obtenerIdSuscriptor()),
          acciones: accionConsultar,
          metodoCrearElemento: ui.crearElementoEntidad,
          context: context,
          pagina: widget.pagina);
    });
  }

  //
  //  filtar  informacion
  //
  Widget filtrarElementos(String query) {
    List<CuentaUsuario> lista = provider.obtenerListaPorSuscripcion(ui.obtenerIdSuscriptor());
    if (query != "")
      lista = lista
          .where((s) => s.nombre.toLowerCase().contains(query.toLowerCase()))
          .toList();
    return Vista_lista(
        lista: lista,
        acciones: accionFiltrar,
        metodoCrearElemento: ui.crearElementoEntidad,
        context: context,
        pagina: widget.pagina);
  }
}
//
// Termina widget
//
