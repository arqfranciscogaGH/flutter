//  librerias internas de flutter

import 'dart:convert';

//  librerias importadas flutter

//  librerias  proyecto
import '../../negocio/endidad/EntidadBase.dart';
import 'IAccesoBD.dart';
import 'ConfiguracionAccesoBD.dart';
import 'AdministradorAcceso.dart';
import '../../servicios/ServiciosRest.dart';

class AccesoTabla<T extends EntidadBase> {
  ConfiguracionAccesoBD configuracion;
  List<T> lista = List<T>();
  int registros = 0;
  String parametros = "";
  IAccesoBD _abd;
/*   ControlLista<T> elementos; */
  T entidad;
  AccesoTabla({this.entidad, this.configuracion}) {
    /* elementos=ControlLista<T>(entidad:entidad); */
    _abd = AdministradorAcceso.obtener(this.configuracion);
    if (configuracion.persitenciaPorDefecto != true) _abd.iniciar();
  }

  Future ejecutar(String sql) async {
    final baseDatos = await _abd.ejecutar(sql);
  }

  Future<List<dynamic>> consultar(T entidad) async {
    _abd.configuracion = configuracion;
    List<dynamic> listaMapa = await _abd.consultar(entidad.tabla);
    return listaMapa;
  }

  Future<List<dynamic>> obtenerLista(T entidad) async {
    List<dynamic> listaMapa = [];
    _abd.configuracion = configuracion;
    listaMapa = await _abd.consultar(entidad.tabla);
    List<dynamic> lista = [];
    lista = listaMapa != null && listaMapa.isNotEmpty
        ? listaMapa.map((c) => entidad.fromMap(c)).toList()
        : [];
    return lista;
  }

/*  Future<List<dynamic>> obtenerListaCentral(T aEntidad) async {
      List<dynamic> lista;
      String url=generarUrl(aEntidad,"CL" );
      dynamic respuesta =await ServicioRest.get(url );
      if (respuesta.statusCode==200) 
          lista=jsonToList(respuesta.body);
      return  lista;
  } */
  Future<T> obtener(T entidad) async {
    _abd.configuracion = this.configuracion;
    dynamic res =
        await _abd.obtener(entidad.tabla, entidad.toMap(), null, entidad.id);
    entidad = res != null ? entidad.fromMap(res) : null;
    return entidad;
  }

/*   Future<T> obtenerCentral(T aEntidad) async {
        String url=generarUrl(aEntidad,"O");
        dynamic respuesta =await ServicioRest.get(url );
        if (respuesta.statusCode==200) 
           aEntidad.fromJson(respuesta.body);
        return  aEntidad;
  } */
  Future<dynamic> insertar(T entidad, [bool mapa = true]) async {
    if (configuracion.contadorRegistros == true) {
      registros = lista == null || lista.length == 0 ? 0 : lista.last.id;
      entidad.id = registros + 1;
    }

    dynamic res = await _abd.insertar(entidad.tabla, entidad.toMap());
    entidad = res != null ? entidad.fromMap(res) : null;
    // sincronizar(entidad,'I');
    if (mapa == true)
      return res;
    else
      return entidad;
  }

  Future<T> insertarCentral(T aEntidad) async {
    String url = generarUrl(aEntidad, "I");
    print(aEntidad.toJson());
    dynamic respuesta = await ServicioRest.post(url, aEntidad.toJson());
    print(respuesta.statusCode);
    //    entidad=entidad.fromJson(respuesta.body);
    if (respuesta.statusCode != 201) //404 409
      aEntidad = aEntidad.fromJson(respuesta.body);
    else
      return null;

    return aEntidad;
  }

  Future<T> actualizar(T entidad) async {
    dynamic res =
        await _abd.actualizar(entidad.tabla, entidad.toMap(), null, entidad.id);
    entidad = res != null ? entidad.fromMap(res) : null;
    /* sincronizar(entidad,'U'); */
    return entidad;
  }

  Future<T> actualizarCentral(T aEntidad) async {
    String url = generarUrl(aEntidad, "A");
    dynamic respuesta = await ServicioRest.put(url, aEntidad.toJson());
    return aEntidad;
  }

  Future<dynamic> eliminar(T entidad) async {
    dynamic res =
        await _abd.eliminar(entidad.tabla, entidad.toMap(), null, entidad.id);
    entidad = res != null ? entidad.fromMap(res) : null;
    /* sincronizar(entidad,'D'); */
    return entidad;
  }

  Future<T> eliminarCentral(T aEntidad) async {
    String url = generarUrl(aEntidad, "E");
    dynamic respuesta = await ServicioRest.delete(url, aEntidad.toJson());
    return aEntidad;
  }

  bool sincronizar(T entidad, String accion) {
    bool sincronizacion = false;
    if (configuracion.sincronizarServidor) {
      String url = generarUrl(entidad, accion);
      if (accion == "I") {
        ServicioRest.post(url, entidad.toJson()).then((respuesta) {
          print(respuesta.body);
          Map<String, dynamic> mapa = entidad.fromJsonToMap(respuesta.body);
          print(mapa);
          _actualizar(entidad);
        });
      } else if (accion == "U") {
        ServicioRest.put(url, entidad.toJson()).then((respuesta) {
          print(respuesta.body);
          Map<String, dynamic> mapa = entidad.fromJsonToMap(respuesta.body);
          print(mapa);
          _actualizar(entidad);
        });
      } else if (accion == "D") {
        ServicioRest.delete(url, entidad.toJson()).then((respuesta) {
          print(respuesta.body);
          Map<String, dynamic> mapa = entidad.fromJsonToMap(respuesta.body);
          print(mapa);
          _actualizar(entidad);
        });
      }
    }
    return sincronizacion;
  }

  String generarUrl(T entidad, String accion) {
    if (accion == "I" || accion == "CL")
      return configuracion.urlApi + "/personas";
    else
      return configuracion.urlApi + "/personas/" + entidad.id.toString();
  }

  void _actualizar(T entidad) {
    //actualizar(entidad);
  }
  List<Map<String, dynamic>> lisTotMap() {
    return lista.map((c) => c.toMap()).toList();
  }

  String toJson() {
    return json.encode(this.lisTotMap());
  }

  List<dynamic> mapTolista(List<dynamic> listaMapa) {
    List<dynamic> lista = listaMapa.isNotEmpty
        ? listaMapa.map((c) => entidad.iniciar().fromMap(c)).toList()
        : [];
    return lista;
  }

  List<dynamic> jsonToList(String cadenaJson) {
    List<dynamic> listaMap = json.decode(cadenaJson);
    List<dynamic> lista = mapTolista(listaMap);
    return lista;
  }
}
