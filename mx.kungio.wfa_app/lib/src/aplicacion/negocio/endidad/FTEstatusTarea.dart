//  librerias internas de flutter

import 'dart:convert';

//  librerias importadas flutter

//  librerias  proyecto

import '../../../nucleo/negocio/modelo/ModeloBase.dart';

class FTEstatusTarea extends EntidadBase {
  //    variables
  //    propiedades
  // @override String nombre;
  // @override String descripcion;
  int idTarea;
  int idEstatus;
  
  FTEstatusTarea({
    id,
    nombre,
    clave,
    llave,
    descripcion,
    this.idTarea,
    this.idEstatus,

  }) : super(
            id: id,
            clave: clave,
            llave: llave,
            nombre: nombre,
            descripcion: descripcion,         
            tabla: "FTEstatusTarea");
  //    métodos

  factory FTEstatusTarea.fromMap(Map<String, dynamic> map) => new FTEstatusTarea(
        id: map["id"],
        llave: map["llave"],
        clave: map["Clave"],
        nombre: map["Nombre"],
        descripcion : map['Descripcion'],         
        idTarea : map['IdTarea'],
        idEstatus : map['IdEstatus'],
           
                   

      );

  FTEstatusTarea fromMap(Map<String, dynamic> map) => new FTEstatusTarea(
        id: map["id"],
        llave: map["llave"],
        clave: map["Clave"],
        nombre: map["Nombre"],
        descripcion : map['Descripcion'],         
        idTarea : map['IdTarea'],
        idEstatus : map['IdEstatus'],
        
      );
  Map<String, dynamic> toMap() => {
        "id": id,
        "llave": llave,
        "clave": clave,
        "nombre": nombre,
        'IdTarea' : idTarea,
        'IdEstatus' : idEstatus,
         
      };
  String sqlTabla() {
    String sql = "CREATE TABLE if not exists  " +
        tabla +
        " ("
            "id INTEGER PRIMARY KEY ,"
            "llave   TEXT , "
            "clave   TEXT , "
            "nombre   TEXT , "
            "IdTarea   INTEGER , "
            "IdEstatus INTEGER , "          
            ")";
    return sql;
  }

  FTEstatusTarea iniciar() {
    FTEstatusTarea entidad = FTEstatusTarea();
    entidad.id = 0;
    entidad.llave = "";
    entidad.clave = "";
    entidad.nombre = "";
  
    entidad.idTarea =0;
    entidad.idEstatus =0;
    return entidad;
  }

  String toJson() => json.encode(this.toMap());
  FTEstatusTarea fromJson(String cadenaJson) =>
      this.fromMap(json.decode(cadenaJson));

  Map<String, dynamic> fromJsonToMap(String cadenaJson) =>
      json.decode(cadenaJson);

  List<FTEstatusTarea> mapTolista(List<dynamic> listaMapa) {
    List<FTEstatusTarea> lista = listaMapa.isNotEmpty
        ? listaMapa.map((c) => this.fromMap(c)).toList()
        : [];
    return lista;
  }

  List<FTEstatusTarea> jsonToList(String cadenaJson) {
    List<dynamic> listaMap = json.decode(cadenaJson);
    List<FTEstatusTarea> lista = mapTolista(listaMap);
    return lista;
  }
}
