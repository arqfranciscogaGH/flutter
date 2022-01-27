//  librerias internas de flutter
import 'package:flutter/material.dart';

//  librerias importadas flutter

//  librerias  proyecto

import '../../contexto/contexto.dart';

class FTEstatusTareaControlador extends ChangeNotifier {
  bool actualizarControles = false;
  dynamic get entidad {
    return ContextoAplicacion.db.tablaFTEstatusTarea.entidad;
  }

  set entidad(dynamic entidad) {
    ContextoAplicacion.db.tablaFTEstatusTarea.entidad = entidad;
    // this._entidad =entidad;
    this.actualizarControles = true;
    notifyListeners();
  }

  List<dynamic> get lista {
    return ContextoAplicacion.db.tablaFTEstatusTarea.lista;
  }

  set lista(List<dynamic> lista) {
    ContextoAplicacion.db.tablaFTEstatusTarea.lista = lista;
    notifyListeners();
  }

  //
  //  metodos de negocio y actualizar  el estado de  entidades
  //
  void limpiar() {
    ContextoAplicacion.db.tablaFTEstatusTarea.lista = null;

    FTEstatusTarea entidad = FTEstatusTarea().iniciar();
    ContextoAplicacion.db.tablaFTEstatusTarea.entidad = entidad;
  }

  dynamic iniciarEntidad() {
    FTEstatusTarea entidad = FTEstatusTarea().iniciar();
    // se asigna  datos entidad padre
    this.entidad = entidad;
    return entidad;
  }

  //
  //  asignar paramtros de api para consulta
  //
   dynamic asignarParametros( dynamic parmetros,String llaveApi) {
      ContextoAplicacion.db.tablaFTEstatusTarea.configuracion.parmetros=parmetros;
      ContextoAplicacion.db.tablaFTEstatusTarea.configuracion.llaveApi=llaveApi;
   }
  //
  //  metodos de negocio y  acceso  a  base de datos
  //
  consultarEntidad(FTEstatusTarea entidad, Function metodoRespuestaConsultar) {
    ContextoAplicacion.db.tablaFTEstatusTarea
        .obtenerLista(entidad)
        .then((listaRespuesta) {
      List<FTEstatusTarea> lista = listaRespuesta.cast<FTEstatusTarea>().toList();
      this.lista = lista;
      if (metodoRespuestaConsultar != null) metodoRespuestaConsultar(lista);
    });
  }

  void obtenerEntidad(BuildContext context, ElementoLista elemento,
      Function metodorRespuestaObtener) {
    FTEstatusTarea entidad = FTEstatusTarea().iniciar();
    entidad.id = elemento.id;
    ContextoAplicacion.db.tablaFTEstatusTarea.obtener(entidad).then((respuesta) {
      if (respuesta != null) {
        this.entidad = respuesta;
        if (metodorRespuestaObtener != null)
          metodorRespuestaObtener(context, elemento, respuesta);
      }
    });
  }

  dynamic obtenerEntidadDeLista(BuildContext context, ElementoLista elemento,
      Function metodorRespuestaObtener) {
    FTEstatusTarea entidad = FTEstatusTarea().iniciar();
    entidad.id = elemento.id;
    List<dynamic> lista = this.lista;
    if (lista != null) entidad = lista.where((s) => s.idTarea == entidad.id).first;
    this.entidad = entidad;
    if (metodorRespuestaObtener != null)
      metodorRespuestaObtener(context, elemento, entidad);
    return entidad;
  }

  insertarEntidad(BuildContext context, ElementoLista elemento,
      FTEstatusTarea entidad, Function metodoRespuestaInsertar) {
    ContextoAplicacion.db.tablaFTEstatusTarea.insertar(entidad).then((respuesta) {
      print(respuesta);
      this.entidad = entidad.fromMap(respuesta);
      if (metodoRespuestaInsertar != null)
        metodoRespuestaInsertar(context, elemento, this.entidad);
    });
  }

  modificarEntidad(BuildContext context, ElementoLista elemento,
      FTEstatusTarea entidad, Function metodoRespuestaModificar) {
    ContextoAplicacion.db.tablaFTEstatusTarea
        .actualizar(entidad)
        .then((respuesta) {
      this.entidad = respuesta;
      if (metodoRespuestaModificar != null)
        metodoRespuestaModificar(context, elemento, entidad);
    });
  }

  void eliminarEntidad(BuildContext context, ElementoLista elemento,
      Function metodoRespuestaEliminar) {
    FTEstatusTarea entidad = FTEstatusTarea().iniciar();
    entidad.id = elemento.id;
    entidad.nombre = elemento.titulo;

    ContextoAplicacion.db.tablaFTEstatusTarea.eliminar(entidad).then((respuesta) {
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
