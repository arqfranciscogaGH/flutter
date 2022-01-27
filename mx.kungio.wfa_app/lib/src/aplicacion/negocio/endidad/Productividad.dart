//  librerias internas de flutter

import 'dart:convert';

//  librerias importadas flutter

//  librerias  proyecto

import '../../../nucleo/negocio/modelo/ModeloBase.dart';

class Productividad extends EntidadBase {
  //    variables
  //    propiedades
  // @override String nombre;
  // @override String descripcion;

  int idTarea;
  int idActividad;
  String actividad;
  String estatus;
  String estatusTarea;
  int cuenta;
  int importe;
  int tiempoLimite;
  int tiempoTranscurrido;
  int productividad;

  int idInstancia;
  String identificador;
  String fechaInicial;
  String fechaActual;
  int idSocio;
  String socio;
  int idGrupo ; 
  String grupo;
  Productividad({
    id,
    nombre,
    clave,
    llave,
    descripcion,
  
    this.idTarea,
    this.idActividad,
    this.actividad,
    this.estatus,  
    this.estatusTarea,  
    this.cuenta,
    this.importe,
    this.tiempoLimite,  
    this.tiempoTranscurrido,    
    this.productividad,
  
    this.idInstancia,
    this.identificador, 
    this.fechaInicial ,
    this.fechaActual,
    this.idSocio,
    this.socio,
    this.idGrupo , 
    this.grupo,
  }) : super(
            id: id,
            clave: clave,
            llave: llave,
            nombre: nombre,
            descripcion: descripcion,         
            tabla: "Productividad");
  //    métodos

  factory Productividad.fromMap(Map<String, dynamic> map) => new Productividad(
        id: map["id"],
        llave: map["llave"],
        clave: map["clave"],
        nombre: map["nombre"],
        descripcion : map['descripcion'],    
        idTarea : map['idTarea'],     
        idActividad : map['idActividad'],
        actividad : map['actividad'],
        estatus : map['estatus'],   
        estatusTarea : map['estatusTarea'],  
        cuenta : map['cuenta'],          
        importe : map['importe'],   
        tiempoLimite : map['tiempoLimite'],          
        tiempoTranscurrido : map['tiempoTranscurrido'],    
        productividad : map['productividad'],          

        idInstancia : map['idInstancia'],     
        identificador : map['identificador'],   
        fechaInicial : map['fechaInicial'],  
        fechaActual : map['fechaActual'],  
        idSocio : map['idSocio'],  
        socio : map['socio'],        
         idGrupo : map['idGrupo'],  
        grupo : map['grupo'],  
           
      );

  Productividad fromMap(Map<String, dynamic> map) => new Productividad(
        id: map["id"],
        llave: map["llave"],
        clave: map["clave"],
        nombre: map["nombre"],
        descripcion : map['descripcion'],    
        idTarea : map['idTarea'],     
        idActividad : map['idActividad'],
        actividad : map['actividad'],
        estatus : map['estatus'],   
        estatusTarea : map['estatusTarea'],  
        cuenta : map['cuenta'],          
        importe : map['importe'],   
        tiempoLimite : map['tiempoLimite'],          
        tiempoTranscurrido : map['tiempoTranscurrido'],    
        productividad : map['productividad'],          

        idInstancia : map['idInstancia'],     
        identificador : map['identificador'],   
        fechaInicial : map['fechaInicial'],  
        fechaActual : map['fechaActual'],  
        idSocio : map['idSocio'],  
        socio : map['socio'],        
         idGrupo : map['idGrupo'],  
        grupo : map['grupo'],       
      );
  Map<String, dynamic> toMap() => {
        "id": id,
        "llave": llave,
        "clave": clave,
        "nombre": nombre,
        "descripcion": descripcion,       

        "idTarea": idTarea,   
        "idActividad": idActividad,
        "actividad": actividad,  
        "estatus": estatus,    
        "estatusTarea": estatusTarea,   
        "cuenta": cuenta,       
        "importe": importe,       
        "tiempoLimite": tiempoLimite,   
        "tiempoTranscurrido": tiempoTranscurrido,                  
        "productividad": productividad,  
    
        "idInstancia": idInstancia,
        "identificador": identificador,  
        "fechaInicial": fechaInicial,
        "fechaActual": fechaActual, 
        "idSocio": idSocio,
        "socio": socio, 
        "idGrupo": idGrupo,
        "grupo": grupo, 

      };
         
  String sqlTabla() {
    String sql = "CREATE TABLE if not exists  " +
        tabla +
        " ("
            "id INTEGER PRIMARY KEY ,"
            "llave   TEXT , "
            "clave   TEXT , "
            "nombre   TEXT , "
         
            "idTarea   INTEGER , "
            "idActividad    INTEGER , "
            "actividad   TEXT , "     
            "estatus   TEXT , "     
            "estatusTarea   TEXT , " 
            "cuenta   INTEGER, "
            "importe   INTEGER, "
            "tiempoLimite   INTEGER, "
            "tiempoTranscurrido   INTEGER, "
            "productividad   INTEGER, "
            "tiempoLimite   INTEGER, "
            "idInstancia   INTEGER , "  
            "identificador   TEXT , "
            "fechaInicial   TEXT , "  
            "fechaActual   TEXT , "
            "idSocio   INTEGER , "  
            "socio   TEXT , "
            "idGrupo   INTEGER , "  
            "grupo   TEXT , "

            " )";
    return sql;
  }

  Productividad iniciar() {
    Productividad entidad = Productividad();
    entidad.id = 0;
    entidad.llave = "";
    entidad.clave = "";
    entidad.nombre = "";

    entidad.idTarea = 0;
    entidad.idActividad = 0;
    entidad.actividad = "";
    entidad.estatus = "";  
    entidad.estatusTarea = "";  
      
    entidad.cuenta =  0;
    entidad.importe = 0;
    entidad.tiempoLimite = 0;
    entidad.tiempoTranscurrido = 0;
    entidad.productividad = 0;
 
    entidad.idInstancia = 0;   
    entidad.identificador = ""; 
    entidad.fechaInicial = ""; 
    entidad.fechaActual = ""; 
    entidad.idSocio = 0;  
    entidad.socio = "";     
    entidad.idGrupo = 0;  
    entidad.grupo = "";   
    return entidad;
  }

  String toJson() => json.encode(this.toMap());
  Productividad fromJson(String cadenaJson) =>
      this.fromMap(json.decode(cadenaJson));

  Map<String, dynamic> fromJsonToMap(String cadenaJson) =>
      json.decode(cadenaJson);

  List<Productividad> mapTolista(List<dynamic> listaMapa) {
    List<Productividad> lista = listaMapa.isNotEmpty
        ? listaMapa.map((c) => this.fromMap(c)).toList()
        : [];
    return lista;
  }

  List<Productividad> jsonToList(String cadenaJson) {
    List<dynamic> listaMap = json.decode(cadenaJson);
    List<Productividad> lista = mapTolista(listaMap);
    return lista;
  }
}
