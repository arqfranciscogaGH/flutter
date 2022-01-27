//  librerias internas de flutter

import 'package:flutter/material.dart';

//  librerias importadas flutter

import 'package:http/http.dart' as http;

//  librerias  proyecto


class ServicioRest
{
   static Future<dynamic> get(String url) async
   {
        dynamic respuesta = await http.get(url);
        return respuesta;
   }
   static Future<dynamic> post(String url,String cuerpo) async
   {
        var respuesta = await http.post(url, body:cuerpo, headers: {
              "Accept": "application/json",
              "content-type": "application/json"
            } );
          return respuesta;
   }
   static Future<dynamic> put(String url,String cuerpo) async
   {
        var respuesta = await http.put(url, body:cuerpo , headers: {
              "Accept": "application/json",
              "content-type": "application/json"
            } );
        return respuesta;
   }
   static Future<dynamic> delete(String url,String cuerpo) async
   {
        var respuesta = await http.delete(url , headers: {
              "Accept": "application/json",
              "content-type": "application/json"
            } );
        return respuesta;
   }
   static Future<dynamic> read(String url,String cuerpo) async
   {
        var respuesta = await http.read(url);
        return respuesta;
   }
}


