//  librerias internas de flutter

import 'dart:io';

//  librerias importadas flutter
import 'package:image_picker/image_picker.dart';




//  librerias  proyecto

class Imagen
{ 
    static  Future<File>  capturar( ImageSource origen ) async {
 
        File imagenCapturada;
        // final   pic= ImagePicker();
        // final archivo  =  await pic.getImage(source: ImageSource.gallery); 
        // imagenCapturada= File (archivo.path);
        try
        {
            PickedFile _imageFile;
            imagenCapturada = await ImagePicker.pickImage(
              source: origen
            );
            print ( "imagen capturada:  ${ imagenCapturada?.path } " );
        }
        catch ( error )
        {
            
        }
        return imagenCapturada;
    } 
    static  Future<File>  capturarVideo( ImageSource origen ) async {
        File videoCapturado;
        try
        {
            videoCapturado = await ImagePicker.pickVideo(
              source: origen
            );
            print ( "Video capturado:  ${ videoCapturado?.path } " );
        }
        catch ( error )
        {
            
        }
        return videoCapturado;
    } 
  }
