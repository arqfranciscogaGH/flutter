//  librerias internas de flutter
import 'package:flutter/material.dart';
import 'dart:io';

//  librerias importadas flutter
// import 'package:image_picker/image_picker.dart';

//  librerias  proyecto

//  librerias  proyecto

import '../../../../inicializacion/inicializacion.dart';
import '../../../../configuracion/configuracion.dart';
import '../../../../administracion/administracion.dart';

import '../../../../nucleo/nucleo.dart';
import '../../../../aplicacion/aplicacion.dart';
import '../../../contexto/contexto.dart';
import '../../../negocio/controladorEstado/controladorEstado.dart';

//  librerias externas  flutter

import '../../../../paquetesExternos/paquetesExternos.dart';

class VentaUI {
  VentaUI({this.tabla, this.controlEstadoUI});

  // dynamic iniciarEntidad<T extends EntidadBase>(AccesoTabla<T> tabla) {
  //   tabla.entidad = tabla.iniciar();
  //   return tabla.entidad;
  // }

  AccesoTabla<Venta>? tabla;
  ControlEstadoUI? controlEstadoUI;
  BuildContext? context;
  GlobalKey<ScaffoldState>? scaffoldKey;
  dynamic widget;
  bool guardar = false;
  //  dispose widget
  // void dispose() {

  // }

  //  obtener controlEstadoUI
  ControlEstadoUI get controlEstado {
    return controlEstadoUI!;
  }

  //  asignar  controlEstadoUI

  set controlEstado(ControlEstadoUI controlEstadoUI) {
    tabla!.controlEstadoUI = controlEstadoUI;
    controlEstadoUI = controlEstadoUI;
    // if (tabla.datos != null) _lista = mapTolista(tabla.datos);
  }

  iniciar(BuildContext context, GlobalKey<ScaffoldState> scaffoldKey,
      [dynamic widget]) {
    this.controlEstadoUI = controlEstadoUI;

    this.context = context;
    this.scaffoldKey = scaffoldKey;
    this.widget = widget;
  }

  //
  //  interfaz de UI  comun
  //

  //
  // crear elemento de lista
  //

  Widget crearElementoEntidad(
      BuildContext context, dynamic entidad, ElementoLista ele) {
    ElementoLista elemento = ElementoLista();

    elemento.id = entidad.id;
    elemento.titulo = entidad.id.toString() + ', : ' + entidad.nombre;
    elemento.subtitulo = entidad.nombre;
    elemento.icono = ele.icono;
    elemento.accion = ele.accion;
    elemento.callBackAccion = ele.callBackAccion;
    elemento.ruta = ele.ruta;
    elemento.accion2 = ele.accion2;
    elemento.callBackAccion2 = ele.callBackAccion2;

    elemento.icono3 = ele.icono3;
    elemento.accion3 = ele.accion3;
    elemento.ruta3 = ele.ruta3;
    elemento.callBackAccion3 = ele.callBackAccion3;

    elemento.operacion = ele.operacion;
    // if (elemento.color == null)
    //   elemento.color = Theme.of(context).primaryColor.withOpacity(0.6);

    Widget? elementos;
    if (ele.operacion == eOperacion.consultar) {
      elementos = Listas.crearElementoListaDismisibleConAcciones(
          context, elemento, ele.accion!, ele.accion2!);
    } else if (ele.operacion == eOperacion.filtrar) {
      elementos = Listas.crearElementoListaDismisibleConAcciones(
          context, elemento, ele.accion!, ele.accion2!);
    }
    // if (ele.operacion == eOperacion.consultar) {
    //   elementos = Listas.crearElementoConAcciones(context, elemento);
    // } else if (ele.operacion == eOperacion.filtrar) {
    //   elementos = Listas.crearElementoConAcciones(context, elemento);
    // }
    return elementos!;
  }

  //
  //  Crear  Boton  acciones
  //

