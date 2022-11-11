//  librerias internas de flutter

//  librerias importadas flutter

//  librerias  proyecto

import 'IAccesoBD.dart';
import 'ConfiguracionAccesoBD.dart';
import 'AdministradorAcceso.dart';

class AccesoBD extends IAccesoBD {
  // variables
  //  instancia de  AccesoBD 
  static final AccesoBD _instancia = AccesoBD._();
  //  instancia de  IAccesoBD por defecto
  static IAccesoBD? _abd;

  //  propiedades

  // métodos

  AccesoBD._();

  factory AccesoBD() {
    return _instancia;
  }
  static AccesoBD get instancia {
    return _instancia;
  }
  // regresa instancia de  IAccesoBD por defecto
  static IAccesoBD get abd {
    return _abd!;
  }
  // verifica existencia  instancia de  IAccesoBD por defecto
   static bool get isDB {
    return _abd==null?false:true;
  }
  // verifica existencia  instancia de  IAccesoBD por defecto
  definirPersistencia(ConfiguracionAccesoBD configuracion) {
    this.configuracion = configuracion;
    if (_abd==null)
        _abd = AdministradorAcceso.definirPersistencia(configuracion);
  }

  @override
  iniciar() async {
     if (_abd != null) {
      _abd!.iniciar();
    }
  }
  @override
  abrir() async {
    if (_abd! != null) {
     await  _abd!.abrir();
    }
  }

 
  

  @override
  Future ejecutar(String sql) async {
    await _abd!.ejecutar(sql);
  }

  @override
  Future<List<dynamic>> consultarTabla(String nombreTabla) async {
    dynamic respuesta = await _abd!.consultarTabla(nombreTabla);
    return respuesta;
  }

  @override
  Future<dynamic> consultar(String nombreTabla, Map<String, dynamic> map,
      String campo,dynamic valor) async {
    dynamic res = await _abd!.obtener(nombreTabla, map, campo, valor);
    return res;
  }

  @override
  Future<dynamic> insertar(String nombreTabla, Map<String, dynamic> map) async {
    dynamic res = await _abd!.insertar(nombreTabla, map);
    return res;
  }

  @override
  Future<dynamic> actualizar(String nombreTabla, Map<String, dynamic> map,
      String campo,dynamic valor) async {
    dynamic res = await _abd!.actualizar(nombreTabla, map, campo, valor);
    return res;
  }

  @override
  Future<Map<String, dynamic>> eliminar(String nombreTabla,
      Map<String, dynamic> map, String campo,dynamic valor) async {
    dynamic res = await _abd!.eliminar(nombreTabla, map, campo, valor);
    return res;
  }

  @override
  Future<dynamic> obtener(String nombreTabla, Map<String, dynamic> map,
      String campo,dynamic valor) async {
    dynamic res = await _abd!.obtener(nombreTabla, map, campo, valor);
    return res;
  }

  Future<List<dynamic>> sqlConsultar(String sql) async {
    List<dynamic> respuesta = await _abd!.sqlConsultar(sql);
    return respuesta;
  }

  @override
  Future<dynamic> sqlInsertar(String sql) async {
    dynamic res = await _abd!.sqlInsertar(sql);
    return res;
  }

  @override
  Future<dynamic> sqlActualizar(String sql) async {
    dynamic res = await _abd!.sqlActualizar(sql);
    return res;
  }

  @override
  Future<dynamic> sqlEliminar(String sql) async {
    dynamic res = await _abd!.sqlEliminar(sql);
    return res;
  }

  @override
  void cerrar() {
    _abd!.cerrar();
  }
}
