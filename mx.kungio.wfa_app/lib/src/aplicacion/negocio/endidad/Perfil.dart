//  librerias internas de flutter

import 'dart:convert';

//  librerias importadas flutter

//  librerias  proyecto

import '../../../nucleo/negocio/modelo/ModeloBase.dart';

class Perfil extends EntidadBase {
  //    variables
  //    propiedades

  String pagina;
  int idMenu;
  String privilegios;
  int idSuscriptor;
  String fechaEstatus;
  int estatus;
  Perfil({
    id,
    nombre,
    clave,
    llave,
    this.pagina,
    this.idMenu,
    this.privilegios,
    this.idSuscriptor,
    this.fechaEstatus,
    this.estatus,
  }) : super(
            id: id,
            clave: clave,
            llave: llave,
            nombre: nombre,
            tabla: "Perfils");
  //    métodos

  factory Perfil.fromMap(Map<String, dynamic> map) => new Perfil(
        id: map["id"],
        llave: map["llave"],
        clave: map["clave"],
        nombre: map["nombre"],
        pagina: map["pagina"],
        idMenu: map["idMenu"],
        privilegios: map["privilegios"],
        idSuscriptor: map["idSuscriptor"],
        fechaEstatus: map["fechaEstatus"],
        estatus: int.parse(map["estatus"].toString()),
      );

  Perfil fromMap(Map<String, dynamic> map) => new Perfil(
        id: map["id"],
        llave: map["llave"],
        clave: map["clave"],
        nombre: map["nombre"],
        pagina: map["pagina"],
        idMenu: map["idMenu"],
        privilegios: map["privilegios"],
        idSuscriptor: map["idSuscriptor"],
        fechaEstatus: map["fechaEstatus"],
        estatus: int.parse(map["estatus"].toString()),
      );
  Map<String, dynamic> toMap() => {
        "id": id,
        "llave": llave,
        "clave": clave,
        "nombre": nombre,
        "pagina": pagina,
        "idMenu": idMenu,
        "privilegios": privilegios,
        "idSuscriptor": idSuscriptor,
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
            "Pagina   TEXT , "
            "IdMenu    INTEGER , "
            "Privilegios   TEXT , "
            "idSuscriptor   INTEGER, "
            "fechaEstatus   TEXT , "
            "estatus   INTEGER )";
    return sql;
  }

  Perfil iniciar() {
    Perfil entidad = Perfil();
    entidad.id = 0;
    entidad.llave = "";
    entidad.clave = "";
    entidad.nombre = "";
    entidad.pagina = "";
    entidad.idMenu = 0;
    entidad.privilegios = "";
    entidad.fechaEstatus = "";
    entidad.idSuscriptor = 0;
    //entidad.fecha=DateTime.now().toString();
    entidad.estatus = 1;
    return entidad;
  }

  String toJson() => json.encode(this.toMap());
  Perfil fromJson(String cadenaJson) => this.fromMap(json.decode(cadenaJson));

  Map<String, dynamic> fromJsonToMap(String cadenaJson) =>
      json.decode(cadenaJson);

  List<Perfil> mapTolista(List<dynamic> listaMapa) {
    List<Perfil> lista = listaMapa.isNotEmpty
        ? listaMapa.map((c) => this.fromMap(c)).toList()
        : [];
    return lista;
  }

  List<Perfil> jsonToList(String cadenaJson) {
    List<dynamic> listaMap = json.decode(cadenaJson);
    List<Perfil> lista = mapTolista(listaMap);
    return lista;
  }
}
