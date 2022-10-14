    
//  librerias internas de flutter

import 'package:flutter/material.dart';

//  librerias importadas flutter

//  librerias  proyecto


import '../../negocio/modelo/ModeloBase.dart';


class MenuNavegacionOpciones extends StatelessWidget {
  List<BottomNavigationBarItem>? opciones;
  int? indexSeleccionado;
  Function? metodo;
  MenuNavegacionOpciones({this.opciones, this.indexSeleccionado, this.metodo});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: opciones!,
      onTap: (index) {
        metodo!(index);
      },
      currentIndex: indexSeleccionado!,
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
  List<Widget>? botones;

  MenuNavegacionBotones({this.botones});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        notchMargin: 8.0,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: botones!,
        ));
  }
}