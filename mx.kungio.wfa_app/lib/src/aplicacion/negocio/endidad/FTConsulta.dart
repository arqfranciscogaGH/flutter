
//  librerias internas de flutter

import 'dart:convert';

//  librerias importadas flutter

//  librerias  proyecto

import '../../../nucleo/negocio/modelo/ModeloBase.dart';



class FTConsulta extends EntidadBase {
  //    variables
  //    propiedades

  String claveFlujo;
  String variables;
  int idIdioma;
  String consulta;
  String llaveFlujo;
  FTConsulta({
    id,
    nombre,
    clave,
    llave,
    this.claveFlujo,
    this.variables,
    this.idIdioma,
    this.consulta,
    this.llaveFlujo,
    }) : super(
            id: id,
            clave: clave,
            llave: llave,
            nombre: nombre,
            tabla: "FTConsulta");
  //    métodos

  factory FTConsulta.fromMap(Map<String, dynamic> map) => new FTConsulta(
        claveFlujo: map["claveFlujo"],
        variables: map["variables"],
        idIdioma: int.parse(map["idIdioma"].toString()),
        consulta: map["consulta"],
        llaveFlujo: map["llaveFlujo"],
      );

  FTConsulta fromMap(Map<String, dynamic> map) => new FTConsulta(
        claveFlujo: map["claveFlujo"],
        variables: map["variables"],
        idIdioma: int.parse(map["idIdioma"].toString()),
        consulta: map["consulta"],
        llaveFlujo: map["llaveFlujo"],
      );
  Map<String, dynamic> toMap() => {
        "claveFlujo": claveFlujo,
        "variables": variables,
        "idIdioma": idIdioma,
        "consulta": consulta,
        "llaveFlujo": llaveFlujo,
      };

  String sqlTabla() {
    String sql = "CREATE TABLE if not exists  " +
        tabla +
        " ("
            "id INTEGER PRIMARY KEY ,"
            "claveFlujo   TEXT , "
            "variables   TEXT , "
            "idIdioma   INTEGER , "
            "consulta    TEXT , "
            "llaveFlujo   TEXT )";
    return sql;
  }

  FTConsulta iniciar() {
    FTConsulta entidad = FTConsulta();
    entidad.id = 0;
    entidad.claveFlujo = "";
    entidad.variables = "";
    entidad.idIdioma = 0;
    entidad.consulta = "";
    entidad.llaveFlujo = "";
    return entidad;
  }

  String toJson() => json.encode(this.toMap());
  FTConsulta fromJson(String cadenaJson) => this.fromMap(json.decode(cadenaJson));

  Map<String, dynamic> fromJsonToMap(String cadenaJson) =>
      json.decode(cadenaJson);

  List<FTConsulta> mapTolista(List<dynamic> listaMapa) {
    List<FTConsulta> lista = listaMapa.isNotEmpty
        ? listaMapa.map((c) => this.fromMap(c)).toList()
        : [];
    return lista;
  }

  List<FTConsulta> jsonToList(String cadenaJson) {
    List<dynamic> listaMap = json.decode(cadenaJson);
    List<FTConsulta> lista = mapTolista(listaMap);
    return lista;
  }
}



