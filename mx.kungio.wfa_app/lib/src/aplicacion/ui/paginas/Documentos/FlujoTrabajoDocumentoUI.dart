//  librerias internas de flutter
import 'package:flutter/material.dart';
import 'dart:io';

//  librerias importadas flutter
import 'package:image_picker/image_picker.dart';

//  librerias  proyecto

import '../../../configuracion/configuracionAplicacion.dart';
import '../../../../nucleo/ui/ui.dart';
import '../../../contexto/contexto.dart';

import '../../../negocio/controlador/FlujoTrabajoDocumentoControlador.dart';
export '../../../negocio/controlador/FlujoTrabajoDocumentoControlador.dart';

import '../../../negocio/controlador/ConsultaDocumentosControlador.dart';
export '../../../negocio/controlador/ConsultaDocumentosControlador.dart';

class FlujoTrabajoDocumentoUI {
  FlujoTrabajoDocumentoUI({this.provider, this.idioma});

  FlujoTrabajoDocumentoControlador provider;
  IdiomaAplicacion idioma;
  BuildContext context;
  GlobalKey<ScaffoldState> scaffoldKey;
  dynamic widget;
  bool guardar = false;
  iniciar(BuildContext context, GlobalKey<ScaffoldState> scaffoldKey,
      IdiomaAplicacion idioma,
      [dynamic widget]) {
    this.context = context;
    this.idioma = idioma;
    this.scaffoldKey = scaffoldKey;
    this.widget = widget;
  }

  //  interfaz de UI  comun
  //

  //
  // crear elemento de lista
  //

  Widget crearElementoEntidad(
      BuildContext context, dynamic entidad, ElementoLista ele) {
    ElementoLista elemento = ElementoLista();

    elemento.id = entidad.id;
    // elemento.titulo = entidad.id.toString() ;
    //elemento.titulo = entidad.id.toString() + ', : ' + entidad.nombre;
    elemento.titulo = entidad.nombre;
    elemento.argumento = entidad.idDocumento;
    // elemento.subitulo=entidad.referencia;
    elemento.icono = ele.icono;
    elemento.accion = ele.accion;
    elemento.valor = entidad.id == null || entidad.id == 0 ? false : true;
    elemento.callBackAccion = ele.callBackAccion;
    elemento.ruta = ele.ruta;
    elemento.accion2 = ele.accion2;
    elemento.callBackAccion2 = ele.callBackAccion2;
    elemento.operacion = ele.operacion;
    if (elemento.color == null)
      elemento.color = Theme.of(context).primaryColor.withOpacity(0.6);

    Widget elementos;
    if (ele.operacion == eOperacion.Consultar) {
      elementos = Listas.crearElementoListaCheck(context, elemento);
    } else if (ele.operacion == eOperacion.Filtrar) {
      elementos = Listas.crearElementoListaDismisibleConAcciones(
          context, elemento, ele.accion, ele.accion2);
    }
    return elementos;
  }

  //
  //  Crear  Boton  acciones
  //

