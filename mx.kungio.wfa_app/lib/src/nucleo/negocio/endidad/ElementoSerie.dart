//  librerias internas de flutter
import 'package:flutter/material.dart';

import 'dart:convert';

//  librerias importadas flutter

//  librerias  proyecto

import '../../negocio/modelo/ModeloBase.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ElementoSerie extends EntidadBase {
  String serie;
  String titulo;
  int valor;
  int metrica;
  double x;
  double y;
  dynamic color;
  charts.Color colorG;
  int activo;
  ElementoSerie(
      {id,
      nombre,
      clave,
      llave,
      this.titulo,
      this.serie,
      this.valor,
      /* @required  */ this.metrica,
      this.color,
      this.colorG,
      this.x,
      this.y,
      this.activo})
      : super(
            id: id,
            nombre: nombre,
            clave: clave,
            llave: llave,
            tabla: "ElementoSerie");
  factory ElementoSerie.fromMap(Map<String, dynamic> map) => new ElementoSerie(
        titulo: map["titulo"],
        serie: map["serie"],
        metrica: map["metrica"],
        //metrica: double.parse(map["metrica"].toString()),
        valor: map["valor"],
        color: map["color"],
        // colorN: map["colorN"],
        x: map["x"],
        y: map["y"],
        activo: int.parse(map["activo"].toString()),
      );
  ElementoSerie fromMap(Map<String, dynamic> map) => new ElementoSerie(
        titulo: map["titulo"],
        serie: map["serie"],
        metrica: map["metrica"],
        //metrica: double.parse(map["metrica"].toString()),
        valor: map["valor"],
        color: map["color"],
        // colorN: map["colorN"],
        x: map["x"],
        y: map["y"],
        activo: int.parse(map["activo"].toString()),
      );
  Map<String, dynamic> toMap() => {
        "titulo": titulo,
        "serie": serie,
        "metrica": metrica,
        "valor": valor,
        "color": color,
        // "colorN": colorN,
        "x": x,
        "y": y,
        "activo": activo,
      };

  String toJson() => json.encode(this.toMap());
  ElementoSerie fromJson(String cadenaJson) =>
      this.fromMap(json.decode(cadenaJson));

  Map<String, dynamic> fromJsonToMap(String cadenaJson) =>
      json.decode(cadenaJson);

  List<ElementoSerie> mapTolist(List<dynamic> listaMapa) {
    List<ElementoSerie> lista = listaMapa.isNotEmpty
        ? listaMapa.map((c) => this.fromMap(c)).toList()
        : [];
    return lista;
  }

  List<ElementoSerie> jsonToList(String cadenaJson) {
    List<dynamic> listaMap = json.decode(cadenaJson);
    List<ElementoSerie> lista = mapTolista(listaMap);
    return lista;
  }

  String sqlTabla() {
    String sql = "CREATE TABLE if not exists " +
        tabla +
        " ("
            "id INTEGER PRIMARY KEY autoincrement ,"
            "titulo  TEXT , "
            "serie  TEXT , "
            "metrica  REAL , "
            "valor INTEGER , "
            "color TEXT , "
            // "colorN TEXT , "
            "x REAL , "
            "y REAL , "
            "activo INTEGER )";
    return sql;
  }
}
