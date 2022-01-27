//  librerias internas de flutter
import 'package:flutter/material.dart';

//  librerias importadas flutter

//  librerias  proyecto

import '../../contexto/contexto.dart';

class FlujoTrabajoDocumentoControlador extends ChangeNotifier {
  bool actualizarControles = false;
  dynamic get entidad {
    return ContextoAplicacion.db.tablaFlujoTrabajoDocumento.entidad;
  }

  set entidad(dynamic entidad) {
    ContextoAplicacion.db.tablaFlujoTrabajoDocumento.entidad = entidad;
    // this._entidad =entidad;
    this.actualizarControles = true;
    notifyListeners();
  }

  List<dynamic> get lista {
    return ContextoAplicacion.db.tablaFlujoTrabajoDocumento.lista;
  }

  set lista(List<dynamic> lista) {
    ContextoAplicacion.db.tablaFlujoTrabajoDocumento.lista = lista;
    notifyListeners();
  }

  //
  //  metodos de negocio y actualizar  el estado de  entidades
  //
  void limpiar() {
    ContextoAplicacion.db.tablaFlujoTrabajoDocumento.lista = null;

    FlujoTrabajoDocumento entidad = FlujoTrabajoDocumento().iniciar();
    ContextoAplicacion.db.tablaFlujoTrabajoDocumento.entidad = entidad;
  }

  dynamic iniciarEntidad() {
    FlujoTrabajoDocumento entidad = FlujoTrabajoDocumento().iniciar();
    // se asigna  datos entidad padre
    this.entidad = entidad;
    return entidad;
  }

  //
  //  asignar paramtros de api para consulta
  //
  dynamic asignarParametros(dynamic parametros, String llaveApi) {
    ContextoAplicacion.db.tablaFlujoTrabajoDocumento.configuracion.parmetros =
        parametros;
    ContextoAplicacion.db.tablaConsultaDocumentos.parametros = parametros;
    ContextoAplicacion.db.tablaFlujoTrabajoDocumento.configuracion.llaveApi =
        llaveApi;
  }

  //
  //  metodos de negocio y  acceso  a  base de datos
  //
  consultarEntidad(
      FlujoTrabajoDocumento entidad, Function metodoRespuestaConsultar) {
    ContextoAplicacion.db.tablaFlujoTrabajoDocumento
        .obtenerLista(entidad)
        .then((listaRespuesta) {
      List<FlujoTrabajoDocumento> lista =
          listaRespuesta.cast<FlujoTrabajoDocumento>().toList();
      this.lista = lista;
      if (metodoRespuestaConsultar != null) metodoRespuestaConsultar(lista);
    });
  }

  void obtenerEntidad(BuildContext context, ElementoLista elemento,
      Function metodorRespuestaObtener) {
    FlujoTrabajoDocumento entidad = FlujoTrabajoDocumento().iniciar();
    entidad.id = elemento.id;
    ContextoAplicacion.db.tablaFlujoTrabajoDocumento
        .obtener(entidad)
        .then((respuesta) {
      if (respuesta != null) {
        this.entidad = respuesta;
        if (metodorRespuestaObtener != null)
          metodorRespuestaObtener(context, elemento, respuesta);
      }
    });
  }

  dynamic obtenerEntidadDeLista(BuildContext context, ElementoLista elemento,
      Function metodorRespuestaObtener) {
    FlujoTrabajoDocumento entidad = FlujoTrabajoDocumento().iniciar();
    entidad.id = elemento.id;
    entidad.idDocumento = elemento.argumento;
    List<dynamic> lista = this.lista;
    if (lista != null && elemento.id != 0)
      entidad = lista.where((s) => s.id == entidad.id).first;
    else if (lista != null && entidad.idDocumento != 0)
      entidad = lista.where((s) => s.idDocumento == entidad.idDocumento).first;
    this.entidad = entidad;
    if (metodorRespuestaObtener != null)
      metodorRespuestaObtener(context, elemento, entidad);
    return entidad;
  }

  insertarEntidad(BuildContext context, ElementoLista elemento,
      FlujoTrabajoDocumento entidad, Function metodoRespuestaInsertar) {
    // se requiere  limpiar el campo  nombre por mo existe  en table  y  nose genere  error  al insertar
    // se guarda  el nombre  y  se  asigna  despues  del insert
    String nombre = entidad.nombre;
    entidad.nombre = "";
    ContextoAplicacion.db.tablaFlujoTrabajoDocumento
        .insertar(entidad)
        .then((respuesta) {
      this.entidad = entidad.fromMap(respuesta);
      this.entidad.nombre = nombre;
      print(respuesta);
      if (metodoRespuestaInsertar != null)
        metodoRespuestaInsertar(context, elemento, this.entidad);
    });
  }

  modificarEntidad(BuildContext context, ElementoLista elemento,
      FlujoTrabajoDocumento entidad, Function metodoRespuestaModificar) {
    ContextoAplicacion.db.tablaFlujoTrabajoDocumento
        .actualizar(entidad)
        .then((respuesta) {
      this.entidad = respuesta;
      if (metodoRespuestaModificar != null)
        metodoRespuestaModificar(context, elemento, entidad);
    });
  }

  void eliminarEntidad(BuildContext context, ElementoLista elemento,
      Function metodoRespuestaEliminar) {
    FlujoTrabajoDocumento entidad = FlujoTrabajoDocumento().iniciar();
    entidad.id = elemento.id;
    entidad.nombre = elemento.titulo;

    ContextoAplicacion.db.tablaFlujoTrabajoDocumento
        .eliminar(entidad)
        .then((respuesta) {
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
  //
  //  otros  metodos
  //
  //
  //  obtenerIdCliente
  //

  int obtenerIdCliente() {
    int idCliente = 0;
    if (ContextoAplicacion.db.tablaPersona.entidad.id != null) {
      idCliente = ContextoAplicacion.db.tablaPersona.entidad.id;
      ContextoAplicacion.db.tablaFlujoTrabajoDocumento.entidad.idReferencia =
          idCliente;
    }
    return idCliente;
  }
}
