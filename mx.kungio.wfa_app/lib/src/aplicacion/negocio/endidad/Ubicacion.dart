//  librerias internas de flutter

import 'dart:convert';

//  librerias importadas flutter

//  librerias  proyecto

import '../../../nucleo/negocio/modelo/ModeloBase.dart';

class Ubicacion extends EntidadBase {
  //    variables
  //    propiedades
  String latitud;
  String longitud;
  int radio;
  String giro;
  String categoria;
  String subcategoria;
  String cambio;
  Ubicacion({
    id,
    nombre,
    this.latitud,
    this.longitud,
    this.radio,
    this.cambio,
  }) : super(id: id, nombre: nombre, tabla: "Ubicacion");
  //    métodos

  factory Ubicacion.fromMap(Map<String, dynamic> map) => new Ubicacion(
        id: map["id"],
        nombre: map["nombre"],
        latitud: map["latitud"],
        longitud: map["longitud"],
        cambio: map["cambio"],
        radio: int.parse(map["radio"].toString()),
      );

  Ubicacion fromMap(Map<String, dynamic> map) => new Ubicacion(
        id: map["id"],
        nombre: map["nombre"],
        latitud: map["latitud"],
        longitud: map["longitud"],
        cambio: map["cambio"],
        radio: int.parse(map["radio"].toString()),
      );
  Map<String, dynamic> toMap() => {
        "id": id,
        "nombre": nombre,
        "latitud": latitud,
        "longitud": longitud,
        "radio": radio,
        "cambio": cambio,
      };
  String sqlTabla() {
    String sql = "CREATE TABLE if not exists  " +
        tabla +
        " ("
            "id INTEGER PRIMARY KEY ,"
            "nombre     TEXT , "
            "latitud     TEXT , "
            "longitud    TEXT , "
            "radio      INTEGER ,"
            "cambio      TEXT )";
    return sql;
  }

  Ubicacion iniciar() {
    Ubicacion entidad = Ubicacion();
    entidad.id = 0;
    entidad.nombre = "";
    entidad.latitud = "19.6591206";
    entidad.longitud = "-99.2126623";
    // entidad.latitud = "19.10";
    // entidad.longitud = "-99.20";

    entidad.radio = 100;
    entidad.giro = "";
    entidad.categoria = "";
    entidad.subcategoria = "";
    entidad.cambio = "false";
    return entidad;
  }

  String toJson() => json.encode(this.toMap());
  Ubicacion fromJson(String cadenaJson) =>
      this.fromMap(json.decode(cadenaJson));

  Map<String, dynamic> fromJsonToMap(String cadenaJson) =>
      json.decode(cadenaJson);

  List<Ubicacion> mapTolista(List<dynamic> listaMapa) {
    List<Ubicacion> lista = listaMapa.isNotEmpty
        ? listaMapa.map((c) => this.fromMap(c)).toList()
        : [];
    return lista;
  }

  List<Ubicacion> jsonToList(String cadenaJson) {
    List<dynamic> listaMap = json.decode(cadenaJson);
    List<Ubicacion> lista = mapTolista(listaMap);
    return lista;
  }
}
