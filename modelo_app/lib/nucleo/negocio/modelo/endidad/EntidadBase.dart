//  librerias internas de flutter

import 'dart:convert';

//  librerias  proyecto

class EntidadBase {

  //  variables

  String? nombreTabla='EntidadBase';
  String? campoLLave='id';

   //    propiedades 

  int? id;
  String? llave;
  String? clave;
  String? nombre;
  String? descripcion;


  //    constructor

  EntidadBase({
     this.id,
     this.llave,    
     this.clave,
     this.nombre,
     this.descripcion,
     this.nombreTabla='EntidadBase',
     this.campoLLave='id',
  });


  //  propiedades

 

  //    métodos


  EntidadBase iniciar() {
    EntidadBase e = EntidadBase();
    e.nombreTabla='EntidadBase';
    e. campoLLave='id';
    e.id = 0;
    e.clave = "";
    e.llave = " ";
    e.nombre = "";
    e.descripcion = "";
    return e;
    
  }
  String sqlTabla() {
    String sql = "CREATE TABLE if not exists " +
        nombreTabla! +
        " ("
            "id INTEGER PRIMARY KEY autoincrement ,"
            "llave TEXT , "
            "clave TEXT , "
            "nombre  TEXT , "
            "descripcion TEXT , "
            "fechaEstatus TEXT , "
            "estatus INTEGER )";
    return sql;
  }

  //  metodos conversion  map  a entidad sin  instanciar  entidad

  factory EntidadBase.fromMap(Map<String, dynamic> map) =>  EntidadBase(
      id: map["id"]!,
      llave: map["llave"],      
      clave: map["clave"],
      nombre: map["nombre"],
      descripcion: map["descripcion"]
      );

  //  metodos conversion  map  a entidad con   entidad  instanciada

  EntidadBase fromMap(Map<String, dynamic> map)  
  
  {
      id= map["id"];
      llave=map["llave"];       
      clave=map["clave"];
      nombre= map["nombre"];
      descripcion= map["descripcion"];
 
      return this;
   } 

  //  metodos conversion  entidad  a  map 
  Map<String, dynamic> toMap() => {
        "id": id,
        "llave": llave,          
        "clave": clave,
        "nombre": nombre,
        "descripcion": descripcion,

      };


  //  metodos conversion  a cadena  json

 
   // conversión de  entidad a  cadena Json  

  String toJson() => json.encode(this.toMap());

  // conversión de  cadena Json  a entidad 
 
  dynamic fromJson(String cadenaJson) 
  {
     this.fromMap(json.decode(cadenaJson));
  }

  // metodos conversion listas


  // metodos conversion cadena Json a  lista  de 
 
  List<EntidadBase> jsonToLista(String cadenaJson) {
    List<dynamic> listaMap = json.decode(cadenaJson);
    List<EntidadBase> lista = mapTolista(listaMap);
    return lista;
  }
 // metodos conversion lista map a  lista  de entidades

  List<EntidadBase> mapTolista(List<dynamic> listaMapa) {
    List<EntidadBase> lista = listaMapa.isNotEmpty
        ? listaMapa.map((c) => this.fromMap(c)).toList()
        : [];
     return lista;
  }
   
}



