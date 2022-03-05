//  librerias internas de flutter
import 'package:flutter/material.dart';

//  librerias importadas flutter

//  librerias  proyecto

import '../../contexto/contexto.dart';

class ProductividadControlador extends ChangeNotifier {
  bool actualizarControles = false;
  dynamic get entidad {
    return ContextoAplicacion.db.tablaProductividad.entidad;
  }

  set entidad(dynamic entidad) {
    ContextoAplicacion.db.tablaProductividad.entidad = entidad;
    // this._entidad =entidad;
    this.actualizarControles = true;
    notifyListeners();
  }

  List<dynamic> get lista {
    return ContextoAplicacion.db.tablaProductividad.lista;
  }

  set lista(List<dynamic> lista) {
    ContextoAplicacion.db.tablaProductividad.lista = lista;
    notifyListeners();
  }

  //
  //  metodos de negocio y actualizar  el estado de  entidades
  //
  void limpiar() {
    ContextoAplicacion.db.tablaProductividad.lista = null;

    Productividad entidad = Productividad().iniciar();
    ContextoAplicacion.db.tablaProductividad.entidad = entidad;
  }

  dynamic iniciarEntidad() {
    Productividad entidad = Productividad().iniciar();
    // se asigna  datos entidad padre
    this.entidad = entidad;
    return entidad;
  }

  //
  //  asignar paramtros de api para consulta
  //
   
    dynamic asignarParametros( dynamic parmetros,String llaveApi) {
      ContextoAplicacion.db.tablaProductividad.configuracion.parmetros=parmetros;
      ContextoAplicacion.db.tablaProductividad.configuracion.filtro=""; 
      ContextoAplicacion.db.tablaProductividad.configuracion.llaveApi=llaveApi;
   }

  dynamic asignarParametrosFiltro( dynamic parmetros,dynamic filtro,String llaveApi) {
      ContextoAplicacion.db.tablaProductividad.configuracion.parmetros=parmetros;
      ContextoAplicacion.db.tablaProductividad.configuracion.filtro=filtro;  
      ContextoAplicacion.db.tablaProductividad.configuracion.llaveApi=llaveApi;
   }
  //
  //  metodos de negocio y  acceso  a  base de datos
  //
  consultarEntidad(Productividad entidad, Function metodoRespuestaConsultar) {
    ContextoAplicacion.db.tablaProductividad
        .obtenerLista(entidad)
        .then((listaRespuesta) {
      List<Productividad> lista = listaRespuesta.cast<Productividad>().toList();
      this.lista = lista;
      if (metodoRespuestaConsultar != null) metodoRespuestaConsultar(lista);
    });
  }

  void obtenerEntidad(BuildContext context, ElementoLista elemento,
      Function metodorRespuestaObtener) {
    Productividad entidad = Productividad().iniciar();
    entidad.id = elemento.id;
    ContextoAplicacion.db.tablaProductividad.obtener(entidad).then((respuesta) {
      if (respuesta != null) {
        this.entidad = respuesta;
        if (metodorRespuestaObtener != null)
          metodorRespuestaObtener(context, elemento, respuesta);
      }
    });
  }

  dynamic obtenerEntidadDeLista(BuildContext context, ElementoLista elemento,
      Function metodorRespuestaObtener) {
    Productividad entidad = Productividad().iniciar();
    entidad.id = elemento.id;
    List<dynamic> lista = this.lista;
    if (lista != null) entidad = lista.where((s) => s.idTarea == entidad.id).first;
    this.entidad = entidad;
    if (metodorRespuestaObtener != null)
      metodorRespuestaObtener(context, elemento, entidad);
    return entidad;
  }

  insertarEntidad(BuildContext context, ElementoLista elemento,
      Productividad entidad, Function metodoRespuestaInsertar) {
    ContextoAplicacion.db.tablaProductividad.insertar(entidad).then((respuesta) {
      print(respuesta);
      this.entidad = entidad.fromMap(respuesta);
      if (metodoRespuestaInsertar != null)
        metodoRespuestaInsertar(context, elemento, this.entidad);
    });
  }

  modificarEntidad(BuildContext context, ElementoLista elemento,
      Productividad entidad, Function metodoRespuestaModificar) {
    ContextoAplicacion.db.tablaProductividad
        .actualizar(entidad)
        .then((respuesta) {
      this.entidad = respuesta;
      if (metodoRespuestaModificar != null)
        metodoRespuestaModificar(context, elemento, entidad);
    });
  }

  void eliminarEntidad(BuildContext context, ElementoLista elemento,
      Function metodoRespuestaEliminar) {
    Productividad entidad = Productividad().iniciar();
    entidad.id = elemento.id;
    entidad.nombre = elemento.titulo;

    ContextoAplicacion.db.tablaProductividad.eliminar(entidad).then((respuesta) {
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
