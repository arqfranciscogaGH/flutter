//  librerias internas de flutter

import 'package:flutter/material.dart';

//  librerias importadas flutter

import 'package:provider/provider.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

//  librerias  proyecto

import '../../../configuracion/configuracionAplicacion.dart';
import '../../../../nucleo/ui/ui.dart';
import '../../../contexto/contexto.dart';

import 'ClienteUI.dart';

class pagina_Cliente_lista extends StatefulWidget {
  pagina_Cliente_lista(
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
  static String ruta = "pagina_Cliente_lista";

  @override
  _pagina_Cliente_lista createState() => _pagina_Cliente_lista();
}

class _pagina_Cliente_lista extends State<pagina_Cliente_lista> {
  //  declaración de variables

  IdiomaAplicacion idioma;

  // KEYS

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  //  Acciones
  ElementoLista accionAgregar;
  ElementoLista accionConsultar;
  ElementoLista accionFiltrar;

  //  provider
 ClienteControlador provider;

  //  Interfaz  comun
  ClienteUI ui;

  //  controladores

  //  otros

  //  inicializar  variables
  @override
  void initState() {
    super.initState();
    widget.pagina = pagina_Cliente_lista.ruta;
    provider = ClienteControlador();
    ui = ClienteUI(provider: provider);
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
        callBackAccion2: ui.respuestaEliminar,

        icono3: "documentos",
        ruta3:  "FlujoTrabajoDocumento_pagina_lista",
        accion3: ui.seleccionarElemento3,
        callBackAccion3: ui.respuestaSeleccionar3 ,
    );

    accionFiltrar = ElementoLista(
        id: 2,
        icono: "edit",
        ruta: widget.paginaSiguiente,
        operacion: eOperacion.Filtrar,
        accion: ui.seleccionarElemento,
        callBackAccion: ui.respuestaSeleccionar,

        icono3: "documentos",
        ruta3:  "FlujoTrabajoDocumento_pagina_lista",
        accion3: ui.seleccionarElemento3,
        callBackAccion3: ui.respuestaSeleccionar3 ,

    );

    // provider.addListener(() {
    //      print("  actualizo, numero ${provider.entidad.id} ");
    // }) ;

    provider.limpiar();
    Cliente entidadCaptura = Cliente().iniciar();

    print  (Sesion.idUsuario);
    print  (Sesion.perfiles);
/*     if (Sesion.idUsuario!=null && Sesion.idUsuario!=0)
    {
       entidadCaptura.id=Sesion.idUsuario;
       provider..asignarParametrosFiltro(null,"idSocio","prueba");
    }
    else  */
      provider.asignarParametros(null,"prueba");
    provider.consultarEntidad(entidadCaptura, null);
  }

  @override
  void dispose() {
    super.dispose();
    provider.dispose();
  }

  //
  //   construir  interfaz de Cliente
  //
  @override
  Widget build(BuildContext context) {
    // contextoAplicacion=ContextoAplicacion.obtener(ModalRoute.of(context).settings.arguments);

    idioma = IdiomaAplicacion.obtener(context, idioma);
    widget.titulo = idioma.obtenerElemento(widget.pagina, "titulo");    
    ui.iniciar(context, scaffoldKey, idioma, widget);


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
                //  IconButton(
                //       icon: Icon( Icons.arrow_back  ),  onPressed: ()
                //       {
                //               Accion.regresar(context);
                //       },
                // ),
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
  //  interface de Cliente   comun de la vista
  //

  //
  // mostrar Contenido
  //

  Widget mostrarContenido() {
    return Consumer<ClienteControlador>(
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
    List<Cliente> lista = provider.obtenerListaPorSuscripcion(ui.obtenerIdSuscriptor());
    if ( lista !=null && query != "")
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
