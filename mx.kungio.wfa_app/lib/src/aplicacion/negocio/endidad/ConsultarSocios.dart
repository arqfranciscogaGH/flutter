
//  librerias internas de flutter

import 'dart:convert';
import 'dart:ffi';

//  librerias importadas flutter

//  librerias  proyecto

import '../../../nucleo/negocio/modelo/ModeloBase.dart';

class ConsultarSocios extends EntidadBase {
  //    variables
  //    propiedades

  int idUsuario;
  String cuenta;
  int idUsuarioSuperior;
  int idNivelRed;
  String claveNivelRed;
  String nivelRed;
  int orden;
  double comision;
  int activo;
  ConsultarSocios({
    id,
    nombre,
    clave,
    llave,
    this.idUsuario,
    this.cuenta,
    this.idUsuarioSuperior,
    this.idNivelRed,
    this.claveNivelRed,
    this.nivelRed,
    this.orden,
    this.comision,
    this.activo
   }) : super(
            id: id,
            clave: clave,
            llave: llave,
            nombre: nombre,
            tabla: "ConsultarSocios");  
  //    métodos

  factory ConsultarSocios.fromMap(Map<String, dynamic> map) => new ConsultarSocios(
        id: map["idUsuario"],
        idUsuario: map["idUsuario"],
        cuenta: map["cuenta"],
        idUsuarioSuperior: map["idUsuarioSuperior"],
        idNivelRed: map["idNivelRed"],
        claveNivelRed: map["claveNivelRed"],
        nivelRed: map["nivelRed"],
        nombre: map["nivelRed"],
        orden: map["orden"],
        comision: map["comision"],
        activo: map["Activo"] == true ? 1 : 0,   
        
      );

  ConsultarSocios fromMap(Map<String, dynamic> map) => new ConsultarSocios(
        id: map["idUsuario"],
        idUsuario: map["idUsuario"],
        cuenta: map["cuenta"],
        idUsuarioSuperior: map["idUsuarioSuperior"],
        idNivelRed: map["idNivelRed"],
        claveNivelRed: map["claveNivelRed"],
        nivelRed: map["nivelRed"],
        nombre: map["nivelRed"],
        orden: map["orden"],
        comision: map["comision"],
        activo: map["Activo"] == true ? 1 : 0,   
      );
  Map<String, dynamic> toMap() => {
         "id": id,
         "idUsuario": idUsuario,
         "cuenta": cuenta,
         "idUsuarioSuperior": idUsuarioSuperior,
         "idNivelRed": idNivelRed,
         "claveNivelRed": claveNivelRed,
         "nivelRed": nivelRed,
         "nombre": nivelRed,
         "orden": orden,
         "comision": comision,
         "activo": activo,
      };
  String sqlTabla() {
    String sql = "CREATE TABLE if not exists  " +
        tabla +
        " ("
            "id INTEGER PRIMARY KEY ,"
            "llave   TEXT , "
            "clave   TEXT , "
            "nombre   TEXT , "
            "idUsuario INTEGER , "
            "cuenta    TEXT , "
            "idUsuarioSuperior   INTEGER, "
            "idNivelRed   INTEGER, "
            "claveNivelRed   TEXT, "
            "nivelRed   TEXT, "
            "orden   INTEGER , "
            "comision   FLOAT )";
    return sql;
  }

  ConsultarSocios iniciar() {
    ConsultarSocios entidad = ConsultarSocios();

       entidad.id = 0;
       entidad.idUsuario = 0;
       entidad.cuenta = "";
       entidad.idUsuarioSuperior = 0;
       entidad.idNivelRed = 0;
       entidad.claveNivelRed = "";
       entidad.nivelRed = "";    
       entidad.nivelRed = "";
       entidad.orden = 0;
       entidad.comision = 0.0;
       entidad.activo = 0;
      return entidad;
  }

  String toJson() => json.encode(this.toMap());
  ConsultarSocios fromJson(String cadenaJson) =>
      this.fromMap(json.decode(cadenaJson));

  Map<String, dynamic> fromJsonToMap(String cadenaJson) =>
      json.decode(cadenaJson);

  List<ConsultarSocios> mapTolista(List<dynamic> listaMapa) {
    List<ConsultarSocios> lista = listaMapa.isNotEmpty
        ? listaMapa.map((c) => this.fromMap(c)).toList()
        : [];
    return lista;
  }

  List<ConsultarSocios> jsonToList(String cadenaJson) {
    List<dynamic> listaMap = json.decode(cadenaJson);
    List<ConsultarSocios> lista = mapTolista(listaMap);
    return lista;
  }
}
