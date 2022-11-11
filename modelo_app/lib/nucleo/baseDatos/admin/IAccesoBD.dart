//  librerias internas de flutter

//  librerias  proyecto

import '../../../nucleo/negocio/modelo/endidad/EntidadBase.dart';
import 'ConfiguracionAccesoBD.dart';
import '../../negocio/modelo/endidad/EntidadRegistro.dart';
import '../../negocio/modelo/endidad/EntidadResultado.dart';

export '../../../nucleo/negocio/modelo/endidad/EntidadBase.dart';
export 'ConfiguracionAccesoBD.dart';
export '../../negocio/modelo/endidad/EntidadRegistro.dart';
export '../../negocio/modelo/endidad/EntidadResultado.dart';

abstract class IAccesoBD {
  // variables
  ConfiguracionAccesoBD? _configuracion;

  //  constructor
  IAccesoBD() {}
  // propiedades

  //  obtener configuracion

  ConfiguracionAccesoBD get configuracion {
    return _configuracion!;
  }

  //  asignar  configuracion

  set configuracion(ConfiguracionAccesoBD c) {
    _configuracion = c;
  }

  iniciar() async {}
  abrir() async {}
  void cerrar() {}
  // metodos  ABC  base de datos

  Future ejecutar(String sql) async {}
  //Future<List<dynamic>> consultar(String nombreTabla) async {
  Future<dynamic> consultarTabla(String nombreTabla) async {}
  Future<dynamic> filtrarTabla(String nombreTabla, Map<String, dynamic> map,
      String campo, dynamic valor) async {}
  Future<dynamic> insertar(
      String nombreTabla, Map<String, dynamic> map) async {}
  Future<dynamic> actualizar(String nombreTabla, Map<String, dynamic> map,
      String campo, dynamic valor) async {}
  Future<dynamic> eliminar(String nombreTabla, Map<String, dynamic> map,
      String campo, dynamic valor) async {}
  Future<dynamic> obtener(String nombreTabla, Map<String, dynamic> map,
      String campo, dynamic valor) async {}
  Future<dynamic> sqlConsultar(String sql) async {}
  Future<dynamic> sqlInsertar(String sql) async {}
  Future<dynamic> sqlActualizar(String sql) async {}
  Future<dynamic> sqlEliminar(String sql) async {}
}
