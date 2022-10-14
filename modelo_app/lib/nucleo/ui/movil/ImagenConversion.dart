//  librerias internas de flutter

/* 
import 'package:flutter/material.dart';
import 'dart:io';

//  librerias importadas flutter

import 'package:http/http.dart' as http;
import 'package:image_picker_saver/image_picker_saver.dart' as saver;
//  librerias  proyecto

class ImagenConversion
{ 

    static Future<String> convertirImagenUrlaRuta(String ruta, [bool guardar] ) async
    {
      String   filePath="";
      var respuesta = await http.get(ruta);
      print(respuesta.statusCode.toString());

      if (respuesta.statusCode==200)
         filePath = await saver.ImagePickerSaver.saveFile(fileData:respuesta.bodyBytes);
      print(filePath);
      if ( guardar!=null  && guardar & (filePath!=""))
      {
        File savedFile= File.fromUri(Uri.file(filePath));
        var _imageFile = Future<File>.sync(() => savedFile);
      }
      return filePath;
    }
  }
 */