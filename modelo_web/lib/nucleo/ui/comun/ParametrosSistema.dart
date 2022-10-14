//  librerias internas de flutter
import 'package:flutter/material.dart';

import 'dart:convert';

//  librerias importadas flutter


import 'Colores.dart';

//  librerias  proyecto

class ParametrosSistema {
  static String? tema;
  static Color colorSecundario=Colors.green;
  static int? brillo;
  static Color primario =Colors.blueAccent ;
  static bool esModoObscuro=true;






  // static String get colorSecundario {
  //   if (_colorSecundario == null || _colorSecundario == '')
  //     _colorSecundario =
  //         Preferencias.obtener("colorSecundario", _colorSecundario);
  //   return _colorSecundario == null || _colorSecundario == ''
  //       ? "gris"
  //       : _colorSecundario;
  // }

  // static void set colorSecundario(String valor) {
  //   _colorSecundario = valor;
  //   Preferencias.guardar("colorSecundario", valor);
  // }

  // static String get tema {
  //   return obtenerTema();
  // }

  // static String obtenerTema() {
  //   if (_tema == null || _tema == '')
  //     _tema = Preferencias.obtener("tema", _tema);
  //   return _tema == null || _tema == '' ? "azul" : _tema;
  // }

  // static void set tema(String valor) {
  //   _tema = valor;
  // }

  // static guardarTema(String valor) {
  //   _tema = valor;
  //   Preferencias.guardar("tema", valor);
  // }

  // static int get brillo {
  //   return obtenerrBrillo();
  // }

  // static int obtenerrBrillo() {
  //   if (_brillo == null) _brillo = Preferencias.obtener("brillo", _brillo);
  //   return _brillo == null || _brillo == 0 ? 0 : _brillo;
  // }

  // static void set brillo(int valor) {
  //   _brillo = valor;
  // }

  // static void guardarBrillo(int valor) {
  //   _brillo = valor;
  //   Preferencias.guardar("brillo", valor);
  // }

  // static Variables _variables;
  // Variables obtenerVariables() {
  //   return _variables;
  // }

}