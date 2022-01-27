//  librerias internas de flutter

import 'dart:convert';

//  librerias importadas flutter
import 'package:flutter/services.dart' show rootBundle;

//  librerias  proyecto

class proveedorInformacion {
  static String _archivo;
  dynamic _datos = null;
  List<dynamic> _elementos = [];
  proveedorInformacion() {
    _elementos = CargaryObtener('datos/menus.json', 'rutas');
  }
  dynamic Cargar(String archivo) {
    _archivo = archivo;
    rootBundle.loadString(archivo).then((datos) {
      _datos = datos;
      print(_datos);
    });
    return _datos;
  }

  Future<String> cargarArchivo() async {
    String contenido = await rootBundle.loadString('assets/datos/iconos.json');
    return contenido;
  }

  List<dynamic> CargaryObtener(String archivo, String idmenu) {
    List<dynamic> elementos;
    _archivo = archivo;
    rootBundle.loadString(archivo).then((datos) {
      _datos = datos;
      print(_datos);
      _elementos = ObtenerElementos(idmenu);
      print(elementos);
    });
    return elementos;
  }

  Future<List<dynamic>> CargarAsincrono(String archivo, String idmenu) async {
    _datos = await rootBundle.loadString(archivo);
    _elementos = ObtenerElementos(idmenu);
    return _elementos;
  }

  List<dynamic> ObtenerElementos(String idmenu) {
    if (_datos != null) {
      Map dataMap = json.decode(_datos);
      _elementos = dataMap[idmenu];
    }
    return _elementos;
  }

  List<dynamic> ObtenerOpcionesMenuPorDefecto() {
    return _elementos;
  }

  List<dynamic> ObtenerOpcionesMenu(String idmenu) {
    return CargaryObtener(_archivo, idmenu);
  }
}

final ProveedorInformacion = new proveedorInformacion();
