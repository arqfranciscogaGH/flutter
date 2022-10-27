//  librerias internas de flutter

import 'dart:convert';

//  librerias importadas flutter

//  librerias  proyecto
import '../../negocio/modelo/endidad/EntidadBase.dart';
import 'IAccesoBD.dart';
import 'ConfiguracionAccesoBD.dart';
import 'AdministradorAcceso.dart';

// import '../.././negocio/modelo/endidad/EntidadRegistroTexto.dart';
// import '../.././negocio/modelo/endidad/EntidadRegistroTexto.dart';

//   enumerados
enum eTipoEntidad {
  nunguno,
  json,
  entidad,
}

class AccesoTabla<T extends EntidadBase> {

  // variables

  ConfiguracionAccesoBD? configuracion;


  T claseEntidad;

  List<T> _lista = [];

  int? registros = 0;
  String parametros = "";
  IAccesoBD? _abd;

  // Map<String, dynamic>? _registro ={};
  // List<dynamic>? _tabla= [];

  /*   ControlLista<T> elementos; */

  //  Cosntructor
  AccesoTabla({ required this.claseEntidad,  this.configuracion}) {

      _abd = AdministradorAcceso.obtener(this.configuracion!);
       entidad=claseEntidad;
      if (configuracion!.persitenciaPorDefecto != true) _abd!.iniciar();
  }

  //  propiedades


//  obtener lista tabla  map texto, se obtiene  resultado  de api o db
  EntidadTablaTexto get tabla {
    return  _abd!.tabla;
  }

 //  asignar  lista tabla  map de texto, se obtiene  resultado  de api o db
  set tabla(  EntidadTablaTexto tabla) {
    _abd!.tabla = tabla;
    if  (tabla.datos!=null  )
       _lista= mapTolista(tabla.datos) ;
  }

  //  obtener  map de entidad registro texto
   EntidadRegistroTexto get registro {
       return _abd!.registro;
   }
  
  //  asignar map a entidad  registro texto
  set registro (EntidadRegistroTexto  r) {
      _abd!.registro=r;
       claseEntidad.fromMap(registro.datos);
  }
  
  
   //  obtener entidad 

   T get entidad {
      return claseEntidad;
  }
  
  //  asignar entidad 
  set entidad (T  entidad) {
     claseEntidad=entidad;
     _abd!.registro.datos=entidad.toMap();
  }

//  obtener lista  map texto, se obtiene  resultado  de api o db
  List<T> get lista {
    List<T> listaT=[];
    if  (tabla.datos!=null  )
       _lista= mapTolista(tabla.datos) ;
     return _lista;
  }

 //  asignar  lista  map de texto, se obtiene  resultado  de api o db
  set lista(   List<dynamic> lista) {
      _lista= lista as   List<T>;
      tabla.datos= lista.map((c) => c.toMap()).toList();
  }

 //  metodos conversion  lista de MAp  a   lista  de entidades 

 List<T> mapTolista(List<dynamic> listaMapa) {
  List<T> listaT = listaMapa.isNotEmpty
        ? listaMapa.map((c) => claseEntidad.iniciar().fromMap(c)).toList() as List<T>
        : [] ;
    return listaT;
  }

 //  metodos conversion  lista  de entidades  a  lista  MAP  
  List<dynamic> listaToMap() {
    return lista.map((c) => c.toMap()).toList();
  }

 //  metodos conversion  lista  de entidades  a  cadena json 

 String listaToJson() {
    return json.encode(this.listaToMap());
 }

 // metodos conversion cadena Json a   lista  de entidades 

 List<dynamic> jsonToLista(String cadenaJson) {
    List<dynamic> listaMap = json.decode(cadenaJson);
    List<dynamic> listaT = mapTolista(listaMap);
    return listaT;
 }

 //  metodos  ABC  tablas  
  Future ejecutar(String sql) async {
    final baseDatos = await _abd!.ejecutar(sql);
  }

  Future<List<dynamic>> consultarTabla(T e) async {
    List<dynamic> listaMapa = [];
   _abd!.configuracion = this.configuracion!;
    listaMapa = await _abd!.consultarTabla(e.nombreTabla!);
    List<dynamic> listaT = [];
    listaT = listaMapa != null && listaMapa.isNotEmpty
        ? listaMapa.map((c) => e.fromMap(c)).toList()
        : [];
    lista=listaT as List<T>;
    return listaT;
  }


