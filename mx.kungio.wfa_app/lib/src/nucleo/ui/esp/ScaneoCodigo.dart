//  librerias internas de flutter


import 'package:flutter/material.dart';


//  librerias importadas flutter
//import 'package:qrcode_reader/qrcode_reader.dart';

import 'package:barcode_scan/barcode_scan.dart';
//  librerias  proyecto

class ScaneoCodigo
{

  static Future<String>  leer(BuildContext context) async {
      String respuestaScaneo;
      try {
           respuestaScaneo = await BarcodeScanner.scan();
           print(respuestaScaneo);
      }
      catch(e)
      {
          if (e.code=="ALREADY_ACTIVE" )
              respuestaScaneo = e.code;
      }
      return respuestaScaneo;
  }

/*     static Future<String>  leer(BuildContext context) async {

        // respuestaScaneo="https://fernando-herrera.com"
        // respuestaScaneo="geo:40.724233047051705,-74.00731459101564"

        String respuestaScaneo;

        try {
            respuestaScaneo = await new QRCodeReader()
                .setAutoFocusIntervalInMs(200)
                .setForceAutoFocus(true)
                .setTorchEnabled(true)
                .setHandlePermissions(true)
                .setExecuteAfterPermissionGranted(true)
                .scan();
            print  (respuestaScaneo);

        } catch(e) {
          String cadena = e.code;
           if (e.code=="ALREADY_ACTIVE" )
             respuestaScaneo = cadena;
        }
        return  respuestaScaneo;
    } */

}