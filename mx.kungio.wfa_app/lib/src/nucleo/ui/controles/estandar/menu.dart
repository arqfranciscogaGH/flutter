//  librerias internas de flutter

import 'package:flutter/material.dart';

//  librerias importadas flutter

//  librerias  proyecto

import '../../comun/comun.dart';
import '../../../../aplicacion/configuracion/configuracionAplicacion.dart';
import '../../../../nucleo/ui/ui.dart';
import '../../../../nucleo/negocio/modelo/ModeloBase.dart';

//  librerias  proyecto




typedef void AccionCallbackControl(Widget control);
typedef void AccionCallbackId(String id);
typedef void AccionCallback();
typedef void AccionCallbackElemento(
    BuildContext context, ElementoLista elemento);

/* 
 

  List<Widget> opciones
        [
            new BottomNavigationBarItem(
                icon: new Center(child: new Text("1")),
                title: new Text("Simple Use")),
            new BottomNavigationBarItem(
                icon: new Center(child: new Text("2")),
                title: new Text("Complex Use")),
              new BottomNavigationBarItem(
                icon: new Center(child: new Text("3")),
                title: new Text("autocomplete")),            
          ],


   new Scaffold(
      bottomNavigationBar:MenuNavegacionOpciones(opciones:opciones,indexSeleccionado=1,metodo:mostrarPagina)
      body:mostrarPagina(index)
  )

  Widget mostrarPagina(int index)
  {
   List<Widget> paginas = [new FirstPage(), new SecondPage(),new TercerPage() ];
    return pages[selectedIndex];
  }

     */
class MenuNavegacionOpciones extends StatelessWidget {
  List<BottomNavigationBarItem> opciones;
  int indexSeleccionado;
  Function metodo;
  MenuNavegacionOpciones({this.opciones, this.indexSeleccionado, this.metodo});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: opciones,
      onTap: (index) {
        metodo(index);
      },
      currentIndex: indexSeleccionado,
    );
  }
}

/*    

     pasar lista de botenes

    List<Widget> botones = [  IconButton(  icon: Icon(Icons.menu),    onPressed: () {} ),          ),,
    IconButton(  icon: Icon(Icons.menu),    onPressed: () {} ),   
    IconButton(  icon: Icon(Icons.menu),    onPressed: () {} ),  
    ]           */

class MenuNavegacionBotones extends StatelessWidget {
  List<Widget> botones;

  MenuNavegacionBotones({this.botones});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        notchMargin: 8.0,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: botones,
        ));
  }
}

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
          children: Menu.crearElementosListaMenu(context, elementos, titulo)),
    );
  }

  static Widget crearListaFija(
      BuildContext context, List<ElementoLista> elementos) {
    return ListView(
      children: crearElementosListaMenu(context, elementos, ""),
    );
  }

  static List<Widget> crearEncabezdoaMenuLateral()
  {
    List<Widget> encabezado = [];
    encabezado.add(Text(" Id : " +Sesion.idSuscriptor.toString() +"  Cuenta: " +Sesion.cuenta,textAlign: TextAlign.left ));
    encabezado.add(Text(" Nombre : " +Sesion.nombre ,textAlign: TextAlign.left ));
    encabezado.add(Text(" Perfil : " +Sesion.perfil ,textAlign: TextAlign.left ));
    encabezado.add(Text(" Grupo : " +Sesion.grupo ,textAlign: TextAlign.left ));
    encabezado.add(Text(" Nivel Red : " +Sesion.nivelRed ,textAlign: TextAlign.left ));
     
    return  encabezado;
  }


  static List<Widget> crearElementosListaMenu(
      BuildContext context, List<dynamic> elementos, String titulo) {
    final List<Widget> opciones = [];
    titulo = "Menú";
    if (titulo != null && titulo != "") {
      opciones
        ..add(DrawerHeader(
          child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                children:
                <Widget>[ 
                    Row (   crossAxisAlignment: CrossAxisAlignment.center,
                    
                      children: <Widget>[   
                              Text(titulo),   
                              Text(" " ),             
                              IconButton(
                                  icon: Icon( Icons.login_outlined  ),  onPressed: ()
                                  {
                                          Sesion.nombre="";
                                          Sesion.cuenta  ="";
                                          Sesion.idSuscriptor =0;
                                          Sesion.perfiles  ="";
                                          Sesion.grupos  =""; 
                                          // Accion.regresar(context);
                                          Accion.hacer( context, OpcionesMenus.obtener("pagina_acceso"));
                                  },
                              ), 
                      ]
                  ),             
                  Column (   crossAxisAlignment: CrossAxisAlignment.start,
                      children:crearEncabezdoaMenuLateral(),
                  )
  
 
          ]),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
          ),
        ));
    }
    for (ElementoLista elemento in elementos) {
      if (elemento.activo == 1) {
        final widgetTemp = crearOpcionMenu(context, elemento);

        /*            final widgetTemp = ListTile(

                  // title: Text( opt['texto'] ),
                  title: Text( elemento.titulo),
                  leading: Icon ( Icons.flip, color: Colors.black ),  
                  //  getIcon( opt['icon'] ) , 
                  trailing: Icon ( Icons.arrow_right, color: Colors.blue ),
                  onTap: () 
                  {
                      if  ( elemento.Ruta!= null || elemento.Ruta!="")
                      {
                          Navigator.pushNamed(context, elemento.Ruta);
                      }

                      else
                      {
                          //  regresar  a  una  ruta  o paian  especifica
                          /*   final route = MaterialPageRoute(
                                builder: ( context )=> vista_inicio()
                            );
                            Navigator.push(context, route); */
                            Navigator.pop(context);
                      }
                  },
                ); */

        opciones..add(widgetTemp)..add(Divider());
      }
    }
    return opciones;
  }


  static Widget crearOpcionMenu(BuildContext context, ElementoLista elemento) {
    return ListTile(
      leading: elemento.icono != null ? Iconos.crear(elemento.icono) : null,
      title: Text(elemento.titulo),
      subtitle: elemento.subitulo != null ? Text(elemento.subitulo) : null,
      trailing: elemento.iconoLateral != null
          ? Iconos.crear(elemento.iconoLateral)
          : null,
      onTap: () {
        programarAccionOpcion(context, elemento);
      },
    );
  }

  static programarAccionOpcion(BuildContext context, ElementoLista elemento) {
    if (elemento.ruta != null || elemento.ruta != "") {
      Accion.hacer(context, elemento);
    } else {
      //  regresar  a  una  ruta  o paian  especifica
      /*   final route = MaterialPageRoute(
                  builder: ( context )=> vista_inicio()
              );
              Navigator.push(context, route); */
      //Navigator.pop(context);
      Accion.hacer(context, elemento);
    }
  }
}
