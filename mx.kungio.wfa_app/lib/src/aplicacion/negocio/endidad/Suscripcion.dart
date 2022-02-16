//  librerias internas de flutter

import 'dart:convert';

//  librerias importadas flutter

//  librerias  proyecto

import '../../../nucleo/negocio/modelo/ModeloBase.dart';

class Suscripcion extends EntidadBase {
  //    variables
  //    propiedades

  String fecha;
  String tipo;
  int usuarios;
  int equipos;
  int negocios;
  int costo;
  String fechaInicio;
  String fechaVencimiento;
  String informacion;
  int idSuscriptor;
  String fechaEstatus;
  int estatus;
  Suscripcion({
    id,
    nombre,
    clave,
    llave,
    this.fecha,
    this.tipo,
    this.usuarios,
    this.equipos,
    this.negocios,
    this.costo,
    this.fechaInicio,
    this.fechaVencimiento,
    this.informacion,
    this.idSuscriptor,
    this.fechaEstatus,
    this.estatus,
  }) : super(
            id: id,
            clave: clave,
            llave: llave,
            nombre: nombre,
            tabla: "Suscripcions");  
  //    métodos

  factory Suscripcion.fromMap(Map<String, dynamic> map) => new Suscripcion(
        id: map["IdSuscriptor"],
        // llave: map["llave"],
        // clave: map["clave"],
        nombre: map["NombreCorto"],
        // fecha: map["fecha"],
        // tipo: map["Tipo"],
        // usuarios: map["usuarios"],
        // equipos: map["equipos"],
        // negocios: map["negocios"],
        // costo: map["costo"],
        fechaInicio: map["FechaInicio"],
        // fechaVencimiento: map["fechaVencimiento"],
        // informacion: map["informacion"],
        // idSuscriptor: map["idSuscriptor"],
        // fechaEstatus: map["fechaEstatus"],
         estatus: map["Activo"] == true ? 1 : 0,
      );

  Suscripcion fromMap(Map<String, dynamic> map) => new Suscripcion(
        id: map["IdSuscriptor"],
        // llave: map["llave"],
        // clave: map["clave"],
        nombre: map["NombreCorto"],
        // fecha: map["fecha"],
        // tipo: map["Tipo"],
        // usuarios: map["usuarios"],
        // equipos: map["equipos"],
        // negocios: map["negocios"],
        // costo: map["costo"],
        fechaInicio: map["FechaInicio"],
        // fechaVencimiento: map["fechaVencimiento"],
        // informacion: map["informacion"],
        // idSuscriptor: map["idSuscriptor"],
        // fechaEstatus: map["fechaEstatus"],
        estatus: map["Activo"] == true ? 1 : 0,
      );
  Map<String, dynamic> toMap() => {
        "IdSuscriptor": id,
        // "llave": llave,
        // "clave": clave,
        "NombreCorto": nombre,
        // "fecha": fecha,
        // "tipo": tipo,
        // "usuarios": usuarios,
        // "equipos": equipos,
        // "negocios": negocios,
        // "costo": costo,
        "FechaInicio": fechaInicio,
        // "fechaVencimiento": fechaVencimiento,
        // "informacion": informacion,
        // "idSuscriptor": idSuscriptor,
        // "fechaEstatus": fechaEstatus,
          "Activo": estatus,
      };
  String sqlTabla() {
    String sql = "CREATE TABLE if not exists  " +
        tabla +
        " ("
            "id INTEGER PRIMARY KEY ,"
            "llave   TEXT , "
            "clave   TEXT , "
            "nombre   TEXT , "
            "fecha   TEXT , "
            "tipo    TEXT , "
            "usuarios   INTEGER, "
            "equipos   INTEGER, "
            "negocios   INTEGER, "
            "costo   INTEGER, "
            "fechaInicio   TEXT , "
            "fechaVencimiento   TEXT , "
            "informacion   TEXT , "
            "idSuscriptor   INTEGER, "
            "fechaEstatus   TEXT , "
            "estatus   INTEGER )";
    return sql;
  }

  Suscripcion iniciar() {
    Suscripcion entidad = Suscripcion();
    entidad.id = 0;
    // entidad.llave = "";
    // entidad.clave = "";
    entidad.nombre = "";
    // entidad.fecha = "";
    // entidad.tipo = "Bronze";
    // entidad.usuarios = 1;
    // entidad.equipos = 1;
    // entidad.negocios = 1;
    // entidad.costo = 0;
    // entidad.fechaInicio = "";
    // entidad.fechaVencimiento = "";
    // entidad.fechaEstatus = "";
    // entidad.idSuscriptor = 0;
    //entidad.fecha=DateTime.now().toString();
    entidad.estatus = 1;
    return entidad;
  }

  String toJson() => json.encode(this.toMap());
  Suscripcion fromJson(String cadenaJson) =>
      this.fromMap(json.decode(cadenaJson));

  Map<String, dynamic> fromJsonToMap(String cadenaJson) =>
      json.decode(cadenaJson);

  List<Suscripcion> mapTolista(List<dynamic> listaMapa) {
    List<Suscripcion> lista = listaMapa.isNotEmpty
        ? listaMapa.map((c) => this.fromMap(c)).toList()
        : [];
    return lista;
  }

  List<Suscripcion> jsonToList(String cadenaJson) {
    List<dynamic> listaMap = json.decode(cadenaJson);
    List<Suscripcion> lista = mapTolista(listaMap);
    return lista;
  }
}
