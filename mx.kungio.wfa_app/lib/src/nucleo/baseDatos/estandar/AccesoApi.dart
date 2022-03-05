//  librerias internas de flutter

import 'dart:convert';

//  librerias importadas flutter

//  librerias  proyecto

import '../admin/IAccesoBD.dart';
import '../../servicios/ServiciosRest.dart';

class AccesoApi extends IAccesoBD {
  @override
  iniciar() async {}
  @override
  abrir() async {}
  @override
  Future<List<dynamic>> consultar(String nombreTabla) async {
    List<dynamic> listaMap;
    String url = generarUrl(nombreTabla, null);
    dynamic respuesta = await ServicioRest.get(url);
    if (respuesta.statusCode ==
        200) // cuando  se presenta error el codigo 400,404 409
      listaMap = json.decode(respuesta.body);
    //listaMap = json.decode(respuesta.body).cast<Map<String, dynamic>>();

    return listaMap;
  }

  @override
  Future<Map<String, dynamic>> obtener(String nombreTabla,
      Map<String, dynamic> map, String campo, int id) async {
    Map<String, dynamic> listaMap;
    String url = generarUrl(nombreTabla, id);
    dynamic respuesta = await ServicioRest.get(url);
    if (respuesta.statusCode ==
        200) // cuando  se presenta error el codigo 400,404 409
      listaMap = json.decode(respuesta.body);
    return listaMap;
  }

  @override
  Future<Map<String, dynamic>> insertar(
      String nombreTabla, Map<String, dynamic> map) async {
    Map<String, dynamic> listaMap;
    String url = generarUrl(nombreTabla, null);
    print(json.encode(map));
    dynamic respuesta = await ServicioRest.post(url, json.encode(map));
    print(respuesta.statusCode);
    if (respuesta.statusCode == 200 ||
        respuesta.statusCode ==
            201) // cuando  se presenta error es  el codigo 400,404 409
      listaMap = json.decode(respuesta.body);
    return listaMap;
  }

  @override
  Future<dynamic> actualizar(String nombreTabla, Map<String, dynamic> map,
      String campo, int id) async {
    String url = generarUrl(nombreTabla, id);
    print(json.encode(map));
    dynamic respuesta = await ServicioRest.put(url, json.encode(map));
    print(respuesta.statusCode);
    if (respuesta.statusCode !=
        204) // cuando  se presenta error el codigo 400,404 409
      map = null;
    return map;
  }

  @override
  Future<Map<String, dynamic>> eliminar(String nombreTabla,
      Map<String, dynamic> map, String campo, int id) async {
    Map<String, dynamic> listaMap;
    String url = generarUrl(nombreTabla, id);
    dynamic respuesta = await ServicioRest.delete(url, json.encode(map));
    print(respuesta.statusCode);
    if (respuesta.statusCode ==
        200) // cuando  se presenta error el codigo 400,404 409
      //listaMap = json.decode(respuesta.body);
      return map;
    else
      return null;
  }

  String generarUrl(String nombreTabla, int id) {
    String url="";
    if (configuracion.parmetros!=null  && configuracion.parmetros!="") 
    {
         url= configuracion.urlApi + "/" + configuracion.parmetros;
         if (configuracion.filtro != null && configuracion.filtro != "")
            url+= "/" + configuracion.filtro;   
    }
    else
    {
      url= configuracion.urlApi + "/" + nombreTabla.toLowerCase() ;
      if (id != null && id != 0)
            url+= "/" + id.toString();
      else
      { 
          if (configuracion.filtro != null && configuracion.filtro != '')
            url+= "/0/" + configuracion.filtro;
      }
        

    }
    if (configuracion.llaveApi!=null && configuracion.llaveApi!="")
      url+= "/" + configuracion.llaveApi+ "/";
    return url;
  }
}
