//  librerias internas de flutter
import 'package:flutter/material.dart';


//  librerias importadas flutter

// import 'package:dynamic_theme/dynamic_theme.dart';

//  librerias  proyecto

import '../color/colores.dart';
import '../../negocio/modelo/endidad/ParametrosSistema.dart';

//  librerias externas  flutter


// Descripcion de funcionalidad 
//
//  Tema
//



class Tema {  
 static ThemeData? _temaPorDefecto ;
 static ThemeData obtener()
{
   _temaPorDefecto = _temaPorDefecto==null ? crearTemaPersonalizado()  : _temaPorDefecto!; 
    return _temaPorDefecto!;
}
 static ThemeData crear()
{
    Color _colorTema=Colores.obtener(ParametrosSistema.colorTema);
    if ( ParametrosSistema.esModoObscuro )
        _temaPorDefecto =ThemeData.dark().copyWith( primaryColor: _colorTema,  appBarTheme: AppBarTheme(color:_colorTema, elevation: 5));
    else
      _temaPorDefecto =ThemeData.light().copyWith( primaryColor: _colorTema,  appBarTheme: AppBarTheme(color:_colorTema , elevation: 5) );
    return _temaPorDefecto!;
  }

  static ThemeData crearTemaPersonalizado( /* String tema, BuildContext context */ )
  {
      Color _colorPrimario=Colores.obtener(ParametrosSistema.colorTema);
      Color _colorSecundario=Colores.obtener(ParametrosSistema.colorSecundario);
 
      _temaPorDefecto= ThemeData(
       //       primaryColor: Theme.of(context).primaryColor ,
                appBarTheme: AppBarTheme(color:_colorPrimario , elevation: 5),
                primaryColor: _colorPrimario ,
                backgroundColor: _colorSecundario  ,            
                brightness: obtenerBrillo(),                
        );   
        return _temaPorDefecto!;
  }
  static Brightness obtenerBrillo()
  {
      return ParametrosSistema.esModoObscuro?Brightness.dark : Brightness.light ;
  }  

/*  
   static cambiarColorTema(String tema, BuildContext context)
    {
        DynamicTheme.of(context).setThemeData( creaTema(tema,context));
    }
 
    static cambiarBrillo( BuildContext context) {
        DynamicTheme.of(context).setBrightness(obtenerBrilloTema());
    }
      
     */
}  
