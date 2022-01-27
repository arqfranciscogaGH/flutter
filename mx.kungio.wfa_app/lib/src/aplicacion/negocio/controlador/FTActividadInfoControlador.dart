//  librerias internas de flutter
import 'package:flutter/material.dart';

//  librerias importadas flutter

//  librerias  proyecto

import '../../contexto/contexto.dart';

class FTActividadInfoControlador extends ChangeNotifier {
  bool actualizarControles = false;
  dynamic get entidad {
    return ContextoAplicacion.db.tablaActividadInfo.entidad;
  }

  set entidad(dynamic entidad) {
    ContextoAplicacion.db.tablaActividadInfo.entidad = entidad;
    // this._entidad =entidad;
    this.actualizarControles = true;
    notifyListeners();
  }

  List<dynamic> get lista {
    return ContextoAplicacion.db.tablaActividadInfo.lista;
  }

  set lista(List<dynamic> lista) {
    ContextoAplicacion.db.tablaActividadInfo.lista = lista;
    notifyListeners();
  }

  //
  //  metodos de negocio y actualizar  el estado de  entidades
  //
  void limpiar() {
    ContextoAplicacion.db.tablaActividadInfo.lista = null;

    ActividadInfo entidad = ActividadInfo().iniciar();
    ContextoAplicacion.db.tablaActividadInfo.entidad = entidad;
  }

  dynamic iniciarEntidad() {
    ActividadInfo entidad = ActividadInfo().iniciar();
    // se asigna  datos entidad padre
    this.entidad = entidad;
    return entidad;
  }

  //
  //  asignar paramtros de api para consulta
  //
   dynamic asignarParametros( dynamic parmetros,String llaveApi) {
      ContextoAplicacion.db.tablaActividadInfo.configuracion.parmetros=parmetros;
      ContextoAplicacion.db.tablaActividadInfo.configuracion.llaveApi=llaveApi;
   }
  //
  //  metodos de negocio y  acceso  a  base de datos
  //
  consultarEntidad(ActividadInfo entidad, Function metodoRespuestaConsultar) {
    ContextoAplicacion.db.tablaActividadInfo
        .obtenerLista(entidad)
        .then((listaRespuesta) {
      List<ActividadInfo> lista = listaRespuesta.cast<ActividadInfo>().toList();
      this.lista = lista;
      if (metodoRespuestaConsultar != null) metodoRespuestaConsultar(lista);
    });
  }

  void obtenerEntidad(BuildContext context, ElementoLista elemento,
      Function metodorRespuestaObtener) {
    ActividadInfo entidad = ActividadInfo().iniciar();
    entidad.id = elemento.id;
    ContextoAplicacion.db.tablaActividadInfo.obtener(entidad).then((respuesta) {
      if (respuesta != null) {
        this.entidad = respuesta;
        if (metodorRespuestaObtener != null)
          metodorRespuestaObtener(context, elemento, respuesta);
      }
    });
  }

  dynamic obtenerEntidadDeLista(BuildContext context, ElementoLista elemento,
      Function metodorRespuestaObtener) {
    ActividadInfo entidad = ActividadInfo().iniciar();
    entidad.id = elemento.id;
    List<dynamic> lista = this.lista;
    if (lista != null) entidad = lista.where((s) => s.idTarea == entidad.id).first;
    this.entidad = entidad;
    if (metodorRespuestaObtener != null)
      metodorRespuestaObtener(context, elemento, entidad);
    return entidad;
  }

  insertarEntidad(BuildContext context, ElementoLista elemento,
      ActividadInfo entidad, Function metodoRespuestaInsertar) {
    ContextoAplicacion.db.tablaActividadInfo.insertar(entidad).then((respuesta) {
      print(respuesta);
      this.entidad = entidad.fromMap(respuesta);
      if (metodoRespuestaInsertar != null)
        metodoRespuestaInsertar(context, elemento, this.entidad);
    });
  }

  modificarEntidad(BuildContext context, ElementoLista elemento,
      ActividadInfo entidad, Function metodoRespuestaModificar) {
    ContextoAplicacion.db.tablaActividadInfo
        .actualizar(entidad)
        .then((respuesta) {
      this.entidad = respuesta;
      if (metodoRespuestaModificar != null)
        metodoRespuestaModificar(context, elemento, entidad);
    });
  }

  void eliminarEntidad(BuildContext context, ElementoLista elemento,
      Function metodoRespuestaEliminar) {
    ActividadInfo entidad = ActividadInfo().iniciar();
    entidad.id = elemento.id;
    entidad.nombre = elemento.titulo;

    ContextoAplicacion.db.tablaActividadInfo.eliminar(entidad).then((respuesta) {
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
