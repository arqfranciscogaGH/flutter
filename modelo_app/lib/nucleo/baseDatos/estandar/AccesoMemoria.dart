//  librerias internas de flutter

import 'dart:io';

//  librerias importadas flutter

//  librerias  proyecto

//  librerias internas de flutter

import 'dart:convert';

//  librerias importadas flutter

//  librerias  proyecto

import '../admin/IAccesoBD.dart';
import '../admin/ConfiguracionAccesoBD.dart';

class AccesoMemoria implements IAccesoBD {
  // variables

  ConfiguracionAccesoBD? _configuracion;

  List<dynamic>? _datos;

  //  constructor
  AccesoMemoria() {
    iniciar();
  }
  // propiedades
  //
  //  obtener configuracion
  @override
  ConfiguracionAccesoBD get configuracion {
    return _configuracion!;
  }

  //  asignar  configuracion
  @override
  set configuracion(ConfiguracionAccesoBD configuracion) {
    _configuracion = configuracion;
  }

  // metodos
  @override
  iniciar() async {
    _datos = [];
  }

  @override
  abrir() async {}

  @override
  cerrar() async {}

  // metodos  ABC  base de datos

  @override
  Future ejecutar(String sql) async {}

  @override
  Future<List<dynamic>> consultarTabla(String nombreTabla) async {
    return _datos!;
  }

  @override
  Future<Map<String, dynamic>> filtrarTabla(String nombreTabla,
      Map<String, dynamic> map, String campo, dynamic valor) async {
    Map<String, dynamic> resultado;
    resultado = _datos!.firstWhere((o) => o[campo] == valor);
    return resultado;
  }

  @override
  Future<Map<String, dynamic>> obtener(String nombreTabla,
      Map<String, dynamic> map, String campo, dynamic valor) async {
    Map<String, dynamic> resultado;
    resultado = _datos!.firstWhere((o) => o[campo] == valor);
    return resultado;
  }

  @override
  Future<dynamic> insertar(String nombreTabla, Map<String, dynamic> map) async {
    _datos!.add(map);
    return map;
  }

  @override
  Future<dynamic> actualizar(String nombreTabla, Map<String, dynamic> map,
      String campo, dynamic valor) async {
    Map<String, dynamic> resultado;
    _datos!.removeWhere((o) => o[campo] == valor);
    _datos!..add(map);
    resultado = _datos!.firstWhere((o) => o[campo] == valor);
    return resultado;
  }

  @override
  Future<Map<String, dynamic>> eliminar(String nombreTabla,
      Map<String, dynamic> map, String campo, dynamic valor) async {
    _datos!.removeWhere((o) => o[campo] == valor);
    //lista.removeWhere( (Sting k, dynamic v) => k =='id' && v == id );
    return map;
  }

  @override
  Future<dynamic> sqlConsultar(String sql) async {
    return _datos!;
  }

  @override
  Future<dynamic> sqlInsertar(String sql) async {
    return _datos!;
  }

  @override
  Future<dynamic> sqlActualizar(String sql) async {
    return _datos!;
  }

  @override
  Future<dynamic> sqlEliminar(String sql) async {
    return _datos!;
  }
}
