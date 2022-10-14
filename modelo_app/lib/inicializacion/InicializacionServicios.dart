
//  librerias internas de flutter


//  librerias  proyecto



//  librerias externas  flutter

import '../nucleo/nucleo.dart';
import '../paquetesExternos/paquetesExternos.dart';

// Descripcion de funcionalidad 
//
//  InicializacionServicios
//




// Descripcion de funcionalidad 
// inicializacion de  clases para inciar la aplicacion
//




class InicializacionServicios {

    static void inicicializarServiciosSincronos  () 
   {
      InjeccionDependencia.iniciar();
     
 
    
   }
   static Future inicicializarServiciosAsincronos  () async
   {
        await Preferencias.instanciar();
      
   }
}
