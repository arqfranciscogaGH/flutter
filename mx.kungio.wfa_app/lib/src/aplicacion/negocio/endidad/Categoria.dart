//  librerias internas de flutter

import 'dart:convert';

//  librerias importadas flutter

//  librerias  proyecto

import '../../../nucleo/negocio/modelo/ModeloBase.dart';

class Categoria extends EntidadBase {
  //    variables
  //    propiedades
  String fecha;
  String tipo;
  int idPadre;
  int idSuscriptor;
  String fechaEstatus;
  int estatus;
  Categoria({
    id,
    nombre,
    clave,
    llave,
    this.fecha,
    this.tipo,
    this.idPadre,
    this.idSuscriptor,
    this.fechaEstatus,
    this.estatus,
  }) : super(
            id: id,
            clave: clave,
            llave: llave,
            nombre: nombre,
            tabla: "Categoria");
  //    métodos

  factory Categoria.fromMap(Map<String, dynamic> map) => new Categoria(
        id: map["id"],
        llave: map["llave"],
        clave: map["clave"],
        nombre: map["nombre"],
        fecha: map["fecha"],
        tipo: map["tipo"],
        idPadre: map["idPadre"],
        idSuscriptor: map["idSuscriptor"],
        fechaEstatus: map["fechaEstatus"],
        estatus: int.parse(map["estatus"].toString()),
      );

  Categoria fromMap(Map<String, dynamic> map) => new Categoria(
        id: map["id"],
        llave: map["llave"],
        clave: map["clave"],
        nombre: map["nombre"],
        fecha: map["fecha"],
        tipo: map["tipo"],
        idPadre: map["idPadre"],
        idSuscriptor: map["idSuscriptor"],
        fechaEstatus: map["fechaEstatus"],
        estatus: int.parse(map["estatus"].toString()),
      );
  Map<String, dynamic> toMap() => {
        "id": id,
        "llave": llave,
        "clave": clave,
        "nombre": nombre,
        "fecha": fecha,
        "tipo": tipo,
        "idPadre": idPadre,
        "idSuscriptor": idSuscriptor,
        "fechaEstatus": fechaEstatus,
        "estatus": estatus,
      };
  String sqlTabla() {
    String sql = "CREATE TABLE if not exists  " +
        tabla +
        " ("
            "id INTEGER PRIMARY KEY ,"
            "llave   TEXT , "
            "clave   TEXT , "
            "nombre   TEXT , "
            "fecha   TEXT , "
            "tipo    TEXT , "
            "idPadre   INTEGER, "
            "idSuscriptor   INTEGER, "
            "fechaEstatus   TEXT , "
            "estatus   INTEGER )";
    return sql;
  }

  Categoria iniciar() {
    Categoria entidad = Categoria();
    entidad.id = 0;
    entidad.llave = "";
    entidad.clave = "";
    entidad.nombre = "";
    entidad.fecha = "";
    entidad.tipo = "";
    entidad.idPadre = 0;
    entidad.idSuscriptor = 0;
    entidad.fecha = DateTime.now().toString();
    entidad.estatus = 1;
    return entidad;
  }

  String toJson() => json.encode(this.toMap());
  Categoria fromJson(String cadenaJson) =>
      this.fromMap(json.decode(cadenaJson));

  Map<String, dynamic> fromJsonToMap(String cadenaJson) =>
      json.decode(cadenaJson);

  List<Categoria> mapTolista(List<dynamic> listaMapa) {
    List<Categoria> lista = listaMapa.isNotEmpty
        ? listaMapa.map((c) => this.fromMap(c)).toList()
        : [];
    return lista;
  }

  List<Categoria> jsonToList(String cadenaJson) {
    List<dynamic> listaMap = json.decode(cadenaJson);
    List<Categoria> lista = mapTolista(listaMap);
    return lista;
  }
}
