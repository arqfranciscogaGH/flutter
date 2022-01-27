//  librerias internas de flutter
import 'package:flutter/material.dart';

import 'dart:convert';

//  librerias importadas flutter

//  librerias  proyecto

import '../../negocio/modelo/ModeloBase.dart';

enum eOperacion {
  Agregar,
  Modificar,
  Eliminar,
  Guardar,
  Consultar,
  Filtrar,
}
enum eAnimacionPagina {
  SlideRightRoute,
  ScaleRoute,
  RotationRoute,
  SizeRoute,
  FadeRoute,
  ScaleRotateRoute,
  EnterExitRoute,
}

class ElementoLista extends EntidadBase {
  eOperacion operacion;
  eAnimacionPagina animacionPagina;
  dynamic valor;
  String titulo;
  String subitulo;
  String nota;
  String descripcion;
  String iconoLateral;
  bool seleccionado = false;
  String icono;
  Function accion;
  String ruta;
  Function callBackAccion;
  Widget pagina;

  String icono2;
  Function accion2;
  String ruta2;
  Function callBackAccion2;
  Widget pagina2;

  String icono3;
  Function accion3;
  String ruta3;
  Function callBackAccion3;
  Widget pagina3;

  Color color;
  Color colorTexto;
  Color colorFondo;
  double size;

  dynamic argumento;
  int activo;
  ElementoLista(
      {id,
      nombre,
      clave,
      llave,
      this.titulo,
      this.operacion,
      this.subitulo,
      this.nota,
      this.valor,
      this.descripcion,
      this.iconoLateral,
      this.color,
      this.size,
      this.seleccionado,
      this.argumento,
      this.icono,
      this.icono2,
      this.icono3,
      this.ruta,
      this.ruta2,
      this.ruta3,
      this.accion,
      this.accion2,
      this.accion3,
      this.callBackAccion,
      this.callBackAccion2,
      this.callBackAccion3,
      this.pagina,
      this.pagina2,
      this.pagina3,
      this.activo})
      : super(
            id: id,
            nombre: nombre,
            clave: clave,
            llave: llave,
            tabla: "ElementoLista");

  factory ElementoLista.fromMap(Map<String, dynamic> map) => new ElementoLista(
        valor: map["valor"],
        titulo: map["titulo"],
        subitulo: map["subitulo"],
        nota: map["nota"],    
        descripcion: map["descripcion"],
        icono: map["icono"],
        iconoLateral: map["iconoLateral"],
        color: map["color"],
        seleccionado: map["seleccionado"],
        //size: double.parse(map["size"].toString()),
        ruta: map["ruta"],
        accion: map["accion"],
        activo: int.parse(map["activo"].toString()),
      );
  ElementoLista fromMap(Map<String, dynamic> map) => new ElementoLista(
        valor: map["valor"],
        titulo: map["titulo"],
        subitulo: map["subitulo"],
        nota: map["nota"],        
        descripcion: map["descripcion"],
        icono: map["icono"],
        iconoLateral: map["iconoLateral"],
        color: map["color"],
        seleccionado: map["seleccionado"],
        //size: double.parse(map["size"].toString()),
        ruta: map["ruta"],
        accion: map["accion"],
        activo: int.parse(map["activo"].toString()),
      );
  Map<String, dynamic> toMap() => {
        "valor": valor,
        "titulo": titulo,
        "subitulo": subitulo,
        "nota": nota,     
        "descripcion": descripcion,
        "icono": icono,
        "iconoLateral": iconoLateral,
        "seleccionado": seleccionado,
        "size": size,
        "ruta": ruta,
        "accion": accion,
        "activo": activo,
      };

  String toJson() => json.encode(this.toMap());
  ElementoLista fromJson(String cadenaJson) =>
      this.fromMap(json.decode(cadenaJson));

  Map<String, dynamic> fromJsonToMap(String cadenaJson) =>
      json.decode(cadenaJson);

  List<ElementoLista> mapTolist(List<dynamic> listaMapa) {
    List<ElementoLista> lista = listaMapa.isNotEmpty
        ? listaMapa.map((c) => this.fromMap(c)).toList()
        : [];
    return lista;
  }

  List<ElementoLista> jsonToList(String cadenaJson) {
    List<dynamic> listaMap = json.decode(cadenaJson);
    List<ElementoLista> lista = mapTolista(listaMap);
    return lista;
  }

  String sqlTabla() {
    String sql = "CREATE TABLE if not exists " +
        tabla +
        " ("
            "id INTEGER PRIMARY KEY autoincrement ,"
            "valor TEXT , "
            "titulo  TEXT , "
            "subitulo  TEXT , "
            "descripcion  TEXT , "
            "icono TEXT , "
            "iconoLateral TEXT , "
            "seleccionado INTEGER , "
            "size REAL , "
            "ruta TEXT , "
            "accion TEXT , "
            "activo INTEGER )";
    return sql;
  }
}
