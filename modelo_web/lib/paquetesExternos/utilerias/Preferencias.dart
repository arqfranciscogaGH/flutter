//  librerias internas de flutter
import 'package:flutter/material.dart';

import 'dart:convert';

//  librerias importadas flutter

import 'package:shared_preferences/shared_preferences.dart';

class Preferencias {
  //  variables
  static late  SharedPreferences  _pref ;
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
    instanciarSharedPreferences();
    // if (_variables==null)
    //     _variables = new Variables();
  }
  static instanciarSharedPreferences() async {

    //  final SharedPreferences _pr = await _pref;
    //  _pref=_pr;
    //  SharedPreferences.getInstance().then((pre) => _pref = pre);
    if  (  _pref == null ||   !inicio )
    {
         _pref  = await SharedPreferences.getInstance();
         inicio = true; 
    }
     
  }

  //  métodos

  static void limpiar() {
    _pref.clear();
  }

  static dynamic obtener(String nombre, dynamic valor) {
    try {
      String tipo;
      if (_pref == null) {
        instanciarSharedPreferences();
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