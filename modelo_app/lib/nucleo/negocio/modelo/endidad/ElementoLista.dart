//  librerias internas de flutter
import 'package:flutter/material.dart';

import 'dart:convert';

//  librerias  proyecto

import 'EntidadBase.dart';

enum eOperacion {
  agregar,
  modificar,
  eliminar,
  guardar,
  consultar,
  filtrar,
}
enum eAnimacionPagina {
  slideRightRoute,
  scaleRoute,
  rotationRoute,
  sizeRoute,
  fadeRoute,
  scaleRotateRoute,
  enterExitRoute,
}
eAnimacionPagina convertirAninacionPagina(String animacionPagina)
{
   eAnimacionPagina ranimacionPagina=eAnimacionPagina.rotationRoute;
   switch (animacionPagina) {
        case 'slideRightRoute':
          ranimacionPagina=eAnimacionPagina.rotationRoute;
          break;
        case 'scaleRoute':
          ranimacionPagina=eAnimacionPagina.scaleRoute;
          break;
        case 'rotationRoute':
          ranimacionPagina=eAnimacionPagina.rotationRoute;
          break;
        case 'sizeRoute':
          ranimacionPagina=eAnimacionPagina.sizeRoute;
          break;
        case 'fadeRoute':
           ranimacionPagina=eAnimacionPagina.fadeRoute;
          break;
        case 'scaleRotateRoute':
            ranimacionPagina=eAnimacionPagina.scaleRotateRoute;
          break;
        case 'enterExitRoute':
            ranimacionPagina=eAnimacionPagina.enterExitRoute;
          break;
        default:
            ranimacionPagina=eAnimacionPagina.rotationRoute;
          break;
   }
   return ranimacionPagina;
}
class ElementoLista extends EntidadBase {
  eOperacion? operacion;
  eAnimacionPagina? animacionPagina;
  dynamic valor;
  String? titulo;
  String? subtitulo;
  String? nota;
  String? descripcion;
  String? iconoLateral;
  bool? seleccionado = false;
  String? icono;
  Function? accion;
  String? ruta="";
  Function? callBackAccion;
  Widget? pagina;

  String? icono2;
  Function? accion2;
  String? ruta2;
  Function? callBackAccion2;
  Widget? pagina2;

  String? icono3;
  Function? accion3;
  String? ruta3;
  Function? callBackAccion3;
  Widget? pagina3;

  String? color;
  dynamic colorTexto;
  dynamic colorFondo;
  dynamic colorIcono;
  String? colorBorde;


  double? tamanoFuente=20;
  double? tamanoIcono=20;
  
  dynamic argumento;
  int? activo;

  ElementoLista(
      {id,
      nombre,
      clave,
      llave,
      nombreTabla,
      campoLLave,
      this.titulo,
      this.operacion,
      this.subtitulo,
      this.nota,
      this.valor,
      this.descripcion,
      this.iconoLateral,
      this.color,
      this.colorIcono,
      this.colorTexto,
      this.colorFondo,
      this.colorBorde,
      this.tamanoFuente,
      this.tamanoIcono,
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
      this.activo
      }) : super(
            id: id,
            nombre: nombre,
            clave: clave,
            llave: llave,
            descripcion: descripcion,
            // nombreTabla: nombreTabla!,
            // campoLLave: campoLLave!,
            );

  factory ElementoLista.fromMap(Map<String, dynamic> map) =>  ElementoLista(
        valor: map["valor"],
        titulo: map["titulo"],
        subtitulo: map["subtitulo"],
        nota: map["nota"],    
        descripcion: map["descripcion"],
        icono: map["icono"],
        iconoLateral: map["iconoLateral"],
        color: map["color"],
        seleccionado: map["seleccionado"],
        tamanoFuente: double.parse(map["tamanoFuente"].toString()),
        tamanoIcono: double.parse(map["tamanoIcono"].toString()),
        ruta: map["ruta"],
        accion: map["accion"],
        activo: int.parse(map["activo"].toString()),
      );
  ElementoLista fromMap(Map<String, dynamic> map) =>  ElementoLista(
        valor: map["valor"],
        titulo: map["titulo"],
        subtitulo: map["subtitulo"],
        nota: map["nota"],        
        descripcion: map["descripcion"],
        icono: map["icono"],
        iconoLateral: map["iconoLateral"],
        color: map["color"],
        seleccionado: map["seleccionado"],
        tamanoFuente: double.parse(map["tamanoFuente"].toString()),
        tamanoIcono: double.parse(map["tamanoIcono"].toString()),
        ruta: map["ruta"],
        accion: map["accion"],
        activo: int.parse(map["activo"].toString()),
      );
  Map<String, dynamic> toMap() => {
        "valor": valor,
        "titulo": titulo,
        "subtitulo": subtitulo,
        "nota": nota,     
        "descripcion": descripcion,
        "icono": icono,
        "iconoLateral": iconoLateral,
        "seleccionado": seleccionado,
        "tamanoFuente": tamanoFuente,
        "tamanoIcono": tamanoIcono,      
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
    List<ElementoLista> lista = mapTolist(listaMap);
    return lista;
  }

  String sqlTabla() {
   String sql ="CREATE TABLE if not exists ";
    sql+=super.nombreTabla!;
    sql+=" ("
        "id INTEGER PRIMARY KEY autoincrement ,"
        "valor TEXT , "
        "titulo  TEXT , "
        "subitulo  TEXT , "
        "descripcion  TEXT , "
        "icono TEXT , "
        "iconoLateral TEXT , "
        "seleccionado INTEGER , "
        "tamano REAL , "
        "ruta TEXT , "
        "accion TEXT , "
        "activo INTEGER )";
    return sql;
  }
}
