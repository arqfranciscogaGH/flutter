//  librerias internas de flutter
import 'package:flutter/material.dart';
import 'dart:convert';

//  librerias importadas flutter

import '../../../nucleo/servicios/ServiciosRest.dart';

//  librerias  proyecto

import '../../contexto/contexto.dart';

class FTConsultaControlador extends ChangeNotifier {
  bool actualizarControles = false;
  List<dynamic> _lista;
  dynamic _entidad;
  dynamic get entidad {
    return _entidad;
  }

  set entidad(dynamic entidad) {
    this._entidad= entidad;
    this.actualizarControles = true;
    notifyListeners();
  }
  List<dynamic> get lista {
    return this._lista;
  }

  set lista(List<dynamic> lista) {
    _lista = lista;
    notifyListeners();
  }
limpiar()
{ 
  this._lista=null;
  this._entidad=null;
}

  consultarEntidad(
       FTConsulta consulta, Function metodoActualizarLista) {
    if (this.lista == null || this.lista.length == 0 ) {
      this._lista = null;
        obtenerListaFTConsulta(consulta).then((listaRespuesta) {
        this.lista = listaRespuesta;
        // actualizarEntidad(ubicacion);
        print(listaRespuesta);
        // for (var i = 0; i < listaRespuesta.length; i++) {
        //    print(listaRespuesta[i]['Nombre"']);
        // }
        if (metodoActualizarLista != null)
          metodoActualizarLista(listaRespuesta);
      });
    }
    return this.lista;
  }


  Future<List<dynamic>> obtenerListaFTConsulta(
      FTConsulta consulta) async {
    String url = "";
    List<dynamic> listaMap;
    if (consulta != null) {
      url = "http://kungio.mx/api/FTConsulta/"
         + consulta.claveFlujo
         + "/" 
         + consulta.variables 
         + "/" 
         + consulta.idIdioma.toString() 
         + "/" 
         + consulta.consulta
         + "/" 
         + consulta.llaveFlujo;  
      url = "http://kungio.mx/api/FTConsulta/LINEAIV/''/1/ConsultarMisPendientes/prueba"  ; 
      dynamic respuesta = await ServicioRest.get(url);
      if (respuesta.statusCode == 200) // cuando  se presenta error el codigo 400,404 409
        listaMap = json.decode(respuesta.body);
      //listaMap = json.decode(respuesta.body).cast<Map<String, dynamic>>();

    }
    return listaMap;
  }

   dynamic obtenerEntidadDeLista(BuildContext context, ElementoLista elemento,
      Function metodorRespuestaObtener) {
    dynamic entidad ;
    int id = elemento.id;
    List<dynamic> lista = this.lista;
    if (lista != null) entidad = lista.where((s) => s['IdInstancia'] == id).first;
    this.entidad = entidad;
    if (metodorRespuestaObtener != null)
      metodorRespuestaObtener(context, elemento, entidad);
    return entidad;
  }

}