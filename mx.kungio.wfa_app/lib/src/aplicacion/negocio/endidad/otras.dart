//  librerias internas de flutter

import 'dart:convert';

//  librerias importadas flutter

//  librerias  proyecto

import '../../../nucleo/negocio/modelo/ModeloBase.dart';

Map<String, dynamic> opcion = {
  "ruta": "alert",
  "icon": "add_alert",
  "texto": "Alertas"
};
List<Map<String, dynamic>> opciones = List<Map<String, dynamic>>();
// opciones.add(opciones);

List<dynamic> data = ['Uno', 'Dos', 'tres'];

class Pais extends EntidadBase {
  //    variables
  //    propiedades
  String idPais;
  String nombre;

  Pais({
    id,
    this.idPais,
    this.nombre,
  }) : super(id: id, tabla: "Pais");
  //    métodos

  factory Pais.fromMap(Map<String, dynamic> json) => new Pais(
        // id         : json["id"],
        idPais: json["idPais"],
        nombre: json["nombre"],
      );
  Pais fromMap(Map<String, dynamic> json) => new Pais(
        // id         : json["id"],
        idPais: json["idPais"],
        nombre: json["nombre"],
      );
  Map<String, dynamic> toMap() => {
        //  "id"         : id,
        "idPais": idPais,
        "nombre": nombre,
      };

  String toJson() => json.encode(this.toJson());
  Pais fromJson(String str) => Pais.fromMap(json.decode(str));

  List<Pais> convertirLista(List<Map> listaMapa) {
    List<Pais> lista = listaMapa.isNotEmpty
        ? listaMapa.map((c) => Pais.fromMap(c)).toList()
        : [];
    return lista;
  }

  String sqlCreacionTabla() {
    String sql = "CREATE TABLE if not exists  " +
        tabla +
        " ("
            "id INTEGER PRIMARY KEY ,"
            "idPais TEXT , "
            "nombre TEXT )";
    return sql;
  }

  Pais iniclizar() {
    Pais entidad = Pais();
    entidad.idPais = "";
    entidad.nombre = "";

    return entidad;
  }
}