  Column crearBotonesAcciones(
      BuildContext context, activarAcciones, ElementoLista accion) {
    Column? columna;
    if ((activarAcciones != null && activarAcciones))
      columna = Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          // FloatingActionButton (
          //   heroTag: "btn10",
          //   child: Icon (Icons.zoom_in ),
          //   onPressed: () {
          //     },
          // ),

          Boton.crearBotonFlotante(context, accion),
        ],
      );
    return columna!;
  }

  //
  //  accciones
  //
  //
  //  acccion   Agregar
  //
  void agregarElemento(BuildContext context, ElementoLista elemento) {
    ContextoUI.iniciarCaptura = true;
    dynamic entidad = tabla!.entidad.iniciar();
    tabla!.entidad = entidad;
    ContextoAplicacion.db.tablaVenta!.entidad = entidad;
    // se  usa las siguientes si requiere callback o ir otra pagina
    if (elemento.callBackAccion != null)
      elemento.callBackAccion!(context, elemento, entidad);
    // if  (elemento.ruta!=null)
    //      Accion.hacer(context, ElementoLista(ruta:elemento.ruta));
  }

  //
  //  acccion   Seleccionar
  //
  void seleccionarElemento(BuildContext context, ElementoLista elemento,
      [Function? metodorRespuestaObtener = null]) {
    obtenerEntidad(context, elemento, metodorRespuestaObtener);
    // provider!.obtenerEntidad(context, elemento, elemento.callBackAccion!);
    // obtenerEntidadDeLista(context,elemento,  elemento.callBackAccion);
  }

  void seleccionarElemento3(BuildContext context, ElementoLista elemento) {
    obtenerEntidad(context, elemento);
    // provider!.obtenerEntidad(context, elemento, elemento.callBackAccion!);
    // obtenerEntidadDeLista(context,elemento,  elemento.callBackAccion);
  }

  //
  //  acccion    Eliminar
  //
  void eliminarElemento(BuildContext context, ElementoLista elemento) {
    String titulo = Traductor.obtenerAtrbuto(
        'pagina_Comun', 'accionConfirmarEliminacion', 'titulo');
    String mensaje = Traductor.obtenerAtrbuto(
        'pagina_Comun', 'accionConfirmarEliminacion', 'mensaje');
    String icono = Traductor.obtenerAtrbuto(
        'pagina_Comun', 'accionConfirmarEliminacion', 'icono');
    String opciones = Traductor.obtenerAtrbuto(
        'pagina_Comun', 'accionConfirmarEliminacion', 'opciones');
    String mensajeOperacion =
        Traductor.obtenerAtrbuto('pagina_Comun', 'operacionExitosa', 'mensaje');

    dynamic opcion = opciones.split(" ");

    List<ElementoLista> elementos = [];
    // se debe pasar como argumeto  el elemento eleccionado
    elementos.add(new ElementoLista(
        titulo: opcion[0],
        accion: comfirmarEliminarElemento,
        argumento: elemento));
    elementos.add(new ElementoLista(
        titulo: opcion[1],
        accion: comfirmarEliminarElemento,
        argumento: elemento));

    // Dialogo.mostrarVentanaOpciones(context, icono, titulo, mensaje, elementos);
  }

  void comfirmarEliminarElemento(BuildContext context, ElementoLista elemento) {
    // dynamic entidad =
    //     provider!.obtenerEntidadDeLista(context, elemento.argumento, null);
    // se debe pasar como argumeto  el elemento eleccionado
    elemento.argumento.valor = elemento.titulo;
    // if (elemento.argumento.valor.toString().trim().toLowerCase() == "si")
    //   provider!.eliminarEntidad(
    //       context, elemento.argumento, elemento.argumento.callBackAccion2);
    // else
    //   elemento.argumento.callBackAccion2(context, elemento.argumento, entidad);
  }

  //
  //   acccion   guardar  informacion
  //
  void guardarEntidad(BuildContext context, ElementoLista elemento) {
    String pagina = elemento.argumento;

    // if (!guardar) {
    //   guardar = true;
    //   GlobalKey<FormState> keyFormulario =
    //       ContextoUI.obtenerKey(pagina).keyFormulario;

    //   if (!keyFormulario.currentState.validate()) return;
    //   keyFormulario.currentState.save();
    //   dynamic entidadCaptura = provider.entidad;

    //   if (entidadCaptura.id == null || entidadCaptura.id == 0) {
    //     entidadCaptura.idSuscriptor = obtenerIdSuscriptor();
    //     provider.insertarEntidad(
    //         context, elemento, entidadCaptura, elemento.callBackAccion);
    //     //avanzarflujoTrabajo(context, elemento, entidadCaptura, "INICIAR");
    //   } else {
    //     provider.modificarEntidad(
    //         context, elemento, entidadCaptura, elemento.callBackAccion2);
    //     avanzarflujoTrabajo(context, elemento, entidadCaptura, "", "MODIFICAR");
    //   }
    // imprimir(entidadCaptura, "despues de guardar");
    guardar = false;
  }

//
//   respuestas
//
//
//   respuestas   Agregar
//
  void respuestaAgregar(BuildContext context, elemento, dynamic entidad) {
    String mensaje =
        Traductor.obtenerAtrbuto('pagina_Comun', 'accionAgregar', 'mensaje');
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(mensaje + " : " + entidad.nombre)));
    if (elemento.ruta != null)
      Accion.hacer(context, OpcionesMenus.obtener(elemento.ruta));
  }

