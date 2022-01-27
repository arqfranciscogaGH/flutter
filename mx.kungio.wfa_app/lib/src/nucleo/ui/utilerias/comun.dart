//  librerias internas de flutter

import 'package:flutter/material.dart';

//  librerias importadas flutter
import 'package:url_launcher/url_launcher.dart';

//  librerias  proyecto

bool isNumero(String s) {
  if (s.isEmpty) return false;
  final n = num.tryParse(s);
  return (n == null) ? false : true;
}

/* ejecutar (BuildContext context, Scaneo scaneo ) async {
  
    if ( scaneo.tipo == 'url' ) {

      if (await canLaunch( scaneo.valor )) {
          await launch(scaneo.valor);
      } else {
        throw 'Could not launch ${ scaneo.valor }';
      }
    }
    else  if ( scaneo.tipo == 'geo' ) {
      Navigator.pushNamed(context, 'MAPA', arguments: scaneo);
  }
} */
