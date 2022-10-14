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




  class botones_pagina extends StatefulWidget {
  botones_pagina(
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
  static String ruta = "botones_pagina";


  @override
  _botones_paginas_state createState() => _botones_paginas_state();
}

class _botones_paginas_state extends State<botones_pagina> {
  int _counter = 0;
 //  inicializar  widget
  @override
  void initState() {
    super.initState();
    widget.pagina = botones_pagina.ruta;
  }

  void _incrementCounter() async {
    // setState(() {
       final prov =Provider.of<ParametrosSistemaCE>(context,listen: false);
 
      //  final prov= controladorEstadoTema.obtenerEstado(context);
       print(ParametrosSistema.idioma);

       if (ParametrosSistema.idioma!="es")
       {
           await prov.cambiarIdioma("es");
       }
       else
       {
          await  prov.cambiarIdioma("en");
      }

       print(ParametrosSistema.idioma);
       print(ParametrosSistema.colorTema);
       _counter++;
    // });
  }

  @override
  Widget build(BuildContext context) {
 
     widget.titulo=Traductor.obtenerEtiquetaSeccion(widget.pagina!,'titulo');
     print (widget.titulo);

    print(ParametrosSistema.idioma);
    print(ParametrosSistema.colorTema);

    ElementoLista  elemento = ElementoLista(icono: 'menu',  accion: ejecutar,    titulo: 'prueba' , subtitulo: "x", descripcion: "es una prueba");

    ElementoLista  elemento2 = ElementoLista( icono: 'menu', accion: ejecutar,   titulo: 'prueba' , subtitulo: "x", descripcion: "es una prueba");

    return Scaffold(
      appBar: AppBar(title: Text(widget.titulo!) ),
      drawer: Menulateral.crearMenu(context, OpcionesMenus.obtenerMenuPrincipal(), widget.titulo!),
      body: Center(
         child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),

            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
 
             Boton.crearBotonLinkIcono(context,elemento),
             Boton.crearBotonLinkTexto(context,elemento),
             Boton.crearBotonIcono( context, elemento),
             Boton.crearBotonPlano( context, elemento),
             Boton.crearBotonBordes( context, elemento),
             Boton.crearBotonOutLine( context, elemento),
             
             

            //  Icono.crear(elemento.icono!),
                // FloatingActionButton(
                //   child: Icon(Icons.access_time),
                //   elevation: 50.0,
                //   backgroundColor: Colors.amber,
                // ),
                // MaterialButton(
                //   minWidth: 200.0,
                //   height: 40.0,
                //   onPressed: () {},
                //   color: Colors.lightBlue,
                //   child: Text('Material Button',
                //       style: TextStyle(color: Colors.white)),
                // ),
                // RaisedButton(
                //   disabledColor: Colors.amber,
                //   child: Text("Raised Button"),
                //   splashColor: Colors.amber,
                //   color: Colors.blueAccent,
                //   onPressed: ()  {
                //     print("Hola Raised Button");
                //   },
                // ),
                // FlatButton(
                //   child: new Text('Flat Button'),
                //   onPressed: ()  {
                //     print("Hola Raised Button");
                //   },
                // )
             ],
        ),
      ),
    
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Boton.crearBotonFlotante(
        context,  ElementoLista( icono: "save" ,accion:  ejecutar ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  ejecutar(BuildContext context, ElementoLista elemento, [dynamic argumetos])
  {
    print ("ejecuto ");
    _incrementCounter();
  }
}