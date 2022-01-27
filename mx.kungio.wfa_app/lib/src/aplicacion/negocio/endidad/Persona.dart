//  librerias internas de flutter

import 'dart:convert';

//  librerias importadas flutter

//  librerias  proyecto

import '../../../nucleo/negocio/modelo/ModeloBase.dart';

class Persona extends EntidadBase {
  //    variables
  //    propiedades
  //
  //

  String idTipoPersona;
  int idUsuario;

  String apellidoPaterno;
  String apellidoMaterno;
  String rfc;
  String curp;
  String telefono;
  String telefonoMovil;
  String correo;
  String genero;
  String direccion;

  String referencia;
  String banco;
  String cuentaBanco;
  int importe;
  int saldo;
  String rutaFoto;
  String urlFoto;
  String fechaNacimiento;
  String fecha;
  String fechaRegistro;
  String fechaEntrega;
  int idSuscriptor;
  String fechaEstatus;
  int estatus;

  Persona({
    id,
    nombre,
    clave,
    llave,
    descripcion,
    this.idTipoPersona,
    this.idUsuario,
    this.apellidoPaterno,
    this.apellidoMaterno,
    this.rfc,
    this.curp,
    this.telefono,
    this.telefonoMovil,
    this.correo,
    this.genero,
    this.direccion,
    this.referencia,
    this.banco,
    this.cuentaBanco,
    this.importe,
    this.saldo,
    this.fecha,
    this.fechaRegistro,
    this.fechaNacimiento,
    this.fechaEntrega,
    this.rutaFoto,
    this.urlFoto,
    this.fechaEstatus,
    this.idSuscriptor,
    this.estatus,
  }) : super(
            id: id,
            nombre: nombre,
            clave: clave,
            llave: llave,
            descripcion: descripcion,
            tabla: "Personas");
  //    métodos

