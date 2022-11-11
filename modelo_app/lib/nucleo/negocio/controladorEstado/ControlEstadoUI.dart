import 'package:flutter/material.dart';

//  librerias importadas flutter

//  librerias  proyecto

import '../../../aplicacion/contexto/ContextoAplicacion.dart';

class ControlEstadoUI extends ChangeNotifier {
  //
  //  metodos
  //

  //
  //  metodos de negocio y actualizar  el estado de  entidades
  //
  dynamic iniciarEntidad<T extends EntidadBase>(AccesoTabla<T> tabla) {
    tabla.entidad = tabla.iniciar();
    return tabla.entidad;
  }

  consultarTabla<T extends EntidadBase>(AccesoTabla<T> tabla,
      [Function? metodoRespuesta = null]) {
    tabla.consultarTabla(tabla.entidad).then((respuesta) {
      if (metodoRespuesta != null)
        metodoRespuesta(respuesta);
      else
        this.actualizar();
    });
  }

  filtrarTabla<T extends EntidadBase>(
      AccesoTabla<T> tabla, String campo, dynamic valor,
      [Function? metodoRespuesta = null]) {
    tabla.filtrarTabla(tabla.entidad, campo, valor).then((respuesta) {
      if (metodoRespuesta != null)
        metodoRespuesta(respuesta);
      else
        this.actualizar();
    });
  }

  filtrarLista<T extends EntidadBase>(AccesoTabla<T> tabla,
      BuildContext context, ElementoLista elemento, String campo, dynamic valor,
      [Function? metodorRespuestaObtener = null]) {
    dynamic respuesta;
    tabla.entidad == tabla.iniciar();
    tabla.entidad.id = elemento.id;
    List<dynamic> lista = tabla.resultado.datos;
    if (lista != null) respuesta = lista.where((s) => s[campo] == valor).first;
    tabla.entidad =
        respuesta != null ? tabla.entidad.fromMap(respuesta) : tabla.iniciar();
    if (metodorRespuestaObtener != null)
      metodorRespuestaObtener(context, elemento, tabla.entidad);
  }

  void obtener<T extends EntidadBase>(
      AccesoTabla<T> tabla, BuildContext context, ElementoLista elemento,
      [Function? metodoRespuesta = null]) {
    dynamic entidad = tabla!.iniciar();
    entidad.id = elemento.id;
    tabla.obtener(entidad).then((respuesta) {
      print(respuesta);
      if (respuesta != null) {
        tabla.entidad = respuesta;
        if (metodoRespuesta != null)
          metodoRespuesta(context, elemento, entidad);
      }
    });
  }

  dynamic entidad<T extends EntidadBase>(AccesoTabla<T> tabla) {
    return tabla.entidad;
  }

  List<dynamic> lista<T extends EntidadBase>(AccesoTabla<T> tabla) {
    return tabla.lista;
  }

  //
  //  metodos para  actualizar Interface de  Usuario  con  Provider
  //
  void actualizar() {
    notifyListeners();
  }
}
