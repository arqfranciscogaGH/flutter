//  librerias internas de flutter

import 'package:flutter/material.dart';


//  librerias importadas flutter

//  librerias  proyecto


import '../../../nucleo.dart';
// import '../../comun/comun.dart';
// import '../../Iconos/iconos.dart';
// import '../../../../nucleo/negocio/modelo/ModeloBase.dart';

Decoration crearDecoracionContenedor(BuildContext context, Control control) {
  Decoration  contenedorDecoracion= BoxDecoration(
        border: Border.all(
      width: 0,
      style: BorderStyle.none,
    ));

  if (control.borde == null || control.borde == eTipoBorde.ninguno)
    contenedorDecoracion=  BoxDecoration(
        border: Border.all(
      width: 0,
      style: BorderStyle.none,
    ));
  else if (control.borde == eTipoBorde.circular)
    contenedorDecoracion=  BoxDecoration(
      border: Border.all(
        //color: Theme.of(context).disabledColor,
         color: Theme.of(context).primaryColor,
      ),
      borderRadius: BorderRadius.circular(20),
    );
  else if (control.borde == eTipoBorde.rectangular)
    contenedorDecoracion=  BoxDecoration(
      border: Border.all(/* color:Colores.obtenerColor(control.colorBorde)  */),
    );
  else if (control.borde == eTipoBorde.lineal)
    contenedorDecoracion=  BoxDecoration(
        border: Border(
            bottom: BorderSide(
                /* color:Colores.obtenerColor(control.colorBorde) */)));

      return contenedorDecoracion;          
}

InputDecoration crearDecoracionInput(Control control) {
  return InputDecoration(
    border: control.borde == null || control.borde == eTipoBorde.ninguno
        ? InputBorder.none
        : crearBordeInput(control),
    counter: mostrarContadorLetras(control),
    hintText: control.marcaAguaTexto != null ? control.marcaAguaTexto : null,
    labelText: control.textoEtiqueta != null ? control.textoEtiqueta : null,
    helperText: control.textoAyuda != null ? control.textoAyuda : null,
    suffixIcon: control.iconoInterno != null
        ? Icono.crear(control.iconoInterno!)
        : null,
    icon: control.icono != null ? Icono.crear(control.icono!) : null,
  );
}

InputBorder crearBordeInput(Control control) {
  // no cambia el  color ,solo aplica el color del tema
  InputBorder  controlBorde =
        OutlineInputBorder(borderRadius: BorderRadius.circular(20.0));

  if (control.borde == eTipoBorde.circular)
    controlBorde =
        OutlineInputBorder(borderRadius: BorderRadius.circular(20.0));
  else if (control.borde == eTipoBorde.rectangular)
    controlBorde = OutlineInputBorder();
  else if (control.borde == eTipoBorde.lineal)
    controlBorde = UnderlineInputBorder(
        borderSide: new BorderSide(
            color: Colores.obtener(control.colorBorde!=null? control.colorBorde:ParametrosSistema.colorBorde),
            //color: control.colorBorde??Colores.obtener(control.colorBorde),
            style: BorderStyle.solid));
  return controlBorde;
}

Widget mostrarContadorLetras(Control control) {
    return contadorLetrasTexto(control);
}

Widget contadorLetrasTexto( Control control ) {
  dynamic  valor= control.valor;
  Widget? texto ;
  if ( ( control.tipo== eTipoControl.cajaTexto || control.tipo== eTipoControl.cajaTexto ) &&  control.textoContador != null) 
  {
        if ( control.textoContador!.length < 3 ) 
           texto = Text(control.textoContador! + ' ${valor.length} ');
        else
           texto = Text( ' ${valor.length} ');   
  }

     
  else
     texto = Text('');  
  return texto;
}
