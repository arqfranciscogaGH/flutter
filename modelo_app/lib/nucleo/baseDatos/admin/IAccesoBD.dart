//  librerias internas de flutter


//  librerias  proyecto

import '../../../nucleo/negocio/modelo/endidad/EntidadBase.dart';
import 'ConfiguracionAccesoBD.dart';
import '../../../nucleo/negocio/modelo/endidad/EntidadRegistroTexto.dart';
import '../../../nucleo/negocio/modelo/endidad/EntidadTablaTexto.dart';

export '../../../nucleo/negocio/modelo/endidad/EntidadBase.dart';
export 'ConfiguracionAccesoBD.dart';
export '../../../nucleo/negocio/modelo/endidad/EntidadRegistroTexto.dart';
export '../../../nucleo/negocio/modelo/endidad/EntidadTablaTexto.dart';

abstract class IAccesoBD {
  // variables
  ConfiguracionAccesoBD? _configuracion;
  EntidadTablaTexto? _tabla= EntidadTablaTexto();
  EntidadRegistroTexto? _registro= EntidadRegistroTexto();
 
  //  constructor
 IAccesoBD() {
     _tabla= EntidadTablaTexto();
     _registro= EntidadRegistroTexto();
 }
  // propiedades

  //  obtener configuracion
 
  ConfiguracionAccesoBD get configuracion {return _configuracion!; }

 //  asignar  configuracion
 
  set configuracion ( ConfiguracionAccesoBD  c) {
    _configuracion = c;
  }

  //  obtener EntidadTablaTexto
 
  EntidadTablaTexto get tabla {return _tabla!; }

 //  asignar  EntidadTablaTexto
 
  set tabla ( EntidadTablaTexto  tabla) {
    _tabla = tabla;
  }

  //  obtener EntidadTablaTexto
 
  EntidadRegistroTexto get registro {return _registro!; }

 //  asignar  EntidadTablaTexto
 
  set registro ( EntidadRegistroTexto  registro) {
    _registro = registro;
  }

  // metodos

  iniciar() async {
     _tabla= EntidadTablaTexto();
     _registro= EntidadRegistroTexto();
  }
  abrir() async {
 
  }
  void cerrar() {

  }
  // metodos  ABC  base de datos
 

  Future ejecutar(String sql) async {
   
  }
  //Future<List<dynamic>> consultar(String nombreTabla) async {
  Future<dynamic> consultarTabla(String nombreTabla) async {

  }
  Future<dynamic> consultar(String nombreTabla, Map<String, dynamic> map, String campo, dynamic valor) async {

  }
  Future<dynamic> insertar(String nombreTabla, Map<String, dynamic> map) async {

  }
  Future<dynamic> actualizar(String nombreTabla, Map<String, dynamic> map, String campo, dynamic valor) async {

  }
  Future<dynamic> eliminar(String nombreTabla, Map<String, dynamic> map, String campo, dynamic valor) async {

  }
  Future<dynamic> obtener(String nombreTabla, Map<String, dynamic> map, String campo, dynamic valor) async {

  }
  Future<dynamic> sqlConsultar(String sql) async {

  }
  Future<dynamic> sqlInsertar(String sql) async {

  }
  Future<dynamic> sqlActualizar(String sql) async {

  }
  Future<dynamic> sqlEliminar(String sql) async {

  }
 
}
