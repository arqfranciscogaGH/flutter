//  librerias internas de flutter

//  librerias importadas flutter

import '../../nucleo/negocio/modelo/endidad/Sesion.dart';
import '../../paquetesExternos/paquetesExternos.dart';

//  librerias  proyecto

class AdministrarSesion {
    static void asignar ({String nombre="", String cuenta="", int idUsuario=0 , int idSuscriptor=0 , String perfiles="" , String grupos=""  })
    {
        Sesion.nombre = nombre;
        Preferencias.guardar("nombre", nombre);
        Sesion.cuenta = nombre;
        Preferencias.guardar("cuenta", cuenta);   
        Sesion.nombre = nombre;
        Preferencias.guardar("idUsuario", idUsuario);   
        Sesion.nombre = nombre;
        Preferencias.guardar("idSuscriptor", idSuscriptor);    
        Sesion.perfiles = perfiles;      
        Preferencias.guardar("perfiles", perfiles);   
        Sesion.grupos = grupos;
        Preferencias.guardar("grupos", grupos);           
    }
    static void obtener ()
    {
        Sesion.nombre = Preferencias.obtener("nombre", Sesion.nombre);
        Sesion.cuenta = Preferencias.obtener("cuenta", Sesion.cuenta);
        Sesion.idUsuario = Preferencias.obtener("idUsuario", Sesion.idUsuario);
        Sesion.idSuscriptor = Preferencias.obtener("idSuscriptor", Sesion.idSuscriptor);
        Sesion.perfiles = Preferencias.obtener("perfiles", Sesion.perfiles);
        Sesion.grupos = Preferencias.obtener("grupos", Sesion.grupos);   
    }
}
