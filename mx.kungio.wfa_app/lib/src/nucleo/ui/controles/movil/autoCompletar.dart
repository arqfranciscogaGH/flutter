//  librerias internas de flutter

import 'package:flutter/material.dart';
import 'dart:async';

//  librerias importadas flutter

import 'package:autocomplete_textfield/autocomplete_textfield.dart';

//  librerias  proyecto

import '../../comun/comun.dart';
import '../estandar/decoracion.dart';

import '../../../../nucleo/negocio/modelo/ModeloBase.dart';

Widget crearCampoAutoCompletar<E>(
    BuildContext context,
    Control control,
    /* List<dynamic> lista,  */ dynamic key,
    Function accionConstruir,
    Function accionFiltrar,
    Function acccionOrdenar,
    Function accionSeleccionar) {
  AutoCompleteTextField<E> autocompletar = AutoCompleteTextField<E>(
    key: key,
    clearOnSubmit: false,
    suggestions: control.lista,
    //style: TextStyle(color: color==null? Theme.of(context).accentColor: color,
    //fontSize: fontsize==null?12: fontsize),
    //decoration: new InputDecoration(errorText: "Beans"),
    controller: TextEditingController(text: ""),
    decoration: crearDecoracionInput(control),
    // decoration: InputDecoration(  hintText: textoAyuda==null?"":textoAyuda,
    // hintStyle: TextStyle(color: color, fontSize:fontsize==null?12.0:fontsize) ,
    // contentPadding: EdgeInsets.fromLTRB( left==null?20.0: left, top==null?40.0:top, right==null?10.0 : right ,bottom==null? 20.0: bottom),
    // ),

    //),
    itemFilter: (item, query) {
      return accionFiltrar(item, query);
      //return  item.valor.toLowerCase().contains(query.toLowerCase() ) ;
    },
    itemSorter: (a, b) {
      return acccionOrdenar(a, b);
      //return a.valor.compareTo(b.valor);
    },
    itemBuilder: (context, item) {
      return accionConstruir(context, item);
    },
    itemSubmitted: (item) {
      return accionSeleccionar(item);
/*                 
                setState(() {
                        autoCompletar.textField.controller.text=item.valor;
                });
 */
    },
  );

  return autocompletar;
}
