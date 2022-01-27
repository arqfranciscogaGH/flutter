
//  librerias internas de flutter
import 'package:flutter/material.dart';

//  librerias importadas flutter

//  librerias  proyecto

import '../../contexto/contexto.dart';

class ProductividadDetalleControlador extends ChangeNotifier {
  bool actualizarControles = false;
  dynamic get entidad {
    return ContextoAplicacion.db.tablaProductividadDetalle.entidad;
  }

  set entidad(dynamic entidad) {
    ContextoAplicacion.db.tablaProductividadDetalle.entidad = entidad;
    // this._entidad =entidad;
    this.actualizarControles = true;
    notifyListeners();
  }

  List<dynamic> get lista {
    return ContextoAplicacion.db.tablaProductividadDetalle.lista;
  }

  set lista(List<dynamic> lista) {
    ContextoAplicacion.db.tablaProductividadDetalle.lista = lista;
    notifyListeners();
  }

  //
  //  metodos de negocio y actualizar  el estado de  entidades
  //
  void limpiar() {
    ContextoAplicacion.db.tablaProductividadDetalle.lista = null;

    ProductividadDetalle entidad = ProductividadDetalle().iniciar();
    ContextoAplicacion.db.tablaProductividadDetalle.entidad = entidad;
  }

  dynamic iniciarEntidad() {
    ProductividadDetalle entidad = ProductividadDetalle().iniciar();
    // se asigna  datos entidad padre
    this.entidad = entidad;
    return entidad;
  }

  //
  //  asignar paramtros de api para consulta
  //
   dynamic asignarParametros( dynamic parmetros,String llaveApi) {
      ContextoAplicacion.db.tablaProductividadDetalle.configuracion.parmetros=parmetros;
      ContextoAplicacion.db.tablaProductividadDetalle.configuracion.llaveApi=llaveApi;
   }
  //
  //  metodos de negocio y  acceso  a  base de datos
  //
  consultarEntidad(ProductividadDetalle entidad, Function metodoRespuestaConsultar) {
    ContextoAplicacion.db.tablaProductividadDetalle
        .obtenerLista(entidad)
        .then((listaRespuesta) {
      List<ProductividadDetalle> lista = listaRespuesta.cast<ProductividadDetalle>().toList();
      this.lista = lista;
      if (metodoRespuestaConsultar != null) metodoRespuestaConsultar(lista);
    });
  }

  void obtenerEntidad(BuildContext context, ElementoLista elemento,
      Function metodorRespuestaObtener) {
    ProductividadDetalle entidad = ProductividadDetalle().iniciar();
    entidad.id = elemento.id;
    ContextoAplicacion.db.tablaProductividadDetalle.obtener(entidad).then((respuesta) {
      if (respuesta != null) {
        this.entidad = respuesta;
        if (metodorRespuestaObtener != null)
          metodorRespuestaObtener(context, elemento, respuesta);
      }
    });
  }

  dynamic obtenerEntidadDeLista(BuildContext context, ElementoLista elemento,
      Function metodorRespuestaObtener) {
    ProductividadDetalle entidad = ProductividadDetalle().iniciar();
    entidad.id = elemento.id;
    List<dynamic> lista = this.lista;
    if (lista != null) entidad = lista.where((s) => s.idTarea == entidad.id).first;
    this.entidad = entidad;
    if (metodorRespuestaObtener != null)
      metodorRespuestaObtener(context, elemento, entidad);
    return entidad;
  }

  insertarEntidad(BuildContext context, ElementoLista elemento,
      ProductividadDetalle entidad, Function metodoRespuestaInsertar) {
    ContextoAplicacion.db.tablaProductividadDetalle.insertar(entidad).then((respuesta) {
      print(respuesta);
      this.entidad = entidad.fromMap(respuesta);
      if (metodoRespuestaInsertar != null)
        metodoRespuestaInsertar(context, elemento, this.entidad);
    });
  }

  modificarEntidad(BuildContext context, ElementoLista elemento,
      ProductividadDetalle entidad, Function metodoRespuestaModificar) {
    ContextoAplicacion.db.tablaProductividadDetalle
        .actualizar(entidad)
        .then((respuesta) {
      this.entidad = respuesta;
      if (metodoRespuestaModificar != null)
        metodoRespuestaModificar(context, elemento, entidad);
    });
  }

  void eliminarEntidad(BuildContext context, ElementoLista elemento,
      Function metodoRespuestaEliminar) {
    ProductividadDetalle entidad = ProductividadDetalle().iniciar();
    entidad.id = elemento.id;
    entidad.nombre = elemento.titulo;

    ContextoAplicacion.db.tablaProductividadDetalle.eliminar(entidad).then((respuesta) {
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
