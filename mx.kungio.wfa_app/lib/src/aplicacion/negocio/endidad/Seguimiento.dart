//  librerias internas de flutter

import 'dart:convert';

//  librerias importadas flutter

//  librerias  proyecto

import '../../../nucleo/negocio/modelo/ModeloBase.dart';

class Seguimiento extends EntidadBase {
  //    variables
  //    propiedades
  // @override String nombre;
  // @override String descripcion;
  int orden;
  String actividad;
  String estatusInstancia;
  String estatusTarea;
  String fechaInicio;
  String fechaTernimacion;
  int tiempoActividad;
  int tiempoLimite;
  int productividadTiempo;
  String referencia;
  String idUsuario;
  String idEquipo;
  String observacion;
   Seguimiento( {
		id,
		nombre,
		clave,
		llave,
		descripcion,
	  this.orden,
      this.actividad,
      this.estatusInstancia,
      this.estatusTarea,
      this.fechaInicio,
      this.fechaTernimacion,
      this.tiempoActividad,
      this.tiempoLimite,
      this.productividadTiempo,
      this.referencia,
      this.idUsuario,
      this.idEquipo,
      this.observacion  }) : super(
            id: id,
            clave: clave,
            llave: llave,
            nombre: nombre,
            descripcion: descripcion,         
            tabla: "Seguimiento");
  //    métodos

 factory Seguimiento.fromMap(Map<String, dynamic> map) => new Seguimiento(
    id: map["id"],
    llave: map["llave"],
    clave: map["clave"],
    nombre: map["Nombre"],
    orden : map['Orden'],
    actividad : map['Actividad'],
    estatusInstancia : map['Estatus__Instancia'],
    estatusTarea : map['Estatus_Tarea'],
    fechaInicio : map['FechaInicio'],
    fechaTernimacion : map['FechaTernimacion'],
    tiempoActividad : map['TiempoActividad'],
    tiempoLimite : map['TiempoLimite'],
    productividadTiempo : map['ProductividadTiempo'],
    referencia : map['Referencia'],
    idUsuario : map['IdUsuario'],
    idEquipo : map['IdEquipo'],
    observacion : map['Observacion'],
  );



  Seguimiento fromMap(Map<String, dynamic> map) => new Seguimiento(
    id: map["id"],
    llave: map["llave"],
    clave: map["clave"],
    nombre: map["Nombre"],
    orden: map['Orden'],
    actividad: map["Actividad"],
    estatusInstancia : map['Estatus__Instancia'],
    estatusTarea: map['Estatus_Tarea'],
    fechaInicio: map['FechaInicio'],
    fechaTernimacion: map['FechaTernimacion'],
    tiempoActividad: map['TiempoActividad'],
    tiempoLimite: map['TiempoLimite'],
    productividadTiempo: map['ProductividadTiempo'],
    referencia: map['Referencia'],
    idUsuario: map['IdUsuario'],
    idEquipo: map['IdEquipo'],
    observacion: map['observacion'], 
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "llave": llave,
        "clave": clave,
        "nombre": nombre,
        "Orden" : orden,
        "Actividad" : actividad,
        "Estatus__Instancia" : estatusInstancia,
        "Estatus_Tarea": estatusTarea,
        "FechaInicio" : fechaInicio,
        "FechaTernimacion" : fechaTernimacion,
        "TiempoActividad" : tiempoActividad,
        "TiempoLimite" : tiempoLimite,
        "ProductividadTiempo" : productividadTiempo,
        "Referencia" : referencia,
        "IdUsuario" : idUsuario,
        "IdEquipo" : idEquipo,
        "Observacion" : observacion,
      };
  String sqlTabla() {
    String sql = "CREATE TABLE if not exists  " +
        tabla +
        " ("
            "id INTEGER PRIMARY KEY ,"
            "llave   TEXT , "
            "clave   TEXT , "
            "nombre   TEXT , "
            "descripcion   TEXT, "
            "orden   INTEGER , "
            "actividad    TEXT , "
            "estatusInstancia   TEXT, "
            "estatusTarea   TEXT , "            
            "fechaInicio   TEXT , "
            "fechaTernimacion   TEXT , "
            "tiempoActividad   INTEGER  , "     
            "tiempoLimite   INTEGER  , "  
            "productividadTiempo   INTEGER  , "  
            "referencia   TEXT  , "             
            "idUsuario   TEXT  , "     
            "idEquipo   TEXT  , "  
            "observacion   TEXT  )";
    return sql;
  }

  Seguimiento iniciar() {
    Seguimiento entidad = Seguimiento();
    entidad.id = 0;
    entidad.llave = "";
    entidad.clave = "";
    entidad.nombre = "";
    entidad.descripcion ="";

    entidad.orden = 0;
    entidad.actividad =  "";
    entidad.estatusInstancia =  "";
    entidad.estatusTarea ="";

    entidad.fechaInicio = "";  
    entidad.fechaTernimacion ="";
    entidad.tiempoActividad =0 ;
    entidad.tiempoLimite =0 ;
    entidad.productividadTiempo =0 ; 
    entidad.referencia ="";
    entidad.idUsuario ="";
    entidad.idEquipo =  "";
    entidad.observacion ="";
    return entidad;
  }

  
  String toJson() => json.encode(this.toMap());
  Seguimiento fromJson(String cadenaJson) =>
      this.fromMap(json.decode(cadenaJson));

  Map<String, dynamic> fromJsonToMap(String cadenaJson) =>
      json.decode(cadenaJson);

  List<Seguimiento> mapTolista(List<dynamic> listaMapa) {
    List<Seguimiento> lista = listaMapa.isNotEmpty
        ? listaMapa.map((c) => this.fromMap(c)).toList()
        : [];
    return lista;
  }

  List<Seguimiento> jsonToList(String cadenaJson) {
    List<dynamic> listaMap = json.decode(cadenaJson);
    List<Seguimiento> lista = mapTolista(listaMap);
    return lista;
  }
}
