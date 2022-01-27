//  librerias internas de flutter

import 'dart:convert';

//  librerias importadas flutter

//  librerias  proyecto

import '../../../nucleo/negocio/modelo/ModeloBase.dart';

class Directorio extends EntidadBase {
  //    variables
  //    propiedades

  String fecha;
  String tipo;

  String direccion;
  String telefono;
  String correo;

  int idCategoria;
  int idSubCategoria;
  int idgiro;

  String latitud;
  String longitud;
  String geometria;
  String rutaFoto;
  String urlFoto;
  String urlVideo;
  String paginaWeb;
  String facebook;
  String youTube;
  String otraRedSocial;

  int idSuscriptor;
  String fechaEstatus;
  int estatus;

  Directorio({
    id,
    nombre,
    clave,
    llave,
    descripcion,
    this.fecha,
    this.tipo,
    this.direccion,
    this.telefono,
    this.correo,
    this.idCategoria,
    this.idSubCategoria,
    this.idgiro,
    this.latitud,
    this.longitud,
    this.geometria,
    this.rutaFoto,
    this.urlFoto,
    this.urlVideo,
    this.paginaWeb,
    this.facebook,
    this.youTube,
    this.otraRedSocial,
    this.idSuscriptor,
    this.fechaEstatus,
    this.estatus,
  }) : super(
            id: id,
            clave: clave,
            llave: llave,
            nombre: nombre,
            descripcion: descripcion,
            tabla: "Directorio");
  //    métodos

  factory Directorio.fromMap(Map<String, dynamic> map) => new Directorio(
        id: map["id"],
        llave: map["llave"],
        clave: map["clave"],
        nombre: map["nombre"],
        fecha: map["fecha"],
        tipo: map["tipo"],
        descripcion: map["descripcion"],
        direccion: map["direccion"],
        telefono: map["telefono"],
        correo: map["correo"],
        idCategoria: map["idCategoria"],
        idSubCategoria: map["idSubCategoria"],
        idgiro: map["idgiro"],
        latitud: map["latitud"],
        longitud: map["longitud"],
        //geometria      : map["geometria"],
        rutaFoto: map["rutaFoto"],
        urlFoto: map["urlFoto"],
        otraRedSocial: map["otraRedSocial"],
        urlVideo: map["urlVideo"],
        paginaWeb: map["paginaWeb"],
        facebook: map["facebook"],
        youTube: map["youTube"],

        idSuscriptor: map["idSuscriptor"],
        fechaEstatus: map["fechaEstatus"],
        estatus: int.parse(map["estatus"].toString()),
      );

  Directorio fromMap(Map<String, dynamic> map) => new Directorio(
        id: map["id"],
        llave: map["llave"],
        clave: map["clave"],
        nombre: map["nombre"],
        fecha: map["fecha"],
        tipo: map["tipo"],
        descripcion: map["descripcion"],
        direccion: map["direccion"],
        telefono: map["telefono"],
        correo: map["correo"],
        idCategoria: map["idCategoria"],
        idSubCategoria: map["idSubCategoria"],
        idgiro: map["idgiro"],
        latitud: map["latitud"],
        longitud: map["longitud"],
        // geometria      : map["geometria"],
        rutaFoto: map["rutaFoto"],
        urlFoto: map["urlFoto"],
        otraRedSocial: map["otraRedSocial"],
        urlVideo: map["urlVideo"],
        paginaWeb: map["paginaWeb"],
        facebook: map["facebook"],
        youTube: map["youTube"],

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
        "tipo": tipo,

        "descripcion": descripcion,
        "direccion": direccion,
        "telefono": telefono,
        "correo": correo,
        "idCategoria": idCategoria,
        "idSubCategoria": idSubCategoria,
        "idgiro": idgiro,
        "latitud": latitud,
        "longitud": longitud,
        // "geometria"      : geometria,
        "rutaFoto": rutaFoto,
        "urlFoto": urlFoto,
        "otraRedSocial": otraRedSocial,
        "urlVideo": urlVideo,
        "paginaWeb": paginaWeb,
        "facebook": facebook,
        "youTube": youTube,

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
            "tipo    TEXT , "
            "descripcion   TEXT, "
            "direccion   TEXT, "
            "telefono   TEXT, "
            "correo   TEXT, "
            "idCategoria   INTEGER, "
            "idSubCategoria   INTEGER, "
            "idgiro   INTEGER, "
            "latitud   TEXT , "
            "longitud   TEXT , "
            "geometria   TEXT , "
            "rutaFoto   TEXT , "
            "otraRedSocial   TEXT , "
            "urlFoto   TEXT , "
            "urlvideo   TEXT , "
            "paginaWeb   TEXT , "
            "facebook   TEXT , "
            "youTube   TEXT , "
            "otraRedSocial   TEXT , "
            "idSuscriptor   INTEGER, "
            "fechaEstatus   TEXT , "
            "estatus   INTEGER )";
    return sql;
  }

  Directorio iniciar() {
    Directorio entidad = Directorio();
    entidad.id = 0;
    entidad.llave = "";
    entidad.clave = "";
    entidad.nombre = "";
    entidad.fecha = "";
    entidad.tipo = "";
    entidad.descripcion = "";
    entidad.direccion = "";
    entidad.telefono = "";
    entidad.correo = "";
    entidad.idCategoria = 0;
    entidad.idSubCategoria = 0;
    entidad.idgiro = 0;
    entidad.latitud = "";
    entidad.longitud = "";
    entidad.geometria = "";
    entidad.rutaFoto = "";
    entidad.urlFoto = "";
    entidad.urlVideo = "";
    entidad.paginaWeb = "";
    entidad.facebook = "";
    entidad.youTube = "";
    entidad.otraRedSocial = "";

    entidad.idSuscriptor = 0;
    entidad.fecha = DateTime.now().toString();
    entidad.estatus = 0;
    return entidad;
  }

  String toJson() => json.encode(this.toMap());
  Directorio fromJson(String cadenaJson) =>
      this.fromMap(json.decode(cadenaJson));

  Map<String, dynamic> fromJsonToMap(String cadenaJson) =>
      json.decode(cadenaJson);

  List<Directorio> mapTolista(List<dynamic> listaMapa) {
    List<Directorio> lista = listaMapa.isNotEmpty
        ? listaMapa.map((c) => this.fromMap(c)).toList()
        : [];
    return lista;
  }

  List<Directorio> jsonToList(String cadenaJson) {
    List<dynamic> listaMap = json.decode(cadenaJson);
    List<Directorio> lista = mapTolista(listaMap);
    return lista;
  }
}
