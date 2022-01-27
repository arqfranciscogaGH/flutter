//  librerias internas de flutter

//  librerias importadas flutter

//  librerias  proyecto

import 'IAccesoBD.dart';
import 'ConfiguracionAccesoBD.dart';
import 'AdministradorAcceso.dart';

class AccesoBD extends IAccesoBD {
  // variables

  static final AccesoBD _instancia = AccesoBD._();
  IAccesoBD abd;

  //  propiedades

  // métodos

  AccesoBD._();

  factory AccesoBD() {
    return _instancia;
  }
  static AccesoBD get instancia {
    return _instancia;
  }

  definirPersistencia(ConfiguracionAccesoBD configuracion) {
    this.configuracion = configuracion;
    abd = AdministradorAcceso.definirPersistencia(configuracion);
  }

  @override
  iniciar() async {
     if (abd != null) {
      abd.iniciar();
    }
  }
  @override
  abrir() async {
    if (abd != null) {
      abd.abrir();
    }
  }

  @override
  Future ejecutar(String sql) async {
    await abd.ejecutar(sql);
  }

  @override
  Future<List<dynamic>> consultar(String nombreTabla) async {
    dynamic respuesta = await abd.consultar(nombreTabla);
    return respuesta;
  }

  @override
  Future<dynamic> insertar(String nombreTabla, Map<String, dynamic> map) async {
    dynamic res = await abd.insertar(nombreTabla, map);
    return res;
  }

  @override
  Future<dynamic> actualizar(String nombreTabla, Map<String, dynamic> map,
      String campo, int id) async {
    dynamic res = await abd.actualizar(nombreTabla, map, campo, id);
    return res;
  }

  @override
  Future<Map<String, dynamic>> eliminar(String nombreTabla,
      Map<String, dynamic> map, String campo, int id) async {
    dynamic res = await abd.eliminar(nombreTabla, map, campo, id);
    return res;
  }

  @override
  Future<dynamic> obtener(String nombreTabla, Map<String, dynamic> map,
      String campo, int id) async {
    dynamic res = await abd.obtener(nombreTabla, map, campo, id);
    return res;
  }

  Future<List<dynamic>> sqlConsultar(String sql) async {
    List<dynamic> respuesta = await abd.sqlConsultar(sql);
    return respuesta;
  }

  @override
  Future<dynamic> sqlInsertar(String sql) async {
    dynamic res = await abd.sqlInsertar(sql);
    return res;
  }

  @override
  Future<dynamic> sqlActualizar(String sql) async {
    dynamic res = await abd.sqlActualizar(sql);
    return res;
  }

  @override
  Future<dynamic> sqlEliminar(String sql) async {
    dynamic res = await abd.sqlEliminar(sql);
    return res;
  }

  @override
  void cerrar() {
    abd.cerrar();
  }
}
