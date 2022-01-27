//  librerias internas de flutter

import 'dart:io';

//  librerias importadas flutter

// import 'package:firebase_storage/firebase_storage.dart';
//import 'package:firebase_auth/firebase_auth.dart';

//  librerias  proyecto

class AccesoFireBaseStorage {
/*   static Future<String> cargarImagen(
      String carpeta, String nombre, File archivo) async {
    String url;
    if (nombre == null) nombre = DateTime.now().toString();
    StorageReference sr = FirebaseStorage.instance.ref().child(carpeta);
    StorageUploadTask su = sr.child(nombre).putFile(archivo);
    url = await (await su.onComplete).ref.getDownloadURL();
    return url;
  }

  static Future<String> cargarVideo(
      String carpeta, String nombre, File archivo) async {
    String url;
    if (nombre == null) nombre = DateTime.now().toString();
    // FirebaseAuth fa = FirebaseAuth.instance;
    // // fa.signInAnonymously().then((value) async
    // // {
    StorageReference sr = FirebaseStorage.instance.ref().child(carpeta);
    StorageUploadTask su = sr
        .child(nombre)
        .putFile(archivo, StorageMetadata(contentType: 'video/mp4'));
    url = await (await su.onComplete).ref.getDownloadURL();
    return url;
    // });
  }

  static Future<String> eliminarImagen(String carpeta, String url) async {
    FirebaseStorage.instance
        .ref()
        .child(url)
        .delete()
        .then((_) => print('Successfully deleted $url storage item'));

    final StorageReference firebaseStorageRef =
        FirebaseStorage.instance.ref().child(url);
    await firebaseStorageRef.delete();
  }

  static obtenerImagenes(String carpeta) {
    StorageReference sr = FirebaseStorage.instance.ref().child(carpeta);
    print(sr);
  } */
}
