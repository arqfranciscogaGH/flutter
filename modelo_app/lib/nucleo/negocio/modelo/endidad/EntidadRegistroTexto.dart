//  librerias internas de flutter

import 'dart:convert';

//  librerias importadas flutter

//  librerias  proyecto


class EntidadRegistroTexto {
  //  variables
  String? campoLLave;
  Map<String, dynamic>? _datos ={};

  //  constructor

  EntidadRegistroTexto(){
    _datos= {};
  }

  //  propiedades


  //  obtener  map de entidad texto
   dynamic get datos {
       return _datos!;
   }
  
  //  asignar map a entidad texto
  set datos (dynamic  datos) {
      _datos=datos;
  }
  
  //  obtener  valor  de cammpo de  entidad  texto
  dynamic o(String campo) {
    return _datos![campo];
  }
  //  asigna  valor  a cammpo de  entidad  texto
  void c(String campo, dynamic valor) {
    return _datos![campo] = valor;
  }

    //  obtener  id  de entidad  texto
  dynamic get oid {
    dynamic id =0;
    if  ( _datos!=null)
    {
        campoLLave=campoLLave??'id' ;
        id = _datos![campoLLave];
        id ?? 0;
    }
    return id;
  }

 //  metodos

 //  metodos conversion entdidad  texto Map a  cadena json

 String toJson() => json.encode(_datos!=null ?_datos: '');

 //  metodos conversion cadena json a  entdidad  texto Map 

  Map<String, dynamic> fromJson(String cadenaJson) {
    _datos = json.decode(cadenaJson);
    return _datos!;
 }


}