//
//   respuestas   Seleccionar
//

  void respuestaSeleccionar(
      BuildContext context, ElementoLista elemento, dynamic entidad) {
    String mensaje = Traductor.obtenerAtrbuto(
        'pagina_Comun', 'accionSeleccionar', 'mensaje');
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(mensaje + " : " + entidad.nombre)));
    if (elemento.ruta != null /* && elemento.operacion==eOperacion.Consultar */)
      Accion.hacer(context, OpcionesMenus.obtener(elemento.ruta!));
    else if (elemento.ruta == null && elemento.operacion == eOperacion.filtrar)
      Navigator.pop(context);
  }

  void respuestaSeleccionar3(
      BuildContext context, ElementoLista elemento, dynamic entidad) {
    String mensaje = Traductor.obtenerAtrbuto(
        'pagina_Comun', 'accionSeleccionar', 'mensaje');
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(mensaje + " : " + entidad.nombre)));
    if (elemento.ruta != null /* && elemento.operacion==eOperacion.Consultar */)
      Accion.hacer(context, OpcionesMenus.obtener(elemento.ruta!));
    else if (elemento.ruta == null && elemento.operacion == eOperacion.filtrar)
      Navigator.pop(context);
  }
//
//  respuestas   Eliminar
//

  void respuestaEliminar(
      BuildContext context, ElementoLista elemento, dynamic entidad) {
    String titulo =
        Traductor.obtenerAtrbuto('pagina_Comun', 'accionEliminar', 'titulo');
    String mensaje =
        Traductor.obtenerAtrbuto('pagina_Comun', 'accionEliminar', 'mensaje');
    String icono =
        Traductor.obtenerAtrbuto('pagina_Comun', 'accionEliminar', 'icono');
    String opciones =
        Traductor.obtenerAtrbuto('pagina_Comun', 'accionEliminar', 'opciones');
    String mensajeOperacion =
        Traductor.obtenerAtrbuto('pagina_Comun', 'operacionExitosa', 'mensaje');

    if (elemento.valor.toString().trim().toLowerCase() == "si") {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(mensaje + " : " + entidad.nombre)));
    }
  }

//
//   repuesta guardar  informacion
//
  void respuestaGuardar(BuildContext context, elemento, dynamic entidad) {
    print("respuestaGuardar");
    print(ContextoAplicacion.db.tablaVenta!.entidad.id);
    print(entidad.id);

    String mensaje =
        Traductor.obtenerAtrbuto('pagina_Comun', 'operacionExitosa', 'mensaje');

    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(mensaje + " : " + entidad.nombre)));
    entidad = tabla!.entidad.iniciar();
    if (this.widget == null)
      Accion.regresar(context);
    else if (this.widget.accionPagina == "avanzar" &&
        this.widget.paginaSiguiente != null)
      Accion.hacer(context, OpcionesMenus.obtener(this.widget.paginaSiguiente));
    else if (this.widget.accionPagina == "regresar" &&
        this.widget.paginaAnterior != null)
      Accion.hacer(context, OpcionesMenus.obtener(this.widget.paginaAnterior));
    // else if (this.widget.accionPagina == null || this.widget.accionPagina == "")
    //   provider.consultarEntidad(Cliente().iniciar(), null);
  }
//
//   respuestas   Insertar
//

  void respuestaInsertar(
      BuildContext context, ElementoLista elemento, dynamic entidad) {
    // avanzarflujoTrabajo(context, elemento, entidad, "LINEAIV", "INICIAR");

    String titulo =
        Traductor.obtenerAtrbuto('pagina_Comun', 'accionInsertar', 'titulo');
    String mensaje =
        Traductor.obtenerAtrbuto('pagina_Comun', 'accionInsertar', 'mensaje');
    String icono =
        Traductor.obtenerAtrbuto('pagina_Comun', 'accionModificar', 'icono');
    String opciones =
        Traductor.obtenerAtrbuto('pagina_Comun', 'accionModificar', 'opciones');

    // if (elemento.callBackAccion3 != null)
    //   elemento.callBackAccion3(context, elemento, entidad);
    // Dialogo.mostrarAlerta(context, icono, titulo, mensaje, opciones);
  }
