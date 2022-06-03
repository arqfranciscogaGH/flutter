//  librerias internas de flutter
import 'package:flutter/material.dart';

//  librerias importadas flutter
import 'package:image_picker/image_picker.dart';

//  librerias  proyecto

import '../../../configuracion/configuracionAplicacion.dart';
import '../../../../nucleo/ui/ui.dart';
import '../../../contexto/contexto.dart';

import '../../../negocio/controlador/FTConsultaControlador.dart';
export '../../../negocio/controlador/FTConsultaControlador.dart';

import '../../../negocio/controlador/MisPendientesControlador.dart';
export '../../../negocio/controlador/MisPendientesControlador.dart';

import '../../../negocio/controlador/FTEstatusTareaControlador.dart';
export '../../../negocio/controlador/FTEstatusTareaControlador.dart';

import '../../../negocio/controlador/FTAvanzarActividadControlador.dart';
export '../../../negocio/controlador/FTAvanzarActividadControlador.dart';



class MisPendientesUI {
  MisPendientesUI({this.provider, this.idioma});

  MisPendientesControlador provider;
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
    //  print(entidad['Nombre']);
    //  print(entidad['Numero']==null?'':entidad['Numero']);
    //  print(entidad['Importe']==null?'':entidad['Importe']);

    // String nombre=entidad['Nombre']==null?1:entidad['Nombre'];
    // String entidadidentificador=entidad['Identificador']==null?1:entidad['Identificador'];
    // double importe=entidad['Importe']==null?0:entidad['Importe'];
    // int idInstancia=entidad['IdInstancia']==null?1:entidad['IdInstancia'];
    // String titulo=' Imss: 1  importe: ${importe} ';
    elemento.argumento=entidad;
    elemento.id =entidad.idHistorial;
    //elemento.titulo =' Imss: 1  importe: ${entidad.importe} ';

  

    elemento.titulo =entidad.identificador+":" + entidad.nombre;
    elemento.subitulo =entidad.actividad;

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
    if (ele.color == null)
       elemento.color = Theme.of(context).primaryColor.withOpacity(0.6);
    else 
       elemento.color = ele.color;

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
  //  acccion   Seleccionar
  //
  void seleccionarElemento(BuildContext context, ElementoLista elemento) {
    ContextoUI.guadarKey("seguimiento", null, null, elemento.argumento);
    provider.obtenerEntidadDeLista(context,elemento,  elemento.callBackAccion);
     
  }
  void seleccionarElemento2(BuildContext context, ElementoLista elemento) {
    ContextoUI.guadarKey("seguimiento", null, null, elemento.argumento);
    provider.obtenerEntidadDeLista(context,elemento,  elemento.callBackAccion);
     
  }
   void seleccionarElemento3(BuildContext context, ElementoLista elemento) {
    ContextoUI.guadarKey("seguimiento", null, null, elemento.argumento);
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
    avanzarflujoTrabajo(context, elemento, entidad, "INICIAR");
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

   avanzarflujoTrabajo(context, elemento, entidadCaptura, "TERMINAR");
   
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

   obtenerEstatusTarea (Function metodoRespuestaConsultar)  
   {
       FTEstatusTareaControlador  providerE = FTEstatusTareaControlador();
       List<dynamic>  lista;
        // providerE.limpiar();
        if (providerE.lista==null ||  providerE.lista.isEmpty)
        {
            providerE.asignarParametros("FTVerEstatusTarea/0/", "prueba");
            providerE.consultarEntidad(FTEstatusTarea().iniciar(), metodoRespuestaConsultar);

        }
         else
         {
             lista=providerE.lista;
             if  (metodoRespuestaConsultar!=null)
                 metodoRespuestaConsultar(providerE.lista);

         }

        return lista;
    
   }
   avanzarflujoTrabajo(BuildContext context, ElementoLista elemento,dynamic entidadCaptura, String idAccion)
   {
         FTAvanzarActividadControlador providerAF = FTAvanzarActividadControlador();
         providerAF.asignarParametros(null, "prueba");
         providerAF.limpiar();

         // FTAvanzarActividades
         dynamic entidadAvance =providerAF.entidad;
         entidadAvance.id=0;
         entidadAvance.clave=entidadCaptura.clave;
         entidadAvance.idAccion=idAccion;
         entidadAvance.llave="prueba";
         entidadAvance.identificador=entidadCaptura.identificador;
         entidadAvance.nombre=entidadCaptura.nombre;
//        Info de  ultimo  tarea y  estatus  selccionado
         entidadAvance.idTarea=entidadCaptura.idTarea;
         entidadAvance.claveEstatus=entidadCaptura.estatusOperacion;


 //      parametros
    entidadAvance.parametros = "";
    entidadAvance.parametros += entidadCaptura.nombre == null ? "" : "@Nombre:" + entidadCaptura.nombre;
    entidadAvance.parametros += entidadCaptura.importe == null ? "" : ", @Importe:" + entidadCaptura.importe.toString();
    // entidadAvance.parametros +=   entidadCaptura.rfc == null || entidadCaptura.rfc == "" ? "" : ", @Referencia:" + entidadCaptura.rfc;
    // se guarda id cliente
    // entidadAvance.parametros += entidadCaptura.id == null || entidadCaptura.id == 0 ? "": ", @Numero:" + entidadCaptura.id.toString();
    // entidadAvance.parametros += entidadCaptura.id == null || entidadCaptura.id == 0 ? "": ", @IdCliente:" + entidadCaptura.id.toString();
    // entidadAvance.parametros += Sesion.idUsuario == null || Sesion.idUsuario == 0 ? "": ", @IdSocio:" + Sesion.idUsuario.toString();
    entidadAvance.parametros += Sesion.idUsuario == null || Sesion.idUsuario == 0 ? "": ", @IdUsuario:" + Sesion.idUsuario.toString();
    entidadAvance.parametros += Sesion.idSuscriptor== null ||Sesion.idSuscriptor == 0 ? "": ", @IdSuscriptor:" + Sesion.idSuscriptor.toString();
    entidadAvance.parametros += Sesion.perfiles== null ||Sesion.perfiles == "" ? "": ", @IdPerfil:" + Sesion.perfiles;
    entidadAvance.parametros += Sesion.grupos == null || Sesion.grupos== ""? "": "@IdGrupo:" + Sesion.grupos;
     entidadAvance.parametros+=entidadCaptura.observacion==null? "":"@Observacion:"+entidadCaptura.observacion;
    //  variables
    entidadAvance.variables = Sesion.idSuscriptor == null && Sesion.idUsuario == 0 ? ""  : "IdSocio:" + Sesion.idUsuario.toString();
    entidadAvance.variables += Sesion.grupos == null && Sesion.grupos == "" ? "" : ",IdGrupo:" + Sesion.grupos;



       
 
  
        // if (providerE.lista==null ||  providerE.lista.isEmpty)
        // {
        //     providerAF.asignarParametros("FTVerEstatusTarea/0/", "prueba");
           providerAF.insertarEntidad(context ,elemento,entidadAvance ,elemento.callBackAccion);

        // }

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
    // provider.consultarEntidad(MisPendientes().iniciar(), null);
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
