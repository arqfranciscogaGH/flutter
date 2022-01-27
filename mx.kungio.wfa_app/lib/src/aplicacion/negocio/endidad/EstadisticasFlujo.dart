//  librerias internas de flutter

import 'dart:convert';

//  librerias importadas flutter

//  librerias  proyecto

import '../../../nucleo/negocio/modelo/ModeloBase.dart';

class EstadisticasFlujo extends EntidadBase {
  //    variables
  //    propiedades
  // @override String nombre;
  // @override String descripcion;
  int idTarea;
  int idActividad;
  String actividad;
  int cuenta;
  int importe;


  EstadisticasFlujo({
    id,
    nombre,
    clave,
    llave,
    descripcion,
    this.idTarea,
    this.idActividad,
    this.actividad,
    this.cuenta,
    this.importe,

  }) : super(
            id: id,
            clave: clave,
            llave: llave,
            nombre: nombre,
            descripcion: descripcion,         
            tabla: "EstadisticasFlujo");
  //    métodos

  factory EstadisticasFlujo.fromMap(Map<String, dynamic> map) => new EstadisticasFlujo(
        id: map["id"],
        llave: map["llave"],
        clave: map["Clave"],
        nombre: map["Nombre"],
        descripcion : map['Descripcion'],         
        idTarea : map['IdTarea'],
        idActividad : map['IdActividad'],
        actividad : map['Actividad'],
        cuenta : map['Cuenta'],          
        importe : map['Importe'],     
      );

  EstadisticasFlujo fromMap(Map<String, dynamic> map) => new EstadisticasFlujo(
        id: map["id"],
        llave: map["llave"],
        clave: map["Clave"],
        nombre: map["Nombre"],
        descripcion : map['Descripcion'],         
        idTarea : map['IdTarea'],
        idActividad : map['IdActividad'],
        actividad : map['Actividad'],
        cuenta : map['Cuenta'],          
        importe : map['Importe'],  
      );
  Map<String, dynamic> toMap() => {
        "id": id,
        "llave": llave,
        "Clave": clave,
        "nombre": nombre,
        "descripcion": descripcion,       
        "IdTarea": idTarea,
        "IdActividad": idActividad,
        "Actividad": actividad,       
        "Cuenta": cuenta,       
        "Importe": importe,

      };
  String sqlTabla() {
    String sql = "CREATE TABLE if not exists  " +
        tabla +
        " ("
            "id INTEGER PRIMARY KEY ,"
            "llave   TEXT , "
            "clave   TEXT , "
            "nombre   TEXT , "
            "idTarea   INTEGER , "
            "idActividad    INTEGER , "
            "actividad   TEXT , "           
            "cuenta   INTEGER, "
            "importe   INTEGER, "
            " )";
    return sql;
  }

  EstadisticasFlujo iniciar() {
    EstadisticasFlujo entidad = EstadisticasFlujo();
    entidad.id = 0;
    entidad.llave = "";
    entidad.clave = "";
    entidad.nombre = "";
    entidad.idTarea = 0;
    entidad.idActividad = 0;
    entidad.actividad = "";
    entidad.cuenta =  0;
    entidad.importe = 0;

    return entidad;
  }

  String toJson() => json.encode(this.toMap());
  EstadisticasFlujo fromJson(String cadenaJson) =>
      this.fromMap(json.decode(cadenaJson));

  Map<String, dynamic> fromJsonToMap(String cadenaJson) =>
      json.decode(cadenaJson);

  List<EstadisticasFlujo> mapTolista(List<dynamic> listaMapa) {
    List<EstadisticasFlujo> lista = listaMapa.isNotEmpty
        ? listaMapa.map((c) => this.fromMap(c)).toList()
        : [];
    return lista;
  }

  List<EstadisticasFlujo> jsonToList(String cadenaJson) {
    List<dynamic> listaMap = json.decode(cadenaJson);
    List<EstadisticasFlujo> lista = mapTolista(listaMap);
    return lista;
  }
}
