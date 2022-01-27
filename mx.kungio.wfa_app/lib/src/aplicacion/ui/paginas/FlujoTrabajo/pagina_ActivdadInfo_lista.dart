//  librerias internas de flutter

import 'package:flutter/material.dart';

//  librerias importadas flutter

import 'package:provider/provider.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

//  librerias  proyecto

import '../../../configuracion/configuracionAplicacion.dart';
import '../../../../nucleo/ui/ui.dart';
import '../../../contexto/contexto.dart';

import 'ActivdadInfoUI.dart';

class pagina_ActivdadInfo_lista extends StatefulWidget {
  pagina_ActivdadInfo_lista(
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
  String pagina = "pagina_ActivdadInfo_lista";
  String paginaSiguiente = "";
  String paginaAnterior = "";
  String accionPagina = ""; // avanzar, regresar
  bool activarAcciones = false;
  String tipo = ""; 
  static String ruta = "pagina_ActivdadInfo_lista";

  @override
  _pagina_ActivdadInfo_lista createState() => _pagina_ActivdadInfo_lista();
}

class _pagina_ActivdadInfo_lista extends State<pagina_ActivdadInfo_lista> {
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

 

  FTActividadInfoControlador provider;
  EstadisticasFlujoControlador providerE;

  //  Interfaz  comun
  ActividadInfoUI ui;

  //  controladores

  //  otros

  //  inicializar  variables
  @override
  void initState() {
    super.initState();
    widget.pagina = pagina_ActivdadInfo_lista.ruta;
    
    
 
    String  url="FTConsulta/LINEAIV/";
    String  consulta="/1/VerlujoTrabajoPorTareaDetalle/";
    String  variables='';

    provider = FTActividadInfoControlador();
    provider.limpiar();
    providerE = EstadisticasFlujoControlador();
  
    print (widget.tipo); 
    print ( providerE.entidad.idTarea);

    variables+= "IdTarea="+providerE.entidad.idTarea.toString()+",";  
    if (widget.tipo.toLowerCase()=="general"  )
    {
        // url+= "''"+consulta;  
         url+= variables.length>0 ? variables+consulta:consulta; 
    }
    else if ( widget.tipo.toLowerCase()=="socio" ) 
    {
        variables+=Sesion.idSuscriptor!=null &&  Sesion.idSuscriptor!=0? "IdSocio="+Sesion.idSuscriptor.toString():"";
        url+= variables.length>0 ? variables+consulta:consulta;  
    }
    else if (  widget.tipo.toLowerCase()=="grupo" ) 
    {
        variables+=Sesion.grupos!=null &&  Sesion.grupos!=""? "IdGrupo="+Sesion.grupos:"";
        url+= variables.length>0 ? variables+consulta:consulta;  
    } 
    print(url);

    // provider.asignarParametros("FTConsulta/LINEAIV/IdTarea=7,IdSocio=4,IdGrupo=4/1/VerlujoTrabajoPorTareaDetalle", "prueba");
    // provider.asignarParametros("FTConsulta/LINEAIV/100/1/Seguimiento", "prueba");
    // url="IdTarea=7,IdSocio=4/1/VerlujoTrabajoPorTareaDetalle";



    provider.asignarParametros(url, "prueba");
    provider.consultarEntidad(ActividadInfo().iniciar(), null);
   
    ui = ActividadInfoUI(provider: provider);
    ui.provider=provider;
  
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
    return Consumer<FTActividadInfoControlador>(
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