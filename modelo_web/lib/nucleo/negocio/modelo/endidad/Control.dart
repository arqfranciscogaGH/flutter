//  librerias internas de flutter
import 'package:flutter/material.dart';
import 'dart:convert';

//  librerias importadas flutter

//  librerias  proyecto

import 'Entidadbase.dart';
//import '../ui/controles/movil/IdiomaAplicacion.dart';

enum eTipoControl {
  etiqueta,
  cajaTexto,
  cajaTextoForma,
  fechaSelector,
  calendario,
  listaDespegable,
  listaDespegableFija,
  autocomplertar,
  apagador,

  radioVertical,
  radioHorizontal,
  verificadorVertical,
  verificadorHorizontal,
  selectorDeslizante,
  foto,
  videoSimple,
  videoMejorado,
}

enum eTipoBorde {
  ninguno,
  circular,
  rectangular,
  lineal,
}

class Control extends EntidadBase {
  String? idControl;
  TextEditingController? controlEdicion;
  //String tipo;
  eTipoControl? tipo;
  dynamic valor;
  dynamic valorSeleccionado;
  dynamic valorInicial;
  dynamic valorFinial;
  dynamic intervaloValor;
  String? textoEtiqueta;
  String? textoAyuda;
  String? marcaAguaTexto;
  String? textoContador;
  TextCapitalization? textoCapitalizacion;
  TextInputType? tipoEntrada;
  bool? protegerTextoEscrito;
  String? icono;
  String? iconoInterno;
  eTipoBorde? borde;
  String? color;
  String? colorTexto;
  String? colorFondo;
  dynamic colorBorde;
  dynamic colorIcono;
  Function? accionValidacion;
  Function? accionGuardar;
  Function? accion;
  List<dynamic>? lista;
  dynamic argumento;
  int? activo;

  Control(
      {id,
      this.idControl,
      this.tipo,
      this.valor,
      this.textoEtiqueta,
      this.textoAyuda,
      this.marcaAguaTexto,
      this.textoContador,
      this.icono,
      this.iconoInterno,
      this.textoCapitalizacion,
      this.tipoEntrada,
      this.accion,
      this.protegerTextoEscrito,
      this.controlEdicion,
      this.borde,
      this.accionValidacion,
      this.accionGuardar,
      this.argumento,
      this.lista,
      this.color,
      this.colorTexto,
      this.colorFondo,
      this.colorBorde,
      this.colorIcono,
      this.activo})
      : super(id: id, tabla: "Control");

  factory Control.fromMap(Map<String, dynamic> map) =>  Control(
        idControl: map["idControl"],
        tipo: map["tipo"],
        valor: map["valor"],
        textoEtiqueta: map["textoEtiqueta"],
        activo: int.parse(map["activo"].toString()),
      );
  Control fromMap(Map<String, dynamic> map) =>  Control(
        idControl: map["idControl"],
        tipo: map["tipo"],
        valor: map["valor"],
        textoEtiqueta: map["textoEtiqueta"],
        activo: int.parse(map["activo"].toString()),
      );
  Map<String, dynamic> toMap() => {
        "idControl": idControl,
        "tipo": tipo,
        "valor": valor,
        "textoEtiqueta": textoEtiqueta,
        "activo": activo,
      };

  String toJson() => json.encode(this.toMap());
  Control fromJson(String cadenaJson) => this.fromMap(json.decode(cadenaJson));

  Map<String, dynamic> fromJsonToMap(String cadenaJson) =>
      json.decode(cadenaJson);

  List<Control> mapTolist(List<dynamic> listaMapa) {
    List<Control> lista = listaMapa.isNotEmpty
        ? listaMapa.map((c) => this.fromMap(c)).toList()
        : [];
    return lista;
  }
  

  List<Control> jsonToList(String cadenaJson) {
    List<dynamic> listaMap = json.decode(cadenaJson);
    List<Control> lista = mapTolist(listaMap);
    return lista;
  }

