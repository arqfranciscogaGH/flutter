//  librerias internas de flutter

import 'package:flutter/material.dart';

//  librerias importadas flutter

//  librerias  proyecto

import '../../negocio/modelo/ModeloBase.dart';
import '../../ui/iconos/iconos.dart';
import '../../utilerias/utilerias.dart';

class Menu {
  static Widget crearListaMenuLateral(
      BuildContext context, List<ElementoLista> elementos, String titulo) {
      return Drawer(
        // Agrega un ListView al drawer. Esto asegura que el usuario pueda desplazarse
        // a través de las opciones en el Drawer si no hay suficiente espacio vertical
        // para adaptarse a todo.
        child: ListView(
            // Importante: elimina cualquier padding del ListView.
            padding: EdgeInsets.zero,
            children: Menu.crearElementosListaMenu(context, elementos, titulo= "Menú")),
      );
    }
      static List<Widget> crearElementosListaMenu(BuildContext context, List<dynamic> elementos, String titulo) {
      final List<Widget> opciones = [];
     
      // generar  encabezado DrawerHeader
      final encabezado=  DrawerHeader(
            child: Column( crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[ 
              Row (   crossAxisAlignment: CrossAxisAlignment.center,
              
                children: <Widget>[   
                        Text(titulo),   
                        Text(" " ),             
                        IconButton(
                        icon: Icon( Icons.login_outlined  ),  onPressed: ()
                        {
                                // Sesion.nombre="";
                                // Sesion.cuenta  ="";
                                // Sesion.idSuscriptor =0;
                                // Sesion.perfiles  ="";
                                // Sesion.grupos  =""; 
                                // // Accion.regresar(context);
                                // Accion.hacer( context, OpcionesMenus.obtener("pagina_acceso"));
                        },
              ), 
                ]
              ),             
              Text(" " ),
              // Text(" Id : " +Sesion.idSuscriptor.toString() +"  Cuenta: " +Sesion.cuenta),
              // Text(" Nombre: " +Sesion.nombre,textAlign: TextAlign.left )  ,
              // Text(" Perfil: " +Sesion.perfiles+ "  Grupo: " + Sesion.grupos),
              // Text(" versión: "  +Sesion.version),   
  
            ]),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
          );
    // agregar  encabezado DrawerHeader
    opciones.add(encabezado);
    //  agregar   opciones de  menu  activas
    for (ElementoLista elemento in elementos) {
      if (elemento.activo == 1) {
        final widgetTemp = crearOpcionMenu(context, elemento);
        opciones..add(widgetTemp)..add(Divider());
      }
    }
    return opciones;
  }
  static Widget crearOpcionMenu(BuildContext context, ElementoLista elemento) {
    return ListTile(
      leading: elemento.icono != null ? IconosEstandar.crear(elemento.icono!) : null,
      title: Text(elemento.titulo!),
      subtitle: elemento.subitulo != null ? Text(elemento.subitulo!) : null,
      trailing: elemento.iconoLateral != null
          ? IconosEstandar.crear(elemento.iconoLateral!)
          : null,
      onTap: () {
        // programarAccionOpcion(context, elemento);
        Accion.hacer(context, elemento);
      },
    );
  }

  static programarAccionOpcion(BuildContext context, ElementoLista elemento) {
    Accion.hacer(context, elemento);

    // if (elemento.ruta != null || elemento.ruta != "") {
    //   Accion.hacer(context, elemento);
    // } else {
      //  regresar  a  una  ruta  o pagina  especifica
      /*   final route = MaterialPageRoute(
                  builder: ( context )=> vista_inicio()
              );
              Navigator.push(context, route); */
      //Navigator.pop(context);

    // }
  }
}