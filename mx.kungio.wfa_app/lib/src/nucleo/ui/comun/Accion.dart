//  librerias internas de flutter

import 'package:flutter/material.dart';

//  librerias importadas flutter

//  librerias  proyecto

import '../../../nucleo/negocio/modelo/ModeloBase.dart';
import 'PaginaAnimacion.dart';

class Accion {
  BuildContext context;
  ElementoLista elemento;
  dynamic argumentos;
  static String paginaActual;
  static String paginaAnterior;
  Accion({this.context, this.elemento, this.argumentos});
  ejecutarRuta() {
    enrutar(context, elemento);
  }

  ejecutarAccion() {
    accionar(context, elemento, argumentos);
  }

  ejecutar() {
    if (elemento != null && elemento.accion != null)
      accionar(context, elemento);
    else if (elemento != null && elemento.ruta != null)
      enrutar(context, elemento, argumentos);
  }

  static regresar(BuildContext context) {
    Navigator.pop(context);
  }

  static hacer(BuildContext context, ElementoLista elemento,
      [dynamic argumentos]) {
    if (elemento != null && elemento.accion != null)
      accionar(context, elemento);
    else if ((elemento != null && elemento.ruta != null) &&
        (elemento.pagina == null))
      enrutar(context, elemento, argumentos);
    else if ((elemento != null) && (elemento.pagina != null))
      animar(context, elemento, argumentos);
  }

  static enrutar(BuildContext context, ElementoLista elemento,
      [dynamic argumentos]) {
    if (elemento.ruta == null ||
        elemento.ruta == "" ||
        elemento.ruta.toUpperCase().contains("REGRESAR")) {
      Navigator.pop(context);
    } else if ((elemento.ruta != null || elemento.ruta != "") &&
        argumentos == null) {
      Navigator.pushNamed(context, elemento.ruta);
    } else if ((elemento.ruta != null || elemento.ruta != "") &&
        argumentos != null) {
      Navigator.of(context).pushNamed(elemento.ruta, arguments: argumentos);
    }
    cambiarPagina(elemento.ruta);
  }

  static cambiarPagina(String pagina) {
    if (paginaActual != null && paginaAnterior != paginaActual)
      paginaAnterior = paginaActual;
    else
      paginaAnterior = pagina;
    if (pagina != null) paginaActual = pagina;
  }

  static accionar(BuildContext context, ElementoLista elemento,
      [dynamic argumentos]) {
    if (elemento.accion != null)
      elemento.accion(context, elemento);
    else if ((elemento.accion != null || elemento.accion != "") &&
        argumentos != null) elemento.accion(context, elemento, argumentos);
  }

  static animar(BuildContext context, ElementoLista elemento,
      [dynamic argumentos]) {
    if ((elemento != null || elemento.pagina != null)) {
      switch (elemento.animacionPagina) {
        case eAnimacionPagina.SlideRightRoute:
          Navigator.push(context, SlideRightRoute(page: elemento.pagina));
          break;
        case eAnimacionPagina.ScaleRoute:
          Navigator.push(context, ScaleRoute(page: elemento.pagina));
          break;
        case eAnimacionPagina.RotationRoute:
          Navigator.push(context, RotationRoute(page: elemento.pagina));
          break;
        case eAnimacionPagina.SizeRoute:
          Navigator.push(context, SizeRoute(page: elemento.pagina));
          break;
        case eAnimacionPagina.FadeRoute:
          Navigator.push(context, FadeRoute(page: elemento.pagina));
          break;
        case eAnimacionPagina.ScaleRotateRoute:
          Navigator.push(context, ScaleRotateRoute(page: elemento.pagina));
          break;
        case eAnimacionPagina.EnterExitRoute:
          Navigator.push(
              context,
              EnterExitRoute(
                  enterPage: elemento.pagina, exitPage: elemento.pagina2));
          break;
        default:
          Navigator.push(context, ScaleRotateRoute(page: elemento.pagina));
          break;
      }
    }
  }
}
