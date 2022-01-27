//  librerias internas de flutter

import 'package:flutter/material.dart';

//  librerias importadas flutter

//  librerias  proyecto

import '../../comun/comun.dart';
import '../../../../nucleo/negocio/modelo/ModeloBase.dart';

Decoration crearDecoracionContenedor(BuildContext context, [Control control]) {
  if (control.borde == null || control.borde == eTipoBorde.Ninguno)
    return BoxDecoration(
        border: Border.all(
      width: 0,
      style: BorderStyle.none,
    ));
  else if (control.borde == eTipoBorde.Circular)
    return BoxDecoration(
      border: Border.all(
        color: Theme.of(context).disabledColor,
      ),
      borderRadius: BorderRadius.circular(20),
    );
  else if (control.borde == eTipoBorde.Rectangular)
    return BoxDecoration(
      border: Border.all(/* color:Colores.obtenerColor(control.colorBorde)  */),
    );
  else if (control.borde == eTipoBorde.Lineal)
    return BoxDecoration(
        border: Border(
            bottom: BorderSide(
                /* color:Colores.obtenerColor(control.colorBorde) */)));
}

InputDecoration crearDecoracionInput([Control control]) {
  return InputDecoration(
    border: control.borde == null || control.borde == eTipoBorde.Ninguno
        ? InputBorder.none
        : crearBordeInput(control),
    counter: mostrarContadorLetras(control),
    hintText: control.marcaAguaTexto != null ? control.marcaAguaTexto : null,
    labelText: control.textoEtiqueta != null ? control.textoEtiqueta : null,
    helperText: control.textoAyuda != null ? control.textoAyuda : null,
    suffixIcon: control.iconoInterno != null
        ? Iconos.crear(control.iconoInterno)
        : null,
    icon: control.icono != null ? Iconos.crear(control.icono) : null,
  );
}

InputBorder crearBordeInput(Control control) {
  // no cambia el  color ,solo aplica el color del tema
  InputBorder controlBorde;

  if (control.borde == eTipoBorde.Circular)
    controlBorde =
        OutlineInputBorder(borderRadius: BorderRadius.circular(20.0));
  else if (control.borde == eTipoBorde.Rectangular)
    controlBorde = OutlineInputBorder();
  else if (control.borde == eTipoBorde.Lineal)
    controlBorde = UnderlineInputBorder(
        borderSide: new BorderSide(
            color: Colors.green,
            //color: control.colorBorde??Colores.obtener(control.colorBorde),
            style: BorderStyle.solid));
  return controlBorde;
}

Widget mostrarContadorLetras(Control control) {
  if (control.textoContador != null && control.textoContador != "")
    return contadorLetrasTexto(control.valor, control.textoContador);
}

Widget contadorLetrasTexto(dynamic valor, String textoContador) {
  if (textoContador == null) textoContador = "";
  Widget control = Text(textoContador + ' ${valor.length} ');
  return control;
}
