//  librerias internas de flutter

import 'package:flutter/material.dart';

//  librerias importadas flutter

//  librerias  proyecto

// importar

class Pagina extends PageRouteBuilder {
  Widget widget;
  Pagina({this.widget})
      : super(
          transitionDuration: Duration(seconds: 2),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secAnimation,
              Widget widget) {
            animation =
                CurvedAnimation(parent: animation, curve: Curves.easeInOut);
            // escalar pagina
            //return ScaleTransition(scale: animation , alignment: Alignment.center , child: widget);
            // rotar pagina
            return RotationTransition(
              turns: Tween<double>(
                begin: 0.0,
                end: 1.0,
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Curves.linear,
                ),
              ),
              child: widget,
            );
          },
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secAnimation) {
            return widget;
          },
        );
}
