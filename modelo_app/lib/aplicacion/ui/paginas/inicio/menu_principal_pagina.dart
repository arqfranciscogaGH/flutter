//  librerias internas de flutter

import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui';

//  librerias importadas flutter

//  librerias  proyecto


import '../../../../inicializacion/inicializacion.dart';
import '../../../../configuracion/configuracion.dart';
import '../../../../administracion/administracion.dart';

import '../../../../nucleo/nucleo.dart';
import '../../../../aplicacion/aplicacion.dart';

import '../../../../nucleo/negocio/controladorEstado/controladorEstado.dart';


//  librerias externas  flutter

import '../../../../paquetesExternos/paquetesExternos.dart';




class menu_principal_pagina extends StatefulWidget {
  menu_principal_pagina(
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
  static String ruta = "menu_principal_pagina";

  @override
  _menu_principal_pagina_state createState() => _menu_principal_pagina_state();
}
class _menu_principal_pagina_state extends State<menu_principal_pagina> {
  //  declaración de variables

 
  //  inicializar  widget
  @override
  void initState() {
    widget.pagina =menu_principal_pagina.ruta;
    super.initState();
  }
  @override
  void dispose() {
      super.dispose();
  }

  @override
  Widget build(BuildContext context) {
      Responsivo.identifciarDispositivo(context);

    widget.titulo=Traductor.obtenerEtiquetaSeccion(menu_principal_pagina.ruta,'titulo');
    print (widget.titulo);

    print(ParametrosSistema.idioma);
    print(ParametrosSistema.colorTema);

    late  ElementoLista elementoLista;
  
    elementoLista= ElementoLista();
    elementoLista.titulo="fga2";

    elementoLista =InjeccionDependencia.obtener<ElementoLista>();
    elementoLista.titulo="XXX";
  
    elementoLista =InjeccionDependencia.obtener<ElementoLista>();

    // widget.titulo==null ?? "";
        // idioma = IdiomaAplicacion.obt(context);
        // idioma = IdiomaAplicacion.obtener(context, idioma);

        // widget.titulo = idioma.obtenerElemento('pagina_menu_principal', "titulo");
        
        // widget.titulo = idioma.obtenerElemento(widget.pagina, "titulo");


    return Scaffold(
      appBar: AppBar(title: Text(widget.titulo!)),
      drawer: Menulateral.crearMenu(context, OpcionesMenus.obtenerMenuPrincipal(), widget.titulo!, ParametrosSistema.paginaAccesso),
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
            Color.fromARGB(255, 56, 9, 9)
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
}
