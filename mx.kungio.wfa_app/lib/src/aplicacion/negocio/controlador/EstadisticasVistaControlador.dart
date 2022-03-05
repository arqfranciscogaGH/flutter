//  librerias internas de flutter
import 'package:flutter/material.dart';

//  librerias importadas flutter

//  librerias  proyecto

import '../../contexto/contexto.dart';

class EstadisticasVistaControlador extends ChangeNotifier {
  bool actualizarControles = false;
  dynamic get entidad {
    return ContextoAplicacion.db.tablaEstadisticasVista.entidad;
  }

  set entidad(dynamic entidad) {
    ContextoAplicacion.db.tablaEstadisticasVista.entidad = entidad;
    // this._entidad =entidad;
    this.actualizarControles = true;
    notifyListeners();
  }

  List<dynamic> get lista {
    return ContextoAplicacion.db.tablaEstadisticasVista.lista;
  }

  set lista(List<dynamic> lista) {
    ContextoAplicacion.db.tablaEstadisticasVista.lista = lista;
    notifyListeners();
  }

  //
  //  metodos de negocio y actualizar  el estado de  entidades
  //
  void limpiar() {
    ContextoAplicacion.db.tablaEstadisticasVista.lista = null;

    EstadisticasVista entidad = EstadisticasVista().iniciar();
    ContextoAplicacion.db.tablaEstadisticasVista.entidad = entidad;
  }

  dynamic iniciarEntidad() {
    EstadisticasVista entidad = EstadisticasVista().iniciar();
    // se asigna  datos entidad padre
    this.entidad = entidad;
    return entidad;
  }

  //
  //  asignar paramtros de api para consulta
  //
   dynamic asignarParametros( dynamic parmetros,String llaveApi) {
      ContextoAplicacion.db.tablaEstadisticasVista.configuracion.parmetros=parmetros;
      ContextoAplicacion.db.tablaEstadisticasVista.configuracion.filtro="";  
      ContextoAplicacion.db.tablaEstadisticasVista.configuracion.llaveApi=llaveApi;
   }

  dynamic asignarParametrosFiltro( dynamic parmetros,dynamic filtro,String llaveApi) {
      ContextoAplicacion.db.tablaEstadisticasVista.configuracion.parmetros=parmetros;
      ContextoAplicacion.db.tablaEstadisticasVista.configuracion.filtro=filtro;  
      ContextoAplicacion.db.tablaEstadisticasVista.configuracion.llaveApi=llaveApi;
   }
  //
  //  metodos de negocio y  acceso  a  base de datos
  //
  consultarEntidad(EstadisticasVista entidad, Function metodoRespuestaConsultar) {
    ContextoAplicacion.db.tablaEstadisticasVista
        .obtenerLista(entidad)
        .then((listaRespuesta) {
      List<EstadisticasVista> lista = listaRespuesta.cast<EstadisticasVista>().toList();
      this.lista = lista;
      if (metodoRespuestaConsultar != null) metodoRespuestaConsultar(lista);
    });
  }

  void obtenerEntidad(BuildContext context, ElementoLista elemento,
      Function metodorRespuestaObtener) {
    EstadisticasVista entidad = EstadisticasVista().iniciar();
    entidad.id = elemento.id;
    ContextoAplicacion.db.tablaEstadisticasVista.obtener(entidad).then((respuesta) {
      if (respuesta != null) {
        this.entidad = respuesta;
        if (metodorRespuestaObtener != null)
          metodorRespuestaObtener(context, elemento, respuesta);
      }
    });
  }

  dynamic obtenerEntidadDeLista(BuildContext context, ElementoLista elemento,
      Function metodorRespuestaObtener) {
    EstadisticasVista entidad = EstadisticasVista().iniciar();
    entidad.id = elemento.id;
    List<dynamic> lista = this.lista;
    if (lista != null) entidad = lista.where((s) => s.id == entidad.id).first;
    this.entidad = entidad;
    if (metodorRespuestaObtener != null)
      metodorRespuestaObtener(context, elemento, entidad);
    return entidad;
  }

  insertarEntidad(BuildContext context, ElementoLista elemento,
      EstadisticasVista entidad, Function metodoRespuestaInsertar) {
    ContextoAplicacion.db.tablaEstadisticasVista.insertar(entidad).then((respuesta) {
      print(respuesta);
      this.entidad = entidad.fromMap(respuesta);
      if (metodoRespuestaInsertar != null)
        metodoRespuestaInsertar(context, elemento, this.entidad);
    });
  }

  modificarEntidad(BuildContext context, ElementoLista elemento,
      EstadisticasVista entidad, Function metodoRespuestaModificar) {
    ContextoAplicacion.db.tablaEstadisticasVista
        .actualizar(entidad)
        .then((respuesta) {
      this.entidad = respuesta;
      if (metodoRespuestaModificar != null)
        metodoRespuestaModificar(context, elemento, entidad);
    });
  }

  void eliminarEntidad(BuildContext context, ElementoLista elemento,
      Function metodoRespuestaEliminar) {
    EstadisticasVista entidad = EstadisticasVista().iniciar();
    entidad.id = elemento.id;
    entidad.nombre = elemento.titulo;

    ContextoAplicacion.db.tablaEstadisticasVista.eliminar(entidad).then((respuesta) {
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
