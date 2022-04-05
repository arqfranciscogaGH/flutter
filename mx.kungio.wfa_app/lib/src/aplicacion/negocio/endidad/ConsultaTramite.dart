//  librerias internas de flutter

import 'dart:convert';

//  librerias importadas flutter

//  librerias  proyecto

import '../../../nucleo/negocio/modelo/ModeloBase.dart';

class ConsultaTramite extends EntidadBase {
  //    variables
  //    propiedades
  // @override String nombre;
  // @override String descripcion;

  int idTarea;
  int idActividad;
  String claveActividad;
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
  int idPersona;
  String fechaNacimiento;
  String rfc  ;
  String curp ;
  String telefonoMovil;
  String correo ;
  ConsultaTramite({
    id,
    nombre,
    clave,
    llave,
    descripcion,
  
    this.idTarea,
    this.idActividad,
    this.claveActividad,

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

    this.idPersona,
    this.fechaNacimiento,
    this.rfc  ,
    this.curp ,
    this.telefonoMovil,
    this.correo ,

  }) : super(
            id: id,
            clave: clave,
            llave: llave,
            nombre: nombre,
            descripcion: descripcion,         
            tabla: "ConsultaTramite");
  //    métodos

  factory ConsultaTramite.fromMap(Map<String, dynamic> map) => new ConsultaTramite(
        id: map["id"],
        llave: map["llave"],
        clave: map["clave"],
        nombre: map["nombre"],
        descripcion : map['descripcion'],    
        idTarea : map['idTarea'],     
        idActividad : map['idActividad'],
        claveActividad : map['claveActividad'],        

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

        idPersona : map['idPersona'],  
        fechaNacimiento : map['fechaNacimiento'],  
        rfc : map['rfc'],  
        curp : map['curp'],        
        telefonoMovil : map['telefonoMovil'],  
        correo : map['correo'],      
           
      );

  ConsultaTramite fromMap(Map<String, dynamic> map) => new ConsultaTramite(
       id: map["id"],
        llave: map["llave"],
        clave: map["clave"],
        nombre: map["nombre"],
        descripcion : map['descripcion'],    
        idTarea : map['idTarea'],     
        idActividad : map['idActividad'],
        claveActividad : map['claveActividad'],
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

        idPersona : map['idPersona'],  
        fechaNacimiento : map['fechaNacimiento'],  
        rfc : map['rfc'],  
        curp : map['curp'],        
        telefonoMovil : map['telefonoMovil'],  
        correo : map['correo'],           
      );
  Map<String, dynamic> toMap() => {
        "id": id,
        "llave": llave,
        "clave": clave,
        "nombre": nombre,
        "descripcion": descripcion,       

        "idTarea": idTarea,   
        "idActividad": idActividad,
        "claveActividad": claveActividad,    
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

        "idPersona": idPersona,
        "fechaNacimiento": fechaNacimiento, 
        "rfc": rfc,
        "curp": curp, 
        "telefonoMovil": telefonoMovil,
        "correo": correo, 

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
            "idPersona   INTEGER , "  
            "fechaNacimiento   TEXT , "
            "rfc   TEXT , "
            "curp   TEXT , "  
            "telefonoMovil   TEXT , "  
            "correo   TEXT , "                 

            " )";
    return sql;
  }

  ConsultaTramite iniciar() {
    ConsultaTramite entidad = ConsultaTramite();
    entidad.id = 0;
    entidad.llave = "";
    entidad.clave = "";
    entidad.nombre = "";

    entidad.idTarea = 0;
    entidad.idActividad = 0;
    entidad.claveActividad= "";
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
    entidad.idPersona = 0;  
    entidad.fechaNacimiento = "";  
     entidad.rfc = ""; 
    entidad.curp = ""; 
    entidad.telefonoMovil = "";    
    entidad.correo = "";     

    return entidad;
  }

  String toJson() => json.encode(this.toMap());
  ConsultaTramite fromJson(String cadenaJson) =>
      this.fromMap(json.decode(cadenaJson));

  Map<String, dynamic> fromJsonToMap(String cadenaJson) =>
      json.decode(cadenaJson);

  List<ConsultaTramite> mapTolista(List<dynamic> listaMapa) {
    List<ConsultaTramite> lista = listaMapa.isNotEmpty
        ? listaMapa.map((c) => this.fromMap(c)).toList()
        : [];
    return lista;
  }

  List<ConsultaTramite> jsonToList(String cadenaJson) {
    List<dynamic> listaMap = json.decode(cadenaJson);
    List<ConsultaTramite> lista = mapTolista(listaMap);
    return lista;
  }
}