  // List<Map<String, dynamic>> toMapList(List<dynamic> lista) {
  //   return lista.map((c) => c.toMap()).toList();
  // }


  String sqlTabla() {
     String sql ="CREATE TABLE if not exists ";
    sql+=super.tabla;
    sql+=" ("
          "id INTEGER PRIMARY KEY autoincrement ,"
          "clave TEXT , "
          "nombre  TEXT , "
          "direccion  TEXT , "
          "telefono  TEXT , "
          "correo TEXT , "
          "rutaFoto TEXT , "
          "rutaFotoFinal TEXT , "
          "referencia TEXT , "
          "banco TEXT , "
          "cuenta TEXT , "
          "importe INTEGER , "
          "saldo INTEGER , "
          "fechaEntrega TEXT , "
          "sicron INTEGER , "
          "accionSincron TEXT , "
          "fechaSincron TEXT , "
          "activo INTEGER )";
    return sql;
  }

  Control inicilizar() {
    Control entidad = Control();

    return entidad;
  }

  Control crear(dynamic idioma, String pagina, String idControl, dynamic valor,
      Function metooCambiarValor, Function metodoValidar) {
    this.idControl = idControl;
    this.valor = valor;
    return asignar(idioma, pagina, valor, metooCambiarValor, metodoValidar);
  }

  Control asignar(dynamic idioma, String pagina, dynamic valor,
      Function metooCambiarValor, Function metodoValidar) {
    dynamic valorControl;
    this.valor = valor;
    Control control = this;
    try {
      control = definirBorde(idioma.obtenerElemento(pagina, "borde"), control);
      control = definircolorBorde(
          idioma.obtenerElemento(pagina, "colorBorde"), control);
      control = definirtextoContador(
          idioma.obtenerElemento(pagina, "textoContador"), control);

      valorControl = idioma.obtenerElemento(pagina, control.idControl);
      if (valorControl != null) {
        control = definirTipo(
            idioma.obtenerAtrbutoElemento(valorControl, "tipo"), control);
        control.textoEtiqueta =
            idioma.obtenerAtrbutoElemento(valorControl, "textoEtiqueta");
        control.textoAyuda =
            idioma.obtenerAtrbutoElemento(valorControl, "textoAyuda");
        control.marcaAguaTexto =
            idioma.obtenerAtrbutoElemento(valorControl, "marcaAguaTexto");
        control.icono = idioma.obtenerAtrbutoElemento(valorControl, "icono");
        control.iconoInterno =
            idioma.obtenerAtrbutoElemento(valorControl, "iconoInterno");

        control = definirTipoEntrada(
            idioma.obtenerAtrbutoElemento(valorControl, "tipoEntrada"),
            control);
        control = definirTextoCapitalizacion(
            idioma.obtenerAtrbutoElemento(valorControl, "textoCapitalizacion"),
            control);
        control = definirProtegerTextoEscrito(
            idioma.obtenerAtrbutoElemento(valorControl, "protegerTextoEscrito"),
            control);

        control.accion = metooCambiarValor;
        control.accionValidacion = metodoValidar;
      }
      return control;
    } catch (error) {
      control.textoEtiqueta = idioma.validarEtiqueta(control.idControl);
      return control;
    }
  }

