//  librerias internas de flutter

import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui';

//  librerias importadas flutter

 import 'package:provider/provider.dart';
// import 'package:gradient_app_bar/gradient_app_bar.dart';

//  librerias  proyecto


import '../../../../inicializacion/inicializacion.dart';
import '../../../../configuracion/configuracion.dart';
import '../../../../administracion/administracion.dart';

import '../../../../nucleo/nucleo.dart';
import '../../../../aplicacion/aplicacion.dart';


//  librerias externas  flutter

import '../../../../paquetesExternos/paquetesExternos.dart';



class prueba_pagina extends StatefulWidget {
  prueba_pagina(
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
  static String ruta = "pagina_prueba";

  @override
  _prueba_pagina_state createState() => _prueba_pagina_state();
}

class _prueba_pagina_state extends State<prueba_pagina> {
  //  declaración de variables

 
  //  inicializar  widget
  @override
  void initState() {
 widget.pagina = prueba_pagina.ruta;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

     widget.titulo=Traductor.obtenerEtiquetaSeccion(widget.pagina!,'titulo');
     print (widget.titulo);

    Preferencias.iniciar();
    Preferencias.guardar("id","xxx");

    // final  provTema =Provider.of<controladorEstadoTema>(context,listen: false);
    if  (ParametrosSistema.esModoObscuro)
    {
      ParametrosSistema.esModoObscuro=false;
      //  provTema.cambiarModoClaro();
    }
    else 
    {
      ParametrosSistema.esModoObscuro=true;
      // provTema.cambiarModoObscuro();
    }


    String  valor =Preferencias.obtener("id","valor");
    print (Sesion.nombre);
    AdministradorSesion.asignar(nombre: "hello");
    AdministradorSesion.obtener();
    print (Sesion.nombre);

List<ElementoLista> elementos=[];

ElementoLista elemento =ElementoLista( id:1 ,  icono: "save",   accion:  ejecutar );
elementos.add(elemento);
ElementoLista elemento2 =ElementoLista( id:2 , icono: "info",    accion:  ejecutar  );
elementos.add(elemento2);

    return Scaffold(
      appBar: AppBar(title: Text(widget.titulo!)),
      drawer: Menulateral.crearMenu(context, OpcionesMenus.obtenerMenuPrincipal(), widget.titulo!),
      body: Stack(
        children: <Widget>[
          _fondoApp(),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                //  _titulos(),
                SizedBox(height: 130.0),
              ],
            ),
          )
        ],
      ),
          //   body: mostrarCaptura(context, formKey, cambiarValor, validar,
          // definicionControles, entidadCaptura),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:  Boton.crearRenglonBotonesFlotantes(context,elementos  ),
    );
  }

  Widget _fondoApp() {
  
    final gradiente = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: FractionalOffset(0.0, 0.6),
              end: FractionalOffset(0.0, 1.0),
              colors: <Color>[
            //Colors.grey ,
            Theme.of(context).primaryColorLight,
            Color.fromRGBO(82, 72, 72, 1.0)
          ])),
    );

    final cajaRosa = Transform.rotate(
        angle: -pi / 6.0,
        child: Container(
          height: 340.0,
          width: 340.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: FractionalOffset(0.0, 0.4),
                end: FractionalOffset(0.0, 1.0),
                colors: <Color>[
                  //Colors.grey ,
                  Theme.of(context).primaryColorLight,
                  Theme.of(context).primaryColor,
                ]),
            borderRadius: BorderRadius.circular(80.0),
            // gradient: LinearGradient(

            // )
          ),
        ));

    return Stack(
      children: <Widget>[
        gradiente,
        Positioned(top: -185.0, child: cajaRosa),
        _titulos(),
      ],
    );
  }

  Widget _titulos() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 1, horizontal: 42),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 35.0),
            Text('Las cosas van mejor con KUNGIO ',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
  ejecutar(BuildContext context, ElementoLista elemento, [dynamic argumetos])
  {
    print ("ejecuto ");
  }
}
