//  librerias internas de flutter

import 'package:flutter/material.dart';

//  librerias importadas flutter

//  librerias  proyecto

Widget  rotar ( double  valor, Widget  widget)
{
    return  Transform.rotate(
                angle: valor ,
                origin: Offset( 0.0,0.0),
                child:  widget
    ); 
}
Widget  escalar  ( double  valor, Widget  widget)
{
    return Transform.scale(
                scale: valor/50 ,
                origin: Offset( 0.0,0.0),
                child:  widget
    ); 
}  
Widget  trasladar ( double  valor, Widget  widget)
{
    return  Transform.translate(
      
                offset: Offset( valor,0.0),
                child:  widget ,
    ); 
} 
Widget  skew ( double  valor, Widget  widget)
{
    return Transform(
                transform:Matrix4.skewX(valor/50) ,
                child:  widget ,
    ); 
} 

Widget  treeD ( double  valor, Widget  widget)
{
      return  Transform (
                  transform:Matrix4.identity()
                  ..setEntry(3, 2, valor/1000) 
                  ..rotateX( 3.14/60),
                  alignment: FractionalOffset.topCenter,
                  child: widget ,
      ); 
}   

Widget  cierreVentana  ( double  valor, Widget  widget,  AnimationController animationController)
{
    return Transform.translate(offset:  Offset( valor,0.0),  
                  child:Transform (
                      transform:Matrix4.identity()
                      ..setEntry(3, 2, valor/1000) 
                      ..rotateY( 3.14/2 * animationController.value ),
                      alignment: FractionalOffset.centerRight,
                      child: widget ,
    )); 
} 

