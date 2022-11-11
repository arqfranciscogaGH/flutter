//  librerias internas de flutter
import 'package:flutter/material.dart';

//  librerias importadas flutter

//  librerias  proyecto
import '../../contexto/ContextoAplicacion.dart';

//  librerias externas  flutter

class ModeloCE extends ChangeNotifier {
  List<EntidadBase>? lista = [];
  dynamic entidad;
  ModeloCE() {
    lista = [];
    entidad = EntidadBase(id: 1, nombre: 'Fran');
    lista!.add(entidad);
    lista!.add(EntidadBase(id: 2, nombre: 'Vane'));
    lista!.add(EntidadBase(id: 3, nombre: 'leA'));

    entidad = EntidadBase(id: 1, nombre: 'Fran');
  }
  void obtener() {
    lista = [];
    entidad = EntidadBase(id: 1, nombre: 'Fran');
    lista!.add(entidad);
    lista!.add(EntidadBase(id: 2, nombre: 'Vane'));
    lista!.add(EntidadBase(id: 3, nombre: 'leA'));
    notifyListeners();
  }

  void guardar() {
    notifyListeners();
  }
}
