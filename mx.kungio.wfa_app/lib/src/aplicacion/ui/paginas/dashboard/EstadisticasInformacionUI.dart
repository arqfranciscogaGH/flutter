//  librerias internas de flutter
import 'package:flutter/material.dart';
import 'dart:convert';
//  librerias importadas flutter
import 'package:image_picker/image_picker.dart';

//  librerias  proyecto

import '../../../configuracion/configuracionAplicacion.dart';
import '../../../../nucleo/ui/ui.dart';
import '../../../contexto/contexto.dart';


import '../../../negocio/controlador/EstadisticasVistaControlador.dart';
export '../../../negocio/controlador/EstadisticasVistaControlador.dart';
import '../../../negocio/controlador/EstadisticasVistaDetalleControlador.dart';
export '../../../negocio/controlador/EstadisticasVistaDetalleControlador.dart';




class EstadisticasInformacionUI {
  EstadisticasInformacionUI({this.provider, this.idioma});

  EstadisticasVistaDetalleControlador provider;
  IdiomaAplicacion idioma;
  BuildContext context;
  GlobalKey<ScaffoldState> scaffoldKey;
  dynamic widget;
  
  iniciar(BuildContext context, GlobalKey<ScaffoldState> scaffoldKey,
      IdiomaAplicacion idioma,
      [dynamic widget]) {
    this.context = context;
    this.idioma = idioma;
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

 
    elemento.argumento=entidad;
    elemento.id =entidad.id  ;
    elemento.titulo = entidad.nombre ;
    elemento.subitulo ="#"+entidad.identificador + " "+String.fromCharCode(36)+" "+entidad.importe.toString() ;
    elemento.nota =entidad.estatus==null?"":entidad.estatus  + " : "+entidad.claveActividad+ ":"+entidad.actividad ;

    elemento.icono = ele.icono;
    elemento.ruta = ele.ruta;
    elemento.accion = ele.accion;
    elemento.callBackAccion = ele.callBackAccion;
   
    elemento.icono2 = ele.icono2;
    elemento.ruta2 = ele.ruta2;
    elemento.accion2 = ele.accion2;
    elemento.callBackAccion2 = ele.callBackAccion2;
 
    elemento.icono3 = ele.icono3;
    elemento.ruta3 = ele.ruta3;
    elemento.accion3 = ele.accion3;
    elemento.callBackAccion3 = ele.callBackAccion3;

    elemento.operacion = ele.operacion;

       
    Widget elementos;
    if (ele.operacion == eOperacion.Consultar) {
      elementos = Listas.crearElementoConAcciones( context, elemento);
    } else if (ele.operacion == eOperacion.Filtrar) {
      elementos = Listas.crearElementoConAcciones(context, elemento);
    }
    return elementos;
  }

  //
  //  Crear  Boton  acciones
  //

