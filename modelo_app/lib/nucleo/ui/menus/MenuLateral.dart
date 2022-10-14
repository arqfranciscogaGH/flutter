//  librerias internas de flutter

import 'package:flutter/material.dart';


//  librerias  proyecto

import '../../nucleo.dart';

// import '../../negocio/modelo/modeloBase.dart';
// import '../../ui/iconos/iconos.dart';
// import '../../utilerias/utilerias.dart';

//  librerias externas  flutter

class Menulateral {
  static Widget crearMenu(
      BuildContext context, List<ElementoLista> elementos, String titulo, [ String pagina=''] ) {
      pagina=pagina==''?ParametrosSistema.paginaAccesso:pagina;
      final  encabezado =crearEncabezadoMenu(context,elementos,titulo,pagina );
      return Drawer(
        // Agrega un ListView al drawer. Esto asegura que el usuario pueda desplazarse
        // a través de las opciones en el Drawer si no hay suficiente espacio vertical
        // para adaptarse a todo.
        child: ListView(
            // Importante: elimina cualquier padding del ListView.
            padding: EdgeInsets.zero,
            children: Menulateral.crearElementosListaMenuLateral(context, elementos, encabezado)),
      );
    }
   

    static Widget crearEncabezadoMenu( BuildContext context, List<dynamic> elementos, String titulo,  String pagina)
    {
      // generar  encabezado DrawerHeader

      final encabezado=  DrawerHeader(
            child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[ 
                            crearSeccionAcceso(context,titulo, pagina),
                            crearSeccionSesion(),
                        ]),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
          );
          return encabezado;
    }

    static Widget  crearSeccionAcceso( BuildContext context, String titulo,  String pagina)
    {
        return Row( crossAxisAlignment: CrossAxisAlignment.center ,   children: crearItemsSeccionAcceso(context,titulo,pagina) )  ;
    }
    static List<Widget>  crearItemsSeccionAcceso(BuildContext context,String titulo,String pagina )
    {
        final List<Widget> controles = [];
        
        controles.add(Text(titulo, ) );
        controles.add(Text(" " ));
        IconButton boton = IconButton (icon: Icon( Icons.login_outlined  ), onPressed: () { 
          Sesion.iniciar();
          Accion.hacer( context, OpcionesMenus.obtener(pagina));   
        });
        controles.add(Text(" v : " +Sesion.version+ " ",textAlign: TextAlign.left ) );
        controles.add(boton);
   
       return controles;
    }
    static Widget  crearSeccionSesion( )
    {
      return Column( crossAxisAlignment: CrossAxisAlignment.start ,   children: crearItemsSeccionSesion() )  ;
    }
   static List<Widget>  crearItemsSeccionSesion()
    {
        final List<Widget> controles = [];
        // controles.add(Text(" " ));
        String titulo=Traductor.obtenerEtiquetaAtributo('pagina_Comun','suscripcion','titulo');

        controles.add(Text(" Id:" +Sesion.idSuscriptor.toString()+ " "+ titulo +":"+ Sesion.suscriptor ,textAlign: TextAlign.left ) );

        titulo=Traductor.obtenerEtiquetaAtributo('pagina_Comun','cuenta','titulo');
        controles.add(Text( titulo+":" +Sesion.cuenta,textAlign: TextAlign.left ) );
        titulo=Traductor.obtenerEtiquetaAtributo('pagina_Comun','nombre','titulo');
        controles.add(Text( titulo+":" +Sesion.nombre,textAlign: TextAlign.left ) );
        titulo=Traductor.obtenerEtiquetaAtributo('pagina_Comun','perfil','titulo') + ":"+Sesion.perfiles+" ";
        titulo+=Traductor.obtenerEtiquetaAtributo('pagina_Comun','grupo','titulo') +":" + Sesion.grupos;
        controles.add(Text(titulo,textAlign: TextAlign.left ) ); 
     
       return controles;
    }
  
     static List<Widget> crearElementosListaMenuLateral(BuildContext context, List<dynamic> elementos, Widget encabezado) {
     final List<Widget> opciones = [];
     
    // agregar  encabezado DrawerHeader
    opciones.add(encabezado);
    //  agregar   opciones de  menu  activas
    for (ElementoLista elemento in elementos) {
      if (elemento.activo == 1) {
        final widgetTemp = crearOpcionMenuLateral(context, elemento);
        opciones..add(widgetTemp)..add(Divider());
      }
    }
    return opciones;
  }
  static Widget crearOpcionMenuLateral(BuildContext context, ElementoLista elemento) {
    elemento.tamanoIcono= elemento.tamanoIcono?? ParametrosSistema.tamanoIcono;
    return ListTile(
      leading: elemento.icono != null ? Icono.crear(elemento.icono!,elemento.colorIcono,elemento.tamanoIcono!) : null,
      title: Text(elemento.titulo!),
      subtitle: elemento.subtitulo != null ? Text(elemento.subtitulo!) : null,
      trailing: elemento.iconoLateral != null
          ? Icono.crear(elemento.iconoLateral!,elemento.colorIcono,elemento.tamanoIcono! )
          : null,
      onTap: () {
          Accion.hacer(context, elemento);
      },
    );
  }
}