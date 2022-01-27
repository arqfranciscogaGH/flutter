//  librerias internas de flutter

import 'package:flutter/material.dart';

//  librerias importadas flutter

import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

//  librerias  proyecto

import '../../../configuracion/configuracionAplicacion.dart';
import '../../../../nucleo/ui/ui.dart';
import '../../../contexto/contexto.dart';

//  controladores  de interfaz de usuario  y negocio
import 'MisPendientesUI.dart';

class AvanzarTarea_captura extends StatefulWidget {
  AvanzarTarea_captura(
      {Key key,
      this.titulo,
      this.pagina,
      this.paginaSiguiente,
      this.paginaAnterior,
      this.acccionPagina,
      this.activarAcciones,
      this.keyFormulario})
      : super(key: key);
  String titulo;
  String pagina;
  String paginaSiguiente = "";
  String paginaAnterior = "";
  String acccionPagina = "";
  bool activarAcciones = false;
  GlobalKey<FormState> keyFormulario;

  @override
  _AvanzarTarea_captura_state createState() => new _AvanzarTarea_captura_state();
}

class _AvanzarTarea_captura_state extends State<AvanzarTarea_captura> {
  //  declaración de variables

  IdiomaAplicacion idioma;
  dynamic entidadCaptura;
  List<dynamic> listaEntidad;

  // captura

  GlobalKey<FormState> keyFormulario;
   GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  //  Acciones
  ElementoLista accionGuardar;

  //  provider
  MisPendientesControlador provider;
  FTEstatusTareaControlador providerE ;

  //  Interfaz  comun
  MisPendientesUI ui;

  //  controladores

  TextEditingController _controllerLista =
      new TextEditingController();
  TextEditingController _controllerFechaInicial = new TextEditingController();
  TextEditingController _controllerFechaFinal = new TextEditingController();
  TextEditingController _controllerCosto = new TextEditingController();

  //  otros

  List<dynamic>  listaEstatus;
  //  inicializar  variables
  @override
  void initState() {
    super.initState();
       ui = MisPendientesUI(provider: provider);
       accionGuardar = ElementoLista(
        id: 4,
        icono: "save",
        ruta: widget.paginaSiguiente,
        accion: ui.guardarEntidad,
        //callBackAccion: ui.respuestaInsertar,
        //callBackAccion2: ui.respuestaModificar,
        callBackAccion3: ui.respuestaGuardar,
        argumento: widget.pagina);
    //  inicar  otras  variables

    //  asignacion nuevo  keyFormulario para realizar  nueva  captura parcial,
    //  se muestre  los  nuevos datos  y no se genero error duplicate key
    //  inicar  otras  variables
    if (widget.keyFormulario != null)
      keyFormulario = widget.keyFormulario;
    else
      keyFormulario = GlobalKey<FormState>();
    ContextoUI.guadarKey(widget.pagina, keyFormulario);

    //  inicar  otras  variables

    // Provider.of<FTConsultaControlador>(context, listen: false).actualizarControles=true;
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
    provider = Provider.of<MisPendientesControlador>(context,listen: false);
    ui.provider=provider;
    entidadCaptura = provider.entidad;
    listaEstatus = ui.obtenerEstatusTarea(actualizarEstadoListaEstatus) ;

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

    //  setState(() {
    //  listaEstatus=listaRespuesta;

    // });
  }
 void actualizarEstadoListaEstatus(List<dynamic> listaRespuesta) {
       setState(() {
          listaEstatus=listaRespuesta;
      //     // print(listaRespuesta);
        });
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

    // controles
    //     .add(Control(idControl: "txtnombre", valor: entidadCaptura['Nombre']));
  
  controles
        .add(Control(idControl: "txtnombre", valor: entidadCaptura.nombre));
  controles
        .add(Control(idControl: "txtimss", valor: entidadCaptura.identificador));
  controles
        .add(Control(idControl: "txtimporte", valor: entidadCaptura.importe.toString()));        
  controles
        .add(Control(idControl: "txtactividad", valor: entidadCaptura.actividad));      
  controles
        .add(Control(idControl: "txtobs", valor: entidadCaptura.observacion));  

 
  
  List<ElementoLista> _listaTipo = List<ElementoLista>();

    // if (entidadCaptura.tipo=='')
    //     entidadCaptura.tipo="B";
    // _listaTipo
    //     .add(ElementoLista(valor: "1", titulo: "Prospección realizada", subitulo: "Prospección realizada"));
    // _listaTipo
    //     .add(ElementoLista(valor: "2", titulo: "Prospección detenida", subitulo: "200"));
    // _listaTipo
    //     .add(ElementoLista(valor: "3", titulo: "Prospección cancelada", subitulo: "300"));
  String  estatus;
  if (listaEstatus!=null && entidadCaptura.idTarea!=null)
  {
      List<dynamic> lista;
      lista=listaEstatus.where((s) => s.idTarea == entidadCaptura.idTarea).toList();
      for (FTEstatusTarea ele in lista) { 
          //  estatus=ele.idEstatus.toString();
          //   print(estatus); 
            print(ele.clave);       
            print(ele.nombre);
            ElementoLista estatusEncontrado = _listaTipo.firstWhere((s) => s.valor == ele.clave, orElse: () => null);
            if (estatusEncontrado == null) 
                 _listaTipo.add(ElementoLista(valor: ele.clave, titulo: ele.nombre, subitulo: ele.descripcion));
      }
      if (  _listaTipo!=null && _listaTipo.isNotEmpty  )
      {
        if ( entidadCaptura.estatusOperacion==null || entidadCaptura.estatusOperacion=="")
        {
          if  (_listaTipo!=null  &&  _listaTipo.length>0)
          {
              estatus =_listaTipo.first.valor;
              entidadCaptura.estatusOperacion=estatus;
          }
        }

        Control controlListaTipo = new Control(idControl: "lisestatus",);
        controlListaTipo = controlListaTipo.asignar(
            idioma, pagina, entidadCaptura.estatusOperacion, cambiarValor, validar);
        controlListaTipo.controlEdicion = _controllerLista;
        controlListaTipo.lista = _listaTipo;
        controles.add(controlListaTipo);
      }

  }

    List<Widget> widgets = cargarControlesCaptura(context, controles, idioma,
    pagina, metodoActualizarValor, metodoValidar);
    return widgets; 

  //print(entidadCaptura.estatusOperacion);     

}

    


    // //  Gratuita, Mensual, Trimestral, Anual




 
  //
  //   control  de estado y validaciones en widget
  //

  dynamic validar(Control control, dynamic valor) {
    if (control.idControl == "txtnombre") {
      if (valor != null && valor.length < 3) {
        return 'Ingrese el nombre ';
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
      case "txtnombre":
        entidadCaptura.nombre = valor;
        break;
      case "txtobs":
        entidadCaptura.observacion = valor;
        break;
      case "lisestatus":
        entidadCaptura.estatusOperacion = valor;
        break;        
    }

    print(control.idControl + "  , valor  : $valor");
    // imprimir(entidadCaptura);
    return entidadCaptura;
  }
}

// Termina   widget de captura de información
