//  librerias internas de flutter

import 'package:flutter/material.dart';

//  librerias importadas flutter

//  librerias  proyecto

import '../../../nucleo/negocio/modelo/modeloBase.dart';
import '../../../nucleo/negocio/modelo/endidad/ElementoLista.dart';
import 'PaginaAnimacion.dart';


class Accion {
  BuildContext context;
  ElementoLista elemento;
  dynamic argumentos;
  static String paginaActual="";
  static String paginaAnterior="";
  Accion({ required this.context, required this.elemento, this.argumentos});
 
  static hacer(BuildContext context, ElementoLista elemento,
      [dynamic argumentos]) {
    if (elemento != null && elemento.accion != null)
      ejecutarAccion(context, elemento, argumentos);
    else if ((elemento != null && elemento.ruta != null) &&
        (elemento.pagina == null))
      ejecutarRuta(context, elemento, argumentos);
    else if ((elemento != null) && (elemento.pagina != null))
      animar(context, elemento, argumentos);
  }
  static ejecutarAccion(BuildContext context, ElementoLista elemento,
      [dynamic argumentos]) {
    if ((elemento.accion != null || elemento.accion != "") &&  argumentos != null) 
        elemento.accion!(context, elemento, argumentos);
    else if (elemento.accion! != null)
        elemento.accion!(context, elemento);
 
  }
  static ejecutarRuta(BuildContext context, ElementoLista elemento,
      [dynamic argumentos]) {
    if (elemento.ruta == null ||
        elemento.ruta == "" ||
        elemento.ruta!.toUpperCase().contains("REGRESAR")) {
      Navigator.pop(context);
    } else if ((elemento.ruta != null || elemento.ruta != "") &&
        argumentos == null) {
      Navigator.pushNamed(context, elemento.ruta!);
    } else if ((elemento.ruta != null || elemento.ruta != "") &&
        argumentos != null) {
      Navigator.of(context).pushNamed(elemento.ruta!, arguments: argumentos);
    }
    cambiarPagina(elemento.ruta!);
  }

  static cambiarPagina(String pagina) {
    if (paginaActual != null && paginaAnterior != paginaActual)
      paginaAnterior = paginaActual;
    else
      paginaAnterior = pagina;
    if (pagina != null) paginaActual = pagina;
  }
  static animar(BuildContext context, ElementoLista elemento,
      [dynamic argumentos]) {
    if ((elemento != null || elemento.pagina != null)) {
      switch (elemento.animacionPagina!) {
        case eAnimacionPagina.slideRightRoute:
          Navigator.push(context, SlideRightRoute(page: elemento.pagina!));
          break;
        case eAnimacionPagina.scaleRoute:
          Navigator.push(context, ScaleRoute(page: elemento.pagina!));
          break;
        case eAnimacionPagina.rotationRoute:
          Navigator.push(context, RotationRoute(page: elemento.pagina!));
          break;
        case eAnimacionPagina.sizeRoute:
          Navigator.push(context, SizeRoute(page: elemento.pagina!));
          break;
        case eAnimacionPagina.fadeRoute:
          Navigator.push(context, FadeRoute(page: elemento.pagina!));
          break;
        case eAnimacionPagina.scaleRotateRoute:
          Navigator.push(context, ScaleRotateRoute(page: elemento.pagina!));
          break;
        case eAnimacionPagina.enterExitRoute:
          Navigator.push(
              context,
              EnterExitRoute(
                  enterPage: elemento.pagina!, exitPage: elemento.pagina2!));
          break;
        default:
          Navigator.push(context, ScaleRotateRoute(page: elemento.pagina!));
          break;
      }
    }
  }

  static regresar(BuildContext context) {
    Navigator.pop(context);
  }

}
