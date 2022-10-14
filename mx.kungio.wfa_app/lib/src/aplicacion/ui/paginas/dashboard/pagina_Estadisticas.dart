//  librerias internas de flutter

import 'package:flutter/material.dart';
import 'dart:math';

//  librerias importadas flutter

import 'package:provider/provider.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:charts_flutter/flutter.dart' as charts;

//  librerias  proyecto

import '../../../configuracion/configuracionAplicacion.dart';
import '../../../../nucleo/ui/ui.dart';
import '../../../contexto/contexto.dart';

import 'EstadisticasUI.dart';

import 'DefininicionEstadisticas.dart';

class pagina_Estadisticas extends StatefulWidget {
  pagina_Estadisticas(
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
  String pagina = "pagina_Estadisticas";
  String paginaSiguiente = "";
  String paginaAnterior = "";
  String accionPagina = ""; // avanzar, regresar
  bool activarAcciones = false;
  String tipo = ""; 
  static String ruta = "pagina_Estadisticas";

  @override
  _pagina_Estadisticas createState() => _pagina_Estadisticas();
}

class _pagina_Estadisticas extends State<pagina_Estadisticas> {
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
 EstadisticasVistaControlador provider;
  
  //  Interfaz  comun
 EstadisticasVistaUI ui;

  //  controladores

  //  otros
  int indexPagina;
  String tipoMetrica="Cuenta";
  List<Widget> paginas;
  String tipoGrafica = "barra";
  List<ElementoSerie> datos=List<ElementoSerie>();

  List<EstadisticasVista> listaEntidad  ;  //=List<EstadisticasFlujo>();
  

  String  url="FTConsulta/''/";
  String  consulta="/1/VerEstadisticasFlujoPorVista";
  String  argumentos ="";

  String iconoGrafica="dona";
  String iconoVista="tarea";

  //  inicializar  variables
  @override
  void initState() {
    super.initState();
    print (widget.tipo);
    widget.pagina = pagina_Estadisticas.ruta;
    iconoVista=widget.tipo;
    // if (widget.tipo=='1')
    //   iconoVista= 'tarea';
    // else if (iconoVista=='2')
    //    iconoVista= 'grupo';  
    // else if (iconoVista=='3')
    //    iconoVista= 'socio'; 
                 

   
    print (widget.tipo); 
    print (iconoVista); 
    print (Sesion.idSuscriptor );
    print (Sesion.perfiles );
    print (Sesion.grupos );

    print (argumentos);
    // Administrador
//    argumentos=DefininicionEstadisticas.generarArgumentos( widget.tipo.toLowerCase(), Sesion.perfiles, Sesion.grupos, Sesion.idSuscriptor,  "");
   argumentos=DefininicionEstadisticas.generarArgumentos( iconoVista, Sesion.perfiles, Sesion.grupos, Sesion.idSuscriptor,  "");
    print (argumentos);
    url+= argumentos ;
    url+= consulta ;
    print (url); 

    provider = EstadisticasVistaControlador();

    provider.limpiar();
    provider.asignarParametros(url, "prueba");
    provider.consultarEntidad(EstadisticasVista().iniciar(), actualizarEstadoLista);
    ui = EstadisticasVistaUI(provider: provider);
 
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

  void seleccionElemento(charts.SelectionModel model) {
    if (model.hasDatumSelection) {
      final selectedDatum = model.selectedDatum.first;
      ElementoSerie  elemento =selectedDatum.datum;
      EstadisticasVista   entidad = EstadisticasVista().iniciar();
      entidad.id= elemento.id;
      entidad.clave= elemento.clave;
      entidad.concepto= elemento.clave; 
      entidad.vista= iconoVista; 

      ContextoUI.guadarKey("estadisticas", null, null, entidad);
       if (widget.paginaSiguiente != null)
       {
          // widget.paginaSiguiente
          String pagina ="pagina_EstadisticasInformacion_" +iconoVista;
          Accion.hacer(context, OpcionesMenus.obtener(pagina));
       }
          

      //print(selectedDatum.datum['valor']);

    }
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
              metodoSeleccion:seleccionElemento,
              context: context
              ),
      vista_GraficaDinamica(
              datos: datos,
              titulo:"Cuenta",
              tipoGrafica: tipoGrafica,
              metodoSeleccion:seleccionElemento,        
              context: context
              ),
       vistaInformacion(),             

    ];


    idioma = IdiomaAplicacion.obtener(context, idioma);
    ui.iniciar(context, scaffoldKey, idioma, widget);
    widget.titulo = idioma.obtenerElemento(widget.pagina, "titulo");

    if (/* Sesion.perfiles=='1' || */ iconoVista.toLowerCase()=="tarea"  )
        widget.titulo="Tarea";
    else if (/* Sesion.perfiles=='2'  &&  */iconoVista.toLowerCase()=="socio" ) 
       widget.titulo="Socio";
    else if (/* Sesion.perfiles=='2'  &&  */ iconoVista.toLowerCase()=="grupo" ) 
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
                    icon:Iconos.crear(iconoGrafica ),
                    onPressed: () {
                      
                      if (iconoGrafica=='dona')
                         iconoGrafica= 'pieNormal';
                      else if (iconoGrafica=='pieNormal')
                         iconoGrafica= 'barra';
                      else if (iconoGrafica=='barra')
                         iconoGrafica= 'dona';                         
                      actualizarGrafica(iconoGrafica); 
                    },
                  ),  
                  IconButton(
                     icon: Iconos.crear(iconoVista ),
                    onPressed: () {
                      
                      if (iconoVista=='tarea')
                        iconoVista= 'grupo';
                       else if (iconoVista=='grupo')
                          iconoVista= 'socio';  
                      else if (iconoVista=='socio')
                         iconoVista= 'tarea'; 
                     

                      widget.tipo=iconoVista;
                      print (iconoVista);   
                      argumentos="";   
                      url="FTConsulta/LINEAIV/";         
                      argumentos=DefininicionEstadisticas.generarArgumentos( iconoVista, Sesion.perfiles, Sesion.grupos, Sesion.idSuscriptor,  "");
                      print (argumentos);
                      url+= argumentos ;
                      url+= consulta ;
                      print (url); 
                      provider = EstadisticasVistaControlador();
                      provider.limpiar();
                      provider.asignarParametros(url, "prueba");
                      provider.consultarEntidad(EstadisticasVista().iniciar(), actualizarEstadoLista);
                    }, //pieNormal
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
    return Consumer<EstadisticasVistaControlador>(
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
    int  index =0;
     listaEntidad=listaRespuesta;
     datos=List<ElementoSerie>();
    for (EstadisticasVista ele in listaRespuesta) { 
      listaRespuesta[index].vista=iconoVista;
      ele.vista=iconoVista;
      print (ele.clave);
      print (ele.actividad);
      print (ele.concepto);
      print (ele.cuenta);
      print (ele.importe);
      print (ele.vista);

      datos.add(
      ElementoSerie(
          serie: "ninguno",
          id:ele.id ,
          clave: ele.clave,
          titulo: ele.clave,
          valor: ele.cuenta,
          metrica: ele.importe,
          colorG: charts.ColorUtil.fromDartColor( Colores.obtenerColorIndex(index)),
          //colorG: charts.ColorUtil.fromDartColor( Colores.obtenerColorIndex(random.nextInt(20))),
          // color: Colors.green,
         // color: charts.ColorUtil.fromDartColor(Colors.green),
        ));
        index++;
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


