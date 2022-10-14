import 'package:flutter/material.dart';

//  librerias importadas flutter

//  librerias  proyecto

import '../../contexto/contexto.dart';

class AdministracionUsuariosControlador extends ChangeNotifier {
  bool actualizarControles = false;
  // List<dynamic> _lista;
  // dynamic _entidad;
  dynamic get entidad {
    // if (this._entidad==null)
    // {
    //     ContextoAplicacion ContextoAplicacion =ContextoAplicacion.obtener(null);
    //     this._entidad= ContextoAplicacion.db.tablaAdministracionUsuarios.entidad;
    // }
    return ContextoAplicacion.db.tablaAdministracionUsuarios.entidad;
  }

  set entidad(dynamic entidad) {
    ContextoAplicacion.db.tablaAdministracionUsuarios.entidad = entidad;
    // this._entidad =entidad;
    this.actualizarControles = true;
    notifyListeners();
  }

  List<dynamic> get lista {
    // if (this._lista==null)
    // {
    //     ContextoAplicacion ContextoAplicacion =ContextoAplicacion.obtener(null);
    //     this._lista = ContextoAplicacion.db.tablaAdministracionUsuarios.lista;
    // }
    return ContextoAplicacion.db.tablaAdministracionUsuarios.lista;
  }

  set lista(List<dynamic> lista) {
    ContextoAplicacion.db.tablaAdministracionUsuarios.lista = lista;
    notifyListeners();
  }

  //
  //  metodos de negocio y actualizar  el estado de  entidades
  //

  void limpiar() {
    ContextoAplicacion.db.tablaAdministracionUsuarios.lista = null;
    AdministracionUsuarios entidad = this.iniciarEntidad();
  }
  //
  //  asignar paramtros de api para consulta
  //
   dynamic asignarParametros( dynamic parmetros,String llaveApi) {
      ContextoAplicacion.db.tablaAdministracionUsuarios.configuracion.parmetros=parmetros;
      ContextoAplicacion.db.tablaAdministracionUsuarios.configuracion.llaveApi=llaveApi;
   }
   
  //
  //  metodos de negocio y actualizar  el estado de  entidades
  //

  dynamic iniciarEntidad() {
    AdministracionUsuarios entidad = AdministracionUsuarios().iniciar();
    // se asigna  datos entidad padre

    if (ContextoAplicacion.db.tablaSuscripcion.entidad.id != null)
      entidad.idSuscriptor = ContextoAplicacion.db.tablaSuscripcion.entidad.id;
    this.entidad = entidad;
    return entidad;
  }

  //
  //  metodos de negocio y  acceso  a  base de datos
  //
  consultarEntidad(AdministracionUsuarios entidad, Function metodoRespuestaConsultar) {
    ContextoAplicacion.db.tablaAdministracionUsuarios
        .obtenerLista(entidad)
        .then((listaRespuesta) {
      List<AdministracionUsuarios> lista = listaRespuesta.cast<AdministracionUsuarios>().toList();
      this.lista = lista;
      if (metodoRespuestaConsultar != null) metodoRespuestaConsultar(lista);
    });
  }

  void obtenerEntidad(BuildContext context, ElementoLista elemento,
      Function metodorRespuestaObtener) {
    AdministracionUsuarios entidad = AdministracionUsuarios().iniciar();
    entidad.id = elemento.id;
    ContextoAplicacion.db.tablaAdministracionUsuarios.obtener(entidad).then((respuesta) {
      if (respuesta != null) {
        this.entidad = respuesta;
        if (metodorRespuestaObtener != null)
          metodorRespuestaObtener(context, elemento, respuesta);
      }
    });
  }

  dynamic obtenerEntidadDeLista(BuildContext context, ElementoLista elemento,
      Function metodorRespuestaObtener) {
    AdministracionUsuarios entidad = AdministracionUsuarios().iniciar();
    entidad.id = elemento.id;
    List<dynamic> lista = this.lista;
    if (lista != null) entidad = lista.where((s) => s.id == entidad.id).first;
    this.entidad = entidad;
    if (metodorRespuestaObtener != null)
      metodorRespuestaObtener(context, elemento, entidad);
    return entidad;
  }

  insertarEntidad(BuildContext context, ElementoLista elemento, AdministracionUsuarios entidad,
      Function metodoRespuestaInsertar) {
    ContextoAplicacion.db.tablaAdministracionUsuarios.insertar(entidad).then((respuesta) {
      print(respuesta);
      this.entidad = entidad.fromMap(respuesta);
      if (metodoRespuestaInsertar != null)
        metodoRespuestaInsertar(context, elemento, this.entidad);
    });
  }

  modificarEntidad(BuildContext context, ElementoLista elemento,
      AdministracionUsuarios entidad, Function metodoRespuestaModificar) {
    ContextoAplicacion.db.tablaAdministracionUsuarios.actualizar(entidad).then((respuesta) {
      this.entidad = respuesta;
      if (metodoRespuestaModificar != null)
        metodoRespuestaModificar(context, elemento, entidad);
    });
  }

  void eliminarEntidad(BuildContext context, ElementoLista elemento,
      Function metodoRespuestaEliminar) {
    AdministracionUsuarios entidad = AdministracionUsuarios().iniciar();
    entidad.id = elemento.id;
    entidad.nombre = elemento.titulo;

    ContextoAplicacion.db.tablaAdministracionUsuarios.eliminar(entidad).then((respuesta) {
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
