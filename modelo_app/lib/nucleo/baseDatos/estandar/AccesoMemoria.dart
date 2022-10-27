//  librerias internas de flutter

import 'dart:io';

//  librerias importadas flutter

//  librerias  proyecto

//  librerias internas de flutter

import 'dart:convert';

//  librerias importadas flutter

//  librerias  proyecto

import '../admin/IAccesoBD.dart';
import '../admin/ConfiguracionAccesoBD.dart';

class AccesoMemoria implements IAccesoBD {
  // variables


  ConfiguracionAccesoBD? _configuracion;
  EntidadTablaTexto? _tabla;
  EntidadRegistroTexto? _registro;

 //  constructor
  AccesoMemoria ()
  {
   
    _tabla= EntidadTablaTexto();
    _registro= EntidadRegistroTexto(); 
  }
  // propiedades
  // 
  //  obtener configuracion
  @override
  ConfiguracionAccesoBD get configuracion {
    return _configuracion!;
  }

 //  asignar  configuracion
  @override
  set configuracion ( ConfiguracionAccesoBD  configuracion) {
    _configuracion = configuracion;
  }

 //  obtener lista tabla  map texto, se obtiene  resultado  de api o db
  EntidadTablaTexto get tabla {
    return  _tabla!;
  }

 //  asignar  lista tabla  map de texto, se obtiene  resultado  de api o db
  set tabla(  EntidadTablaTexto tabla) {
    _tabla= tabla;
  }

  //  obtener  map de entidad registro texto
   EntidadRegistroTexto get registro {
       return _registro!;
   }
  
  //  asignar map a entidad  registro texto
  set registro (EntidadRegistroTexto  registro) {
      _registro=registro;
  }
  
  // metodos
  @override
  iniciar() async {
    _tabla= EntidadTablaTexto();
    _registro= EntidadRegistroTexto();
  }

  @override
  abrir() async {}

  @override
  cerrar() async {
 
  }

 

  // metodos  ABC  base de datos
 
 @override
  Future ejecutar(String sql) async {}

  @override
  Future<List<dynamic>> consultarTabla(String nombreTabla) async {
    return tabla.datos;
  }
    @override
  Future<Map<String, dynamic>> consultar(String nombreTabla, Map<String, dynamic> map, String campo, dynamic valor) async {
    Map<String, dynamic> listaMap;
    listaMap = tabla.datos.firstWhere((o) => o[campo] == valor);
    registro.datos=map;
    return listaMap;
  }
  @override
  Future<Map<String, dynamic>> obtener(String nombreTabla, Map<String, dynamic> map, String campo, dynamic valor) async {
    Map<String, dynamic> listaMap;
    listaMap = tabla.datos.firstWhere((o) => o[campo] == valor);
    registro.datos=map;
    return listaMap;
  }
  @override
  Future<dynamic> insertar(String nombreTabla, Map<String, dynamic> map) async {

    tabla.datos.add(map);
    registro.datos=map;
    return map;
  }

  @override
  Future<dynamic> actualizar(String nombreTabla, Map<String, dynamic> map,String campo,  dynamic valor) async {
     tabla.datos.removeWhere((o) => o[campo] == valor);
     tabla.datos..add(map);
     registro.datos=map;
    return map;
  }

  @override
  Future<Map<String, dynamic>> eliminar(String nombreTabla,Map<String, dynamic> map, String campo,  dynamic valor) async {
    tabla.datos.removeWhere((o) => o[campo] == valor);
    registro.datos=map;
    //lista.removeWhere( (Sting k, dynamic v) => k =='id' && v == id );
    return map;
  }

  @override
  Future<dynamic> sqlConsultar(String sql) async {
    return tabla.datos ; 
  }
  @override
  Future<dynamic> sqlInsertar(String sql) async {
     return tabla.datos; 
  }
  @override
  Future<dynamic> sqlActualizar(String sql) async {
    return tabla.datos; 
  }
  @override
  Future<dynamic> sqlEliminar(String sql) async {
    return tabla.datos; 
  }
}
