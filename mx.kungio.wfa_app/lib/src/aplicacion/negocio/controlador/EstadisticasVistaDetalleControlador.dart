//  librerias internas de flutter
import 'package:flutter/material.dart';

//  librerias importadas flutter

//  librerias  proyecto

import '../../contexto/contexto.dart';

class EstadisticasVistaDetalleControlador extends ChangeNotifier {
  bool actualizarControles = false;
  dynamic get entidad {
    return ContextoAplicacion.db.tablaEstadisticasVistaDetalle.entidad;
  }

  set entidad(dynamic entidad) {
    ContextoAplicacion.db.tablaEstadisticasVistaDetalle.entidad = entidad;
    // this._entidad =entidad;
    this.actualizarControles = true;
    notifyListeners();
  }

  List<dynamic> get lista {
    return ContextoAplicacion.db.tablaEstadisticasVistaDetalle.lista;
  }

  set lista(List<dynamic> lista) {
    ContextoAplicacion.db.tablaEstadisticasVistaDetalle.lista = lista;
    notifyListeners();
  }

  //
  //  metodos de negocio y actualizar  el estado de  entidades
  //
  void limpiar() {
    ContextoAplicacion.db.tablaEstadisticasVistaDetalle.lista = null;

    EstadisticasVistaDetalle entidad = EstadisticasVistaDetalle().iniciar();
    ContextoAplicacion.db.tablaEstadisticasVistaDetalle.entidad = entidad;
  }

  dynamic iniciarEntidad() {
    EstadisticasVistaDetalle entidad = EstadisticasVistaDetalle().iniciar();
    // se asigna  datos entidad padre
    this.entidad = entidad;
    return entidad;
  }

  //
  //  asignar paramtros de api para consulta
  //
   dynamic asignarParametros( dynamic parmetros,String llaveApi) {
      ContextoAplicacion.db.tablaEstadisticasVistaDetalle.configuracion.parmetros=parmetros;
      ContextoAplicacion.db.tablaEstadisticasVistaDetalle.configuracion.llaveApi=llaveApi;
   }
  //
  //  metodos de negocio y  acceso  a  base de datos
  //
  consultarEntidad(EstadisticasVistaDetalle entidad, Function metodoRespuestaConsultar) {
    ContextoAplicacion.db.tablaEstadisticasVistaDetalle
        .obtenerLista(entidad)
        .then((listaRespuesta) {
      List<EstadisticasVistaDetalle> lista = listaRespuesta.cast<EstadisticasVistaDetalle>().toList();
      this.lista = lista;
      if (metodoRespuestaConsultar != null) metodoRespuestaConsultar(lista);
    });
  }

  void obtenerEntidad(BuildContext context, ElementoLista elemento,
      Function metodorRespuestaObtener) {
    EstadisticasVistaDetalle entidad = EstadisticasVistaDetalle().iniciar();
    entidad.id = elemento.id;
    ContextoAplicacion.db.tablaEstadisticasVistaDetalle.obtener(entidad).then((respuesta) {
      if (respuesta != null) {
        this.entidad = respuesta;
        if (metodorRespuestaObtener != null)
          metodorRespuestaObtener(context, elemento, respuesta);
      }
    });
  }

  dynamic obtenerEntidadDeLista(BuildContext context, ElementoLista elemento,
      Function metodorRespuestaObtener) {
    EstadisticasVistaDetalle entidad = EstadisticasVistaDetalle().iniciar();
    entidad.id = elemento.id;
    List<dynamic> lista = this.lista;
    if (lista != null) entidad = lista.where((s) => s.id == entidad.id).first;
    this.entidad = entidad;
    if (metodorRespuestaObtener != null)
      metodorRespuestaObtener(context, elemento, entidad);
    return entidad;
  }

  insertarEntidad(BuildContext context, ElementoLista elemento,
      EstadisticasVistaDetalle entidad, Function metodoRespuestaInsertar) {
    ContextoAplicacion.db.tablaEstadisticasVistaDetalle.insertar(entidad).then((respuesta) {
      print(respuesta);
      this.entidad = entidad.fromMap(respuesta);
      if (metodoRespuestaInsertar != null)
        metodoRespuestaInsertar(context, elemento, this.entidad);
    });
  }

  modificarEntidad(BuildContext context, ElementoLista elemento,
      EstadisticasVistaDetalle entidad, Function metodoRespuestaModificar) {
    ContextoAplicacion.db.tablaEstadisticasVistaDetalle
        .actualizar(entidad)
        .then((respuesta) {
      this.entidad = respuesta;
      if (metodoRespuestaModificar != null)
        metodoRespuestaModificar(context, elemento, entidad);
    });
  }

  void eliminarEntidad(BuildContext context, ElementoLista elemento,
      Function metodoRespuestaEliminar) {
    EstadisticasVistaDetalle entidad = EstadisticasVistaDetalle().iniciar();
    entidad.id = elemento.id;
    entidad.nombre = elemento.titulo;

    ContextoAplicacion.db.tablaEstadisticasVistaDetalle.eliminar(entidad).then((respuesta) {
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