  Column crearBotonesAcciones(
      BuildContext context, activarAcciones, ElementoLista accion) {

    if (  accion!= null && ( activarAcciones != null && activarAcciones  ))
      return Column(
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
  }

  //
  //  acccioes
  //



  //
  //  acccion   Seleccionar
  //
  void seleccionarElemento(BuildContext context, ElementoLista elemento) {
    ContextoUI.guadarKey("estadisticas", null, null, elemento.argumento);
    provider.obtenerEntidadDeLista(context,elemento,  elemento.callBackAccion);
     
  }
  void seleccionarElemento2(BuildContext context, ElementoLista elemento) {
    ContextoUI.guadarKey("estadisticas", null, null, elemento.argumento);
    provider.obtenerEntidadDeLista(context,elemento,  elemento.callBackAccion);
     
  }
   void seleccionarElemento3(BuildContext context, ElementoLista elemento) {
     ContextoUI.guadarKey("estadisticas", null, null, elemento.argumento);
    provider.obtenerEntidadDeLista(context,elemento,  elemento.callBackAccion);
     
  }
  //
  //   respuestas
  //
  //

  //
  //   respuestas   Seleccionar
  //
  void respuestaSeleccionar(   BuildContext context, ElementoLista elemento, dynamic entidad) {
    String mensaje = this
        .idioma
        .obtenerAtributo("pagina_Comun", "accionSeleccionar", "mensaje");
    this.scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text(mensaje + " : " + entidad.nombre)));
    if (elemento.ruta != null /* && elemento.operacion==eOperacion.Consultar */)
      Accion.hacer(context, OpcionesMenus.obtener(elemento.ruta));
    else if (elemento.ruta == null && elemento.operacion == eOperacion.Filtrar)
      Navigator.pop(context);
  }

  void respuestaSeleccionar2(   BuildContext context, ElementoLista elemento, dynamic entidad) {
    String mensaje = this
        .idioma
        .obtenerAtributo("pagina_Comun", "accionSeleccionar", "mensaje");
    this.scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text(mensaje + " : " + entidad.nombre)));
    if (elemento.ruta != null /* && elemento.operacion==eOperacion.Consultar */)
      Accion.hacer(context, OpcionesMenus.obtener(elemento.ruta));
    else if (elemento.ruta == null && elemento.operacion == eOperacion.Filtrar)
      Navigator.pop(context);
  }
  void respuestaSeleccionar3(   BuildContext context, ElementoLista elemento, dynamic entidad) {
    // avanzarflujoTrabajo(context, elemento, entidad, "INICIAR");
    String mensaje = this
        .idioma
        .obtenerAtributo("pagina_Comun", "accionSeleccionar", "mensaje");
    this.scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text(mensaje + " : " + entidad.nombre)));
    if (elemento.ruta != null /* && elemento.operacion==eOperacion.Consultar */)
      Accion.hacer(context, OpcionesMenus.obtener(elemento.ruta));
    else if (elemento.ruta == null && elemento.operacion == eOperacion.Filtrar)
      Navigator.pop(context);
  }
  //
  //   acccion  y respuestas  de guardar  informacion
  //
  void guardarEntidad(BuildContext context, ElementoLista elemento) {
    String pagina = elemento.argumento;
    GlobalKey<FormState> keyFormulario =
        ContextoUI.obtenerKey(pagina).keyFormulario;

    if (!keyFormulario.currentState.validate()) return;
    keyFormulario.currentState.save();
    dynamic entidadCaptura = provider.entidad;


    // if (entidadCaptura.id == null || entidadCaptura.id == 0) {
    //   entidadCaptura.idSuscriptor = Configuracion.idSuscriptor;
    //   provider.insertarEntidad(
    //       context, elemento, entidadCaptura, elemento.callBackAccion);
    // } else {
    //   provider.modificarEntidad(
    //       context, elemento, entidadCaptura, elemento.callBackAccion2);
    // }

     imprimir(entidadCaptura, "despues de guardar");

    if (elemento.callBackAccion3 != null)
      elemento.callBackAccion3(context, elemento, entidadCaptura);
    
  }


  //
  //   repuesta guardar  informacion
  //
  void respuestaGuardar(BuildContext context, elemento, dynamic entidad) {

    String mensaje = this
        .idioma
        .obtenerAtributo("pagina_Comun", "operacionExitosa", "mensaje");
    this.scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text(mensaje + " : " + entidad.nombre)));
    if (this.widget.accionPagina == "avanzar" &&
        this.widget.paginaSiguiente != null)
      Accion.hacer(context, OpcionesMenus.obtener(this.widget.paginaSiguiente));
    else if (this.widget.accionPagina == "regresar" &&
        this.widget.paginaAnterior != null)
      Accion.hacer(context, OpcionesMenus.obtener(this.widget.paginaAnterior));
    //else if (this.widget.accionPagina == null || this.widget.accionPagina == "")
    // provider.consultarEntidad(EstadisticasFlujo().iniciar(), null);
  }
  //
  //  respuestas   Modificar
  //

  void respuestaModificar(
      BuildContext context, ElementoLista elemento, dynamic entidad) {
    String titulo =
        idioma.obtenerAtributo("pagina_Comun", "accionModificar", "titulo");
    String mensaje =
        idioma.obtenerAtributo("pagina_Comun", "accionModificar", "mensaje");
    String icono =
        idioma.obtenerAtributo("pagina_Comun", "accionModificar", "icono");
    String opciones =
        idioma.obtenerAtributo("pagina_Comun", "accionModificar", "opciones");
    Dialogo.mostrarAlerta(context, icono, titulo, mensaje, opciones);
    if (elemento.callBackAccion3 != null)
      elemento.callBackAccion3(context, elemento, entidad);
  }
}
 
//
// imprimir  información
//
void imprimir(dynamic entidadCaptura, [String comentario]) {
  comentario = comentario == null ? " imprimir " : comentario;
  print(comentario);
  print(" entidad        :${entidadCaptura.nombre}");
  print(" id             :${entidadCaptura.estatusFlujo}");
  print(" nombre         :${entidadCaptura.observacion}");
  print(entidadCaptura.toMap());
}
//
// mapear datos de scaneo
//
