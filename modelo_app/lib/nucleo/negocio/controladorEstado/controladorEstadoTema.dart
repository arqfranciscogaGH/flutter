//  librerias internas de flutter
import 'package:flutter/material.dart';



//  librerias importadas flutter




//  librerias  proyecto

class controladorEstadoTema  extends ChangeNotifier {
  ThemeData temaActual;
  controladorEstadoTema({
    required bool esModoObscuro
  }): temaActual= esModoObscuro? ThemeData.dark() : ThemeData.light();

  cambiarModoObscuro (){ temaActual = ThemeData.dark(); notifyListeners(); }
  cambiarModoClaro (){ temaActual = ThemeData.light(); notifyListeners();  }
}