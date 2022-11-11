//  librerias internas de flutter

import 'dart:convert';

//  librerias importadas flutter

//  librerias  proyecto
import '../../negocio/modelo/endidad/EntidadBase.dart';
import 'IAccesoBD.dart';
import 'ConfiguracionAccesoBD.dart';
import 'AdministradorAcceso.dart';
import '../../negocio/controladorEstado/ControlEstadoUI.dart';

class AccesoTabla<T extends EntidadBase> {
  // variables

  ConfiguracionAccesoBD? configuracion;
  T claseEntidad;
  List<T> _lista = [];
  int consecutivo = 0;
  String parametros = "";
  IAccesoBD? _abd;

  EntidadResultado? _resultado;
  EntidadRegistro? _registro;
  ControlEstadoUI? controlEstadoUI;

  // Map<String, dynamic>? _registro ={};
  // List<dynamic>? _tabla= [];

  /*   ControlLista<T> elementos; */

  //  Cosntructor
  AccesoTabla({required this.claseEntidad, this.configuracion}) {
    _abd = AdministradorAcceso.obtener(this.configuracion!);
    _resultado = EntidadResultado();
    _registro = EntidadRegistro();
    _resultado!.campoLLave = claseEntidad.campoLLave;
    entidad = claseEntidad;
    if (configuracion!.persitenciaPorDefecto != true) _abd!.iniciar();
  }

  //  propiedades

//  obtener lista tabla  map texto, se obtiene  resultado  de api o db
  EntidadResultado get resultado {
    return _resultado!;
  }

  //  asignar  lista tabla  map de texto, se obtiene  resultado  de api o db

  set resultado(EntidadResultado resultado) {
    _resultado = resultado;
    // if (tabla.datos != null) _lista = mapTolista(tabla.datos);
  }

  //  obtener  map de entidad registro texto

  EntidadRegistro get registro {
    return _registro!;
  }

  //  asignar map a entidad  registro texto
  set registro(EntidadRegistro r) {
    registro = r;
    claseEntidad.fromMap(registro.datos);
  }

  //  obtener entidad

  T get entidad {
    return claseEntidad;
  }

  //  asignar entidad
  set entidad(T entidad) {
    claseEntidad = entidad;
    registro.datos = entidad.toMap();
  }

//  obtener lista  map texto, se obtiene  resultado  de api o db
  List<T> get lista {
    List<T>? listaT;
    if (resultado.datos != null) listaT = mapTolista(resultado.datos);
    return listaT!;
  }

  //  asignar  lista  map de texto, se obtiene  resultado  de api o db
  set lista(List<dynamic> lista) {
    // _lista = lista as List<T>;
    resultado.datos = lista.map((c) => c.toMap()).toList();
  }

  dynamic iniciar() {
    return claseEntidad.iniciar();
  }
  //  metodos conversion  lista de MAp  a   lista  de entidades

  List<T> mapTolista(List<dynamic> listaMapa) {
    List<T> listaT = listaMapa != null && listaMapa.isNotEmpty
        ? entidad.mapTolista(listaMapa) as List<T>
        : [];
    return listaT;
  }

  //  metodos conversion  lista  de entidades  a  lista  MAP
  List<dynamic> listaToMap() {
    return lista.map((c) => c.toMap()).toList();
  }

  //  metodos conversion  lista  de entidades  a  cadena json

  String listaToJson() {
    return json.encode(this.listaToMap());
  }

  // metodos conversion cadena Json a   lista  de entidades

  List<dynamic> jsonToLista(String cadenaJson) {
    List<dynamic> listaMap = json.decode(cadenaJson);
    List<dynamic> listaT = mapTolista(listaMap);
    return listaT;
  }

  //  metodos  ABC  tablas
  Future ejecutar(String sql) async {
    final baseDatos = await _abd!.ejecutar(sql);
  }

  Future<List<dynamic>> consultarTabla(T e,
      [Function? metodoRespuesta = null]) async {
    List<dynamic> respuesta = [];
    _abd!.configuracion = this.configuracion!;
    respuesta = await _abd!.consultarTabla(e.nombreTabla!);
    resultado.datos = respuesta;
    List<dynamic> lista = [];
    lista = respuesta != null && respuesta.isNotEmpty
        ? respuesta.map((c) => e.iniciar().fromMap(c)).toList()
        : [];
    if (metodoRespuesta != null)
      metodoRespuesta(lista);
    else if (controlEstadoUI != null) controlEstadoUI!.actualizar();
    return lista;
  }

  Future<List<dynamic>> filtrarTabla(T e, String campo, dynamic valor,
      [Function? metodoRespuesta = null]) async {
    List<dynamic> respuesta = [];
    _abd!.configuracion = this.configuracion!;
    respuesta =
        await _abd!.filtrarTabla(e.nombreTabla!, e.toMap(), campo, valor);
    List<dynamic> lista = [];
    lista = respuesta != null && respuesta.isNotEmpty
        ? respuesta.map((c) => e.iniciar().fromMap(c)).toList()
        : [];
    if (metodoRespuesta != null)
      metodoRespuesta(lista);
    else if (controlEstadoUI != null) controlEstadoUI!.actualizar();
    return lista;
  }

