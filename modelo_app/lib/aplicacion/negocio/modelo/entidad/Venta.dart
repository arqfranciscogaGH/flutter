//  librerias internas de flutter

import 'dart:convert';

//  librerias importadas flutter

//  librerias  proyecto

import '../../../../nucleo/negocio/modelo/endidad/EntidadBase.dart';

class Venta extends EntidadBase {
  //    variables
  //    propiedades

  int? idMesa;
  int? idVendedor;
  int? idCliente;
  int? cantidadVenta;
  double? importeVenta;
  String? fechaVenta;
  String? tipoVenta;
  String? referencia;
  String? fechaEstatus;
  int? estatus;
  Venta({
    id,
    nombre,
    clave,
    llave,
    nombreTabla,
    campoLLave,
    this.idMesa,
    this.idVendedor,
    this.idCliente,
    this.cantidadVenta,
    this.importeVenta,
    this.fechaVenta,
    this.tipoVenta,
    this.referencia,
    this.fechaEstatus,
    this.estatus,
  }) : super(
          id: id,
          clave: clave,
          llave: llave,
          nombre: nombre,
          nombreTabla: 'Ventas',
          campoLLave: 'id',
        );

  //    métodos
  @override
  factory Venta.fromMap(Map<String, dynamic> map) => new Venta(
        id: map["id"],
        llave: map["llave"],
        clave: map["clave"],
        nombre: map["nombre"],
        idMesa: map["idMesa"],
        idVendedor: map["idVendedor"],
        idCliente: map["idCliente"],
        cantidadVenta: map["cantidadVenta"],
        importeVenta: map["importeVenta"],
        fechaVenta: map["fechaVenta"],
        tipoVenta: map["tipoVenta"],
        referencia: map["referencia"],
        fechaEstatus: map["fechaEstatus"],
        // estatus: int.parse(map["estatus"].toString()),
      );
  @override
  Venta fromMap(Map<String, dynamic> map) {
    id = map["id"];
    llave = map["llave"];
    clave = map["clave"];
    nombre = map["nombre"];

    idMesa = map["idMesa"];
    idVendedor = map["idVendedor"];
    idCliente = map["idCliente"];
    cantidadVenta = map["cantidadVenta"];
    importeVenta = map["importeVenta"];
    fechaVenta = map["fechaVenta"];
    tipoVenta = map["tipoVenta"];
    referencia = map["referencia"];

    fechaEstatus = map["fechaEstatus"];
    // estatus = int.parse(map["estatus"].toString());
    return this;
  }

  @override
  Map<String, dynamic> toMap() => {
        "id": id,
        "llave": llave,
        "clave": clave,
        "nombre": nombre,
        "idMesa": idMesa,
        "idVendedor": idVendedor,
        "idCliente": idCliente,
        "cantidadVenta": cantidadVenta,
        "importeVenta": importeVenta,
        "fechaVenta": fechaVenta,
        "tipoVenta": tipoVenta,
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
            "idMesa   INTEGER , "
            "idVendedor   INTEGER, "
            "idCliente   INTEGER , "
            "cantidadVenta   INTEGER, "
            "importeVenta   REAL , "
            "fechaVenta   TEXT, "
            "tipoVenta   TEXT , "
            "referencia   TEXT, "
            "fechaEstatus   TEXT , "
            "estatus   INTEGER )";
    return sql;
  }

  @override
  Venta iniciar() {
    Venta entidad = Venta();
    entidad.id = 0;
    entidad.llave = "";
    entidad.clave = "";
    entidad.nombre = "";
    entidad.idMesa = 0;
    entidad.idVendedor = 0;
    entidad.idCliente = 0;
    entidad.cantidadVenta = 0;
    entidad.importeVenta = 0;

    entidad.fechaVenta = "";
    entidad.tipoVenta = "";
    entidad.referencia = "";

    entidad.fechaEstatus = DateTime.now().toString();
    entidad.estatus = 1;
    return entidad;
  }

  String toJson() => json.encode(this.toMap());
  Venta fromJson(String cadenaJson) => this.fromMap(json.decode(cadenaJson));

  Map<String, dynamic> fromJsonToMap(String cadenaJson) =>
      json.decode(cadenaJson);

  @override
  List<Venta> mapTolista(List<dynamic> listaMapa) {
    List<Venta> lista = listaMapa.isNotEmpty
        ? listaMapa.map((c) => this.fromMap(c)).toList()
        : [];
    return lista;
  }

  @override
  List<Venta> jsonToList(String cadenaJson) {
    List<dynamic> listaMap = json.decode(cadenaJson);
    List<Venta> lista = mapTolista(listaMap);
    return lista;
  }
}
