 
   

    
//  librerias internas de flutter

import 'dart:convert';

//  librerias importadas flutter

//  librerias  proyecto

import '../../../nucleo/negocio/modelo/ModeloBase.dart';



class FTAvanzarActividad extends EntidadBase {
  //    variables
  //    propiedades

    String identificador ;
    String idAccion ;
    int idTarea; 
    String claveEstatus ;
    String parametros ;
    String variables ;

 
  FTAvanzarActividad({
    id,
    nombre,
    clave,
    llave,
    this.identificador,    
    this.idAccion,    
    this.idTarea,
    this.claveEstatus,    
    this.variables,
    this.parametros,
  
    }) : super(
            id: id,
            clave: clave,
            llave: llave,
            nombre: nombre,
            tabla: "FTAvanzarActividad");
  //    métodos

  factory FTAvanzarActividad.fromMap(Map<String, dynamic> map) => new FTAvanzarActividad(
        id: map["id"],
        clave: map["clave"],
        llave: map["llave"],
        identificador: map["identificador"],
        idAccion: map["idAccion"],
        idTarea: int.parse(map["idTarea"].toString()),      
        claveEstatus: map["claveEstatus"],        
        variables: map["variables"],    
        parametros: map["parametros"],
      );

  FTAvanzarActividad fromMap(Map<String, dynamic> map) => new FTAvanzarActividad(
        id: map["id"],
        clave: map["clave"],
        llave: map["llave"],
        identificador: map["identificador"],
        idAccion: map["idAccion"],
        idTarea: int.parse(map["idTarea"].toString()),      
        claveEstatus: map["claveEstatus"],        
        variables: map["variables"],    
        parametros: map["parametros"],
      );
  Map<String, dynamic> toMap() => {
        "id": id,
        "clave": clave,
        "llave": llave,
        "identificador": identificador,        
        "idAccion": idAccion,
        "idTarea": idTarea,
        "claveEstatus": claveEstatus,
        "variables": variables,        
        "parametros": parametros,
      };

  String sqlTabla() {
    String sql = "CREATE TABLE if not exists  " +
        tabla +
        " ("
            "id INTEGER PRIMARY KEY ,"
            "clave   TEXT , "
            "llave   TEXT , "          
            "identificador   TEXT , "
            "idAccion   INTEGER , "
            "idTarea    INTEGER , "
            "claveEstatus   TEXT , "          
            "variables   TEXT , "         
            "parametros TEXT )";
    return sql;
  }

  FTAvanzarActividad iniciar() {
    FTAvanzarActividad entidad = FTAvanzarActividad();
    entidad.id = 0;
    entidad.clave = "";
    entidad.llave = "";
    entidad.identificador = "";  
    entidad.idAccion = ""; 
    entidad.idTarea = 0;   
    entidad.claveEstatus = "";
    entidad.variables = "";
    entidad.parametros = "";  
    return entidad;
  }

  String toJson() => json.encode(this.toMap());
  FTAvanzarActividad fromJson(String cadenaJson) => this.fromMap(json.decode(cadenaJson));

  Map<String, dynamic> fromJsonToMap(String cadenaJson) =>
      json.decode(cadenaJson);

  List<FTAvanzarActividad> mapTolista(List<dynamic> listaMapa) {
    List<FTAvanzarActividad> lista = listaMapa.isNotEmpty
        ? listaMapa.map((c) => this.fromMap(c)).toList()
        : [];
    return lista;
  }

  List<FTAvanzarActividad> jsonToList(String cadenaJson) {
    List<dynamic> listaMap = json.decode(cadenaJson);
    List<FTAvanzarActividad> lista = mapTolista(listaMap);
    return lista;
  }
}



