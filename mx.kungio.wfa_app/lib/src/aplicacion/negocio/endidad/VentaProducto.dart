//  librerias internas de flutter

import 'dart:convert';

//  librerias importadas flutter

//  librerias  proyecto

import '../../../nucleo/negocio/modelo/ModeloBase.dart';

class VentaProducto extends EntidadBase {
  //    variables
  //    propiedades

  int idVenta;
  int idProducto;
  String descripcion = "";
  int cantidad;
  int precio;
  int costo;
  int idSuscriptor;
  int estatus;
  VentaProducto({
    id,
    this.idVenta,
    this.idProducto,
    this.descripcion,
    this.cantidad,
    this.precio,
    this.costo,
    this.idSuscriptor,
    this.estatus,
  }) : super(id: id, tabla: "VentaProducto");
  //    métodos

  factory VentaProducto.fromMap(Map<String, dynamic> map) => new VentaProducto(
        id: map["id"],
        idVenta: map["idVenta"],
        idProducto: map["idProducto"],
        descripcion: map["descripcion"],
        cantidad: map["cantidad"],
        precio: map["precio"],
        costo: map["costo"],
        idSuscriptor: map["idSuscriptor"],
        estatus: int.parse(map["estatus"].toString()),
      );

  VentaProducto fromMap(Map<String, dynamic> map) => new VentaProducto(
        id: map["id"],
        idVenta: map["idVenta"],
        idProducto: map["idProducto"],
        descripcion: map["descripcion"],
        cantidad: map["cantidad"],
        precio: map["precio"],
        costo: map["costo"],
        idSuscriptor: map["idSuscriptor"],
        estatus: int.parse(map["estatus"].toString()),
      );
  Map<String, dynamic> toMap() => {
        "id": id,
        "idVenta": idVenta,
        "idProducto": idProducto,
        "descripcion": descripcion,
        "cantidad": cantidad,
        "precio": precio,
        "costo": costo,
        "idSuscriptor": idSuscriptor,
        "estatus": estatus,
      };
  String sqlTabla() {
    String sql = "CREATE TABLE if not exists  " +
        tabla +
        " ("
            "id INTEGER PRIMARY KEY ,"
            "idVenta    INTEGER , "
            "idProducto INTEGER , "
            "descripcion   TEXT , "
            "cantidad   INTEGER, "
            "precio   INTEGER, "
            "costo   INTEGER, "
            "idSuscriptor   INTEGER, "
            "estatus   INTEGER )";
    return sql;
  }

  VentaProducto iniciar() {
    VentaProducto entidad = VentaProducto();
    entidad.idVenta = 0;
    entidad.idProducto = 0;
    entidad.descripcion = "";
    entidad.cantidad = 1;
    entidad.precio = 0;
    entidad.costo = 0;
    entidad.idSuscriptor = 0;

    entidad.estatus = 1;
    return entidad;
  }

  String toJson() => json.encode(this.toMap());
  VentaProducto fromJson(String cadenaJson) =>
      this.fromMap(json.decode(cadenaJson));

  Map<String, dynamic> fromJsonToMap(String cadenaJson) =>
      json.decode(cadenaJson);

  List<VentaProducto> mapTolista(List<dynamic> listaMapa) {
    List<VentaProducto> lista = listaMapa.isNotEmpty
        ? listaMapa.map((c) => this.fromMap(c)).toList()
        : [];
    return lista;
  }

  List<VentaProducto> jsonToList(String cadenaJson) {
    List<dynamic> listaMap = json.decode(cadenaJson);
    List<VentaProducto> lista = mapTolista(listaMap);
    return lista;
  }
}
