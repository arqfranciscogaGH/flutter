//  librerias internas de flutter
import 'package:flutter/material.dart';

//  librerias importadas flutter

//  librerias  proyecto

import '../../contexto/contexto.dart';

class EstadisticasFlujoControlador extends ChangeNotifier {
  bool actualizarControles = false;
  dynamic get entidad {
    return ContextoAplicacion.db.tablaEstadisticasFlujo.entidad;
  }

  set entidad(dynamic entidad) {
    ContextoAplicacion.db.tablaEstadisticasFlujo.entidad = entidad;
    // this._entidad =entidad;
    this.actualizarControles = true;
    notifyListeners();
  }

  List<dynamic> get lista {
    return ContextoAplicacion.db.tablaEstadisticasFlujo.lista;
  }

  set lista(List<dynamic> lista) {
    ContextoAplicacion.db.tablaEstadisticasFlujo.lista = lista;
    notifyListeners();
  }

  //
  //  metodos de negocio y actualizar  el estado de  entidades
  //
  void limpiar() {
    ContextoAplicacion.db.tablaEstadisticasFlujo.lista = null;

    EstadisticasFlujo entidad = EstadisticasFlujo().iniciar();
    ContextoAplicacion.db.tablaEstadisticasFlujo.entidad = entidad;
  }

  dynamic iniciarEntidad() {
    EstadisticasFlujo entidad = EstadisticasFlujo().iniciar();
    // se asigna  datos entidad padre
    this.entidad = entidad;
    return entidad;
  }

  //
  //  asignar paramtros de api para consulta
  //
   dynamic asignarParametros( dynamic parmetros,String llaveApi) {
      ContextoAplicacion.db.tablaEstadisticasFlujo.configuracion.parmetros=parmetros;
      ContextoAplicacion.db.tablaEstadisticasFlujo.configuracion.llaveApi=llaveApi;
   }
  //
  //  metodos de negocio y  acceso  a  base de datos
  //
  consultarEntidad(EstadisticasFlujo entidad, Function metodoRespuestaConsultar) {
    ContextoAplicacion.db.tablaEstadisticasFlujo
        .obtenerLista(entidad)
        .then((listaRespuesta) {
      List<EstadisticasFlujo> lista = listaRespuesta.cast<EstadisticasFlujo>().toList();
      this.lista = lista;
      if (metodoRespuestaConsultar != null) metodoRespuestaConsultar(lista);
    });
  }

  void obtenerEntidad(BuildContext context, ElementoLista elemento,
      Function metodorRespuestaObtener) {
    EstadisticasFlujo entidad = EstadisticasFlujo().iniciar();
    entidad.id = elemento.id;
    ContextoAplicacion.db.tablaEstadisticasFlujo.obtener(entidad).then((respuesta) {
      if (respuesta != null) {
        this.entidad = respuesta;
        if (metodorRespuestaObtener != null)
          metodorRespuestaObtener(context, elemento, respuesta);
      }
    });
  }

  dynamic obtenerEntidadDeLista(BuildContext context, ElementoLista elemento,
      Function metodorRespuestaObtener) {
    EstadisticasFlujo entidad = EstadisticasFlujo().iniciar();
    entidad.id = elemento.id;
    List<dynamic> lista = this.lista;
    if (lista != null) entidad = lista.where((s) => s.idTarea == entidad.id).first;
    this.entidad = entidad;
    if (metodorRespuestaObtener != null)
      metodorRespuestaObtener(context, elemento, entidad);
    return entidad;
  }

  insertarEntidad(BuildContext context, ElementoLista elemento,
      EstadisticasFlujo entidad, Function metodoRespuestaInsertar) {
    ContextoAplicacion.db.tablaEstadisticasFlujo.insertar(entidad).then((respuesta) {
      print(respuesta);
      this.entidad = entidad.fromMap(respuesta);
      if (metodoRespuestaInsertar != null)
        metodoRespuestaInsertar(context, elemento, this.entidad);
    });
  }

  modificarEntidad(BuildContext context, ElementoLista elemento,
      EstadisticasFlujo entidad, Function metodoRespuestaModificar) {
    ContextoAplicacion.db.tablaEstadisticasFlujo
        .actualizar(entidad)
        .then((respuesta) {
      this.entidad = respuesta;
      if (metodoRespuestaModificar != null)
        metodoRespuestaModificar(context, elemento, entidad);
    });
  }

  void eliminarEntidad(BuildContext context, ElementoLista elemento,
      Function metodoRespuestaEliminar) {
    EstadisticasFlujo entidad = EstadisticasFlujo().iniciar();
    entidad.id = elemento.id;
    entidad.nombre = elemento.titulo;

    ContextoAplicacion.db.tablaEstadisticasFlujo.eliminar(entidad).then((respuesta) {
      // if (respuesta!=null)
      // {
      List<dynamic> lista = this.lista;
      lista.removeWhere((item) => item.id == entidad.id);
      this.lista = lista;
      this.iniciarEntidad();
      if (metodoRespuestaEliminar != null)
        metodoRespuestaEliminar(context, elemento, respuesta);
      // }
    });
  }
}