//
//   respuestas   Modificar
//

  void respuestaModificar(
      BuildContext context, ElementoLista elemento, dynamic entidad) {
    String titulo =
        Traductor.obtenerAtrbuto('pagina_Comun', 'accionModificar', 'titulo');
    String mensaje =
        Traductor.obtenerAtrbuto('pagina_Comun', 'accionModificar', 'mensaje');
    String icono =
        Traductor.obtenerAtrbuto('pagina_Comun', 'accionModificar', 'icono');
    String opciones =
        Traductor.obtenerAtrbuto('pagina_Comun', 'accionModificar', 'opciones');

    // if (elemento.callBackAccion3 != null)
    //   elemento.callBackAccion3(context, elemento, entidad);
    // Dialogo.mostrarAlerta(context, icono, titulo, mensaje, opciones);
  }

  List<dynamic> consultarTabla(BuildContext context, dynamic e,
      [Function? metodoRespuesta = null]) {
    List<dynamic>? lista = [];
    tabla!.consultarTabla(e).then((respuesta) {
      print(respuesta);
      if (respuesta != null) {
        lista = respuesta;
        if (metodoRespuesta != null)
          metodoRespuesta(respuesta);
        else if (controlEstadoUI != null) controlEstadoUI!.actualizar();
      }
    });
    return lista!;
  }

  List<dynamic> filtrarTabla(
      BuildContext context, dynamic e, String campo, dynamic valor,
      [Function? metodoRespuesta = null]) {
    List<dynamic>? lista;
    tabla!.filtrarTabla(e, campo, valor).then((respuesta) {
      print(respuesta);
      if (respuesta != null) {
        lista = respuesta;
        if (metodoRespuesta != null)
          metodoRespuesta(respuesta);
        else if (controlEstadoUI != null) controlEstadoUI!.actualizar();
      }
    });
    return lista!;
  }

  dynamic filtrarLista(
      BuildContext context, ElementoLista elemento, String campo, dynamic valor,
      [Function? metodorRespuestaObtener = null]) {
    dynamic respuesta;
    tabla!.entidad == tabla!.iniciar();
    tabla!.entidad.id = elemento.id;
    List<dynamic> lista = tabla!.resultado.datos;
    if (lista != null) respuesta = lista.where((s) => s[campo] == valor).first;

    tabla!.entidad = respuesta != null
        ? tabla!.entidad.fromMap(respuesta)
        : tabla!.iniciar();
    if (metodorRespuestaObtener != null)
      metodorRespuestaObtener(context, elemento, tabla!.entidad);
    return tabla!.entidad;
  }

  void obtenerEntidad(BuildContext context, ElementoLista elemento,
      [Function? metodoRespuesta = null]) {
    dynamic entidad = tabla!.iniciar();
    entidad.id = elemento.id;
    tabla!.obtener(entidad).then((respuesta) {
      print(respuesta);
      if (respuesta != null) {
        tabla!.entidad = respuesta;
        if (metodoRespuesta != null)
          metodoRespuesta(context, elemento, entidad);
        else if (controlEstadoUI != null) controlEstadoUI!.actualizar();
      }
    });
  }

//
//  soporte  de  cargan fotos ,video  en  galeria  y  camara
//

// seleccionarFoto(BuildContext context) async {
//   Imagen.capturar(ImageSource.gallery).then((imagen) {
//     print("imagen foto:  ${imagen?.path} ");
//     actualizarImagen(context, imagen);
//   });
// }

// tomarFoto(BuildContext context) async {
//   Imagen.capturar(ImageSource.camera).then((imagen) {
//     print("imagen camara :  ${imagen?.path} ");
//     actualizarImagen(context, imagen);
//   });
// }

// actualizarImagen(BuildContext context, File imagen) {
//   if (imagen != null) {
//     dynamic entidad = provider.entidad;
//     entidad.rutaFoto = imagen?.path;
//     provider.entidad = entidad;
//     ElementoLista elemento = ElementoLista(titulo: "Nombre");
//     Dialogo.mostrarAlerta(context, "info", "Imagen capturada",
//         "Se actualizará la imagen", "Aceptar");
//   }
//   // print ( "imagen actualizada:  ${ imagen?.path } " );
//   // print ( "path imagen actualizada:  ${entidadCaptura.rutaFoto} " );
// }

//
// imprimir  información
//
  void imprimir(dynamic entidadCaptura, [String comentario = '']) {
    comentario = comentario == null ? " imprimir " : comentario;
    print(comentario);
    print(" entidad        :${entidadCaptura.tabla}");
    print(" id             :${entidadCaptura.id}");
    print(" nombre         :${entidadCaptura.nombre}");
    print(entidadCaptura.toMap());
  }
//
// mapear datos de scaneo
//

}
