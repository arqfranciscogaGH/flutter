//  librerias internas de flutter
import 'package:flutter/material.dart';

//  librerias importadas flutter

//  librerias importadas flutter


//  librerias  proyecto

import '../nucleo/nucleo.dart';
// import '../nucleo/negocio/negocio.dart';
import '../paquetesExternos/paquetesExternos.dart';

import '../nucleo/negocio/controladorEstado/controladorEstado.dart';

//  librerias externas  flutter


// Descripcion de funcionalidad 
//
// administrar de tema
//
 
const COLOR_PRIMARIO="colorPrimario";
const COLOR_SECUNDARIO="colorSecundario";
const ES_OBSCURO="EsModoObscuro";

class AdministradorTema {
    //  Tema
    static void obtenerTema() {
      obtenerColorTema();
      obtenerColorSecundario();
      obtenerEsModoObscuro();
      cambiarColores();
    }
    static void  cambiarTema() {
        Tema.crearTemaPersonalizado();
    }
    static void  guardarTema() {
        guardarColorTema( ParametrosSistema.colorTema);
        guardarColorSecundario( ParametrosSistema.colorSecundario);
        guardarEsModoObscuro(ParametrosSistema.esModoObscuro);
    }

    //   Color tema
    static void obtenerColorTema() {
        String  color = Preferencias.obtener(COLOR_PRIMARIO, ParametrosSistema.colorTema);
        ParametrosSistema.colorTema = color;
        cambiarColores();
    }
    static void  cambiarColorTema(String color) {
        ParametrosSistema.colorTema = color;
        cambiarColores();
   }
   static void  guardarColorTema(String color) {
        Preferencias.guardar(COLOR_PRIMARIO, color);
   }

   static void crearTemaPersonalizado()
   {
        cambiarColores();
        Tema.crearTemaPersonalizado();
   }

    //   Color Secundario

    static void obtenerColorSecundario() {
        String  color = Preferencias.obtener(COLOR_SECUNDARIO, ParametrosSistema.colorSecundario);
        ParametrosSistema.colorSecundario = color;
        cambiarColores();
    }
    static void  cambiarColorSecundario(String color) {
        ParametrosSistema.colorSecundario = color;
        cambiarColores();
   }
   static void  guardarColorSecundario(String color) {
        Preferencias.guardar(COLOR_SECUNDARIO, color);
   }
   
    //  modo obscuro
    static void obtenerEsModoObscuro() {
        bool  esModoObscuro = Preferencias.obtener(ES_OBSCURO, ParametrosSistema.esModoObscuro);
        ParametrosSistema.esModoObscuro = esModoObscuro;
    }
    static void  cambiarEsModoObscuro(bool esModoObscuro) {
        ParametrosSistema.esModoObscuro = esModoObscuro;
    }
     static void  guardarEsModoObscuro(bool esModoObscuro) {
         Preferencias.guardar(ES_OBSCURO, esModoObscuro);
    }

    //  cambiar Colores
    static void  cambiarColores() {
       
        ParametrosSistema.colorTexto = ParametrosSistema.colorTexto;
        ParametrosSistema.colorIcono = ParametrosSistema.colorTema;
        ParametrosSistema.colorBorde = ParametrosSistema.colorTema;
     

        ParametrosSistema.colorBotonFondo = ParametrosSistema.colorTema;
        // ParametrosSistema.colorBotonIcono = 'negro';    
        // ParametrosSistema.colorBotonBorde = 'azul';   
        // ParametrosSistema.colorBotonTexto = 'blanco';   

        ParametrosSistema.colorCapturaFondo = ParametrosSistema.colorTema;
        ParametrosSistema.colorCapturaIcono = ParametrosSistema.colorTema;  

        ParametrosSistema.colorItemListaFondo = ParametrosSistema.colorTema;
        ParametrosSistema.colorItemListaIcono = ParametrosSistema.colorTema; 

        ParametrosSistema.colorOpcionMenuFondo = ParametrosSistema.colorTema;  
        ParametrosSistema.colorOpcionMenuIcono = ParametrosSistema.colorTema;     
    }
}
