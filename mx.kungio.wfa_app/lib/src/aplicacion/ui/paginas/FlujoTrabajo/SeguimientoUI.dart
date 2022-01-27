//  librerias internas de flutter
import 'package:flutter/material.dart';

//  librerias importadas flutter
import 'package:image_picker/image_picker.dart';

//  librerias  proyecto

import '../../../configuracion/configuracionAplicacion.dart';
import '../../../../nucleo/ui/ui.dart';
import '../../../contexto/contexto.dart';


import '../../../negocio/controlador/SeguimientoControlador.dart';
export '../../../negocio/controlador/SeguimientoControlador.dart';

import '../../../negocio/controlador/FTEstatusTareaControlador.dart';
export '../../../negocio/controlador/FTEstatusTareaControlador.dart';

import '../../../negocio/controlador/MisPendientesControlador.dart';
export '../../../negocio/controlador/MisPendientesControlador.dart';

class SeguimientoUI {
  SeguimientoUI({this.provider, this.idioma});

  SeguimientoControlador provider;
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
   probar (Function metodoRespuestaConsultar)  
   {
       FTEstatusTareaControlador  providerE = FTEstatusTareaControlador();
        // providerE.limpiar();
        if (providerE.lista==null ||  providerE.lista.isEmpty)
        {
            providerE.asignarParametros("FTVerEstatusTarea/0/", "prueba");
            providerE.consultarEntidad(FTEstatusTarea().iniciar(), metodoRespuestaConsultar);

        }
         else
             metodoRespuestaConsultar(providerE.lista);
    
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

    elemento.id =entidad.orden;
    //elemento.titulo =' Imss: 1  importe: ${entidad.importe} ';
     
    String titulo ="";
    String subtitulo ="";
    titulo+= entidad.orden==null? " ": entidad.orden.toString() ;
    titulo+= entidad.actividad==null?    " ": " "+entidad.actividad;
    titulo+= entidad.estatusInstancia==null? " ": " "+entidad.estatusInstancia;
    elemento.titulo =titulo;
    subtitulo+= entidad.fechaInicio==null? "":  "Inicio:"+entidad.fechaInicio.toString().substring(0,10) +"  -  "  ;
    subtitulo+= entidad.fechaTernimacion==null? "": "Finalizó:"+entidad.fechaTernimacion.toString().substring(0,10)  ;
    elemento.subitulo =subtitulo;

    elemento.icono = ele.icono;
    elemento.accion = ele.accion;
    elemento.callBackAccion = ele.callBackAccion;
    elemento.ruta = ele.ruta;
    elemento.accion2 = ele.accion2;
    elemento.callBackAccion2 = ele.callBackAccion2;
    elemento.operacion = ele.operacion;
    if (ele.color == null)
       elemento.color = Theme.of(context).primaryColor.withOpacity(0.6);
    else 
       elemento.color = ele.color;

    if  (entidad.estatusInstancia!=null &&entidad.estatusInstancia!="" )
    {
        elemento.icono = ele.icono;
        elemento.color = ele.color;
    }
    else
    {
        elemento.icono = "stop";
        elemento.color = Colors.red;
    } 
    
    Widget elementos;
    if (ele.operacion == eOperacion.Consultar) {
      elementos = Listas.crearElementoLista(
          context, elemento);
    } else if (ele.operacion == eOperacion.Filtrar) {
      elementos = Listas.crearElementoLista(context, elemento);
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
  //  acccion   Seleccionar
  //
  void seleccionarElemento(BuildContext context, ElementoLista elemento) {
    provider.obtenerEntidadDeLista(context,elemento,  elemento.callBackAccion);
  }

 
  //
  //   respuestas
  //
  //

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
    //  avanzarflujoTrabajo(context, elemento, entidadCaptura);
    if (elemento.callBackAccion3 != null)
      elemento.callBackAccion3(context, elemento, entidadCaptura);
    
  }


  //  avanzarflujoTrabajo(BuildContext context, ElementoLista elemento,dynamic entidadCaptura)
  //  {
  //        FTAvanzarActividadControlador providerAF = FTAvanzarActividadControlador();
  //        providerAF.asignarParametros(null, "prueba");
  //        providerAF.limpiar();

  //        // FTAvanzarActividades
  //        dynamic entidadAvance =providerAF.entidad;
  //        entidadAvance.id=0;
  //        entidadAvance.clave=entidadCaptura.clave;
  //        entidadAvance.clave="LINEAIV";
  //        entidadAvance.idAccion="TERMINAR";
  //        entidadAvance.llave=entidadCaptura.llave;

  //        entidadAvance.llave="prueba";
  //        entidadAvance.identificador=entidadCaptura.identificador;
  //        entidadAvance.idTarea=entidadCaptura.idTarea;
  //        entidadAvance.claveEstatus=entidadCaptura.estatusOperacion;
  //       //  entidadAvance.idTarea=0;
  //       //  entidadAvance.claveEstatus="";

  //        entidadAvance.variables="@IdSocio:1,@IdGrupo:B&D, @importe:310000";
  //        entidadAvance.parametros="@Observacion:"+entidadCaptura.observacion;
  //       // if (providerE.lista==null ||  providerE.lista.isEmpty)
  //       // {
  //       //     providerAF.asignarParametros("FTVerEstatusTarea/0/", "prueba");
  //          providerAF.insertarEntidad(context ,elemento,entidadAvance ,elemento.callBackAccion);

  //       // }

  //  }
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
      provider.consultarEntidad(Seguimiento().iniciar(), null);
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