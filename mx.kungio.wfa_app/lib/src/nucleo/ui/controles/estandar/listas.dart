//  librerias internas de flutter

import 'package:flutter/material.dart';
import 'dart:async';

//  librerias importadas flutter

//  librerias  proyecto

import '../../comun/comun.dart';
import '../../controles/estandar/botones.dart';
import '../../../../nucleo/negocio/modelo/ModeloBase.dart';

typedef void AccionSeleccionarElemento(
    BuildContext context, ElementoLista elemento);
typedef void AccionEliminarElementoLista(
    BuildContext context, ElementoLista elemento);
typedef void AccionModificarElementoLista(
    BuildContext context, ElementoLista elemento);

class Listas {
  //
  //  Mostrar  elementos en lista
  //
  static Widget mostrarLista(List<dynamic> lista, BuildContext context,
      ElementoLista elemento, Function metodoCrearElemento) {
    if (lista == null)
      return Center(child: CircularProgressIndicator());
    else if (lista.length == 0)
      return Center(child: Text("No  hay  información"));
    else {
      return Container(
        child: Column(children: <Widget>[
          Expanded(
              //child:  mostrarElementosFiltro(lista,context, elemento)
              child: mostrarElementos(
                  lista, context, elemento, metodoCrearElemento)),
        ]),
      );
    }
  }

  static Widget mostrarElementos(List<dynamic> lista, BuildContext context,
      ElementoLista elemento, Function metodoCrearElemento) {
    if (lista != null) {
      return ListView.separated(
        itemCount: lista.length,
        itemBuilder: (context, position) {
          dynamic entidad = lista[position];
          return metodoCrearElemento(context, entidad, elemento);
        },
        separatorBuilder: (context, position) {
          return Container(
            color: Theme.of(context).primaryColor.withOpacity(0.2),
            height: 2.0,
          );
        },
      );
    }
  }

  static Widget crearElementoListaCheck(
      BuildContext context, ElementoLista elemento) {
    return CheckboxListTile(
          title: Text(elemento.titulo),
          value: elemento.valor,
          onChanged: (bool value) {
              elemento.valor=value;
              Accion.hacer(context, elemento);
          },
          // selected: elemento.valor,
         secondary:  elemento.icono != null ? Iconos.crear(elemento.icono, elemento.color) : null,
    );
  }



  static Widget crearElementoLista(
      BuildContext context, ElementoLista elemento) {
    return GestureDetector(
      child: crearTituloElemento(context, elemento),
      onTap: () {
        Accion.hacer(context, elemento);
      },
    );
  }
  static Widget crearTituloElemento(
      BuildContext context, ElementoLista elemento) {
    if (elemento.color == null)
      elemento.color = Theme.of(context).primaryColor.withOpacity(0.6);
    return ListTile(
      leading: elemento.icono != null ? Iconos.crear(elemento.icono, elemento.color) : null,
      title: Text(elemento.titulo),
      subtitle: elemento.subitulo != null ? Text(elemento.subitulo) : null,
      trailing: elemento.iconoLateral != null
          ? Iconos.crear(elemento.iconoLateral, elemento.color)
          : null,
      //onTap: ()  { Accion.hacer(context,elemento); },
    );
  }


  static Widget crearElementoListaDismisible(
      BuildContext context,
      ElementoLista elemento,
      dynamic controlModelo,
      AccionModificarElementoLista metodoModificarElementoLista,
      AccionEliminarElementoLista metodoEliminarElementoLista) {
    return Dismissible(
        onDismissed: (direction) {
          metodoEliminarElementoLista(context, elemento);
        },
        key: UniqueKey(),
        background: Container(
            color: Theme.of(context).selectedRowColor.withOpacity(0.6)),
        child: ElementoAccion(context: context, elemento: elemento, argumentos: controlModelo));
  }

  static Widget crearElementoListaDismisibleConAcciones(
      BuildContext context,
      ElementoLista elemento,
      
      AccionModificarElementoLista metodoModificarElementoLista,
      AccionEliminarElementoLista metodoEliminarElementoLista) {
    return Dismissible(
        onDismissed: (direction) {
          metodoEliminarElementoLista(context, elemento);
        },
        key: UniqueKey(),
       background: Container(
            color: Theme.of(context).selectedRowColor.withOpacity(0.6)),
        child: ElementoAccion(
            context: context, elemento: elemento));
  }

