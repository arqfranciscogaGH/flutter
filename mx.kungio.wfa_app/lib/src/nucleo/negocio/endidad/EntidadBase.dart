//  librerias internas de flutter

import 'dart:convert';


//  librerias importadas flutter

//  librerias  proyecto

class EntidadBase {
  //    variables
  //    propiedades

  int id;
  String llave;
  String clave;
  String nombre;
  String descripcion;

  String tabla;
  EntidadBase({
    this.id,
    this.llave,    
    this.clave,
    this.nombre,
    this.descripcion,
    this.tabla,
  });
  //    métodos
  iniciar()  =>  EntidadBase();
  factory EntidadBase.fromMap(Map<String, dynamic> map) => new EntidadBase(
      id: map["id"],
      llave: map["llave"],      
      clave: map["clave"],
      nombre: map["nombre"],
      descripcion: map["descripcion"],
      tabla: map["tabla"]);
  EntidadBase fromMap(Map<String, dynamic> map) => new EntidadBase(
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

  List<dynamic> mapTolista(List<dynamic> listaMapa) {
    List<dynamic> lista = listaMapa.isNotEmpty
        ? listaMapa.map((c) => this.fromMap(c)).toList()
        : [];
    return lista;
  }

  List<dynamic> jsonToList(String cadenaJson) {
    List<dynamic> listaMap = json.decode(cadenaJson);
    List<dynamic> lista = mapTolista(listaMap);
    return lista;
  }

  String sqlTabla() {}

}

class ControlLista<T extends EntidadBase> {
  //   Variables
  T entidad;
  List<T> _lista = new List<T>();
  ControlLista({this.entidad})   {  }

  //  Propiedades

  // Métodos

  limpiar() {
     _lista = new List<T>();
  }

  T obtener(bool test(T element)) {
     entidad = _lista.firstWhere(test);
     return entidad;
  }
  T buscar (bool test(T element) , {T orElse()}   )
  {
      entidad = _lista.firstWhere(test);
      return entidad;  
  }  
  List<T> filtrarLista(bool test(T element)) {
     List<T> lista = _lista.where(test).toList();
     return lista;
  }

  agregar(T entidad) {
     this.entidad = entidad;
     if (_lista == null) _lista = new List<T>();
     _lista.add(entidad);
  }

  actualizar(bool test(T element), T entidadNueva) {
     entidad = _lista.firstWhere(test);
     if (entidad != null)
     {
        eliminar(entidad);
        agregar(entidadNueva);
     }
     else
         agregar(entidadNueva); 
     entidad = entidadNueva;
  }

  eliminar(T entidad) {
     this.entidad = entidad;
     _lista.remove(entidad);
  }
  List<T> obtenerLista()
  {
      return _lista;
  }
  asignarLista( List<T> lista)
  {
      _lista=lista;
  }
  List<Map<String,dynamic>> lisTotMap() {
      return _lista.map((c) => c.toMap()).toList();
  }  
  String toJson()  {
      return json.encode( this.lisTotMap() );
  }   
  List<dynamic> mapTolista(List<dynamic> listaMapa) {
     List<dynamic> lista = listaMapa.isNotEmpty
        ? listaMapa.map((c) => entidad.iniciar().fromMap(c)).toList()
        : [];
     return lista;
  }

  List<dynamic> jsonToList(String cadenaJson) {
     List<dynamic> listaMap = json.decode(cadenaJson);
     List<dynamic> lista = mapTolista(listaMap);
     return lista;
  } 

}

