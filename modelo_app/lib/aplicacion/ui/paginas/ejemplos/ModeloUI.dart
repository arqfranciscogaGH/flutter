//  librerias internas de flutter
import 'package:flutter/material.dart';

//  librerias importadas flutter


//  librerias  proyecto

import '../../../../nucleo/nucleo.dart';
import '../../../negocio/negocio.dart';

// import '../../../contexto/contexto.dart';








class ModuloUI {
    ModuloUI({ required this.provider});
    ModeloCE provider;
    BuildContext? context;
    GlobalKey<ScaffoldState>? scaffoldKey;
    dynamic widget;
    iniciar(   BuildContext context, GlobalKey<ScaffoldState> scaffoldKey, dynamic widget ) {
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

    elemento.argumento=entidad;
    elemento.id =entidad.id  ;
    elemento.titulo = entidad.nombre ;
    elemento.subtitulo =entidad.nombre ;
    elemento.nota =entidad.nombre;

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

       
    Widget? elementos;
    if (ele.operacion == eOperacion.consultar) {
      elementos = Listas.crearElementoConAcciones( context, elemento);
    } else if (ele.operacion == eOperacion.filtrar) {
      elementos = Listas.crearElementoConAcciones(context, elemento);
    }
    return elementos!;
  }

  //
  //  Crear  Boton  acciones
  //

  Widget crearBotonesAcciones( BuildContext context, bool activarAcciones, ElementoLista accion) {
  Widget? widget;
    if (  accion!= null && ( activarAcciones != null && activarAcciones  ))
      widget= Column(
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
      return widget! ;
  }
  //
  //  acccioes
  //



  //
  //  acccion   Seleccionar
  //
  void seleccionarElemento(BuildContext context, ElementoLista elemento) {
    // ContextoUI.guadarKey("seguimiento", null, null, elemento.argumento);
    // provider.obtenerEntidadDeLista(context,elemento,  elemento.callBackAccion);
     
  }
  void seleccionarElemento2(BuildContext context, ElementoLista elemento) {
     ContextoUI.guadarKey("seguimiento", null, null, elemento.argumento);
    // provider.obtenerEntidadDeLista(context,elemento,  elemento.callBackAccion);
     
  }
   void seleccionarElemento3(BuildContext context, ElementoLista elemento) {
     ContextoUI.guadarKey("seguimiento", null, null, elemento.argumento);
    // provider.obtenerEntidadDeLista(context,elemento,  elemento.callBackAccion);
     
  }
   //
  //   respuestas
  //
  //

  //
  //   respuestas   Seleccionar
  //
  void respuestaSeleccionar(   BuildContext context, ElementoLista elemento, dynamic entidad) {
    String mensaje =  Traductor.obtenerAtrbuto('pagina_Comun','accionSeleccionar', 'mensaje');

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(mensaje + " : " + entidad.nombre)));

   // ScaffoldMessengerState.show_snack_bar( SnackBar(content: Text(mensaje + " : " + entidad.nombre)));

    //  this.scaffoldKey!.currentState!.showSnackBar(
    //     SnackBar(content: Text(mensaje + " : " + entidad.nombre)));
    if (elemento.ruta != null /* && elemento.operacion==eOperacion.Consultar */)
      Accion.hacer(context, OpcionesMenus.obtener(elemento.ruta!));
    else if (elemento.ruta == null && elemento.operacion == eOperacion.filtrar)
      Navigator.pop(context);
  }

  void respuestaSeleccionar2(   BuildContext context, ElementoLista elemento, dynamic entidad) {

    String mensaje =  Traductor.obtenerAtrbuto('pagina_Comun','accionSeleccionar', 'mensaje');
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(mensaje + " : " + entidad.nombre)));

    //  this.scaffoldKey!.currentState!.showSnackBar(
    //     SnackBar(content: Text(mensaje + " : " + entidad.nombre)));
    if (elemento.ruta != null /* && elemento.operacion==eOperacion.Consultar */)
      Accion.hacer(context, OpcionesMenus.obtener(elemento.ruta!));
    else if (elemento.ruta == null && elemento.operacion == eOperacion.filtrar)
      Navigator.pop(context);
  }
  void respuestaSeleccionar3(   BuildContext context, ElementoLista elemento, dynamic entidad) {
    String mensaje =  Traductor.obtenerAtrbuto('pagina_Comun','accionSeleccionar', 'mensaje');
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(mensaje + " : " + entidad.nombre)));   
    //  this.scaffoldKey!.currentState!.showSnackBar(
    //     SnackBar(content: Text(mensaje + " : " + entidad.nombre)));
    if (elemento.ruta != null /* && elemento.operacion==eOperacion.Consultar */)
      Accion.hacer(context, OpcionesMenus.obtener(elemento.ruta!));
    else if (elemento.ruta == null && elemento.operacion == eOperacion.filtrar)
      Navigator.pop(context);
  }
  //
  //   acccion  y respuestas  de guardar  informacion
  //
  void guardarEntidad(BuildContext context, ElementoLista elemento) {
    String pagina = elemento.argumento;
    GlobalKey<FormState> keyFormulario = ContextoUI.obtenerKey(pagina).keyFormulario!;

      if (!keyFormulario.currentState!.validate()) return;
    keyFormulario.currentState!.save();
    dynamic entidadCaptura = provider.entidad;

     imprimir(entidadCaptura, "despues de guardar");

    if (elemento.callBackAccion3 != null)
      elemento.callBackAccion3!(context, elemento, entidadCaptura);
    
  }


  //
  //   repuesta guardar  informacion
  //
  void respuestaGuardar(BuildContext context, elemento, dynamic entidad) {

    String mensaje =  widget.titulo=Traductor.obtenerAtrbuto('pagina_Comun','accionSeleccionar', 'mensaje');
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(mensaje + " : " + entidad.nombre)));   
    // this.scaffoldKey!.currentState!.showSnackBar(  SnackBar(content: Text(mensaje + " : " + entidad.nombre)));
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

  void respuestaModificar(BuildContext context, ElementoLista elemento, dynamic entidad) {
     String titulo = Traductor.obtenerAtrbuto('pagina_Comun','accionModificar', 'titulo');
     String mensaje =Traductor.obtenerAtrbuto('pagina_Comun','accionModificar', 'mensaje');
     String icono =Traductor.obtenerAtrbuto('pagina_Comun','accionModificar', 'icono');
     String opciones =Traductor.obtenerAtrbuto('pagina_Comun','accionModificar', 'opciones');
    // Dialogo.mostrarAlerta(context, icono, titulo, mensaje, opciones);
    if (elemento.callBackAccion3 != null)
      elemento.callBackAccion3!(context, elemento, entidad);
  }

}



//
// imprimir  información
//
void imprimir(dynamic entidadCaptura, [String comentario='']) {
  comentario = comentario == null ? " imprimir " : comentario;
  print(comentario);
  print(" entidad        :${entidadCaptura.nombre}");
  print(entidadCaptura.toMap());
}

