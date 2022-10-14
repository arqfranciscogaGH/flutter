//  librerias internas de flutter

import 'dart:convert';

//  librerias  proyecto

class EntidadBase {
  //    variables
  //    propiedades

  int? id;
  String? llave;
  String? clave;
  String? nombre;
  String? descripcion;
  String tabla;

  EntidadBase({
     this.id,
     this.llave,    
     this.clave,
     this.nombre,
     this.descripcion,
     this.tabla=""
  });
  //    métodos
  iniciar()  =>  EntidadBase();
  factory EntidadBase.fromMap(Map<String, dynamic> map) =>  EntidadBase(
      id: map["id"]!,
      llave: map["llave"],      
      clave: map["clave"],
      nombre: map["nombre"],
      descripcion: map["descripcion"],
      tabla: map["tabla"]);

  EntidadBase fromMap(Map<String, dynamic> map) =>  EntidadBase(
      id: map["id"],
      llave: map["llave"],         
      clave: map["clave"],
      nombre: map["nombre"],
      descripcion: map["descripcion"],
      tabla: map["tabla"]);
  Map<String, dynamic> toMap() => {
        "id": id,
        "llave": llave,          
        "clave": clave,
        "nombre": nombre,
        "descripcion": descripcion,
        "tabla": tabla,
      };
  String toJson() => json.encode(this.toMap());
  dynamic fromJson(String cadenaJson) => this.fromMap(json.decode(cadenaJson));

  Map<String, dynamic> fromJsonToMap(String cadenaJson) =>
      json.decode(cadenaJson);

  List<dynamic> mapTolist(List<dynamic> listaMapa) {
    List<dynamic> lista = listaMapa.isNotEmpty
        ? listaMapa.map((c) => this.fromMap(c)).toList()
        : [];
    return lista;
  }

  List<dynamic> jsonToList(String cadenaJson) {
    List<dynamic> listaMap = json.decode(cadenaJson);
    List<dynamic> lista = mapTolist(listaMap);
    return lista;
  }

  String sqlTabla() {  
    String sql = "";
     return sql;
  }
   
}



