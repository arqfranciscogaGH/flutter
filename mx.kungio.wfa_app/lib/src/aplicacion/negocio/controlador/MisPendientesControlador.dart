//  librerias internas de flutter
import 'package:flutter/material.dart';

//  librerias importadas flutter

//  librerias  proyecto

import '../../contexto/contexto.dart';

class MisPendientesControlador extends ChangeNotifier {
  bool actualizarControles = false;
  dynamic get entidad {
    return ContextoAplicacion.db.tablaMisPendientes.entidad;
  }

  set entidad(dynamic entidad) {
    ContextoAplicacion.db.tablaMisPendientes.entidad = entidad;
    // this._entidad =entidad;
    this.actualizarControles = true;
    notifyListeners();
  }

  List<dynamic> get lista {
    return ContextoAplicacion.db.tablaMisPendientes.lista;
  }

  set lista(List<dynamic> lista) {
    ContextoAplicacion.db.tablaMisPendientes.lista = lista;
    notifyListeners();
  }

  //
  //  metodos de negocio y actualizar  el estado de  entidades
  //
  void limpiar() {
    ContextoAplicacion.db.tablaMisPendientes.lista = null;

    MisPendientes entidad = MisPendientes().iniciar();
    ContextoAplicacion.db.tablaMisPendientes.entidad = entidad;
  }

  dynamic iniciarEntidad() {
    MisPendientes entidad = MisPendientes().iniciar();
    // se asigna  datos entidad padre
    this.entidad = entidad;
    return entidad;
  }

  //
  //  asignar paramtros de api para consulta
  //
   dynamic asignarParametros( dynamic parmetros,String llaveApi) {
      ContextoAplicacion.db.tablaMisPendientes.configuracion.parmetros=parmetros;
      ContextoAplicacion.db.tablaMisPendientes.configuracion.filtro=""; 
      ContextoAplicacion.db.tablaMisPendientes.configuracion.llaveApi=llaveApi;
   }
   dynamic asignarParametrosFiltro( dynamic parmetros,dynamic filtro,String llaveApi) {
      ContextoAplicacion.db.tablaMisPendientes.configuracion.parmetros=parmetros;
      ContextoAplicacion.db.tablaMisPendientes.configuracion.filtro=filtro; 
      ContextoAplicacion.db.tablaMisPendientes.configuracion.llaveApi=llaveApi;
   }
  //
  //  metodos de negocio y  acceso  a  base de datos
  //
  consultarEntidad(MisPendientes entidad, Function metodoRespuestaConsultar) {
    ContextoAplicacion.db.tablaMisPendientes
        .obtenerLista(entidad)
        .then((listaRespuesta) {
      List<MisPendientes> lista = listaRespuesta.cast<MisPendientes>().toList();
      this.lista = lista;
      if (metodoRespuestaConsultar != null) metodoRespuestaConsultar(lista);
    });
  }

  void obtenerEntidad(BuildContext context, ElementoLista elemento,
      Function metodorRespuestaObtener) {
    MisPendientes entidad = MisPendientes().iniciar();
    entidad.id = elemento.id;
    ContextoAplicacion.db.tablaMisPendientes.obtener(entidad).then((respuesta) {
      if (respuesta != null) {
        this.entidad = respuesta;
        if (metodorRespuestaObtener != null)
          metodorRespuestaObtener(context, elemento, respuesta);
      }
    });
  }

  dynamic obtenerEntidadDeLista(BuildContext context, ElementoLista elemento,
      Function metodorRespuestaObtener) {
    MisPendientes entidad = MisPendientes().iniciar();
    entidad.id = elemento.id;
    List<dynamic> lista = this.lista;
    if (lista != null) entidad = lista.where((s) => s.idHistorial == entidad.id).first;
    this.entidad = entidad;
    if (metodorRespuestaObtener != null)
      metodorRespuestaObtener(context, elemento, entidad);
    return entidad;
  }

  insertarEntidad(BuildContext context, ElementoLista elemento,
      MisPendientes entidad, Function metodoRespuestaInsertar) {
    ContextoAplicacion.db.tablaMisPendientes.insertar(entidad).then((respuesta) {
      print(respuesta);
      this.entidad = entidad.fromMap(respuesta);
      if (metodoRespuestaInsertar != null)
        metodoRespuestaInsertar(context, elemento, this.entidad);
    });
  }

  modificarEntidad(BuildContext context, ElementoLista elemento,
      MisPendientes entidad, Function metodoRespuestaModificar) {
    ContextoAplicacion.db.tablaMisPendientes
        .actualizar(entidad)
        .then((respuesta) {
      this.entidad = respuesta;
      if (metodoRespuestaModificar != null)
        metodoRespuestaModificar(context, elemento, entidad);
    });
  }

  void eliminarEntidad(BuildContext context, ElementoLista elemento,
      Function metodoRespuestaEliminar) {
    MisPendientes entidad = MisPendientes().iniciar();
    entidad.id = elemento.id;
    entidad.nombre = elemento.titulo;

    ContextoAplicacion.db.tablaMisPendientes.eliminar(entidad).then((respuesta) {
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
