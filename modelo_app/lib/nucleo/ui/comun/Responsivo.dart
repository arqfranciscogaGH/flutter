

//  librerias internas de flutter

import 'package:flutter/material.dart';

//  librerias importadas flutter

//  librerias  proyecto

class Responsivo
{
      static String dispositivo='' ;
      static String orientation='' ;
      static double height=0 ;
      static double width=0 ;
   

    // tablet
    //  Orientation.landscape  height 752.0   width  1280.0
    //  Orientation.portrait height 1232.0   width  800.0

     // telefono
    //  Orientation.landscape  height 360.0   width  707.0
    //  Orientation.portrait   height 740.0   width  360.0
    //  
   static String  identifciarDispositivo(BuildContext context)
    {
      dispositivo="tel" ;
      height=MediaQuery.of(context).size.height ;
      width=MediaQuery.of(context).size.width ;
      orientation=MediaQuery.of(context).orientation.toString() ;

      if  ( height >= 1240 && width >= 1280  )
          dispositivo="pc" ;
      else if ( ( height > 750 && height < 1240  ) &&  ( width >= 800  &&  width <=1280 ) )
          dispositivo="tablet" ;
      else if ( ( height > 360 && height < 740  ) &&  ( width >= 360  &&  width <=710 ) )
          dispositivo="tel" ;            
      return  dispositivo;
    }
}