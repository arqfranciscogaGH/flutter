//  librerias internas de flutter

import 'dart:convert';

//  librerias importadas flutter

import 'package:intl/intl.dart';

//  librerias  proyecto

import '../../../nucleo/negocio/modelo/ModeloBase.dart';

class AdministracionUsuarios extends EntidadBase {
  //    variables
  //    propiedades

  int idUsuario;
  String cuenta;
  String contrasena;
  
  int idUsuarioSuperior;
  int idNivelRed;
  String claveNivelRed;
  String nivelRed;
  int orden;
  double comision;
  String perfiles;
  String grupos;
  String privilegios;
  int sesiones;
  int intentos;
  int idIdioma;
  String tema;
  int expira;
  String fechaVigencia;
  int idSuscriptor;
  int activo;
  String perfil;
  String grupo;
  String  fechaRegistro;
  String  fechaCambioEstatus;
 
  AdministracionUsuarios({
    id,
    nombre,
    clave,
    llave,
    this.idUsuario,
    this.cuenta,
    this.contrasena,
    this.idUsuarioSuperior,
    this.idNivelRed,
    this.claveNivelRed,
    this.nivelRed,
    this.orden,
    this.comision,
    this.perfiles,
    this.grupos,
    this.privilegios, 
    this.sesiones,
    this.intentos,
    this.idIdioma,
    this.tema,
    this.expira, 
    this.fechaVigencia,
    this.idSuscriptor,
    this.activo,
    this.perfil,
    this.grupo,      
    this.fechaRegistro,
    this.fechaCambioEstatus,
   
  }) : super(
            id: id,
            clave: clave,
            llave: llave,
            nombre: nombre,
            tabla: "AdministracionUsuarios");
  //    métodos
 
  
 
   
   
 
 
 

  factory AdministracionUsuarios.fromMap(Map<String, dynamic> map) => new AdministracionUsuarios(
        id: map["idUsuario"],
        idUsuario: map["idUsuario"],        
        llave: map["llave"],
        clave: map["clave"],
        nombre: map["nombre"],
        cuenta: map["cuenta"],
        contrasena: map["contrasena"],
        idUsuarioSuperior: map["idUsuarioSuperior"],
        idNivelRed: map["idNivelRed"],
        claveNivelRed: map["claveNivelRed"],
        nivelRed: map["nivelRed"],
  
        orden: map["orden"],
        comision: map["comision"],
        perfiles: map["perfiles"],
        grupos: map["grupos"],  
        privilegios: map["privilegios"],  

        sesiones: map["sesiones"],
        intentos: map["intentos"],     
        idIdioma: map["idIdioma"],
        tema: map["tema"],

        expira: map["expira"],
        fechaVigencia: map["fechaVigencia"],
        idSuscriptor: map["idSuscriptor"], 
        activo: map["activo"] == true ? 1 : 0,  
        perfil: map["perfil"],
        grupo: map["grupo"],
        fechaRegistro: map["fechaRegistro"],
        fechaCambioEstatus: map["fechaCambioEstatus"],

      );