  static Widget crearElementoconAccionModificar(
      BuildContext context,
      ElementoLista elemento,
      AccionModificarElementoLista metodoModificarElementoLista) {
    return Padding(
        padding: EdgeInsets.all(20),
        child: Row(children: <Widget>[
          Expanded(
            child: Text(elemento.titulo),
          ),
          IconButton(
              icon: Icon(Icons.edit, size: 30),
              onPressed: () {
                metodoModificarElementoLista(context, elemento);
              }),
        ]));
  }
  static Widget crearElementoConAcciones(
      BuildContext context,
      ElementoLista elemento
      ) {
    return Padding(
        padding: EdgeInsets.all(20),
        child: ElementoAccion(  context: context, elemento: elemento)
     );
  }

}

class ElementoAccion extends StatelessWidget {
  BuildContext context;
  ElementoLista elemento;
  dynamic argumentos;
  ElementoAccion({this.context, this.elemento, this.argumentos});
  @override
  Widget build(BuildContext context) {
    if (elemento.color == null)
      elemento.color = Theme.of(context).primaryColor.withOpacity(0.6);
    return Padding(
        padding: EdgeInsets.all(1),
        child: Row(
          children: obtenerAcciones(context, elemento),
          // <Widget> [
          // Expanded(child: Text( elemento.titulo),),
          //IconButton ( icon:Iconos.crear(elemento.icono,elemento.color, elemento.size ) , onPressed: () { Accion.hacer(context,elemento); }),

          //]
        ));
  }

  List<Widget> obtenerAcciones(BuildContext context, ElementoLista elemento) {
    List<Widget> acciones = List<Widget>();

    if (elemento.color == null)
      elemento.color = Theme.of(context).backgroundColor.withOpacity(0.6);

    ElementoLista elementoAccion;
    ElementoLista elementoAccion2;
    ElementoLista elementoAccion3;
    //acciones.add(Expanded(child: Text( elemento.titulo)));

    acciones.add(Expanded(
        child: Column(children: <Widget>[
      Text(elemento.titulo,textAlign: TextAlign.center, style: TextStyle( color: elemento.colorTexto != null ?elemento.colorTexto: Theme.of(context).backgroundColor )  ),
      elemento.subitulo != null ? Text(elemento.subitulo,textAlign: TextAlign.center,) : Text(""),
      elemento.nota != null ? Text(elemento.nota,textAlign: TextAlign.center,) : Text(""),      
    ])));

    if (elemento.icono != null &&
        (elemento.accion != null || elemento.ruta != null)) {
      elementoAccion = elemento;
      acciones.add(Boton.crearBotonIcono(context, elemento));
      //acciones.add(IconButton ( icon:Iconos.crear(elemento.icono,elemento.color, elemento.size ) , onPressed: () { Accion.hacer(context,elemento); }));
    }
    if (elemento.icono2 != null &&
        (elemento.accion2 != null || elemento.ruta2 != null)) {
      elementoAccion2 = ElementoLista(
          id: elemento.id,
          titulo: elemento.titulo,
          argumento: elemento.argumento,
          color: elemento.color,
          size: elemento.size,
          icono: elemento.icono2,
          ruta: elemento.ruta2,
          accion: elemento.accion2,
          callBackAccion: elemento.callBackAccion2);
      //acciones.add(IconButton ( icon:Iconos.crear(elementoAccion2.icono,elemento.color, elemento.size ) , onPressed: () { Accion.hacer(context,elementoAccion2); }));
      acciones.add(Boton.crearBotonIcono(context, elementoAccion2));
    }
    if (elemento.icono3 != null &&
        (elemento.accion3 != null || elemento.ruta3 != null)) {
      elementoAccion3 = ElementoLista(
          id: elemento.id,
          titulo: elemento.titulo,          
          argumento: elemento.argumento,
          color: elemento.color,
          size: elemento.size,
          icono: elemento.icono3,
          ruta: elemento.ruta3,
          accion: elemento.accion3,
          callBackAccion: elemento.callBackAccion3);
      //acciones.add(IconButton ( icon:Iconos.crear(elementoAccion3.icono,elemento.color, elemento.size ) , onPressed: () { Accion.hacer(context,elementoAccion3); }));
      acciones.add(Boton.crearBotonIcono(context, elementoAccion3));
    }
    return acciones;
  }
}

Widget ListaTarjeta(List<ElementoLista> elementos) {
  return Expanded(
    child: ListView.separated(
      itemCount: elementos.length,
      itemBuilder: (context, position) {
        return Tarjeta(elemento: elementos[position]);
      },
      separatorBuilder: (context, position) {
        return Container(
          color: Colors.blue.withOpacity(0.15),
          height: 8.0,
        );
      },
    ),
  );
}

class Tarjeta extends StatelessWidget {
  BuildContext context;
  ElementoLista elemento;
  Tarjeta({this.context, this.elemento});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: Center(
          child: Text(elemento.titulo),
        ),
      ),
      onTap: () {
        Accion.hacer(context, elemento);
      },
    );
  }
}
