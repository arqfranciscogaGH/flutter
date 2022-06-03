//  librerias internas de flutter

import 'dart:convert';

//  librerias importadas flutter

//  librerias  proyecto

import '../../../nucleo/negocio/modelo/ModeloBase.dart';

class EstadisticasVistaDetalle extends EntidadBase {
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
 
  EstadisticasVistaDetalle({
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
            tabla: "EstadisticasVistaDetalle");
  //    métodos

  factory EstadisticasVistaDetalle.fromMap(Map<String, dynamic> map) => new EstadisticasVistaDetalle(
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

  
  EstadisticasVistaDetalle fromMap(Map<String, dynamic> map) => new EstadisticasVistaDetalle(
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

  EstadisticasVistaDetalle iniciar() {
    EstadisticasVistaDetalle entidad = EstadisticasVistaDetalle();
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
  EstadisticasVistaDetalle fromJson(String cadenaJson) =>
      this.fromMap(json.decode(cadenaJson));

  Map<String, dynamic> fromJsonToMap(String cadenaJson) =>
      json.decode(cadenaJson);

  List<EstadisticasVistaDetalle> mapTolista(List<dynamic> listaMapa) {
    List<EstadisticasVistaDetalle> lista = listaMapa.isNotEmpty
        ? listaMapa.map((c) => this.fromMap(c)).toList()
        : [];
    return lista;
  }

  List<EstadisticasVistaDetalle> jsonToList(String cadenaJson) {
    List<dynamic> listaMap = json.decode(cadenaJson);
    List<EstadisticasVistaDetalle> lista = mapTolista(listaMap);
    return lista;
  }
}
