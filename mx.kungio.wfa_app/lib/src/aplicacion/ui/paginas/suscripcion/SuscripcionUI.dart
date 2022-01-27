//  librerias internas de flutter
import 'package:flutter/material.dart';

//  librerias importadas flutter
import 'package:image_picker/image_picker.dart';

//  librerias  proyecto

import '../../../configuracion/configuracionAplicacion.dart';
import '../../../../nucleo/ui/ui.dart';
import '../../../contexto/contexto.dart';

import '../../../negocio/controlador/SuscripcionControlador.dart';
export '../../../negocio/controlador/SuscripcionControlador.dart';

class SuscripcionUI {
  SuscripcionUI({this.provider, this.idioma});

  SuscripcionControlador provider;
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

    elemento.id = entidad.id;
    elemento.titulo = entidad.id.toString() + ' : ' + entidad.nombre;
    elemento.subitulo=entidad.tipo;
    elemento.icono = ele.icono;
    elemento.accion = ele.accion;
    elemento.callBackAccion = ele.callBackAccion;
    elemento.ruta = ele.ruta;
    elemento.icono2 = ele.icono2;
    elemento.ruta2 = ele.ruta2;
    elemento.accion2 = ele.accion2;
    elemento.callBackAccion2 = ele.callBackAccion2;
    elemento.icono3 = ele.icono3;
    elemento.ruta3 = ele.ruta3;
    elemento.accion3 = ele.accion3;
    elemento.callBackAccion3 = ele.callBackAccion3;
 
    elemento.operacion = ele.operacion;
    if (elemento.color == null)
      elemento.color = Theme.of(context).primaryColor.withOpacity(0.6);

