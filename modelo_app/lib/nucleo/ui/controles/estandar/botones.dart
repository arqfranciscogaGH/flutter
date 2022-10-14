//  librerias internas de flutter

import 'package:flutter/material.dart';


//  librerias importadas flutter

//  librerias  proyecto

import '../../../nucleo.dart';


// import '../../comun/comun.dart';
// import '../../Iconos/iconos.dart';
// import '../../../../nucleo/negocio/modelo/ModeloBase.dart';

// no eliminar hasta quitarlo en paginas

class Boton {
  static Widget crearBotonLinkIcono(BuildContext context, ElementoLista elemento) {
     elemento =cambioColores(elemento);
     return InkWell(
      
      highlightColor: Colors.grey.withOpacity(0.4),
      splashColor: Colors.black.withOpacity(0.5),
      child: Icono.crear(elemento.icono!, elemento.colorIcono, elemento.tamanoIcono!),
      onTap: () {
         print(" on tap ");
         Accion.hacer(context, elemento);
      },
    );
  }
    static Widget crearBotonLinkTexto(BuildContext context, ElementoLista elemento) {
    elemento =cambioColores(elemento);
    return InkWell(
      highlightColor: Colors.grey.withOpacity(0.4),
      splashColor: Colors.black.withOpacity(0.5),
      borderRadius: BorderRadius.circular(1000),
      child:  Text( elemento.titulo! , style: TextStyle(fontSize: elemento.tamanoFuente!, color: Colores.obtener(elemento.colorTexto))),
      onTap: () {
         print(" on tap ");
         Accion.hacer(context, elemento);
      },
    );
  }
  static Widget crearBotonIcono(BuildContext context, ElementoLista elemento) {
    elemento =cambioColores(elemento);  
    Widget boton = IconButton(
        icon: Icono.crear(elemento.icono!, elemento.colorIcono, elemento.tamanoIcono!),
   
         color: Colors.green,
         highlightColor: Colors.red,
         hoverColor: Colors.black,
         focusColor: Colors.purple,
         splashColor: Colors.yellow,
         disabledColor: Colors.grey,
        tooltip: elemento.descripcion,
        onPressed: () {
          print(" on tap ");
          Accion.hacer(context, elemento);
        });
    return boton;
  }
  static Widget crearBotonPlano(BuildContext context, ElementoLista elemento) {
    elemento =cambioColores(elemento);
    Widget boton = TextButton.icon(
        
        icon: Icono.crear(elemento.icono!, elemento.colorIcono, elemento.tamanoIcono!),
        label: Text(elemento.titulo! , style: TextStyle(fontSize: elemento.tamanoFuente!, color: Colores.obtener(elemento.colorTexto))),
        // style: TextButton.styleFrom(
        //             primary: Colores.obtener(elemento.colorTexto), backgroundColor:Colores.obtener(elemento.colorFondo)),
        onPressed: () {
          Accion.hacer(context, elemento );
        });
    return boton;
  }
  static Widget crearBotonBordes(BuildContext context, ElementoLista elemento) {
    elemento =cambioColores(elemento); 
    Widget boton = ElevatedButton.icon(
 
    icon: Icono.crear(elemento.icono!, elemento.colorIcono, elemento.tamanoIcono!),
    label: Text(elemento.titulo! , style: TextStyle(fontSize: elemento.tamanoFuente!, color: Colores.obtener(elemento.colorTexto))),
    style: TextButton.styleFrom(
          primary: Colores.obtener(elemento.colorTexto), backgroundColor:Colores.obtener(elemento.colorFondo)),
    onPressed: () {
      Accion.hacer(context, elemento);
    });
    return boton;
  }
  static Widget crearBotonOutLine(BuildContext context, ElementoLista elemento) {
    elemento =cambioColores(elemento);
    Widget boton =  OutlinedButton.icon(
        icon: Icono.crear(elemento.icono!, elemento.colorIcono, elemento.tamanoIcono!),
        label: Text(elemento.titulo!, style: TextStyle(fontSize: elemento.tamanoFuente!, color: Colores.obtener(elemento.colorTexto))),
        // shape: StadiumBorder(),
        onPressed: () {
          Accion.hacer(context, elemento);
        });
    return boton;
  }

