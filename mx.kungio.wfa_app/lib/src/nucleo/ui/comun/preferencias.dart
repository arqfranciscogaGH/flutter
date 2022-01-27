//  librerias internas de flutter
import 'package:flutter/material.dart';

import 'dart:convert';

//  librerias importadas flutter

import 'package:shared_preferences/shared_preferences.dart';
import '../../negocio/endidad/EntidadBase.dart';
import 'colores.dart';

//  librerias  proyecto

class Configuracion {
  static String _tema;
  static String _colorSecundario;
  static int _brillo;

  static String _cuenta;
  static int _idSuscriptor;

  static String get cuenta {
    if (_cuenta == null || _cuenta == '')
      _cuenta = Preferencias.obtener("cuenta", _cuenta);
    return _cuenta == null || _cuenta == '' ? "" : _cuenta;
  }

  static void set cuenta(String valor) {
    _cuenta = valor;
    Preferencias.guardar("cuenta", valor);
  }

  static int get idSuscriptor {
    if (_idSuscriptor == null)
      _idSuscriptor = Preferencias.obtener("idSuscriptor", _idSuscriptor);
    return _idSuscriptor == null ? 0 : _idSuscriptor;
  }

  static void set idSuscriptor(int valor) {
    _idSuscriptor = valor;
    Preferencias.guardar("idSuscriptor", valor);
  }

  static String get colorSecundario {
    if (_colorSecundario == null || _colorSecundario == '')
      _colorSecundario =
          Preferencias.obtener("colorSecundario", _colorSecundario);
    return _colorSecundario == null || _colorSecundario == ''
        ? "gris"
        : _colorSecundario;
  }

  static void set colorSecundario(String valor) {
    _colorSecundario = valor;
    Preferencias.guardar("colorSecundario", valor);
  }

  static String get tema {
    return obtenerTema();
  }

  static String obtenerTema() {
    if (_tema == null || _tema == '')
      _tema = Preferencias.obtener("tema", _tema);
    return _tema == null || _tema == '' ? "azul" : _tema;
  }

  static void set tema(String valor) {
    _tema = valor;
  }

  static guardarTema(String valor) {
    _tema = valor;
    Preferencias.guardar("tema", valor);
  }

  static int get brillo {
    return obtenerrBrillo();
  }

  static int obtenerrBrillo() {
    if (_brillo == null) _brillo = Preferencias.obtener("brillo", _brillo);
    return _brillo == null || _brillo == 0 ? 0 : _brillo;
  }

  static void set brillo(int valor) {
    _brillo = valor;
  }

  static void guardarBrillo(int valor) {
    _brillo = valor;
    Preferencias.guardar("brillo", valor);
  }

  static Variables _variables;
  Variables obtenerVariables() {
    return _variables;
  }
}

class Preferencias {
  //  variables
  // Future<SharedPreferences>  _prefInicial = SharedPreferences.getInstance();
  static SharedPreferences _shaprefs;
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
    if (_shaprefs == null && !inicio) {
      // _shaprefs= await  _prefInicial;
      inicio = true;
      SharedPreferences.getInstance().then((prefs) => _shaprefs = prefs);
      _shaprefs = await SharedPreferences.getInstance();
    }
  }

  //  métodos

  static void limpiar() {
    _shaprefs.clear();
  }

  static dynamic obtener(String nombre, dynamic valor) {
    try {
      String tipo;
      if (_shaprefs == null) {
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
            valor = _shaprefs.getString(nombre) ?? valor;
          }
          break;
        case "int":
          {
            valor = _shaprefs.getInt(nombre) ?? valor;
          }
          break;
        case "double":
          {
            valor = _shaprefs.getDouble(nombre) ?? valor;
          }
          break;
        case "bool":
          {
            valor = _shaprefs.getBool(nombre) ?? false;
          }
          break;
        default:
          {
            valor = _shaprefs.getString(nombre) ?? '';
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
            _shaprefs.setString(nombre, valor);
          }
          break;
        case "int":
          {
            _shaprefs.setInt(nombre, valor);
          }
          break;
        case "double":
          {
            _shaprefs.setDouble(nombre, double.parse(valor));
          }
          break;
        case "bool":
          {
            bool temp;
            temp = valor;
            _shaprefs.setBool(nombre, temp);
          }
          break;
        default:
          {
            _shaprefs.setString(nombre, valor);
          }
          break;
      }
    } catch (error) {} finally {}
  }
}

class Variable extends EntidadBase {
  @override
  int id;
  @override
  String nombre;
  String tipo;
  dynamic valor;

  //    métodos
  Variable({
    this.id,
    this.nombre,
    this.tipo,
    this.valor,
  }) : super(id: id, tabla: "Variable");
  factory Variable.fromMap(Map<String, dynamic> map) => new Variable(
      id: map["id"],
      nombre: map["nombre"],
      tipo: map["tipo"],
      valor: map["valor"]);
  Variable fromMap(Map<String, dynamic> map) => new Variable(
      id: map["id"],
      nombre: map["nombre"],
      tipo: map["tipo"],
      valor: map["valor"]);
  @override
  Map<String, dynamic> toMap() => {
        "id": id,
        "nombre": nombre,
        "tipo": tipo,
        "valor": valor,
      };
}

class Variables extends ControlLista<Variable> {}
