//  librerias internas de flutter

import 'dart:convert';

//  librerias importadas flutter

//  librerias  proyecto

import '../../../../nucleo/negocio/modelo/endidad/EntidadBase.dart';

class Cliente extends EntidadBase {
  //    variables



  //    propiedades


  String? idTipoCliente;
  int? idEstado;
  int? idSuscriptor;
  int? idOperacion;
  int? idUsuario;
  int? idSocio;
  String? apellidoPaterno;
  String? apellidoMaterno;
  String? rfc;
  String? curp;
  String? telefono;
  String? telefonoMovil;
  String? correo;
  String? genero;
  String? direccion;

  String? referencia;
  String? banco;
  String? cuentaBanco;
  int? importe;
  int? saldo;
  String? rutaFoto;
  String? urlFoto;
  String? fechaNacimiento;
  String? fecha;
  String? fechaRegistro;
  String? fechaEntrega;
 
  String? fechaEstatus;
  int? estatus;

  Cliente({
    id,
    nombre,
    clave,
    llave,
    descripcion,
    nombreTabla,
    campoLLave,
    this.idTipoCliente,
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
            nombreTabla: 'Clientes',
            campoLLave: 'id',
            );
  //    métodos


  factory Cliente.fromMap(Map<String, dynamic> map) => new Cliente(
        id: map["id"],
        llave: map["llave"],
        clave: map["clave"],
        nombre: map["nombre"],
        descripcion: map["descripcion"],

        idTipoCliente: map["idTipoCliente"],
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
  Cliente fromMap(Map<String, dynamic> map) {
      id= map["id"];
      llave= map["llave"];
      clave= map["clave"];
      nombre= map["nombre"];
      descripcion= map["descripcion"];

      idTipoCliente= map["idTipoCliente"];
      idUsuario= map["idUsuario"];

      apellidoPaterno= map["apellidoPaterno"];
      apellidoMaterno= map["apellidoMaterno"];
      rfc= map["rfc"];
      curp= map["curp"];
      telefono= map["telefono"];
      telefonoMovil= map["telefonoMovil"];
      correo= map["correo"];
      genero= map["genero"];
      direccion= map["direccion"];

      referencia= map["referencia"];
      banco= map["banco"];
      cuentaBanco= map["cuentaBanco"];
      importe= map["importe"];
      saldo= map["saldo"];
      rutaFoto= map["rutaFoto"];
      urlFoto= map["urlFoto"];
      fechaNacimiento= map["fechaNacimiento"];
      fecha= map["fecha"];
      fechaEntrega= map["fechaEntrega"];      
      fechaRegistro= map["fechaRegistro"];
      idSuscriptor= map["idSuscriptor"];
      fechaEstatus= map["fechaEstatus"];
      //activo= int.parse(map["activo"].toString()),
      estatus= map["estatus"];
      
      return this;

  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "llave": llave,
        "clave": clave,
        "nombre": nombre,
        "descripcion": descripcion,
        "idTipoCliente": idTipoCliente,
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
        nombreTabla! +
        " ("
            "id INTEGER PRIMARY KEY autoincrement ,"
            "llave TEXT , "
            "clave TEXT , "
            "nombre  TEXT , "
            "descripcion TEXT , "
            "idTipoCliente  TEXT , "
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

  Cliente iniciar() {
    Cliente e = Cliente();
    e.nombreTabla='Clientes';
    e.campoLLave='id';

    e.id = 0;
    e.clave = "";
    e.llave = " ";
    e.nombre = "";
    e.descripcion = "";
    e.idTipoCliente = "";
    e.idUsuario = 0;

    e.apellidoPaterno = "";
    e.apellidoMaterno = "";
    e.rfc = "";
    e.curp = "";
    e.telefono = "";
    e.telefonoMovil = "";
    e.correo = "";
    e.genero = "";
    e.direccion = "";

    e.rutaFoto = "";
    e.urlFoto = "";
    e.banco = "";
    e.cuentaBanco = "";
    e.referencia = "";
    e.importe = 0;
    e.saldo = 0;
    e.idSuscriptor = 0;
    e.fecha = "";
    e.fechaRegistro = "";
    e.fechaNacimiento = "";
    e.fechaEntrega = "";
    e.fechaEstatus = "";
    e.estatus = 1;
    return e;
  }



  
  //  metodos conversion  a cadena  json

 
   // conversión de  entidad a  cadena Json  

  String entidadtoJson() => json.encode(this.toMap());

  // conversión de  cadena Json  a entidad 
 
  Cliente fromJsonToEntidad(String cadenaJson)  =>this.fromMap(json.decode(cadenaJson));
  

  // conversión de Json String  a map 
  Map<String, dynamic> fromJsonToMap(String cadenaJson) => json.decode(cadenaJson);
  

  // metodos conversion listas


  // metodos conversion cadena Json a  lista  de 
 
  List<Cliente> jsonToListEntidad(String cadenaJson) {
    List<dynamic> listaMap = json.decode(cadenaJson);
    List<Cliente> lista = mapTolistaEntidad(listaMap);
    return lista;
  }
 // metodos conversion lista map a  lista  de entidades

  List<Cliente> mapTolistaEntidad(List<dynamic> listaMapa) {
    List<Cliente> lista = listaMapa.isNotEmpty
        ? listaMapa.map((c) => this.fromMap(c)).toList()
        : [];
    return lista;
  }

}
