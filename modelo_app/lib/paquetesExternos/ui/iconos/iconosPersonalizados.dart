
//  librerias internas de flutter

import 'package:flutter/material.dart';


//  librerias  proyecto


//  librerias externas flutter

// import 'package:flutter_icons/flutter_icons.dart';

final _listaIconosPersonalizados = <String, IconData>{
      // 'documentos'             : Entypo.documents,   
      // 'map_pin'                : FontAwesome.map_pin  ,              
      // 'industry'               : FontAwesome.industry    ,   
      // 'direccion'              : Entypo.address ,         
      // 'storefront'             : Icons.storefront   ,  
      // 'store_mall_directory'   : Icons.store_mall_directory  ,  

      // 'whatsApp'               : FontAwesome.whatsapp  ,              
      // 'facebook'               : FontAwesome.facebook     ,   
      // 'video'                  : Entypo.video ,  
      // 'youtube'                : FontAwesome.youtube ,              
      // 'sitio'                  : FontAwesome.internet_explorer ,  
        
 };
class IconosPersonlizados
{
  static Icon crear(  String nombre , [ String, tipo="", dynamic color ,  double tamano=10 ]  ) {
     if (nombre!=null && nombre=="" )
        nombre='info';
     if (  color==null && color==0  )
        color=Colors.black;          
     if (  tamano==null || tamano==0  )
        tamano=8;
     IconData? icono=_listaIconosPersonalizados[nombre];
     return Icon( icono, color: color , size:tamano );  
  }
}