 static Widget crearBotonIconoContenedor(
      BuildContext context, ElementoLista elemento) {
    Widget boton = crearBotonIcono(context,elemento);
    return _crearContendorBoton(boton, elemento);
  }
   static Widget crearBotonPlanoContenedor(BuildContext context, ElementoLista elemento) {
    Widget boton = crearBotonPlano(context,elemento);
    return _crearContendorBoton(boton, elemento);
  }
  static Widget crearBotonBordesContenedor(
      BuildContext context, ElementoLista elemento) {
    Widget boton = crearBotonBordes(context,elemento);
    return _crearContendorBoton(boton, elemento);
  }
  static Widget crearBotonOutLineContenedor(
      BuildContext context, ElementoLista elemento) {
    Widget boton = crearBotonIcono(context,elemento);
    return _crearContendorBoton(boton, elemento);
  }
 
 

  static Widget _crearContendorBoton(Widget boton, ElementoLista elemento) {

   if ( elemento.subtitulo == null  )
      elemento.subtitulo =  "";

    Text texto=Text(elemento.subtitulo!);
    return Padding(
      padding: EdgeInsets.all(5.2),
      child: Center(
        child: Column(
          children: <Widget>[
            // boton != null ? boton : null,
            boton,
            elemento.subtitulo! != null ? SizedBox(   height: 0 ) : SizedBox(   height: 0 ),
            elemento.subtitulo! != null ? Text(elemento.subtitulo!) : Text(""),
            texto,
          ],
        ),
      ),
    );
  }

 

  static Widget crearColumnaBotonesFlotantes( BuildContext context, List<ElementoLista> elementos)
  { 
    List<Widget>botones= crearBotonesFlotantes(context,elementos,'C');
    Column contenedor = Column(children: botones, mainAxisAlignment: MainAxisAlignment.center );
    return contenedor;
  }
    static Widget crearRenglonBotonesFlotantes( BuildContext context, List<ElementoLista> elementos)
  { 
    List<Widget>botones= crearBotonesFlotantes(context,elementos,'R');
    Row contenedor = Row(children: botones , mainAxisAlignment: MainAxisAlignment.center );
    return contenedor;
  }
  static FloatingActionButton crearBotonFlotante(
      BuildContext context, ElementoLista elemento) {

      Color color=Theme.of(context).backgroundColor ; 
      elemento =cambioColores(elemento);
      FloatingActionButton boton = FloatingActionButton(
      heroTag: "btn" + elemento.id.toString(),
      backgroundColor: Colores.obtener(elemento.colorFondo),
      onPressed: () {
        Accion.hacer(context, elemento);
      },
      tooltip: elemento.descripcion,
      child: Icono.crear(elemento.icono!,elemento.colorIcono, elemento.tamanoIcono),
    );
    return boton;
  }
  static List<Widget> crearBotonesFlotantes(
      BuildContext context, List<ElementoLista> elementos, String tipo) {
      List<Widget> botones = [];
      for (ElementoLista elemento in elementos) {
              Widget boton = crearBotonFlotante(context,elemento);
             botones.add(boton);
             botones.add( tipo=='R' ? SizedBox( width: 1 ) : SizedBox( height: 1 ) ) ;
    }
    return  botones;
  }
  static ElementoLista cambioColores( ElementoLista elemento) {
    elemento.colorFondo=elemento.colorFondo ?? ParametrosSistema.colorBotonFondo; 
    elemento.colorTexto=elemento.colorTexto ?? ParametrosSistema.colorBotonTexto;      
    elemento.colorIcono=elemento.colorIcono ?? ParametrosSistema.colorBotonIcono; 
    elemento.colorBorde=elemento.colorBorde ?? ParametrosSistema.colorBotonBorde;   

    elemento.tamanoFuente=elemento.tamanoFuente ?? ParametrosSistema.tamanoFuente; 
    elemento.tamanoIcono=elemento.tamanoIcono ?? ParametrosSistema.tamanoIcono;   
    return elemento;
  }
}
