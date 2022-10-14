import 'dart:convert';
import 'Entidadbase.dart';


class ControlLista<T extends EntidadBase> {
  //   Variables
  dynamic entidad;
  List<T> _lista = [];
  ControlLista({this.entidad})   {  }

  //  Propiedades

  // Métodos

  limpiar() {
    // _lista = new List<T>();
     _lista =[];
  }

  T obtener(bool test(T element)) {
     entidad = _lista.firstWhere(test);
     return entidad;
  }
  T  buscar (bool test(T element)  )
  {
      entidad = _lista.firstWhere(test);
      return entidad;  
  }  
  List<T> filtrarLista(bool test(T element)) {
     List<T> lista = _lista.where(test).toList();
     return lista;
  }

  agregar(T entidad) {
     this.entidad = entidad;
     //if (_lista == null) _lista = [new] List<T>();
     if (_lista == null) _lista = [];
     _lista.add(entidad);
  }

  actualizar(bool test(T element), T entidadNueva) {
     entidad = _lista.firstWhere(test);
     if (entidad != null)
     {
        eliminar(entidad);
        agregar(entidadNueva);
     }
     else
         agregar(entidadNueva); 
     entidad = entidadNueva;
  }

  eliminar(T entidad) {
     this.entidad = entidad;
     _lista.remove(entidad);
  }
  List<T> obtenerLista()
  {
      return _lista;
  }
  asignarLista( List<T> lista)
  {
      _lista=lista;
  }
  List<Map<String,dynamic>> lisTotMap() {
      return _lista.map((c) => c.toMap()).toList();
  }  
  String toJson()  {
      return json.encode( this.lisTotMap() );
  }   
  List<dynamic> mapTolista(List<dynamic> listaMapa) {
     List<dynamic> lista = listaMapa.isNotEmpty
        ? listaMapa.map((c) => entidad.iniciar().fromMap(c)).toList()
        : [];
     return lista;
  }

  List<dynamic> jsonToList(String cadenaJson) {
     List<dynamic> listaMap = json.decode(cadenaJson);
     List<dynamic> lista = mapTolista(listaMap);
     return lista;
  } 

}