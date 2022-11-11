//  librerias internas de flutter

import 'dart:convert';

//  librerias importadas flutter

//  librerias  proyecto

import '../../../../nucleo/negocio/modelo/endidad/EntidadBase.dart';

class VentaProducto extends EntidadBase {
  //    variables
  //    propiedades

  int? idProducto;
  int? cantidad;
  double? importe;
  double? precio;
  String? referencia;
  String? fechaEstatus;
  int? estatus;
  VentaProducto({
    id,
    nombre,
    clave,
    llave,
    nombreTabla,
    campoLLave,
    this.idProducto,
    this.cantidad,
    this.importe,
    this.precio,
    this.referencia,
    this.fechaEstatus,
    this.estatus,
  }) : super(
          id: id,
          clave: clave,
          llave: llave,
          nombre: nombre,
          nombreTabla: 'VentaProductos',
          campoLLave: 'id',
        );
  //    métodos

  factory VentaProducto.fromMap(Map<String, dynamic> map) => new VentaProducto(
        id: map["id"],
        llave: map["llave"],
        clave: map["clave"],
        nombre: map["nombre"],
        idProducto: map["idProducto"],
        cantidad: map["cantidad"],
        importe: map["importe"],
        precio: map["precio"],
        referencia: map["referencia"],
        fechaEstatus: map["fechaEstatus"],
        estatus: int.parse(map["estatus"].toString()),
      );

  VentaProducto fromMap(Map<String, dynamic> map) {
    id = map["id"];
    llave = map["llave"];
    clave = map["clave"];
    nombre = map["nombre"];

    idProducto = map["idProducto"];
    cantidad = map["cantidad"];
    importe = map["importe"];
    precio = map["precio"];
    referencia = map["referencia"];

    fechaEstatus = map["fechaEstatus"];
    estatus = int.parse(map["estatus"].toString());
    return this;
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "llave": llave,
        "clave": clave,
        "nombre": nombre,
        "idProducto": idProducto,
        "cantidad": cantidad,
        "importe": importe,
        "precio": precio,
        "referencia": referencia,
        "fechaEstatus": fechaEstatus,
        "estatus": estatus,
      };

  String sqlTabla() {
    String sql = "CREATE TABLE if not exists  " +
        nombreTabla! +
        " ("
            "id INTEGER PRIMARY KEY ,"
            "llave   TEXT , "
            "clave   TEXT , "
            "nombre   TEXT , "
            "idProducto   INTEGER , "
            "cantidad   INTEGER, "
            "importe   REAL , "
            "precio   REAL , "
            "referencia   TEXT, "
            "fechaEstatus   TEXT , "
            "estatus   INTEGER )";
    return sql;
  }

  VentaProducto iniciar() {
    VentaProducto entidad = VentaProducto();
    entidad.id = 0;
    entidad.llave = "";
    entidad.clave = "";
    entidad.nombre = "";
    entidad.idProducto = 0;
    entidad.cantidad = 0;
    entidad.importe = 0;

    entidad.precio = 0;
    entidad.referencia = "";

    entidad.fechaEstatus = DateTime.now().toString();
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
