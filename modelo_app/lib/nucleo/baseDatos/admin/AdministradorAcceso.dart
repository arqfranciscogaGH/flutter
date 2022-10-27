//  librerias internas de flutter

//  librerias importadas flutter

//  librerias  proyecto
import 'IAccesoBD.dart';
import 'AccesoBD.dart';
import 'ConfiguracionAccesoBD.dart';

import '../estandar/estandar.dart';
import '../google/google.dart';

class AdministradorAcceso {
  static IAccesoBD obtener(ConfiguracionAccesoBD configuracion) {
    IAccesoBD? abd;
    if (configuracion.persitenciaPorDefecto == true) // pesistencia por defecto general
    {
      abd = AccesoBD.instancia;
      AccesoBD.instancia.definirPersistencia(configuracion);
    }
    else if (configuracion.persitenciaPorDefecto != true) // pesistencia indidual  para una acceso
    {
      abd = definirPersistencia(configuracion);
    }
    return abd!;
  }

  static IAccesoBD definirPersistencia(ConfiguracionAccesoBD configuracion) {
    IAccesoBD? abd;
    if (configuracion.persitencia == ePersitencia.Memoria) {
      abd = AccesoMemoria();
      abd.configuracion = configuracion;
    }
    else if (configuracion.persitencia == ePersitencia.BaseDatos  && configuracion.tipoDB == eTipoDB.SQLLITE ) {
      abd = AccesoSqlLite();
      abd.configuracion = configuracion;
    } 
    // else if (configuracion.persitencia == ePersitencia.ApiREST) {
    //   abd = AccesoApi();
    //   abd.configuracion = configuracion;configuracion.tipoDB == eTipoDB.SQLLITE
    // } 
    else if (configuracion.persitencia == ePersitencia.NoSQLBaseDatos &&
        configuracion.tipoDB == eTipoDB.FireStore) {
      abd = AccesoFireStore();
      abd.configuracion = configuracion;
    }
    else if (configuracion.persitencia == ePersitencia.NoSQLBaseDatos &&
        configuracion.tipoDB == eTipoDB.FireBase) {
      abd = AccesoFireBase();
      abd.configuracion = configuracion;
    }
    return abd!;
  }
  static  abrir() async {
    IAccesoBD? abd = AccesoBD.instancia;
    
    if (abd != null && abd.configuracion.tipoDB == eTipoDB.SQLLITE) {
      await abd.abrir();
    }
  }
}
