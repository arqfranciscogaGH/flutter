//  librerias internas de flutter

import 'dart:convert';

//  librerias importadas flutter

//  librerias  proyecto

import '../../../nucleo/negocio/modelo/ModeloBase.dart';

class EstadisticasVista extends EntidadBase {
  //    variables
  //    propiedades
  // @override String nombre;
  // @override String descripcion;
  String vista;
  String concepto;
  int cuenta;
  int importe;  
  String identificador;
  int idTarea;
  String claveActividad;  
  String actividad;
  String estatus;
 
  EstadisticasVista({
    id,
    nombre,
    clave,
    llave,
    descripcion,
    this.vista,     
    this.concepto,
    this.cuenta,
    this.importe,
    this.identificador,
    this.idTarea,
    this.claveActividad,
    this.actividad,
    this.estatus,  
     
  }) : super(
            id: id,
            clave: clave,
            llave: llave,
            nombre: nombre,
            descripcion: descripcion,         
            tabla: "EstadisticasVista");
  //    métodos

  factory EstadisticasVista.fromMap(Map<String, dynamic> map) => new EstadisticasVista(
        id: map["id"],
        llave: map["llave"],
        clave: map["clave"],
        nombre: map["nombre"],
        descripcion : map['descripcion'],    
        vista : map['vista'],        
        concepto : map['concepto'],  
        identificador : map['identificador'],                 
        idTarea : map['idTarea'],    
        cuenta : map['cuenta'],          
        importe : map['importe'],           
        claveActividad : map['claveActividad'],
        actividad : map['actividad'],
        estatus : map['estatus'],   
     
      );

  
  EstadisticasVista fromMap(Map<String, dynamic> map) => new EstadisticasVista(
        id: map["id"],
        llave: map["llave"],
        clave: map["clave"],
        nombre: map["nombre"],
        descripcion : map['descripcion'],   
        vista : map['vista'],          
        concepto : map['concepto'],  
        identificador : map['identificador'],                 
        idTarea : map['idTarea'],    
        cuenta : map['cuenta'],          
        importe : map['importe'],           
        claveActividad : map['claveActividad'],
        actividad : map['actividad'],
        estatus : map['estatus'],        
      );
  Map<String, dynamic> toMap() => {
        "id": id,
        "llave": llave,
        "clave": clave,
        "nombre": nombre,
        "descripcion": descripcion,   
        "vista": vista,                     
        "concepto": concepto,   
        "identificador": identificador,          
        "idTarea": idTarea,   
        "claveActividad": claveActividad,
        "actividad": actividad,  
        "estatus": estatus,    
   
        "cuenta": cuenta,       
        "importe": importe,       
      };
         
  String sqlTabla() {
    String sql = "CREATE TABLE if not exists  " +
        tabla +
        " ("
            "id INTEGER PRIMARY KEY ,"
            "llave   TEXT , "
            "clave   TEXT , "
            "nombre   TEXT , "
            "vista   TEXT , "            
            "concepto   TEXT , "            
            "identificador   TEXT , "   
            "idTarea   INTEGER , "
            "claveActividad    TEXT , "
            "actividad   TEXT , "     
            "estatus   TEXT , "     

            "cuenta   INTEGER, "
            "importe   INTEGER, "

            " )";
    return sql;
  }

  EstadisticasVista iniciar() {
    EstadisticasVista entidad = EstadisticasVista();
    entidad.id = 0;
    entidad.llave = "";
    entidad.clave = "";
    entidad.nombre = "";
    entidad.vista = "";    
    entidad.concepto = "";    
    entidad.identificador = ""; 
    entidad.idTarea = 0;
    entidad.claveActividad = "";
    entidad.actividad = "";
    entidad.estatus = "";  
      
    entidad.cuenta =  0;
    entidad.importe = 0;
    
    return entidad;
  }

  String toJson() => json.encode(this.toMap());
  EstadisticasVista fromJson(String cadenaJson) =>
      this.fromMap(json.decode(cadenaJson));

  Map<String, dynamic> fromJsonToMap(String cadenaJson) =>
      json.decode(cadenaJson);

  List<EstadisticasVista> mapTolista(List<dynamic> listaMapa) {
    List<EstadisticasVista> lista = listaMapa.isNotEmpty
        ? listaMapa.map((c) => this.fromMap(c)).toList()
        : [];
    return lista;
  }

  List<EstadisticasVista> jsonToList(String cadenaJson) {
    List<dynamic> listaMap = json.decode(cadenaJson);
    List<EstadisticasVista> lista = mapTolista(listaMap);
    return lista;
  }
}
