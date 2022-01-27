//  librerias internas de flutter

import 'package:flutter/material.dart';
import 'dart:math';

//  librerias importadas flutter

import 'package:provider/provider.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';


//  librerias  proyecto

import '../../../configuracion/configuracionAplicacion.dart';
import '../../../../nucleo/ui/ui.dart';
import '../../../contexto/contexto.dart';

import 'EstadisticasFlujoUI.dart';

class pagina_EstadisticasFlujo_lista extends StatefulWidget {
  pagina_EstadisticasFlujo_lista(
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
  String pagina = "pagina_EstadisticasFlujo_lista";
  String paginaSiguiente = "";
  String paginaAnterior = "";
  String accionPagina = ""; // avanzar, regresar
  bool activarAcciones = false;
  String tipo = ""; 
  static String ruta = "pagina_EstadisticasFlujo_lista";

  @override
  _pagina_EstadisticasFlujo_lista createState() => _pagina_EstadisticasFlujo_lista();
}

class _pagina_EstadisticasFlujo_lista extends State<pagina_EstadisticasFlujo_lista> {
  //  declaración de variables

  IdiomaAplicacion idioma;
  // Suscripcion entidadCaptura ;
  //List<Suscripcion> listaEntidad;

  // KEYS

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  GlobalKey _bottomNavigationKey = GlobalKey();

  //  Acciones
  ElementoLista accionAgregar;
  ElementoLista accionConsultar;
  ElementoLista accionFiltrar;

  //  provider
  // FTConsultaControlador provider;
  EstadisticasFlujoControlador provider;
  
  //  Interfaz  comun
  EstadisticasFlujoUI ui;

  //  controladores

  //  otros
  int indexPagina;
  String tipoMetrica="Cuenta";
  List<Widget> paginas;
  String tipoGrafica = "barra";
  List<ElementoSerie> datos=List<ElementoSerie>();

  List<EstadisticasFlujo> listaEntidad  ;  //=List<EstadisticasFlujo>();
  
  

  //  inicializar  variables
  @override
  void initState() {
    super.initState();
    print (widget.tipo);
    widget.pagina = pagina_EstadisticasFlujo_lista.ruta;

    String  url="FTConsulta/LINEAIV/";
    String  consulta="/1/VerEstadisticasFlujoTrabajoPorTarea/";
    String  argumentos="";
  
     print (widget.tipo); 
    if (/* Sesion.perfiles=='1' || */ widget.tipo.toLowerCase()=="general"  )
    {
        consulta="/1/VerEstadisticasFlujoTrabajoPorTarea/";
    }
    else if (/* Sesion.perfiles=='2'  &&  */widget.tipo.toLowerCase()=="socio" ) 
    {
        consulta="/1/VerEstadisticasFlujoPorVariable/";
        argumentos+=Sesion.idSuscriptor!=null &&  Sesion.idSuscriptor!=0? "IdSocio="+Sesion.idSuscriptor.toString():"";
       }
    else if (/* Sesion.perfiles=='2'  &&  */ widget.tipo.toLowerCase()=="grupo" ) 
    {
        consulta="/1/VerEstadisticasFlujoPorVariable/";
        argumentos+=Sesion.grupos!=null &&  Sesion.grupos!=""? "IdGrupo="+Sesion.grupos:"";
    } 
    argumentos=argumentos==null  || argumentos=="" ?"''":argumentos;
    print (argumentos);
    url+= argumentos ;
    url+= consulta ;
    print (url); 

    provider = EstadisticasFlujoControlador();
    ui = EstadisticasFlujoUI(provider: provider);

    provider.limpiar();
    // provider.asignarParametros("FTConsulta/LINEAIV/''/1/VerEstadisticasFlujoTrabajoPorTarea/", "prueba");
    provider.asignarParametros(url, "prueba");
    provider.consultarEntidad(EstadisticasFlujo().iniciar(), actualizarEstadoLista);

    // cuando es captura  parcial ,la ruta debe ser null    para qe  ejecute  la pagina siguiente
    // ui.obtenerEstatusTarea(null) ;

    accionConsultar = ElementoLista(
        id: 2,
        operacion: eOperacion.Consultar,        
        icono: "articulo",
        ruta: widget.paginaSiguiente,
        accion: ui.seleccionarElemento,
        callBackAccion: ui.respuestaSeleccionar,


        );
    accionFiltrar = ElementoLista(
        id: 3,
        operacion: eOperacion.Filtrar,        
        icono: "articulo",
        ruta: widget.paginaSiguiente,
        accion: ui.seleccionarElemento,
        callBackAccion: ui.respuestaSeleccionar,
   
  
    );

    // provider.addListener(() {
    //      print("  actualizo, numero ${provider.entidad.id} ");
    // }) ;

    indexPagina = 0;
    tipoGrafica = "dona";
 
  }  

  @override
  void dispose() {
    super.dispose();
    // provider.dispose();
  }