  Future<List<dynamic>> consultar(T e) async {
    List<dynamic> listaMapa = [];
   _abd!.configuracion = this.configuracion!;
    listaMapa = await _abd!.consultar(e.nombreTabla!, e.toMap(), e.campoLLave!, e.id!);
    List<dynamic> listaT = [];
    listaT = listaMapa != null && listaMapa.isNotEmpty
        ? listaMapa.map((c) => e.fromMap(c)).toList()
        : [];
    lista=listaT as List<T>;
    return listaT;
  }

  Future<T> obtener(T e) async {
    _abd!.configuracion = this.configuracion!;
    dynamic res = await _abd!.obtener(e.nombreTabla! , e.toMap(), e.campoLLave!, e.id!);
    if ( res != null )
       entidad=e.fromMap(res) as T ;
    return entidad;
  }

  Future<dynamic> insertar(T e, [bool mapa = true]) async {
    if (configuracion!.contadorRegistros == true) {
      registros = tabla.datos == null || tabla.datos.length == 0 ? 0 : lista.last.id??0;
      e.id = registros! + 1;
    }
    dynamic res = await _abd!.insertar(e.nombreTabla! , e.toMap());
    if ( res != null )
       entidad=e.fromMap(res) as T ;
      return entidad;
  }

  Future<T> actualizar(T e) async {
    dynamic res = await _abd!.actualizar(e.nombreTabla! , e.toMap(), e.campoLLave!, e.id!);
    if ( res != null )
       entidad=e.fromMap(res) as T ;
    return entidad;
  }

  Future<dynamic> eliminar(T e) async {
    dynamic res = await _abd!.eliminar(e.nombreTabla! , e.toMap(), e.campoLLave!, e.id!);
    if ( res != null )
       entidad=e.fromMap(res) as T ;
    return entidad;
  }

  /*  Future<List<dynamic>> obtenerListaCentral(T aEntidad) async {
      List<dynamic> lista;
      String url=generarUrl(aEntidad,"CL" );
      dynamic respuesta =await ServicioRest.get(url );
      if (respuesta.statusCode==200) 
          lista=jsonToList(respuesta.body);
      return  lista;
  } */

  // Future<T> insertarCentral(T aEntidad) async {
  //   String url = generarUrl(aEntidad, "I");
  //   print(aEntidad.toJson());
  //   dynamic respuesta = await ServicioRest.post(url, aEntidad.toJson());
  //   print(respuesta.statusCode);
  //   //    entidad=entidad.fromJson(respuesta.body);
  //   if (respuesta.statusCode != 201) //404 409
  //     aEntidad = aEntidad.fromJson(respuesta.body);
  //   else
  //     return null;

  //   return aEntidad;
  // }
/*   Future<T> obtenerCentral(T aEntidad) async {
        String url=generarUrl(aEntidad,"O");
        dynamic respuesta =await ServicioRest.get(url );
        if (respuesta.statusCode==200) 
           aEntidad.fromJson(respuesta.body);
        return  aEntidad;
  } */

 

  // Future<T> actualizarCentral(T aEntidad) async {
  //   String url = generarUrl(aEntidad, "A");
  //   dynamic respuesta = await ServicioRest.put(url, aEntidad.toJson());
  //   return aEntidad;
  // }

 
  // Future<T> eliminarCentral(T aEntidad) async {
  //   String url = generarUrl(aEntidad, "E");
  //   dynamic respuesta = await ServicioRest.delete(url, aEntidad.toJson());
  //   return aEntidad;
  // }

  // bool sincronizar(T entidad, String accion) {
  //   bool sincronizacion = false;
  //   if (configuracion.sincronizarServidor) {
  //     String url = generarUrl(entidad, accion);
  //     if (accion == "I") {
  //       ServicioRest.post(url, entidad.toJson()).then((respuesta) {
  //         print(respuesta.body);
  //         Map<String, dynamic> mapa = entidad.fromJsonToMap(respuesta.body);
  //         print(mapa);
  //         _actualizar(entidad);
  //       });
  //     } else if (accion == "U") {
  //       ServicioRest.put(url, entidad.toJson()).then((respuesta) {
  //         print(respuesta.body);
  //         Map<String, dynamic> mapa = entidad.fromJsonToMap(respuesta.body);
  //         print(mapa);
  //         _actualizar(entidad);
  //       });
  //     } else if (accion == "D") {
  //       ServicioRest.delete(url, entidad.toJson()).then((respuesta) {
  //         print(respuesta.body);
  //         Map<String, dynamic> mapa = entidad.fromJsonToMap(respuesta.body);
  //         print(mapa);
  //         _actualizar(entidad);
  //       });
  //     }
  //   }
  //   return sincronizacion;
  // }



 
}
