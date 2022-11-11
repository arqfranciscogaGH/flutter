import 'package:flutter/material.dart';

//  librerias importadas flutter

//  librerias  proyecto

import '../../contexto/contexto.dart';

class ComunCE extends ChangeNotifier {
  // variables
  bool actualizarControles = false;
  AccesoTabla<Venta>? _tabla;

  //  propiedades
  //  tabla

  
  dynamic get tabla {
    return _tabla!;
  }

  set tabla(dynamic tabla) {
    _tabla = tabla;
  }

  //  entidad
  dynamic get entidad {
    return tabla!.entidad;
  }

  set entidad(dynamic entidad) {
    tabla.entidad = entidad;
    // this._entidad =entidad;
    this.actualizarControles = true;
    notifyListeners();
  }

  //  lista
  List<dynamic> get lista {
    // if (this._lista==null)
    // {
    //     ContextoAplicacion ContextoAplicacion =ContextoAplicacion.obtener(null);
    //     this._lista = ContextoAplicacion.db.tablaCliente.lista;
    // }
    return tabla!.lista;
  }

  set lista(List<dynamic> lista) {
    // tabla.lista = lista;
    notifyListeners();
  }

  //
  //  metodos de negocio y actualizar  el estado de  entidades
  //
   void actualizarUI() {
      notifyListeners();
  }


  void asignar(AccesoTabla<Venta> tabla) {
    _tabla = tabla;
    // tabla.lista = [];
    // entidad = tabla.iniciar();
  }

  void limpiar() {
    tabla.lista = [];
    entidad = tabla.iniciar();
  }

  //
  //  metodos de negocio y actualizar  el estado de  entidades
  //
  dynamic iniciarEntidad() {
    entidad = tabla.iniciar();
    return entidad;
  }

  //
  //  asignar paramtros de api para consulta
  //
  dynamic asignarParametros(dynamic parmetros, String llaveApi) {
    tabla.configuracion!.parmetros = parmetros;
    tabla.configuracion!.filtro = "";
    tabla.configuracion!.llaveApi = llaveApi;
  }

  dynamic asignarParametrosFiltro(
      dynamic parmetros, dynamic filtro, String llaveApi) {
    tabla.configuracion!.parmetros = parmetros;
    tabla.configuracion!.filtro = filtro;
    tabla.configuracion!.llaveApi = llaveApi;
  }

  //
  //  metodos de negocio y  acceso  a  base de datos
  //
  ver(dynamic entidad, [Function? metodoRespuestaConsultar = null]) {
    tabla.consultarTabla(entidad).then((listaRespuesta) {
      List<dynamic> lista = listaRespuesta.toList();
      this.lista = lista;
      if (metodoRespuestaConsultar != null) metodoRespuestaConsultar(lista);
    });
  }

  filtrarEntidad(dynamic entidad, String campo, dynamic valor,
      [Function? metodoRespuestaFiltrarr = null]) {
    tabla.filtrar(entidad, campo, valor).then((listaRespuesta) {
      List<dynamic> lista = listaRespuesta.toList();
      this.lista = lista;
      if (metodoRespuestaFiltrarr != null) metodoRespuestaFiltrarr(lista);
    });
  }

  void obtenerEntidad(BuildContext context, ElementoLista elemento,
      Function metodorRespuestaObtener) {
    dynamic entidad = iniciarEntidad();
    entidad.id = elemento.id;
    tabla.obtener(entidad).then((respuesta) {
      print(respuesta);
      if (respuesta != null) {
        this.entidad = respuesta;
        if (metodorRespuestaObtener != null)
          metodorRespuestaObtener(context, elemento, respuesta);
      }
    });
  }

  insertarEntidad(BuildContext context, ElementoLista elemento, dynamic entidad,
      Function metodoRespuestaInsertar) {
    tabla!.insertar(entidad).then((respuesta) {
      print(respuesta);
      this.entidad = entidad.fromMap(respuesta);
      if (metodoRespuestaInsertar != null)
        metodoRespuestaInsertar(context, elemento, this.entidad);
    });
  }

  modificarEntidad(BuildContext context, ElementoLista elemento,
      dynamic entidad, Function metodoRespuestaModificar) {
    tabla.actualizar(entidad).then((respuesta) {
      print(respuesta);
      this.entidad = respuesta;
      if (metodoRespuestaModificar != null)
        metodoRespuestaModificar(context, elemento, entidad);
    });
  }

  void eliminarEntidad(BuildContext context, ElementoLista elemento,
      Function metodoRespuestaEliminar) {
    dynamic entidad = iniciarEntidad();
    entidad.id = elemento.id;
    entidad.nombre = elemento.titulo;

    tabla.eliminar(entidad).then((respuesta) {
      print(respuesta);
      lista.removeWhere((item) => item.id == entidad.id);
      lista = lista;
      if (metodoRespuestaEliminar != null)
        metodoRespuestaEliminar(context, elemento, respuesta);
    });

    dynamic obtenerEntidadDeLista(BuildContext context, ElementoLista elemento,
        Function metodorRespuestaObtener) {
      dynamic entidad = iniciarEntidad();
      entidad.id = elemento.id;
      List<dynamic> lista = this.lista;
      if (lista != null) entidad = lista.where((s) => s.id == entidad.id).first;
      this.entidad = entidad;
      if (metodorRespuestaObtener != null)
        metodorRespuestaObtener(context, elemento, entidad);
      return entidad;
    }
  }
}
