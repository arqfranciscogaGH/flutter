

//  librerias internas de flutter

//  librerias importadas flutter

//  librerias importadas flutter
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

//  librerias  proyecto

import '../nucleo/nucleo.dart';
import '../administracion/administracion.dart';

//  librerias externas  flutter

import '../paquetesExternos/paquetesExternos.dart';

// Descripcion de funcionalidad 
//
//  Inicializacion variables
//

class InicializacionVariables {
    static void iniciar  () async
   {
      valoresSincronos  () ;
      await valoresAsicronos () ;
   }
   static void valoresSincronos  () 
   {
   

   
        late  ElementoLista elementoLista;
        elementoLista= ElementoLista();
        elementoLista.titulo="fga";
        InjeccionDependencia.agregar<ElementoLista>(elementoLista);
        //     ContextoAplicacion.iniciar();
   }
   static Future valoresAsicronos () async
   {
      AdministradorIdioma.obtenerIdioma();
      // Inicializar datos  formateo e  idioma ,  con esta linea  se  evita  error
      initializeDateFormatting(ParametrosSistema.idioma);
      Intl.defaultLocale = ParametrosSistema.idioma; 

      AdministradorTema.obtenerTema();
      AdministradorSesion.obtener();
      await Traductor.cargar();

      int numero =10;
      Preferencias.guardar("numero", numero);
      print (Preferencias.obtener ("numero", numero));
      
   }
}
