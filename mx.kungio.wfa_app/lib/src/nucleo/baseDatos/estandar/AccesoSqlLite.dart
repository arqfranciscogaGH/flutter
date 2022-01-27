//  librerias internas de flutter

import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

//  librerias importadas flutter

//  librerias  proyecto

import '../admin/IAccesoBD.dart';

class AccesoSqlLite extends IAccesoBD {
  // variables
  Database _database;

  //  propiedades

  // métodos

  @override
  iniciar() async {}
  @override
  abrir(/* String pnombreDB,List<EntidadBase> ptablas */) async {
/*     super.nombreDB=pnombreDB;
    super.tablas=ptablas;
    tablas=ptablas;
    nombreDB = nombreDB; */
    await obtenerDB();
  }

  Future<Database> obtenerDB() async {
    if (_database != null) return _database;
    _database = await crear();
    return _database;
  }

  Future<Database> crear() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, configuracion.nombreBD + '.db');
    print("path:  $path");
    print(this.configuracion.nombreBD);
    return await openDatabase(path,
        version: configuracion.version,
        onOpen: (db) {}, onCreate: (Database db, int version) async {
        if (configuracion.tablas != null) {
          configuracion.tablas.forEach((tabla) {
            print(tabla.sqlTabla());
            print("____________________________");
            db.execute(tabla.sqlTabla());
          });
        }
    });
  }

  @override
  Future ejecutar(String sql) async {
    await _database.execute(sql);
  }

  @override
  Future<List<dynamic>> consultar(String nombreTabla) async {
    await obtenerDB(); // para se instancie database
    final respuesta = await _database.query(nombreTabla);
    print(respuesta);
    return respuesta;
  }

  @override
  Future<dynamic> obtener(String nombreTabla, Map<String, dynamic> map,
      String campo, int id) async {
    campo = campo == null ? 'id' : campo;
    final res = await _database
        .query(nombreTabla, where: " $campo = ?", whereArgs: [id]);
    return res.isNotEmpty ? res.first : null;
  }

  @override
  Future<dynamic> insertar(String nombreTabla, Map<String, dynamic> map) async {
    dynamic res = await _database.insert(nombreTabla, map);
    if (res != null && res > 0) map['id'] = res;
    return map;
  }

  @override
  Future<dynamic> actualizar(String nombreTabla, Map<String, dynamic> map,
      String campo, int id) async {
    dynamic respuesta;
    campo = campo == null ? 'id' : campo;
    final res = await _database
        .update(nombreTabla, map, where: " $campo = ?", whereArgs: [id]);
    if (res != null && res == 1) respuesta = map;
    return respuesta;
  }

  @override
  Future<Map<String, dynamic>> eliminar(String nombreTabla,
      Map<String, dynamic> map, String campo, int id) async {
    campo = campo == null ? 'id' : campo;
    final res = await _database
        .delete(nombreTabla, where: " $campo = ?", whereArgs: [id]);
    if (res == 1)
      return map;
    else
      return null;
  }

  @override
  Future<List<dynamic>> sqlConsultar(String sql) async {
    await obtenerDB();
    final respuesta = await _database.rawQuery(sql);
    return respuesta;
  }

  @override
  Future<dynamic> sqlInsertar(String sql) async {
    final respuesta = await _database.rawInsert(sql);
    return respuesta;
  }

  @override
  Future<dynamic> sqlActualizar(String sql) async {
    final respuesta = await _database.rawUpdate(sql);
    return respuesta;
  }

  @override
  Future<dynamic> sqlEliminar(String sql) async {
    final respuesta = await _database.rawDelete(sql);
    return respuesta;
  }

  @override
  void cerrar() {
    _database?.close();
  }
}