  Column crearBotonesAcciones(
      BuildContext context, activarAcciones, ElementoLista accion) {
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
  //  accciones
  //
  //
  //  acccion   Agregar
  //
  void agregarElemento(BuildContext context, ElementoLista elemento) {
    // ContextoUI.iniciarCaptura = true;
    // provider.iniciarEntidad();
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
    if (elemento.id == null) {
      provider.iniciarEntidad();
      provider.entidad.id = elemento.id;
      provider.entidad.nombre = elemento.titulo;
      provider.entidad.idDocumento = elemento.argumento;
      if (elemento.callBackAccion != null)
        elemento.callBackAccion(context, elemento, provider.entidad);
    } else
      //provider.obtenerEntidad(context, elemento, elemento.callBackAccion);
      provider.obtenerEntidadDeLista(
          context, elemento, elemento.callBackAccion);
  }

  //
  //  acccion    Eliminar
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
  //   acccion   guardar  informacion
  //
  void guardarEntidad(BuildContext context, ElementoLista elemento) {
    String pagina = elemento.argumento;

    if (!guardar) {
      guardar = true;
      GlobalKey<FormState> keyFormulario =
          ContextoUI.obtenerKey(pagina).keyFormulario;

      if (!keyFormulario.currentState.validate()) return;
      keyFormulario.currentState.save();
      dynamic entidadCaptura = provider.entidad;
      entidadCaptura.idReferencia = 1;
      //se requiere  limpiar los  parametros  por  usan la misma  configuracion los 2  controladores
      provider.asignarParametros(null, "prueba");
      if (entidadCaptura.id == null || entidadCaptura.id == 0) {
        provider.insertarEntidad(
            context, elemento, entidadCaptura, elemento.callBackAccion);
      } else {
        provider.modificarEntidad(
            context, elemento, entidadCaptura, elemento.callBackAccion2);
      }
      // imprimir(entidadCaptura, "despues de guardar");
      guardar = false;
    }
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
    String titulo = entidad.nombre == null ? "" : entidad.nombre;
    String mensaje = this
        .idioma
        .obtenerAtributo("pagina_Comun", "accionSeleccionar", "mensaje");
    this
        .scaffoldKey
        .currentState
        .showSnackBar(SnackBar(content: Text(mensaje + " : " + titulo)));

    String url = generarUrl(entidad);
    Vinculo.visitarSitio(url);

    // if (elemento.ruta != null /* && elemento.operacion==eOperacion.Consultar */)
    //   Accion.hacer(context, OpcionesMenus.obtener(elemento.ruta));
    // else if (elemento.ruta == null && elemento.operacion == eOperacion.Filtrar)
    //   Navigator.pop(context);
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
    String mensaje = this
        .idioma
        .obtenerAtributo("pagina_Comun", "operacionExitosa", "mensaje");
    String nombre = entidad.nombre == null ? "" : entidad.nombre;
    this
        .scaffoldKey
        .currentState
        .showSnackBar(SnackBar(content: Text(mensaje + " : " + nombre)));
    if (this.widget.accionPagina == "avanzar" &&
        this.widget.paginaSiguiente != null) {
      consultarDocumentos(null);
      Accion.hacer(context, OpcionesMenus.obtener(this.widget.paginaSiguiente));
    } else if (this.widget.accionPagina == "regresar" &&
        this.widget.paginaAnterior != null)
      Accion.hacer(context, OpcionesMenus.obtener(this.widget.paginaAnterior));
    else if (this.widget.accionPagina == null || this.widget.accionPagina == "")
      //   provider.consultarEntidad(FlujoTrabajoDocumento().iniciar(), null);
      consultarDocumentos(null);
  }
  //
  //   respuestas   Insertar
  //

  void respuestaInsertar(
      BuildContext context, ElementoLista elemento, dynamic entidad) {
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
  //   respuestas   Modificar
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
    if (elemento.callBackAccion3 != null)
      elemento.callBackAccion3(context, elemento, entidad);
    Dialogo.mostrarAlerta(context, icono, titulo, mensaje, opciones);
  }

  //
  //  soporte  de  cargan fotos ,video  en  galeria  y  camara
  //
  seleccionarFoto(BuildContext context) async {
    Imagen.capturar(ImageSource.gallery).then((imagen) {
      print("imagen foto:  ${imagen?.path} ");
      actualizarImagen(context, imagen);
    });
  }

  tomarFoto(BuildContext context) async {
    Imagen.capturar(ImageSource.camera).then((imagen) {
      print("imagen camara :  ${imagen?.path} ");
      actualizarImagen(context, imagen);
    });
  }

  actualizarImagen(BuildContext context, File imagen) {
    if (imagen != null) {
      dynamic entidad = provider.entidad;
      entidad.ruta = imagen?.path;
      provider.entidad = entidad;
      ElementoLista elemento = ElementoLista(titulo: "Nombre");
      Dialogo.mostrarAlerta(context, "info", "Imagen capturada",
          "Se actualizará la imagen", "Aceptar");
    }
    // print ( "imagen actualizada:  ${ imagen?.path } " );
    // print ( "path imagen actualizada:  ${entidadCaptura.rutaFoto} " );
  }

  consultarDocumentos(Function metodoRespuestaConsultar) {
    ConsultaDocumentosControlador providerD = ConsultaDocumentosControlador();
    List<dynamic> lista;
    providerD.limpiar();
    providerD.entidad.idReferencia = providerD.obtenerIdCliente();
    // if (providerD.lista==null ||  providerD.lista.isEmpty)
    // {
    String consulta = "ConsultarDocumentosFlujoTrabajo/" +
        providerD.entidad.idReferencia.toString();
    providerD.asignarParametros(consulta, "prueba");
    //providerD.consultarEntidad(FlujoTrabajoDocumento().iniciar(), metodoRespuestaConsultar);
    providerD.consultarEntidad(providerD.entidad, metodoRespuestaConsultar);

    return lista;
  }
  String  generarUrl(dynamic entidadCaptura) {
    String url="";
    if (entidadCaptura != null) {
      url = "http://kungio.mx/AdminDocs.aspx?id=";
      url += entidadCaptura.id != null && entidadCaptura.id != 0
          ? entidadCaptura.id.toString()
          : "0";
      url += "&idReferencia=";
      url += entidadCaptura.idReferencia != null &&
              entidadCaptura.idReferencia != 0
          ? entidadCaptura.idReferencia.toString()
          : "1";
      url += "&idDocumento=";
      url +=
          entidadCaptura.idDocumento != null && entidadCaptura.idDocumento != 0
              ? entidadCaptura.idDocumento.toString()
              : "0";
      url += "&nombreDocumento=";
      url += entidadCaptura.nombre != null && entidadCaptura.nombre != ""
          ? entidadCaptura.nombre
          : "";

    }
    return url;
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
