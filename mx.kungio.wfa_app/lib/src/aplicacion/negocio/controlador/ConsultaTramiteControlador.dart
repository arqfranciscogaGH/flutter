//  librerias internas de flutter
import 'package:flutter/material.dart';

//  librerias importadas flutter

//  librerias  proyecto

import '../../contexto/contexto.dart';

class ConsultaTramiteControlador extends ChangeNotifier {
  bool actualizarControles = false;
  dynamic get entidad {
    return ContextoAplicacion.db.tablaConsultaTramite.entidad;
  }

  set entidad(dynamic entidad) {
    ContextoAplicacion.db.tablaConsultaTramite.entidad = entidad;
    // this._entidad =entidad;
    this.actualizarControles = true;
    notifyListeners();
  }

  List<dynamic> get lista {
    return ContextoAplicacion.db.tablaConsultaTramite.lista;
  }

  set lista(List<dynamic> lista) {
    ContextoAplicacion.db.tablaConsultaTramite.lista = lista;
    notifyListeners();
  }

  //
  //  metodos de negocio y actualizar  el estado de  entidades
  //
  void limpiar() {
    ContextoAplicacion.db.tablaConsultaTramite.lista = null;

    ConsultaTramite entidad = ConsultaTramite().iniciar();
    ContextoAplicacion.db.tablaConsultaTramite.entidad = entidad;
  }

  dynamic iniciarEntidad() {
    ConsultaTramite entidad = ConsultaTramite().iniciar();
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
  consultarEntidad(ConsultaTramite entidad, Function metodoRespuestaConsultar) {
    ContextoAplicacion.db.tablaConsultaTramite
        .obtenerLista(entidad)
        .then((listaRespuesta) {
      List<ConsultaTramite> lista = listaRespuesta.cast<ConsultaTramite>().toList();
      this.lista = lista;
      if (metodoRespuestaConsultar != null) metodoRespuestaConsultar(lista);
    });
  }

  void obtenerEntidad(BuildContext context, ElementoLista elemento,
      Function metodorRespuestaObtener) {
    ConsultaTramite entidad = ConsultaTramite().iniciar();
    entidad.id = elemento.id;
    ContextoAplicacion.db.tablaConsultaTramite.obtener(entidad).then((respuesta) {
      if (respuesta != null) {
        this.entidad = respuesta;
        if (metodorRespuestaObtener != null)
          metodorRespuestaObtener(context, elemento, respuesta);
      }
    });
  }

  dynamic obtenerEntidadDeLista(BuildContext context, ElementoLista elemento,
      Function metodorRespuestaObtener) {
    ConsultaTramite entidad = ConsultaTramite().iniciar();
    entidad.id = elemento.id;
    List<dynamic> lista = this.lista;
    if (lista != null) entidad = lista.where((s) => s.idInstancia == entidad.id).first;
    this.entidad = entidad;
    if (metodorRespuestaObtener != null)
      metodorRespuestaObtener(context, elemento, entidad);
    return entidad;
  }

  insertarEntidad(BuildContext context, ElementoLista elemento,
      ConsultaTramite entidad, Function metodoRespuestaInsertar) {
    ContextoAplicacion.db.tablaConsultaTramite.insertar(entidad).then((respuesta) {
      print(respuesta);
      this.entidad = entidad.fromMap(respuesta);
      if (metodoRespuestaInsertar != null)
        metodoRespuestaInsertar(context, elemento, this.entidad);
    });
  }

  modificarEntidad(BuildContext context, ElementoLista elemento,
      ConsultaTramite entidad, Function metodoRespuestaModificar) {
    ContextoAplicacion.db.tablaConsultaTramite
        .actualizar(entidad)
        .then((respuesta) {
      this.entidad = respuesta;
      if (metodoRespuestaModificar != null)
        metodoRespuestaModificar(context, elemento, entidad);
    });
  }

  void eliminarEntidad(BuildContext context, ElementoLista elemento,
      Function metodoRespuestaEliminar) {
    ConsultaTramite entidad = ConsultaTramite().iniciar();
    entidad.id = elemento.id;
    entidad.nombre = elemento.titulo;

    ContextoAplicacion.db.tablaConsultaTramite.eliminar(entidad).then((respuesta) {
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
