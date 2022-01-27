//  librerias internas de flutter

import 'dart:convert';

//  librerias importadas flutter

//  librerias  proyecto

import '../../../nucleo/negocio/modelo/ModeloBase.dart';

class NivelRed extends EntidadBase {
  //    variables
  //    propiedades

  int orden;
  int socios;
  int operaciones;
  double comision;
  String fechaEstatus;
  int estatus;
  NivelRed({
    id,
    nombre,
    clave,
    llave,
    this.orden,
    this.socios,
    this.operaciones,
    this.comision,
    this.fechaEstatus,
    this.estatus,
  }) : super(
            id: id,
            clave: clave,
            llave: llave,
            nombre: nombre,
            tabla: "NivelReds");
  //    métodos

  factory NivelRed.fromMap(Map<String, dynamic> map) => new NivelRed(
        id: map["id"],
        llave: map["llave"],
        clave: map["clave"],
        nombre: map["nombre"],
        orden: map["orden"],
        socios: map["socios"],
        operaciones: map["operaciones"],
        comision: map["comision"],    
        fechaEstatus: map["fechaEstatus"],
        estatus: int.parse(map["estatus"].toString()),
      );

  NivelRed fromMap(Map<String, dynamic> map) => new NivelRed(
        id: map["id"],
        llave: map["llave"],
        clave: map["clave"],
        nombre: map["nombre"],
        orden: map["orden"],
        socios: map["socios"],
        operaciones: map["operaciones"],
        comision: map["comision"],  
        fechaEstatus: map["fechaEstatus"],
        estatus: int.parse(map["estatus"].toString()),
      );
  Map<String, dynamic> toMap() => {
        "id": id,
        "llave": llave,
        "clave": clave,
        "nombre": nombre,
        "orden": orden,
        "socios": socios,
        "operaciones": operaciones,
        "comision": comision,      
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
            "Privilegios   TEXT , "
            "idSuscriptor   INTEGER, "
            "fechaEstatus   TEXT , "
            "estatus   INTEGER )";
    return sql;
  }

  NivelRed iniciar() {
    NivelRed entidad = NivelRed();
    entidad.id = 0;
    entidad.llave = "";
    entidad.clave = "";
    entidad.nombre = "";
    entidad.orden = 0;
    entidad.socios = 0;
    entidad.operaciones = 0;
    entidad.comision = 0; 
    entidad.estatus = 1;
    entidad.fechaEstatus = "";
   
    //entidad.fecha=DateTime.now().toString();
    entidad.estatus = 1;
    return entidad;
  }

  String toJson() => json.encode(this.toMap());
  NivelRed fromJson(String cadenaJson) => this.fromMap(json.decode(cadenaJson));

  Map<String, dynamic> fromJsonToMap(String cadenaJson) =>
      json.decode(cadenaJson);

  List<NivelRed> mapTolista(List<dynamic> listaMapa) {
    List<NivelRed> lista = listaMapa.isNotEmpty
        ? listaMapa.map((c) => this.fromMap(c)).toList()
        : [];
    return lista;
  }

  List<NivelRed> jsonToList(String cadenaJson) {
    List<dynamic> listaMap = json.decode(cadenaJson);
    List<NivelRed> lista = mapTolista(listaMap);
    return lista;
  }
}
