//  librerias internas de flutter
import 'package:flutter/material.dart';

//  librerias importadas flutter


//  librerias  proyecto

//  librerias externas  flutter


// Descripcion de funcionalidad 
//
//  Sesion
//


class Sesion {
  static int idSuscriptor =0;
  static String suscriptor ="";
  static int idUsuario=0;
  static String nombre="";
  static String cuenta="";
  static String perfiles="";
  static String grupos="";
  static String version = '6.0';
  static void iniciar ()
  {
        Sesion.idSuscriptor = 0;
        Sesion.suscriptor ='';        
        Sesion.nombre ='';
        Sesion.cuenta = '';
        Sesion.idUsuario = 0;

        Sesion.perfiles = '';
        Sesion.grupos = '';
  }
}
