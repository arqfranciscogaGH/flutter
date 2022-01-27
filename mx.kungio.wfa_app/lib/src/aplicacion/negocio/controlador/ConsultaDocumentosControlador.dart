//  librerias internas de flutter
import 'package:flutter/material.dart';

//  librerias importadas flutter

//  librerias  proyecto

import '../../contexto/contexto.dart';

class ConsultaDocumentosControlador extends ChangeNotifier {
  bool actualizarControles = false;
  dynamic get entidad {
    return ContextoAplicacion.db.tablaConsultaDocumentos.entidad;
  }

  set entidad(dynamic entidad) {
    ContextoAplicacion.db.tablaConsultaDocumentos.entidad = entidad;
    // this._entidad =entidad;
    this.actualizarControles = true;
    notifyListeners();
  }

  List<dynamic> get lista {
    return ContextoAplicacion.db.tablaConsultaDocumentos.lista;
  }

  set lista(List<dynamic> lista) {
    ContextoAplicacion.db.tablaConsultaDocumentos.lista = lista;
    notifyListeners();
  }

  //
  //  metodos de negocio y actualizar  el estado de  entidades
  //
  void limpiar() {
    ContextoAplicacion.db.tablaConsultaDocumentos.lista = null;

    FlujoTrabajoDocumento entidad = FlujoTrabajoDocumento().iniciar();
    ContextoAplicacion.db.tablaConsultaDocumentos.entidad = entidad;
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
    ContextoAplicacion.db.tablaConsultaDocumentos.configuracion.parmetros =
        parametros;
    ContextoAplicacion.db.tablaConsultaDocumentos.parametros = parametros;
    ContextoAplicacion.db.tablaConsultaDocumentos.configuracion.llaveApi =
        llaveApi;
  }

  //
  //  metodos de negocio y  acceso  a  base de datos
  //
  consultarEntidad(
      FlujoTrabajoDocumento entidad, Function metodoRespuestaConsultar) {
    ContextoAplicacion.db.tablaConsultaDocumentos
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
    ContextoAplicacion.db.tablaConsultaDocumentos
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
    List<dynamic> lista = this.lista;
    if (lista != null)
      entidad = lista.where((s) => s.idTarea == entidad.id).first;
    this.entidad = entidad;
    if (metodorRespuestaObtener != null)
      metodorRespuestaObtener(context, elemento, entidad);
    return entidad;
  }

  insertarEntidad(BuildContext context, ElementoLista elemento,
      FlujoTrabajoDocumento entidad, Function metodoRespuestaInsertar) {
    ContextoAplicacion.db.tablaConsultaDocumentos
        .insertar(entidad)
        .then((respuesta) {
      print(respuesta);
      this.entidad = entidad.fromMap(respuesta);
      if (metodoRespuestaInsertar != null)
        metodoRespuestaInsertar(context, elemento, this.entidad);
    });
  }

  modificarEntidad(BuildContext context, ElementoLista elemento,
      FlujoTrabajoDocumento entidad, Function metodoRespuestaModificar) {
    ContextoAplicacion.db.tablaConsultaDocumentos
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

    ContextoAplicacion.db.tablaConsultaDocumentos
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