  AdministracionUsuarios fromMap(Map<String, dynamic> map) => new AdministracionUsuarios(
        id: map["idUsuario"],
        idUsuario: map["idUsuario"],        
        llave: map["llave"],
        clave: map["clave"],
        nombre: map["nombre"],
        cuenta: map["cuenta"],
        contrasena: map["contrasena"],
        idUsuarioSuperior: map["idUsuarioSuperior"],
        idNivelRed: map["idNivelRed"],
        claveNivelRed: map["claveNivelRed"],
        nivelRed: map["nivelRed"],
  
        orden: map["orden"],
        comision: map["comision"],
        perfiles: map["perfiles"],
        grupos: map["grupos"],  
        privilegios: map["privilegios"],  

        sesiones: map["sesiones"],
        intentos: map["intentos"],     
        idIdioma: map["idIdioma"],
        tema: map["tema"],

        expira: map["expira"],
        fechaVigencia: map["fechaVigencia"],
        idSuscriptor: map["idSuscriptor"], 
        activo: map["activo"] == true ? 1 : 0,  
        perfil: map["perfil"],
        grupo: map["grupo"],
        fechaRegistro: map["fechaRegistro"],
        fechaCambioEstatus: map["fechaCambioEstatus"],
      );
  Map<String, dynamic> toMap() => {
        "id": idUsuario,
        "idUsuario": idUsuario,
        "llave": llave,
        "clave": clave,
        "nombre": nombre,
        "cuenta": cuenta,
        "contrasena": contrasena,
        "idUsuarioSuperior": idUsuarioSuperior,

        "idNivelRed": idNivelRed,
        "claveNivelRed": claveNivelRed,
        "nivelRed": nivelRed,

        "orden": orden,
        "comision": comision,
        "perfiles": perfiles,
        "grupos": grupos,
        "privilegios": privilegios,

        "sesiones": sesiones,
        "intentos": intentos,

        "idIdioma": idIdioma,
        "tema": tema,
        "expira": expira,

        "fechaVigencia": fechaVigencia,
        "idSuscriptor": idSuscriptor,
        "activo": activo,   
        "perfil": perfil,
        "grupo": grupo,
        "fechaRegistro": fechaRegistro,
        "fechaCambioEstatus": fechaCambioEstatus,

      };
  String sqlTabla() {
    String sql = "CREATE TABLE if not exists  " +
        tabla +
        " ("
            "id INTEGER PRIMARY KEY ,"
            "llave   TEXT , "
            "clave   TEXT , "
            "nombre   TEXT , "
            "cuenta    TEXT , "
            "contrasena   TEXT, "
            "correo   TEXT, "
            "rutaFoto  TEXT , "
            "urlFoto  TEXT , "
            "idEstacionTrabajo   TEXT , "
            "tema   TEXT , "
            "idUsuarioSuperior   INTEGER , "
            "idEstatusUsuario   INTEGER , "     
            "idIdioma   INTEGER , "
            "sesiones   INTEGER , "
            "intentos   INTEGER , "
            "grupos   TEXT , "
            "perfiles   TEXT , "
            "privilegios   TEXT , "
            "expira   INTEGER , "
            "idSuscriptor   INTEGER ) ";
    
    return sql;
  }

  AdministracionUsuarios iniciar() {
    AdministracionUsuarios entidad = AdministracionUsuarios();
    entidad.id = 0;
    entidad.idUsuario = 0;
     entidad.llave = "";
    entidad.clave = "";
    entidad.nombre = "";
    entidad.cuenta = "";
    entidad.contrasena = "";

    entidad.idUsuarioSuperior = 0;
    entidad.idNivelRed = 0;
    entidad.claveNivelRed = "";
    entidad.nivelRed = "";

    entidad.orden=0;   
    entidad.comision=0;   
    entidad.perfiles = "";
    entidad.grupos = "";
    entidad.privilegios = "";

    entidad.idIdioma = 0;
    entidad.intentos = 3;
    entidad.sesiones = 0;
    entidad.tema = "";
    entidad.expira = 0;

    entidad.fechaVigencia = "";
    entidad.idSuscriptor = 0;
    entidad.activo = 0;
    entidad.perfil = "";
    entidad.grupo = "";
    
    entidad.fechaRegistro = "0";
    entidad.fechaCambioEstatus = "0";
    return entidad;
  }

  String toJson() => json.encode(this.toMap());
  AdministracionUsuarios fromJson(String cadenaJson) => this.fromMap(json.decode(cadenaJson));

  Map<String, dynamic> fromJsonToMap(String cadenaJson) =>
      json.decode(cadenaJson);

  List<AdministracionUsuarios> mapTolista(List<dynamic> listaMapa) {
    List<AdministracionUsuarios> lista = listaMapa.isNotEmpty
        ? listaMapa.map((c) => this.fromMap(c)).toList()
        : [];
    return lista;
  }

  List<AdministracionUsuarios> jsonToList(String cadenaJson) {
    List<dynamic> listaMap = json.decode(cadenaJson);
    List<AdministracionUsuarios> lista = mapTolista(listaMap);
    return lista;
  }
}
