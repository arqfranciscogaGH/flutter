//  librerias internas de flutter

import 'dart:io';

//  librerias importadas flutter

//  librerias  proyecto

//  librerias internas de flutter

import 'dart:convert';

//  librerias importadas flutter

//  librerias  proyecto

import '../admin/IAccesoBD.dart';

class AccesoMemoria extends IAccesoBD {
  List<Map<String, dynamic>> lista = List<Map<String, dynamic>>();
  @override
  iniciar() async {
    lista = List<Map<String, dynamic>>();
  }

  @override
  abrir() async {}
  @override
  Future ejecutar(String sql) async {}
  @override
  Future<List<dynamic>> consultar(String nombreTabla) async {
    return lista;
  }

  @override
  Future<Map<String, dynamic>> obtener(String nombreTabla,
      Map<String, dynamic> map, String campo, int id) async {
    Map<String, dynamic> listaMap;
    listaMap = lista.firstWhere((o) => o["id"] == id);
    return listaMap;
  }

  @override
  Future<dynamic> insertar(String nombreTabla, Map<String, dynamic> map) async {
    lista.add(map);
    return map;
  }

  @override
  Future<dynamic> actualizar(String nombreTabla, Map<String, dynamic> map,
      String campo, int id) async {
    Map<String, dynamic> mapOrigen;
    lista.removeWhere((o) => o["id"] == id);
    lista.add(map);
    return map;
  }

  @override
  Future<Map<String, dynamic>> eliminar(String nombreTabla,
      Map<String, dynamic> map, String campo, int id) async {
    lista.removeWhere((o) => o["id"] == id);
    //lista.removeWhere( (Sting k, dynamic v) => k =='id' && v == id );
    return map;
  }
}
