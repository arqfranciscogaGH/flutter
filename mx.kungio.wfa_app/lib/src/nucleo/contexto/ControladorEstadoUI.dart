//  librerias internas de flutter
import 'package:flutter/material.dart';

//  librerias importadas flutter

//  librerias  proyecto

class ControladorEstadoUI extends ChangeNotifier {
  List<dynamic> _lista;
  List<dynamic> get lista {
    return this._lista;
  }

  set lista(List<dynamic> lista) {
    this._lista = lista;
    notifyListeners();
  }

  dynamic _entidad;
  dynamic get entidad {
    return this._entidad;
  }

  set entidad(dynamic entidad) {
    this._entidad = entidad;
    notifyListeners();
  }

  dynamic _contador;
  dynamic get contador {
    return this._contador;
  }

  set contador(dynamic contador) {
    this._contador = entidad;
    notifyListeners();
  }

  dynamic _valor;
  dynamic get valor {
    return this._valor;
  }

  set valor(dynamic valor) {
    this._valor = valor;
    notifyListeners();
  }

  String _cadena;
  String get cadena {
    return this._cadena;
  }

  set cadena(String cadena) {
    this._cadena = entidad;
    notifyListeners();
  }

  bool _actualizarControles;
  bool get actualizarControles {
    return this._actualizarControles;
  }

  set actualizarControles(bool actualizarControles) {
    this._actualizarControles = actualizarControles;
    if (actualizarControles) notifyListeners();
  }
}
