//  librerias internas de flutter

import 'dart:convert';

//  librerias importadas flutter

//  librerias  proyecto

import '../../../../nucleo/negocio/modelo/endidad/EntidadBase.dart';

class ServicioAplicacion extends EntidadBase {
  //    variables
  //    propiedades

  int? idServicio;
  double? costo;
  String? tipo;
  String? plazo;
  String? url;
  String? domimio;
  String? llaveOperacion;
  String? fechaApertura;
  String? fechaVigencia;
  String? cuenta;
  String? contrasena;
  String? fechaEstatus;
  int? estatus;

  ServicioAplicacion({
    id,
    nombre,
    clave,
    llave,
    nombreTabla,
    campoLLave,
    this.idServicio,
    this.costo,
    this.tipo,
    this.plazo,
    this.url,
    this.domimio,
    this.llaveOperacion,
    this.fechaApertura,
    this.fechaVigencia,
    this.cuenta,
    this.contrasena,
    this.fechaEstatus,
    this.estatus,
  }) : super(
          id: id,
          clave: clave,
          llave: llave,
          nombre: nombre,
          nombreTabla: 'ServicioAplicaciones',
          campoLLave: 'id',
        );

  //    métodos

  factory ServicioAplicacion.fromMap(Map<String, dynamic> map) =>
      new ServicioAplicacion(
        id: map["id"],
        llave: map["llave"],
        clave: map["clave"],
        nombre: map["nombre"],
        idServicio: map["idServicio"],
        costo: map["costo"],
        tipo: map["tipo"],
        plazo: map["plazo"],
        url: map["url"],
        domimio: map["domimio"],
        llaveOperacion: map["llaveOperacion"],
        fechaApertura: map["fechaApertura"],
        fechaVigencia: map["fechaVigencia"],
        cuenta: map["cuenta"],
        contrasena: map["contrasena"],
        fechaEstatus: map["fechaEstatus"],
        estatus: int.parse(map["estatus"].toString()),
      );

  ServicioAplicacion fromMap(Map<String, dynamic> map) {
    id = map["id"];
    llave = map["llave"];
    clave = map["clave"];
    nombre = map["nombre"];

    idServicio = map["idServicio"];
    costo = map["costo"];
    tipo = map["tipo"];
    plazo = map["plazo"];
    url = map["url"];

    domimio = map["domimio"];
    llaveOperacion = map["llaveOperacion"];
    fechaApertura = map["fechaApertura"];
    fechaVigencia = map["fechaVigencia"];
    cuenta = map["cuenta"];
    contrasena = map["contrasena"];
    fechaEstatus = map["fechaEstatus"];
    // estatus= int.parse(map["estatus"].toString());

    return this;
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "llave": llave,
        "clave": clave,
        "nombre": nombre,
        "idServicio": idServicio,
        "costo": costo,
        "tipo": tipo,
        "plazo": plazo,
        "url": url,
        "domimio": domimio,
        "llaveOperacion": llaveOperacion,
        "fechaApertura": fechaApertura,
        "fechaVigencia": fechaVigencia,
        "cuenta": cuenta,
        "contrasena": contrasena,
        "fechaEstatus": fechaEstatus,
        "estatus": estatus,
      };

  String sqlTabla() {
    String sql = "CREATE TABLE if not exists  " +
        nombreTabla! +
        " ("
            "id INTEGER PRIMARY KEY ,"
            "llave   TEXT , "
            "clave   TEXT , "
            "nombre   TEXT , "
            "idServicio   INTEGER , "
            "costo   REAL, "
            "tipo   TEXT , "
            "plazo   TEXT , "
            "url   TEXT, "
            "domimio   TEXT , "
            "llaveOperacion   TEXT, "
            "fechaApertura   TEXT , "
            "fechaVigencia   TEXT , "
            "cuenta   TEXT, "
            "contrasena   TEXT, "
            "fechaEstatus   TEXT , "
            "estatus   INTEGER )";
    return sql;
  }

  ServicioAplicacion iniciar() {
    ServicioAplicacion entidad = ServicioAplicacion();
    entidad.id = 0;
    entidad.llave = "";
    entidad.clave = "";
    entidad.nombre = "";

    entidad.idServicio = 0;
    entidad.costo = 0;
    entidad.tipo = "";
    entidad.plazo = "";
    entidad.url = "";

    entidad.domimio = "";
    entidad.llaveOperacion = "";
    entidad.fechaApertura = "";
    entidad.fechaVigencia = "";
    entidad.cuenta = "";
    entidad.contrasena = "";

    entidad.fechaEstatus = DateTime.now().toString();
    entidad.estatus = 1;
    return entidad;
  }

  String toJson() => json.encode(this.toMap());
  ServicioAplicacion fromJson(String cadenaJson) =>
      this.fromMap(json.decode(cadenaJson));

  Map<String, dynamic> fromJsonToMap(String cadenaJson) =>
      json.decode(cadenaJson);

  List<ServicioAplicacion> mapTolista(List<dynamic> listaMapa) {
    List<ServicioAplicacion> lista = listaMapa.isNotEmpty
        ? listaMapa.map((c) => this.fromMap(c)).toList()
        : [];
    return lista;
  }

  List<ServicioAplicacion> jsonToList(String cadenaJson) {
    List<dynamic> listaMap = json.decode(cadenaJson);
    List<ServicioAplicacion> lista = mapTolista(listaMap);
    return lista;
  }
}
