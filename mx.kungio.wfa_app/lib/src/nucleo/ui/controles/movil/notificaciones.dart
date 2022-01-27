//  librerias internas de flutter

import 'package:flutter/material.dart';

//  librerias importadas flutter
//import 'package:flushbar/flushbar.dart';

//  librerias  proyecto

import '../../comun/comun.dart';
import '../../../../nucleo/negocio/modelo/ModeloBase.dart';

class MensajeEmergente {
  static SnackBar notificar(
      BuildContext context,
      GlobalKey<ScaffoldState> _scaffoldKey,
      String mensaje,
      String textoAccion,
      ElementoLista elemento) {
    SnackBar barra = SnackBar(
      content: Text(mensaje),
      action: SnackBarAction(
        label: textoAccion,
        onPressed: () {
          Accion.hacer(context, elemento);
        },
      ),
    );
    //Scaffold.of(context).showSnackBar(barra); // no funciona
    _scaffoldKey.currentState.showSnackBar(barra);
    return barra;
  }
/*      static void  notificar(BuildContext context,String  titulo,String  mensaje, String textoAccion,   ElementoLista  elemento)
     {
          int  duracion =15;
          Flushbar (
              padding: EdgeInsets.all(10),
              title: titulo,
              message: mensaje,
              icon: Icon( Icons.info_outline, size: 30),
              leftBarIndicatorColor: Colors.cyan,
              duration: Duration(seconds: duracion),
              dismissDirection:  FlushbarDismissDirection.HORIZONTAL,
              borderRadius: 8,
           
              forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
              backgroundGradient: LinearGradient( colors: [Colors.deepPurple , Colors.green] , stops: [0.6,1] ),
              boxShadows: [ BoxShadow( color:Colors.black  , offset: Offset(3,3), blurRadius: 3 ) ],
              mainButton: FlatButton( child: Text(textoAccion, style: TextStyle(color: Theme.of(context).accentColor)  ,),
                                     onPressed: () {Accion.hacer(context,elemento);  } ,),      
          ).show(context);
     }  */
}

class Dialogo {
  static void mostrarVentanaOpciones(BuildContext context, String icono,
      String titulo, String mensaje, List<ElementoLista> elementos) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              elevation: 0,
              backgroundColor: Colors.transparent,
              child: crearContenidoDialogoOpciones(
                  context, icono, titulo, mensaje, elementos)
              //title: Text(titulo),
              //content: _crearMensaje(context,mensaje, opcion),
/*               actions: <Widget>[
                RaisedButton(
                  child: Text(opcion),
                  onPressed: ()=> Navigator.of(context).pop(),
                )  
              ],*/
              );
        });
  }

  static void mostrarAlerta(BuildContext context, String icono, String titulo,
      String mensaje, String opcion) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              elevation: 0,
              backgroundColor: Colors.transparent,
              child:
                  crearContenidoDialogo(context, icono, titulo, mensaje, opcion)
              //title: Text(titulo),
              //content: _crearMensaje(context,mensaje, opcion),
/*               actions: <Widget>[
                RaisedButton(
                  child: Text(opcion),
                  onPressed: ()=> Navigator.of(context).pop(),
                )  
              ],*/
              );
        });
  }
}

Widget crearContenidoDialogo(BuildContext context, String icono, String titulo,
    String mensaje, String opcion) {
  return Stack(
    children: <Widget>[
      crearMarcoDialogo(context, titulo, mensaje, opcion),
      crearIconoDialogo(context, icono),
    ],
  );
}

Widget crearContenidoDialogoOpciones(BuildContext context, String icono,
    String titulo, String mensaje, List<ElementoLista> elementos) {
  return Stack(
    children: <Widget>[
      crearMarcoDialogoOpciones(context, titulo, mensaje, elementos),
      crearIconoDialogo(context, icono),
    ],
  );
}

