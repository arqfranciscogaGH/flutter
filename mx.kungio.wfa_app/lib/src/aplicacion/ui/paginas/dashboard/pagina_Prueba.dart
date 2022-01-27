//  librerias internas de flutter

import 'package:flutter/material.dart';

//  librerias importadas flutter

import 'package:provider/provider.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

//  librerias  proyecto

import '../../../configuracion/configuracionAplicacion.dart';
import '../../../../nucleo/ui/ui.dart';
import '../../../contexto/contexto.dart';

import '../../../negocio/controlador/EstadisticasVistaControlador.dart';


class pagina_dashboard extends StatefulWidget {
  pagina_dashboard(
      {Key key,
      this.titulo,
      this.pagina,
      this.paginaSiguiente,
      this.paginaAnterior,
      this.accionPagina,
      this.activarAcciones})
      : super(key: key);
  String titulo;
  String pagina = "pagina_dashboard";
  String paginaSiguiente = "";
  String paginaAnterior = "";
  String accionPagina = ""; // avanzar, regresar
  bool activarAcciones = false;
  static String ruta = "pagina_dashboard";

  @override
  _pagina_dashboard createState() => _pagina_dashboard();
}

class _pagina_dashboard extends State<pagina_dashboard> {
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

  
  //  Interfaz  comun


  //  controladores
 EstadisticasVistaControlador provider;
  //  otros
 String  valorE="1";
  TextEditingController _controllerListaVista = new TextEditingController();
  TextEditingController _controllerListaFiltro = new TextEditingController();
  //  inicializar  variables
  @override
  void initState() {
    super.initState();
    widget.pagina = pagina_dashboard.ruta;

    //  definir  url y sus  parametros 
    String url ="FTConsulta/LINEAIV/";
    String argumentos ="vista=2";
    String consulta ="/1/VerEstadisticasFlujoPorVista";
    consulta ="/1/VerEstadisticasFlujoPorVistaDetallePorFiltro";
    //  obtener argumentos  de pagina  comun
    // argumentos= ContextoUI.obtenerKey("seguimiento").entidad.identificador;
    argumentos=argumentos==null  || argumentos=="" ?"''":argumentos;
    print (argumentos);
    url+= argumentos ;
    url+= consulta ;
    print (url);

    provider = EstadisticasVistaControlador();
 
    provider.limpiar();
    provider.asignarParametros(url, "prueba");
    // provider.consultarEntidad(EstadisticasVista().iniciar(), actualizarEstadoLista);
   
   
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
    idioma = IdiomaAplicacion.obtener(context, idioma);
    widget.titulo="";
    // widget.titulo = idioma.obtenerElemento(widget.pagina, "titulo");
    return  Scaffold(
          key: scaffoldKey,
          appBar: GradientAppBar(
            title: Text(""),
            gradient: LinearGradient(colors: [
              Theme.of(context).primaryColor,
              Colores.obtenerColor(Configuracion.colorSecundario)
            ]),
            actions: <Widget>[
              // IconButton(
              //   icon: Icon(Icons.search),
              //   onPressed: () {
       
              //   },
              // ),
              //  IconButton(
              //       icon: Icon( Icons.arrow_back  ),  onPressed: ()
              //       {
              //               Accion.regresar(context);
              //       },
              // ),
            ],
          ),
          body: mostrarContenido(context),
          // floatingActionButtonLocation:
          //     FloatingActionButtonLocation.centerDocked,
          // floatingActionButton:
          //     Boton.crearBotonFlotante(context, accionAgregar),
          // drawer: Menu.crearListaMenuLateral(
          //     context, OpcionesMenus.obtenerMenuPrincipal(), ""),
        );
  }

  //
  //  interface de usuario   comun de la vista
  //

  //
  // mostrar Contenido
  //

  Widget mostrarContenido(BuildContext context) {
    return  mostrarVista(context );
  }

 

