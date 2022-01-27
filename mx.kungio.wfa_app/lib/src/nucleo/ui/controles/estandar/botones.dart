//  librerias internas de flutter

import 'package:flutter/material.dart';

//  librerias importadas flutter

//  librerias  proyecto

import '../../comun/comun.dart';

import '../../../../nucleo/negocio/modelo/ModeloBase.dart';

// no eliminar hasta quitarlo en paginas
class Boton {
  Widget crearBotonFlotanteSimple(String id, String titulo, String mensajeAyuda,
      IconData icono, Function accion) {
    Widget control = FloatingActionButton(
      onPressed: () {
        accion();
      },
      tooltip: mensajeAyuda,
      child: Icon(icono),
    );
    return control;
  }

  static Widget crearBotonFlotable(String id, String titulo,
      String mensajeAyuda, IconData icono, Function accion) {
    Widget control = FloatingActionButton(
      onPressed: () {
        accion();
      },
      tooltip: mensajeAyuda,
      child: Icon(icono),
    );
    return control;
  }

  static FloatingActionButton crearBotonFlotante(
      BuildContext context, ElementoLista elemento) {
/*     if (elemento.color==null )
       elemento.color=Theme.of(context).backgroundColor ; */
    FloatingActionButton boton = FloatingActionButton(
      heroTag: "btn" + elemento.id.toString(),
      onPressed: () {
        Accion.hacer(context, elemento);
      },
      tooltip: elemento.descripcion,
      child: Iconos.crear(elemento.icono, elemento.color, elemento.size),
    );
    return boton;
  }

  static List<Widget> crearBotonesFlotantes(
      BuildContext context, List<ElementoLista> elementos) {
    List<Widget> botones = List<Widget>();
    for (ElementoLista elemento in elementos) {
      Widget boton = FloatingActionButton(
        onPressed: () {
          Accion.hacer(context, elemento);
        },
        tooltip: elemento.descripcion,
        child: Iconos.crear(elemento.icono, elemento.color, elemento.size),
      );
      botones.add(boton);
    }

    return botones;
  }

  Widget crearBotonLink(IconData icon) {
    return InkWell(
      child: Icon(icon),
      onTap: () {
        print(" on tap ");
      },
    );
  }

  Widget crearBotonIconoSimple(
      BuildContext context, ElementoLista elemento, IconData icon) {
    //return IconButton (  icon: Icon(icon),onPressed: () {  }, );
    return IconButton(
        icon: Iconos.crear(elemento.icono, elemento.color, elemento.size),
        onPressed: () {
          Accion.hacer(context, elemento);
        });
  }

  static Widget crearBotonIcono(BuildContext context, ElementoLista elemento) {
    Widget boton = IconButton(
        icon: Iconos.crear(elemento.icono, elemento.color, elemento.size),
        tooltip: elemento.descripcion,
        onPressed: () {
          Accion.hacer(context, elemento);
        });
    return boton;
    //return _crearBotonBase( boton,context,elemento );
  }

  static Widget crearBotonIconoCon(
      BuildContext context, ElementoLista elemento) {
    Widget boton = IconButton(
        icon: Iconos.crear(elemento.icono, elemento.color, elemento.size),
        tooltip: elemento.descripcion,
        onPressed: () {
          Accion.hacer(context, elemento);
        });
    return _crearBotonBase(boton, context, elemento);
  }

  Widget crearBotonPlano(BuildContext context, ElementoLista elemento) {
    Widget boton = FlatButton.icon(
        icon: Iconos.crear(elemento.icono, elemento.color, elemento.size),
        label: Text(elemento.titulo),
        onPressed: () {
          Accion.hacer(
            context,
            elemento,
          );
        });
    return _crearBotonBase(boton, context, elemento);
  }

  Widget crearBotonBordes(BuildContext context, ElementoLista elemento) {
    Widget boton = RaisedButton.icon(
        icon: Iconos.crear(elemento.icono, elemento.color, elemento.size),
        label: Text(elemento.titulo),
        onPressed: () {
          Accion.hacer(context, elemento);
        });
    return _crearBotonBase(boton, context, elemento);
  }

  Widget crearBotonOutLine(BuildContext context, ElementoLista elemento) {
    Widget boton = OutlineButton.icon(
        icon: Iconos.crear(elemento.icono, elemento.color, elemento.size),
        label: Text(elemento.titulo),
        shape: StadiumBorder(),
        onPressed: () {
          Accion.hacer(context, elemento);
        });
    return _crearBotonBase(boton, context, elemento);
  }

  static Widget _crearBotonBase(
      Widget boton, BuildContext context, ElementoLista elemento) {
    return _crearContendorBoton(boton, elemento);
  }

  static Widget _crearContendorBoton(Widget boton, ElementoLista elemento) {
    return Padding(
      padding: EdgeInsets.all(10.2),
      child: Center(
        child: Column(
          children: <Widget>[
            boton != null ? boton : null,
            elemento.subitulo != null
                ? SizedBox(
                    height: 2,
                  )
                : null,
            elemento.subitulo != null ? Text(elemento.subitulo) : null,
          ],
        ),
      ),
    );
  }
}
