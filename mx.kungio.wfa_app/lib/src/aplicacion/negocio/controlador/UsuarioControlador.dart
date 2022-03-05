import 'package:flutter/material.dart';

//  librerias importadas flutter

//  librerias  proyecto

import '../../contexto/contexto.dart';

class CuentaUsuarioControlador extends ChangeNotifier {
  bool actualizarControles = false;
  // List<dynamic> _lista;
  // dynamic _entidad;
  dynamic get entidad {
    // if (this._entidad==null)
    // {
    //     ContextoAplicacion ContextoAplicacion =ContextoAplicacion.obtener(null);
    //     this._entidad= ContextoAplicacion.db.tablaCuentaUsuario.entidad;
    // }
    return ContextoAplicacion.db.tablaCuentaUsuario.entidad;
  }

  set entidad(dynamic entidad) {
    ContextoAplicacion.db.tablaCuentaUsuario.entidad = entidad;
    // this._entidad =entidad;
    this.actualizarControles = true;
    notifyListeners();
  }

  List<dynamic> get lista {
    // if (this._lista==null)
    // {
    //     ContextoAplicacion ContextoAplicacion =ContextoAplicacion.obtener(null);
    //     this._lista = ContextoAplicacion.db.tablaCuentaUsuario.lista;
    // }
    return ContextoAplicacion.db.tablaCuentaUsuario.lista;
  }

  set lista(List<dynamic> lista) {
    ContextoAplicacion.db.tablaCuentaUsuario.lista = lista;
    notifyListeners();
  }

  //
  //  metodos de negocio y actualizar  el estado de  entidades
  //

  void limpiar() {
    ContextoAplicacion.db.tablaCuentaUsuario.lista = null;
    CuentaUsuario entidad = this.iniciarEntidad();
  }
  //
  //  asignar paramtros de api para consulta
  //
   dynamic asignarParametros( dynamic parmetros,String llaveApi) {
      ContextoAplicacion.db.tablaCuentaUsuario.configuracion.parmetros=parmetros;
      ContextoAplicacion.db.tablaCuentaUsuario.configuracion.llaveApi=llaveApi;
   }
   
  //
  //  metodos de negocio y actualizar  el estado de  entidades
  //

  dynamic iniciarEntidad() {
    CuentaUsuario entidad = CuentaUsuario().iniciar();
    // se asigna  datos entidad padre

    if (ContextoAplicacion.db.tablaSuscripcion.entidad.id != null)
      entidad.idSuscriptor = ContextoAplicacion.db.tablaSuscripcion.entidad.id;
    this.entidad = entidad;
    return entidad;
  }

  //
  //  metodos de negocio y  acceso  a  base de datos
  //
  consultarEntidad(CuentaUsuario entidad, Function metodoRespuestaConsultar) {
    ContextoAplicacion.db.tablaCuentaUsuario
        .obtenerLista(entidad)
        .then((listaRespuesta) {
      List<CuentaUsuario> lista = listaRespuesta.cast<CuentaUsuario>().toList();
      this.lista = lista;
      if (metodoRespuestaConsultar != null) metodoRespuestaConsultar(lista);
    });
  }

  void obtenerEntidad(BuildContext context, ElementoLista elemento,
      Function metodorRespuestaObtener) {
    CuentaUsuario entidad = CuentaUsuario().iniciar();
    entidad.id = elemento.id;
    ContextoAplicacion.db.tablaCuentaUsuario.obtener(entidad).then((respuesta) {
      if (respuesta != null) {
        this.entidad = respuesta;
        if (metodorRespuestaObtener != null)
          metodorRespuestaObtener(context, elemento, respuesta);
      }
    });
  }

  dynamic obtenerEntidadDeLista(BuildContext context, ElementoLista elemento,
      Function metodorRespuestaObtener) {
    CuentaUsuario entidad = CuentaUsuario().iniciar();
    entidad.id = elemento.id;
    List<dynamic> lista = this.lista;
    if (lista != null) entidad = lista.where((s) => s.id == entidad.id).first;
    this.entidad = entidad;
    if (metodorRespuestaObtener != null)
      metodorRespuestaObtener(context, elemento, entidad);
    return entidad;
  }

  insertarEntidad(BuildContext context, ElementoLista elemento, CuentaUsuario entidad,
      Function metodoRespuestaInsertar) {
    ContextoAplicacion.db.tablaCuentaUsuario.insertar(entidad).then((respuesta) {
      print(respuesta);
      this.entidad = entidad.fromMap(respuesta);
      if (metodoRespuestaInsertar != null)
        metodoRespuestaInsertar(context, elemento, this.entidad);
    });
  }

  modificarEntidad(BuildContext context, ElementoLista elemento,
      CuentaUsuario entidad, Function metodoRespuestaModificar) {
    ContextoAplicacion.db.tablaCuentaUsuario.actualizar(entidad).then((respuesta) {
      this.entidad = respuesta;
      if (metodoRespuestaModificar != null)
        metodoRespuestaModificar(context, elemento, entidad);
    });
  }

  void eliminarEntidad(BuildContext context, ElementoLista elemento,
      Function metodoRespuestaEliminar) {
    CuentaUsuario entidad = CuentaUsuario().iniciar();
    entidad.id = elemento.id;
    entidad.nombre = elemento.titulo;

    ContextoAplicacion.db.tablaCuentaUsuario.eliminar(entidad).then((respuesta) {
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
  //  obtene lista  elementos por Suscripcion
  //

  List<dynamic> obtenerListaPorSuscripcion(int idSuscriptor) {
    List<dynamic> listaRespuesta;
    if (this.lista != null) {
      listaRespuesta = this.lista;
      if (idSuscriptor == 1)
        listaRespuesta = this.lista;
      else if (idSuscriptor > 1)
        listaRespuesta =
            this.lista.where((s) => s.idSuscriptor == idSuscriptor).toList();
    }
    return listaRespuesta;
  }
}
