import 'package:flutter/material.dart';
import 'dart:typed_data';

import 'package:signature/signature.dart';

import 'package:image_gallery_saver/image_gallery_saver.dart';
// import 'package:permission_handler/permission_handler.dart';

class Firma {
  var _signature;
  SignatureController? _controller;

  SignatureController crearContralador({
    required double penStrokeWidth,
    required Color penColor,
    required Color exportBackgroundColor,
  }) {
    _controller = SignatureController(
      penStrokeWidth: 5,
      penColor: Colors.red,
      exportBackgroundColor: Colors.blue,
    );
    return _controller!;
  }

  Signature crearSignature(
      {required SignatureController controller,
      required double width,
      required double height,
      required Color backgroundColor}) {
    _signature = Signature(
      controller: controller,
      width: width,
      height: height,
      backgroundColor: backgroundColor,
    );

    return _signature!;
  }

  SignatureController get obetenerControlador {
    return _controller!;
  }

  Signature get obetenerSignature {
    return _signature!;
  }

  guardar(String nombre, Uint8List bytesImage) async {
    // final estatus = await Permission.storage.status;
    // if (estatus.isGranted) await Permission.storage.request();
    var resultado = await ImageGallerySaver.saveImage(bytesImage, name: nombre);
    print(resultado);
  }
}
