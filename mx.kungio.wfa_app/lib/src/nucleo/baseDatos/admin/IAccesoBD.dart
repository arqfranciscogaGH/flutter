//  librerias internas de flutter

//  librerias importadas flutter

//  librerias  proyecto

import '../../negocio/endidad/EntidadBase.dart';
import 'ConfiguracionAccesoBD.dart';

class IAccesoBD {

  ConfiguracionAccesoBD configuracion;


  iniciar() async {

  }
  abrir() async {
 
  }
  Future ejecutar(String sql) async {
   
  }
  Future<List<dynamic>> consultar(String nombreTabla) async {

  }
  Future<dynamic> insertar(String nombreTabla, Map<String, dynamic> map) async {

  }
  Future<dynamic> actualizar(String nombreTabla, Map<String, dynamic> map,
      String campo, int id) async {

  }
  Future<Map<String, dynamic>> eliminar(String nombreTabla,
      Map<String, dynamic> map, String campo, int id) async {

  }
  Future<dynamic> obtener(String nombreTabla, Map<String, dynamic> map,
      String campo, int id) async {

  }
  Future<dynamic> sqlConsultar(String sql) async {

  }
  Future<dynamic> sqlInsertar(String sql) async {

  }
  Future<dynamic> sqlActualizar(String sql) async {

  }
  Future<dynamic> sqlEliminar(String sql) async {

  }
  void cerrar() {

  }
}
