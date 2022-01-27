//  librerias internas de flutter
import 'package:flutter/material.dart';

//  librerias importadas flutter

//  librerias  proyecto

class ContextoUI {
  static List<Pagina> _listaKeysFormulario = List<Pagina>();
  static Pagina obtenerKey(String pagina) {
    return _listaKeysFormulario.firstWhere((s) => s.nombre == pagina,
        orElse: () => null);
  }

  static guadarKey(String nombre, GlobalKey<FormState> keyFormulario, [dynamic  id  , dynamic entidad]) {
    Pagina pagina = Pagina(nombre: nombre, keyFormulario: keyFormulario, id:id ,  entidad:entidad);
    Pagina paginaEncontrada = _listaKeysFormulario
        .firstWhere((s) => s.nombre == nombre, orElse: () => null);
    if (paginaEncontrada != null) _listaKeysFormulario.remove(paginaEncontrada);
    _listaKeysFormulario.add(pagina);
  }

  static GlobalKey<FormState> _keyFormulario;
  static GlobalKey<FormState> get keyFormulario {
    return _keyFormulario;
  }

  static set keyFormulario(GlobalKey<FormState> keyFormulario) {
    _keyFormulario = keyFormulario;
  }

  static bool _iniciarCaptura;
  static bool get iniciarCaptura {
    return _iniciarCaptura;
  }

  static set iniciarCaptura(bool iniciarCaptura) {
    _iniciarCaptura = iniciarCaptura;
  }
}

class Pagina {
  String nombre;
  GlobalKey<FormState> keyFormulario;
  dynamic id;
  dynamic entidad;
  Pagina({
    this.nombre,
    this.keyFormulario,
    this.id,
    this.entidad,
  });
}