  //
  //   construir  interfaz de usuario
  //
  @override
  Widget build(BuildContext context) {
    // contextoAplicacion=ContextoAplicacion.obtener(ModalRoute.of(context).settings.arguments);
    //     datos= [
    //   ElementoSerie(
    //     serie: "ninguno",
    //     titulo: "Maria",
    //     valor: 1,
    //     metrica: 50,
    //     color:Colors.purple,
    //   ),
    //   ElementoSerie(
    //     serie: "ninguno",
    //     titulo: "Juan",
    //     valor: 2,
    //     metrica: 15,
    //     color: Colors.green,
    //   ),
    //   ElementoSerie(
    //     serie: "ninguno",
    //     titulo: "Mitzi",
    //     valor: 3,
    //     metrica: 100,
    //     color: Colors.red,
    //   ),
    //   ElementoSerie(
    //     serie: "ninguno",
    //     titulo: "Sergio",
    //     valor: 4,
    //     metrica: 40,
    //     color: Colors.blue,
    //   )
    // ];
     paginas = [
      vista_GraficaDinamica(
              datos: datos,
              titulo:"Importe",
              tipoGrafica:tipoGrafica,
              context: context
              ),
      vista_GraficaDinamica(
              datos: datos,
              titulo:"Cuenta",
              tipoGrafica: tipoGrafica,
              context: context
              ),
       vistaInformacion(),             

    ];


    idioma = IdiomaAplicacion.obtener(context, idioma);
    ui.iniciar(context, scaffoldKey, idioma, widget);
    widget.titulo = idioma.obtenerElemento(widget.pagina, "titulo");

    if (/* Sesion.perfiles=='1' || */ widget.tipo.toLowerCase()=="general"  )
        widget.titulo="General";
    else if (/* Sesion.perfiles=='2'  &&  */widget.tipo.toLowerCase()=="socio" ) 
       widget.titulo="Socio";
    else if (/* Sesion.perfiles=='2'  &&  */ widget.tipo.toLowerCase()=="grupo" ) 
       widget.titulo="Grupo";
/*     return ChangeNotifierProvider.value(
        value: provider,
        child:  */ return Scaffold(
         key: scaffoldKey,
          appBar: GradientAppBar(
            title: Text(widget.titulo),
            gradient: LinearGradient(colors: [
              Theme.of(context).primaryColor,
              Colores.obtenerColor(Configuracion.colorSecundario)
            ]),
            actions: <Widget>[
                    IconButton(
                    icon: Icon(Icons.donut_large),
                    onPressed: () {
                      actualizarGrafica("dona");
                    },
                  ),  
                  IconButton(
                    icon: Icon(Icons.pie_chart),
                    onPressed: () {
                      actualizarGrafica("pieNormal");
                    }, //pieNormal
                  ),                         
                  IconButton(
                    icon: Icon(Icons.bar_chart),
                    onPressed: () {
                      actualizarGrafica("barra");
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
          bottomNavigationBar: CurvedNavigationBar(
            key: _bottomNavigationKey,
            index: indexPagina,
            color: Theme.of(context).primaryColor,
            backgroundColor: Colors.grey[200],
            buttonBackgroundColor: Colors.grey,
            height: 55.0,
            //animationCurve: Curves.easeInOut,
            // animationCurve: Curves.bounceIn,
            //animationCurve: Curves.bounceOut,
            animationCurve: Curves.easeIn,
            items: <Widget>[
              Iconos.crear('monetization_on_outlined', Colors.white, 30),
              Iconos.crear('format_list_numbered', Colors.white, 30),
              Iconos.crear('menu_book', Colors.white, 30),
            ],
            animationDuration: Duration(milliseconds: 600),
            onTap: (index) {
              setState(() {
                indexPagina = index;
                if  (indexPagina==0)
                      tipoMetrica="Imoprte ";
                else if  (indexPagina==1)
                      tipoMetrica="Cuenta";
                // _pageControler.jumpToPage(indexPagina);
              });
            },
          ),

          body: mostrarPagina(indexPagina),
          //body: /* SafeArea( */
            // child: vistaInformacionS()
          // SafeArea(  child: vista_GraficaDinamica(
          //     datos: datos,
          //     titulo: "Grafica  Prueba",
          //     tipoGrafica: tipoGrafica,
          //     context: context)
          //     ),
          // floatingActionButtonLocation:
          //     FloatingActionButtonLocation.centerDocked,
          // floatingActionButton:
          //     Boton.crearBotonFlotante(context, accionAgregar),
          drawer: Menu.crearListaMenuLateral(
              context, OpcionesMenus.obtenerMenuPrincipal(), ""),
        // )
        );
  }

  //
  //  interface de usuario   comun de la vista
  //

  //
  // mostrar Contenido
  //
  Widget mostrarPagina(int indexPaginaSeleccionado) {
      return paginas[indexPaginaSeleccionado];
  }
 

  Widget vistaInformacionC() {
    print ( provider.lista  );
    return Consumer<EstadisticasFlujoControlador>(
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
   Widget vistaInformacion() {
    print ( provider.lista  );
  return /*   Consumer<EstadisticasFlujoControlador>(
        builder: (context, _provider, widgetPadre) {
      // _provider.obtenerRedPorSuscripcion(Configuracion.idSuscriptor);
      return */ Vista_lista(
          lista: listaEntidad,
          acciones: accionConsultar,
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
    Random random = new Random();
     listaEntidad=listaRespuesta;
     datos=List<ElementoSerie>();
    for (EstadisticasFlujo ele in listaRespuesta) { 
      print (ele.clave);
      print (ele.actividad);
      print (ele.cuenta);
      datos.add(
      ElementoSerie(
          serie: "ninguno",
          titulo: ele.clave,
          valor: ele.cuenta,
          metrica: ele.importe,
         // color: Colores.obtenerColorIndex(random.nextInt(20)),
          // color: Colors.green,
         // color: charts.ColorUtil.fromDartColor(Colors.green),
        ));
    }

    setState(() {

    });
   }


    void actualizarGrafica(String tipo) {
    tipoGrafica = tipo;
    setState(() {

    }); 
    
 
  }

  //
  //   respuestas
  //

}
//
// Termina widget
//


