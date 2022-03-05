//  librerias internas de flutter
import 'package:flutter/material.dart';

//  librerias importadas flutter

//  librerias  proyecto

import '../../contexto/contexto.dart';

class SeguimientoControlador extends ChangeNotifier {
  bool actualizarControles = false;
  dynamic get entidad {
    return ContextoAplicacion.db.tablaSeguimiento.entidad;
  }

  set entidad(dynamic entidad) {
    ContextoAplicacion.db.tablaSeguimiento.entidad = entidad;
    // this._entidad =entidad;
    this.actualizarControles = true;
    notifyListeners();
  }

  List<dynamic> get lista {
    return ContextoAplicacion.db.tablaSeguimiento.lista;
  }

  set lista(List<dynamic> lista) {
    ContextoAplicacion.db.tablaSeguimiento.lista = lista;
    notifyListeners();
  }

  //
  //  metodos de negocio y actualizar  el estado de  entidades
  //
  void limpiar() {
    ContextoAplicacion.db.tablaSeguimiento.lista = null;

    Seguimiento entidad = Seguimiento().iniciar();
    ContextoAplicacion.db.tablaSeguimiento.entidad = entidad;
  }

  dynamic iniciarEntidad() {
    Seguimiento entidad = Seguimiento().iniciar();
    // se asigna  datos entidad padre
    this.entidad = entidad;
    return entidad;
  }

  //
  //  asignar paramtros de api para consulta
  //
   dynamic asignarParametros( dynamic parmetros,String llaveApi) {
      ContextoAplicacion.db.tablaSeguimiento.configuracion.parmetros=parmetros;
      ContextoAplicacion.db.tablaSeguimiento.configuracion.filtro=""; 
      ContextoAplicacion.db.tablaSeguimiento.configuracion.llaveApi=llaveApi;
   }

  dynamic asignarParametrosFiltro( dynamic parmetros,dynamic filtro,String llaveApi) {
      ContextoAplicacion.db.tablaSeguimiento.configuracion.parmetros=parmetros;
      ContextoAplicacion.db.tablaSeguimiento.configuracion.filtro=filtro;  
      ContextoAplicacion.db.tablaSeguimiento.configuracion.llaveApi=llaveApi;
   }
  //
  //  metodos de negocio y  acceso  a  base de datos
  //
  consultarEntidad(Seguimiento entidad, Function metodoRespuestaConsultar) {
    ContextoAplicacion.db.tablaSeguimiento
        .obtenerLista(entidad)
        .then((listaRespuesta) {
      List<Seguimiento> lista = listaRespuesta.cast<Seguimiento>().toList();
      this.lista = lista;
      if (metodoRespuestaConsultar != null) metodoRespuestaConsultar(lista);
    });
  }

  void obtenerEntidad(BuildContext context, ElementoLista elemento,
      Function metodorRespuestaObtener) {
    Seguimiento entidad = Seguimiento().iniciar();
    entidad.id = elemento.id;
    ContextoAplicacion.db.tablaSeguimiento.obtener(entidad).then((respuesta) {
      if (respuesta != null) {
        this.entidad = respuesta;
        if (metodorRespuestaObtener != null)
          metodorRespuestaObtener(context, elemento, respuesta);
      }
    });
  }

  dynamic obtenerEntidadDeLista(BuildContext context, ElementoLista elemento,
      Function metodorRespuestaObtener) {
    Seguimiento entidad = Seguimiento().iniciar();
    entidad.id = elemento.id;
    List<dynamic> lista = this.lista;
    if (lista != null) entidad = lista.where((s) => s.idTarea == entidad.id).first;
    this.entidad = entidad;
    if (metodorRespuestaObtener != null)
      metodorRespuestaObtener(context, elemento, entidad);
    return entidad;
  }

  insertarEntidad(BuildContext context, ElementoLista elemento,
      Seguimiento entidad, Function metodoRespuestaInsertar) {
    ContextoAplicacion.db.tablaSeguimiento.insertar(entidad).then((respuesta) {
      print(respuesta);
      this.entidad = entidad.fromMap(respuesta);
      if (metodoRespuestaInsertar != null)
        metodoRespuestaInsertar(context, elemento, this.entidad);
    });
  }

  modificarEntidad(BuildContext context, ElementoLista elemento,
      Seguimiento entidad, Function metodoRespuestaModificar) {
    ContextoAplicacion.db.tablaSeguimiento
        .actualizar(entidad)
        .then((respuesta) {
      this.entidad = respuesta;
      if (metodoRespuestaModificar != null)
        metodoRespuestaModificar(context, elemento, entidad);
    });
  }

  void eliminarEntidad(BuildContext context, ElementoLista elemento,
      Function metodoRespuestaEliminar) {
    Seguimiento entidad = Seguimiento().iniciar();
    entidad.id = elemento.id;
    entidad.nombre = elemento.titulo;

    ContextoAplicacion.db.tablaSeguimiento.eliminar(entidad).then((respuesta) {
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
