//  librerias internas de flutter

//  librerias importadas flutter

//  librerias  proyecto


import '../nucleo/negocio/negocio.dart';
import '../paquetesExternos/paquetesExternos.dart';

//  librerias externas  flutter


// Descripcion de funcionalidad 
//
// administrar la sesion de usuarios

const IDIOMA ="idioma";

class AdministradorIdioma {

    static void obtenerIdioma() {
        String  idioma = Preferencias.obtener(IDIOMA, ParametrosSistema.idioma);
        ParametrosSistema.idioma = idioma;
    }

    static void  cambiarIdioma(String idioma) {
        ParametrosSistema.idioma = idioma;
    }
    static void  guardarIdioma() {
        Preferencias.guardar(IDIOMA, ParametrosSistema.idioma);

    }
    
}