  Control definirTipo(String tipo, Control control) {
    if (tipo == "CajaTextoForma")
      control.tipo = eTipoControl.cajaTextoForma;
    else if (tipo == "Etiqueta")
      control.tipo = eTipoControl.etiqueta;
    else if (tipo == "CajaTexto")
      control.tipo = eTipoControl.cajaTexto;
    else if (tipo.contains("FechaSelector"))
      control.tipo = eTipoControl.fechaSelector;
    else if (tipo.contains("Calendario"))
      control.tipo = eTipoControl.calendario;
    else if (tipo.contains("ListaDespegableFija"))
      control.tipo = eTipoControl.listaDespegableFija;
    else if (tipo.contains("ListaDespegable"))
      control.tipo = eTipoControl.listaDespegable;
    else if (tipo.contains("Autocomplertar"))
      control.tipo = eTipoControl.autocomplertar;
    else if (tipo.contains("Apagador"))
      control.tipo = eTipoControl.apagador;
    else if (tipo.contains("Foto"))
      control.tipo = eTipoControl.foto;
    else if (tipo.contains("SelectorDeslizante"))
      control.tipo = eTipoControl.selectorDeslizante;
    else if (tipo.contains("RadioHorizontal"))
      control.tipo = eTipoControl.radioHorizontal;
    else if (tipo.contains("RadioVertical"))
      control.tipo = eTipoControl.radioVertical;
    else if (tipo.contains("VerificadorHorizontal"))
      control.tipo = eTipoControl.verificadorHorizontal;
    else if (tipo.contains("VerificadorVertical"))
      control.tipo = eTipoControl.verificadorVertical;
    else if (tipo.contains("VideoSimple"))
      control.tipo = eTipoControl.videoSimple;
    else if (tipo.contains("VideoMejorado"))
      control.tipo = eTipoControl.videoMejorado;

    return control;
  }

  Control definirBorde(String borde, Control control) {
    if (borde.contains("Ninguno"))
      control.borde = eTipoBorde.ninguno;
    else if (borde.contains("Rectangular"))
      control.borde = eTipoBorde.rectangular;
    else if (borde.contains("Circular"))
      control.borde = eTipoBorde.circular;
    else if (borde.contains("Lineal")) control.borde = eTipoBorde.lineal;

    return control;
  }

  Control definirTipoEntrada(String atributo, Control control) {
    if (atributo.contains("text"))
      control.tipoEntrada = TextInputType.text;
    else if (atributo.contains("number"))
      control.tipoEntrada = TextInputType.number;
    else if (atributo.contains("datetime"))
      control.tipoEntrada = TextInputType.datetime;
    else if (atributo.contains("emailAddress"))
      control.tipoEntrada = TextInputType.emailAddress;
    else if (atributo.contains("url"))
      control.tipoEntrada = TextInputType.url;
    else if (atributo.contains("phone"))
      control.tipoEntrada = TextInputType.phone;
    else if (atributo.contains("multiline"))
      control.tipoEntrada = TextInputType.multiline;
    return control;
  }

  Control definirTextoCapitalizacion(String atributo, Control control) {
    if (atributo.contains("words"))
      control.textoCapitalizacion = TextCapitalization.words;
    else if (atributo.contains("characters"))
      control.textoCapitalizacion = TextCapitalization.characters;
    else if (atributo.contains("sentences"))
      control.textoCapitalizacion = TextCapitalization.sentences;
    else if (atributo.contains("none"))
      control.textoCapitalizacion = TextCapitalization.none;

    return control;
  }

  Control definirProtegerTextoEscrito(dynamic atributo, Control control) {
    if (atributo == null || atributo == "")
      control.protegerTextoEscrito = false;
    else
      control.protegerTextoEscrito = atributo;

    return control;
  }

  Control definircolorBorde(String atributo, Control control) {
    if (atributo == null || atributo == "")
      control.textoContador = null;
    else
      control.colorBorde = atributo;

    return control;
  }

  Control definirtextoContador(String atributo, Control control) {
    if (atributo == null || atributo == "") control.textoContador = null;
    return control;
  }

/* 

    control= definircolorBorde(idioma.obtenerEtiqueta(pagina,"colorBorde"),control);
             control= definirtextoContador(idioma.obtenerEtiqueta(pagina,"textoContador"),control);


                 tipoEntrada:   TextInputType.number,              
              textoCapitalizacion:  TextCapitalization.words,
              textoContador : null ,
              protegerTextoEscrito:false,    
              
              */

}
