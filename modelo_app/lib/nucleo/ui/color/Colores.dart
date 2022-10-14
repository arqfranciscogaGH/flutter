//  librerias internas de flutter
import 'package:flutter/material.dart';

//  librerias importadas flutter


//  librerias  proyecto
import 'listaColores.dart';

//  librerias externas  flutter


// Descripcion de funcionalidad 
//
//  Colores
//





class Colores
{
   static Color obtener(String  color)
  {
      Color? matcolor=Colors.transparent;
      if (color==null || color=="")
          color="negro";
       matcolor =  listaColoresPersonalizado[color];
      return matcolor!;
  }
  static Color obtenerColorIndex(int  indexColor)
  {
    Color color=Colors.transparent;
    if (indexColor==null )
        indexColor=1;
    color = listaColoresPersonalizado.values.elementAt(indexColor);
    return color;
  }

  static List<String> obtenerColorePersonalizadoss()
  {
      List<String>  colores = [];
      colores=listaColoresPersonalizado.keys.toList();
      return colores;
  } 

  static List<String> obtenerColoresTemas()
  {
      List<String>  colores = [];
      colores=listaColoresTema.keys.toList();
      return colores;
  } 

  static Map<int, Color> listaColoresMaterial =
  {
    50:Color.fromRGBO(100,100,100, .1),
    100:Color.fromRGBO(136,14,79, .2),
    200:Color.fromRGBO(136,14,79, .3),
    300:Color.fromRGBO(100,100,100, .4),
    400:Colors.lime, 
    500:Color.fromRGBO(136,14,79, .6),
    600:Color.fromRGBO(136,14,79, .7),
    700:Colors.lime, 
    800:Colors.lime, 
    900:Color.fromRGBO(13,14,79, 1),
  };

  static MaterialColor obtenerMaterialColor(String  color)
  {
      MaterialColor matcolor = MaterialColor(50, listaColoresMaterial);
      if (color!=null && color!="")
          matcolor =  listaColoresTema[color];
      return matcolor; 
  }
}