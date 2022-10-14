//  librerias internas de flutter

import 'package:flutter/material.dart';



//  librerias importadas flutter

// import 'package:dynamic_theme/dynamic_theme.dart';

//  librerias  proyecto


import '../comun/ParametrosSistema.dart';

class Tema {  

 static ThemeData? _temaPorDefecto ;

  static ThemeData get temaPorDefecto {

  if ( ParametrosSistema.esModoObscuro )
   _temaPorDefecto =ThemeData.light().copyWith( primaryColor: ParametrosSistema.primario,  appBarTheme: AppBarTheme(color:ParametrosSistema.primario , elevation: 5));
  else
   _temaPorDefecto =ThemeData.dark().copyWith( primaryColor: ParametrosSistema.primario,  appBarTheme: AppBarTheme(color:ParametrosSistema.primario , elevation: 5));
  return _temaPorDefecto!;
  }



/*     static cambiarColorTema(String tema, BuildContext context)
    {
        DynamicTheme.of(context).setThemeData( creaTema(tema,context));
    }
    static ThemeData creaTema(String tema, BuildContext context)
    {
     
      if  (tema==null || tema=="" )
            return new ThemeData(
                primaryColor: Theme.of(context).primaryColor ,
                brightness: obtenerBrilloTema(),                
            );   
        else if  (tema=="rojo")
            return new ThemeData(
                primaryColor: Colors.red ,
                brightness: obtenerBrilloTema(),               
            );
        else if  (tema=="verde")     
            return new ThemeData(
                primaryColor:Colors.green ,
                brightness: obtenerBrilloTema(),               
            );
        else if  (tema=="default")    
  
            return new ThemeData(
                primaryColor: obtenerColorTema() ,
                backgroundColor: obtenerColorTema()  , 
                primarySwatch: obtenerColorTema()  , 
                //primarySwatch   : Configuracion.brillo==0? Colores.obtener(Configuracion.tema) : Colores.obtener(Configuracion.tema)  ,             
                brightness: obtenerBrilloTema(),
            );   


    }
    static Color obtenerColorTema()
    {
       return Colores.obtenerColor(Configuracion.tema) ;
    }
    static cambiarBrillo( BuildContext context) {
        DynamicTheme.of(context).setBrightness(obtenerBrilloTema());
    }
    static Brightness obtenerBrilloTema()
    {
       return Configuracion.brillo==0? Brightness.light: Brightness.dark;
    }     */
}  
