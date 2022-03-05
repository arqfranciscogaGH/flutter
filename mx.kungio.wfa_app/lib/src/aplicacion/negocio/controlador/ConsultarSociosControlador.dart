//  librerias internas de flutter
import 'package:flutter/material.dart';

//  librerias importadas flutter

//  librerias  proyecto

import '../../contexto/contexto.dart';

class ConsultarSociosControlador extends ChangeNotifier {
  bool actualizarControles = false;
  dynamic get entidad {
    return ContextoAplicacion.db.tablaConsultarSocios.entidad;
  }

  set entidad(dynamic entidad) {
    ContextoAplicacion.db.tablaConsultarSocios.entidad = entidad;
    // this._entidad =entidad;
    this.actualizarControles = true;
    notifyListeners();
  }

  List<dynamic> get lista {
    return ContextoAplicacion.db.tablaConsultarSocios.lista;
  }

  set lista(List<dynamic> lista) {
    ContextoAplicacion.db.tablaConsultarSocios.lista = lista;
    notifyListeners();
  }

  //
  //  metodos de negocio y actualizar  el estado de  entidades
  //
  void limpiar() {
    ContextoAplicacion.db.tablaConsultarSocios.lista = null;

    ConsultarSocios entidad = ConsultarSocios().iniciar();
    ContextoAplicacion.db.tablaConsultarSocios.entidad = entidad;
  }

  dynamic iniciarEntidad() {
    ConsultarSocios entidad = ConsultarSocios().iniciar();
    // se asigna  datos entidad padre
    this.entidad = entidad;
    return entidad;
  }

  //
  //  asignar paramtros de api para consulta
  //
  dynamic asignarParametros( dynamic parmetros,String llaveApi) {
      ContextoAplicacion.db.tablaConsultarSocios.configuracion.parmetros=parmetros;
      ContextoAplicacion.db.tablaConsultarSocios.configuracion.filtro=""; 
      ContextoAplicacion.db.tablaConsultarSocios.configuracion.llaveApi=llaveApi;
   }

  dynamic asignarParametrosFiltro( dynamic parmetros,dynamic filtro,String llaveApi) {
      ContextoAplicacion.db.tablaConsultarSocios.configuracion.parmetros=parmetros;
      ContextoAplicacion.db.tablaConsultarSocios.configuracion.filtro=filtro;  
      ContextoAplicacion.db.tablaConsultarSocios.configuracion.llaveApi=llaveApi;
   }
  //
  //  metodos de negocio y  acceso  a  base de datos
  //
  consultarEntidad(ConsultarSocios entidad, Function metodoRespuestaConsultar) {
    ContextoAplicacion.db.tablaConsultarSocios
        .obtenerLista(entidad)
        .then((listaRespuesta) {
      List<ConsultarSocios> lista = listaRespuesta.cast<ConsultarSocios>().toList();
      this.lista = lista;
      if (metodoRespuestaConsultar != null) metodoRespuestaConsultar(lista);
    });
  }

  void obtenerEntidad(BuildContext context, ElementoLista elemento,
      Function metodorRespuestaObtener) {
    ConsultarSocios entidad = ConsultarSocios().iniciar();
    entidad.id = elemento.id;
    ContextoAplicacion.db.tablaConsultarSocios.obtener(entidad).then((respuesta) {
      if (respuesta != null) {
        this.entidad = respuesta;
        if (metodorRespuestaObtener != null)
          metodorRespuestaObtener(context, elemento, respuesta);
      }
    });
  }

  dynamic obtenerEntidadDeLista(BuildContext context, ElementoLista elemento,
      Function metodorRespuestaObtener) {
    ConsultarSocios entidad = ConsultarSocios().iniciar();
    entidad.id = elemento.id;
    List<dynamic> lista = this.lista;
    if (lista != null) entidad = lista.where((s) => s.idInstancia == entidad.id).first;
    this.entidad = entidad;
    if (metodorRespuestaObtener != null)
      metodorRespuestaObtener(context, elemento, entidad);
    return entidad;
  }

  insertarEntidad(BuildContext context, ElementoLista elemento,
      ConsultarSocios entidad, Function metodoRespuestaInsertar) {
    ContextoAplicacion.db.tablaConsultarSocios.insertar(entidad).then((respuesta) {
      print(respuesta);
      this.entidad = entidad.fromMap(respuesta);
      if (metodoRespuestaInsertar != null)
        metodoRespuestaInsertar(context, elemento, this.entidad);
    });
  }

  modificarEntidad(BuildContext context, ElementoLista elemento,
      ConsultarSocios entidad, Function metodoRespuestaModificar) {
    ContextoAplicacion.db.tablaConsultarSocios
        .actualizar(entidad)
        .then((respuesta) {
      this.entidad = respuesta;
      if (metodoRespuestaModificar != null)
        metodoRespuestaModificar(context, elemento, entidad);
    });
  }

  void eliminarEntidad(BuildContext context, ElementoLista elemento,
      Function metodoRespuestaEliminar) {
    ConsultarSocios entidad = ConsultarSocios().iniciar();
    entidad.id = elemento.id;
    entidad.nombre = elemento.titulo;

    ContextoAplicacion.db.tablaConsultarSocios.eliminar(entidad).then((respuesta) {
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
