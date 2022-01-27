//  librerias internas de flutter

//  librerias importadas flutter

//  librerias  proyecto

import '../../negocio/endidad/EntidadBase.dart';
import 'AccesoTabla.dart';

//
//   enumerados
//

enum ePersitencia {
  Ninguno,
  BaseDatos,
  NoSQLBaseDatos,
  Memoria,
  ApiREST,
}

enum eTipoDB { SQLLITE, HIVE, FireStore, FireBase, SqlServer, Ninguna }

// Base de datos
//    nombre
//    version
//    Tecnoligia   SQLLITE, HIVE

// Api REST
//    url API
//    Nombre controlador
// NoSQL Database
//    ?
//  MEMORIA
//    ninguno

// Sicronizacion
//
//    SincronizarServidor   trueo false
//    NumeroIntentos

class ConfiguracionAccesoBD {
  // persitencia
  ePersitencia persitencia; // BaseDatos,NoSQL Database ,Memoria ,Api REST
  eTipoDB tipoDB;
  // base de datos
  String nombreBD;
  int version;
  List<EntidadBase> tablas = List<EntidadBase>();

  // Api REST
  String urlApi;

  // Sicronizacion
  bool sincronizarServidor;
  int intentos;
  bool contadorRegistros = true;
  bool persitenciaPorDefecto;
  String llaveApi;
  dynamic parmetros;
  dynamic filtro;

  ConfiguracionAccesoBD(
      {this.persitenciaPorDefecto,
      this.persitencia,
      this.tipoDB,
      this.sincronizarServidor,
      this.intentos,
      this.contadorRegistros,
      this.nombreBD,
      this.version,
      this.tablas,
      this.urlApi,
      this.llaveApi,
      this.parmetros,
      this.filtro
      });
  AccesoTabla<T> agregarTabla<T extends EntidadBase>(T entidad) {
    if (tablas == null) tablas = List<EntidadBase>();
    tablas.add(entidad);
    return new AccesoTabla<T>(entidad: entidad);
  }
}