  Widget  mostrarVista(BuildContext context)
  {
     List<Control> controles = List<Control>();
     List<ElementoLista> _listaVista = List<ElementoLista>();
    _listaVista.add(ElementoLista(valor: "1", titulo: "Grupo", subitulo: "100", seleccionado: true));
    _listaVista.add(ElementoLista(valor: "2", titulo: "Socio", subitulo: "100", seleccionado: false));

    Control controlListaVista = new Control(
        idControl: "listaVista",
        tipo: eTipoControl.RadioHorizontal,
        accionValidacion: validar,
        accion: cambiarValor,
        valor: valorE,
        controlEdicion : _controllerListaVista,
        lista : _listaVista,
      );

    // controlListVista = controlListVista.asignar(
    //     idioma, 'pagina', valorE, cambiarValor, validar);
    // controlListVista.controlEdicion = _controllerListaVista;
    // controlListVista.lista = _listaVista;
   controles.add(controlListaVista);

   Control controlListaFiltro = new Control(
        idControl: "listaFiltro",
        tipo: eTipoControl.VerificadorVertical,
        accionValidacion: validar,
        accion: cambiarValor,
        valor: valorE,
        controlEdicion : _controllerListaFiltro,
        lista : _listaVista,
      );
   controles.add(controlListaFiltro);

return Container( child: ListView(
              children: <Widget>[
                Divider(),
                Text ("Hola"),
                Column (children:
                  crearElementosRadioVertical( context, controlListaVista , _listaVista ),
                ),
                Divider(),
                Row (children:
                  crearElementosRadioHorizontal( context, controlListaVista , _listaVista ),
                ),
                Divider(),
                //crearVerficadorHorizontal( context, controlListaVista , _listaVista ),
                crearDropdown( context, controlListaVista , _listaVista ),
                Divider(),
                crearDropdownFijo( context, controlListaVista , _listaVista ),                
              ]));

    //  List<Widget> widgets =  crearElementosRadioVertical( context,controlListVista , _listaVista );
    //   widgets +=  crearElementosRadioHorizontal( context,controlListVista , _listaVista );

//  List<Widget> widgets = cargarControlesCaptura(context, controles, idioma,
//         "pagina", cambiarValor, validar);
    // return  widgets;


    // List<Widget> widgets = cargarControlesCaptura(context, controles, idioma,
    //     pagina, metodoActualizarValor, metodoValidar);
    // return widgets;
  }

   List<Widget> definicionControles(BuildContext context)
  {
  }

 List<Widget>  mostrarlista(BuildContext context)
  {
     List<ElementoLista> _listaVista = List<ElementoLista>();


    _listaVista.add(ElementoLista(valor: "1", titulo: "Grupo", subitulo: "100"));
    _listaVista.add(ElementoLista(valor: "2", titulo: "Socio", subitulo: "100"));



    Control controlListVista = new Control(
        idControl: "listaVista",
        accionValidacion: validar,
        accion: cambiarValor,
        valor: valorE,
        controlEdicion : _controllerListaVista,
        lista : _listaVista,
      );

    controlListVista = controlListVista.asignar(
        idioma, 'pagina', valorE, cambiarValor, validar);
    controlListVista.controlEdicion = _controllerListaVista;
    controlListVista.lista = _listaVista;

    List<Widget> widgets =  crearElementosRadioVertical( context,controlListVista , _listaVista );
    return  widgets;


    // List<Widget> widgets = cargarControlesCaptura(context, controles, idioma,
    //     pagina, metodoActualizarValor, metodoValidar);
    // return widgets;
  }
 dynamic validar(Control control, dynamic valor) {
    // if (control.idControl == "txtcuenta") {
    //   if (valor != null && valor.length < 3) {
    //     return 'Ingrese el cuenta del Usuario';
    //   } else {
    //     return null;
    //   }
    // }
  }
  void actualizarValor(Control control, dynamic valor) {
    // entidadCaptura = cambiarValor(control, valor);
    print( valor);
    print( valorE);
    valorE=valor;
    setState(() {valorE=valor; });
  }

  dynamic cambiarValor(Control control, dynamic valor) {
      // switch (control.idControl) {
      //   case "txtcuenta":
      //     // entidadCaptura.cuenta = valor;
      //     break;
      // }

    print( valor);
    print( valorE);
    valorE=valor;
    setState(() {valorE=valor; });
   }
    //
    //  filtar  informacion
    //

    //
    //   control  de estado y validaciones
    //

    void actualizarEstadoLista(List<dynamic> listaRespuesta) {
        print(listaRespuesta);
      // listaEntidad=listaRespuesta;
    }

    //
    //   respuestas
    //
  
}
//
// Termina widget
//
