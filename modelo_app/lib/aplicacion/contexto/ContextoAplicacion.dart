//  librerias internas de flutter
import 'package:flutter/material.dart';

//  librerias importadas flutter

//  librerias  proyecto

import '../db/DBAplicacion.dart';

export '../db/DBAplicacion.dart';

class ContextoAplicacion {
  static ContextoAplicacion? _contextoAplicacion;

  static DBAplicacion? _db;

  static DBAplicacion get db {
    if (_db == null) iniciar();
    return _db!;
  }

  ContextoAplicacion() {}

  static iniciar() {
    // _accesoDB = AccesoBD();
    // _accesoDB!.definirPersistencia(_configuracionPersitencia);
    _db = DBAplicacion();
    // _accesoDB!.abrir();
    // _BD.sqlConsultar( 'select Persona.nombre, sum(Mov.importe) from Persona left join Mov ON Persona.id=Mov.idPersona group by Persona.nombre').then( ( listaRespuesta)
    // {
    //     List<Map> datos = listaRespuesta;
    //     print (datos);
    // });
  }

  static ContextoAplicacion obtener() {
    if (_contextoAplicacion == null)
      _contextoAplicacion = new ContextoAplicacion();
    return _contextoAplicacion!;
  }
}
