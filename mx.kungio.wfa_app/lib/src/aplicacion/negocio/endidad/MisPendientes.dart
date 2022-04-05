//  librerias internas de flutter

import 'dart:convert';

//  librerias importadas flutter

//  librerias  proyecto

import '../../../nucleo/negocio/modelo/ModeloBase.dart';

class MisPendientes extends EntidadBase {
  //    variables
  //    propiedades
  // @override String nombre;
  // @override String descripcion;
  double importe;
  int numero;
  String referencia;
  int idHistorial;
  int idInstancia;
  int idTarea;
  int idActividad;
  String identificador;
  String actividad;
  String observacion;
  String estatusFlujo	;
  String estatusTarea ;
  String estatusOperacion	;
  MisPendientes({
    id,
    nombre,
    clave,
    llave,
    descripcion,
    this.importe,
    this.numero,
    this.referencia,
    this.idInstancia,
    this.idHistorial,
    this.idTarea,
    this.idActividad,
    this.identificador,
    this.actividad,
    this.observacion,   
    this.estatusFlujo,
    this.estatusTarea,
    this.estatusOperacion,
  }) : super(
            id: id,
            clave: clave,
            llave: llave,
            nombre: nombre,
            descripcion: descripcion,         
            tabla: "MisPendientes");
  //    métodos

  factory MisPendientes.fromMap(Map<String, dynamic> map) => new MisPendientes(
        id: map["id"],
        llave: map["llave"],
        clave: map["Clave"],
        nombre: map["Nombre"],
        descripcion : map['Descripcion'],         
        importe : map['Importe'],    
        numero :map['Numero'],
        referencia:map['Referencia'],
 
        idHistorial : map['IdHistorial'],                             
        idInstancia : map['IdInstancia'],
        idTarea : map['IdTarea'],
        idActividad : map['IdActividad'],
        observacion : map['observacion'],
        
        identificador : map['Identificador'],
        actividad : map['Actividad'],
        estatusFlujo : map['Estatus_Flujo'],
        estatusTarea : map['Estatus_Tarea'],
        estatusOperacion : map['estatusOperacion'],
      );

  MisPendientes fromMap(Map<String, dynamic> map) => new MisPendientes(
        id: map["id"],
        llave: map["llave"],
        clave: map["Clave"],
        nombre: map["Nombre"],
        descripcion : map['Descripcion'],         
        importe : map['Importe'],    
        numero :map['Numero'],
        referencia:map['Referencia'],
 
        idHistorial : map['IdHistorial'],                             
        idInstancia : map['IdInstancia'],
        idTarea : map['IdTarea'],
        idActividad : map['IdActividad'],
        identificador : map['Identificador'],
        actividad : map['Actividad'],
        observacion : map['observacion'],        
        estatusFlujo : map['Estatus_Flujo'],
        estatusTarea : map['Estatus_Tarea'],
        estatusOperacion : map['estatusOperacion'],
      );
  Map<String, dynamic> toMap() => {
        "id": id,
        "llave": llave,
        "clave": clave,
        "nombre": nombre,
        "importe": importe,
        "descripcion": descripcion,       
        "numero": numero,
        "referencia": referencia,

        "idHistorial": idHistorial,       
        "idInstancia": idInstancia,
        "idTarea": idTarea,
        "identificador": identificador,
        "actividad": actividad,
        "observacion": observacion,     
        "estatusFlujo": estatusFlujo,
        "estatusTarea": estatusTarea,
        "estatusOperacion": estatusOperacion,
      };
  String sqlTabla() {
    String sql = "CREATE TABLE if not exists  " +
        tabla +
        " ("
            "id INTEGER PRIMARY KEY ,"
            "llave   TEXT , "
            "clave   TEXT , "
            "nombre   TEXT , "
            "importe   INTEGER , "
            "numero    INTEGER , "
            "referencia   TEXT, "
            "descripcion   TEXT, "
            "idHistorial   INTEGER , "            
            "idInstancia   INTEGER , "
            "idTarea   INTEGER , "
            "idActividad   INTEGER  , "     
            "identificador   TEXT  , "  
            "actividad   TEXT  , "  
            "observacion   TEXT  , "             
            "estatusFlujo   TEXT  , "     
            "estatusTarea   TEXT  , "  
            "estatusOperacion   TEXT  )";
    return sql;
  }

  MisPendientes iniciar() {
    MisPendientes entidad = MisPendientes();
    entidad.id = 0;
    entidad.llave = "";
    entidad.clave = "";
    entidad.nombre = "";
    entidad.importe = 0;
    entidad.numero = 0;
    entidad.referencia =  "";
    entidad.descripcion ="";
    entidad.idHistorial = 0;
    entidad.idInstancia = 0;   
    entidad.idTarea =0 ;
    entidad.idActividad =0 ;
    entidad.identificador =  "";
    entidad.actividad ="";
    entidad.observacion ="";
    entidad.estatusFlujo =  "";
    entidad.estatusTarea ="";
    entidad.estatusOperacion ="";
    return entidad;
  }

  String toJson() => json.encode(this.toMap());
  MisPendientes fromJson(String cadenaJson) =>
      this.fromMap(json.decode(cadenaJson));

  Map<String, dynamic> fromJsonToMap(String cadenaJson) =>
      json.decode(cadenaJson);

  List<MisPendientes> mapTolista(List<dynamic> listaMapa) {
    List<MisPendientes> lista = listaMapa.isNotEmpty
        ? listaMapa.map((c) => this.fromMap(c)).toList()
        : [];
    return lista;
  }

  List<MisPendientes> jsonToList(String cadenaJson) {
    List<dynamic> listaMap = json.decode(cadenaJson);
    List<MisPendientes> lista = mapTolista(listaMap);
    return lista;
  }
}
