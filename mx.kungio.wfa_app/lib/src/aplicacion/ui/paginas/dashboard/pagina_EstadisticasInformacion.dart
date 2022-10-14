//  librerias internas de flutter

import 'package:flutter/material.dart';

//  librerias importadas flutter

import 'package:provider/provider.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

//  librerias  proyecto

import '../../../configuracion/configuracionAplicacion.dart';
import '../../../../nucleo/ui/ui.dart';
import '../../../contexto/contexto.dart';

import 'EstadisticasInformacionUI.dart';
import 'DefininicionEstadisticas.dart';

class pagina_EstadisticasInformacion extends StatefulWidget {
  pagina_EstadisticasInformacion(
      {Key key,
      this.titulo,
      this.pagina,
      this.paginaSiguiente,
      this.paginaAnterior,
      this.accionPagina,
      this.activarAcciones,
      this.tipo
      })
      : super(key: key);
  String titulo;
  String pagina = "pagina_EstadisticasInformacion";
  String paginaSiguiente = "";
  String paginaAnterior = "";
  String accionPagina = ""; // avanzar, regresar
  bool activarAcciones = false;
  String tipo = ""; 
  static String ruta = "pagina_EstadisticasInformacion";

  @override
  _pagina_EstadisticasInformacion createState() => _pagina_EstadisticasInformacion();
}

class _pagina_EstadisticasInformacion extends State<pagina_EstadisticasInformacion> {
  //  declaración de variables

  IdiomaAplicacion idioma;
  // Suscripcion entidadCaptura ;
  //List<Suscripcion> listaEntidad;

  // KEYS

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  //  Acciones
  ElementoLista accionAgregar;
  ElementoLista accionConsultar;
  ElementoLista accionFiltrar;

  //  provider
  // FTConsultaControlador provider;

 

  EstadisticasVistaDetalleControlador provider;
  EstadisticasVistaControlador providerE;

  //  Interfaz  comun
  EstadisticasInformacionUI ui;
  EstadisticasVista entidad;
  //  controladores

  //  otros

  //  inicializar  variables
  @override
  void initState() {
    super.initState();
    widget.pagina = pagina_EstadisticasInformacion.ruta;
    entidad=ContextoUI.obtenerKey("estadisticas").entidad;
    int id=0;
    if  (entidad!=null)
    {
         id = entidad.id;  
         widget.tipo = entidad.vista;
    }
     
    print (widget.tipo); 
    print (ContextoUI.obtenerKey("estadisticas").entidad.id);
    print (ContextoUI.obtenerKey("estadisticas").entidad.clave);
    print (ContextoUI.obtenerKey("estadisticas").entidad.concepto); 

    String  url="FTConsulta/''/";
    String  consulta="/1/VerEstadisticasFlujoPorVistaDetallePorFiltro/";
    String  argumentos ="";

    print (argumentos);
   
//  argumentos=DefininicionEstadisticas.generarArgumentos( widget.tipo.toLowerCase(), Sesion.perfiles, Sesion.grupos, Sesion.idSuscriptor.toString(), entidad.id.toString()); 

    argumentos=DefininicionEstadisticas.generarArgumentos( widget.tipo.toLowerCase(), "", "", 0, id.toString());
    print (argumentos);       
    url+= argumentos ;
    url+= consulta ;
    print (url); 
    print(url);


    provider = EstadisticasVistaDetalleControlador();
    provider.limpiar();
    provider.asignarParametros(url, "prueba");
    provider.consultarEntidad(EstadisticasVistaDetalle().iniciar(), null);
   
    ui = EstadisticasInformacionUI(provider: provider);

  
    // cuando es captura  parcial ,la ruta debe ser null    para qe  ejecute  la pagina siguiente

    accionConsultar = ElementoLista(
        id: 2,
        icono: "beenhere",
        color: Colors.green,
        ruta: widget.paginaSiguiente,
        operacion: eOperacion.Consultar,
        // accion: ui.seleccionarElemento,
        // callBackAccion: ui.respuestaSeleccionar,
        // accion2: ui.eliminarElemento,
        // callBackAccion2: ui.respuestaEliminar
        );
    accionFiltrar = ElementoLista(
        id: 3,
        icono: "beenhere",
        color: Colors.green, 
        ruta: widget.paginaSiguiente,
        operacion: eOperacion.Filtrar,
        // accion: ui.seleccionarElemento,
        // callBackAccion: ui.respuestaSeleccionar
        );

    // provider.addListener(() {
    //      print("  actualizo, numero ${provider.entidad.id} ");
    // }) ;
    
 

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
    // provider = Provider.of<FTConsultaControlador>(context,listen: false);
    // if (provider.lista==null)
    //     provider.consultarEntidad(FTConsulta().iniciar(), null);
    print(Sesion.idUsuario );
      print(Sesion.cuenta);
    idioma = IdiomaAplicacion.obtener(context, idioma);
    ui.iniciar(context, scaffoldKey, idioma, widget);
    widget.titulo = idioma.obtenerElemento(widget.pagina, "titulo");
    widget.titulo="" +entidad.vista +":" + entidad.concepto;
     widget.titulo= entidad.concepto;
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
              // IconButton(
              //   icon: Icon(Icons.search),
              //   onPressed: () {
              //     Buscador buscador = Buscador();
              //     buscador.acccionConstruir = filtrarElementos;
              //     showSearch(
              //       context: context,
              //       delegate: buscador,
              //     );
              //   },
              // ),
              IconButton(
                    icon: Icon( Icons.arrow_back  ),  onPressed: ()
                    {
                            Accion.regresar(context);
                    },
              ),
            ],
          ),
          body: mostrarContenido(),
          // floatingActionButtonLocation:
          //     FloatingActionButtonLocation.centerDocked,
          // floatingActionButton:
          //     Boton.crearBotonFlotante(context, accionAgregar),
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
    print ( provider.lista  );
    return Consumer<EstadisticasVistaDetalleControlador>(
        builder: (context, _provider, widgetPadre) {
      // _provider.obtenerRedPorSuscripcion(Configuracion.idSuscriptor);
      return Vista_lista(
          lista: _provider.lista,
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
    List<dynamic> lista = provider.lista;
    if (query != "")
      lista = lista
          .where((s) => s.identificador.toLowerCase().contains(query.toLowerCase()))
          .toList();
    return Vista_lista(
        lista: lista,
        acciones: accionFiltrar,
        metodoCrearElemento: ui.crearElementoEntidad,
        context: context,
        pagina: widget.pagina);
  }

  //
  //   control  de estado y validaciones
  //
  void actualizarEstadoEntidad(dynamic entidad) {
    // entidadCaptura=entidad;
    // provider.entidad=entidad;
  }
  void actualizarEstadoLista(List<dynamic> listaRespuesta) {
    // listaEntidad=listaRespuesta;
  }
  void actualizarEstadoListaEstatus(List<dynamic> listaRespuesta) {
    // listaEntidad=listaRespuesta;
    print(listaRespuesta);
  }
  //
  //   respuestas
  //

}
//
// Termina widget
//
// 