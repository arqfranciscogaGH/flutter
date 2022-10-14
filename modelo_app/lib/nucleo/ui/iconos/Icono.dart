//  librerias internas de flutter

import 'package:flutter/material.dart';
import 'package:modelo_app/nucleo/negocio/modelo/endidad/ParametrosSistema.dart';
import 'package:modelo_app/nucleo/nucleo.dart';

//  librerias importadas flutter


//  librerias  proyecto
import 'listaIconos.dart';
import '../color/color.dart';

class Icono
{
  // String nombre ;
  // dynamic color ;
  // double tamano;
  // Icono(this.nombre, this.color  , this.tamano )   { }

  static Icon crear(  String nombre , [  dynamic color ="",  double? tamano=0 ]  ) {
     if (nombre==null || nombre=="" )
        nombre='info';
     if (color==null || color=="" )
        color=ParametrosSistema.colorIcono;  
     if (tamano==null || tamano ==0  )     
         tamano!=ParametrosSistema.tamanoIcono;
     IconData? icono=listaIconosEstandar[nombre];
     return Icon(  icono , color: Colores.obtener(color) , size:tamano );  
  }
}


class RepetidorIcono extends StatelessWidget {
    BuildContext context;
    String icono;
    dynamic color ;
    double? tamano;      
    int numero;    
    bool enFila;
    RepetidorIcono ( { required this.context ,  required this.icono ,this.color,this.tamano, this.numero=3,this.enFila=true} );
    @override
    Widget build (BuildContext context)
    {
         List<Widget> iconos = [];
         if (color==null || color=="" )
            color=ParametrosSistema.colorIcono;  
         for(var i  = 0; i < numero; i++){
             iconos.add( Icono.crear(icono, color, tamano!));
         }
        if (enFila)
          return  Row(children: iconos  );
        else
          return  Column(children: iconos  );       
    }
}