  factory Persona.fromMap(Map<String, dynamic> map) => new Persona(
        id: map["id"],
        llave: map["llave"],
        clave: map["clave"],
        nombre: map["nombre"],
        descripcion: map["descripcion"],

        idTipoPersona: map["idTipoPersona"],
        idUsuario: map["idUsuario"],

        apellidoPaterno: map["apellidoPaterno"],
        apellidoMaterno: map["apellidoMaterno"],
        rfc: map["rfc"],
        curp: map["curp"],
        telefono: map["telefono"],
        telefonoMovil: map["telefonoMovil"],
        correo: map["correo"],
        genero: map["genero"],
        direccion: map["direccion"],

        referencia: map["referencia"],
        banco: map["banco"],
        cuentaBanco: map["cuentaBanco"],
        importe: map["importe"],
        saldo: map["saldo"],
        rutaFoto: map["rutaFoto"],
        urlFoto: map["urlFoto"],
        fechaNacimiento: map["fechaNacimiento"],
        fecha: map["fecha"],
        fechaEntrega: map["fechaEntrega"],    
        fechaRegistro: map["fechaRegistro"],
         idSuscriptor: map["idSuscriptor"],
        fechaEstatus: map["fechaEstatus"],
        //activo: int.parse(map["activo"].toString()),
        estatus: map["estatus"],
      );
  Persona fromMap(Map<String, dynamic> map) => new Persona(
        id: map["id"],
        llave: map["llave"],
        clave: map["clave"],
        nombre: map["nombre"],
        descripcion: map["descripcion"],

        idTipoPersona: map["idTipoPersona"],
        idUsuario: map["idUsuario"],

        apellidoPaterno: map["apellidoPaterno"],
        apellidoMaterno: map["apellidoMaterno"],
        rfc: map["rfc"],
        curp: map["curp"],
        telefono: map["telefono"],
        telefonoMovil: map["telefonoMovil"],
        correo: map["correo"],
        genero: map["genero"],
        direccion: map["direccion"],

        referencia: map["referencia"],
        banco: map["banco"],
        cuentaBanco: map["cuentaBanco"],
        importe: map["importe"],
        saldo: map["saldo"],
        rutaFoto: map["rutaFoto"],
        urlFoto: map["urlFoto"],
        fechaNacimiento: map["fechaNacimiento"],
        fecha: map["fecha"],
        fechaEntrega: map["fechaEntrega"],        
        fechaRegistro: map["fechaRegistro"],
        idSuscriptor: map["idSuscriptor"],
        fechaEstatus: map["fechaEstatus"],
        //activo: int.parse(map["activo"].toString()),
        estatus: map["estatus"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "llave": llave,
        "clave": clave,
        "nombre": nombre,
        "descripcion": descripcion,
        "idTipoPersona": idTipoPersona,
        "idUsuario": idUsuario,
        "apellidoPaterno": apellidoPaterno,
        "apellidoMaterno": apellidoMaterno,
        "rfc": rfc,
        "curp": curp,
        "telefono": telefono,
        "telefonoMovil": telefonoMovil,
        "correo": correo,
        "genero": genero,
        "direccion": direccion,
        "referencia": referencia,
        "banco": banco,
        "cuentaBanco": cuentaBanco,
        "importe": importe,
        "saldo": saldo,
        "rutaFoto": rutaFoto,
        "urlFoto": urlFoto,
        "fechaNacimiento": fechaNacimiento,
        "fecha": fecha,
        "fechaEntrega": fechaEntrega,      
        "fechaRegistro": fechaRegistro,
        "idSuscriptor": idSuscriptor,
        "fechaEstatus": fechaEstatus,
        "estatus": estatus,
      };
  String sqlTabla() {
    String sql = "CREATE TABLE if not exists " +
        tabla +
        " ("
            "id INTEGER PRIMARY KEY autoincrement ,"
            "llave TEXT , "
            "clave TEXT , "
            "nombre  TEXT , "
            "descripcion TEXT , "
            "idTipoPersona  TEXT , "
            "idUsuario  INTEGER , "
            "apellidoPaterno  TEXT , "
            "apellidoMaterno  TEXT , "
            "rfc TEXT , "
            "curp  TEXT , "
            "telefono  TEXT , "
            "telefonoMovil  TEXT , "
            "correo TEXT , "
            "genero TEXT , "
            "direccion  TEXT , "
            "referencia TEXT , "
            "banco TEXT , "
            "cuentaBanco TEXT , "
            "importe INTEGER , "
            "saldo INTEGER , "
            "rutaFoto TEXT , "
            "urlFoto TEXT , "
            "fechaNacimiento TEXT , "
            "fecha TEXT , "
            "fechaEntrega TEXT , "            
            "fechaRegistro TEXT , "
            "idSuscriptor INTEGER , "
            "fechaEstatus TEXT , "
            "estatus INTEGER )";
    return sql;
  }

  Persona iniciar() {
    Persona entidad = Persona();
    entidad.id = 0;
    entidad.clave = "";
    entidad.llave = " ";
    entidad.nombre = "";
    entidad.descripcion = "";
    entidad.idTipoPersona = "";
    entidad.idUsuario = 0;

    entidad.apellidoPaterno = "";
    entidad.apellidoMaterno = "";
    entidad.rfc = "";
    entidad.curp = "";
    entidad.telefono = "";
    entidad.telefonoMovil = "";
    entidad.correo = "";
    entidad.genero = "";
    entidad.direccion = "";

    entidad.rutaFoto = "";
    entidad.urlFoto = "";
    entidad.banco = "";
    entidad.cuentaBanco = "";
    entidad.referencia = "";
    entidad.importe = 0;
    entidad.saldo = 0;
    entidad.idSuscriptor = 0;
    entidad.fecha = "";
    entidad.fechaRegistro = "";
    entidad.fechaNacimiento = "";
    entidad.fechaEntrega = "";
    entidad.fechaEstatus = "";
    entidad.estatus = 1;
    return entidad;
  }

  String toJson() => json.encode(this.toMap());
  Persona fromJson(String cadenaJson) => this.fromMap(json.decode(cadenaJson));

  Map<String, dynamic> fromJsonToMap(String cadenaJson) =>
      json.decode(cadenaJson);

  List<Persona> mapTolist(List<dynamic> listaMapa) {
    List<Persona> lista = listaMapa.isNotEmpty
        ? listaMapa.map((c) => this.fromMap(c)).toList()
        : [];
    return lista;
  }

  List<Persona> jsonToList(String cadenaJson) {
    List<dynamic> listaMap = json.decode(cadenaJson);
    List<Persona> lista = mapTolista(listaMap);
    return lista;
  }
}
