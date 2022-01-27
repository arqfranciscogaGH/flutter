//  librerias internas de flutter

import 'dart:convert';

//  librerias importadas flutter

//  librerias  proyecto

import '../../../nucleo/negocio/modelo/ModeloBase.dart';

class ConsultaDocumentos extends EntidadBase {
  //    variables
  //    propiedades
  int idDocumento;
  int idReferencia;
  int idActividad;
  String idAccion;
  String ruta;
  String fechaEstatus; 
  int estatus;
  ConsultaDocumentos({
    id,
    nombre,
    clave,
    llave,
    this.idDocumento,
    this.idReferencia,
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
            tabla: "ConsultaDocumentoss");
  //    métodos

  factory ConsultaDocumentos.fromMap(Map<String, dynamic> map) => new ConsultaDocumentos(
        id: map["id"],
        llave: map["llave"],
        clave: map["clave"],
        nombre: map["nombre"],
        idDocumento: map["idDocumento"],
        idReferencia: map["idReferencia"],     
        idActividad: map["idActividad"],
        idAccion: map["idAccion"],
        ruta: map["ruta"],
        fechaEstatus: map["fechaEstatus"],

         estatus: map["estatus"],
      );

  ConsultaDocumentos fromMap(Map<String, dynamic> map) => new ConsultaDocumentos(
        id: map["id"],
        llave: map["llave"],
        clave: map["clave"],
        nombre: map["nombre"],
        idDocumento: map["idDocumento"],
        idReferencia: map["idReferencia"],         
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
        "idDocumento": idDocumento,
        "idReferencia": idReferencia,      
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
            "idDocumento   INTEGER , "
            "idReferencia INTEGER , "
            "idActividad    INTEGER , "
            "idAccion   TEXT, "
            "ruta   INTEGER, "
            "fechaEstatus   TEXT , "
            "estatus   INTEGER )";
    return sql;
  }

  ConsultaDocumentos iniciar() {
    ConsultaDocumentos entidad = ConsultaDocumentos();
    entidad.id = 0;
    entidad.llave = "";
    entidad.clave = "1";
    entidad.nombre = "";
    entidad.idDocumento = 1;
    entidad.idReferencia = 1;
    entidad.idActividad = 0;
    entidad.idAccion ="";
    entidad.ruta = "";
    entidad.fechaEstatus = DateTime.now().toString();
    entidad.estatus = 1;
    return entidad;
  }

  String toJson() => json.encode(this.toMap());
  ConsultaDocumentos fromJson(String cadenaJson) =>
      this.fromMap(json.decode(cadenaJson));

  Map<String, dynamic> fromJsonToMap(String cadenaJson) =>
      json.decode(cadenaJson);

  List<ConsultaDocumentos> mapTolista(List<dynamic> listaMapa) {
    List<ConsultaDocumentos> lista = listaMapa.isNotEmpty
        ? listaMapa.map((c) => this.fromMap(c)).toList()
        : [];
    return lista;
  }

  List<ConsultaDocumentos> jsonToList(String cadenaJson) {
    List<dynamic> listaMap = json.decode(cadenaJson);
    List<ConsultaDocumentos> lista = mapTolista(listaMap);
    return lista;
  }
}
