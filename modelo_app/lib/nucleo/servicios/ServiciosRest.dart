//  librerias internas de flutter

import 'package:flutter/material.dart';

//  librerias importadas flutter


import 'package:http/http.dart' as http;

//  librerias  proyecto


class ServicioRest
{
   static Future<dynamic> get(Uri uri) async
   {
        dynamic respuesta = await http.get(uri);
        return respuesta;
   }
   static Future<dynamic> post(Uri uri,String cuerpo) async
   {
        var respuesta = await http.post(uri, body:cuerpo, headers: {
              "Accept": "application/json",
              "content-type": "application/json"
            } );
        return respuesta;
   }
   static Future<dynamic> put(Uri uri,String cuerpo) async
   {
        var respuesta = await http.put(uri, body:cuerpo , headers: {
              "Accept": "application/json",
              "content-type": "application/json"
            } );
        return respuesta;
   }
   static Future<dynamic> delete(Uri uri,String cuerpo) async
   {
        var respuesta = await http.delete(uri , headers: {
              "Accept": "application/json",
              "content-type": "application/json"
            } );
        return respuesta;
   }
   static Future<dynamic> read(Uri uri,String cuerpo) async
   {
        var respuesta = await http.read(uri);
        return respuesta;
   }
}



