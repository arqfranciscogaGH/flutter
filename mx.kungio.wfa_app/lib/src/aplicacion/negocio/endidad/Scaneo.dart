//  librerias internas de flutter
import 'dart:convert';
//  librerias importadas flutter

/* import 'package:latlong/latlong.dart';  */

//  librerias  proyecto

import '../../../nucleo/negocio/modelo/ModeloBase.dart';

class Scaneo extends EntidadBase {
  String tipo = "";
  String valor = "";

  Scaneo({
    id,
    this.tipo,
    this.valor,
  }) : super(id: id, tabla: "Scaneo") {
    definir();
  }

  factory Scaneo.fromMap(Map<String, dynamic> json) => new Scaneo(
        id: json["id"],
        tipo: json["tipo"],
        valor: json["valor"],
      );
  Scaneo fromMap(Map<String, dynamic> json) => new Scaneo(
        id: json["id"],
        tipo: json["tipo"],
        valor: json["valor"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "tipo": tipo,
        "valor": valor,
      };

  String toJson() => json.encode(this.toMap());
  Scaneo fromJson(String cadenaJson) => Scaneo.fromMap(json.decode(cadenaJson));

  Map<String, dynamic> fromJsonToMap(String cadenaJson) =>
      json.decode(cadenaJson);

  List<Scaneo> mapTolista(List<dynamic> listaMapa) {
    List<Scaneo> lista = listaMapa.isNotEmpty
        ? listaMapa.map((c) => Scaneo.fromMap(c)).toList()
        : [];
    return lista;
  }

  List<Scaneo> jsonToList(String cadenaJson) {
    List<dynamic> listaMap = json.decode(cadenaJson);
    List<Scaneo> lista = mapTolista(listaMap);
    return lista;
  }

  String sqlTabla() {
    String sql = "CREATE TABLE if not exists  " +
        tabla +
        " ("
            "id INTEGER PRIMARY KEY ,"
            "tipo TEXT , "
            "valor TEXT )";
    return sql;
  }

  Scaneo iniciar() {
    Scaneo entidad = Scaneo();
    entidad.tipo = "Scaneo";
    entidad.valor = "x";
    return entidad;
  }

  definir() {
    if (valor != null && valor != "") {
      if (this.valor.contains('http') || this.valor.contains('https')) {
        this.tipo = 'url';
      } else if (this.valor.contains('geo')) {
        this.tipo = 'geo';
      }
    }
  }
}
