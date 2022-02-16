//  librerias internas de flutter

import 'dart:convert';

//  librerias importadas flutter

import 'package:intl/intl.dart';

//  librerias  proyecto

import '../../../nucleo/negocio/modelo/ModeloBase.dart';

class CuentaUsuario extends EntidadBase {
  //    variables
  //    propiedades

  String fecha;
  String cuenta;
  String contrasena;
  String correo;
  String telefono;
  String fechaNacimiento;
  String genero;
  String rutaFoto;
  String urlFoto;
  String idEstacionTrabajo;
  String tema;
  int idIdioma;
  int sesiones;
  int intentos;
  String perfiles;
  String grupos;
  String privilegios;
  int expira;
  int idSuscriptor;
  String fechaEstatus;
  int estatus;
  CuentaUsuario({
    id,
    nombre,
    clave,
    llave,
    this.fecha,
    this.cuenta,
    this.contrasena,
    this.correo,
    this.telefono,
    this.fechaNacimiento,
    this.genero,
    this.rutaFoto,
    this.urlFoto,
    this.idEstacionTrabajo,
    this.tema,
    this.idIdioma,
    this.sesiones,
    this.intentos,
    this.grupos,
    this.perfiles,
    this.privilegios,
    this.expira,
    this.idSuscriptor,
    this.fechaEstatus,
    this.estatus,
  }) : super(
            id: id,
            clave: clave,
            llave: llave,
            nombre: nombre,
            tabla: "CuentaUsuarios");
  //    métodos

  factory CuentaUsuario.fromMap(Map<String, dynamic> map) => new CuentaUsuario(
        id: map["id"],
        llave: map["llave"],
        clave: map["clave"],
        nombre: map["nombre"],
        fecha: map["fecha"],
        cuenta: map["cuenta"],
        contrasena: map["contrasena"],
        correo: map["correo"],
        telefono: map["telefono"],
        fechaNacimiento: map["fechaNacimiento"],
        genero: map["genero"],
        rutaFoto: map["rutaFoto"],
        urlFoto: map["urlFoto"],
        idEstacionTrabajo: map["idEstacionTrabajo"],
        tema: map["tema"],
        idIdioma: map["idIdioma"],
        sesiones: map["sesiones"],
        intentos: map["intentos"],
        grupos: map["grupos"],
        perfiles: map["perfiles"],
        privilegios: map["privilegios"],
        expira: map["expira"],
        idSuscriptor: map["idSuscriptor"],
        fechaEstatus: map["fechaEstatus"],
        estatus: int.parse(map["estatus"].toString()),
      );

  CuentaUsuario fromMap(Map<String, dynamic> map) => new CuentaUsuario(
        id: map["id"],
        llave: map["llave"],
        clave: map["clave"],
        nombre: map["nombre"],
        fecha: map["fecha"],
        cuenta: map["cuenta"],
        contrasena: map["contrasena"],
        correo: map["correo"],
        telefono: map["telefono"],
        fechaNacimiento: map["fechaNacimiento"],
        genero: map["genero"],
        rutaFoto: map["rutaFoto"],
        urlFoto: map["urlFoto"],
        idEstacionTrabajo: map["idEstacionTrabajo"],
        tema: map["tema"],
        idIdioma: map["idIdioma"],
        sesiones: map["sesiones"],
        intentos: map["intentos"],
        grupos: map["grupos"],
        perfiles: map["perfiles"],
        privilegios: map["privilegios"],
        expira: map["expira"],
        idSuscriptor: map["idSuscriptor"],
        fechaEstatus: map["fechaEstatus"],
        estatus: int.parse(map["estatus"].toString()),
      );
  Map<String, dynamic> toMap() => {
        "id": id,
        "llave": llave,
        "clave": clave,
        "nombre": nombre,
        "fecha": fecha,
        "cuenta": cuenta,
        "contrasena": contrasena,
        "correo": correo,
        "telefono": telefono,
        "fechaNacimiento": fechaNacimiento,
        "genero": genero,
        "rutaFoto": rutaFoto,
        "urlFoto": urlFoto,
        "idEstacionTrabajo": idEstacionTrabajo,
        "tema": tema,
        "idIdioma": idIdioma,
        "sesiones": sesiones,
        "intentos": intentos,
        "grupos": grupos,
        "perfiles": perfiles,
        "privilegios": privilegios,
        "expira": expira,
        "idSuscriptor": idSuscriptor,
        "fechaEstatus": fechaEstatus,
        "estatus": estatus,
      };
  String sqlTabla() {
    String sql = "CREATE TABLE if not exists  " +
        tabla +
        " ("
            "id INTEGER PRIMARY KEY ,"
            "llave   TEXT , "
            "clave   TEXT , "
            "nombre   TEXT , "
            "fecha   TEXT , "
            "cuenta    TEXT , "
            "contrasena   TEXT, "
            "correo   TEXT, "
            "telefono   TEXT, "
            "fechaNacimiento   TEXT, "
            "genero  TEXT , "
            "rutaFoto  TEXT , "
            "urlFoto  TEXT , "
            "idEstacionTrabajo   TEXT , "
            "tema   TEXT , "
            "idIdioma   INTEGER , "
            "sesiones   INTEGER , "
            "intentos   INTEGER , "
            "grupos   TEXT , "
            "perfiles   TEXT , "
            "privilegios   TEXT , "
            "expira   INTEGER , "
            "idSuscriptor   INTEGER, "
            "fechaEstatus   TEXT , "
            "estatus   INTEGER )";
    return sql;
  }

  CuentaUsuario iniciar() {
    CuentaUsuario entidad = CuentaUsuario();
    entidad.id = 0;
    entidad.llave = "";
    entidad.clave = "";
    entidad.nombre = "";
    entidad.fecha = "";
    entidad.cuenta = "";
    entidad.contrasena = "";
    entidad.correo = "";
    entidad.telefono = "";
    entidad.fechaNacimiento = "";
    entidad.genero = "F";
    entidad.rutaFoto = "";
    entidad.urlFoto = "";
    entidad.idEstacionTrabajo = "";
    entidad.tema = "";
    entidad.idIdioma = 0;
    entidad.intentos = 3;
    entidad.sesiones = 0;

    entidad.grupos = "";
    entidad.perfiles = "";
    entidad.privilegios = "0";

    entidad.expira = 0;

    entidad.idSuscriptor = 0;
    entidad.fecha = DateFormat('MM-dd-yyyy').format(DateTime.now());
    entidad.estatus = 1;
    return entidad;
  }

  String toJson() => json.encode(this.toMap());
  CuentaUsuario fromJson(String cadenaJson) => this.fromMap(json.decode(cadenaJson));

  Map<String, dynamic> fromJsonToMap(String cadenaJson) =>
      json.decode(cadenaJson);

  List<CuentaUsuario> mapTolista(List<dynamic> listaMapa) {
    List<CuentaUsuario> lista = listaMapa.isNotEmpty
        ? listaMapa.map((c) => this.fromMap(c)).toList()
        : [];
    return lista;
  }

  List<CuentaUsuario> jsonToList(String cadenaJson) {
    List<dynamic> listaMap = json.decode(cadenaJson);
    List<CuentaUsuario> lista = mapTolista(listaMap);
    return lista;
  }
}
