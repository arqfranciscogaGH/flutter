//  librerias internas de flutter

import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui';

//  librerias importadas flutter

import 'package:provider/provider.dart';

//  librerias  proyecto


import '../../../../inicializacion/inicializacion.dart';
import '../../../../configuracion/configuracion.dart';
import '../../../../administracion/administracion.dart';

import '../../../../nucleo/nucleo.dart';
import '../../../aplicacion.dart';

import '../../../../nucleo/negocio/controladorEstado/ParametrosSistemaCE.dart';


//  librerias externas  flutter

import '../../../../paquetesExternos/paquetesExternos.dart';


  class preferencias_pagina extends StatefulWidget {
  preferencias_pagina(
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
  static String ruta = "preferencias_pagina";


  @override
  _preferencias_paginas_state createState() => _preferencias_paginas_state();
}

class _preferencias_paginas_state extends State<preferencias_pagina> {

  //  propiedades  widget

  // entidad

  dynamic entidadCaptura;

  //    control de estado  con provider

  ParametrosSistemaCE? prov;  

  // captura
  final formKey = GlobalKey<FormState>();


  //  controladores

  TextEditingController _controllerListaIdioma = new TextEditingController();

  //  otros



  //  inicializar  widget
  @override
  void initState() {
    super.initState();
    widget.pagina = preferencias_pagina.ruta;
  }

 //  dispose widget
  @override
  void dispose() {
    super.dispose();
  }
  //
  //   construir  interfaz de usuario
  //

 @override
  Widget build(BuildContext context) {

    widget.titulo=Traductor.obtenerEtiquetaSeccion(widget.pagina!,'titulo');
    print (widget.titulo);
    prov =Provider.of<ParametrosSistemaCE>(context,listen: true);

    return Scaffold(
      appBar: AppBar(title: Text(widget.titulo!)),
      drawer: Menulateral.crearMenu(context, OpcionesMenus.obtenerMenuPrincipal(), widget.titulo!),
      body: mostrarCaptura(context, formKey, cambiarValor, validar, definicionControles, entidadCaptura),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Boton.crearBotonFlotante(context, ElementoLista( icono: "save", accion: guardar ),
      ),
    );
  }
  Widget mostrarCaptura(
      BuildContext context,
      GlobalKey<FormState> formKey,
      Function cambiarValor,
      Function validar,
      Function metodoDefinicionControles,
      dynamic entidadCaptura) {
    return /* SingleChildScrollView(
              child:  */
        Container(
      padding: EdgeInsets.all(15.0),
      child: Captura.mostrarFormulario(context, formKey, cambiarValor, validar,
          metodoDefinicionControles, entidadCaptura),

      //)
    );
  }

  List<Widget> definicionControles(
      BuildContext context,
      GlobalKey<FormState> formKey,
      Function cambiarValor,
      Function validar,
      dynamic entidadCaptura) {
    List<Control> controles = [];


  List<ElementoLista> _listaIdiomas = [];
    _listaIdiomas.add(ElementoLista(valor: "es", titulo: Traductor.obtenerEtiquetaSeccion('pagina_Comun','idiomaES') ));
    _listaIdiomas.add(ElementoLista(valor: "en", titulo: Traductor.obtenerEtiquetaSeccion('pagina_Comun','idiomaEN') ));
  
   Control listaIdiomas = new Control(
      idControl: "listaIdiomas",
    );

    listaIdiomas = listaIdiomas.asignar(
        '', widget.pagina!, ParametrosSistema.idioma, cambiarValor, validar);
    listaIdiomas.controlEdicion = _controllerListaIdioma;
    listaIdiomas.lista = _listaIdiomas;
    controles.add(listaIdiomas);


    return cargarControlesCaptura( context, controles, '', widget.pagina!, cambiarValor, validar,[]);
    //return crearControlesCaptura(context,controles).toList();
  }

  //
  //   control  de estado y validaciones
  //

  dynamic validar(Control control, dynamic valor) {}
  dynamic cambiarValor(Control control, dynamic valor) {
    // setState(() {
     switch (control.idControl) {
        case "listaIdiomas":
          print(valor);
          prov!.cambiarIdioma(valor);
          print(ParametrosSistema.idioma);
          break;
      }
    // });

    return entidadCaptura;
  }

  void guardar(BuildContext context, ElementoLista elemento,
      [dynamic argumentos]) {
    if (!formKey.currentState!.validate()) return;
    formKey.currentState!.save();
    prov!.guardarIdioma();
  }

}
