
//  librerias internas de flutter

//  librerias  proyecto

//  librerias externas flutter

import 'package:injector/injector.dart';

class InjeccionDependencia 
{
 static dynamic  _injector = null;
 static List<dynamic> _lista = [];
 static iniciar ()
 {
    if (_injector == null)
      _injector = Injector.appInstance;
 }

 static agregar <T>(T objeto)
 {
    //  dynamic objetoT =_injector.get<T>();
    //  if (objetoT==null)
       _injector.registerDependency<T>(() => objeto);
 }
 static T obtener<T> ()
 {
    
     dynamic objetoT =_injector.get<T>();
     return  objetoT;
  }
  // static T  buscar<T> (bool test(T objeto)  )
  // {
  //     T entidad = _lista.firstWhere(test);
  //     return entidad;  
  // }  

}