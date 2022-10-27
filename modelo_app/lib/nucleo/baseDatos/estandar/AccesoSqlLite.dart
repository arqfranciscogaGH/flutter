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
  Database? _database;

  ConfiguracionAccesoBD? _configuracion;
  EntidadTablaTexto? _tabla;
  EntidadRegistroTexto? _registro;

 //  constructor
  AccesoSqlLite ()
  {
   
    _tabla= EntidadTablaTexto();
    _registro= EntidadRegistroTexto(); 
     iniciar(); 
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
  abrir(/* String pnombreDB,List<EntidadBase> ptablas */) async {
      /*     super.nombreDB=pnombreDB;
      super.tablas=ptablas;
      tablas=ptablas;
      nombreDB = nombreDB; */
      // await obtenerDB();
 
      await database;

  } 


  // métodos


Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
}

//   // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    // Directory documentsDirectory = await getApplicationDocumentsDirectory();
    //  String path = join(documentsDirectory.path, configuracion.nombreBD!);
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, configuracion.nombreBD!+'.db');
    _database= await openDatabase(path,
        version: configuracion.version,
        onCreate: _onCreate);
        //  onCreate: (Database db, int version) async {
        //     await db.execute( 'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');
        //     if (configuracion.tablas != null)
        //     {
        //         configuracion.tablas!.forEach((tabla) {
        //             print(tabla.sqlTabla());
        //             print("____________________________");
        //             db.execute(tabla.sqlTabla());
        //         });
        //      }
        //     // _database=db;
        //     // List<Map> list = await db.rawQuery('SELECT * FROM Test');
        // });
        // List<Map> list = await _database!.rawQuery('SELECT * FROM Test');
     return _database;
  }

  Future  _onCreate(Database db, int version) async {
       await db.execute( 'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');

       if (configuracion.tablas != null)
       {
          configuracion.tablas!.forEach((tabla) {
              print(tabla.sqlTabla());
              print("____________________________");
              db.execute(tabla.sqlTabla());
          });
       }
    return db;
  }

  // Future<Database> obtenerDB() async {
  //   if (_database != null) return _database!;
  //   _database = await crear();
  //   return _database!;
  // }

  // Future<Database> crear() async {
  //   Directory documentsDirectory = await getApplicationDocumentsDirectory();
  //   final path = join(documentsDirectory.path, configuracion.nombreBD! + '.db');
  //   print("path:  $path");
  //   print(this.configuracion.nombreBD);
  //   print(this.configuracion.tablas!.length);
  //   return await openDatabase(path,
  //       version: configuracion.version,
  //       onOpen: (db) {},
  //       onCreate: (Database db, int version) async {
  //       if (configuracion.tablas != null) {
  //         configuracion.tablas!.forEach((tabla) {
  //           print(tabla.sqlTabla());
  //           print("____________________________");
  //           db.execute(tabla.sqlTabla());
  //         });
  //       }
  //   });
  // }

  @override
  Future ejecutar(String sql) async {
    await _database!.execute(sql);
  }

  @override
  Future<List<dynamic>> consultarTabla(String nombreTabla) async {
    await database; // para se instanciar la database
    final respuesta = await _database!.query(nombreTabla);
    print(respuesta);
    return respuesta;
  }
  @override
  Future<List<dynamic>> consultar(String nombreTabla, Map<String, dynamic> map,
      String campo, dynamic valor) async {
    await database; // para se instanciar la database
    final respuesta = await _database!.query(nombreTabla, where: " $campo = ?", whereArgs: [valor]);
    print(respuesta);
    return respuesta;
  }
  @override
  Future<dynamic> obtener(String nombreTabla, Map<String, dynamic> map, String campo, dynamic valor) async {
    await database; // para se instanciar la database
    campo = campo == null ? 'id' : campo;
    final res = await _database!.query(nombreTabla, where: " $campo = ?", whereArgs: [valor]);
    return res.isNotEmpty ? res.first : null;
  }

  @override
  Future<dynamic> insertar(String nombreTabla, Map<String, dynamic> map) async {
    await database; // para se instanciar la database
    dynamic res = await _database!.insert(nombreTabla, map);
    if (res != null && res > 0) map['id'] = res;
    return map;
  }

  @override
  Future<dynamic> actualizar(String nombreTabla, Map<String, dynamic> map,String campo,  dynamic valor) async {
    await database; // para se instanciar la database
    dynamic respuesta;
    campo = campo == null ? 'id' : campo;
    final res = await _database!.update(nombreTabla, map, where: " $campo = ?", whereArgs: [valor]);
    if (res != null && res == 1) respuesta = map;
    return respuesta;
  }

  @override
  Future<Map<String, dynamic>> eliminar(String nombreTabla,Map<String, dynamic> map, String campo,  dynamic valor) async {
    await database; // para se instanciar la database
    campo = campo == null ? 'id' : campo;
    Map<String, dynamic>? m;
    final res = await _database!.delete(nombreTabla, where: " $campo = ?", whereArgs: [valor]);
    if (res == 1)
      return map;
    else
      return m!;
  }

  @override
  Future<List<dynamic>> sqlConsultar(String sql) async {
      final respuesta = await _database!.rawQuery(sql);
    return respuesta;
  }

  @override
  Future<dynamic> sqlInsertar(String sql) async {
    final respuesta = await _database!.rawInsert(sql);
    return respuesta;
  }

  @override
  Future<dynamic> sqlActualizar(String sql) async {
    final respuesta = await _database!.rawUpdate(sql);
    return respuesta;
  }

  @override
  Future<dynamic> sqlEliminar(String sql) async {
    final respuesta = await _database!.rawDelete(sql);
    return respuesta;
  }

  @override
  void cerrar() {
    _database?.close();
  }
}

