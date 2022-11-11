//  librerias internas de flutter

import 'package:flutter/material.dart';

//  librerias  proyecto

import '../nucleo/nucleo.dart';
import '../aplicacion/aplicacion.dart';

//  librerias externas  flutter

// Descripcion de funcionalidad
//  generar  rutas para opciones de menus
//

//  Variables

//  Propiedades

//  Métodos

List<ElementoLista> definirPaginas() {
  List<ElementoLista> paginas = [];

  paginas.add(ElementoLista(
      pagina: menu_principal_pagina(), ruta: 'menu_principal_pagina'));
  paginas.add(ElementoLista(pagina: tema_pagina(), ruta: 'tema_pagina'));
  paginas.add(ElementoLista(
      pagina: preferencias_pagina(), ruta: 'preferencias_pagina'));

  paginas.add(ElementoLista(
      pagina: Modelo_pagina_lista(), ruta: 'Modelo_pagina_lista'));
  paginas.add(ElementoLista(
      pagina: Modelo_pagina_captura(), ruta: 'Modelo_pagina_captura'));

  paginas.add(ElementoLista(pagina: botones_pagina(), ruta: 'botones_pagina'));
  paginas.add(ElementoLista(pagina: prueba_pagina(), ruta: 'prueba_pagina'));
  paginas.add(ElementoLista(pagina: Venta_lista(), ruta: 'Venta_lista'));
  paginas.add(ElementoLista(pagina: Venta_captura(), ruta: 'Venta_captura'));
  return paginas;
}

generarRuta(BuildContext context, dynamic settings) {
  final arguments = settings.arguments;
  // switch (settings.name) {
  //   case 'inicio':
  //       Accion.hacer(context,  ElementoLista( pagina:  pagina_inicio() ) ,settings );
  //       break;
  //   case 'pagina_acceso':
  //       return pagina_acceso();
  //   case 'pagina_menu_principal':
  //       Accion.hacer(context,  ElementoLista( pagina:  pagina_menu_principal() ) ,settings );
  //       break;
  //   case 'pagina_preferencias':
  //       return pagina_preferencias();
  //   case 'pagina_tema':
  //       return pagina_tema();
  //   default:
  //     return null;
  // }
}

Map<String, WidgetBuilder> ObtenerRutas() {
  return <String, WidgetBuilder>{
    // '/': (BuildContext context) => pagina_inicio(),
    // 'pagina_inicio': (BuildContext context) => pagina_inicio(),
    // 'pagina_acceso': (BuildContext context) => pagina_acceso(),
    'pagina_menu_principal': (BuildContext context) => menu_principal_pagina(),
    'pagina_prueba': (BuildContext context) => prueba_pagina(),
    'pagina_preferencias': (BuildContext context) => preferencias_pagina(),
    'pagina_tema': (BuildContext context) => tema_pagina(),

    // 'pagina_Seguimiento_lista': (BuildContext context) => pagina_Seguimiento_lista(),

    // 'pagina_Suscripcion_lista': (BuildContext context) =>
    //     pagina_Suscripcion_lista(
    //         paginaSiguiente: 'pagina_Suscripcion_captura',
    //         accionPagina: "avanzar"),
    // 'pagina_Suscripcion_captura': (BuildContext context) =>
    //     pagina_Suscripcion_captura(
    //         paginaSiguiente: 'pagina_Suscripcion_lista',
    //         accionPagina: "avanzar"),
    // 'pagina_Usuario_lista': (BuildContext context) => pagina_Usuario_lista(
    //     paginaSiguiente: 'pagina_Usuario_captura', accionPagina: "avanzar"),
    // 'pagina_Usuario_captura': (BuildContext context) => pagina_Usuario_captura(
    //     paginaSiguiente: 'pagina_Usuario_lista', accionPagina: 'avanzar'),
  };
}
