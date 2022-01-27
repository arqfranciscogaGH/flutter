//  librerias internas de flutter

import 'dart:convert';

//  librerias importadas flutter

//  librerias  proyecto

import '../../../nucleo/negocio/modelo/ModeloBase.dart';

class Producto extends EntidadBase {
  //    variables
  //    propiedades
  String descripcion = "";
  String codigo = "";
  int precioUnitario;
  int costo;
  String fotoRuta;
  String fotoUrl;
  int disponible = 0;
  int sicronizado = 0;
  Producto({
    id,
    this.descripcion,
    this.codigo,
    this.precioUnitario,
    this.costo,
    this.fotoRuta,
    this.fotoUrl,
    this.disponible,
    this.sicronizado,
  }) : super(id: id, tabla: "Producto");
  //    métodos

  factory Producto.fromMap(Map<String, dynamic> map) => new Producto(
        id: map["id"],
        descripcion: map["descripcion"],
        codigo: map["codigo"],
        precioUnitario: map["precioUnitario"],
        costo: map["costo"],
        fotoRuta: map["fotoRuta"],
        fotoUrl: map["fotoUrl"],
        disponible: int.parse(map["disponible"].toString()),
        sicronizado: map["sicronizado"],
/*      
        disponible      :map["disponible"],  
        disponible      : int.parse(map["disponible"].toString()),    
        sicronizado     : int.parse(map["sicronizado"].toString()),  */
      );
  Producto fromMap(Map<String, dynamic> map) => new Producto(
        id: map["id"],
        descripcion: map["descripcion"],
        codigo: map["codigo"],
        precioUnitario: map["precioUnitario"],
        costo: map["costo"],
        fotoRuta: map["fotoRuta"],
        fotoUrl: map["fotoUrl"],
        disponible: int.parse(map["disponible"].toString()),
        sicronizado: map["sicronizado"],
/*      
        disponible      :map["disponible"],  
        disponible      : int.parse(map["disponible"].toString()),    
        sicronizado     : int.parse(map["sicronizado"].toString()),  */
      );
  Map<String, dynamic> toMap() => {
        "id": id,
        "descripcion": descripcion,
        "codigo": codigo,
        "precioUnitario": precioUnitario,
        "costo": costo,
        "fotoRuta": fotoRuta,
        "fotoUrl": fotoUrl,
        "disponible": disponible,
        "sicronizado": sicronizado,
      };
  String sqlTabla() {
    String sql = "CREATE TABLE if not exists  " +
        tabla +
        " ("
            "id INTEGER PRIMARY KEY ,"
            "descripcion TEXT , "
            "codigo  TEXT , "
            "precioUnitario INTEGER , "
            "costo INTEGER , "
            "fotoRuta TEXT , "
            "fotoUrl TEXT , "
            "disponible TEXT , "
            "sicronizado INTEGER )";
    return sql;
  }

  Producto iniciar() {
    Producto entidad = Producto();
    entidad.descripcion = "";
    entidad.codigo = "";
    entidad.precioUnitario = 0;
    entidad.costo = 0;
    entidad.fotoRuta = "";
    entidad.fotoUrl = "";
    entidad.disponible = 0;
    entidad.sicronizado = 0;
    return entidad;
  }

  String toJson() => json.encode(this.toMap());
  Producto fromJson(String cadenaJson) => this.fromMap(json.decode(cadenaJson));

  Map<String, dynamic> fromJsonToMap(String cadenaJson) =>
      json.decode(cadenaJson);

  List<Producto> mapToLista(List<dynamic> listaMapa) {
    List<Producto> lista = listaMapa.isNotEmpty
        ? listaMapa.map((c) => this.fromMap(c)).toList()
        : [];
    return lista;
  }

  List<Producto> jsonToLista(String cadenaJson) {
    List<dynamic> listaMap = json.decode(cadenaJson);
    List<Producto> lista = mapTolista(listaMap);
    return lista;
  }
}
