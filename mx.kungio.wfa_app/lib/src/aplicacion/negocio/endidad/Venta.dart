//  librerias internas de flutter

import 'dart:convert';

//  librerias importadas flutter

//  librerias  proyecto

import '../../../nucleo/negocio/modelo/ModeloBase.dart';

class Venta extends EntidadBase {
  //    variables
  //    propiedades

  int idPersona;
  String tipo;
  String fecha;

  int total;
  int idSuscriptor;
  int estatus;
  Venta({
    id,
    this.idPersona,
    this.fecha,
    this.tipo,
    this.total,
    this.idSuscriptor,
    this.estatus,
  }) : super(id: id, tabla: "Venta");
  //    métodos

  factory Venta.fromMap(Map<String, dynamic> map) => new Venta(
        id: map["id"],
        idPersona: map["idPersona"],
        fecha: map["fecha"],
        tipo: map["tipo"],
        total: map["total"],
        idSuscriptor: map["idSuscriptor"],
        estatus: int.parse(map["estatus"].toString()),
      );

  Venta fromMap(Map<String, dynamic> map) => new Venta(
        id: map["id"],
        idPersona: map["idPersona"],
        fecha: map["fecha"],
        tipo: map["tipo"],
        total: map["total"],
        idSuscriptor: map["idSuscriptor"],
        estatus: int.parse(map["estatus"].toString()),
      );
  Map<String, dynamic> toMap() => {
        "id": id,
        "idPersona": idPersona,
        "fecha": fecha,
        "tipo": tipo,
        "total": total,
        "idSuscriptor": idSuscriptor,
        "estatus": estatus,
      };
  String sqlTabla() {
    String sql = "CREATE TABLE if not exists  " +
        tabla +
        " ("
            "id INTEGER PRIMARY KEY ,"
            "idPersona INTEGER , "
            "fecha   TEXT , "
            "tipo    TEXT , "
            "total   INTEGER, "
            "idSuscriptor   INTEGER, "
            "estatus   INTEGER )";
    return sql;
  }

  Venta iniciar() {
    Venta entidad = Venta();
    entidad.idPersona = 0;
    entidad.fecha = "";
    entidad.tipo = "";
    entidad.total = 0;
    entidad.idSuscriptor = 0;

    entidad.estatus = 0;
    return entidad;
  }

  String toJson() => json.encode(this.toMap());
  Venta fromJson(String cadenaJson) => this.fromMap(json.decode(cadenaJson));

  Map<String, dynamic> fromJsonToMap(String cadenaJson) =>
      json.decode(cadenaJson);

  List<Venta> mapTolista(List<dynamic> listaMapa) {
    List<Venta> lista = listaMapa.isNotEmpty
        ? listaMapa.map((c) => this.fromMap(c)).toList()
        : [];
    return lista;
  }

  List<Venta> jsonToList(String cadenaJson) {
    List<dynamic> listaMap = json.decode(cadenaJson);
    List<Venta> lista = mapTolista(listaMap);
    return lista;
  }
}
