//  librerias internas de flutter

import 'package:flutter/material.dart';


import 'dart:math';


//  librerias importadas flutter

// import 'package:provider/provider.dart';

//  librerias  proyecto






import '../../../../configuracion/configuracion.dart';
import '../../../../nucleo/negocio/modelo/ModeloBase.dart';
import '../../../../nucleo/ui/ui.dart';
import '../../../../nucleo/negocio/controladorEstado/controladorEstadoTema.dart';
import '../../../../paquetesExternos/paquetesExternos.dart';
import '../../../../administracion/administracion.dart';



class pagina_prueba extends StatefulWidget {
  pagina_prueba({
    Key? key,
    this.pagina,
    this.titulo,
    this.paginaSiguiente,
    this.paginaAnterior,
  }) : super(key: key);
  String? titulo;
  String? pagina;
  String?  paginaSiguiente ;
  String? paginaAnterior;

  @override
  _pagina_prueba_state createState() => _pagina_prueba_state();
}

class _pagina_prueba_state extends State<pagina_prueba> {
  //  declaración de variables

 
  //  inicializar  variables
  @override
  void initState() {
    widget.pagina = "pagina_prueba";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   // IdiomaAplicacion  idioma = IdiomaAplicacion.obtener(context, idioma);
   // widget.titulo = idioma.obtenerElemento(widget.pagina, "titulo");
   widget.titulo=widget.titulo??"";

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



ParametrosSistema.primario=Colors.red;


String  valor =Preferencias.obtener("id","valor");
print (Sesion.nombre);
AdministrarSesion.asignar(nombre: "hello");
AdministrarSesion.obtener();
print (Sesion.nombre);
    return Scaffold(
      appBar: AppBar(title: Text(widget.titulo!)),
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
      drawer: Menulateral.crearMenu(context, OpcionesMenus.obtenerMenuPrincipal(), "Detalle de Directorio"),
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
}
