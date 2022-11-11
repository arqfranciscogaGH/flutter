import 'package:flutter/material.dart';

//  librerias importadas flutter

//  librerias  proyecto

import '../../contexto/ContextoAplicacion.dart';

class ClienteCE extends ChangeNotifier {
  bool actualizarControles = false;
  // List<dynamic> _lista;
  // dynamic _entidad;
  dynamic get entidad {
    return ContextoAplicacion.db.tablaCliente!.entidad;
  }

  set entidad(dynamic entidad) {
    ContextoAplicacion.db.tablaCliente!.entidad = entidad;
    // this._entidad =entidad;
    this.actualizarControles = true;
    notifyListeners();
  }

  List<Cliente> get lista {
    // if (this._lista==null)
    // {
    //     ContextoAplicacion ContextoAplicacion =ContextoAplicacion.obtener(null);
    //     this._lista = ContextoAplicacion.db.tablaCliente.lista;
    // }
    return ContextoAplicacion.db.tablaCliente!.lista as List<Cliente>;
  }

  set lista(List<Cliente> lista) {
    ContextoAplicacion.db.tablaCliente!.lista = lista;
    notifyListeners();
  }

  //
  //  metodos de negocio y actualizar  el estado de  entidades
  //

  void limpiar() {
    ContextoAplicacion.db.tablaCliente!.lista = [];
    Cliente entidad = this.iniciarEntidad();
  }

  //
  //  asignar paramtros de api para consulta
  //
  dynamic asignarParametros(dynamic parmetros, String llaveApi) {
    ContextoAplicacion.db.tablaCliente!.configuracion!.parmetros = parmetros;
    ContextoAplicacion.db.tablaCliente!.configuracion!.filtro = "";
    ContextoAplicacion.db.tablaCliente!.configuracion!.llaveApi = llaveApi;
  }

  dynamic asignarParametrosFiltro(
      dynamic parmetros, dynamic filtro, String llaveApi) {
    ContextoAplicacion.db.tablaCliente!.configuracion!.parmetros = parmetros;
    ContextoAplicacion.db.tablaCliente!.configuracion!.filtro = filtro;
    ContextoAplicacion.db.tablaCliente!.configuracion!.llaveApi = llaveApi;
  }

  //
  //  metodos de negocio y actualizar  el estado de  entidades
  //

  dynamic iniciarEntidad() {
    Cliente entidad = Cliente().iniciar();
    // se asigna  datos entidad padre

    if (ContextoAplicacion.db.tablaCliente!.entidad.id != null)
      entidad.idSuscriptor = ContextoAplicacion.db.tablaCliente!.entidad.id;
    this.entidad = entidad;
    return entidad;
  }

  //
  //  metodos de negocio y  acceso  a  base de datos
  //
  consultarEntidad(Cliente entidad,
      [Function? metodoRespuestaConsultar = null]) {
    ContextoAplicacion.db.tablaCliente!
        .consultarTabla(entidad)
        .then((listaRespuesta) {
      List<Cliente> lista = listaRespuesta.cast<Cliente>().toList();
      this.lista = lista;
      if (metodoRespuestaConsultar != null) metodoRespuestaConsultar(lista);
    });
  }

  filtrarEntidad(Cliente entidad, String campo, dynamic valor,
      [Function? metodoRespuestaConsultar = null]) {
    ContextoAplicacion.db.tablaCliente!
        .filtrarTabla(entidad, campo, valor)
        .then((listaRespuesta) {
      List<Cliente> lista = listaRespuesta.cast<Cliente>().toList();
      this.lista = lista;
      if (metodoRespuestaConsultar != null) metodoRespuestaConsultar(lista);
    });
  }

  void obtenerEntidad(BuildContext context, ElementoLista elemento,
      Function metodorRespuestaObtener) {
    Cliente entidad = Cliente().iniciar();
    entidad.id = elemento.id;
    ContextoAplicacion.db.tablaCliente!.obtener(entidad).then((respuesta) {
      if (respuesta != null) {
        this.entidad = respuesta;
        if (metodorRespuestaObtener != null)
          metodorRespuestaObtener(context, elemento, respuesta);
      }
    });
  }

  insertarEntidad(BuildContext context, ElementoLista elemento, Cliente entidad,
      Function metodoRespuestaInsertar) {
    ContextoAplicacion.db.tablaCliente!.insertar(entidad).then((respuesta) {
      print(respuesta);
      this.entidad = entidad.fromMap(respuesta);
      if (metodoRespuestaInsertar != null)
        metodoRespuestaInsertar(context, elemento, this.entidad);
    });
  }

  modificarEntidad(BuildContext context, ElementoLista elemento,
      Cliente entidad, Function metodoRespuestaModificar) {
    ContextoAplicacion.db.tablaCliente!.actualizar(entidad).then((respuesta) {
      this.entidad = respuesta;
      if (metodoRespuestaModificar != null)
        metodoRespuestaModificar(context, elemento, entidad);
    });
  }

  void eliminarEntidad(BuildContext context, ElementoLista elemento,
      Function metodoRespuestaEliminar) {
    Cliente entidad = Cliente().iniciar();
    entidad.id = elemento.id;
    entidad.nombre = elemento.titulo;

    ContextoAplicacion.db.tablaCliente!.eliminar(entidad).then((respuesta) {
      // List<dynamic> lista = this.lista;
      lista.removeWhere((item) => item.id == entidad.id);
      // this.lista = lista;
      this.iniciarEntidad();
      if (metodoRespuestaEliminar != null)
        metodoRespuestaEliminar(context, elemento, respuesta);
      // }
    });

    dynamic obtenerEntidadDeLista(BuildContext context, ElementoLista elemento,
        Function metodorRespuestaObtener) {
      Cliente entidad = Cliente().iniciar();
      entidad.id = elemento.id;
      List<dynamic> lista = this.lista;
      if (lista != null) entidad = lista.where((s) => s.id == entidad.id).first;
      this.entidad = entidad;
      if (metodorRespuestaObtener != null)
        metodorRespuestaObtener(context, elemento, entidad);
      return entidad;
    }
  }

  //
  //  obtene lista  elementos por Suscripcion
  //

  List<dynamic> obtenerListaPorSuscripcion(int idSuscriptor) {
    List<dynamic>? listaRespuesta;
    if (this.lista != null) {
      listaRespuesta = this.lista;
      if (idSuscriptor == 1)
        listaRespuesta = this.lista;
      else if (idSuscriptor > 1)
        listaRespuesta =
            this.lista.where((s) => s.idSuscriptor == idSuscriptor).toList();
    }
    return listaRespuesta!;
  }
}