Widget crearIconoDialogo(BuildContext context, String icono) {
  return Positioned(
      top: 7,
      left: 240,
      child: CircleAvatar(
        backgroundColor: Theme.of(context).primaryColor, //  Colores.fondoIcono,
        radius: 30.0,
        child: Iconos.crear(icono, Colores.iconoInformativo, 30.0),
      ));
}

Widget crearMarcoDialogo(
    BuildContext context, String titulo, String mensaje, String opcion) {
  return Container(
    padding: EdgeInsets.only(
      top: 30,
      bottom: 0,
      left: 16,
      right: 16,
    ),
    margin: EdgeInsets.only(top: 30),
    decoration: BoxDecoration(
        color: Colores.fondoMarco,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Colores.sombra,
              blurRadius: 30,
              offset: Offset(0, 3),
              spreadRadius: 1.0)
        ]),
    child: crearElementosDialogo(context, titulo, mensaje, opcion),
  );
}

Widget crearMarcoDialogoOpciones(BuildContext context, String titulo,
    String mensaje, List<ElementoLista> elementos) {
  return Container(
    padding: EdgeInsets.only(
      top: 30,
      bottom: 0,
      left: 16,
      right: 16,
    ),
    margin: EdgeInsets.only(top: 30),
    decoration: BoxDecoration(
        color: Colores.fondoMarco,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Colores.sombra,
              blurRadius: 30,
              offset: Offset(0, 3),
              spreadRadius: 1.0)
        ]),
    child: crearElementosDialogoOpciones(context, titulo, mensaje, elementos),
  );
}

Widget crearElementosDialogo(
    BuildContext context, String titulo, String mensaje, String opcion) {
  return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
    crearTituloDialogo(titulo),
    SizedBox(height: 25.0),
    crearMensajeDialogo(mensaje),
    SizedBox(height: 16.0),
    crearAccionesDialogo(context, opcion),
  ]);
}

Widget crearElementosDialogoOpciones(BuildContext context, String titulo,
    String mensaje, List<ElementoLista> elementos) {
  return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
    crearTituloDialogo(titulo),
    SizedBox(height: 25.0),
    crearMensajeDialogo(mensaje),
    SizedBox(height: 16.0),
    crearAccionesDialogoOpciones(context, elementos),
  ]);
}

Widget crearTituloDialogo(String titulo) {
  return Text(
    titulo,
    style: TextStyle(
        color: Colores.titulo, fontSize: 24, fontWeight: FontWeight.w700),
    textAlign: TextAlign.center,
  );
}

Widget crearMensajeDialogo(String mensaje) {
  return Text(
    mensaje,
    style: TextStyle(
        color: Colores.texto, fontSize: 14, fontWeight: FontWeight.w700),
    textAlign: TextAlign.center,
  );
}

Widget crearAccionesDialogo(BuildContext context, String opcion) {
  return Align(
      child: RaisedButton(
    color: Theme.of(context).primaryColor, // Colores.fondoBotonAccion,
    onPressed: () => Navigator.of(context).pop(),
    child: Text(opcion, style: TextStyle(color: Colores.textoBotonAccion)),
  ));
}

Widget crearAccionesDialogoOpciones(
    BuildContext context, List<ElementoLista> elementos) {
  final List<Widget> opciones = [];
  for (ElementoLista elemento in elementos) {
    final widgetTemp = crearOpcionDialogo(context, elemento);
    opciones..add(widgetTemp);
  }
  return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: opciones);
}

Widget crearOpcionDialogo(BuildContext context, ElementoLista elemento) {
  return Align(
      child: RaisedButton(
    color: Theme.of(context).primaryColor, // Colores.fondoBotonAccion,
    onPressed: () {
      Navigator.of(context).pop();
      Accion.hacer(context, elemento);
    },
    child: Text(elemento.titulo,
        style: TextStyle(color: Colores.textoBotonAccion)),
  ));
}
