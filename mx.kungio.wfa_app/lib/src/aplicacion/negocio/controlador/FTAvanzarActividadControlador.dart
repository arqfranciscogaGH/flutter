//  librerias internas de flutter
import 'package:flutter/material.dart';

//  librerias importadas flutter

//  librerias  proyecto

import '../../contexto/contexto.dart';

class FTAvanzarActividadControlador extends ChangeNotifier {
  bool actualizarControles = false;
  dynamic get entidad {
    return ContextoAplicacion.db.tablaFTAvanzarActividad.entidad;
  }

  set entidad(dynamic entidad) {
    ContextoAplicacion.db.tablaFTAvanzarActividad.entidad = entidad;
    // this._entidad =entidad;
    this.actualizarControles = true;
    notifyListeners();
  }

  List<dynamic> get lista {
    return ContextoAplicacion.db.tablaFTAvanzarActividad.lista;
  }

  set lista(List<dynamic> lista) {
    ContextoAplicacion.db.tablaFTAvanzarActividad.lista = lista;
    notifyListeners();
  }

  //
  //  metodos de negocio y actualizar  el estado de  entidades
  //
  void limpiar() {
    ContextoAplicacion.db.tablaFTAvanzarActividad.lista = null;

    FTAvanzarActividad entidad = FTAvanzarActividad().iniciar();
    ContextoAplicacion.db.tablaFTAvanzarActividad.entidad = entidad;
  }

  dynamic iniciarEntidad() {
    FTAvanzarActividad entidad = FTAvanzarActividad().iniciar();
    // se asigna  datos entidad padre
    this.entidad = entidad;
    return entidad;
  }

  //
  //  asignar paramtros de api para consulta
  //
   dynamic asignarParametros( dynamic parmetros,String llaveApi) {
      ContextoAplicacion.db.tablaFTAvanzarActividad.configuracion.parmetros=parmetros;
      ContextoAplicacion.db.tablaFTAvanzarActividad.configuracion.llaveApi=llaveApi;
   }
  //
  //  metodos de negocio y  acceso  a  base de datos
  //
  consultarEntidad(FTAvanzarActividad entidad, Function metodoRespuestaConsultar) {
    ContextoAplicacion.db.tablaFTAvanzarActividad
        .obtenerLista(entidad)
        .then((listaRespuesta) {
      List<FTAvanzarActividad> lista = listaRespuesta.cast<FTAvanzarActividad>().toList();
      this.lista = lista;
      if (metodoRespuestaConsultar != null) metodoRespuestaConsultar(lista);
    });
  }

  void obtenerEntidad(BuildContext context, ElementoLista elemento,
      Function metodorRespuestaObtener) {
    FTAvanzarActividad entidad = FTAvanzarActividad().iniciar();
    entidad.id = elemento.id;
    ContextoAplicacion.db.tablaFTAvanzarActividad.obtener(entidad).then((respuesta) {
      if (respuesta != null) {
        this.entidad = respuesta;
        if (metodorRespuestaObtener != null)
          metodorRespuestaObtener(context, elemento, respuesta);
      }
    });
  }

  dynamic obtenerEntidadDeLista(BuildContext context, ElementoLista elemento,
      Function metodorRespuestaObtener) {
    FTAvanzarActividad entidad = FTAvanzarActividad().iniciar();
    entidad.id = elemento.id;
    List<dynamic> lista = this.lista;
    if (lista != null) entidad = lista.where((s) => s.idInstancia == entidad.id).first;
    this.entidad = entidad;
    if (metodorRespuestaObtener != null)
      metodorRespuestaObtener(context, elemento, entidad);
    return entidad;
  }

  insertarEntidad(BuildContext context, ElementoLista elemento,
      FTAvanzarActividad entidad, Function metodoRespuestaInsertar) {
    ContextoAplicacion.db.tablaFTAvanzarActividad.insertar(entidad).then((respuesta) {
      print(respuesta);
      this.entidad = entidad.fromMap(respuesta);
      if (metodoRespuestaInsertar != null)
        metodoRespuestaInsertar(context, elemento, this.entidad);
    });
  }

  modificarEntidad(BuildContext context, ElementoLista elemento,
      FTAvanzarActividad entidad, Function metodoRespuestaModificar) {
    ContextoAplicacion.db.tablaFTAvanzarActividad
        .actualizar(entidad)
        .then((respuesta) {
      this.entidad = respuesta;
      if (metodoRespuestaModificar != null)
        metodoRespuestaModificar(context, elemento, entidad);
    });
  }

  void eliminarEntidad(BuildContext context, ElementoLista elemento,
      Function metodoRespuestaEliminar) {
    FTAvanzarActividad entidad = FTAvanzarActividad().iniciar();
    entidad.id = elemento.id;
    entidad.nombre = elemento.titulo;

    ContextoAplicacion.db.tablaFTAvanzarActividad.eliminar(entidad).then((respuesta) {
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
