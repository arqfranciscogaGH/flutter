//  librerias internas de flutter

import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'dart:io';

/* import 'package:documents_picker/documents_picker.dart';

import 'package:path_provider/path_provider.dart';
import 'package:screenshots/screenshots.dart'; */
import 'package:flutter/services.dart' show rootBundle;

//  librerias importadas flutter

//import 'package:share/share.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:share/share.dart' as SimpleShare;

//  librerias  proyecto

class Compartir {
  static void texto({String titulo, String texto, String formato}) {
    SimpleShare.Share.share(texto, subject: titulo);
  }

  static void url(
      {String titulo,
      String texto,
      String nombre,
      String formato,
      String url}) async {
    if (url == null || url == "")
      url =
          "https://shop.esys.eu/media/image/6f/8f/af/amlog_transport-berwachung.jpg";
    if (formato == null || formato == "") formato = "image/jpg";

    var request = await HttpClient().getUrl(Uri.parse(url));
    var response = await request.close();
    Uint8List bytes = await consolidateHttpClientResponseBytes(response);
    await Share.file(titulo, nombre, bytes, formato);
  }

  static void urlImagen(
      {String titulo,
      String texto,
      String nombre,
      String formato,
      String urlFoto}) async {
    print(urlFoto);
    print(nombre);
    print(formato);
    if (formato == null || formato == "") formato = "*/*";
    var request = await HttpClient().getUrl(Uri.parse(urlFoto));
    var response = await request.close();
    Uint8List bytes = await consolidateHttpClientResponseBytes(response);
    await Share.file(titulo, nombre, bytes.buffer.asUint8List(), formato,
        text: texto);
  }

  static void imagen(
      {String titulo,
      String texto,
      String nombre,
      String formato,
      String ruta}) async {
    print(ruta);
    print(nombre);
    print(formato);
    if (formato == null || formato == "") formato = "*/*";
    //final ByteData bytes = await rootBundle.load(ruta);
    // 'image/png'  'image/jpg'
    Uint8List bytes = await new File(ruta).readAsBytes();
    // await Share.file(titulo, nombre+formato, bytes.buffer.asUint8List(), '*/*', text: texto );

    await Share.file(titulo, nombre, bytes.buffer.asUint8List(), formato,
        text: texto);
  }

  static void documento(
      {String titulo,
      String texto,
      String nombre,
      String formato,
      String ruta}) async {
    final ByteData bytes = await rootBundle.load(ruta);
    await Share.file(
        titulo, nombre + "." + formato, bytes.buffer.asUint8List(), '*/*',
        text: texto);
  }

  static void varios(
      {String titulo,
      String texto,
      String formato,
      List<Archivo> archivos}) async {
    if (formato == null || formato == "") formato = "*/*";
    List<String> nombres = List<String>();
    List<Uint8List> listaBytes = List<Uint8List>();
    for (Archivo elemento in archivos) {
      dynamic bytes;
      if (elemento.ruta.contains('assets'))
        bytes = await rootBundle.load(elemento.ruta);
      else if (elemento.ruta != null && elemento.ruta != "")
        bytes = await new File(elemento.ruta).readAsBytes();
      nombres.add(elemento.nombre);
      listaBytes.add(bytes.buffer.asUint8List());
    }
    Map<String, List<int>> archivosMap = Map.fromIterables(nombres, listaBytes);
    await Share.files(titulo, archivosMap, formato, text: texto);
  }

  static void archivos(String titulo, String texto, String nombre,
      String formato, String rutas) async {
    if (formato == null || formato == "") formato = "*/*";
    Map<String, List<int>> archivos = Map<String, List<int>>();

    final ByteData bytes = await rootBundle.load('assets/iconos.json');
    final ByteData bytes2 = await rootBundle.load('assets/no-image.png');
    await Share.files(
        titulo,
        {
          'nombre.png': bytes.buffer.asUint8List(),
          'nombre2.png': bytes2.buffer.asUint8List(),
        },
        formato,
        text: texto);
  }
}

class Archivo {
  String nombre;
  // String formato; //jpg ,png, txt,word,excel
  String tipo; // url , local,
  String ruta;
  Archivo({
    this.nombre,
    this.tipo,
    this.ruta,
  });
}
