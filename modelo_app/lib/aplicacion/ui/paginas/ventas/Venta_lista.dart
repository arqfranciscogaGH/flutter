//  librerias internas de flutter

import 'package:flutter/material.dart';

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

class Venta_lista extends StatefulWidget {
  Venta_lista(
      {this.titulo,
      this.pagina,
      this.paginaSiguiente,
      this.paginaAnterior,
      this.accionPagina,
      this.activarAcciones});
  String? titulo;
  String? pagina;
  String? paginaSiguiente = "";
  String? paginaAnterior = "";
  String? accionPagina = ""; // avanzar, regresar
  bool? activarAcciones = false;
  static String ruta = "Venta_lista";

  @override
  _Venta_lista_state createState() => _Venta_lista_state();
}

class _Venta_lista_state extends State<Venta_lista> {
  //  propiedades  widget

  //    control de estado  con provider

  //ComunCE? provider;
  ControlEstadoUI? controlEstadoUI;
  //  Interfaz  comun
  VentaUI ui = VentaUI();

  // entidad

  Venta entidadCaptura = Venta();
  List<dynamic> listaEntidad = [];

  // KEYS

  //  KEY Scaffold
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  //  KEY captura

  final keyFormulario = GlobalKey<FormState>();

  //  Acciones
  ElementoLista? accionAgregar;
  ElementoLista? accionConsultar;
  ElementoLista? accionFiltrar;

  //  controladores

  //  otros

  //  inicializar  widget
  @override
  void initState() {
    super.initState();
    widget.pagina = Venta_lista.ruta;

    controlEstadoUI = ControlEstadoUI();
    ui = VentaUI(
        tabla: ContextoAplicacion.db.tablaVenta!,
        controlEstadoUI: controlEstadoUI);
    ui.controlEstado = controlEstadoUI!;

    // provider.limpiar();
    entidadCaptura = Venta().iniciar();

    // cuando es captura  parcial ,la ruta debe ser null    para qe  ejecute  la pagina siguiente

    //  accion para agregar un elemento a la lista
    accionAgregar = ElementoLista(
        id: 1,
        icono: "add_circle",
        // ruta: widget.paginaSiguiente,
        ruta: "Venta_captura",
        accion: ui.agregarElemento,
        callBackAccion: ui.respuestaAgregar);
    //  accion para consultar  y modificar y eliminar un elemento de la lista consultada
    accionConsultar = ElementoLista(
      id: 2,
      icono: "edit",
      ruta: widget.paginaSiguiente,
      operacion: eOperacion.consultar,
      accion: ui.seleccionarElemento,
      callBackAccion: ui.respuestaSeleccionar,
      accion2: ui.eliminarElemento,
      callBackAccion2: ui.respuestaEliminar,
      icono3: "documentos",
      ruta3: "Venta_Captura",
      accion3: ui.seleccionarElemento3,
      callBackAccion3: ui.respuestaSeleccionar3,
    );
    //  accion para filtrar y modificar y eliminar un elementos de la lista filtrada
    accionFiltrar = ElementoLista(
      id: 2,
      icono: "edit",
      ruta: widget.paginaSiguiente,
      operacion: eOperacion.filtrar,
      accion: ui.seleccionarElemento,
      callBackAccion: ui.respuestaSeleccionar,
      accion2: ui.seleccionarElemento,
      callBackAccion2: ui.respuestaSeleccionar,
      icono3: "documentos",
      ruta3: "Venta_Captura",
      accion3: ui.seleccionarElemento3,
      callBackAccion3: ui.respuestaSeleccionar3,
    );

    // print(ContextoAplicacion.db.tablaVenta!.lista.length);

    // provider!.ver(entidadCaptura);

    // ContextoAplicacion.db.tablaVenta!
    //     .consultarTabla(ContextoAplicacion.db.tablaVenta!.entidad)
    //     .then((respuesta) => {print(respuesta)});

    // ContextoAplicacion.db.tablaVenta!.consultarTabla(
    //     ContextoAplicacion.db.tablaVenta!.entidad, actualizarEstadoLista);

    // ContextoAplicacion.db.tablaVenta!
    //     .consultarTabla(ContextoAplicacion.db.tablaVenta!.entidad)
    //     .then((respuesta) {
    //   print(respuesta);
    // });
    ui.consultarTabla(context, ContextoAplicacion.db.tablaVenta!.entidad);

    //controlEstadoUI!.consultarTabla( ContextoAplicacion.db.tablaVenta!);
    //controlEstadoUI!.consultarTabla( ContextoAplicacion.db.tablaVenta!, actualizarEstadoLista);
    // provider.addListener(() {
    //      print("  actualizo, numero ${provider.entidad.id} ");
    // }) ;
  }

  //  dispose widget
  @override
  void dispose() {
    super.dispose();
    controlEstadoUI!.dispose();
    //ui.dispose();
    //provider!.dispose();
  }

  //
  //   construir  interfaz widget
  //
  @override
  Widget build(BuildContext context) {
    // contextoAplicacion=ContextoAplicacion.obtener(ModalRoute.of(context).settings.arguments);
    widget.titulo =
        Traductor.obtenerEtiquetaSeccion(widget.pagina!, 'titulo') ?? 'Tema';
    ui.iniciar(context, scaffoldKey, widget);
    print("build lista");
    print(ContextoAplicacion.db.tablaVenta!.entidad.id);
    print(entidadCaptura.id);
    return ChangeNotifierProvider.value(
      value: controlEstadoUI,
      child: Scaffold(
        key: scaffoldKey,
        appBar: NewGradientAppBar(
          title: Text(widget.titulo!),
          gradient: LinearGradient(colors: [
            //Theme.of(context).primaryColor,
            Colores.obtener(ParametrosSistema.colorTema),
            Colores.obtener(ParametrosSistema.colorSecundario)
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
            //  IconButton(
            //       icon: Icon( Icons.arrow_back  ),  onPressed: ()
            //       {
            //               Accion.regresar(context);
            //       },
            // ),
          ],
        ),
        drawer: Menulateral.crearMenu(
            context, OpcionesMenus.obtenerMenuPrincipal(), widget.titulo!),
        body: mostrarContenido(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Boton.crearBotonFlotante(context, accionAgregar!),
      ),
    );
  }
  //    metodos
  //

  void actualizarEstadoLista(List<dynamic> listaRespuesta) {
    print(listaRespuesta);
    listaEntidad = listaRespuesta;
  }

  //  interface  comun
  //
  //
  // mostrar Contenido
  //

  Widget mostrarContenido() {
    print("mostrarContenido");
    print(ContextoAplicacion.db.tablaVenta!.entidad.id);
    print(entidadCaptura.id);
    return Consumer<ControlEstadoUI>(
        builder: (context, _provider, widgetPadre) {
      return Vista_lista(
          //lista: provider!.lista,
          //lista: listaEntidad,
          lista: ContextoAplicacion.db.tablaVenta!.lista,
          acciones: accionConsultar,
          metodoCrearElemento: ui.crearElementoEntidad,
          context: context,
          pagina: widget.pagina!);
    });
  }

  //
  //  filtar  informacion
  //
  Widget filtrarElementos(String query) {
    //List<dynamic> lista = provider!.lista!;
    //List<dynamic> lista = listaEntidad;
    List<dynamic> lista =
        controlEstadoUI!.lista(ContextoAplicacion.db.tablaVenta!);
    if (lista != null && query != "")
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
