//  librerias internas de flutter

import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui';

//  librerias importadas flutter

 import 'package:provider/provider.dart';
//import 'package:gradient_app_bar/gradient_app_bar.dart';

//  librerias  proyecto


import '../../../../inicializacion/inicializacion.dart';
import '../../../../configuracion/configuracion.dart';
import '../../../../administracion/administracion.dart';

import '../../../../nucleo/nucleo.dart';
import '../../../../aplicacion/aplicacion.dart';


//  librerias externas  flutter

import '../../../../paquetesExternos/paquetesExternos.dart';



class Modelo_pagina_captura extends StatefulWidget {
  Modelo_pagina_captura(
      {Key? key,
      this.titulo,
      this.pagina,
      this.paginaSiguiente,
      this.paginaAnterior,
      this.accionPagina,
      this.activarAcciones})
      : super(key: key);

  String? titulo;
  String? pagina= "";
  String? paginaSiguiente = "";
  String? paginaAnterior= "";
  String? accionPagina = ""; // avanzar, regresar
  bool? activarAcciones = false;
  static String ruta = "Modelo_pagina_captura";

  @override
  _Modelo_pagina_captura_state createState() => _Modelo_pagina_captura_state();
}

class _Modelo_pagina_captura_state extends State<Modelo_pagina_captura> {

  //  propiedades  widget

  // entidad
  EntidadBase entidadCaptura=EntidadBase();
  
  //    control de estado  con provider

  ModeloCE? prov;  

  // captura
  final keyFormulario = GlobalKey<FormState>();

  //  controladores

  TextEditingController _controllerListaColor = new TextEditingController();
  TextEditingController _controllerColorSecundario = TextEditingController();
  TextEditingController _controller_txtHoraCU = TextEditingController();
  TextEditingController _controller_txtfechaCU = TextEditingController();
  TextEditingController _controller_txtfechaCalendario = TextEditingController();
  TextEditingController _controller_txtfechaSelector = TextEditingController();



  //  otros



  int _counter = 0;

 //  inicializar  widget
  @override
  void initState() {
    super.initState();
    widget.pagina = Modelo_pagina_captura.ruta;
    ContextoUI.guadarKey(widget.pagina! , keyFormulario);
  }
  //  dispose widget
  @override
  void dispose() {
    super.dispose();
  }


 //  build widget
  @override
  Widget build(BuildContext context) {

    widget.titulo=Traductor.obtenerEtiquetaSeccion(widget.pagina!,'titulo');
    print (widget.titulo);

    prov =Provider.of<ModeloCE>(context,listen: false);

    return Scaffold(
      appBar: AppBar(title: Text(widget.titulo!)),
      drawer: Menulateral.crearMenu(context, OpcionesMenus.obtenerMenuPrincipal(), widget.titulo!),
      body: mostrarCaptura(context, keyFormulario, cambiarValor, validar, definicionControles, entidadCaptura),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Boton.crearBotonFlotante(context, ElementoLista( icono: "save", accion: guardar ),
      ),
    );
  }

  //    metodos 

  Widget mostrarCaptura(
      BuildContext context, GlobalKey<FormState> keyFormulario, Function cambiarValor, Function validar, Function metodoDefinicionControles, dynamic entidadCaptura)
  {
          return /* SingleChildScrollView(
                    child:  */
              Container(
                  padding: EdgeInsets.all(15.0),
                  child: Captura.mostrarFormulario(context, keyFormulario, cambiarValor, validar,
                      metodoDefinicionControles, entidadCaptura),
            //)
          );
  }

  List<Widget> definicionControles(
      BuildContext context,
      GlobalKey<FormState> keyFormulario,
      Function cambiarValor,
      Function validar,
      dynamic entidadCaptura) {
    List<Control> controles = [];

    List<ElementoLista> _lista = [];
    _lista.add(ElementoLista(valor: "si", titulo: "si"));
    _lista.add(ElementoLista(valor: "no", titulo: "no"));

    print(ParametrosSistema.colorTema);
    Control lisVariables = new Control(
      idControl: "lisVariables",
    );
    lisVariables = lisVariables.asignar(
        '', widget.pagina!, "si", cambiarValor, validar);
    lisVariables.controlEdicion = _controllerListaColor;
    lisVariables.lista = _lista;
    controles.add(lisVariables);



 
     Control txtHoraCU= Control().crear('', widget.pagina!, "txtHoraCU",  entidadCaptura.clave , cambiarValor, validar);
     txtHoraCU.controlEdicion= _controller_txtHoraCU;
     controles.add(txtHoraCU);

     Control txtfechaCU= Control().crear('', widget.pagina!, "txtfechaCU",  entidadCaptura.llave , cambiarValor, validar);
     txtfechaCU.controlEdicion= _controller_txtfechaCU;
     controles.add(txtfechaCU);

     Control txtfechaCalendario= Control().crear('', widget.pagina!, "txtfechaCalendario",  entidadCaptura.llave , cambiarValor, validar);
     txtfechaCalendario.controlEdicion= _controller_txtfechaCalendario;
     controles.add(txtfechaCalendario);

     Control txtfechaSelector= Control().crear('', widget.pagina!, "txtfechaSelector",  entidadCaptura.llave , cambiarValor, validar);
     txtfechaSelector.controlEdicion= _controller_txtfechaSelector;
     controles.add(txtfechaSelector);
     
     controles.add(Control().crear('', widget.pagina!, "txtimporte",  entidadCaptura.id  , cambiarValor, validar));
  
     controles.add(Control().crear('', widget.pagina!, "txttelefono",  entidadCaptura.clave , cambiarValor, validar));
     controles.add(Control().crear('', widget.pagina!, "txtcorreo",  entidadCaptura.nombre , cambiarValor, validar));
     controles.add(Control().crear('', widget.pagina!, "txtruta",  entidadCaptura.descripcion , cambiarValor, validar));

  
    return cargarControlesCaptura( context, controles, '', widget.pagina!, cambiarValor, validar,[]);
  }

  //
  //   control  de estado y validaciones
  //

  dynamic validar(Control control, dynamic valor) {}
  dynamic cambiarValor(Control control, dynamic valor) {
    // setState(() {
      print(control.idControl);
      print(valor);
      switch (control.idControl) {
        case "lisVariables":
 
          break;
        case "txtcuenta":

          break;
        case "txtfechaNacimiento":

   
          break;
         case "txtimporte":

   
          break;       
         case "txttelefono":

   
          break;         
          case "txtcorreo":

   
          break;     
          case "txtruta":

   
          break;                         
      }

    // });

    return entidadCaptura;
  }

  void guardar(BuildContext context, ElementoLista elemento, [dynamic argumentos]) {
    //  if (!formKey.currentState!.validate()) return;
    //    formKey.currentState!.save();
    //  prov!.entidad=prov!.entidad;
    //  prov!.guardar();
  }


}