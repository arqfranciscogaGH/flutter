//  librerias internas de flutter

import 'dart:convert';
import 'package:intl/intl.dart';
//  librerias importadas flutter

//  librerias  proyecto

import '../../../nucleo/negocio/modelo/ModeloBase.dart';

class Mov extends EntidadBase {
  //    variables
  //    propiedades
  int idPersona;
  String fecha;
  String tipo;
  int importe;
  int referencia;
  String descricpion;
  String rutaFoto;
  String urlFoto;
  int idSuscriptor;
  int estatus;
  Mov({
    id,
    clave,
    this.idPersona,
    this.fecha,
    this.tipo,
    this.importe,
    this.referencia,
    this.descricpion,
    this.rutaFoto,
    this.urlFoto,
    this.idSuscriptor,
    this.estatus,
  }) : super(id: id, clave: clave, tabla: "Mov");
  //    métodos

  factory Mov.fromMap(Map<String, dynamic> map) => new Mov(
        id: map["id"],
        clave: map["clave"],
        idPersona: map["idPersona"],
        fecha: map["fecha"],
        tipo: map["tipo"],
        importe: map["importe"],
        referencia: map["referencia"],
        descricpion: map["descricpion"],
        rutaFoto: map["rutaFoto"],
        urlFoto: map["urlFoto"],
        idSuscriptor: map["idSuscriptor"],
        estatus: map["estatus"],
      );

  Mov fromMap(Map<String, dynamic> map) => new Mov(
        id: map["id"],
        clave: map["clave"],
        idPersona: map["idPersona"],
        fecha: map["fecha"],
        tipo: map["tipo"],
        importe: map["importe"],
        referencia: map["referencia"],
        descricpion: map["descricpion"],
        rutaFoto: map["rutaFoto"],
        urlFoto: map["urlFoto"],
        idSuscriptor: map["idSuscriptor"],
        estatus: map["estatus"],
      );
  Map<String, dynamic> toMap() => {
        "id": id,
        "clave": clave,
        "idPersona": idPersona,
        "fecha": fecha,
        "tipo": tipo,
        "importe": importe,
        "referencia": referencia,
        "descricpion": descricpion,
        "rutaFoto": rutaFoto,
        "urlFoto": urlFoto,
        "idSuscriptor": idSuscriptor,
        "estatus": estatus,
      };
  String sqlTabla() {
    String sql = "CREATE TABLE if not exists  " +
        tabla +
        " ("
            "id INTEGER PRIMARY KEY autoincrement ,"
            "clave         TEXT , "
            "idPersona     INTEGER , "
            "fecha         TEXT , "
            "tipo          TEXT , "
            "importe       INTEGER,"
            "referencia    INTEGER , "
            "descricpion   TEXT , "
            "rutaFoto      TEXT , "
            "urlFoto       TEXT , "
            "idSuscriptor  INTEGER,"
            "estatus       INTEGER )";
    return sql;
  }

  Mov iniciar() {
    Mov entidad = Mov();
    entidad.clave = "";
    entidad.idPersona = 0;
    entidad.fecha = DateFormat('dd-MM-yyyy').format(DateTime.now());
    entidad.tipo = "";
    entidad.importe = 0;
    entidad.referencia = 0;
    entidad.descricpion = "";
    entidad.rutaFoto = "";
    entidad.urlFoto = "";
    entidad.estatus = 1;
    return entidad;
  }

  String toJson() => json.encode(this.toMap());
  Mov fromJson(String cadenaJson) => this.fromMap(json.decode(cadenaJson));

  Map<String, dynamic> fromJsonToMap(String cadenaJson) =>
      json.decode(cadenaJson);

  List<Mov> mapTolista(List<dynamic> listaMapa) {
    List<Mov> lista = listaMapa.isNotEmpty
        ? listaMapa.map((c) => this.fromMap(c)).toList()
        : [];
    return lista;
  }

  List<Mov> jsonToList(String cadenaJson) {
    List<dynamic> listaMap = json.decode(cadenaJson);
    List<Mov> lista = mapTolista(listaMap);
    return lista;
  }
}
