//  librerias internas de flutter

import 'dart:convert';

//  librerias importadas flutter

//  librerias  proyecto

import '../../../nucleo/negocio/modelo/ModeloBase.dart';

class FlujoTrabajoDocumento extends EntidadBase {
  //    variables
  //    propiedades

  int idActividad;
  String idAccion;
  String ruta;
  String fechaEstatus; 
  int estatus;
  FlujoTrabajoDocumento({
    id,
    nombre,
    clave,
    llave,
    this.idActividad,
    this.idAccion,
    this.ruta, 
    this.fechaEstatus,
    this.estatus,
  }) : super(
            id: id,
            clave: clave,
            llave: llave,
            nombre: nombre,
            tabla: "FlujoTrabajoDocumentos");
  //    métodos

  factory FlujoTrabajoDocumento.fromMap(Map<String, dynamic> map) => new FlujoTrabajoDocumento(
        id: map["id"],
        llave: map["llave"],
        clave: map["clave"],
        nombre: map["nombre"],
        idActividad: map["idActividad"],
        idAccion: map["idAccion"],
        ruta: map["ruta"],
        fechaEstatus: map["fechaEstatus"],

         estatus: map["estatus"],
      );

  FlujoTrabajoDocumento fromMap(Map<String, dynamic> map) => new FlujoTrabajoDocumento(
        id: map["id"],
        llave: map["llave"],
        clave: map["clave"],
        nombre: map["nombre"],
          idActividad: map["idActividad"],
        idAccion: map["idAccion"],
        ruta: map["ruta"],  
        fechaEstatus: map["fechaEstatus"],
        estatus: map["estatus"],
        
      );
  Map<String, dynamic> toMap() => {
        "id": id,
        "llave": llave,
        "clave": clave,
        "nombre": nombre,
        "idActividad": idActividad,
        "idAccion": idAccion,
        "ruta": ruta,
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
            "idActividad    INTEGER , "
            "idAccion   TEXT, "
            "ruta   INTEGER, "
            "fechaEstatus   TEXT , "
            "estatus   INTEGER )";
    return sql;
  }

  FlujoTrabajoDocumento iniciar() {
    FlujoTrabajoDocumento entidad = FlujoTrabajoDocumento();
    entidad.id = 0;
    entidad.llave = "";
    entidad.clave = "";
    entidad.nombre = "";
    entidad.idActividad = 0;
    entidad.idAccion ="";
    entidad.ruta = "";
    entidad.fechaEstatus = DateTime.now().toString();
    entidad.estatus = 1;
    return entidad;
  }

  String toJson() => json.encode(this.toMap());
  FlujoTrabajoDocumento fromJson(String cadenaJson) =>
      this.fromMap(json.decode(cadenaJson));

  Map<String, dynamic> fromJsonToMap(String cadenaJson) =>
      json.decode(cadenaJson);

  List<FlujoTrabajoDocumento> mapTolista(List<dynamic> listaMapa) {
    List<FlujoTrabajoDocumento> lista = listaMapa.isNotEmpty
        ? listaMapa.map((c) => this.fromMap(c)).toList()
        : [];
    return lista;
  }

  List<FlujoTrabajoDocumento> jsonToList(String cadenaJson) {
    List<dynamic> listaMap = json.decode(cadenaJson);
    List<FlujoTrabajoDocumento> lista = mapTolista(listaMap);
    return lista;
  }
}