    Widget elementos;
    if (ele.operacion == eOperacion.Consultar) {
      elementos = Listas.crearElementoListaDismisibleConAcciones(
          context, elemento, ele.accion, ele.accion2);
    } else if (ele.operacion == eOperacion.Filtrar) {
      elementos =  Listas.crearElementoListaDismisibleConAcciones(
          context, elemento,  ele.accion, ele.accion2);
    }
    return elementos;
  }

  //
  //  Crear  Boton  acciones
  //

  Column crearBotonesAcciones(
      BuildContext context, activarAcciones, ElementoLista accion) {
    print(activarAcciones);
    if ((activarAcciones != null && activarAcciones))
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
  //  acccion    Agregar
  //
  void agregarElemento(BuildContext context, ElementoLista elemento) {
    ContextoUI.iniciarCaptura = true;
    provider.iniciarEntidad();
    // se  usa las siguientes si requiere callback o ir otra pagina
    if (elemento.callBackAccion != null)
      elemento.callBackAccion(context, elemento, null);
    // if  (elemento.ruta!=null)
    //      Accion.hacer(context, ElementoLista(ruta:elemento.ruta));
  }

  //
  //  acccion   Seleccionar
  //
  void seleccionarElemento(BuildContext context, ElementoLista elemento) {
    provider.obtenerEntidad(context, elemento, elemento.callBackAccion);
    // obtenerEntidadDeLista(context,elemento,  elemento.callBackAccion);
  }

  //
  //  acccion  y respuestas   Eliminar
  //
  void eliminarElemento(BuildContext context, ElementoLista elemento) {
    String titulo = idioma.obtenerAtributo(
        "pagina_Comun", "accionConfirmarEliminacion", "titulo");
    String mensaje = idioma.obtenerAtributo(
        "pagina_Comun", "accionConfirmarEliminacion", "mensaje");
    String icono = idioma.obtenerAtributo(
        "pagina_Comun", "accionConfirmarEliminacion", "icono");
    String opciones = idioma.obtenerAtributo(
        "pagina_Comun", "accionConfirmarEliminacion", "opciones");
    dynamic opcion = opciones.split(" ");

    List<ElementoLista> elementos = List<ElementoLista>();
    // se debe pasar como argumeto  el elemento eleccionado
    elementos.add(new ElementoLista(
        titulo: opcion[0],
        accion: comfirmarEliminarElemento,
        argumento: elemento));
    elementos.add(new ElementoLista(
        titulo: opcion[1],
        accion: comfirmarEliminarElemento,
        argumento: elemento));
    Dialogo.mostrarVentanaOpciones(context, icono, titulo, mensaje, elementos);
  }

  void comfirmarEliminarElemento(BuildContext context, ElementoLista elemento) {
    dynamic entidad =
        provider.obtenerEntidadDeLista(context, elemento.argumento, null);
    // se debe pasar como argumeto  el elemento eleccionado
    elemento.argumento.valor = elemento.titulo;
    if (elemento.argumento.valor.toString().trim().toLowerCase() == "si")
      provider.eliminarEntidad(
          context, elemento.argumento, elemento.argumento.callBackAccion2);
    else
      elemento.argumento.callBackAccion2(context, elemento.argumento, entidad);
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

    if (entidadCaptura.id == null || entidadCaptura.id == 0) {
      entidadCaptura.idSuscriptor = Sesion.idSuscriptor;
      provider.insertarEntidad(
          context, elemento, entidadCaptura, elemento.callBackAccion);
    } else {
      provider.modificarEntidad(
          context, elemento, entidadCaptura, elemento.callBackAccion2);
    }

    // imprimir(entidadCaptura, "despues de guardar");
  }

  //
  //   respuestas
  //
  //
  //   respuestas   Agregar
  //
  void respuestaAgregar(BuildContext context, elemento, dynamic entidad) {
    String mensaje =
        this.idioma.obtenerAtributo("pagina_Comun", "accionAgregar", "mensaje");
    this
        .scaffoldKey
        .currentState
        .showSnackBar(SnackBar(content: Text(mensaje)));
    // solo  si  no  es capatura  parcial
    if (elemento.ruta != null)
      Accion.hacer(context, OpcionesMenus.obtener(elemento.ruta));
  }

  //
  //   respuestas   Seleccionar
  //
  void respuestaSeleccionar(
      BuildContext context, ElementoLista elemento, dynamic entidad) {
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
  //  respuestas   Eliminar
  //

  void respuestaEliminar(
      BuildContext context, ElementoLista elemento, dynamic entidad) {
    String titulo =
        this.idioma.obtenerAtributo("pagina_Comun", "accionEliminar", "titulo");
    String mensaje = this
        .idioma
        .obtenerAtributo("pagina_Comun", "accionEliminar", "mensaje");
    String icono =
        this.idioma.obtenerAtributo("pagina_Comun", "accionEliminar", "icono");
    String opciones = this
        .idioma
        .obtenerAtributo("pagina_Comun", "accionEliminar", "opciones");
    String mensajeOperacion = this
        .idioma
        .obtenerAtributo("pagina_Comun", "operacionExitosa", "mensaje");

    if (elemento.valor.toString().trim().toLowerCase() == "si") {
      this.scaffoldKey.currentState.showSnackBar(
          SnackBar(content: Text(mensaje + " : " + entidad.nombre)));
      // Dialogo.mostrarAlerta( context,icono,titulo, mensajeOperacion, opciones ) ;
    }
  }

  //
  //   repuesta guardar  informacion
  //
  void respuestaGuardar(BuildContext context, elemento, dynamic entidad) {
    if (elemento.ruta == "pagina_inicio")
      Configuracion.idSuscriptor = entidad.id;
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
    else if (this.widget.accionPagina == null || this.widget.accionPagina == "")
      provider.consultarEntidad(Suscripcion().iniciar(), null);
  }
  //
  //   respuestas   Insertar
  //

  void respuestaInsertar(
      BuildContext context, ElementoLista elemento, dynamic entidad) {
    if (elemento.ruta == "pagina_inicio")
      Configuracion.idSuscriptor = entidad.id;

    String titulo =
        idioma.obtenerAtributo("pagina_Comun", "accionInsertar", "titulo");
    String mensaje =
        idioma.obtenerAtributo("pagina_Comun", "accionInsertar", "mensaje");
    String icono =
        idioma.obtenerAtributo("pagina_Comun", "accionInsertar", "icono");
    String opciones =
        idioma.obtenerAtributo("pagina_Comun", "accionInsertar", "opciones");
    if (elemento.callBackAccion3 != null)
      elemento.callBackAccion3(context, elemento, entidad);
    Dialogo.mostrarAlerta(context, icono, titulo, mensaje, opciones);
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
  print(" entidad        :${entidadCaptura.tabla}");
  print(" id             :${entidadCaptura.id}");
  print(" nombre         :${entidadCaptura.nombre}");
  print(entidadCaptura.toMap());
}
//
// mapear datos de scaneo
//
