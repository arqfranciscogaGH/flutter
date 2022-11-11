//  librerias internas de flutter

import 'dart:convert';

//  librerias importadas flutter

//  librerias  proyecto

class EntidadResultado {
  //  variables
  String? campoLLave;

  List<dynamic>? _datos;

  //  constructor

  EntidadResultado() {
    _datos = [];
  }
  //  propiedades

//  obtener lista  map texto, se obtiene  resultado  de api o db
  List<dynamic> get datos {
    return _datos!;
  }

  //  asignar  lista  map de texto, se obtiene  resultado  de api o db
  set datos(List<dynamic> datos) {
    _datos = datos;
  }

  //  metodos
  agregar(Map registro) {
    _datos!.add(registro);
  }

  eliminar(Map registro) {
    //  _datos!.remove(registro);
    _datos!.removeWhere((o) => o[campoLLave] == registro[campoLLave]);
  }
  //  metodos conversion entdidad  texto Map a  cadena json

  String toJson() => json.encode(_datos != null ? _datos : []);

  //  metodos conversion cadena json a  entdidad  texto Map

  List<dynamic>? fromJson(String cadenaJson) {
    _datos = json.decode(cadenaJson);
    return _datos;
  }
}