  Future<T> obtener(T e) async {
    _abd!.configuracion = this.configuracion!;
    dynamic respuesta = await _abd!.obtener(
        e.nombreTabla!, e.toMap(), e.campoLLave!, e.toMap()[e.campoLLave!]);
    if (respuesta != null) {
      entidad = e.fromMap(respuesta) as T;
      registro.datos = e.toMap();
    }

    return entidad;
  }

  Future<Map<String, dynamic>> incrementarConsecutivo(T e) async {
    await consultarTabla(e);

    Map<String, dynamic> mapRegistro = e.toMap();
    // if (configuracion!.contadorRegistros == true) {
    //   registros = tabla.datos == null || tabla.datos.length == 0 ? 0 : lista.last.id??0;
    //   e.id = registros! + 1;
    // }
    // print ( 'incrementarConsecutivo' );
    // print ( e.campoLLave );
    if (configuracion!.contadorRegistros == true) {
      consecutivo = resultado.datos == null || resultado.datos.length == 0
          ? 0
          : resultado.datos.last[e.campoLLave!] ?? 0;
      consecutivo++;
      mapRegistro[e.campoLLave!] = consecutivo;
      e.id == consecutivo;
    }
    return mapRegistro;
  }

  Future<dynamic> insertar(T e) async {
    Map<String, dynamic> map = e.toMap();
    if (configuracion!.contadorRegistros == true) {
      map = await incrementarConsecutivo(e);
    }
    dynamic respuesta = await _abd!.insertar(e.nombreTabla!, map);
    if (respuesta != null) {
      entidad = e.fromMap(respuesta) as T;
      registro.datos = e.toMap();
    }
    return entidad;
  }

  Future<T> actualizar(T e) async {
    dynamic respuesta = await _abd!.actualizar(
        e.nombreTabla!, e.toMap(), e.campoLLave!, e.toMap()[e.campoLLave!]);
    if (respuesta != null) {
      entidad = e.fromMap(respuesta) as T;
      registro.datos = e.toMap();
    }
    return entidad;
  }

  Future<dynamic> eliminar(T e) async {
    dynamic respuesta = await _abd!.eliminar(
        e.nombreTabla!, e.toMap(), e.campoLLave!, e.toMap()[e.campoLLave!]);
    if (respuesta != null) {
      entidad = e.fromMap(respuesta) as T;
      registro.datos = e.toMap();
    }
    return entidad;
  }

  /*  Future<List<dynamic>> obtenerListaCentral(T aEntidad) async {
      List<dynamic> lista;
      String url=generarUrl(aEntidad,"CL" );
      dynamic respuesta =await ServicioRest.get(url );
      if (respuesta.statusCode==200) 
          lista=jsonToList(respuesta.body);
      return  lista;
  } */

  // Future<T> insertarCentral(T aEntidad) async {
  //   String url = generarUrl(aEntidad, "I");
  //   print(aEntidad.toJson());
  //   dynamic respuesta = await ServicioRest.post(url, aEntidad.toJson());
  //   print(respuesta.statusCode);
  //   //    entidad=entidad.fromJson(respuesta.body);
  //   if (respuesta.statusCode != 201) //404 409
  //     aEntidad = aEntidad.fromJson(respuesta.body);
  //   else
  //     return null;

  //   return aEntidad;
  // }
/*   Future<T> obtenerCentral(T aEntidad) async {
        String url=generarUrl(aEntidad,"O");
        dynamic respuesta =await ServicioRest.get(url );
        if (respuesta.statusCode==200) 
           aEntidad.fromJson(respuesta.body);
        return  aEntidad;
  } */

  // Future<T> actualizarCentral(T aEntidad) async {
  //   String url = generarUrl(aEntidad, "A");
  //   dynamic respuesta = await ServicioRest.put(url, aEntidad.toJson());
  //   return aEntidad;
  // }

  // Future<T> eliminarCentral(T aEntidad) async {
  //   String url = generarUrl(aEntidad, "E");
  //   dynamic respuesta = await ServicioRest.delete(url, aEntidad.toJson());
  //   return aEntidad;
  // }

  // bool sincronizar(T entidad, String accion) {
  //   bool sincronizacion = false;
  //   if (configuracion.sincronizarServidor) {
  //     String url = generarUrl(entidad, accion);
  //     if (accion == "I") {
  //       ServicioRest.post(url, entidad.toJson()).then((respuesta) {
  //         print(respuesta.body);
  //         Map<String, dynamic> mapa = entidad.fromJsonToMap(respuesta.body);
  //         print(mapa);
  //         _actualizar(entidad);
  //       });
  //     } else if (accion == "U") {
  //       ServicioRest.put(url, entidad.toJson()).then((respuesta) {
  //         print(respuesta.body);
  //         Map<String, dynamic> mapa = entidad.fromJsonToMap(respuesta.body);
  //         print(mapa);
  //         _actualizar(entidad);
  //       });
  //     } else if (accion == "D") {
  //       ServicioRest.delete(url, entidad.toJson()).then((respuesta) {
  //         print(respuesta.body);
  //         Map<String, dynamic> mapa = entidad.fromJsonToMap(respuesta.body);
  //         print(mapa);
  //         _actualizar(entidad);
  //       });
  //     }
  //   }
  //   return sincronizacion;
  // }

}
