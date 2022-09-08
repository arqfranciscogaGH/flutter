import 'package:flutter/material.dart';

final _listaIColores = <String, MaterialColor>{
      'morado'               : Colors.purple,
      'moradoclaro'          : Colors.purple[200],   
      'moradofuerte'         : Colors.purple[700],  

      'azul'                 : Colors.blue, 
      'azulclaro'            : Colors.blue[200], 
      'azulfuerte'           : Colors.blue[700],  

      'azulindigo'           : Colors.indigo, 
      'azulindigoclaro'      : Colors.indigo[200], 
      'azulindigofuerte'     : Colors.indigo[700],  
   
      'negro'                : Colors.black,  
      'negroclaro'           : Colors.black,  
      'negrofuerte'          : Colors.black,  

      'gris'                 : Colors.grey,  
      'grisclaro'            : Colors.grey[200], 
      'grisfuerte'           : Colors.grey[700],  

      'rojo'                 : Colors.red ,  
      'rojoclaro'            : Colors.red[200], 
      'rojofuerte'           : Colors.red[700],   

      'rosa'                 : Colors.pink ,  
      'rosaclaro'            : Colors.pink[200],   
      'rosafuerte'           : Colors.pink[700],   

      'verde'                : Colors.green,     
      'verdeclaro'           : Colors.green[200], 
      'lima'                 : Colors.lime,   

      'amarillo'             : Colors.yellow  ,
      'amarilloclaro'        : Colors.yellow[200] , 
      'amarillofuerte'       : Colors.yellow[700] ,

      'cafe'                 : Colors.brown  ,
      'cafeclaro'            : Colors.brown[200] , 
      'cafefuerte'           : Colors.brown[700] ,

      'naranja'              : Colors.orange  ,
      'naranjaclaro'         : Colors.orange[200] , 
      'naranjafuerte'        : Colors.orange[700] ,      

 };
final listaIColoresPersonalizado = <String, Color>{

      'rojomasclaro'         : Colors.red[100], 
      'rojoclaro'            : Colors.red[300], 
      'rojo'                 : Colors.red ,  
      'rojofuerte'           : Colors.red[700],   
      'rojouMasFuerte'       : Colors.red[900],

      'rosamasclaro'         : Colors.pink[100] , 
      'rosaclaro'            : Colors.pink[300] ,
      'rosa'                 : Colors.pink ,  
      'rosaclaro'            : Colors.pink[700] ,
      'rosafuerte'           : Colors.pink[900],  

      'moradomasclaro'       : Colors.purple[100],   
      'moradoclaro'          : Colors.purple[300],  
      'morado'               : Colors.purple,
      'moradofuerte'         : Colors.purple[700],  
      'moradomasfuerte'      : Colors.purple[900],  

      'azulindimasgoclaro'   : Colors.indigo[100],  
      'azulindigoclaro'      : Colors.indigo[300],  
      'azulindigo'           : Colors.indigo, 
      'azulindigofuerte'     : Colors.indigo[700],  
      'azulindigomasfuerte'  : Colors.indigo[900],  

      'azulmasclaro'         : Colors.blue[100], 
      'azulclaro'            : Colors.blue[300], 
      'azul'                 : Colors.blue, 
      'azulfuerte'           : Colors.blue[700],  
      'azulmasfuerte'        : Colors.blue[900],  
         
      'verdeclaro'           : Colors.green[100], 
      'verdemasclaro'        : Colors.green[300],           
      'verde'                : Colors.green,     
      'verdefuerte'          : Colors.green[700], 
      'verdemasfuerte'       : Colors.green[900], 
      'lima'                 : Colors.lime,   

      'amarillomasclaro'     : Colors.yellow[100] ,
      'amarilloclaro'        : Colors.yellow[300] ,      
      'amarillo'             : Colors.yellow  ,
      'amarillofuerte'       : Colors.yellow[700] ,
      'amarillomasfuerte'    : Colors.yellow[900] ,

      'naranjamasclaro'      : Colors.orange[100] , 
      'naranjaclaro'         : Colors.orange[300] ,       
      'naranja'              : Colors.orange  ,
      'naranjafuerte'        : Colors.orange[700] , 
      'naranjamasfuerte'     : Colors.orange[900] ,   

      'cafecmaslaro'         : Colors.brown[100] , 
      'cafeclaro'            : Colors.brown[300] , 
      'cafe'                 : Colors.brown  ,
      'cafefuerte'           : Colors.brown[700] ,
      'cafemasfuerte'        : Colors.brown[900] ,

      'negroclaro'           : Colors.black38,   
      'negro'                : Colors.black,  
      'negrofuerte'          : Colors.black87,  
 
      'grismasclaro'         : Colors.grey[300], 
      'grisclaro'            : Colors.grey[400], 
      'gris'                 : Colors.grey,  
      'grisfuerte'           : Colors.grey[700], 
      'grismasfuerte'        : Colors.grey[800],  


      'F'             : Colors.blueGrey[700],
      'D'             : Colors.blueGrey[200],
      'P'             : Colors.grey[800],
      'SA+'           : Colors.deepPurple[900],
      'SA'            : Colors.deepPurple[700],
      'G++'           : Colors.yellow[900],
      'G+'            : Colors.yellow[800],
      'G'             : Colors.yellow[700],
      'S+'            : Colors.grey[600],
      'S'             : Colors.grey[400],
      'B+'            : Colors.brown[700],
      'B'             : Colors.brown[600],

 };

class Colores
{
    static Map<int, Color> listaColoresPersonalizados =
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
    static MaterialColor obtener(String  color)
    {
        MaterialColor colorPersonalizado = MaterialColor(50, listaColoresPersonalizados);
        return colorPersonalizado;

/*         MaterialColor matcolor =Colors.transparent;
        if (color!=null && color!="")
            matcolor =  _listaIColores[color];
        
        return matcolor; */
    }
//     static List<Color> obtenerColores()
//     {
//      List<Color>  colores = List<Color> ();
// _         listaIColoresPersonalizado.map((c) => c.Color.toList() );

//         return colores;
//     } 
   static Color obtenerColor(String  color)
  {
      Color matcolor=Colors.transparent;
      if (color!=null && color!="")
          matcolor =  listaIColoresPersonalizado[color];
      
      return matcolor;
  }
 static Color obtenerColorIndex(int  indexColor)
    {
      
        Color color=Colors.transparent;
        if (indexColor!=null )
            color = listaIColoresPersonalizado.values.elementAt(indexColor);
        
        return color;
    }
    //
    //  definicón  de colores estandarizados
    //
    static Color get  titulo
    {
        return Colors.grey;
    }  
    static Color get texto
    {
        return Colors.black;
    }  
    static Color get fondoTexto
    {
        return Colors.black;
    }      
    static Color get fondo
    {
        return Colors.black;
    }             
    static Color get fondoMarco
    {
        return Colors.white;
    }  
    static Color get sombra
    {
        return Colors.black;
    }      
    static Color get marco
    {
        return Colors.black;
    }             
    static Color get iconoInformativo
    {
       return Colors.white;
    } 
    static Color get fondoIcono
    {
       return Colors.black;
    } 
    static Color get fondoBotonAccion
    {
       return Colors.black;
    }  
    static Color get  textoBotonAccion
    {
       return Colors.white;
    }                        
}