//  librerias internas de flutter
import 'package:flutter/material.dart';
import 'dart:convert';

//  librerias  proyecto


//  librerias externas flutter


import 'package:shared_preferences/shared_preferences.dart';

class Preferencias {
  //  variables
  static late  SharedPreferences  _pref ;
  static String _valor='';
  // static SharedPreferences _shaprefs;
   static bool inicio = false;
  //  propiedades

  // static final Preferencias _instancia = new Preferencias._internal();
  //   constructores
  // factory Preferencias() {

  //    return _instancia;
  // }
  // Preferencias._internal()
  // {
  //     instanciarSharedPreferences();
  // }

  Preferencias.iniciar() {
    instanciar();
    // if (_variables==null)
    //     _variables = new Variables();
  }
  static Future instanciar() async {
     _pref  = await SharedPreferences.getInstance();
  }

  //  métodos

  static void limpiar() {
    _pref.clear();
  }


  /* 
  static String get valor {
      return _pref.getString('valor') ?? _valor;
  }
  static  set  valor(String valor) {
        _valor =valor;
        _pref.setString('valor',valor );
  }
  */

  static dynamic obtener(String nombre, dynamic valor) {
    try {
      String tipo;
      if (_pref == null) {
        instanciar();
      }
      if (valor != null) {
        Type type = valor.runtimeType;
        tipo = type.toString();
      } else
        tipo = "string";

      valor = obtenerPorTipo(nombre, tipo, valor);
    } catch (error) {} finally {
      return valor;
    }
  }

  static dynamic obtenerPorTipo(String nombre, String tipo, [dynamic valor]) {
    try {
      switch (tipo.toLowerCase()) {
        case "string":
          {
            valor = _pref.getString(nombre) ?? valor;
          }
          break;
        case "int":
          {
            valor = _pref.getInt(nombre) ?? valor;
          }
          break;
        case "double":
          {
            valor = _pref.getDouble(nombre) ?? valor;
          }
          break;
        case "bool":
          {
            valor = _pref.getBool(nombre) ?? false;
          }
          break;
        default:
          {
            valor = _pref.getString(nombre) ?? '';
          }
          break;
      }
    } catch (error) {} finally {
      return valor;
    }
  }

  static guardar(String nombre, dynamic valor) {
    try {
      String tipo = valor.runtimeType.toString();

      switch (tipo.toLowerCase()) {
        case "string":
          {
            _pref.setString(nombre, valor);
          }
          break;
        case "int":
          {
            _pref.setInt(nombre, valor);
          }
          break;
        case "double":
          {
            _pref.setDouble(nombre, double.parse(valor));
          }
          break;
        case "bool":
          {
            bool temp;
            temp = valor;
            _pref.setBool(nombre, temp);
          }
          break;
        default:
          {
            _pref.setString(nombre, valor);
          }
          break;
      }
    } catch (error) {} finally {}
  }

}