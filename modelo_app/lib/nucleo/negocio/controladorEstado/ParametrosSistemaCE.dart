//  librerias internas de flutter
import 'package:flutter/material.dart';



//  librerias importadas flutter




//  librerias  proyecto

import '../../nucleo.dart';
import '../../../administracion/administracion.dart';
import '../../../paquetesExternos/paquetesExternos.dart';

//  librerias externas  flutter


class ParametrosSistemaCE  extends ChangeNotifier {

  
  // ThemeData temaActual;
  // controladorEstadoTema({
  //   required bool esModoObscuro
  // }): temaActual= esModoObscuro? ThemeData.dark() : ThemeData.light();

  // cambiarModoObscuro (){ temaActual = ThemeData.dark(); notifyListeners(); }
  // cambiarModoClaro (){ temaActual = ThemeData.light(); notifyListeners();  }

  controladorEstadoParametrosSistema() { 
    //  obtener();
  }  
  void  obtenerTema (){ 
     AdministradorTema.obtenerTema();
  }
  guardarTema() {
     AdministradorTema.guardarTema();
     notifyListeners(); 
  }
  cambiarColorTema(String color) {
     AdministradorTema.cambiarColorTema(color);
     AdministradorTema.cambiarTema();
     notifyListeners(); 
  }
  cambiarColorSecundario(String color) {
     AdministradorTema.cambiarColorSecundario(color);
     AdministradorTema.cambiarTema();
     notifyListeners(); 
  }
  cambiarEsModoObscuro(bool esModoObscuro) {
     AdministradorTema.cambiarEsModoObscuro(esModoObscuro);
     AdministradorTema.cambiarTema();
     notifyListeners(); 
  }

  crearTemaPersonalizado()
  {
     AdministradorTema.crearTemaPersonalizado();
     notifyListeners();  
  }

  /* 
  String obtenerIdioma (){ 
     AdministradorIdioma.obtenerIdioma();
     return ParametrosSistema.idioma;
  } 
  */
  cambiarIdioma(String idioma) {
     AdministradorIdioma.cambiarIdioma(idioma);
     Traductor.cargar();
     OpcionesMenus.limpiar();
     notifyListeners(); 
  }
    guardarIdioma() {
     AdministradorIdioma.guardarIdioma();
     notifyListeners(); 
  }

}